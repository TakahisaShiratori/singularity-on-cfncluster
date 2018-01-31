curl -O https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo pip install cfncluster
rm -f get-pip.py
git clone https://github.com/TakahisaShiratori/singularity-on-cfncluster.git
mkdir .cfncluster
cp singularity-on-cfncluster/cfncluster_config_template .cfncluster/config
