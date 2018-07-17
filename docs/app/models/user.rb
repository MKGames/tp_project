class User < ActiveRecord::Base
	before_save :email_downcase
	validates :username, presence: true
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
	validates :email, presence: true, length: { minimum: 7 }
	has_secure_password

	private

	def email_downcase
		self.email = email.downcase
	end
end
