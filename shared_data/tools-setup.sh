#!/usr/bin/env bash

# Wait for cloud-init to do it's thing
timeout 180 /bin/bash -c \
  "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done"

# Literally throw away everything cloud-init has done
echo "Cleaning apt-cache..."
sudo rm -rf /var/lib/apt/lists/* &>/dev/null
sudo apt-get -y clean &>/dev/null

echo "Updating apt-cache..."
sudo apt-get update &>/dev/null
#!/usr/bin/env bash
set -e

command -v jq &>/dev/null || {
  echo "Installing jq..."
  sudo apt-get -yqq update &>/dev/null
  sudo apt-get -yqq install jq &>/dev/null
}
#!/usr/bin/env bash
set -e

command -v docker &>/dev/null || {
  echo "Installing Docker..."
  sudo apt-get -yqq update &>/dev/null
  sudo apt-get -yqq install docker.io &>/dev/null
}
#!/usr/bin/env bash
set -e

command -v git &>/dev/null || {
  echo "Installing Git..."
  sudo apt-get -yqq update &>/dev/null
  sudo apt-get -yqq install git-core &>/dev/null

  echo "Configuring Git..."
  git config --global color.ui true
  git config --global user.name "Change Me"
  git config --global user.email "ChangeMe@Wherever.com<mailto:ChangeMe@Wherever.com>"
}
#!/usr/bin/env bash
set -e

command -v curl &>/dev/null || {
  echo "Installing curl for downloads..."
  sudo apt-get -yqq update &>/dev/null
  sudo apt-get -yqq install curl &>/dev/null
}
#!/usr/bin/env bash
set -e

echo "Setting default prompt..."
sudo tee /etc/profile.d/ps1.sh > /dev/null <<"EOF"
export PS1="\u@\h $ "
EOF
for d in /home/*; do
  if [ -d "$d" ]; then
    sudo tee -a $d/.bashrc > /dev/null <<"EOF"
export PS1="\u@\h $ "
EOF
  fi
done

source /etc/profile
#!/usr/bin/env bash
set -e

echo Success!
