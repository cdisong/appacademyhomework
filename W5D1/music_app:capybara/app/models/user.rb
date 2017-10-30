class User < ApplicationRecord
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  # before_action :ensure_session_token
  after_initialize :ensure_session_token

  attr_reader :password

  # def self.generate_session_token
  #   self.session_token = SecureRandom::urlsafe_base64
  #   self.save!
  #   self.session_token
  # end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    #self.password_digest ?? /// .create vs .new?
  end

  def is_password?(password)
    # pass_hash =
    BCrypt::Password.new(password_digest).is_password?(password) #returns boolean
  end

  def self.find_by_credentials(email, password)
    @user = User.find_by(email: email) #built in method that checks email key for email?
    return nil if @user.nil?
    is_password?(password) ? @user : nil
  end




end
