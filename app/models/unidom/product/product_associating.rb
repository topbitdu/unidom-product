# Product Associating 表示产品之间的关联。常见的关联包括销售包装、产品换代等。
# source 是来源产品。如组合后的产品、被换代的产品、不兼容产品中的主产品。
# target 是目标产品。如参与组合的产品、替换其它产品的新产品、不兼容产品中的次要产品。
# product_association_code 是产品关联：
#   CPLM 是产品补充   complement
#   ICPT 是产品不兼容 incompatibility
#   OBSL 是产品废弃   obsolescence
#   PCKG 是销售包装   package
#   SBST 是产品替代   substitute

class Unidom::Product::ProductAssociating < ActiveRecord::Base

  self.table_name = 'unidom_product_associatings'

  include Unidom::Common::Concerns::ModelExtension

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0    }

  belongs_to :source, class_name: 'Unidom::Product::Product'
  belongs_to :target, class_name: 'Unidom::Product::Product'

  scope :source_is, ->(product) { where source_id: to_id(product) }
  scope :target_is, ->(product) { where target_id: to_id(product) }

  def self.associate!(source, target, product_association_code, ordinal = 1, quantity = 1, opened_at = Time.now)

    associating = source_is(source).target_is(target).product_association_coded_as(product_association_code).valid_at.alive.first
    associating.soft_destroy if associating.present?

    #if associating.present?
    #  associating.attributes = { ordinal: ordinal, quantity: quantity, opened_at: opened_at }
    #  associating.save!
    #else
    #  associating = create! source_id: to_id(source), target_id: to_id(target), product_association_code: product_association_code, ordinal: ordinal, quantity: quantity, opened_at: opened_at
    #end
    #associating
    create! source_id: to_id(source), target_id: to_id(target), product_association_code: product_association_code, ordinal: ordinal, quantity: quantity, opened_at: opened_at

  end

end
