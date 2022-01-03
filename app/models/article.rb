class Article < ApplicationRecord
	validates :title, presence: true, length:{minimum: 3, maximum: 80}
	validates :description, presence: true, length:{minimum: 5, maximum:1000}
end
