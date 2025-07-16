# GUIA PERSONAL PARA MONTAR SERVIDORES DE JUEGOS

El primer paso para entender la seguridad es lo siguiente:

* JAMÁS TRABAJES COMO USUARIO ROOT
* DE PREFERENCIA MONTA TODO EN DOCKER
* HABILITA SOLO LOS PUERTOS NECESARIOS
* RECUERDA CONFIGURAR SIEMPRE UN ADMIN

## INSTRUCCIONES DE CREACION DE USUARIO EN LINUX (ubuntu)
```sh
  # COMO ROOT (unica vez que usamos root) HAY QUE HACER LO SIGUIENTE PARA CREAR EL NUEVO USER LLAMADO "steam"
  sudo useradd -m steam
  
  # esto pedira una contraseña para el nuevo usuario
  sudo passwd steam 

  # con el siguiente comando cambiamos al usuario nuevo
  sudo -u steam -s

  # y luego vamos a su directorio
  cd /home/steam
```

### EJEMPLO PRACTICO DE UN CONTENEDOR DOCKER PARA EL MONTAJE DE STEAMCMD (OPCIONAL YA QUE CADA JUEGO PUEDE VARIAR)
```sh
  # Aqui cambiamos "nombreservidor" por el que corresponda
  # Agregamos de la misma manera cada puerto que el servidor necesite para su correcto funcionamiento (depende del juego)
  docker run -it --name=nombreservidor \
    -p 26900:26900/udp \
    -p 26900:26900/tcp \
  cm2network/steamcmd bash

  # ejecutamos steamcmd (es necesario para que cargue los archivos de Steam)
  ./steamcmd.sh

  # salimos de steamcmd
  exit

  # creamos un directorio para el juego (ideal que tenga el nombre del juego)
  mkdir ~/nameserver

  # instalamos el server (esto ya depende del juego en su totalidad) este es un ejemplo de un server de 7 days to die
  ./steamcmd.sh +force_install_dir ~/7days +login anonymous +app_update 294420 validate +quit
```

NOTA:
En cada directorio de este repo estare dejando la configuración específica de diferentes juegos.