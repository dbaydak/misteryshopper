FROM python:3.9-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    apt-get clean

# Set the Chrome repo
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome
RUN apt-get update && \
    apt-get -y install google-chrome-stable

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py run_func.py campaigns/ /app/

CMD ["python", "main.py"]
