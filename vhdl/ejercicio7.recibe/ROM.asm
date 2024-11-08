bucle: 	envia 0x71 ; Se comunica con el dispositivo PFC8574 en lectura
	masterAck
	recibeBajo ; Recibe el dato y lo poone en led(7 downto 0). El bit ACK=’1’ (NACK)
	stop
	nop
	retardo 1 ; En Vivado se cambiará 1 por 32768
	salta bucle