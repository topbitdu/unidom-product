module Unidom::Product::Concerns::AsTargetProductAssociating

  extend ActiveSupport::Concern

  included do |includer|

    has_many :source_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :target_id
    has_many :source_products,             through:    :source_product_associatings,          source:      :source

  end

  module ClassMethods
  end

end
