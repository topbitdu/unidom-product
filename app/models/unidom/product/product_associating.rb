##
# Product Associating 表示产品之间的关联。常见的关联包括销售包装、产品换代等。
# source 是来源产品。如组合后的产品、被换代的产品、不兼容产品中的主产品。
# target 是目标产品。如参与组合的产品、替换其它产品的新产品、不兼容产品中的次要产品。
# product_association_code 是产品关联：
#   CPLM 是产品补充   complement: from, thru, reason
#   ICPT 是产品不兼容 incompatibility: from, thru, reason
#   OBSL 是产品废弃   obsolescence: on, reason
#   PCKG 是销售包装(行销组件)   package: quantity, usage
#   SBST 是产品替代   substitute: from, thru, quantity, comments
# 构成: from, thru, quantity, usage, comments
#

class Unidom::Product::ProductAssociating < Unidom::Product::ApplicationRecord

  self.table_name = 'unidom_product_associatings'

  include Unidom::Common::Concerns::ModelExtension
  include ProgneTapera::EnumCode

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0    }

  belongs_to :source, class_name: 'Unidom::Product::Product'
  belongs_to :target, class_name: 'Unidom::Product::Product'

  scope :source_is, ->(product) { where source_id: to_id(product) }
  scope :target_is, ->(product) { where target_id: to_id(product) }

  code :product_association, Unidom::Product::ProductAssociation

  def self.associate!(source, with: target, due_to: 'PCKG', ordinal: 1, quantity: 1, at: Time.now)

    associating = source_is(source).target_is(with).product_association_coded_as(due_to).valid_at.alive.first
    associating.soft_destroy if associating.present?

    #if associating.present?
    #  associating.attributes = { ordinal: ordinal, quantity: quantity, opened_at: opened_at }
    #  associating.save!
    #else
    #  associating = create! source_id: to_id(source), target_id: to_id(target), product_association_code: product_association_code, ordinal: ordinal, quantity: quantity, opened_at: opened_at
    #end
    #associating
    create! source_id: to_id(source), target_id: to_id(with), product_association_code: due_to, ordinal: ordinal, quantity: quantity, opened_at: at

  end

end
