Kafka
------

##### Introduction
- This folder will be updated soon. 
------

##### Installing
------
##### Install Java
- Download Java 
- Extract files and move 
```
tar -zxf jdk-8u60-linux-x64.gz
sudo mkdir /opt/jdk
sudo mv jdk-1.8.0_60 /opt/jdk/
```
- Set System Variables
```
export JAVA_HOME =/usr/jdk/jdk-1.8.0_60
export PATH=$PATH:$JAVA_HOME/bin
source ~/.bashrc
```
* Check installation
```
java -version
javac -version
```

##### Install Zookeeper
* Download Zookeeper
* Extract and move files 
```
tar -zxf zookeeper-3.4.6.tar.gz
sudo mv zookeeper-3.4.6.tar.gz /opt/zookeeper
```
* Create data folder
```
sudo mkdir /opt/zookeeper/data
```
* Create zoo.cfg file
```
sudo cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg
```
* Update zoo.cfg to set dataDir to /opt/zookeeper/data
* Start Zookeeper Server
```
cd /opt/zookeeper/bin
./zkServer.sh start
```
* Start CLI
```
./zkCli.sh
```

##### Install Kafka
* Download Kafka
* Extract and move files
```
tar -zxf kafka_2.11.0.9.0.0.tar.gz
sudo mv kafka_2.11.0.9.0.0 /opt/kafka
```
* Start Server
```
cd /opt/kafka/bin
sudo ./kafka-server-start.sh ../config/server.properties
```

##### Install Kafka Manager
- Clone Kafka Manager and access the folder
```
git clone https://github.com/yahoo/kafka-manager.git
cd kafka-manager
```
- Launch SBT 
```
sudo ./sbt clean dist
```
- Start the Service
```
cd bin
sudo kafka-manager
```

##### References
------
- [1] https://www.tutorialspoint.com/apache_kafka/apache_kafka_installation_steps.htm 
- [4] https://github.com/yahoo/kafka-manager
