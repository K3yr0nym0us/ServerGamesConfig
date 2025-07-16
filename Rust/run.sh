#!/bin/bash

while true; do
    ./RustDedicated -batchmode +server.identity "rustserver" +rcon.port 28016 +rcon.password kiki_pass +rcon.web 1
    echo "El script ha terminado. Reiniciando..."
    sleep 1 # Espera un segundo antes de reiniciar
done