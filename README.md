# StreamServer with Docker

## Docker Installation

Install Docker (on linux) or Docker-toolbox (on Windows/Mac) 
  - [Mac](https://docs.docker.com/mac/step_one/)
  - [Windows](https://docs.docker.com/windows/step_one/)
  - [Linux](https://docs.docker.com/linux/step_one/)  

Linux only: [Use docker without sudo](http://askubuntu.com/a/477554)

## Stream Server Installation
1. Open a terminal (Docker Quickstart Terminal on Windows/Mac or standard terminal on Linux).
2. Download zip and unzip or “git clone” from Stream Server repository

  ```bash
  $ git clone https://github.com/madgik/Docker-StreamServer.git
  ```
3. Linux only:

  ```bash
  $ sudo service docker start
  ```
4. Navigate to the Stream Server Directory:

  ```bash
  $ cd <path to Docker-StreamServer>
  ```
5. Build Stream Server image (this may take a few minutes the first time):

  ```bash
  $ docker build -t streamserver .
  ```


## Run Stream Server container
1. Execute:
  ```bash
  $ docker run -i -t --rm -p 8989:8989 --name streamserver streamserver
  ```
  
  ![Alt text](/screenshots/run.png?raw=true "Run Stream Server container")
2. Leave this console open while you are working and then [stop the container](#exit-stream-server-container).
3. Find your docker machine IP
  1. On Linux is: localhost
  2. On Windows/Mac open a new Docker Quickstart Terminal and run:
  
    ```
    $ docker-machine ip
    ```
    It will return your docker-machine ip **(from now on use this instead of localhost if you are on Windows or Mac)**.

## Test the Stream Server
Test the Stream Server by opening http://**docker-machine-ip**:8989/measurements on your browser

![Alt text](/screenshots/test.png?raw=true "Test Stream Server container")


## Exit Stream Server container
To gracefully stop your docker container:

1. Select your Stream Server docker console.
2. Press Ctrl+C.
3. Close the console.

## Run multiple Stream Servers
You can run multiple stream servers, concurently, on different docker containers. Just choose a different container name and forward 8989 port to a different port on your local machine.

1. Open a terminal (Docker Quickstart Terminal on Windows/Mac or standard terminal on Linux).
2. Execute the following command to start a streamserver named second_streamserver that produces a stream accesible by your **docker machine IP**:8990  
  ```bash
  docker run -i -t --rm -p 8990:8989 --name second_streamserver streamserver
  ```
3. Test the Stream Server by opening http://**docker-machine-ip**:8990/measurements on your browser

##Troubleshoot
* If you are getting an error like:
  
  ```bash
  docker: Error response from daemon: Conflict. The name "/streamserver" is already in use by container b13022c72864ad6e7651c1681764ec6ed1554f247e11a1070675b952041fbc78. You have to remove (or rename)
  ```
  Run:
  
  ```bash
  docker stop streamserver
  ```
  or
  
  ```bash
  docker kill streamserver
  ```
  
