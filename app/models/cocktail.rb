class Cocktail < ApplicationRecord
	has_many :doses, dependent: :destroy
	has_many :ingredients, through: :doses
	has_many :reviews, dependent: :destroy
	has_one_attached :photo

	validates :name, presence: true, uniqueness: true
	validates :description, length: {minimum:5}
end
