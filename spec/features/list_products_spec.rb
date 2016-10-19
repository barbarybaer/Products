require 'rails_helper'

RSpec.describe "listing products" do 
	it "displays list of products" do
		c = Category.create(name:"Footwear")
		c1 = Category.create(name:"Electronics")
		c.products.create(name:"Sandals", description: "For Walking", pricing: 10.95)
		c1.products.create(name:"Headphones", description: "for music", pricing: 100.95)
		# product = c.products.create(name:"Sandal", description: "Walking", pricing: 10.00)
		# product = c1.products.create(name:"Boots", description: "Not walking", pricing: 535.00)
		# fill_in "p_name", :with => product.name
		visit "/products"
		expect(page).to have_text("Sandals")
		expect(page).to have_text("10.95")
		expect(page).to have_text("Footwear")
		# expect(page).to have_text("Boots")
		# expect(page).to have_text("535")
		expect(page).to have_text("Headphones")
		expect(page).to have_text("100.95")
		expect(page).to have_text("Electronics")
	end
end	