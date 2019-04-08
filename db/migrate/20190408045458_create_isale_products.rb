class CreateIsaleProducts < ActiveRecord::Migration[6.0]
  def change
    create_table "isale_categories", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "isale_contries", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "isale_imports", force: :cascade do |t|
      t.string "name"
      t.text "info"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "isale_product_tags", force: :cascade do |t|
      t.bigint "product_id"
      t.bigint "tag_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["product_id"], name: "index_product_tags_on_product_id"
      t.index ["tag_id"], name: "index_product_tags_on_tag_id"
    end

    create_table "isale_products", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.bigint "category_id"
      t.bigint "contry_id"
      t.float "market_price"
      t.float "wholesale_price"
      t.string "weight"
      t.string "specification"
      t.string "shelf_life"
      t.string "photo"
      t.bigint "supplier_id"
      t.boolean "hidden", default: false
      t.boolean "published", default: true
      t.index ["category_id"], name: "index_products_on_category_id"
      t.index ["contry_id"], name: "index_products_on_contry_id"
      t.index ["supplier_id"], name: "index_products_on_supplier_id"
    end

    create_table "isale_suppliers", force: :cascade do |t|
      t.string "company"
      t.string "name"
      t.string "address"
      t.string "phone"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

    create_table "isale_tags", force: :cascade do |t|
      t.string "name"
      t.bigint "category_id"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["category_id"], name: "index_tags_on_category_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end

    add_foreign_key "isale_product_tags", "isale_products", column: "product_id"
    add_foreign_key "isale_product_tags", "isale_tags", column: "tag_id"
    add_foreign_key "isale_products", "isale_categories", column: "category_id"
    add_foreign_key "isale_products", "isale_contries", column: "contry_id"
    add_foreign_key "isale_products", "isale_suppliers", column: "supplier_id"
    add_foreign_key "isale_tags", "isale_categories", column: "category_id"

  end
end
