class AddAddressToAccessLog < ActiveRecord::Migration
  def change
   add_column :access_logs, :address, :string
 end
end
