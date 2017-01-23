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

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

  end

end
