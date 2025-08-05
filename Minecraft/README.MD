# Configuracion de server de minecraft

```sh
  docker run -d -p 25565:25565 --name minecraft -e EULA=TRUE -e VERSION=1.21.4 -v minecraft-data:/data itzg/minecraft-server
```