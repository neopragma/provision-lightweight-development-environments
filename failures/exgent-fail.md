[top](../../README.md) =&gt; [Failures](../failures.md)

## exGENT Gentoo: FAIL

I'm not sure how mature this distro is, as the website shows only 6 reviews and 84 total downloads. The wiki is empty, as if they used a site generator to produce the site and it provided a skeleton wiki section. I was unable to find any documentation. 

I tried bringing up the iso with VMware Fusion. It presented several boot options, but there is no explanation of what they mean. I chose the first one in the list. It brought up a login screen with a sports car background image. There was no indication of what login credentials to use.

I tried ```root``` with password ```root```. Initially, I thought it would be impossible to try to login, as the Tab key is not recognized. I hit Enter, thinking it would present an error message with a retry option, but instead it moved the cursor to the password field. Okay. The Principle of Least Astonishment comes to mind, for some reason. 

This took me into the LXQt graphical desktop environment.

It looked like a normal desktop system, but what is one expected to do at this point? Is there an installation procedure, or is this intended to be usable as-is?

I explored the UI and found that programs listed in the menu started normally. I changed the monitor resolution and put myself in a bind; the screen didn't fit my monitor and I couldn't reach the panel at the bottom of the display. I tried "restart" from VMware to see if the system would remember the new resolution or revert to the original.

At first it said "Boot failed, press any key to retry." Fortunately, the retry worked. The monitor resolution had reverted to the default. So, this was not an out-of-the-box distro, but a "live CD" option. 

I restarted again so I could try another boot option. I tried "Boot from first hard disk," and got "Failed to load COM32 file chain.c32". After a timeout period, it rebooted to the initial boot menu.

Couldn't think of much else to try at that point. I booted into the live environment and saved a file, then restarted again to see if the file was still there. I opened a terminal and ran

```shell
echo 'Here is some text.' > testfile.txt
```

Then I restarted via VMware. The file ```testfile.txt``` was not there. Unsurprising in view of the earlier monitor resolution change.

The desktop environment was far more responsive than the similar-looking Redcore distro, so I was loathe to give up on it too soon. I browsed around the live system looking for any sort of hint as to how to install. There was nothing. 

Searching through every page of the project home site, I noticed that not only the wiki section but also the discussion forum and issues sections are not populated. It looks like a nearly-empty boilerplate site template. I noticed a single reference to an external soure of information: [http://exgent.exton.net](http://exgent.exton.net).

In a not-very-clear way, that article suggested running the following sequence of commands. 

```shell
emerge --sync
emerge --oneshot portage
emerge --ask --update --newuse --deep --with-bdeps=y @world
emerge --depclean
revdep-rebuild 
```

The ```emerge --sync``` command ran for about 20 minutes, spewing ```no space left on device``` and ```content ignored from this failed directory``` hundreds and hundreds of times.

The ```emerge --oneshot portage``` command responded with ```!!! Your current profile is invalid``` and so forth. 

Obviously there was no need to continue, but I tried the next command anyway just in case the previous messages were bogus.

The ```emerge --ask``` command got ```!!! Your current profile is invalid``` etc.

The ```emerge --depclean``` command got ```!!! Your current profile is invalid``` etc.

The ```revdep-rebuild``` command got ```command not found```.

FAIL.