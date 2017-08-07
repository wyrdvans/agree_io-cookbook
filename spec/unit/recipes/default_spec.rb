#
# Cookbook:: agree_io
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'agree_io::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs ruby runtime' do
      expect(chef_run).to include_recipe('poise-ruby::default')
    end

    it 'installs compiler tools for installing ruby gems' do
      expect(chef_run).to include_recipe('poise-build-essential')
    end

    it 'installs the Ruby on Rails application' do
      expect(chef_run).to deploy_application('/opt/agree_io')
    end

    it 'installs the application config file'
    it 'starts the web server'
  end
end
