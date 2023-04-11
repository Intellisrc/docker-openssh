# About
Simple service to access a directory with ssh

## Environment

```
ENV USER 
ENV PASSWORD 
```

## Docker Swarm

Example:

```yaml
version: '3.9'
    
services:
  ssh:
    image: intellisrc/openssh
    volumes:
      - type: bind
        source: "/private/dir/"
        target: "/home/"
    ports:
      - published: 2222
        target: 22
        protocol: tcp
        mode: host   
    environment:
      USER_ID: 1000
      GROUP_ID: 1000
      USER: open
      GROUP: ssh
      PASSWORD: ********************
    deploy:
      mode: replicated
      replicas: 1
      endpoint_mode: dnsrr
      placement:
        constraints: 
          - node.role == worker
```
