FROM python:3.13

WORKDIR /app 

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y netcat-traditional
RUN apt-get install -y python3-dev libpq-dev

RUN pip install --upgrade pip 
COPY ./Requirements.txt .
RUN pip install -r Requirements.txt


COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh


COPY . .


CMD ["./entrypoint.sh"]
