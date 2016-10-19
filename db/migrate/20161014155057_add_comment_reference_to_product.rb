class AddCommentReferenceToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :comment, index: true
    add_foreign_key :products, :comments
  end
end
