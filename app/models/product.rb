class Product < ActiveRecord::Base
	validates :name, :description, :pricing, presence: true
  	validates :name, :description, length: {minimum: 7}
  	validates :pricing, numericality: true
  	belongs_to :category
  	has_many :comments
end
