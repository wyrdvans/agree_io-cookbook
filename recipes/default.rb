#
# Cookbook:: agree_io
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'apt::default'
include_recipe 'poise-build-essential'
include_recipe 'poise-ruby::default'

application '/opt/agree_io' do
  git 'https://github.com/wyrdvans/agree-io.git'
  bundle_install do
    deployment true
    without %w(development test)
  end
  rails do
    database 'sqlite3:///db.sqlite3'
    secret_token 'd78fe08df56c9'
    migrate true
  end
  unicorn do
    port 8000
  end
end
