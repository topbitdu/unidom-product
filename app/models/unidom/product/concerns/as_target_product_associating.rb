##
# As Target Product Associating 是产品关联的目的关系的领域逻辑关注点。

module Unidom::Product::Concerns::AsTargetProductAssociating

  extend ActiveSupport::Concern

  included do |includer|

    has_many :source_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :target_id
    has_many :source_products,             through:    :source_product_associatings,          source:      :source

    def is_associated?(source, due_to: nil, at: Time.now)
      warn "The Unidom::Product::Concerns::AsTargetProductAssociating#is_associated? method is deprecated and will be removed from unidom-product v2.0. Please use the Unidom::Product::Concerns::AsTargetProduct#is_associated? method instead."
      source_product_associatings.source_is(source).product_association_coded_as(due_to).valid_at(now: at).alive.exists?
    end

    def is_associated!(source, due_to: nil, at: Time.now, ordinal: 1)
      warn "The Unidom::Product::Concerns::AsTargetProductAssociating#is_associated! method is deprecated and will be removed from unidom-product v2.0. Please use the Unidom::Product::Concerns::AsTargetProduct#is_associated! method instead."
      source_product_associatings.source_is(source).product_association_coded_as(due_to).valid_at(now: at).alive.first_or_create! ordinal: ordinal, opened_at: at
    end

  end

  module ClassMethods
  end

end
