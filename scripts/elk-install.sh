# Add the Elastic 8 GPG key and repository
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install -y apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update

# Install Elasticsearch and enable it 
sudo apt-get install -y elasticsearch
sudo echo "-Xms1g" > /etc/elasticsearch/jvm.options
sudo echo "-Xmx1g" >> /etc/elasticsearch/jvm.options
sudo systemctl enable --now elasticsearch
sudo systemctl restart elasticsearch

# Install Kibana and enable it
sudo apt-get install -y kibana
sudo echo "-Xms512m" > /etc/kibana/jvm.options
sudo echo "-Xmx512m" >> /etc/kibana/jvm.options
sudo systemctl enable --now kibana
sudo systemctl restart kibana
sed -i 's|#server.host: "localhost"|server.host: "0.0.0.0"|g' /etc/kibana/kibana.yml
sed -i 's|#server.port: 5601|server.port: 5601|g' /etc/kibana/kibana.yml

# Install Logstash and enable it
sudo apt-get install -y logstash
sudo echo "-Xms1g" > /etc/logstash/jvm.options
sudo echo "-Xmx1g" >> /etc/logstash/jvm.options
sudo systemctl enable --now logstash
sudo systemctl restart logstash