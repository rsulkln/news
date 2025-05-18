FROM python:3.13.3

# Set work directory inside the image
WORKDIR /app

# Install system dependencies (like netcat, needed for entrypoint script)
RUN apt-get  update && apt-get install -y netcat-traditional

# Upgrade pip
RUN pip install --upgrade pip

# Copy Requirements.txt BEFORE installing Python dependencies
COPY ./Requirements.txt /app/Requirements.txt
RUN pip install -r Requirements.txt

COPY . /app/
# Copy entrypoint.sh and set permissions/format
RUN sed -i 's/\r$//g' /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh       


# Set entrypoint to the correct path inside the image
CMD ["/app/entrypoint.sh"]


