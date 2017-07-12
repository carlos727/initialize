# Cookbook Name:: initialize
# Recipe:: default
# Cookbook to configure chef-client runs
# Copyright (c) 2016 The Authors, All Rights Reserved.

#
# Variables
#
$node_name = Chef.run_context.node.name.to_s
mail_to = $node_name.start_with?('P') ? node["mail"]["to_panama"] : node["mail"]["to"]

#
# Install Ruby gems
#
include_recipe 'initialize::gem_install'

#
# Task scheduler
#
include_recipe 'initialize::initial_tasks'

#
# Schedule download_war cookbook
#
include_recipe 'initialize::download_war'

#
# Schedule upload_file cookbook
#
include_recipe 'initialize::upload_file'

#
# Configure Tomcat Manager
#
include_recipe 'tomcat_manager' unless $node_name.include? '-'

#
# Deploy PDT
#
unless $node_name.include?('-') || $node_name.start_with?('B') || $node_name.start_with?('P')
  include_recipe 'deploy_tomcat_app'
end

#
# Notification
#
ruby_block 'Send Email' do
  block do
    subject = "Chef Register Node #{$node_name}"
    message = "Node #{$node_name} registered and configured !"
    Chef::Log.info(message)
    Tool.simple_email mail_to, subject, message
  end
end
