class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :username,:presence => true,
            :uniqueness => {:case_sensitive => false}, 
            length: {maximum: 255}

  validates_format_of :username, with: /\A[a-zA-Z0-9]*\z/

  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions.to_hash).first
    end
  end

  after_create :assign_default_role

  def assign_default_role
    add_role(:user)
  end
end
