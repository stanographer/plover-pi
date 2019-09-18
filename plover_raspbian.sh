# Update apt.
sudo apt update

# Install Python 3.
sudo apt install 2to3

# Install PyQt5
sudo apt install pyqt5-dev
sudo apt install pyqt5-devtools
sudo apt install python-sip

# Install pip.
sudo apt install pipenv

# Clone latest Plover repo.
git clone git@github.com:openstenoproject/plover.git

# Get into plover.
cd plover

# Install Plover.
pip3 install -r requirements.txt

# Install plugins.
pip3 install -e . -r requirements_plugins.txt