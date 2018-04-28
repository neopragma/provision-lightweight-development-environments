[top](../../README.md) =&gt; [Failures](../failures.md)

# Redcore Linux: FAIL

Redcore is a relatively new player from Romania. They offer a good selection of applications on a user-friendly platform based on Gentoo Linux. The distro _looks_ very promising, and in a video review by [Derek Taylor](https://www.youtube.com/watch?v=Qya9atmGcoc) it actually appears to _work_. He walks through several of the programs that come bundled with Redcore, and it looks like a well-chosen selection of tools for practical desktop environment. It also seems to have a nice visual design.

But not all reviews are positive. [One in particular](https://sysdfree.wordpress.com/2018/02/25/178/) really rips into Redcore for messing up partitions on a machine that weren't allocated to it. 

My own experience with Redcore was this:

- The installer hung before it got very far into the process. After restarting the installation, the live iso did not respond; all I got was a black screen with a blinking cursor in the upper left-hand corner. Restarting the installation meant starting completely from scratch with a new copy of the iso.
- A screensaver started while the installer was running. (No idea why anyone would set up an installer with a timeout and screensaver.) The screensaver did not recognize the same username and password as the initial login screen. Therefore, it was not possible to continue the installation once the screensaver started.
- The installer requires a minimum of a 20GB hard drive. The first time I tried to install, I had defined a 20GB hard drive (via VMware Fusion), and it still complained. In the video, Derek mentions he defined a 22GB drive (via VirtualBox). On my second and third tries, I defined a 30GB virtual drive. The installer did not complain. Drives of that size are common, yet this seems an excessive requirement for a Linux install.
- Everything Redcore does takes an immensely long time; so much so that one wonders whether the thing has hung. It takes three or four minutes from the time the VM is started until you see anything that looks like a designed "screen" appear on the monitor. It takes 30-40 seconds from the time you click the "Install" icon until the installer comes up. I can't say how it behaves after installation, as I was never able to get through the installation process. 

Redcore _looked_ good enough for me to want to try it out, even though the purpose of this exercise is to build a _small footprint_, lightweight environment. Redcore is not that; it's meant to be a fully-featured desktop system suitable for general use. It comes with the option to use OpenBox instead of the default LXQt desktop, which is just what I want for this exercise. Its memory and disk requirements disqualify it for the minimal development environment experiment, but it could make a very nice general-purpose desktop system...if only it worked. 

I suppose it _can_ work, somehow, since Derek had it working; but it seems inconsistent and unreliable, as well as painfully slow. I tried three times to get through the install, with no luck. (Well, no _good_ luck, anyway.) I'm done.

