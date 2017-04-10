##
# As Target Product 是产品关联的目的产品的领域逻辑关注点。

module Unidom::Product::Concerns::AsTargetProduct

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :source_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :target_id
    has_many :source_products,             through:    :source_product_associatings,          source:      :source

    def is_associated?(source, due_to: nil, at: Time.now)

      assert_present! :source, source
      assert_present! :due_to, due_to
      assert_present! :at,     at

      source_product_associatings.source_is(source).product_association_coded_as(due_to).valid_at(now: at).alive.exists?

    end

    def is_associated!(source, due_to: nil, at: Time.now, ordinal: 1)

      assert_present! :source, source
      assert_present! :due_to, due_to
      assert_present! :at,     at
      assert_present! :ordinal, ordinal

      source_product_associatings.source_is(source).product_association_coded_as(due_to).valid_at(now: at).alive.first_or_create! ordinal: ordinal, opened_at: at

    end

  end

  module ClassMethods
  end

end
