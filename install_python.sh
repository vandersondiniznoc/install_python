#!/bin/bash

set -e

echo "🧪 Detectando distribuição Linux..."

# Detecta a distribuição
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "❌ Não foi possível detectar a distribuição Linux."
    exit 1
fi

echo "📦 Instalando dependências para: $DISTRO"

case "$DISTRO" in
  ubuntu|debian)
    sudo apt update
    sudo apt install -y python3 python3-pip python3-venv
    ;;

  fedora)
    sudo dnf install -y python3 python3-pip python3-virtualenv
    ;;

  centos|rhel)
    sudo yum install -y epel-release
    sudo yum install -y python3 python3-pip
    ;;

  almalinux|rocky)
    sudo dnf install -y python3 python3-pip
    ;;

  arch|manjaro)
    sudo pacman -Sy --noconfirm python python-pip
    ;;

  *)
    echo "❌ Distribuição não suportada: $DISTRO"
    exit 1
    ;;
esac

echo "✅ Python instalado:"
python3 --version
pip3 --version

echo "🚀 Agora você pode usar:"
echo "  python3"
echo "  pip3"
