class AddImageToDiets < ActiveRecord::Migration[6.1]
  def change
    add_column :diets, :image, :string
  end
end
