require 'securerandom'

class User
  include Mongoid::Document

  validates :api_token, presence:true, uniqueness:true
  validates :email, presence:true, uniqueness:true
  before_validation :generate_api_token
  
  field :name, type: String
  field :email, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :image, type: String
  field :api_token, type: String

  def generate_api_token
  	return if api_token.present?

  	loop do
  		self.api_token=SecureRandom.hex
  		break unless User.where(api_token: api_token).exists? 
  	end
  end
end