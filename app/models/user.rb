class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15}
  
  VALID_EMAIL_REGEX = /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX}
  
  #validates :password, length: { in: 8..32 }
  
  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, format: { with: VALID_PASS_REGEX }
  validates :password_confirmation, format: { with: VALID_PASS_REGEX }
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
  has_many :comments

end
