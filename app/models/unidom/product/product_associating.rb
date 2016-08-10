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

end
