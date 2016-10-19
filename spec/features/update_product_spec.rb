require 'rails_helper'

RSpec.describe 'updating product' do
	it "should update the product and redirect to the products page" do
		category = Category.create(name:"Category")
		category2 = Category.create(name:"Category2")
		product = Product.create(name: "Product1", description: "Product1 description", pricing: 100.95, category:category)

		visit "/products"
		click_link "Edit"
		fill_in "Name", with: "Product2"
		page.select "Category2", from: "Category"
		click_button "Update"
		expect(current_path).to eq("/products")
		expect(page).to have_text("Product2")
		expect(page).to have_text("Category2")
	end
end
