describe Unidom::Product::Formset, type: :type do

  before :each do
  end

  after :each do
  end

  it_behaves_like 'ProgneTapera::EnumConfig', 3, [
    { code: 'WARE', name: 'ware',      localized_name: '货物' },
    { code: 'SRVC', name: 'service',   localized_name: '服务' },
    { code: 'PTFL', name: 'portfolio', localized_name: '组合' } ]

end
