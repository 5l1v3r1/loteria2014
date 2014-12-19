#!/bin/bash

numero=( "12345" "67890" )

for i in "${numeros[@]}"
do
  PREMIO=`curl -s "http://api.elpais.com/ws/LoteriaNavidadPremiados?n=$i" | awk -F ":" {'print $3'} | awk -F "," {'print $1'}`
  if [ $PREMIO -ne 0 ]; then
     mplayer gol.mp3
  fi
done
