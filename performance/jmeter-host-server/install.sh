yum update -y
sudo yum install java-1.8.0-openjdk
sudo java -version
sudo wget http://apache.stu.edu.tw//jmeter/binaries/apache-jmeter-5.2.1.tgz
sudo tar -xf apache-jmeter-5.2.1.tgz
mv apache-jmeter-5.2.1 jmeter
mv jmeter /opt/jmeter

#vim ~/.bashrc
#export JMETER_HOME=/opt/jmeter
#export PATH=$JMETER_HOME/bin:$PATH
#source ~/.bashrc

sudo chmod a+rx /opt/jmeter/bin/jmeter.sh
sudo cp /opt/jmeter/bin/jmeter.sh /usr/local/bin