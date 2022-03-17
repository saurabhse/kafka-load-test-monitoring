## Dependencies
``` 
Install dependencies:
Docker - every developer must have it installed. 

On MacOS:
brew install jq
brew install kcat

For Linux you can use dnf or apt-get.
```

###
kcat -b 127.0.0.1:9092 -t topic-1
this will start listening for messages on topic-1

### Commands
``` 
Invoke required command to send an event of desired type as provided in template:
cat ./events/<file-name>.json | jq -c | kcat -b <kafka-broker-ip>:<kafka-broker-port> -P -t <kafka-topic> -H "__TypeId__="<eventType>"

Event: KafkaEvent
cat ./events/Event.json | jq -c | kcat -b 127.0.0.1:9092 -P -t topic-1 -H "__TypeId__=com.kafka.kafkaloadtestmonitoring.events.KafkaEvent"
``` 

### Load test
this will send number of messages to topic and find elapsed time
```
load-test/loadTest.sh 127.0.0.1:9092 topic-1 1000 Event.json com.kafka.kafkaloadtestmonitoring.events.KafkaEvent
```