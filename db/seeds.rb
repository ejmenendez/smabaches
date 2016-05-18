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

Publication.create!(title: 'Primer Publicacion',description: 'Bache molesto', author: rodriUser);
Publication.create!(title: 'Segunda Publiacion',description: 'Bache molesto', author: estebanUser);
Publication.create!(title: 'Tercera Publicacion',description: 'Bache molesto',author: estebanUser);
