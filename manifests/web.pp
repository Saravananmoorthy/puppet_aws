ec2_instance { 'test-puppet':
  ensure            => present,
  region            => 'eu-central-1',
  availability_zone => 'eu-central-1b',
  image_id          => 'ami-979e73f8',
  instance_type     => 't2.micro',
  monitoring        => true,
  key_name          => 'pulse-key',
  subnet            => 'vpc-336ed15a',
  security_groups   => ['autosubmit'],
  block_devices => [
  {
    device_name  => '/dev/sda1',
    volume_size  => 10,
  }
],
  tags              => {
    tag_name => 'test-puppet',
  },
}

elb_loadbalancer { 'puppet-lb':
  ensure             => present,
  region             => eu-central-1,
  availability_zones   => ['eu-central-1a', 'eu-central-1b'],
  security_groups      => ['autosubmit'],
  instances          => ['test-puppet'],
  listeners          => [{
    protocol           => 'tcp',
    load_balancer_port => 80,
    instance_protocol  => 'tcp',
    instance_port      => 80,
  }],
}

