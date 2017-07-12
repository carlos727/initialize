#
# Cookbook Name:: initialize
# Recipe:: download_war
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

windows_task 'Upload files' do
  action :delete
end

cookbook_file 'C:\chef\upload-file.json' do
  source 'upload-file.json'
  action :create
end

windows_task 'Upload files' do
  cwd 'C:\\opscode\\chef\\bin'
  command 'chef-client -j C:\chef\upload-file.json'
  run_level :highest
  frequency :daily
  frequency_modifier 1
  start_time '08:00' #Official hour
end
