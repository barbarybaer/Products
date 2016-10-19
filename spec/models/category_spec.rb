require 'rails_helper'
RSpec.describe Category, :type => :model do 
	it "requires a name" do
		category = Category.new(name: "")
		category.valid?

		expect(category.errors[:name].any?).to eq(true)

	end
	describe "relationships" do
		it "has many products" do
			category = Category.create(name: "Category1")
			product1 = category.products.create(name: "Product1", description: "Product1 desc", pricing: 2.00)
			product2 = category.products.create(name: "Product2", description: "Product2 desc", pricing: 3.00)
			expect(category.products).to include(product1)
			expect(category.products).to include(product2)
		end
	end
	
end