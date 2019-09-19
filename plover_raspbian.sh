# Update apt.
sudo apt update

# Install Python 3.
sudo apt install 2to3

# Install PyQt5
sudo apt install -y python3-babel qt5-qmake qt5-default

# Install pip.
sudo apt install pipenv

# Make PyQt5 and SIP.
cd /tmp
sudo wget https://www.riverbankcomputing.com/static/Downloads/sip/4.19.13/sip-4.19.13.tar.gz
sudo wget https://www.riverbankcomputing.com/static/Downloads/PyQt5/5.11.3/PyQt5_gpl-5.11.3.tar.gz

sudo tar xzf sip-4.19.13.tar.gz
cd sip-4.19.13
sudo python3 configure.py --sip-module=PyQt5.sip
sudo make
sudo make install

cd /tmp
sudo tar xzf PyQt5_gpl-5.11.3.tar.gz
cd PyQt5_gpl-5.11.3
sudo python3 configure.py
sudo make
sudo make install

# Return to repo dir.
cd ~/plover-pi

# Clone latest Plover repo.
git clone git@github.com:openstenoproject/plover.git plover/

# Get into plover.
cd plover

sudo pip3 install pydbus
sudo usermod -a -G uucp pi
sudo usermod -a -G dialout pi

# Install Plover.
pip3 install -r requirements.txt

# Install plugins.
pip3 install -e . -r requirements_plugins.txt