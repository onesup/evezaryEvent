class AddCachecountInStores < ActiveRecord::Migration
  def change
    add_column :stores, :messages_count, :integer, default: 0
    Store.reset_column_information
    Store.find_each do |store|
      Store.reset_counters store.id, :messages
    end
  end
end
