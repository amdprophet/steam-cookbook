case node['platform_family']
when 'debian'
  default['steam']['package_name'] = 'steam.deb'
when 'mac_os_x'
  default['steam']['package_name'] = ''
when 'windows'
  default['steam']['package_name'] = 'steamsetup.exe'
else
  error_msg = 'Steam cookbook only supports Windows, OS X & Debian-based distributions'
  Chef::Application.fatal!(error_msg)
end

default['steam']['package_url'] = "http://media.steampowered.com/client/installer/" +
  "#{node['steam']['package_name']}"
