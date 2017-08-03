#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#


all_web_nodes = search('node', 'role:web*')

members = []

all_web_nodes.each do |web_node|
  
	member = {
	 'hostname'  => web_node['hostname'],
	 'ipaddress' => web_node['ipaddress'],
	 'port'      => 80,
	 'ssl_port'   => 80

	}
	members.push(member)

end


node.default['haproxy']['members'] = members


#node.default['haproxy']['members'] = [
# {
#    "hostname" => "web1",
#    "ipaddress" => "192.168.175.129",
#    "port" => 80,
#    "ssl_port" => 80
#},

# {
#    "hostname" => "web1",
#    "ipaddress" => "192.168.175.129",
#    "port" => 80,
#    "ssl_port" => 80
#}

#]

include_recipe "haproxy::manual"
