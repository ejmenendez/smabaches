class RegistrationsController < Devise::RegistrationsController

  private

  def account_update_params
    params
     .require(:user)
     .permit(:email, :password, :password_confirmation,
       :current_password,
       profile_attributes: [
         :id,
         :first_name,
         :last_name,
         :photo
     ])
  end
end
