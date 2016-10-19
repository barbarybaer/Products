require 'rails_helper'

RSpec.describe "new comment" do 
	it "displays correct fields to create new comment" do
		category = Category.create(name:"Category")
		product = Product.create(name: "Product1", description: "Product1 description", pricing: 100.00)

		visit "/products#{product.id}"
		click_link "New Comment"
		expect(page).to have_field("Comment")
		
	end
end
