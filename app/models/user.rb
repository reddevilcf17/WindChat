class User < ApplicationRecord
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: {case_insensitive: false}
	has_many :messages
	has_many :message_recipients

	def self.from_omniauth(auth)
		@user = self.find_by(email: auth.uid)
		unless @user	
		    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
		      user.provider = auth.provider
		      user.uid = auth.uid
		      user.name = auth.info.name
		      user.email = auth.uid
		      user.password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{auth.info.name}--")[0,6]
		      user.password_confirmation = user.password
		      user.oauth_token = auth.credentials.token
		      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
		      user.save!
		      @user = user
		    end
		end
		return @user

	  end

	def list_senders
		self.message_recipients
	end
end
