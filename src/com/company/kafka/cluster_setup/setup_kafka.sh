apt-get update
apt-get upgrade
apt install openjdk-8-jre-headless -y
wget https://dlcdn.apache.org/kafka/3.2.0/kafka_2.12-3.2.0.tgz
tar -zxf kafka_2.12-3.2.0.tgz
mkdir "kafka_data"
mkdir "kafka_data/kafka-logs"
chmod 755 kafka_data/kafka-logs/
rm kafka_2.12-3.2.0.tgz
mv kafka_2.12-3.2.0 kafka


