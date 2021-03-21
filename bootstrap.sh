RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'

NC='\033[0m'
successPacks=()
failedPacks=()

system_message() {
    message=$1
    echo -e "${BLUE}$1${NC}...\n"
}
# function for returning errors
get_message() {
    is_success=$1
    package_name=$2

    if (($1)); then
        echo -e "${GREEN}$2 installed${NC}\n"
        successPacks+=($2)
    else
        echo -e "${RED}$2 installation failed${NC}\n"
        failedPacks+=($2)
    fi
}

# set caps to ctrl
system_message "set nocaps"
setxkbmap -layout us -option ctrl:nocaps

# updating packages
system_message "start update and upgrade apt-get"
sudo apt-get update -qq && sudo apt-get upgrade -y -qq && sudo apt-get install vim -y -qq

system_message "installing utility packages"
sudo apt-get install curl -y -qq
sudo apt-get install wget -y -qq
sudo apt-get install snap -y -qq

system_message "installing general packages"
success=0
# tmux install
sudo apt-get install tmux -y -qq && ln -s -f .tmux/.tmux.conf && success=1
get_message success "tmux"
success=0

# patching ~/.bash_profile for new version of tmux - issue when tmux ignore .bashrc
if ! test -f "~/.bash_profile"; then
    touch ~/.bash_profile
fi

if ! grep -q "#tmux_fix" ~/.bash_profile; then
    echo -e "\n#tmux_fix\nif [ -n "$BASH_VERSION" ]; then\n  # include .bashrc if it exists\n  if [ -f "$HOME/.bashrc" ]; then\n    . "$HOME/.bashrc"\n  fi\nfi" >>~/.bash_profile
fi

snap install spotify && success=1
get_message success "spotify"
success=0

sudo snap install mailspring && success=1
get_message success "mailspring"
success=0

sudo apt-get install tilda -y -qq && success=1
get_message success "tilda"
success=0

sudo snap install intellij-idea-ultimate --classic && success=1
get_message success "idea"
success=0

curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh && sudo usermod -aG docker ${USER} && docker -v && success=1
get_message success "docker-engine"
success=0

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose && docker-compose -v && success=1
get_message success "docker-compose"
success=0

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && success=1 && nvm --version
get_message success "nvm"
success=0

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y -qq
get_message success "chrome"
success=0

# final print
echo -e "success packs:"
for value in "${successPacks[@]}"; do
    echo -e "${GREEN}$value${NC}\n"
done

echo -e "failed packs:"
for value in "${failedPacks[@]}"; do
    echo -e "${RED}$value${NC}\n"
done
