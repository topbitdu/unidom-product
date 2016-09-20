module Unidom::Product::Concerns::AsSourceProductAssociating

  extend ActiveSupport::Concern

  included do |includer|

    has_many :target_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :source_id
    has_many :target_products,             through:    :target_product_associatings,          source: :target

  end

  module ClassMethods
  end

end
