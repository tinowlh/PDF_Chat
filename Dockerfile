FROM python:3.9

WORKDIR /code


COPY ./requirements.txt /code/requirements.txt
RUN python3 -m pip install --no-cache-dir --upgrade pip
RUN python3 -m pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

CMD ["panel", "serve", "/code/app.py", "--address", "0.0.0.0", "--port", "7860", "--allow-websocket-origin", "*"]

RUN mkdir -p /.cache
RUN chmod -R 777 /.cache
RUN mkdir -p docs/
RUN chmod -R 777 docs/