class User < ActiveRecord::Base
  attr_accessible :mobile_number, :email, :username, :name, :password, :password_confirmation

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :name
  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create
  validates_uniqueness_of :email

  def self.authenticate(mobile_number, password)
    user = find_by_email (mobile_number);
    if user.blank?
      user = find_by_mobile_number(mobile_number)
    end
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end

  def encrypt_password
    if password.present?
      # NEVER store passwords in plain text. (remember LinkedIn! - http://money.cnn.com/2012/06/06/technology/linkedin-password-hack/index.htm)
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
