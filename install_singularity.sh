#!/bin/bash -v
exec > >(tee /var/log/user-data.log || logger -t user-data -s 2> /dev/console) 2>&1
whoami
pwd
yum -y update
yum -y groupinstall "Development Tools"
git clone https://github.com/singularityware/singularity.git
cd singularity
./autogen.sh
./configure --prefix=/shared
make
make install
echo "PATH=\${PATH}:/shared/bin" >> /home/ec2-user/.bashrc
echo "export PATH" >> /home/ec2-user/.bashrc
cd ..
rm -rf singularity

