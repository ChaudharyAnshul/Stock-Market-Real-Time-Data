from kafka import KafkaConsumer
from json import loads
import json
from s3fs import S3FileSystem
import configparser

config = configparser.ConfigParser()
config.read('configuration.properties')

consumer = KafkaConsumer('stock_stream_topic',
    bootstrap_servers=['localhost:9092'],
    value_deserializer=lambda x: loads(x.decode('utf-8'))
  )

access_key_id = config['AWS']['access_key_id']
secret_access_key = config['AWS']['secret_access_key']

s3 = S3FileSystem(
    key=access_key_id,
    secret=secret_access_key,
)

bucket_name = config['AWS']['bucket_name']

for count, i in enumerate(consumer):
    with s3.open("s3://{}/stock_market_{}.json".format(bucket_name, count), 'w') as file:
      json.dump(i.value, file)