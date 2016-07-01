require "rails_helper"

RSpec.describe PublicationPolicy, :type => :model do
  subject { PublicationPolicy }

  let(:user)   {User.new(email: "user@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:author) {User.new(email: "author@example.com", password: "12345678", password_confirmation: "12345678")}
  let(:admin) do
    user = User.new(email: "admin@example.com", password: "12345678", password_confirmation: "12345678")
    user.add_role :admin
    user
  end

  let(:publication) {Publication.new(
       title: "Bache numero 1",
       description: "Bache molesto",
       author: author,
       category: Category.new(name:'bachecito'),
       latitude: ("-40.13556268").to_f ,
       longitude:("-71.29446565639999").to_f,
       photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg'))
      )}

  permissions :new? do
    
    it "no se puede crear publicación sin usuario ingresado" do
      expect(subject).not_to permit(nil, Publication)
    end

    it "cualquier usuario ingresado puede crear publicación" do
      expect(subject).to permit(user, Publication)
    end
    
  end

  permissions :destroy? do
    
    it "no se puede borrar publicación sin usuario logueado" do
      expect(subject).not_to permit(nil, publication)
    end

    it "no puede borrar la publicación un usuario que no es el autor" do
      expect(subject).not_to permit(user, publication)
    end

    it "el autor puede borrar su publicación" do
      expect(subject).to permit(author, publication)
    end

    it "un administrador puede borrar cualquier publicación" do
      expect(subject).to permit(admin, publication)
    end
    
  end

  permissions :edit?, :update? do
    
    it "no se puede editar publicación sin usuario ingresado" do
      expect(subject).not_to permit(nil, publication)
    end

    it "no puede editar la publicación un usuario que no es el autor" do
      expect(subject).not_to permit(user, publication)
    end

    it "el autor puede editar su publicación" do
      expect(subject).to permit(author, publication)
    end

    it "un administrador puede editar cualquier publicación" do
      expect(subject).to permit(admin, publication)
    end
    
  end

end
