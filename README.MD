# Fast boot

```
chmod +x ./bootstrap.sh
./bootstrap.sh
```

# Manual install

## TMUX

Original tmux config stolen from https://github.com/gpakosz/.tmux.git

## Tilda

- Install tilda `sudo apt-get install tilda`

## Idea

- Install idea `sudo snap install intellij-idea-ultimate --classic`

## Docker

Install engine

```
 curl -fsSL https://get.docker.com -o get-docker.sh
 sudo sh get-docker.sh
 sudo usermod -aG docker eso
 docker -v
```

Instal docker compose

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -v
```

## NVM

Install nvm (`~/.bashrc` already had correct nvm config)

`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash`
