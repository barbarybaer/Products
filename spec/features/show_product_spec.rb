require 'rails_helper'

RSpec.describe 'product page' do
	it "displays all the information about the product" do
		category = Category.create(name:"Category")
		product = Product.create(name: "Product1", description: "Product1 description", pricing: 1.95, category:category)
		visit "/products"
		click_link "Show"
		expect(current_path).to eq("/products/#{product.id}")
		expect(page).to have_text("Product1")
		expect(page).to have_text("Product1 description")
		expect(page).to have_text("1.95")
		expect(page).to have_text("Category")

	end
end