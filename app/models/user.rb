class User < ActiveRecord::Base
  has_many :posts
  has_many :votes
  has_many :comments
  has_many :authentications
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  include Gravtastic
  gravtastic

  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
  
  def apply_omniauth(omniauth)
      self.email = omniauth['user_info']['email'] if email.blank?
      authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def provider_name
    if provider == 'open_id'
          "OpenID"
            else
                  provider.titleize
end
end
end
end
