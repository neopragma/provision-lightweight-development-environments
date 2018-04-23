# Hypervisor 

## Definition

> "A hypervisor is a process that separates a computer’s operating system and applications from the underlying physical hardware. Usually done as software although embedded hypervisors can be created for things like mobile devices.

> "The hypervisor drives the concept of virtualization by allowing the physical host machine to operate multiple virtual machines as guests to help maximize the effective use of computing resources such as memory, network bandwidth and CPU cycles." (from [NetworkWorld](https://www.networkworld.com/article/3243262/virtualization/what-is-a-hypervisor.html))

## For our purposes

These guidelines are meant to help you set up a lightweight development environment on a virtual machine (VM) or small hardware device such as a single board computer (SBC). The VM may live on your desktop or laptop computer, on a server accessible to you on a local area network, or on a cloud provider such as AWS or Heroku. 

When the documentation says "any hypervisor," it means the guidelines are general enough to apply to any of the VM situations mentioned in the previous paragraph. The statement does not apply to installing the instance as the only OS on a hardware device.