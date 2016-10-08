# Product 是产品。

class Unidom::Product::Product < ActiveRecord::Base

  self.table_name = 'unidom_products'

  include Unidom::Common::Concerns::ModelExtension
  include Unidom::Product::Concerns::AsSourceProduct
  include Unidom::Product::Concerns::AsTargetProduct

  validates :name,             presence: true, length: { in: 2..self.columns_hash['name'].limit             }
  validates :abbreviation,     presence: true, length: { in: 1..self.columns_hash['abbreviation'].limit     }
  validates :measurement_unit, presence: true, length: { in: 1..self.columns_hash['measurement_unit'].limit }
  validates :packing_norm,     presence: true, length: { in: 1..self.columns_hash['packing_norm'].limit     }

end
