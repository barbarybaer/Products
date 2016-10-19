require 'rails_helper'
RSpec.describe Comment, type: :model do
	it 'requires a comment' do
		comment = Comment.new(comment: "")
		comment.valid?

		expect(comment.errors[:comment].any?).to eq(true)
	end

	describe "relationships" do
		it "belongs to a product" do
			category = Category.create(name: "Category1")
			product = category.products.create(name: "Product1", description: "prod1 desc", pricing: 10.95)
			comment = product.comments.create(comment: "comment1")
			expect(comment.product).to eq(product)
		end
	end
end