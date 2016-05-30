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

Publication.create!(title: 'Primera Publicacion',description: 'Bache molesto', author: rodriUser, latitude: -40.1362682 , longitude: -71.29446349999999);
Publication.create!(title: 'Segunda Publiacion',description: 'Bache molesto', author: estebanUser, latitude: -40.14 , longitude: -71.295);
Publication.create!(title: 'Tercera Publicacion',description: 'Bache molesto',author: estebanUser, latitude: -40.15 , longitude: -71.296);
