class User < ApplicationRecord
  extend Enumerize

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :gender, in: %i[male female other]

  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, presence: true

  scope :active, -> { where(active: true) }

  def admin?
    has_role?(:admin)
  end

  def registered?
    has_role?(:registered, :any)
  end
end
