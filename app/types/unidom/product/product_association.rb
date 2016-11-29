class Unidom::Product::ProductAssociation < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_product_association

end
