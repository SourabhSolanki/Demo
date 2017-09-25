class Reply < ApplicationRecord
	belongs_to :comment
	validates :body, presence: true
end
