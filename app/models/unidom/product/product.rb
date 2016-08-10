# Product 是产品。

class Unidom::Product::Product < ActiveRecord::Base

  self.table_name = 'unidom_products'

  include Unidom::Common::Concerns::ModelExtension

  validates :name,             presence: true, length: { in: 2..self.columns_hash['name'].limit             }
  validates :abbreviation,     presence: true, length: { in: 1..self.columns_hash['abbreviation'].limit     }
  validates :measurement_unit, presence: true, length: { in: 1..self.columns_hash['measurement_unit'].limit }
  validates :packing_norm,     presence: true, length: { in: 1..self.columns_hash['packing_norm'].limit     }

  has_many :source_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :target_id #, as:     :target
  has_many :source_products,             through:    :source_product_associatings,          source: :source

  has_many :target_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :source_id #, as:     :source
  has_many :target_products,             through:    :target_product_associatings,          source: :target

end
