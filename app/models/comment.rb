class Comment < ApplicationRecord
  belongs_to :article
  validates :body, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => "/system/avatars/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif","application/pdf", "application/xlsx"], :message => ", Only PDF And Image files are allowed. "
	
end
