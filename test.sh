#!/bin/bash
docker build -t sshtest .
docker run --rm -d -e USER=test -e PASSWORD=test --name ssh_test -p2200:22 sshtest:latest 
