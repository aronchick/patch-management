require 'spec_helper'

describe 'patch-management::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new
    runner.node.set['languages']['vulnerable'] = 'true'
    runner.converge(described_recipe)
  end

  it 'sets the default attributes correctly' do
    expect(chef_run.node['ohai']['plugins']['patch-management']).to \
    eq('plugins')
  end

  it 'includes the audit recipe' do
    expect(chef_run).to include_recipe('patch-management::audit')
  end

  it 'includes the remediate recipe' do
    expect(chef_run).to include_recipe('patch-management::remediate')
  end
end
