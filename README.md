# Container for the Rancher CLI

## Description

This is just a very simple container wrapper around a command line tool. It is to avoid having to fetch a binary with, for example, `wget` every time during a CI/CD pipeline that natively uses containers for each job. This speeds up the process slightly and it is more efficient to "solve" this problem once in a central location.

Rancher has already made a container repository available but the images we build are very specifically tailored to function inside a CI/CD pipeline. For this reason we maintain this repository.

## Examples

### Docker Run

```bash
docker run --rm -ti perrit/rancher-cli rancher --help
docker run --rm -ti perrit/rancher-cli rancher --version
docker run --rm -ti registry.gitlab.com/perrit/rancher-cli-container rancher --help
docker run --rm -ti registry.gitlab.com/perrit/rancher-cli-container rancher --version
```

## Links

* https://github.com/rancher/cli
* https://hub.docker.com/r/rancher/cli/
* https://github.com/perrit/rancher-cli-container
* https://gitlab.com/perrit/rancher-cli-container
* https://hub.docker.com/r/perrit/rancher-cli/
