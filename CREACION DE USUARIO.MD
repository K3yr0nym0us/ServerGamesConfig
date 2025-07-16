# GUIA PERSONAL PARA MONTAR SERVIDORES DE JUEGOS

El primer paso para entender la seguridad es lo siguiente:

* JAMAS TRABAJES COMO USUARIO ROOT
* DE PREFERENCIA MONTA TODO EN DOCKER
* HABILITA SOLO LOS PUERTOS NECESARIOS
* RECUERDA CONFIGURAR SIEMPRE UN ADMIN

## INSTRUCCIONES DE CREACION DE USUARIO EN LINUX
```sh
  # COMO ROOT HAY QUE HACER LO SIGUIENTE PARA CREAR EL NUEVO USER
  sudo useradd -m nombreUsuario
  sudo passwd nombreUsuario

  # con el siguiente comando cambiamos al usuario nuevo
  sudo -u nombreUsuario -s

  # y luego vamos a su directorio
  cd /home/nombreUsuario
```

### EJEMPLO BASICO DE UN CONTENEDOR
```sh
  # Aqui cambiamos "nombreservidor" por el que corresponda
  # Agregamos de la misma manera cada puerto que el servidor necesite para su correcto funcionamiento (depende del juego)
  docker run -it --name=nombreservidor \
    -p 26900:26900/udp \
    -p 26900:26900/udp \
  cm2network/steamcmd bash
```

### ESTA CONFIGURACION ES OPCIONAL YA QUE CADA JUEGO PUEDE VARIAR PERO LA DEJARE PARA EJEMPLOS PRACTICOS
```sh
  # Una vez creado el contenedor (con el comando de arriba) estaremos dentro de el mismo
  ./steamcmd.sh # ejecutamos steam (es necesario para que cargue los archivos de Steam)
  exit # salimos de steamcmd
  mkdir ~/nameserver  # creamos un directorio para el juego (ideal que tenga el nombre del juego)
  # instalamos el server (esto ya depende del juego en su totalidad) este es un ejemplo de un juego de 7 days to die
  ./steamcmd.sh +force_install_dir ~/7days +login anonymous +app_update 294420 validate +quit
```