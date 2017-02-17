describe Unidom::Product::ProductAssociating, type: :model do

  before :each do
  end

  after :each do
  end

  context do

    model_attributes = {
      source_id:                SecureRandom.uuid,
      target_id:                SecureRandom.uuid,
      product_association_code: Unidom::Product::ProductAssociation::COMPLEMENT.code,
      ordinal:                  1,
      quantity:                 2
    }

    it_behaves_like 'Unidom::Common::Concerns::ModelExtension', model_attributes

    it_behaves_like 'validates', model_attributes, :quantity,
      {                               } => 0,
      { quantity: nil                 } => 2,
      { quantity: ''                  } => 2,
      { quantity: '1'                 } => 0,
      { quantity: 1                   } => 0,
      { quantity: 'A'                 } => 1,
      { quantity: '1.23'              } => 0,
      { quantity: 1.23                } => 0,
      { quantity: '-0.01'             } => 1,
      { quantity: -0.01               } => 1,
      { quantity: '0'                 } => 0,
      { quantity: 0                   } => 0,
      { quantity: '0.01'              } => 0,
      { quantity: 0.01                } => 0,
      { quantity: '999_999_999.99'    } => 0,
      { quantity: 999_999_999.99      } => 0,
      { quantity: '1_000_000_000'     } => 1,
      { quantity: 1_000_000_000       } => 1,
      { quantity: '1_000_000_000.01'  } => 1,
      { quantity: 1_000_000_000.01    } => 1

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :product_association, Unidom::Product::ProductAssociation

  end

end
