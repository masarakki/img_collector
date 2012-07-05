set :rvm_type, :user
$:.unshift(File.expand_path('.lib', ENV['rvm_path']))
require 'rvm/capistrano'
require 'bundler/capistrano'

set :application, "img_collector"
set :repository, "git://github.com/masarakki/img_collector.git"
set :deploy_to, "/home/masaki/www/#{application}"

set :scm, :git
role :web, "hisme.net"
role :app, "hisme.net"
role :db,  "hisme.net", :primary => true

require 'capistrano-unicorn'
#set :deploy_via, :copy
#set :use_sudo, false


