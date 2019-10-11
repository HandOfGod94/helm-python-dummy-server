.PHONY: build
build:
	docker build -t gahan/python-app:0.1.0 .

.PHONY: run
run:
	docker run -it --name gahan_python_app gahan/python-app:0.1.0

.PHONY: start
start:
	docker start gahan_python_app

.PHONY: stop
stop:
	docker stop gahan_python_app

.PHONY: rm
rm:
	docker rm gahan_python_app

.PHONY: delete-im
delete-im:
	docker image rm gahan/python-app:0.1.0
