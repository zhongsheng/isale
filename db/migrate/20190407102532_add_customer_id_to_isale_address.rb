class AddCustomerIdToIsaleAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :isale_addresses, :customer_id, :bigint
    add_foreign_key "isale_addresses", "isale_customers", column: "customer_id"
  end
end
