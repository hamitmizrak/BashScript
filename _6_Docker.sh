#! /bin/bash
echo "VS CODE"

# User Variable
UPDATED="Güncelleme"
CLEANER="Temizleme"
INSTALL="Yükleme"
DELETED="Silme"
WHICH="Nerede ?"
COMMONINFORMATION=" Genel Bilgiler"
LOGIN="Docker Login"
DOKCER_PULL="Docker Pulling"

# System Variable

# Updated
sleep 2
echo -e "\n### ${UPDATED} ###"
read -p "Güncelleme istiyor musunuz  E/H ?" updatedResult
if [[ $updatedResult == "E" || $updatedResult == "e"  ]]
then
    echo -e "Güncelleme Başlandı... "  
    sudo apt-get update && sudoa apt-get upgrade -y
else
     echo -e "apt-get Update List Güncelleme Yapılmadı!!!\n "   
fi


# Common
sleep 2
echo -e "\n### ${COMMONINFORMATION} ###"
read -p "Genel Bilgiler istiyor musunuz  E/H ?" commonResult
if [[ $commonResult == "E" || $commonResult == "e"  ]]
then
    echo -e "Genel Bilgiler Başlandı... "  
    echo -e "Ben Kimim ... "  
    sudo whoami
    echo -e "IP ... " 
    sudo ifconfig
    echo -e "Portlar ... " 
    sudo netstat -nlptu
    echo -e "Ram ... " 
    sudo free -m
else
     echo -e "Genel Bilgiler Gösterilmediı!!!\n "   
fi

# DOCKER
sleep 2
echo   -e "\n###### DOCKER ######"
read -p "DOCKER Yükleme istiyor musunuz? E / H " installingResult
if [[ $installingResult == "E"  ||  $installingResult == "e" ]]
then
	# Java
	echo   -e "\n###### DOCKER"  $INSTALL "######"
	echo   -e "\n######"  $WHICH "######"
     which maven
	which java
	which git
	sudo apt-get update
	java -version
     git -v
     maven -v
     
     # Eğer önceden Docker varsa sil
     sudo apt-get purge docker-ce docker-ce-cli containerd.io -y
     sudo rm -rf /var/lib/docker
     sudo rm -rf /var/lib/containerd
     sudo apt-get clean
     sudo apt-get autoremove -y
     sudo apt-get update
     sudo apt-get remove docker docker-engine docker.io containerd runc
     sudo apt-get update
     sudo apt-get upgrade

     ### HTTPS üzerinden bir depo kullanmasına izin vermek için##################################
     sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

     ### Docker’ın resmi GPG anahtarını ekleyiniz. curl aracı ile GPG anahtarını komut içerisine aktarınız
     sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
     sudo apt-key fingerprint 0EBFCD88

     ### curl aracı ile Docker apt deposunu eklemek
     sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

     ###############DOCKER KURULUMU##########################################
     sudo apt-get update
     sudo apt-get install docker-ce docker-ce-cli containerd.io -y

     sudo systemctl status docker
     sudo systemctl enable --now docker 
     sudo systemctl start docker
     sudo systemctl status docker

     ### kullanıcı adınızı docker grubuna ekle
     sudo usermod -aG docker ${USER}

     su - ${USER}
     sudo  id -NG
     sudo apt-get install bash-completion 
     docker version
     docker run hello-world
else 
    echo -e "Docker Güncelleme Yapılmadı!!!\n "
fi 


# Docker Login
sleep 2
echo -e "\n### ${LOGIN} ###"
echo -e "\nDockerHub'a Giriş yapmak istiyor musunuz ? E/H" loginResult
if [[ $loginResult == "E" || $loginResult == "e"  ]]
then
    echo -e "Docker Login ... "  
    sudo docker login
else
     echo -e "Docker Login yapılmadı Yapılmadı!!!\n "   
fi

# Docker Login
sleep 2
echo -e "\n### ${LOGOUT} ###"
echo -e "\nDockerHub'a Çıkış yapmak istiyor musunuz ? E/H" logoutResult
if [[ $logoutResult == "E" || $logoutResult == "e"  ]]
then
    echo -e "Docker Logout ... "  
    sudo docker logout
else
     echo -e "Docker Logout yapılmadı Yapılmadı!!!\n "   
fi


# Docker Pull
sleep 2
echo -e "\n### ${DOKCER_PULL} ###"
echo -e "\nDockerHub'a Pull yapmak istiyor musunuz ? E/H" pullingResult
if [[ $pullingResult == "E" || $pullingResult == "e"  ]]
then
    echo -e "Docker Pulling ... "  
    sudo docker pull nginx
    sudo docker pull httpd
    sudo docker pull mysql
    sudo docker pull mongo
    sudo docker pull ubuntu
    sudo docker pull centos
else
     echo -e "Docker Pulling yapılmadı Yapılmadı!!!\n "   
fi

# Temizleme
sleep 2
echo -e "\n### ${CLEANER} ###"
echo -e "\nSistem Temizliği istiyor musunuz ? E/H" cleanResult
if [[ $cleanResult == "E" || $cleanResult == "e"  ]]
then
    echo -e "Temizlik Başlandı... "  
    sudo apt-get clean
    sudo apt-get autoremove -y
else
     echo -e "Temizlik Yapılmadı!!!\n "   
fi


# SİLMEK
sleep 2
echo -e "\n### ${DELETED} ###"
echo -e "\nMAven Dosyasını Silmek istiyor musunuz ? E/H" deletedResult
if [[ $deletedResult == "E" || $deletedResult == "e"  ]]
then
    echo -e "Temizlik Başlandı... "
    sudo rm -f apache-maven-3.6.3-bin.tar.gz
    sudo apt-get clean
    sudo apt-get autoremove -y
else
     echo -e "Temizlik Yapılmadı!!!\n "   
fi