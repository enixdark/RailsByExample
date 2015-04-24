class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.process_omniauth auth
  	# byebug

  	where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.username = auth.info.nickname
  		user.email = "test@gmail.com"
  	end
  end


  def password_required?
  	super && provider.blank?
  end



  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super
	end
  end
end
