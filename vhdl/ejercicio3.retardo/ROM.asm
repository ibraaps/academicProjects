bucle: 	retardo 32768 ; el retardo de 1 ciclo del reloj SCL (I2C_scl= clk_divide * clk100Mhz)
	pin1 3 ; Led(3)= '1'
	retardo 32768 ; el retardo es 2 ciclos del reloj SCL (I2C_scl= clk_divide * clk100Mhz)
	pin0 3 ; Led(3)= '0'
	salta bucle