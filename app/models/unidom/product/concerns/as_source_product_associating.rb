module Unidom::Product::Concerns::AsSourceProductAssociating

  extend ActiveSupport::Concern

  included do |includer|

    has_many :target_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :source_id
    has_many :target_products,             through:    :target_product_associatings,          source: :target

    def associate?(target, due_to: nil, at: Time.now)
      warn "The Unidom::Product::Concerns::AsSourceProductAssociating#associate? method is deprecated and will be removed from unidom-product v2.0. Please use the Unidom::Product::Concerns::AsSourceProduct#associate? method instead."
      target_product_associatings.target_is(target).product_association_coded_as(due_to).valid_at(now: at).alive.exists?
    end

    def associate!(target, due_to: nil, at: Time.now, ordinal: 1)
      warn "The Unidom::Product::Concerns::AsSourceProductAssociating#associate! method is deprecated and will be removed from unidom-product v2.0. Please use the Unidom::Product::Concerns::AsSourceProduct#associate! method instead."
      target_product_associatings.target_is(target).product_association_coded_as(due_to).valid_at(now: at).alive.first_or_create! ordinal: ordinal, opened_at: at
    end

  end

  module ClassMethods
  end

end
