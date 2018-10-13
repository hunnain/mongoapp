FROM python:latest

RUN mkdir server

ADD ./mongodb.py /server

ADD ./requirement.txt /server

RUN cd server && \
    pip install --upgrade pip && \
    pip install -r requirement.txt

EXPOSE 5050

CMD cd server && \
    python mongodb.py 