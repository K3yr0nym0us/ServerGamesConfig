# INSTRUCCIONES

## INSTALAR STEAM CMD
### PARA NO HACERLO CON USUARIO ROOT (PELIGRO DE SEGURIDAD) CREAMOS UN DOCKER

```sh
  docker run -it --name=steamcmd -p 28015:28015/udp -p 28014:28014/udp -p 28016:28016/tcp -p 28082:28082/tcp cm2network/steamcmd bash

  ./steamcmd.sh # ejecutamos steam (deberiamos estar dentro del docker)
  exit # salimos de steamcmd
  mkdir ~/rust  # creamos un directorio
  # instalamos el server de rust
  ./steamcmd.sh +force_install_dir ~/rust +login anonymous +app_update 258550 validate +quit
```

## MONTAJE DEL SERVIDOR
```sh
  cd ~/rust
  mkdir server && cd server && mkdir rustserver && cd rustserver && mkdir cfg && cd cfg
  nano server.cfg # aca ingresamos los datos de el archivo
  cd ~/rust
  nano run.sh # creamos un ejecutable y ponemos dentro lo de run.sh
  chmod +x run.sh # le damos permisos de ejecucion
  ./run.sh
  # Presiona Ctrl + P y luego Ctrl + Q. para salir del docker sin cerrar la ejecucion

  # ADICIONAL
  docker attach steamcmd # para volver al proceso del contenedor
  docker logs -f steamcmd # para ver los logs del proceso sin entrar al docker
```

## CONFIGURACION DE PUERTOS
```sh
  # FUERA DEL DOCKER
  sudo ufw allow 28015/udp
  sudo ufw allow 28014/udp
  sudo ufw allow 28016/tcp
  sudo ufw allow 28082/tcp
```

### fuentes:
https://medium.com/@hancovisagie/hosting-your-own-rust-server-on-linux-ubuntu-rust-facepunch-game-1eaa420024fb

https://developer.valvesoftware.com/wiki/SteamCMD#Linux_2