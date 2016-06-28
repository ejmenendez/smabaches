class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
          :omniauthable, :omniauth_providers => [:facebook]

  #para la gema commontator
  acts_as_commontator

  has_one :profile, :dependent => :destroy
  accepts_nested_attributes_for :profile
  after_create :create_profile

  def create_profile
    perfil = Profile.create(user: self)
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    #perfil.first_name = auth.info.first_name
    #perfil.last_name =  auth.info.last_name  # assuming the user model has a name
    #perfil.photo = auth.info.image # assuming the user model has an image
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
