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

  end

end
