#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'httpd' do
  only_if { node[:platform] == 'centos' }
  action :install
end

package 'apache2' do
  only_if { node[:platform] == 'ubuntu' }
  action :install
end

file '/var/www/html/index.html' do
 content "<!DOCTYPE html>
           <html>
           <body>

             <h1>Hello World</h1>
             <p>IPADDRESS: #{ node['ipaddress'] }</p>
             <p>HOSTNAME: #{ node['hostname'] }</p>

           </body>
           </html>"
end
service 'httpd' do
  only_if { node[:platform] == 'centos' } 
  action [ :enable, :start ]
end
service 'apache2' do 
  only_if { node[:platform] == 'ubuntu' }
  action [:enable, :start]
end
