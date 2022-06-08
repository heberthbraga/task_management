class User < ApplicationRecord
  extend Enumerize

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :user_status
  has_many :activities, class_name: 'Activity', foreign_key: 'owner_id', dependent: :destroy
  has_and_belongs_to_many :tasks

  enumerize :gender, in: %i[male female other]
  
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true

  def admin?
    has_role?(:admin)
  end

  def registered?
    has_role?(:registered)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def role_type
    role_type = 'registered'
    role_type = 'admin' if self.admin?
    role_type
  end
end
