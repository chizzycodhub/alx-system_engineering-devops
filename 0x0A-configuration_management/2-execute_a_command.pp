# Creates a manifest that kills a process named killmenow using puppet

exec {'kill_killmenow':
  command => 'pkill -f killmenow',
  path    => ['/usr/bin/', '/usr/sbin']
}
