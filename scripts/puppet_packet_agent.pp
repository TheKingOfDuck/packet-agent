
case $facts['os']['family'] {
  'Suse':     {
                  $lib_pcap = 'libpcap';
                  $cur_dir = '/tmp/';
                  $download_link = 'https://github.com/Netis/packet-agent/releases/download/v0.5.0/netis-packet-agent-0.5.0.el6.x86_64.rpm';
                  $package_provider = 'rpm'; 
                  $install_file = '/tmp/netis-packet-agent-0.5.0.el6.x86_64.rpm'
              }
  'RedHat':   { 
                  $lib_pcap = 'libpcap';
                  $cur_dir = '/tmp/';
                  $download_link = 'https://github.com/Netis/packet-agent/releases/download/v0.5.0/netis-packet-agent-0.5.0.el6.x86_64.rpm';
                  $package_provider = 'rpm'; 
                  $install_file = '/tmp/netis-packet-agent-0.5.0.el6.x86_64.rpm'
              }
  'Debian':   {
                  $lib_pcap = 'libpcap-dev';
                  $cur_dir = '/tmp/';
                  $download_link = 'https://github.com/Netis/packet-agent/releases/download/v0.5.0/netis-packet-agent-0.5.0_amd64.deb';
                  $package_provider = 'dpkg'; 
                  $install_file = '/tmp/netis-packet-agent-0.5.0_amd64.deb' 
              }
  default:    {
                  $lib_pcap = 'libpcap';
                  $cur_dir = '/tmp/';
                  $download_link = 'https://github.com/Netis/packet-agent/releases/download/v0.5.0/netis-packet-agent-0.5.0.el6.x86_64.rpm';
                  $package_provider = 'rpm'; 
                  $install_file = '/tmp/netis-packet-agent-0.5.0.el6.x86_64.rpm'
              }
}

package { $lib_pcap : 
    ensure  => installed
}

exec {"download": 
    cwd => $cur_dir,
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games",
    command => "wget $download_link",
    user => "root",
    group => "root",
    logoutput => "true"
}

package { 'netis-packet-agent': 
    ensure  => installed,
    provider  => $package_provider,
    source    => $install_file
} 
