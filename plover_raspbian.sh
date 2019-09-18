# Update apt.
sudo apt update

# Install Python 3.
sudo apt install 2to3

# Install PyQt5
sudo apt install -y python3-pyqt5 pyqt5-devtools python-sip python-sip-dev python3-babel

# Install pip.
sudo apt install pipenv

# Make SIP.
cd /usr/src
sudo wget https://www.riverbankcomputing.com/static/Downloads/sip/sip-4.19.14.tar.gz
sudo tar xzf sip-4.19.14.tar.gz
cd sip-4.19.14
sudo python3.6 configure.py --sip-module PyQt5.sip
sudo make
sudo make install

# Clone latest Plover repo.
git clone git@github.com:openstenoproject/plover.git plover/

# Get into plover.
cd plover

# Install Plover.
pip3 install -r requirements.txt

# Install plugins.
pip3 install -e . -r requirements_plugins.txt