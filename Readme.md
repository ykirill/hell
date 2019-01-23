# Hell.
## Learn *Haskell*.

## Start.
### 1. Installation.

##### Vagrant.
    
If you want to use Vagrant download latest version from [HashiCorp web site](https://www.vagrantup.com/).
Also you need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) or another provider for Vagrant.


##### Run Vagrant.

To start Vagrant box.
```bash
$ vagrant up
```

At this moment the  box should be also provisioned. If it didn't happened, you should type:
```bash
$ vagrant provision
```

##### Connect to VM.

To connect to Vagrant box.

```bash
$ vagrant ssh
```

##### Without Vagrant.

Install [haskell-platform](https://www.haskell.org/platform/)...