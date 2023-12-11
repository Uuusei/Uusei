class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|
      t.string :exercise
      t.string :menu
      t.datetime :start_time


      t.timestamps
    end
  end
end
