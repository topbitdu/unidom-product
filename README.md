# Unidom Product 产品领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-product.svg)](https://badge.fury.io/rb/unidom-product)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Product domain model engine includes Product and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。产品领域模型引擎包括产品及其相关的模型。



## Recent Update

Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.



## Usage in Gemfile

```ruby
gem 'unidom-product'
```



## Run the Database Migration

```shell
rake db:migrate
```
The migration versions start with 200202.



## Call the Model

```ruby
# Create a Product
product = Unidom::Product::Product.create(name: 'Apple iPhone 6S Plus 64G',
  abbreviation:     'iPhone 6S+ 64G',
  measurement_unit: 'unit',
  packing_norm:     '1 unit per pack',
  formset_code:     'WARE',
  description:      'the latest iPhone model',
  instruction:      'It is almost sold out.')

# Find the Product per Formset Code
Product.formset_coded_as('SRVC').valid_at.alive.first

# Associate 2 products as incompatible
Unidom::Product::ProductAssociating.associate! product_1, with: product_2, due_to: 'ICPT', ordinal: 1, quantity: 1, at: Time.now

# Find the Product Associating per the source product & the target product
associating = Unidom::Product::ProductAssociating.source_is(product_1).target_is(product_2).first
```



## Include the Concerns

```ruby
include Unidom::Product::Concerns::AsSourceProductAssociating
include Unidom::Product::Concerns::AsTargetProductAssociating
```

### As Source Product Associating concern
The As Source Product Associating concern do the following tasks for the includer automatically:  
1. Define the has_many :target_product_associatings macro as: ``has_many :target_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :source_id``  
2. Define the has_many :target_products macro as: ``has_many :target_products, through: :target_product_associatings, source: :target``
3. Define the #associate! method as: ``associate!(target, due_to: nil, at: Time.now, ordinal: 1)``

### As Target Product Associating concern
The As Target Product Associating concern do the following tasks for the includer automatically:  
1. Define the has_many :source_product_associatings macro as: ``has_many :source_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :target_id``  
2. Define the has_many :source_products macro as: ``has_many :source_products, through: :source_product_associatings, source: :source``
3. Define the #is_associated! method as: ``is_associated!(source, due_to: nil, at: Time.now, ordinal: 1)``
