##
# As Source Product 是产品关联的源产品的领域逻辑关注点。

module Unidom::Product::Concerns::AsSourceProduct

  extend  ActiveSupport::Concern
  include Unidom::Common::Concerns::ArgumentValidation

  included do |includer|

    has_many :target_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :source_id
    has_many :target_products,             through:    :target_product_associatings,          source: :target

    def associate!(target, due_to: nil, at: Time.now, ordinal: 1)

      assert_present! :target,  target
      assert_present! :due_to,  due_to
      assert_present! :at,      at
      assert_present! :ordinal, ordinal

      target_product_associatings.target_is(target).product_association_coded_as(due_to).valid_at(now: at).alive.first_or_create! ordinal: ordinal, opened_at: at

    end

    def associate?(target, due_to: nil, at: Time.now)

      assert_present! :target, target
      assert_present! :due_to, due_to
      assert_present! :at,     at

      target_product_associatings.target_is(target).product_association_coded_as(due_to).valid_at(now: at).alive.exists?

    end

  end

  module ClassMethods
  end

end
