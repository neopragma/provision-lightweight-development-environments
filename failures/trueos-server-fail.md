[top](http://github.com/neopragma/provision-lightweight-development-environments)

# TrueOS Server: FAIL

[TrueOS](https://web.trueos.org) is a user-friendly packaging of FreeBSD Unix. I downloaded the server version of the product with the intention of adding a lightweight display manager and Vim or NeoVim (depending on availability). I didn't get that far.

The installation process offers several shells. I chose bash. After logging in as root, I discovered bash is not even installed. Why does it offer bash as a shell, then? Stupid.

I was never able to configure network support. After following all available instructions on the website and several answers to similar questions on forums, the system never recognized the gateway address. The ```ifconfig``` command indicated an Ethernet connection existed; that would be the virtual connection to VMware Fusion. 

At one point I rebooted the VM. VMware Fusion could not restart it. The error message asked if VMware Fusion had been installed correctly. I thought that was pretty suspicious. I tried starting a couple of VMs that had been working before, and everything was broken. VMware Fusion could not start _any_ VM. 

I rebooted the Mac and that cleared up the error, whatever it was. But of course I did not restart TrueOS. Somehow, a VM had broken the host system. I've never seen or heard of that happening before.

I still wanted to try TrueOS. I tried the desktop edition next. Whatever happened is documented either here among the failure reports or on the README alongside the successes. But TrueOS Server is on my shit list from now on. 

TrueOS == FalseOS.
