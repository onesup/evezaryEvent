class CreateAccessLogs < ActiveRecord::Migration
  def change
    create_table :access_logs do |t|
      t.string :location
      t.float :latitude
      t.float :longitude
      t.references :user, index: true
      t.references :message, index: true
      t.string :device
      t.string :ip

      t.timestamps
    end
  end
end
