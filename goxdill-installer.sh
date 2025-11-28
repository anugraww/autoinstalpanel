#!/data/data/com.termux/files/usr/bin/bash

# =========================================
#  GOXDILL • UNIVERSAL SERVER INSTALLER
#  Pterodactyl • WHM/cPanel
#  Termux Edition
# =========================================

# ----------- UI CONFIG ------------
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
C='\033[1;36m'
P='\033[1;35m'
W='\033[1;37m'
NC='\033[0m'

banner() {
    clear
    echo -e "${C}"
    echo "██████╗  ██████╗ ██╗  ██╗██████╗ ██╗██╗     ██╗     "
    echo "██╔══██╗██╔═══██╗██║ ██╔╝██╔══██╗██║██║     ██║     "
    echo "██████╔╝██║   ██║█████╔╝ ██████╔╝██║██║     ██║     "
    echo "██╔══██╗██║   ██║██╔═██╗ ██╔═══╝ ██║██║     ██║     "
    echo "██║  ██║╚██████╔╝██║  ██╗██║     ██║███████╗███████╗"
    echo "╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝"
    echo -e "${P}                 GOXDILL INSTALLER${NC}"
}

# ----------- AUTO INSTALL MODULE TERMUX ------------
echo -e "${G}🔧 Installing Termux dependencies...${NC}"
pkg update -y >/dev/null 2>&1
pkg install openssh curl jq -y >/dev/null 2>&1

# ----------- MENU ------------
menu() {
    banner
    echo -e "${Y}1.${W} Auto Install Pterodactyl Panel"
    echo -e "${Y}2.${W} Auto Install WHM/cPanel"
    echo -e "${Y}3.${W} Exit"
    echo -ne "\n${C}Pilih menu: ${NC}"
    read menu
    case $menu in
        1) pteroMenu ;;
        2) whmMenu ;;
        3) exit ;;
        *) menu ;;
    esac
}

# ----------- VPS INPUT FORM ------------
inputVPS() {
    echo -ne "${C}IP VPS: ${NC}"
    read VPS_IP
    echo -ne "${C}Username VPS (root): ${NC}"
    read VPS_USER
    echo -ne "${C}Password VPS: ${NC}"
    read VPS_PASS
}

sshRun() {
    sshpass -p "$VPS_PASS" ssh -o StrictHostKeyChecking=no $VPS_USER@$VPS_IP "$1"
}

# ----------- PTERODACTYL INSTALLER ------------
pteroMenu() {
    banner
    echo -e "${G}🟦 INSTALL PTERODACTYL PANEL${NC}"
    inputVPS

    echo -e "${Y}\n⏳ Menginstall Pterodactyl di VPS...${NC}"

    sshRun "
        dnf update -y || yum update -y
        dnf install curl wget git tar -y || yum install curl wget git tar -y
        bash <(curl -s https://pterodactyl-installer.se)
    "

    echo -e "${G}\n🎉 Pterodactyl berhasil dipasang!${NC}"
    echo -e "${W}Akses: http://$VPS_IP${NC}"
    exit
}

# ----------- WHM INSTALLER ------------
whmMenu() {
    banner
    echo -e "${G}🟪 INSTALL WHM/cPanel${NC}"
    inputVPS

    echo -e "${Y}\n⏳ Menginstall WHM di VPS...${NC}"

    sshRun "
        dnf update -y || yum update -y
        dnf install perl curl -y || yum install perl curl -y
        cd /home
        curl -o latest -L https://securedownloads.cpanel.net/latest
        sh latest
    "

    echo -e "${G}\n🎉 WHM Selesai diinstall!${NC}"
    echo -e "${W}Login: https://$VPS_IP:2087${NC}"
    exit
}

menu
