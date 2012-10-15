class User < ActiveRecord::Base
  has_many :reservations, dependent: :destroy

  # Include devise modules:
  devise :token_authenticatable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token, :telephone, :name
end
