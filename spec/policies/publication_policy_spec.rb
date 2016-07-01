require "rails_helper"
require "pundit/rspec"

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
    it "is denied to non-logged users" do
      expect(subject).not_to permit(nil, Publication)
    end

    it "is allowed to any logged in user" do
      expect(subject).to permit(user, Publication)
    end
  end

  permissions :destroy? do
    it "is denied to non-logged users" do
      expect(subject).not_to permit(nil, publication)
    end

    it "is denied if the user is not the author" do
      expect(subject).not_to permit(user, publication)
    end

    it "is allowed if the user is the publication author" do
      expect(subject).to permit(author, publication)
    end

    it "is allowed if the user is an admin" do
      expect(subject).to permit(admin, publication)
    end
  end

  permissions :edit? do
    it "is denied to non-logged users" do
      expect(subject).not_to permit(nil, publication)
    end

    it "is denied if the user is not the author" do
      expect(subject).not_to permit(user, publication)
    end

    it "is allowed if the user is the publication author" do
      expect(subject).to permit(author, publication)
    end

    it "is allowed if the user is an admin" do
      expect(subject).to permit(admin, publication)
    end
  end

end
