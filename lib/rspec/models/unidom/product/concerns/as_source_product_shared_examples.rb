shared_examples 'Unidom::Product::Concerns::AsSourceProduct' do |model_attributes|

  context do

    target_product_associating_1_attribtues = {
        target_id:                SecureRandom.uuid,
        product_association_code: 'CPLM',
        ordinal:                  1,
        quantity:                 1
      }

    target_product_associating_2_attribtues = {
        target_id:                SecureRandom.uuid,
        product_association_code: 'ICPT',
        ordinal:                  2,
        quantity:                 2
      }

    it_behaves_like 'has_many', model_attributes, :target_product_associatings, Unidom::Product::ProductAssociating, [ target_product_associating_1_attribtues, target_product_associating_2_attribtues ]

  end

end
