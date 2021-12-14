class User < ApplicationRecord
	validates :name, presence: true, length:{minimum: 6, maximum: 100}
	validates :email, presence: true
end