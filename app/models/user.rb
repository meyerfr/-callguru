class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable, invite_for: 3.days

  def admin?
    role == 'admin'
  end

  def superadmin?
    role == 'superadmin'
  end
end
