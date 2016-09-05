# Unidom Product Change Log 产品领域模型引擎变更日志

## v0.1
1. Product model & migration

## v0.2
1. Improved the Product model to include the Model Extension concern

## v0.3
1. Product Associating model & migration
2. Improved the Product model to add the ``has_many :source_product_associatings`` macro, the ``has_many :source_products`` macro, the ``has_many :target_product_associatings`` macro, & the ``has_many :target_products`` macro
3. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v0.4
1. Improved the Product Associating model to add the ::source_is scope & the ::target_is scope
2. Improved the Product Associating model to add the ::associate! method

## v1.0
1. Improved the Product Associating model to support the Keyword Arguments
