# Docker Image Samba on Ubuntu

This project manages the creation of a Docker Image designed to support Samba on Ubuntu. It is created and maintained by [KWAZI](https://kwazi.io).

## Getting Started

Before getting started, you'll need to have the following software installed:

Requirement | Version | Notes
--- | --- | ---
Docker Engine | 24.0.6+ | Container Runtime Engine (w/ CLI)

### Building w/ Image Defaults

This project is designed to work with Ubuntu. The default values for this project will create an image that utilizes our pre-hardened Ubuntu base image. To build this image using default values, execute the following command:

```BASH
docker build -t samba:latest .
```

*NOTE: For more information about the default base image used by this project, see [our official GitHub repository](https://github.com/kwaziio/docker-ubuntu).*
