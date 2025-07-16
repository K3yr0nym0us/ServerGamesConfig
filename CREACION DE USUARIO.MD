# INSTRUCCIONES DE CREACION DE USUARIO EN LINUX

```sh
  # COMO ROOT HAY QUE HACER LO SIGUIENTE PARA CREAR EL NUEVO USER
  sudo useradd -m nombreUsuario
  sudo passwd nombreUsuario

  # con el siguiente comando cambiamos al usuario nuevo
  sudo -u nombreUsuario -s

  # y luego vamos a su directorio
  cd /home/nombreUsuario
```
