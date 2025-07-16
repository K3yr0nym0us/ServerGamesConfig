# INSTRUCCIONES PARA CREAR UN SERVER DE RUST

### RECORDEMOS USAR EL USUARIO "steam" Y NO HACERLO COMO ROOT

## CONFIGURACION DEL DOCKER DE STEAMCMD
```sh
  docker run -it --name=rustserver -p 28015:28015/udp -p 28014:28014/udp -p 28016:28016/tcp -p 28082:28082/tcp cm2network/steamcmd bash

  # ejecutamos steam (deberiamos estar dentro del docker)
  ./steamcmd.sh

  # salimos de steamcmd
  exit

  # creamos un directorio base
  mkdir ~/rust

  # instalamos el server de rust
  ./steamcmd.sh +force_install_dir ~/rust +login anonymous +app_update 258550 validate +quit
```

## MONTAJE DEL SERVIDOR
```sh
  # Entramos en su directorio base
  cd ~/rust

  # Creamos los subdirectorios
  mkdir server && cd server && mkdir rustserver && cd rustserver && mkdir cfg && cd cfg

  # Acá ingresamos los datos de el archivo server.sfg (modificar a gusto)
  nano server.cfg

  # Volvemos al directorio base
  cd ~/rust

  # Creamos un ejecutable run.sh y copiamos el contenido del archivo run.sh
  nano run.sh

  # Le damos permisos de ejecucion
  chmod +x run.sh

  # Ejecutamos el server
  ./run.sh
  # Presiona Ctrl + P y luego Ctrl + Q. para salir del docker sin cerrar la ejecucion

  # ADICIONAL
  docker attach rustserver # para volver al proceso del contenedor
  docker exec -it rustserver bash # para entrar al docker sin entrar al proceso del servidor
  docker logs -f rustserver # para ver los logs del proceso sin entrar al docker
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