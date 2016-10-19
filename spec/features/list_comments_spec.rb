require 'rails_helper'

RSpec.describe "listing comment" do 
	it "displays list of comments" do
		visit '/comments'
		category1 = Category.create(name: "Category1")
		product1 = category1.products.create(name: "Product1", description: "prod1 desc", pricing: 10.95)
		comment1 = product1.comments.create(comment: "Comment for product1")

		category2 = Category.create(name: "Category2")
		product2 = category2.products.create(name: "Product2", description: "prod2 desc", pricing: 110.95)
		comment2 = product2.comments.create(comment: "Comment for product2")

		expect(page).to have_text(comment1.comment)
		expect(page).to have_text(comment2.comment)
		expect(page).to have_text(product1.name)
		expect(page).to have_text(product2.name)
	end

	it "lists comments related to a particular product in the product show page" do
		category = Category.create(name: "Category1")
		product = category.products.create(name: "Product1", description: "prod1 desc", pricing: 10.95)
		comment1= product.comments.create(comment: "best product")
		comment2= product.comments.create(comment: "another comment")
		visit "/products/#{product.id}"

		expect(page).to have_text(comment1.comment)
		expect(page).to have_text(comment2.comment)
		expect(page).to have_text(product.name)
	end
end