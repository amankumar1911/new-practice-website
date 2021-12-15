class User < ApplicationRecord
	validates :name, presence: true, length:{minimum: 3, maximum: 100}
	validates :email, presence: true
	validates :address, presence: true, length:{minimum: 3, maximum:100}
end