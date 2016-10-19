require 'rails_helper'

RSpec.describe 'editing product' do
	it "should display the form with all the populated values" do
		category = Category.create(name:"Category")
		product = Product.create(name: "Product1", description: "Product1 description", pricing: 100.00, category:category)
		visit "/products"
		click_link "Edit"
		expect(current_path).to eq("/products/#{product.id}/edit/")
		expect(find_field("Name").value).to eq(product.name)
		expect(find_field("Description").value).to eq(product.description)
		expect(find_field("Price").value).to eq("#{product.pricing}")
		expect(find_field("Category").value).to eq("#{category.id}")
	end
end