from kafka import KafkaProducer

server_addr = "localhost:9092"

producer = KafkaProducer(bootstrap_servers=server_addr)
for _ in range(100):
  producer.send("foobar", b"some_message_in_bytes")

# not giving topic? that's not right...