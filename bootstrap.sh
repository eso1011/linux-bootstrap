RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

success=0
sudo apt install tmux && ln -s -f .tmux/.tmux.conf && success=1
if ((success)); then
    echo -e "${GREEN}tmux installed${NC}\n"
else
    echo -e "${RED}tmux installation failed${NC}\n"
fi
success=0

sudo apt-get install tilda && success=1
if ((success)); then
    echo -e "${GREEN}tilda installed${NC}\n"
else
    echo -e "${RED}tilda installation failed${NC}${NC}\n"
fi

success=0
sudo snap install intellij-idea-ultimate --classic && success=1
if ((success)); then
    echo -e "${GREEN}idea installed${NC}\n"
else
    echo -e "${RED}idea installation failed${NC}\n"
fi
success=0

curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh && sudo usermod -aG docker ${USER} && docker -v && success=1
if ((success)); then
    echo -e "${GREEN}docker engine installed${NC}\n"
else
    echo -e "${RED}docker engine  installation failed${NC}\n"
fi
success=0

sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose && docker-compose -v && success=1
if ((success)); then
    echo -e "${GREEN}docker-compose installed${NC}\n"
else
    echo -e "${RED}docker-compose installation failed${NC}\n"
fi
success=0

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash && nvm --version && success=1
if ((success)); then
    echo -e "${GREEN}nvm installed${NC}\n"
else
    echo -e "${RED}nvm installation failed${NC}\n"
fi
success=0

echo -e "\n\n\n${GREEN}SCRIPT DONE ${NC}\n"
