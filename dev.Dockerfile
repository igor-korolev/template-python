FROM python:3.8.1-buster AS builder
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"
RUN apt-get update && apt-get install -y --no-install-recommends --yes python3-venv gcc libpython3-dev vim netcat && \
    python3 -m venv $VIRTUAL_ENV && \
    pip install --upgrade pip

FROM builder AS builder-venv
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

FROM builder-venv AS tester
COPY . /app
WORKDIR /app
RUN pytest

FROM tester AS runner
COPY --from=tester $VIRTUAL_ENV $VIRTUAL_ENV
COPY --from=tester /app /app
WORKDIR /app
CMD ["python3", "-m", "templ_app"]

USER 1001
