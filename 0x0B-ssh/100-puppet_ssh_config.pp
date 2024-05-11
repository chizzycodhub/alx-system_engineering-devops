# Configuring the ssh client configuration file to use private key
# for authentication rather than password

file { '/etc/ssh/ssh_config':
  ensure  => present,
  content => '
    Host *
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
  ',
}
