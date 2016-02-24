# Unidom Product 产品领域模型引擎

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/unidom-product.svg)](https://badge.fury.io/rb/unidom-product)

Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Product domain model engine includes Product and its relative models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。产品领域模型引擎包括产品及其相关的模型。

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
Unidom::Product::Product.valid_at.alive.first
```
