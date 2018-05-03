## Funtoo tarball rant

You'd think downloading a file would be the single easiest step in this process. No such luck. The details of your system may differ, but the information in this section reflects the steps I took to download the correct tarball. 

Visit the [Funtoo subarches page](https://www.funtoo.org/Subarches). To choose the correct download, you need to know the processor model. In my case, the ```lscpu``` command showed I was running on an Intel i7. 

I followed the link for ```64-bit Intel Processors```. That opened a list of Intel processors with their _code names_. There's no way to associate these "code names" with the details returned by the ```lscpu``` command other than to eyeball things and try to associate similar-looking words. 

The output from ```lscpu``` does not include a code name. I did an Internet search for the processor model, "Intel i7-4650U", and found this page on Intel's site: [Intel Core i7-4650U Processor](https://ark.intel.com/products/75114/Intel-Core-i7-4650U-Processor-4M-Cache-up-to-3_30-GHz). Information about the i7-4650U is shown there along with the code name, "Products formerly Haswell".

It was unclear whether this was a match; the only word in common was "haswell," and it was not an exact match. The Funtoo site doesn't mention "formerly" haswell. 

Guessing that this might be the correct choice, based on cryptic information discovered by roundabout means, I returned to the subarches page and selected "Intel64-haswell". That led to [this page](https://www.funtoo.org/Intel64-haswell) on the Funtoo site. 

The page listed several downloads, and also contained information about CHOST, CFLAGS, and CPU_FLAGS settings. I decided to keep that page open in a browser tab, as it looked like information I might require later. (As it turned out, I didn't need it.)

I chose the download from funtoo.org for _build_ ```funtoo-current``` and _variant_ ```standard```. Rather than clicking on it to download it, we are advised to copy the link address and use ```wget``` to download it directly to the live iso instance we have running. 

The link for my choice was ```http://build.funtoo.org/funtoo-current/x86-64bit/intel64-haswell/2018-04-24/stage3-intel64-haswell-funtoo-current-2018-04-24.tar.xz``` as of the day this was written. Your link may differ. Unfortunately, copy and paste didn't work for me to put the URL into the command line of the iso instance. I had to type it.

```shell
cd /mnt/funtoo
wget http://build.funtoo.org/funtoo-current/x86-64bit/intel64-haswell/2018-04-24/stage3-intel64-haswell-funtoo-current-2018-04-24.tar.xz
``` 

Neither that URL nor the one for the osuosl.org source ```http://ftp.osuosl.org/pub/funtoo/funtoo-current/x86-64bit/intel64-haswell/2018-04-24/stage3-intel64-haswell-funtoo-current-2018-04-24.tar.xz``` worked. Both got 404 errors (not found).

I tried the "browse mirror" link (also on the [Funtoo Intel64-haswell page](https://www.funtoo.org/Intel64-haswell) and found ```https://build.funtoo.org/funtoo-current/x86-64bit/intel64-haswell/stage3-latest.tar.xz```. Typing that into the ```wget``` command, I finally got something to download. 

It turned out to be the correct tarball, but at the time I wasn't sure and the uncertainty was stressful. There's enough legitimate uncertainty in this process on the merits, without adding unnecessary uncertainty via confusing documentation and broken links. 

Just sayin'.
