.PHONY: build-image 
build-image:
	docker build -t localhost:32000/python-app:0.2.0 .

.PHONY: push-image 
push-image:
	docker push localhost:32000/python-app:0.2.0

.PHONY: run
run:
	docker run -it --name gahan_python_app  -p 7001:7001 localhost:32000/python-app:0.2.0

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
	docker image rm localhost:32000/python-app:0.2.0
