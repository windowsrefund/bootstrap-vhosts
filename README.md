```
angel:~/projects/bootstrap-vhosts master *> >>> ./build.sh tcp://relvpc22:4243

Uploading context 243.7 kB
Uploading context 
Step 0 : from tianon/debian:wheezy
 ---> 2ccbf46862c0
Step 1 : maintainer Adam Kosmin
 ---> Running in 9385d7e6b174
 ---> e5f7b4ed963b
Step 2 : RUN apt-get update && apt-get -y install puppet
 ---> Running in 2f7cb94d1eab
 ---> 8f78ae46d003
Step 3 : ENV APACHE_RUN_USER www-data
 ---> Running in 2bf8cc4759e8
 ---> ef9ddb6d83d8
Step 4 : ENV APACHE_RUN_GROUP www-data
 ---> Running in 278425b4ac73
 ---> 637f30b7811c
Step 5 : ENV APACHE_LOG_DIR /var/log/apache2
 ---> Running in 3911c04773ee
 ---> 78c7136b5ad4
Step 6 : ADD puppet /root/puppet
 ---> 3c2defb26f70
Successfully built 3c2defb26f70
Removing intermediate container 9385d7e6b174
Removing intermediate container 2f7cb94d1eab
Removing intermediate container 2bf8cc4759e8
Removing intermediate container 278425b4ac73
Removing intermediate container 3911c04773ee
Removing intermediate container 77e18af8d87a
Wating for container cc4cc2dd48f3
0
Committing changes and shutting down container cc4cc2dd48f3
75023aa1a6038bc91d47880fd7f7a82fbe996a42317fd34b2ce1f667ac4b56a6
cc4cc2dd48f3
cc4cc2dd48f3
Run finished product... 5c86dbf51e210a64ddea91351de555b2ce2f1717eef7bb11e290e51aee317f9d
OK
```


