class Article < ApplicationRecord
  enum status: { request_not_send: 0,request_send: 1 ,request_approved: 2 ,request_denied:3}
  belongs_to :user 
  has_many :comments ,dependent: :destroy
  validates :title, presence: true
  validates :text, presence: true
 
                 
end
