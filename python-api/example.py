### defining variables ###

TOPIC_NAME = "quickstart-events"
HOST_BOOTSTRAP_SERVER = "localhost:19092" # or localhost:29092
CLIENT_ID="test-id"


### creating a topic ###
from kafka.admin import KafkaAdminClient, NewTopic

admin_client = KafkaAdminClient(
  bootstrap_servers=HOST_BOOTSTRAP_SERVER, 
  client_id=CLIENT_ID,
)

topic_list = []
topic_list.append(
  NewTopic(name=TOPIC_NAME, num_partitions=1, replication_factor=1)
)
admin_client.create_topics(new_topics=topic_list, validate_only=False)


### producing events ###
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers=HOST_BOOTSTRAP_SERVER)

for i in range(10):
  producer.send(topic=TOPIC_NAME, value=b"some_message_in_bytes")


### consuming events ###
from kafka import KafkaConsumer

consumer = KafkaConsumer(
  TOPIC_NAME, 
  bootstrap_servers=HOST_BOOTSTRAP_SERVER,
  auto_offset_reset='earliest', # --from-beginning
)

for msg in consumer:
  print(msg.value.decode("utf-8"))

# run a container to test in the compose network
# docker run -ti --rm --network compose-kafka_default local/kafka-base bash 
## use --bootstrap-server kafka-1:9092
