require 'spec_helper'
describe 'vsphere_conf' do

  context 'with defaults for all parameters' do
    it { should contain_class('vsphere_conf') }
  end
end
