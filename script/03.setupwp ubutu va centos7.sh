#!/bin/bash

# khai bao bien
domain=hongson2.xyz
dbhost=localhost
dbname=boylangson
dbuser=boylangson
dbpass=daylamatkhau
install_path=/var/www/$domain/

# Help
show_help(){
    echo "
    -h  --help              show this help
    -d  --domain            domain name of site (default: zaraoder.xyz)
    -dh --dbhost            database host (default: localhost)
    -n  --dbname            database name (default: wordpress)
    -u  --dbuser            database user (default: wordpress)
    -p  --dbpass            database password (default: random)
    -ip --install_path      path to install wordpress (default: /var/www/domain)
    "
}

# Update he thong ubuntu
update_ubuntu(){
    apt update

}
# Install php ubuntu
install_php_ubuntu(){
    apt-get install -y php php-mysql
}

# Insall mysql ubuntu
install_mysql_ubuntu(){
    apt-get install -y mysql-server
    systemctl enable mysql
    systemctl start mysql

}

# Install apache unbutu
install_apache_ubuntu(){
    apt-get install -y apache2
    systemctl enable apache2
    systemctl start apache2
    
    ufw allow http
    ufw allow https
    ufw reload
}

# Create virtual host for wordpress site ubuntu
config_virtualhost_ubuntu(){
    echo "
<VirtualHost *:80>
    ServerName ${domain}
    ServerAlias www.${domain}
    ServerAdmin admin@${domain}
    DocumentRoot ${install_path}
    <Directory ${install_path}>
        Allowoverride all
    </Directory>
    ErrorLog    ${install_path}error.log
    CustomLog   ${install_path}access.log combined
</VirtualHost>"  > /etc/apache2/sites-available/${domain}.conf
}

# Create database and user ubuntu
config_database_ubuntu(){
    mysql -u root -e "CREATE DATABASE $dbname"
    mysql -u root -e "CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$dbpass'"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'localhost'"
}


# Configure wordpress ubuntu
config_wordpress_ubuntu(){
    cd /tmp
    wget http://wordpress.org/latest.tar.gz -O wordpress.tar.gz
    tar -zxvf wordpress.tar.gz

    cp wordpress/wp-config-sample.php wordpress/wp-config.php
    sed -i "s/database_name_here/$dbname/g" wordpress/wp-config.php
    sed -i "s/username_here/$dbuser/g" wordpress/wp-config.php
    sed -i "s/password_here/$dbpass/g" wordpress/wp-config.php
    sed -i "s/localhost/$dbhost/g" wordpress/wp-config.php

    mkdir wordpress/wp-content/uploads
    chmod 775 wordpress/wp-content/uploads

    if [ ! -d $install_path ]; then
        mkdir $install_path
    fi
    mv wordpress/* $install_path
    chown -R www-data:www-data $install_path
}

# Goi cac ham tu tren xuong ubuntu 
install_wordpress_ubuntu(){
  update_ubuntu
  install_php_ubuntu
  install_mysql_ubuntu
  install_apache_ubuntu
  config_wordpress_ubuntu
  config_database_ubuntu
  config_virtualhost_ubuntu
  a2ensite $domain
  systemctl reload apache2
}

# File cau hinh Virtual host apache
create_forder_centos7(){
	yum update -y 
	file=/etc/httpd/sites-available/
	if [ -d "$file" ]; then
		echo "$file thu muc da ton tai."
	else  
		mkdir -p $file
	fi

	fileb=/etc/httpd/sites-enabled/
	if [ -d "$fileb" ]; then
		echo "$fileb thu muc da ton tai."
	else
		mkdir -p $fileb
	fi

}
# Install php
install_php_centos7(){
    yum install -y php php-mysql
}

#Install mysql
install_mysql_centos7(){
    yum -y install mariadb mariadb-server
    systemctl enable mariadb
    systemctl start mariadb
}

#Install apache
install_apache_centos7(){
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd
    
#    ufw allow http
#    ufw allow https
#    ufw reload
}

# Create virtual host for wordpress site
config_virtualhost_centos7(){
    echo "
<VirtualHost *:80>
    ServerName ${domain}
    ServerAlias www.${domain}
    ServerAdmin admin@${domain}
    DocumentRoot ${install_path}
    <Directory ${install_path}>
        Allowoverride all
    </Directory>
    ErrorLog    ${install_path}error.log
    CustomLog   ${install_path}access.log combined
</VirtualHost>"  > /etc/httpd/sites-available/${domain}.conf
    sudo ln -s /etc/httpd/sites-available/${domain}.conf /etc/httpd/sites-enabled/${domain}.conf
	echo "
	IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf
}

# Create database and user
config_database_centos7(){
    mysql -u root -e "CREATE DATABASE $dbname"
    mysql -u root -e "CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$dbpass'"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'localhost'"
}

# Configure wordpress
config_wordpress_centos7(){
    cd /tmp
    wget http://wordpress.org/latest.tar.gz -O wordpress.tar.gz
    tar -zxvf wordpress.tar.gz

    cp wordpress/wp-config-sample.php wordpress/wp-config.php
    sed -i "s/database_name_here/$dbname/g" wordpress/wp-config.php
    sed -i "s/username_here/$dbuser/g" wordpress/wp-config.php
    sed -i "s/password_here/$dbpass/g" wordpress/wp-config.php
    sed -i "s/localhost/$dbhost/g" wordpress/wp-config.php

#    mkdir wordpress/wp-content/uploads
#    chmod 775 wordpress/wp-content/uploads

    if [ ! -d $install_path ]; then
        mkdir $install_path
    fi
    mv wordpress/* $install_path
#    chown -R www-data:www-data $install_path
}

# install wordpress
install_wordpress_centos7(){
    create_forder_centos7
    install_php_centos7
    install_mysql_centos7
    install_apache_centos7

    config_wordpress_centos7
	config_virtualhost_centos7
    config_database_centos7

    service httpd restart
}

# 
while :; do
    case $1 in
        -h|-\?|--help)
            show_help
            exit ;;
        
        -d|--domain)
            if [ '$2' ]; then
                domain=$2; install_path=/var/www/$domain/; shift
            else
                die 'ERROR: "--domain" requires a non-empty option argument.'
            fi ;;
        --domain=?*)
            domain=${1#*=} ;;
        --domain=)
            die 'ERROR: "--domain" requires a non-empty option argument.' ;;
        
        -dh|--dbhost)
            if [ '$2' ]; then
                dbhost=$2; shift
            else
                die 'ERROR: "--dbhost" requires a non-empty option argument.'
            fi ;;
        --dbhost=?*)
            dbhost=${1#*=} ;;
        --dbhost=)
            die 'ERROR: "--dbhost" requires a non-empty option argument.' ;;
        
        -n|--dbname)
            if [ '$2' ]; then
                dbname=$2; shift
            else
                die 'ERROR: "--dbname" requires a non-empty option argument.'
            fi ;;
        --dbname=?*)
            dbname=${1#*=} ;;
        --dbname=)
            die 'ERROR: "--dbname" requires a non-empty option argument.' ;;

        -u|--dbuser)
            if [ '$2' ]; then
                dbuser=$2s; shift
            else
                die 'ERROR: "--dbuser" requires a non-empty option argument.'
            fi ;;
        --dbuser=?*)
            dbuser=${1#*=} ;;
        --dbuser=)
            die 'ERROR: "--dbuser" requires a non-empty option argument.' ;;
        
        -p|--dbpass)
            if [ '$2' ]; then
                dbpass=$2; shift
            else
                die 'ERROR: "--dbpass" requires a non-empty option argument.'
            fi ;;
        --dbpass=?*)
            dbpass=${1#*=} ;;
        --dbpass=)
            die 'ERROR: "--dbpass" requires a non-empty option argument.' ;;

        -ip|--install_path)
            if [ '$2' ]; then
                install_path=$2; shift
            else
                die 'ERROR: "--install_path" requires a non-empty option argument.'
            fi ;;
        --install_path=?*)
            install_path=${1#*=} ;;
        --install_path=)
            die 'ERROR: "--install_path" requires a non-empty option argument.' ;;
        *)
            break ;;
    esac
    shift
done


# chuong trinh
set -e
OS=""

if cat /etc/*release | grep CentOS > /dev/null 2>&1; then
    OS="CentOS"

elif cat /etc/*release | grep ^NAME | grep Ubuntu > /dev/null 2>&1; then
    OS="Ubuntu"

else
    echo "Script doesn't support or verify this OS type/version"
    exit 1;
fi 

if [[ $OS == "CentOS" ]]; then 
    install_wordpress_centos7
elif [[ $OS == "Ubuntu" ]]; then 
    install_wordpress_ubuntu
fi
