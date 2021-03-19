sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=33
export DNF_SYSTEM_UPGRADE_NO_REBOOT=1
sudo dnf system-upgrade reboot
sudo dnf system-upgrade upgrade
sudo rpmdb --rebuilddb
sudo dnf upgrade --refresh

python3 -m pip install --upgrade pip
python3 -m pip install matplotlib pandas numpy scipy jupyter jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

python3 -m pip install qiskit[visualization]
