FROM debian:buster-slim AS builder
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN apt-get update && \
    apt-get install --no-install-suggests --no-install-recommends --yes python3-venv gcc libpython3-dev && \
    python3 -m venv $VIRTUAL_ENV && \
    pip install --upgrade pip

FROM builder AS builder-venv
COPY requirements.txt /requirements.txt
RUN pip install --disable-pip-version-check -r /requirements.txt

FROM builder-venv AS tester
COPY . /app
WORKDIR /app
RUN pytest

FROM gcr.io/distroless/python3-debian10 AS runner
COPY --from=tester $VIRTUAL_ENV $VIRTUAL_ENV
COPY --from=tester /app /app
WORKDIR /app
ENTRYPOINT ["python3", "-m", "templ_app"]

USER 1001
