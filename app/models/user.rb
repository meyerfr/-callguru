class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  belongs_to :company
  has_many :teams
  has_many :projects, through: :teams
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :session_limitable, :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, invite_for: 3.days

  def user?
    signed_in_as == 'user'
  end

  def admin?
    signed_in_as == 'admin'
  end

  def superadmin?
    signed_in_as == 'superadmin'
  end
end
