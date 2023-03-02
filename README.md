# Lab 2: Linux permissions
By Luis Daniel Casais Mezquida  
Cybersecurity Engineering 22/23  
Bachelor's Degree in Computer Science and Engineering, grp. 89  
Universidad Carlos III de Madrid

# Project statement
The goal of this lab is to learn how the Linux permission system works and what tools are available to administer user permissions. To do the lab, you will need a Linux machine with a root account that you control.

1. Create 3 user accounts (`user1`, `user2`, `user3`). Use the command useradd, but read the man page of `useradd` and `adduser` and check the differences between them. What is the UID and GID for these accounts?
2. Create 2 groups (`gr1` and `gr2`) with `groupadd` (or `addgroup`). What is the GID for these groups?
3. Read the man page of the command `usermod`. Then:
    1. Add `user1` to the group `gr1`.
    2. Add `user2` to the group `gr2`.
    3. List the groups that the three new users belong to.
4. Do the following:
    1. Log in as `user1` and copy the program `/bin/ls` to your home directory as `myls`.
    2. Change the ownership of `myls` to `user1` and the permissions to `0710`. What does this permission mask mean?
    2. Log in as `user2` and try to run `/home/user1/myls` to list your own directory. Does it work? Why?
    3. Create a new group lab. Add `user1` and `user2` to lab. Change the owner group of `myls` to `lab` and try again to run `myls` from `user2`’s account. Does it work? Why?
5. Do the following:
    1. Create a directory in `/home` called `lab-text`.
    2. Change the group ownership `/home/lab-text` to `lab`.
    3. Ensure the permissions of `/home/lab-text` allow group members to create and delete files.
    4. Ensure the permissions of `/home/lab-text` forbid others from accessing its files.
    5. Log in as `user1` and create a file named `user1file.txt` in `/home/lab`. Determine `user2`’s permissions to access and/or modify the newly created file.
    6. Log in as `user2` and change the umask (command `umask`) so that new files are created with read-only access for the group and no access for other users.
6. Do the following:
    1. Log in as `user3` and create a file `foo.txt` in your local folder.
    2. Make sure that no one except `user3` can access `user3`’s home directory.
    3. Copy the program `/bin/ls` to `/tmp/myls` and change the user and group ownership to `user3`. Make sure that everyone can execute this command.
    4. Log in as `user1`. Run `/tmp/myls` to list the contents of `user3`’s home directory. Does it work? Why?
    5. Make possible for everyone running `/tmp/myls` to list the contents of `user3`’s home directory without changing the permissions of the directory.
7. ACLs:
    1. Add `user3` to the `lab` group. Now the three users are members of this group.
    2. Logged in as `user3`, create a file `bar.txt` in the `/tmp/lab-text` directory. Change the group ownership to `lab`. Check that `user1` and `user2` can read the file.
    3. Use the `setfacl` command to prevent `user1` from reading `bar.txt`. Check the mask value. Has it changed? Why?

# Installation and execution
Install ACLs. For apt:
```bash
sudo apt install acl
```

```bash
bash script.sh
```
