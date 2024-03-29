# Encoding: utf-8
#
# Cookbook Name:: steam
# Recipe:: default
#
# Copyright 2014, Justin Kolberg
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

case node['platform_family']
when 'debian'
  include_recipe 'curl'

  package_name = node['steam']['package_name']
  file_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

  remote_file file_path do
    source node['steam']['package_url']
    mode 0644
  end

  dpkg_package 'steam' do
    source file_path
    action :install
  end
when 'mac_os_x'
  dmg_package 'Steam' do
    source node['steam']['package_url']
    action :install
  end  
when 'windows'
  windows_package do
    source node['steam']['package_url']
    action :install
  end
end
