require 'rails_helper'

RSpec.describe "delete a comment for a product" do 
	it " deletes comment and redirect to product show page" do
		category = Category.create(name:"Category")
		product = Product.create(name: "Product1", description: "Product1 description", pricing: 100.00, category:category)
		comment = product.comments.create(comment: "comment1")

		visit "/products/#{product.id}"
		expect(page).to have_text("comment1")
		click_link "Destroy"
		expect(current_path).to eq("/products/#{product.id}")
		expect(page).to_not_have_text("Comment 1")
	end
end