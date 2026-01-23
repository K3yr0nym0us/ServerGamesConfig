# INSTRUCCIONES PARA CREAR UN SERVER DE 7 DAYS TO DIE CON DOCKER COMPOSE

### RECORDEMOS NO HACERLO COMO ROOT

## PREPARACIÓN DEL ENTORNO

```sh
  # 1 VERIFICAMOS EL ID NUMBER DEL USUARIO ACTUAL PARA PONERLO EN EL PUID Y PGID DEL COMPOSE
  id $(whoami)

  # 2 CREAMOS EL COMPOSE EN CASO DE QUE NO EXISTA (usa el ejemplo del archivo)
  nano 7-days-to-die-server.compose.yml

  # 3 Iniciar el contenedor con docker-compose
  docker-compose -f 7-days-to-die-server.compose.yml up -d

  # Es probable que de error al ejecutarse por primera vez (solo hay que reiniciar el contenedor)
```

## CONFIGURACIÓN DEL SERVIDOR
```sh
  # Entramos al docker
  docker exec -it --user 1005:1005 7daysserver bash

  # Entramos en el directorio donde se instaló el servidor
  cd /home/sdtdserver/serverfiles

  # Acá configuramos el servidor (revisar guia)
  nano sdtdserver.xml

  # Configuracion básica (buscar cada tag dentro del archivo no crear ninguno todos existen)
  <GameWorld>RWG</GameWorld> # Esto activa el mapa aleatorio
  
  # Visivilidad del servidor
  <ServerVisibility>
    0
  </ServerVisibility>
  # 0: Privado (recomendado mejora el rendimiento)
  # 1: Amigo
  # 2: Público

  <GameName>MiMapaAleatorio</GameName> # Este será el nombre de la carpeta donde se guarda el mapa generado
  <WorldGenSize>4096</WorldGenSize> # (opcional) Mapa pequeño para mejor rendimiento (hasta 5 jugadores)

  <property name="DropOnDeath" value="1"/> # opcional
  # 0	No se pierde nada al morir
  # 1	Se pierde todo menos el cinturón
  # 2	Se pierde solo el cinturón
  # 3	Se pierde todo
  # 4	Se pierde solo el inventario (mochila)

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

  # NOTA: Para borrar el mundo y generar uno nuevo con una nueva seed debes usar esto dentro del contenedor antes de ejecutarlo nuevamente
  rm -rf /home/sdtdserver/.local/share/7DaysToDie/Saves/*
  rm -rf /home/sdtdserver/.local/share/7DaysToDie/GeneratedWorlds/*

```

## COMANDOS ÚTILES CON DOCKER COMPOSE
```sh
  # Volver al contenedor
  docker exec -it --user 1005:1005 7daysserver bash
```

## CONFIGURACION DE PUERTOS (SI NO LOGRAS CONECTAR)
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

## VENTAJAS DE USAR DOCKER COMPOSE

### fuentes:
https://hub.docker.com/r/vinanrra/7dtd-server
