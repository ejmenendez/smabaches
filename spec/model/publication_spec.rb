require "rails_helper"

RSpec.describe Publication, :type => :model do

  let(:author) {User.new(email: "author @example.com", password: "12345678", password_confirmation: "12345678",confirmed_at: Time.now)}

  describe "Validaciones" do

    it "no es válido si el título está ausente" do
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

    it "el título no es válido si tiene menos de 5 caracteres" do
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

    it "es válido si el título tiene 5 o más caracteres" do
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
    
    it "no es válido si la descripción está ausente" do
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
    
    it "no es válido si la descripción tiene menos de 10 caracteres" do
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

    it "es válido si la descripción tiene 10 o más caracteres" do
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

    it "no es válido si no tiene autor asignado" do
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
    
    it "no es válido si no tiene categoría asignada" do
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
    
    it "no es válido si no tiene latitud asignada" do
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
    
    it "no es válido si no tiene longitud asignada" do
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
    
    it "no es válido si no tiene foto adjunta" do
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
    
    it "no es válido si no tiene calle asignada" do
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
    
    it "no es válido si no tiene altura asignada" do
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
