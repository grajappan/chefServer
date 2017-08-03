name 'LoadBalance_role'
description 'Role for load balancer servers'
run_list 'recipe[myhaproxy]'
default_attributes 'lb-test' => {
 'attribute1' => 'Hello from attribute1',
 'attribute2' => 'Hi from attribute2'
}
