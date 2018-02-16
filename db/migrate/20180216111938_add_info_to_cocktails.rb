class AddInfoToCocktails < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :info, :string
  end
end
