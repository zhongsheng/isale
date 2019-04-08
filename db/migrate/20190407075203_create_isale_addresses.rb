class CreateIsaleAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :isale_addresses do |t|
      t.string :name
      t.string :province
      t.string :city
      t.string :detail
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
