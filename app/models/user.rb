class User < ActiveRecord::Base
  
  before_create :set_token
  
  has_many :images
	
	private
		def set_token
			return if token.present?
			self.token = generate_token
		end
	
		def generate_token
			loop do
				token = SecureRandom.hex
				break token unless self.class.exists?(token: token)
			end
		end
end
