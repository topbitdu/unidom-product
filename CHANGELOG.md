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
1. Improved the Product Associating model to add the ``source_is`` scope & the ::target_is scope
2. Improved the Product Associating model to add the .``associate!`` method

## v1.0
1. Improved the Product Associating model to support the Keyword Arguments

## v1.1
1. As Source Product Associating concern
2. As Target Product Associating concern
3. Improved the Product model to include the As Source Product Associating concern & As Target Product Associating concern

## v1.2
1. Improved the As Source Product Associating concern to add the #``associate!`` method
2. Improved the As Target Product Associating concern to add the #``is_associated!`` method

## v1.3
1. Improved the As Source Product Associating concern to add the #``associate?`` method
2. Improved the As Target Product Associating concern to add the #is_associated? method

## v1.4
1. Deprecated the As Source Product Associating & the As Target Product Associating concern
2. As Source Product concern
3. As Target Product concern
4. Improved the Product model to include the As Source Product concern & the As Target Product concern

## v1.4.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.6

## v1.4.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7

## v1.5
1. Improved the Ruby Gem Specification to depend on the [progne_tapera](https://github.com/topbitdu/progne_tapera) v0.3
2. Product Association enum code
3. Improved the Product Associating model to configure the Product Association enum code

## v1.5.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.7.1
2. Improved the Ruby Gem Specification to never depend on [progne_tapera](https://github.com/topbitdu/progne_tapera)

## v1.6
1. Formset enum code
2. Improved the Product model to configure the Formset enum code

## v1.6.1
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.8
2. Improved the Engine class to include the Engine Extension

## v1.6.2
1. Improved the Ruby Gem Specification to depend on [unidom-common](https://github.com/topbitdu/unidom-common) v1.9
2. Improved the models to support the namespace neglecting

## v1.7
1. Models RSpec examples manifest
2. Types RSpec examples manifest
3. Validators RSpec examples manifest

## v1.7.1
1. Improved the Product Associating model for the validations on the #``quantity`` attribute
2. Improved the Product spec for the validations on the #name attribute, the #abbreviation attribute, the #measurement_unit attribute, the #packing_norm attribute, & the #formset_code attribute
3. Improved the Product Associating spec for the validations on the #quantity attribute, & the #product_association_code attribute

## v1.7.2
1. Improved the Product Associating spec for the ``belongs_to :source, class_name: 'Unidom::Product::Product'`` macro, & the ``belongs_to :target, class_name: 'Unidom::Product::Product'`` macro

## v1.7.3
1. Improved the Product Associating spec for the source_is scope, & the target_is scope

## v1.7.4
1. Improve the Product Associating model for the validations on the #quantity attribute
2. Improve the Product Associating spec for the validations on the #quantity attribute
3. Improve the Product spec for the validations on the #name attribute, the #abbreviation attribute, the #measurement_unit attribute, the #packing_norm attribute

## v1.7.5
1. As Source Product shared examples
2. RSpec shared examples manifest
3. Improve the Product spec for the As Source Product concern

## v1.7.6
1. As Target Product shared examples
2. Improve the RSpec shared examples manifest to remove the As Source Product shared examples & the As Target Product shared examples
3. Improve the Product spec for the As Target Product concern

## v1.7.7
1. Improve the As Source Product concern for the argument validations of the #associate! method, & the #associate? method
2. Improve the As Target Product concern for the argument validations of the #is_associated! method, & the #is_associated? method
3. Improve the As Source Product shared examples for the argument validations of the #associate! method, & the #associate? method
4. Improve the As Target Product shared examples for the argument validations of the #is_associated! method, & the #is_associated? method
