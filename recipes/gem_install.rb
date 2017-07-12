#
# Cookbook Name:: initialize
# Recipe:: gem_install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

log 'Gem Mechanize downloaded and installed.' do
  action :nothing
end

chef_gem 'mechanize' do
  version "2.7.4"
  compile_time false if respond_to?(:compile_time)
  notifies :write, 'log[Gem Mechanize downloaded and installed.]', :immediately
end
