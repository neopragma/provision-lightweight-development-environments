[top](../../README.md) =&gt; [Failures](../failures.md)

## CoreOS Container Linux - FAIL

I recall having tried CoreOS in the past and finding it to be hard to install and somewhat flakey, but small; and _small_ is one of the key objectives of this exercise. Checking it out again (April 2018), I learned it had been bought by Red Hat. 

The new owners have packaged it as "container Linux" with the idea of spinning up containerized instances in the cloud easily. This could be a good approach for a developer wanting to set up a lightweight environment to work in, so I wanted to try it. But I first try these distros in a locally-hosted VM, and not in the cloud.

Following [the documentation](https://coreos.com/os/docs/latest/), the first thing I tried was to boot the live ISO. This failed spectacularly, spewing more error messages of more different kinds than I have ever seen in a single execution of a program of any type since I started in this career in the 1970s. The result was overwhelming, and I didn't even attempt to diagnose the problems. 

Next, I looked into the "Installing to Disk" option. This appears to be a unique and unusual way of installing that requires you to work from a running instance of Linux to install CoreOS on a separate instance that is not currently active, by running a script hosted on Github. My work area is not set up that way (I'm experimenting via VMware Fusion on Mac OSX), so I was unable to try out this option. 

They also offer several ways to instantiate CoreOS Container Linux using PXE, iPXE, or deploying to any of five cloud providers. I don't have PXE and I'm not willing to invest that much time/effort just for the purpose of spinning up a development environment. In fact, the whole idea of this exercise is that the process of creating the environment must be easy and quick. "Enterprisey" solutions aren't aligned with the use case at hand.

The cloud-based implementations appear to be practical, including for purposes of this exercise, but the five providers listed on the site are all pay services, and I'm not willing to shell out money just to find out whether CoreOS will satisfy this single use case.

This was the 9th distro I tried pursuant to this exercise. Of the first 8, only 3 worked. That ratio gives me low confidence in _any_ distro that I try, and the low confidence makes me all the more unwilling to spend money on the experiment. If the thing will come up clean under VMware, then it will also come up clean on hardware or in a container or in a cloud-hosted VM. So let it come up clean for me under VMware for free, and then I'll work with it further. Don't ask me to sign up for services here and there and go through a lot of rigamarole only to see the product spew error messages like a broken water main.

On the plus side, it didn't take days of tedium just to bring the product to its failure point. It died a quick death.

Done.



