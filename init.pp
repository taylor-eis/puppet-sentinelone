class sentinelone (
  String management_token = $sentinelone::params::management_token
) inherits sentinelone::params
{
  package { 'SentinelAgent'
    ensure => latest,
    require => Class['subscription_manager'],
  }
}
