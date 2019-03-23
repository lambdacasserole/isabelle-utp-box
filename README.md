# Isabelle/UTP Box
Ubuntu 18.04 Bionic Beaver with Isabelle/UTP installed and ready to go.

## Prerequisites
You'll need [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed as well as [Vagrant](https://www.vagrantup.com/downloads.html).

### Plugins
You'll need the `vagrant-reload` plugin because the box needs a restart after provisioning, and the `vagrant-disksize` plugin so the provisioner can expand the virtual hard disk size as-needed. Install them like this:

```bash
vagrant plugin install vagrant-reload
vagrant plugin install vagrant-disksize
```

## Setup
Like any Vagrant box, run:

```bash
vagrant up
```

From there, use:

```bash
vagrant ssh
```

To access the box over SSH.

## Usage
From a terminal, run:

```bash
sudo isabelle-utp-ide
```

Note that `sudo` is only needed on first run to permit write access to the directory for compilation. After this is complete, `isabelle-utp-ide` by itself will suffice.

## Details
The box is running Ubuntu "Bionic Beaver" 18.04 LTS (Desktop) with:

* Isabelle/HOL
* Isabelle/UTP
