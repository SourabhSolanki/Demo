class User < ApplicationRecord

  enum role: { user: 0, admin: 1 }
  has_many :articles ,dependent: :destroy
  has_many :likes
  validates :name, presence: true,length: { minimum: 5 },format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :surname, presence: true,length: { minimum: 5 },format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :email, presence: true
  validates :mobile, presence: true,length: { minimum: 10 }
  validates :password, presence: true,length: { minimum: 4 }
  validates :password_confirmation, presence: true,length: { minimum: 5 }

end
