#!/bin/bash
# PART 1: the manual way.
# Run these ON THE EC2 MACHINE, section by section. Do NOT run the whole file.
#
# The machine has git and nothing else. Install the rest by hand and count
# the steps. Part 2 shows the same steps inside a Dockerfile.

########################################################
# 0) Check the starting point
########################################################
git --version                        # works (installed by bootstrap.sh)
python3 -m venv /tmp/test-venv       # fails: python3-venv is not installed

########################################################
# 1) Clone
########################################################
git clone https://github.com/TDPATEL1224/flask-deploy-ec2-vs-docker
cd flask-deploy-ec2-vs-docker/app
ls -l                                # app.py  Dockerfile  requirements.txt

########################################################
# 2) Install Python venv support
########################################################
sudo apt-get update -y
sudo apt-get install -y python3 python3-venv
python3 --version                    # 3.14 on Ubuntu 26.04

########################################################
# 3) Install Flask - the correct way
########################################################
# "pip3 install flask" fails on Ubuntu 24.04+ (PEP 668, externally managed).
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt      # Flask==3.1.3

########################################################
# 4) Run
########################################################
python3 app.py                       # app.py uses 8080 when PORT is not set

########################################################
# 5) Test
########################################################
# From a second SSH session:
curl http://localhost:8080/          # Welcome! Flask is running.
# From a browser, with the public_ip output of Terraform:
#   http://<PUBLIC-IP>:8080/

########################################################
# 6) Questions this raises
########################################################
# - How do you repeat these steps on a second machine?
# - How do you move this result to another computer?
# - What stays on the machine after you stop the app?
# - What breaks on a different Ubuntu version?
#
# Next: scripts/02-container-deploy.sh
