FROM python:3.8.2
WORKDIR /app
ENV FLASK_APP=flaskr
ENV FLASK_ENV=main

# make enviroment
COPY DevopsCourse2024/ /app/
COPY requirements.txt .

#install python & pip
RUN pip install -r requirements.txt

# handle flask
ENV FLASK_APP=./flaskr/__init__.py:create_app
RUN flask init-db

#build the app
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
