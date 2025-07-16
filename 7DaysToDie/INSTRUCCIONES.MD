# INSTRUCCIONES PARA CREAR UN SERVER DE 7 DAYS TO DIE

### RECORDEMOS USAR EL USUARIO "steam" Y NO HACERLO COMO ROOT

```sh
  docker run -it --name=7daysserver \
    -p 26900:26900/udp \
    -p 26901:26901/udp \
    -p 26902:26902/udp \
    -p 26903:26903/udp \
    -p 26904:26904/udp \
    -p 26905:26905/udp \
    -p 26900:26900/tcp \
    -p 26901:26901/tcp \
    -p 26902:26902/tcp \
    -p 26903:26903/tcp \
    -p 26904:26904/tcp \
    -p 26905:26905/tcp \
  cm2network/steamcmd bash

  # ejecutamos steamcmd (deberiamos estar dentro del docker)
  ./steamcmd.sh

  # salimos de steamcmd
  exit

  # creamos un directorio base
  mkdir ~/7days

  # instalamos el server
  ./steamcmd.sh +force_install_dir ~/7days +login anonymous +app_update 294420 validate +quit
```

## MONTAJE DEL SERVIDOR
```sh
  # Entramos en su directorio base
  cd ~/7days

  # Acá configuramos el servidor (revisar guia)
  nano serverconfig.xml

  # Configuracion basica (buscar cada tag dentro del archivo no crear ninguno todos existen)
  <GameWorld>RWG</GameWorld> # Esto activa el mapa aleatorio
  <GameName>MiMapaAleatorio</GameName> # Este será el nombre de la carpeta donde se guarda el mapa generado
  <WorldGenSize>4096</WorldGenSize> # Mapa pequeño para mejor rendimiento (sigue siendo enorme para hasta 5 jugadores)

  <property name="DropOnDeath" value="1"/> # opcional
  # 0	No se pierde nada al morir
  # 1	Se pierde todo menos el cinturón
  # 2	Se pierde solo el cinturón
  # 3	Se pierde todo
  # 4	Se pierde solo el inventario (mochila)

  # Visivilidad del servidor
  <ServerVisibility>
    2
  </ServerVisibility>
  # 0: Privado (recomendado mejora el rendimiento)
  # 1: Amigo
  # 2: Público

  # Esto configura la dificultad (del 0 al 5)
  <GameDifficulty> 
    2
  </GameDifficulty>

  # SOLO SI ES UN SERVER PRIVADO Y JUEGAS CON GENTE DE CONFIANZA
  <EACEnabled>
    false # Mejora rendimiento
  </EACEnabled>

  # Ingresamos lo siguiente en el archivo de serveradmin.xml
  <admins>
    <admin steamID="tu_steam_id" permission_level="0" />
  </admins>

  # Iniciamos el servidor
  ./startserver.sh -configfile=serverconfig.xml
  # Presiona Ctrl + P y luego Ctrl + Q. para salir del docker sin cerrar la ejecucion

  # ADICIONAL
  docker attach 7daysserver # para volver al proceso de ejecucion del server en el contenedor
  docker exec -it 7daysserver bash # para entrar al docker sin entrar al proceso del servidor
  docker logs -f 7daysserver # para ver los logs del proceso sin entrar al docker
```

## CONFIGURACION DE PUERTOS
```sh
  # FUERA DEL DOCKER
  sudo ufw allow 26900/udp
  sudo ufw allow 26901/udp
  sudo ufw allow 26902/udp
  sudo ufw allow 26903/udp
  sudo ufw allow 26904/udp
  sudo ufw allow 26905/udp

  sudo ufw allow 26900/tcp
  sudo ufw allow 26901/tcp
  sudo ufw allow 26902/tcp
  sudo ufw allow 26903/tcp
  sudo ufw allow 26904/tcp
  sudo ufw allow 26905/tcp
```

### fuentes:
https://mason.dev/tutorials/how-to-build-a-7-days-to-die-server-on-ubuntu/