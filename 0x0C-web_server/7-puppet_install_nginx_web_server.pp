# Install nginx web server using Puppet that satisfies the following requirements:
# Listens on port 80
# Serves 'Hello World!' when queried ay the root using curl
# Redirects with 301 HTTP status code

package {'nginx':
  ensure => installed,
}

file {'/var/www/html/index.html':
  ensure  => present,
  content => 'Hello World!\n',
}

file {'/etc/nginx/sites-available/default':
  ensure  => present,
  content => template('nginx/default.erb'),
  require => package['nginx'],
  notify  => service['nginx'],
}

file_line {'redirect':
  path    => '/etc/nginx/sites-available/default',
  line    => '    location /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;}',
  match   => 'location /{',
  after   => 'location /{',
  require => file['/etc/nginx/sites-available/default'],
  notify  => service['nginx'],
}

service {'nginx':
  ensure => running,
  enable => true,
}
