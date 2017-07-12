#
# Cookbook Name:: initialize
# Recipe:: initial_tasks
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

execute 'Delete Chef Service' do
  command 'chef-service-manager -a uninstall'
end

file 'C:\chef\redsis-validator.pem' do
  action :delete
  only_if { File.exist?('C:\chef\redsis-validator.pem') }
end

windows_task 'chef-client' do
  cwd 'C:\\opscode\\chef\\bin'
  command 'chef-client'
  run_level :highest
  frequency :daily
  frequency_modifier 1
  start_time '23:00'
end
