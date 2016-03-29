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
```
