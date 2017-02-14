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

    name_max_length             = described_class.columns_hash['name'].limit
    abbreviation_max_length     = described_class.columns_hash['abbreviation'].limit
    measurement_unit_max_length = described_class.columns_hash['measurement_unit'].limit
    packing_norm_max_length     = described_class.columns_hash['packing_norm'].limit

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :name,
      {             } => 0,
      { name: nil   } => 2,
      { name: ''    } => 2,
      { name: 'A'   } => 1,
      { name: 'AA'  } => 0,
      { name: 'AAA' } => 0,
      { name: 'A'*(name_max_length-1) } => 0,
      { name: 'A'*name_max_length     } => 0,
      { name: 'A'*(name_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :abbreviation,
      {                     } => 0,
      { abbreviation: nil   } => 2,
      { abbreviation: ''    } => 2,
      { abbreviation: 'A'   } => 0,
      { abbreviation: 'AA'  } => 0,
      { abbreviation: 'AAA' } => 0,
      { abbreviation: 'A'*(abbreviation_max_length-1) } => 0,
      { abbreviation: 'A'*abbreviation_max_length     } => 0,
      { abbreviation: 'A'*(abbreviation_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :measurement_unit,
      {                         } => 0,
      { measurement_unit: nil   } => 2,
      { measurement_unit: ''    } => 2,
      { measurement_unit: 'A'   } => 0,
      { measurement_unit: 'AA'  } => 0,
      { measurement_unit: 'AAA' } => 0,
      { measurement_unit: 'A'*(measurement_unit_max_length-1) } => 0,
      { measurement_unit: 'A'*measurement_unit_max_length     } => 0,
      { measurement_unit: 'A'*(measurement_unit_max_length+1) } => 1

    it_behaves_like 'validates', model_attributes, :packing_norm,
      {                     } => 0,
      { packing_norm: nil   } => 2,
      { packing_norm: ''    } => 2,
      { packing_norm: 'A'   } => 0,
      { packing_norm: 'AA'  } => 0,
      { packing_norm: 'AAA' } => 0,
      { packing_norm: 'A'*(packing_norm_max_length-1) } => 0,
      { packing_norm: 'A'*packing_norm_max_length     } => 0,
      { packing_norm: 'A'*(packing_norm_max_length+1) } => 1

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :formset, Unidom::Product::Formset

  end

end
