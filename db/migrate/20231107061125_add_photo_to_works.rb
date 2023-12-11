class AddPhotoToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :photo, :string
  end
end
