class CreateIsaleCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :isale_customers do |t|
      t.string :name
      t.string :credential

      t.timestamps
    end
  end
end
