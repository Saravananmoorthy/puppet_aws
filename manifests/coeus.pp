ec2_instance { 'puppet-test':
  ensure                   => 'present',
  availability_zone        => 'eu-central-1a',
  image_id                 => 'ami-9919edf6',
  instance_type            => 't2.small',
  key_name                 => 'puppet-coeus-key',
  region                   => 'eu-central-1',
  security_groups          => ['puppet-security'],
  subnet		   => 'subnet-default',
}

