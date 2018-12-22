#!/bin/bash

numeros=( "11111" "00000" )

while :
do
   for i in "${numeros[@]}"
   do
     PREMIO=$(curl -s "https://api.elpais.com/ws/LoteriaNavidadPremiados?n=$i")	   
     CANTIDAD=$(echo $PREMIO | awk -F ":" {'print $3'} | awk -F "," {'print $1'})
     if [ $CANTIDAD -ne 0 ]; then
	echo "$PREMIO" | tee premios.txt
        mplayer gol.mp3 > /dev/null 2>&1
     fi
   done
   sleep 60
done

