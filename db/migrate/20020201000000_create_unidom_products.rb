class CreateUnidomProducts < ActiveRecord::Migration

  def change

    create_table :unidom_products, id: :uuid do |t|

      t.string :name,             null: false, default: '', limit: 200
      t.string :abbreviation,     null: false, default: '', limit: 8
      t.string :measurement_unit, null: false, default: '', limit: 200
      t.string :packing_norm,     null: false, default: '', limit: 200

      t.text :instruction
      t.text :description

      t.column :formset_code, 'char(4)', null: false, default: 'WARE'

      t.string   :slug,             null: false, default: nil, limit: 200
      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_products, :name
    add_index :unidom_products, :abbreviation
    add_index :unidom_products, :slug, unique: true

  end

end
