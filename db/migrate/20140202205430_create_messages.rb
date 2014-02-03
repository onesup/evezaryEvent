class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.datetime :sent_at
      t.string :dest_phone
      t.string :send_phone
      t.string :send_name
      t.string :subject
      t.text :msg_body
      t.string :image
      t.references :user, index: true
      t.references :store, index: true
      t.string :cmid
      t.text :result

      t.timestamps
    end
  end
end
