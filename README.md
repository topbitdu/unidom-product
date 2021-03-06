# Unidom Product 产品领域模型引擎

[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/unidom-product/frames)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)

[![Gem Version](https://badge.fury.io/rb/unidom-product.svg)](https://badge.fury.io/rb/unidom-product)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/unidom-product.svg)](https://gemnasium.com/github.com/topbitdu/unidom-product)

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
include Unidom::Product::Concerns::AsSourceProduct
include Unidom::Product::Concerns::AsTargetProduct
```

### As Source Product concern

The As Source Product concern do the following tasks for the includer automatically:
1. Define the has_many :target_product_associatings macro as: ``has_many :target_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :source_id``
2. Define the has_many :target_products macro as: ``has_many :target_products, through: :target_product_associatings, source: :target``
3. Define the #associate! method as: ``associate!(target, due_to: nil, at: Time.now, ordinal: 1)``
4. Define the #associate? method as: ``associate?(target, due_to: nil, at: Time.now)``

### As Target Product concern

The As Target Product concern do the following tasks for the includer automatically:
1. Define the has_many :source_product_associatings macro as: ``has_many :source_product_associatings, class_name: 'Unidom::Product::ProductAssociating', foreign_key: :target_id``
2. Define the has_many :source_products macro as: ``has_many :source_products, through: :source_product_associatings, source: :source``
3. Define the #is_associated! method as: ``is_associated!(source, due_to: nil, at: Time.now, ordinal: 1)``
4. Define the #is_associated? method as: ``is_associated?(source, due_to: nil, at: Time.now)``



## Enum codes

### Product Association enum code

```ruby
Unidom::Product::ProductAssociation::COMPLEMENT      # 补充
Unidom::Product::ProductAssociation::INCOMPATIBILITY # 不兼容
Unidom::Product::ProductAssociation::OBSOLESCENCE    # 废弃
Unidom::Product::ProductAssociation::SUBSTITUTE      # 替代
```

### Formset enum code

```ruby
Unidom::Product::Formset::ware      # 货物
Unidom::Product::Formset::service   # 服务
Unidom::Product::Formset::portfolio # 组合
```



## Disable the Model & Migration

If you only need the app components other than models, the migrations should be neglected, and the models should not be loaded.
```ruby
# config/initializers/unidom.rb
Unidom::Common.configure do |options|

  options[:neglected_namespaces] = %w{
    Unidom::Product
  }

end
```



## RSpec examples

### RSpec example manifest (run automatically)

```ruby
# spec/models/unidom_spec.rb
require 'unidom/product/models_rspec'

# spec/types/unidom_spec.rb
require 'unidom/product/types_rspec'

# spec/validators/unidom_spec.rb
require 'unidom/product/validators_rspec'
```

### RSpec shared examples (to be integrated)

```ruby
# The Unidom::Product::Product model already include the Unidom::Product::Concerns::AsSourceProduct concern, & the Unidom::Product::Concerns::AsSourceProduct concern

# spec/support/unidom_rspec_shared_examples.rb
require 'unidom/prooduct/rspec_shared_examples'
```
