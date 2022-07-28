

FROM python:3.7
RUN mkdir /noha
ADD . /noha
WORKDIR /noha
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 8000
CMD [ "python3", "hello.py" ]
