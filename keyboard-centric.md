[top](http://github.com/neopragma/provision-lightweight-development-environments)

# Command-line and keyboard orientation

In principle, you don't need a graphical environment at all to use this setup. You have six ttys so you can have up to six command lines open at a time, and the NeoVim editor feels very much like a full-screen graphical editor. It can open a terminal panel and you can also enter individual commands from within the editor. (You could do the same with Emacs. I didn't. No particular reason.)

In reality, you will probably need a GUI environment for _something_, even if only a Web browser to look up technical information as you work, but also for checking your work if your application is graphical. When you customize one of the base instances, you may wish to add various other graphical programs, as well. The base configuration includes X window support and a lightweight terminal emulator.

The concept is you will rely on command-line build tools and shell scripts to deal with project metadata, dependencies, compilation, test execution, and so forth rather than depending on IDE features; tools like make, npm, rake, maven, gradle, sbt, dotnet, ghci, etc. This keeps the setup simple while enabling you to work with a wide variety of languages through a single text editor. You can add graphical tools as needed, such as Web browsers or testing tools like SoapUI or Postman.

I know quite a few developers who take great pride in using the keyboard and avoiding the mouse. Modern IDEs ship with key bindings already defined for many common functions, and you can configure them to support even more. But it's an afterthought. IDEs are fundamentally graphical applications. Old-school editors like Vim and Emacs were built from the ground up for keyboard use. Mouseless work feels more natural with them than it ever could with an IDE. So, those very developers ought to be happy to work with a setup like this. 