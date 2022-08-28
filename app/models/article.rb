class Article < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, length:{minimum: 3, maximum: 80}
	validates :description, presence: true, length:{minimum: 5, maximum:1000}
	has_one_attached :blog_image
end
