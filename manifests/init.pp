class sentinelone (
  String $management_token = $sentinelone::params::management_token
) inherits sentinelone::params
{
  package { 'SentinelAgent':
    ensure => latest,
    require => Class['subscription_manager'],
  }
  if $management_token {
    exec { 'SentinelRegistration':
      command => "/opt/sentinelone/bin/sentinelctl management token set $management_token",
      unless => "/opt/sentinelone/bin/sentinelctl management status | egrep 'Connectivity\s*On'",
      require => Package['SentinelAgent'],
    }
  }
}
