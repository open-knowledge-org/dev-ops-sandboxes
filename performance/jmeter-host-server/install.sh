yum update -y
yum install java-1.8.0-openjdk
java -version
wget http://apache.stu.edu.tw//jmeter/binaries/apache-jmeter-5.2.1.tgz
tar -xf apache-jmeter-5.2.1.tgz

#vim ~/.bashrc
#export JMETER_HOME=/root/apache-jmeter-5.2.1
#export PATH=$JMETER_HOME/bin:$PATH
#source ~/.bashrc