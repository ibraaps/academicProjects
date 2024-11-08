bucle: 	envia 0x70 ; Se comunica con el dispositivo PFC8574 en escritura
	envia 0x0F ; Envía el dato 0x0F
	stop ; Necesita un ciclo de I2C_scl (‘clk_divide’ ciclos del reloj clk100Mhz para completarse)
	retardo 32768 ; En Vivado se cambiará 1 por 32768
	envia 0x70 ; Se comunica con el dispositivo PFC8574 en escritura
	enviaBajo ; Envía el contenido de los interruptores bajos, sw(7 downto 0)
	retardo 32768 ; En Vivado se cambiará 1 por 32768
	salta bucle