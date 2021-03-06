class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_many :articles
  has_secure_password
  validates :password, length: { minimum: 6 }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns a random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    #update_attribute(name, value)
    #Updates a single attribute and saves the record. This is especially useful for boolean flags on existing records. Also note that
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end

# When included in a model as above, this one method adds the following functionality:
# The ability to save a securely hashed password_digest attribute to the database
# A pair of virtual attributes18 (password and password_confirmation),
# including presence validations upon object creation and a validation requiring that they match
# An authenticate method that returns the user when the password is correct (and false otherwise)
