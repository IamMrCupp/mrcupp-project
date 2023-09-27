---
title: New Site
date: 2023-09-26
---

# The new site is live!   

I have finally jumped into learning a new web architecture/framework.
This site is based off the JAMStack model.

We're using a number of technologies on this site at the moment:

### Infrastructure:
* self hosted kubernetes cluster 
  * 5 nodes RPi Hardware cluster
  * External NAS Storage
  * containerd based oci backend
  * linkerd enabled sidecars for observability and monitoring
  * Prometheus, Grafana, Loki stack for dashboards
  * MetalLB loadbalancing and routing
  * SSL/TLS via Let's Encrypt using cert-manager
  * FluxCD for GitOps
* hardware loadbalancer using RPi4 running haproxy (DMZ routing)
* oci-compliant multiarch images built via using docker buildx from CircleCI pipeline

### Website:
* hugo page generator
* beautiful hugo theme
* bootstrap js
* fontawesome
* DART SASS
  
  