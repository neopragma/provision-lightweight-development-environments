[top](README.md)

# Watch progress of the bootstrap script

Provisioning begins with a bash script that you run on a clean install. The script prepares the environment to run Chef, installs Chef DK, and starts chef-client to complete the process.

If you want to watch progress you can tail the output. After you complete the manual step to clone the git repository, use ctrl-alt-F2 to switch to tty2. Use ctrl+alt+F1 and F2 to switch between the two. 

Log in as ```root ``` in both tty1 and tty2. 

In tty1:

```shell 
cd bootstrap-centos-7-dev-base 
touch bootstrap.out 
```

In tty2:

```shell 
cd bootstrap-centos-7-dev-base 
tail -f bootstrap.out 
```

In tty1:

```shell 
./bootstrap 2>&1> bootstrap.out 
```

Then you can watch for errors in tty2.



