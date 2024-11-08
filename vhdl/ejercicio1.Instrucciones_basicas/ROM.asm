	pin0		2 ;
bucle:	brincaSi0	2 ; brinca si sw(5)=’0’
	pin1		2 ; led(5)=’1’
	brincaSi1	2 ; brinca si sw(5)=’0’
	pin0		2 ; led(5)=’1’
	salta bucle	  ; salta a la etiqueta bucle