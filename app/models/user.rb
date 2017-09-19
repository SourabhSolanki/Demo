class User < ApplicationRecord

  enum role: { user: 0, admin: 1 }
  has_many :articles ,dependent: :destroy
  validates :name, presence: true,length: { minimum: 5 }
  validates :surname, presence: true,length: { minimum: 5 }
  validates :email, presence: true
  validates :mobile, presence: true,length: { minimum: 10 }
  validates :password, presence: true,length: { minimum: 4 }
  validates :password_confirmation, presence: true,length: { minimum: 5 }

end
