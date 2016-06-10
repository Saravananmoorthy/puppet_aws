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

