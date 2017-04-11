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

    model  = described_class.create! model_attributes
    target = described_class.create! model_attributes
    it_behaves_like 'assert_present!', model, :associate!, [ target, { due_to: 'CPLM', at: Time.now } ], [ { 0 => :target }, :due_to, :at ]
    it_behaves_like 'assert_present!', model, :associate?, [ target, { due_to: 'CPLM', at: Time.now } ], [ { 0 => :target }, :due_to, :at ]

  end

end
