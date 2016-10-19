require 'rails_helper'
RSpec.describe Product, type: :model do
	it 'requires a name' do
		product = Product.new(name: '')
		product.valid?  #ask if it's valid in order to access errors
		expect(product.errors[:name].any?).to eq(true)
	end

	it 'requires a pricing' do
		product = Product.new(pricing: '')
		product.valid?
		expect(product.errors[:pricing].any?).to eq(true)
	end

	it 'requires a description to be at least 7 characters' do
		product = Product.new(description: '')
		product.valid?
		expect(product.errors[:description].any?).to eq(true)
	end

	describe "relationships" do
		it 'belongs to a category' do
			category = Category.create(name: "Category1")
			product = category.products.create(name:"Product1", description: "product1 description", pricing: 10.00)
			expect(product.category).to eq(category)
		end

		it "has many comments" do
			category = Category.create(name: "Category1")
			product = category.products.create(name:"Product1", description: "product1 description", pricing: 10.00)
			comment1 = product.comments.create(comment: "Comment1")
			comment2 = product.comments.create(comment: "Comment2")

			expect(product.comments).to include(comment1)
			expect(product.comments).to include(comment2)
		end
	end
end