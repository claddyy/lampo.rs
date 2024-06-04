CC=cargo
FMT=fmt

ARGS=

default: fmt
	$(CC) build

fmt:
	$(CC) fmt --all

check:
	$(CC) test --all -- --show-output

clean:
	$(CC) clean

install:
	$(CC) build --release
	$(CC) install --locked --path ./lampo-cli 
	$(CC) install --locked --path ./lampod-cli

integration: default
	$(CC) test -p tests $(ARGS)

proto:
	cd tests/lnprototest; poetry install; poetry run make check
