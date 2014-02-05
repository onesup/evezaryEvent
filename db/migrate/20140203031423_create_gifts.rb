class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :title
      t.string :code
      t.integer :total

      t.timestamps
    end
  end
end
