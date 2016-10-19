class AddCategoryReferenceToProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :category_id
  	remove_column :products, :integer
    add_reference :products, :category, index: true
  end
end
