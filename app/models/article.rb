class Article < ApplicationRecord
  enum status: { request_not_send: 0,request_send: 1 ,request_approved: 2 ,request_denied:3}
  belongs_to :user 
  has_many :comments ,dependent: :destroy
  validates :title, presence: true,length: { minimum: 5 }, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :text, presence: true,length: { minimum: 5 }
 
                 
end
