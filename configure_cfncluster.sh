curl -O https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo pip install cfncluster
rm -f get-pip.py
wget https://raw.githubusercontent.com/TakahisaShiratori/singularity-on-cfncluster/master/cfncluster_config_template
mkdir .cfncluster
mv cfncluster_config_template .cfncluster/config
