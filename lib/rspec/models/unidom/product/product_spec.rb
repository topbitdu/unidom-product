require 'rspec/models/unidom/product/concerns/as_source_product_shared_examples'
require 'rspec/models/unidom/product/concerns/as_target_product_shared_examples'

describe Unidom::Product::Product, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      name:             'Model X',
      abbreviation:     'MX',
      measurement_unit: 'car',
      packing_norm:     '1 car',
      formset_code:     'WARE'
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension',   model_attributes
    it_behaves_like 'Unidom::Product::Concerns::AsSourceProduct', model_attributes
    it_behaves_like 'Unidom::Product::Concerns::AsTargetProduct', model_attributes

    it_behaves_like 'validates text', model_attributes, :name,
      length: 2..described_class.columns_hash['name'].limit
    it_behaves_like 'validates text', model_attributes, :abbreviation,
      length: 1..described_class.columns_hash['abbreviation'].limit
    it_behaves_like 'validates text', model_attributes, :measurement_unit,
      length: 1..described_class.columns_hash['measurement_unit'].limit
    it_behaves_like 'validates text', model_attributes, :packing_norm,
      length: 1..described_class.columns_hash['packing_norm'].limit

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :formset, Unidom::Product::Formset

  end

end
