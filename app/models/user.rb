class User < ApplicationRecord
  validates :name, presence: true, length:{maximum: 15}

  VALID_EMAIL_REGEX=/[a-z0-9]+@[a-z0-9]+\.[a-z0-9]+/
  validates :email, presence: true,uniqueness: true, format:{with: VALID_EMAIL_REGEX}

  VALID_PASSWORD_REGEX=/(?=.*[a-z])(?=.*\d){4,32}/
  validates :password, format:{with: VALID_PASSWORD_REGEX}

  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end