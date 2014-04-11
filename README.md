```
angel:~/projects/bootstrap-vhosts master *= >>> ./build.sh tcp://relvpc22:4243
Uploading context 259.1 kB
Uploading context 
Step 0 : from tianon/debian:wheezy
 ---> 2ccbf46862c0
Step 1 : maintainer Adam Kosmin
 ---> Running in debeb31cb91b
 ---> 426f8043abc7
Step 2 : RUN apt-get update && apt-get -y install puppet
 ---> Running in 519c403259d6
 ---> 35546f3aa745
Step 3 : ENV APACHE_RUN_USER www-data
 ---> Running in 5c1433e651c8
 ---> e086b763f99b
Step 4 : ENV APACHE_RUN_GROUP www-data
 ---> Running in d9620a194920
 ---> 1fba7d2be4d2
Step 5 : ENV APACHE_LOG_DIR /var/log/apache2
 ---> Running in 3f34c474ae62
 ---> 4e2abc04e333
Step 6 : ADD puppet /root/puppet
 ---> df864e8c7aa0
Successfully built df864e8c7aa0
Removing intermediate container debeb31cb91b
Removing intermediate container 519c403259d6
Removing intermediate container 5c1433e651c8
Removing intermediate container d9620a194920
Removing intermediate container 3f34c474ae62
Removing intermediate container 5c6fd9a7ca8c
Wating for container 4e73b43a324e
0
Committing changes and shutting down container 4e73b43a324e
2206986b5809016db77ae52952fffb206a6ccc4b0a47884d438add1ae6c20659
4e73b43a324e
4e73b43a324e
Run finished product... 7fa6944ebee8b70545d8977f6925e6a74f6d4100f0f30c64ba6af138502cabf2
OK
```

So what do we have?

```
angel:~/projects/bootstrap-vhosts master *= >>> sudo docker -H tcp://relvpc22:4243 ps
CONTAINER ID        IMAGE                         COMMAND                CREATED             STATUS              PORTS                                    NAMES
7fa6944ebee8        windowsrefund/apache:latest   /usr/sbin/apache2 -D   5 minutes ago       Up 2 minutes        0.0.0.0:80->80/tcp, 0.0.0.0:81->81/tcp   hopeful_shockley
```

Any love?

```
angel:~/projects/bootstrap-vhosts master *= >>> curl relvpc22:81
<html>
  <head></head>
  <body>
    Hello World!
  </body>
</html>
```

OK!

```
angel:~/projects/bootstrap-vhosts master *= >>> curl relvpc22:80
<html><body><h1>It works!</h1>
<p>This is the default web page for this server.</p>
<p>The web server software is running but no content has been added, yet.</p>
</body></html>
```

Boo!!

