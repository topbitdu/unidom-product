# Unidom Product Roadmap 产品领域模型引擎路线图

## v0.1
1. Product model & migration

## v0.2
1. Improved the Product model to include the Model Extension concern

## v0.3
1. Product Associating model & migration
2. Improve the Product model to add the ``has_many :source_product_associatings`` macro, the ``has_many :source_products`` macro, the ``has_many :target_product_associatings`` macro, & the ``has_many :target_products`` macro
3. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.0

## v0.4
1. Improve the Product Associating model to add the ::source_is scope & the ::target_is scope
2. Improve the Product Associating model to add the ::associate! method

## v1.0
1. Improve the Product Associating model to support the Keyword Arguments

## v1.1
1. As Source Product Associating concern
2. As Target Product Associating concern
3. Improve the Prouct model to include the As Source Product Associating concern & As Target Product Associating concern