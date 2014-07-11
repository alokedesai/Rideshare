class User < ActiveRecord::Base
	has_and_belongs_to_many :rides

	def self.from_omniauth(auth)
	 	where(auth.slice(:provider, :facebook_id)).first_or_initialize.tap do |user|
				user.provider = auth.provider
	      user.facebook_id = auth.uid
	      user.fbimage = auth.info.image
	      user.name = auth.info.name
	      user.oauth_token = auth.credentials.token
	      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	      user.save!
		end
	end
end
