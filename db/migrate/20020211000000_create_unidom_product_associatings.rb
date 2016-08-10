class CreateUnidomProductAssociatings < ActiveRecord::Migration

  def change

    create_table :unidom_product_associatings, id: :uuid do |t|

      t.references :source, type: :uuid, null: false, default: nil
      t.references :target, type: :uuid, null: false, default: nil

      t.column :product_association_code, 'char(4)', null: false, default: 'ZZZZ'

      t.integer :ordinal,  null: false, default: 0
      t.decimal :quantity, null: false, default: 0.0, precision: 12, scale: 2

      t.text :description
      t.text :instruction

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Time.utc(1970)
      t.datetime :closed_at,        null: false, default: Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_product_associatings, :source_id
    add_index :unidom_product_associatings, :target_id

  end

end
