require "rails_helper"

RSpec.describe Publication, :type => :model do

  let(:author) {User.new(email: "author @example.com", password: "12345678", password_confirmation: "12345678",confirmed_at: Time.now)}

  describe "Validations" do

    it "is not valid if title is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end

    it "is not valid if the title's length is less than 5 characters" do
      expect(Publication.new(
           title: "Test",
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end

    it "is valid if the title's length is 5 characters or more" do
      expect(Publication.new(
           title: "Tests",
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).to be_valid
      expect(Publication.new(
           title: "Tests #2",
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).to be_valid
    end
    it "is not valid if description is absent" do
      expect(Publication.new(
           title: "Test",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if the description's length is less than 10 characters" do
      expect(Publication.new(
           title: "Tests",
           description: "TestBache",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end

    it "is valid if the description's length is 10 characters or more" do
      expect(Publication.new(
           title: "Tests",
           description: "Bache Tests",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).to be_valid
      expect(Publication.new(
           title: "Tests",
           description: "Bache tests 2",
           author: author,
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).to be_valid
    end

    it "is not valid if author is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           title: "Test",
           category: Category.new(name:'bachecito'),
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if category is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           title: "test",
           latitude: ("-40.13556268").to_f ,
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if latitude is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           title: "test",
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if longitude is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           title: "test",
           latitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if photo is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           title: "test",
           longitude:("-71.29446565639999").to_f,
           latitude: ("-40.13556268").to_f ,
           street: 'calle test',
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if street is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           title: "test",
           longitude:("-71.29446565639999").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           latitude: ("-40.13556268").to_f,
           street_number: '100'
          )).not_to be_valid
    end
    it "is not valid if street_number is absent" do
      expect(Publication.new(
           description: "Bache molesto",
           author: author,
           category: Category.new(name:'bachecito'),
           title: "test",
           longitude:("-71.29446565639999").to_f,
           latitude: ("-40.13556268").to_f,
           photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
           street: 'calle test',
           )).not_to be_valid
    end
  end
end
