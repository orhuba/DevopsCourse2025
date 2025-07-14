FROM python:3.8.2
WORKDIR src/app
ENV FLASK_APP=flaskr
ENV FLASK_ENV=main

# make enviroment
RUN git clone https://github.com/pallets/flask.git
RUN cd flask/examples/tutorial
RUN python3 -m venv .venv
RUN . .venv/bin/activate
RUN cd ../../..
COPY requirements.txt .

#install python & pip
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# handle flask
ENV FLASK_APP=./flask/examples/tutorial/flaskr/__init__.py:create_app
RUN flask init-db

#build the app
EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
