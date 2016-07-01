rodriUser = User.new(
  :email                 => "rodri@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
rodriUser.save!
rodriUser.add_role :admin

estebanUser = User.new(
  :email                 => "esteban@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
estebanUser.save!
estebanUser.add_role :admin

user = User.new(
  :email                 => "usuario@example.com",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
estebanUser.save!

bache = Category.create!(name: 'Bache')
graffiti = Category.create!(name: 'Graffiti')


for i in 0..10
   publ = Publication.create!({
        title: "Bache numero #{i}",
        description: "Bache molesto",
        author: rodriUser,
        category: bache,
        latitude: ("-40.13#{i}6268").to_f ,
        longitude:("-71.29446#{i}39999").to_f,
        photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleBache.jpg')),
        street: '1',
        street_number: 100
       })
end
for i in 0..5
   publ = Publication.create!({
        title: "Graffiti numero #{i}",
        description: "Graffiti molesto",
        author: estebanUser,
        category: graffiti,
        latitude:  ("-40.1#{i}362682").to_f ,
        longitude: ("-71.29446349#{i}9999").to_f,
        photo: File.open(File.join(Rails.root, 'app', 'assets','images',  'exampleGraffiti.jpg')),
        street: '1',
        street_number: 100
       })
end
