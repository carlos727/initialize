#
# Cookbook Name:: initialize
# Recipe:: download_war
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

cookbook_file 'C:\chef\download-war.json' do
  source 'download-war.json'
  action :create
end

windows_task 'Download Eva.war' do
  cwd 'C:\\opscode\\chef\\bin'
  command 'chef-client -j C:\chef\download-war.json'
  run_level :highest
  frequency :daily
  frequency_modifier 1
  start_time '01:00' #Official hour
end
