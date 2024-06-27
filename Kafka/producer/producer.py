import pandas as pd
from kafka import KafkaProducer
from time import sleep
from json import dumps


# initialize kafka producer
producer = KafkaProducer(bootstrap_servers=['localhost:9092'],
        value_serializer=lambda x: 
        dumps(x).encode('utf-8')
    )

# Function to send data to Kafka
def send_to_kafka(producer, data):
    producer.send('stock_stream_topic', value=data)

def main():
    # Load your DataFrame
    df = pd.read_csv("indexProcessed.csv")

    for index, row in df.iterrows():
        dict_stock = row.to_dict()
        send_to_kafka(producer, dict_stock)
        print("data published")
        sleep(10)
        

if __name__ == "__main__":
    main()