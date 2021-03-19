#dnf install -y passwd cracklib-dicts
sudo dnf reinstall shadow-utils
sudo dnf install findutils ncurses man
sudo dnf install iputils
sudo setcap cap_net_raw+p /bin/ping
sudo dnf install ripgrep nss_wrapper procps htop mc mlocate wget tar bzip2 \
  git make ed vim \
  iproute hostname net-tools bind-utils telnet \
  libXext libXrender libXtst re2-devel freetype fontconfig \
  libcurl-devel openssl-devel \
sudo dnf groupinstall 'Development Tools'
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install ffmpeg python3-devel python3-pip pandoc openblas-devel pass

#  Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName | Where-Object -Property DistributionName -eq FedoraCore  | Set-ItemProperty -Name DefaultUid -Value 1000
# $a = @("HOSTTYPE=x86_64",
# "LANG=en_US.UTF-8"
# "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games",
# "TERM=xterm-256color")
#  Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName | Where-Object -Property DistributionName -eq FedoraCore  | Set-ItemProperty -Name DefaultEnvironment -Value $a
