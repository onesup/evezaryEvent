class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string  :title
      t.string  :phone
      t.string  :address
      t.string  :si
      t.string  :gu
      t.string  :dong
      t.float   :latitude
      t.float   :longitude
      t.integer :total

      t.timestamps
    end
  end
end
