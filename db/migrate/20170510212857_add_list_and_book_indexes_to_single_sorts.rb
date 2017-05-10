class AddListAndBookIndexesToSingleSorts < ActiveRecord::Migration[5.0]
  def change
    add_index :single_sorts, :list_id
    add_index :single_sorts, :book_id
  end
end
