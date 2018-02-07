!/bin/bash -x

# Install OpenFOAM
# See also: https://openfoam.org/download/4-1-ubuntu/
sudo add-apt-repository http://dl.openfoam.org/ubuntu
sudo sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
sudo apt-get update
sudo apt-get -y install openfoam4
echo "source /opt/openfoam4/etc/bashrc" >> ~/.bashrc
source ~/.bashrc
mkdir -p $FOAM_RUN

# Install X2GO Server and Ubuntu MATE
# See also:
# https://wiki.x2go.org/doku.php/doc:installation:x2goserver
# http://wiki.mate-desktop.org/download
sudo add-apt-repository -y ppa:x2go/stable
sudo apt-get update
sudo apt-get -y install x2goserver x2goserver-xsession
sudo apt-get -y install ubuntu-mate-core ubuntu-mate-desktop
