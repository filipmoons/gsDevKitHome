class gsDevKitHome::install(
$gemstone_version = '3.1.0.6',
$service = 'Zinc',
$ports = '8383')

{
user  {
    'vagrant':
      ensure     => present,
      system  => true;
      
  }


  file {
  '/tmp/installWebEdition.sh':
    ensure   => 'file',
    source   => 'puppet:///modules/gsDevKitHome/installWebEdition.sh',
     mode   => '0777',
     require => [
        User['vagrant']
     ],
     owner   => 'vagrant';
   
   '/tmp/defWebEdition':
     ensure   => 'file',
    source   => 'puppet:///modules/gsDevKitHome/defWebEdition',
     mode   => '0777',
     owner   => 'vagrant';
   
   '/tmp/Seaside':
     ensure   => 'file',
    content   => template('gsDevKitHome/Seaside.erb'),
     mode   => '0777',
     owner   => 'vagrant';

     
 }

  exec {
    "/tmp/installWebEdition.sh ${gemstone_version}":
      require => [
        File['/tmp/installWebEdition.sh'],
     ],
     cwd       => '/tmp',
     path      => '/usr:/usr/bin/:/bin/',
     provider => shell,
    group => 'vagrant',
    user => 'vagrant',
     logoutput => true;
     
   
   '/tmp/defWebEdition':
      require => [
        File['/tmp/defWebEdition'],
        Exec["/tmp/installWebEdition.sh ${gemstone_version}"],

     ],
     command => "bash -c '/tmp/defWebEdition'",
     cwd       => '/tmp',
    path      => '/usr:/usr/bin/:/bin/',
     provider => shell,
     user => 'vagrant',
    group => 'vagrant',
     logoutput => true;
     
   '/tmp/Seaside':
      require => [
        Exec['/tmp/defWebEdition'],
     ],
     command => "bash -c '/tmp/Seaside'",
     cwd       => '/tmp',
    path      => '/usr:/usr/bin/:/bin/',
     provider => shell,
     user => 'vagrant',
    group => 'vagrant',
    timeout => 600,
     logoutput => true;
 }
 $RUNNING = 1
 


}

