# Install nginx web server using Puppet that satisfies the following requirements:
# Listens on port 80
# Serves 'Hello World!' when queried ay the root using curl
# Redirects with 301 HTTP status code

package {'nginx':
  ensure => installed,
}

exec {'index.html':
  command  => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
  provider => shell,
}

exec {'redirect':
  command  => 'sudo bash -c "cat> /etc/nginx/sites-available/default <<EOF
               server {
                     listen 80 default_server;
                     listen [::]:80 default_server;

                     root /var/www/html;
                     index index.html index.htm index.nginx-debian.html;

                     server_name _;

                     location / {
                           try_files \$uri \$uri/ =404;
                     }

                     location /redirect_me {
                          return 301 http://example.com;
                     }
                }
               EOF"',
  provider => shell,
}

exec {'stop':
  command  => 'sudo service nginx stop',
  provider => shell,
}
exec {'start':
  command  => 'sudo service nginx stop',
  provider => shell,
}
