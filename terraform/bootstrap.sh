#!/bin/bash
# First-boot script (EC2 user_data) for the manual deployment VM.
#
# This installs git and NOTHING else, on purpose.
# No Docker. No pip. No Flask. No application.
# Everything else is installed by hand in scripts/01-manual-deploy-ec2.sh,
# so every step can be counted and compared with the Dockerfile.

set -eux
export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y git

cat > /etc/motd <<'MOTD'

  Flask manual deployment VM
  --------------------------
  This machine has git only. Nothing else is prepared.
  Follow scripts/01-manual-deploy-ec2.sh, section by section.

MOTD
