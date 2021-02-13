class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles, dependent: :destroy
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25}
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    length: { maximum: 104 }
  has_secure_password
end
