if [[ ! $(command -v vagrant) ]]; then
    echo "ERROR: Vagrant not installed. Exiting..."
    exit
fi

if [[ -z "${VAGRANT_HOME}" ]]; then
    echo "WARNING: VAGRANT_HOME undefined, defaulting to /home/arguez/goinfre"
    export VAGRANT_HOME="/home/arguez/goinfre"
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
# installs xauth, xinit, firefox
ssh vagrant@127.0.0.1 -p 2222 sudo apt update ; sudo apt upgrade -y ; sudo apt install xinit xauth firefox -y

# installs docker
ssh vagrant@127.0.0.1 -p 2222 sudo apt-get install ca-certificates curl -y ; sudo install -m 0755 -d /etc/apt/keyrings ; sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc ; sudo chmod a+r /etc/apt/keyrings/docker.asc ; sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "INFO: setup completed! Dont forget to clone your repo..."
