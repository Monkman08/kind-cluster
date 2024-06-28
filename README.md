# KIND Cluster Configuration

This repository contains the configuration for a Kubernetes in Docker (KIND) cluster. The cluster consists of a control-plane node and three worker nodes, running Kubernetes version 1.30..

## Components

The following tools are installed and configured in the cluster:

- **Traefik**: An open-source reverse proxy and load balancer. It is deployed as the ingress controller on the control-plane node.
- **Victoria Metrics**: A fast, cost-effective and scalable monitoring solution and time series database. It is deployed in the `monitoring` namespace.
- **Grafana**: An open-source platform for monitoring and observability. It is also installed in the `monitoring` namespace with Victoria Metrics as the data source. Built-in dashboards for Traefik and Victoria Metrics are included.

All these tools are installed and configured via Helmfile.

## Getting Started

To get a local copy up and running, follow these steps:

### Prerequisites

- Docker
- KIND
- Helm
- Helmfile

### Installation

1. Clone the repo
2. Use the KIND configuration file to create a new cluster
3. Use Helmfile to install the components

### Cluster Bootstrap

To create and bootstrap the cluster, run the following command:
    
```bash
./bootstrap.sh
```


## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

## License

Distributed under the MIT License. See `LICENSE` for more information.