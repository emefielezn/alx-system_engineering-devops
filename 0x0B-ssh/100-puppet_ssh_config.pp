import ssh
impot puppet

file { "/etc/ssh/school":
class { 'ssh':
  storeconfigs_enabled => false,
  server_options => {
    'Match User www-data' => {
      'ChrootDirectory' => '%h',
      'ForceCommand' => 'internal-sftp',
      'PasswordAuthentication' => 'no',
      'AllowTcpForwarding' => 'no',
      'X11Forwarding' => 'no',
    },
    'Port' => [22, 2222, 2288],
  },
  client_options => {
    'Host *.amazonaws.com' => {
      'User' => 'ubuntu',
    },
  },
