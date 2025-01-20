set -e

if [[ ! $(command -v vagrant) ]]; then
    echo "ERROR: Vagrant not installed. Exiting..."
    exit
fi

if [[ -z "${VAGRANT_HOME}" ]]; then
    echo "WARNING: VAGRANT_HOME undefined, defaulting to \$HOME/goinfre"
    export VAGRANT_HOME="$HOME/goinfre"
fi

cd $VAGRANT_HOME

if [[ -f ./Vagrantfile ]]; then
    echo "INFO: Vagrantfile already exists, skipping creation"
else
    vagrant init hashicorp/bionic64
    if [[ ! -f ./Vagrantfile ]]; then
        echo "ERROR: Failed to create Vagrantfile. Exiting..."
        exit
    fi
fi

# boots up VM
echo "INFO: Booting up VM"
vagrant up

echo "INFO: Installing packages, you may be asked to enter your password a few times. default password is \'vagrant\'"
scp -rp ./requirements ./docker-compose.yml ./install_packages.sh vagrant@127.0.0.1:~ -P 2222
ssh vagrant@127.0.0.1 -p 2222 sudo bash install_packages.sh

echo "INFO: setup completed!"
