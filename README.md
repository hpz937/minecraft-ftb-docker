# minecraft-ftb-docker

Runs a containerized ftb server. (Currently FTB Infinity 1.2.1)

*This will auto-agree to the Mojang EULA so make sure you agree with it first https://account.mojang.com/documents/minecraft_eula*

Steps
-------
Build an image, java, curl, ftb:

	docker build -t ftb-infinity .

On first run it will download the minecraft jar and related dependancies via ftb script:

	docker run -p 25565:25565 -dt --name ftb ftb-infinity

If you need to access files:

	docker run -it --rm --volumes-from ftb ftb-infinity /bin/bash


Todo:
-------

* backup scripts
