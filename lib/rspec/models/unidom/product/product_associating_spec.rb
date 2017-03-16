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

    it_behaves_like 'validates numericality', model_attributes, :quantity,
      range: 0..1_000_000_000, minimum_inclusive: true, maximum_inclusive: true

    it_behaves_like 'ProgneTapera::EnumCode', described_class.new(model_attributes), :product_association, Unidom::Product::ProductAssociation

    product_attributes = {
      name:             'Model X',
      abbreviation:     'MX',
      measurement_unit: 'car',
      packing_norm:     '1 car',
      formset_code:     'WARE'
    }

    it_behaves_like 'belongs_to', model_attributes, :source, Unidom::Product::Product, product_attributes
    it_behaves_like 'belongs_to', model_attributes, :target, Unidom::Product::Product, product_attributes

    it_behaves_like 'monomorphic scope', model_attributes, :source_is, :source
    it_behaves_like 'monomorphic scope', model_attributes, :target_is, :target

  end

end
