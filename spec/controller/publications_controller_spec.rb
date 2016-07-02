require "rails_helper"

RSpec.describe PublicationsController, :type => :controller do

  let(:user) {
    User.create!(email: "author@example.com", password: "12345678", password_confirmation: "12345678",confirmed_at: Time.now)
  }
  let(:user2) {
    User.create!(email: "author2@example.com", password: "12345678", password_confirmation: "12345678",confirmed_at: Time.now)
  }

  let(:publication) {Publication.create!(
       title: "Bache numero 1",
       description: "Bache molesto",
       author: user,
       category: Category.new(name:'bachecito'),
       latitude: ("-40.13556268").to_f ,
       longitude:("-71.29446565639999").to_f,
       photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
       street: 'calle test',
       street_number: 100
      )}
  
  before(:each) do
    sign_in user
  end

  describe 'GET index' do

    it "estado OK llamada al índice" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "render del index" do
      get :index
      expect(response).to render_template("index")
    end

    it "render del show" do
      get :show, :id => publication.id.to_s
      expect(response).to render_template("show")
      expect(response).to have_http_status(:ok)
    end

    it "render del edit" do
      get :edit, :id => publication.id.to_s
      expect(response).to render_template("edit")
      expect(response).to have_http_status(:ok)
    end

    it "render del new" do
      get :new
      expect(response).to render_template("new")
      expect(response).to have_http_status(:ok)
    end

    it "la colección de publicaciones es igual a la creada" do
        p = [Publication.create!(
             title: "Bache numero 1",
             description: "Bache molesto",
             author: user,
             category: Category.new(name:'bachecito'),
             latitude: ("-40.13556268").to_f ,
             longitude:("-71.29446565639999").to_f,
             photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
             street: 'calle test',
             street_number: 100
            )]
        get :index
        expect(assigns(:publications)).to eq(p)
    end

    it "prueba de la colección de publicaciones de current_user" do
        p = [Publication.create!(
             title: "Bache numero 1",
             description: "Bache molesto",
             author: user,
             category: Category.new(name:'bachecito'),
             latitude: ("-40.13556268").to_f ,
             longitude:("-71.29446565639999").to_f,
             photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
             street: 'calle test',
             street_number: 100
            )]

        p2 = [Publication.create!(
                 title: "Bache numero 1",
                 description: "Bache molesto",
                 author: user2,
                 category: Category.new(name:'bachecito'),
                 latitude: ("-40.13556268").to_f ,
                 longitude:("-71.29446565639999").to_f,
                 photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
                 street: 'calle test',
                 street_number: 100
                )]

        get :index
          expect(assigns(:publications_current_user)).to eq(p)
    end


  end
end
