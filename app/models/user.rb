class User < ApplicationRecord

  enum role: { user: 0, admin: 1 }
  has_many :articles ,dependent: :destroy
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true
  validates :mobile, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

end
