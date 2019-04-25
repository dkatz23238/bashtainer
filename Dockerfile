FROM ubuntu:latest

# Update the base image
RUN apt-get update
RUN apt-get install -y python3.7 python3-pip wget unzip curl
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
RUN update-alternatives  --set python /usr/bin/python3.7

# Give executable permissions
ADD ./app /app
RUN chmod +x /app/app.py
RUN mkdir -p /app && cd /app

# Get some data
RUN wget https://archive.ics.uci.edu/ml/machine-learning-databases/00482/dataset.zip > /dev/null 2>&1
RUN unzip dataset.zip && rm -r *.zip
RUN mkdir -p /ML-data
RUN mv /dataset.csv /ML-data/dataset.csv


# Run the app
RUN python -m pip install -U -r /app/app/requirements.txt

CMD ["/usr/bin/python3.7", "-u", "/app/basicapp.py"]