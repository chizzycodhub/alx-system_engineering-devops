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

file_line {'redirect':
  path    => '/etc/nginx/sites-available/default',
  line    => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  match   => 'location /{',
  after   => 'location /{',
}

service {'nginx':
  ensure => running,
  enable => true,
}
