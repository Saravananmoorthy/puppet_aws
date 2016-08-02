
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

		

rds_instance { 'puppetdb':
  ensure	=> 'present',
  db_name        => 'coeusdb',
  db_instance_class => 'db.t2.small',
  region         => 'eu-central-1',
  engine         => 'mysql',
  engine_version => '5.5.40b',
  allocated_storage => '5',
  storage_type  => 'gp2',
  master_username  => 'admin',
  master_user_password => 'coeus123!',
  multi_az  => 'false',
                        
} 



