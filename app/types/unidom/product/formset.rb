class Unidom::Product::Formset < ActiveRecord::Type::Value

  include ProgneTapera::EnumConfig

  enum :unidom_formset

end
