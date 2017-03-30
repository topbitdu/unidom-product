shared_examples 'Unidom::Product::Concerns::AsTargetProduct' do |model_attributes|

  context do

    source_product_associating_1_attribtues = {
        source_id:                SecureRandom.uuid,
        product_association_code: 'CPLM',
        ordinal:                  1,
        quantity:                 1
      }

    source_product_associating_2_attribtues = {
        source_id:                SecureRandom.uuid,
        product_association_code: 'ICPT',
        ordinal:                  2,
        quantity:                 2
      }

    it_behaves_like 'has_many', model_attributes, :source_product_associatings, Unidom::Product::ProductAssociating, [ source_product_associating_1_attribtues, source_product_associating_2_attribtues ]

  end

end
