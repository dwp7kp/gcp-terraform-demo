#!/bin/bash

mkdir .ssh
ssh-keygen -N "" -f .ssh/gcp_compute_key

cat << EOT > .auto.tfvars
gce_ssh_user = "dwp7kp" // Replace with your username
gce_ssh_pub_key_file = "./.ssh/gcp_compute_key.pub"

EOT