require_relative 'spec_helper'

describe 'orientdb::configuration' do
  let(:db_user) {'db_user'}
  let(:db_password) {'db_password'}
  let(:version) {'1.4.1'}
  let(:config_file) {'config_file'}

  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['default_config_file'] = config_file
      node.set[described_cookbook]['db_user'] = db_user
      node.set[described_cookbook]['db_password'] = db_password
      node.set[described_cookbook]['version'] = version
    end
    runner.converge(described_recipe)
  end

  describe 'configuration file' do
    it 'should have the right content for the db user' do
      expect(runner).
        to run_execute("sed -i 's#<storages>#<storages><storage path=\"memory:temp\" name=\"temp\" userName=\"#{db_user}\" userPassword=\"#{db_password}\" loaded-at-startup=\"true\" \/>#' #{config_file}")
    end

    it 'should have the right content for the in memory user' do
      expect(runner).
        to run_execute("sed -i 's#<users>#<users><user name=\"#{db_user}\" password=\"#{db_password}\" resources=\"*\"\/>#' #{config_file}")
    end
  end
end
