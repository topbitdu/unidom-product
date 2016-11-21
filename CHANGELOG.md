# Unidom Product Change Log 产品领域模型引擎变更日志

## v0.1
1. Product model & migration (20020201000000)

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

## v1.1
1. As Source Product Associating concern
2. As Target Product Associating concern
3. Improved the Product model to include the As Source Product Associating concern & As Target Product Associating concern

## v1.2
1. Improved the As Source Product Associating concern to add the #associate! method
2. Improved the As Target Product Associating concern to add the #is_associated! method

## v1.3
1. Improved the As Source Product Associating concern to add the #associate? method
2. Improved the As Target Product Associating concern to add the #is_associated? method

## v1.4
1. Deprecated the As Source Product Associating & the As Target Product Associating concern
2. As Source Product concern
3. As Target Product concern
4. Improve the Product model to include the As Source Product concern & the As Target Product concern

## v1.4.1
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.4.2
1. Improve the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7
