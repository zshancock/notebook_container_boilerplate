APP_NAME := starter


clean:
	docker stop $(APP_NAME)

notebook.build:
	docker build -f ./Dockerfile -t $(APP_NAME):local-notebook .

docker.notebooks: notebook.build
	docker run --rm -it -p 8888:8888 -v  $(shell pwd):/app $(APP_NAME):local-notebook
	make clean
