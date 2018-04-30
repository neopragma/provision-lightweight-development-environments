[Top](https://github.com/neopragma/provision-lightweight-development-environments) =&gt; [Failures](../failures.md)

## Mabox: FAIL

Mabox is a "spin" on Manjaro Linux that uses OpenBox as the window manager. It appears to be very close to the configuration we're aiming for as a lightweight development environment. It could have been The Answer for this exercise, even without much additional configuration. 

For that reason, I spent about one full day trying to resolve the various issues I encountered. Ultimately I had to concede that Mabox simply will not boot at all most of the time. When I could get it to boot, half the software installed on it was dead. There were all kinds of different things wrong. The terminal emulator would not start. Conky disappeared. 

Tellingly, the first several messages on the user forum have to do with installation links not working and the calamares installer not working. The complete text of the best answer from the Mabox team reads as follows:

Please try to run from terminal:

```
sudo calamares
```

That was the first indication I saw of how to install the system. I tried that in hopes I could navigate through the command-line installation by reading whatever error messages came up. 

This started the graphical calamares installer, as many distros use. A positive sign. 

The experience for this portion of the installation was very similar to that for Manjaro, except the installer skipped the "are you sure?" dialog before starting to format the virtual drive. The installation takes slightly less time than Manjaro. That's understandable, as we aren't installing the XFCE desktop.

There are warnings from users online not to use any of the graphical methods of updating the system. You must do updates via the command line, or you will break the system. Apparently, that is not the only problem with this distro.

After doing an install, Mabox will never boot. It will always hang just after the message stating /dev/sda is clean. I was unable to find any help with this issue. 

There are videos on YouTube that walk you through Mabox's features. It appears to work just fine. However, that is the "live" system on the iso; it is not an "installed" instance of Mabox. I have not seen an installed instance of Mabox that would boot. 






