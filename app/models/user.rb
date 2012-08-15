class User < ActiveRecord::Base
	has_one :store
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable
  # Setup accessible (or protected) attributes for your model
attr_accessible :email, :password, :password_confirmation, :remember_me, :image, :image_facebook, :name,:line_1,:line_2,:line_3,:telephone,:mobile,:role
mount_uploader :image, ImageUploader
# attr_accessible :title, :body
	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"]
        user.email = data.email
      	user.name = data.name
      	user.image = data.image
      end
    end
  end

	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  	data = access_token.info
  	if user = self.find_by_email(data.email)
			user.update_attribute(:name, data.name)
			if data.image.present?    # update the user's image every time he logs in
      	user.update_attribute(:image_facebook, data.image)
    	end
  	  user
  	else # Create a user with a stub password. 
    	self.create(:email => data.email, :password => Devise.friendly_token[0,20], :name => data.name, :image_facebook => data.image, :role => "none") 
  	end
	end

end
