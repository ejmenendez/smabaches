class NewUser < ActiveRecord::Migration
  def change
	
	estebanUser = User.new(
		:email	=> 'esteban@example.com',
		:password	=> '12345678',
		:password_confirmation	=> '12345678'
	)
	estebanUser.save!
	estebanUser.add_role :admin
	
	rodrigoUser = User.new(
		:email	=> 'rodrigo@example.com',
		:password	=> '12345678',
		:password_confirmation	=> '12345678'
	)
	rodrigoUser.save!
	rodrigoUser.add_role :admin
	
	eugenioUser = User.new(
		:email	=> 'eugenio@example.com',
		:password	=> '12345678',
		:password_confirmation	=> '12345678'
	)
	eugenioUser.save!
	
  end
end
