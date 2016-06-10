Ec2_instance {
  region => 'eu-central-1',
}

Elb_loadbalancer {
  region => 'eu-central-1',
}

elb_loadbalancer { 'puppet-lb':
  ensure => absent,
} ~>
ec2_instance { ['test-puppet']:
  ensure => absent,
} 
