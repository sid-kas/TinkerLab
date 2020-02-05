cd /
sudo wget https://github.com/protocolbuffers/protobuf/releases/download/v3.9.0/protobuf-all-3.9.0.zip
sudo apt-get install autoconf automake libtool curl make g++ unzip
sudo unzip protobuf-all-3.9.0.zip 
sudo rm /protobuf-all-3.9.0.zip
cd protobuf-3.9.0
sudo ./configure
sudo make
sudo make check
sudo make install
sudo ldconfig
cd ~


