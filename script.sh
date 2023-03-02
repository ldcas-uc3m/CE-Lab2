#!/bin/bash

id

su user1
newgrp

chown
chgrp


# --------
# ACTIVITY 1
# --------

# create users (with home dir)
sudo useradd -m user1
sudo useradd -m user2
sudo useradd -m user3

# set passwords (no passwords)
sudo passwd -d user1
sudo passwd -d user2
sudo passwd -d user3

# check ids
id user1  # uid=1001, gid=1002
id user2  # uid=1002, gid=1003
id user3  # uid=1003, gid=1004


# --------
# ACTIVITY 2
# --------

# create groups
sudo groupadd grp1
sudo groupadd grp2

# check ids
cat /etc/group | grep grp1  # gid=1005
cat /etc/group | grep grp2  # gid=1006


# --------
# ACTIVITY 3
# --------

# add users to group
sudo usermod user1 -g grp1
sudo usermod user2 -g grp2

# check it worked
id user1
id user2
id user3



# --------
# ACTIVITY 4
# --------

# login as user1
su user1
# copy ls
cp /bin/ls ~/myls
# change permissions
chown user1 myls
chmod 0710 myls
# logout
exit

# login as user2
su user2
cd ~
/home/user1/myls  # permission denied
exit

# create group lab
sudo groupadd lab
# add users to group
sudo usermod user1 -g lab
sudo usermod user2 -g lab
# change group of myls
sudo chgrp lab /home/user1/myls

# run again as user2
su user2
cd ~
/home/user1/myls  # good
exit


# --------
# ACTIVITY 5
# --------

# create dir
sudo mkdir /home/lab-text
# change permissions
sudo chgrp lab /home/lab-text
sudo chmod 770 /home/lab-text
# create file
su user1
touch /home/lab-text/user1file.txt
# check
ls /home/lab-text/user1file.txt  # -rw-r--r--
exit
# change umask
su user2
umask 0026  # default is 0666, so set umask 0006 so default permissions for user2 are -rw-rw---- (0666-0026=0640)
# check
touch /home/lab-text/user2file.txt
ls -l /home/lab-text/user2file.txt  # -rw-r-----


# --------
# ACTIVITY 6
# --------

su user3
# create file
touch ~/foo.txt
# check permissions
ls -l /home | grep user3  # drwxr-x---
# change permissions
chmod 0700 /home/user3
ls -l /home | grep user3  # drwx------

# TODO: c)


# --------
# CLEAN
# --------

sudo userdel -r user1
sudo userdel -r user2
sudo userdel -r user3

sudo groupdel user1
sudo groupdel user2
sudo groupdel grp1
sudo groupdel grp2
sudo groupdel lab


