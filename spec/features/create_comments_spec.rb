RSpec.describe "creating a comment for a product" do 
	it " creates a new comment and redirect to product show page" do
		category = Category.create(name:"Category")
		product = Product.create(name: "Product1", description: "Product1 description", pricing: 100.00, category:category)

		visit "/products/#{product.id}"
		fill_in "Comment", with: "Comment 1"
		click_button "Submit"
		expect(current_path).to eq("/products/#{product.id}")
		expect(page).to have_text("Comment 1")
	end
end