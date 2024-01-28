# scripts2023
A collection of useful scripts to setup Ubuntu development environments.

## Recipe
Create a new Ubuntu 20.04 VM.
Setup ssh and net-tools.
Run ssh-keygen to setup a local pair of keys.
Copy the ~/.ssh/id_rsa.pub (the public key) to the lf8r GitHub account.
git config --global user.email "subhajit.dasgupta@hpe.com"
git config --global user.name "Subhajit DasGupta"
git clone git@github.com:lf8r/scripts2023.git

Change to scripts2023 and run "./install-docker.sh" from there.
