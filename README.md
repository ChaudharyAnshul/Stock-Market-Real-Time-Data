# Stock-Market-Real-Time-Data

## Problem Statement 

Develop a comprehensive data engineering solution to process, store, and analyze real-time stock market data. This project will leverage various technologies, including Python, Amazon Web Services (AWS), Apache Kafka, AWS Glue, AWS Athena, and SQL to create a robust pipeline capable of handling and analyzing large volumes of streaming data efficiently.

## Project Scope

1. **Data Ingestion with Kafka:** Stream real-time stock market data into Kafka topics.

2. **Data Storage:** Store the ingested data in a durable and scalable storage solution.

3. **Data Processing with AWS Glue:** Perform ETL (Extract, Transform, Load) operations on the stored data.

4. **Data Analysis with AWS Athena:** Query and analyze the processed data using SQL.

## Architecture Diagram
<img src="Architecture Diagram/stock-market-kafka-stream.png">

## Technologies Used
- Python 
- SQL
- Apache Kafka
- Amazon Web Services (AWS): EC2, S3, Glue, Athena
- Docker
- GitHub, Git

## Steps to Run

- **Kafka Cluster Setup:**
  - run the docker container inside kafka folder
  - run the `create_topic.sh` file
  - run the kafka Producer
  - update the configuration.properties file with the AWS keys
  - run the kafka Consumer

- **Data Storage:**
  - Configuration of S3 buckets.
  - Python consumer script or Kafka Connect configuration for storing data in S3.

- **AWS Glue Setup:**
  - Follow steps in Glue folder to convert S3 data ito database.

- **AWS Athena:**
  - SQL queries executed in AWS Athena.
  - Analysis results and insights documented.

