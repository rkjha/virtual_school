require 'digest'
class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	has_many :questions
	has_many :answers
	
	before_save :create_remember_token
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true, :length => {:maximum => 50}
	validates :email, :presence => true,
					  :format => {:with => email_regex},
					  :uniqueness => {:case_sensitive => false}

	validates :password, length: {minimum: 6}
	validates :password_confirmation, presence: true

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

end