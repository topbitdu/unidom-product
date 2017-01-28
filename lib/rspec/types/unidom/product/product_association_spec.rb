describe Unidom::Product::ProductAssociation, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 4, [
    { code: 'CPLM', name: 'complement',      localized_name: '补充'   },
    { code: 'ICPT', name: 'incompatibility', localized_name: '不兼容' },
    { code: 'OBSL', name: 'obsolescence',    localized_name: '废弃'   },
    { code: 'SBST', name: 'substitute',      localized_name: '替代'   } ]

end
