
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:042

00:00:062	
455.7892	
183.715Z17-268h px� 
�
Command: %s
1870*	planAhead2}
{read_checkpoint -auto_incremental -incremental C:/Users/Ibra/proy24_5/proy24_5.srcs/utils_1/imports/synth_1/controlador.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2N
LC:/Users/Ibra/proy24_5/proy24_5.srcs/utils_1/imports/synth_1/controlador.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
f
Command: %s
53*	vivadotcl25
3synth_design -top controlador -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
24680Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 1292.250 ; gain = 440.766
h px� 
�
synthesizing module '%s'638*oasys2
controlador2�
�C:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/proy24_4/proy24_4.srcs/sources_1/imports/sed/proyecto24/sed_gitt_trabajo_2024/ejercicio3.retardo/controlador_top.vhd2
188@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ROM2Y
WC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/ejercicio5.envia_parcial/ROM.vhd2
52

Inst_ROM2
ROM2�
�C:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/proy24_4/proy24_4.srcs/sources_1/imports/sed/proyecto24/sed_gitt_trabajo_2024/ejercicio3.retardo/controlador_top.vhd2
578@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ROM2[
WC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/ejercicio5.envia_parcial/ROM.vhd2
118@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ROM2
02
12[
WC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/ejercicio5.envia_parcial/ROM.vhd2
118@Z8-256h px� 
L
%s
*synth24
2	Parameter clk_divide bound to: 12'b011111010000 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CPU2O
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
52

Inst_CPU2
CPU2�
�C:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/proy24_4/proy24_4.srcs/sources_1/imports/sed/proyecto24/sed_gitt_trabajo_2024/ejercicio3.retardo/controlador_top.vhd2
648@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
238@Z8-638h px� 
L
%s
*synth24
2	Parameter clk_divide bound to: 12'b011111010000 
h p
x
� 
�
default block is never used226*oasys2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
3008@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
CPU2
02
12Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
238@Z8-256h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
Inst_sda_obuf2
IOBUF2�
�C:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/proy24_4/proy24_4.srcs/sources_1/imports/sed/proyecto24/sed_gitt_trabajo_2024/ejercicio3.retardo/controlador_top.vhd2
828@Z8-113h px� 
�
,binding component instance '%s' to cell '%s'113*oasys2
Inst_scl_obuf2
IOBUF2�
�C:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/proy24_4/proy24_4.srcs/sources_1/imports/sed/proyecto24/sed_gitt_trabajo_2024/ejercicio3.retardo/controlador_top.vhd2
898@Z8-113h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
controlador2
02
12�
�C:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/proy24_4/proy24_4.srcs/sources_1/imports/sed/proyecto24/sed_gitt_trabajo_2024/ejercicio3.retardo/controlador_top.vhd2
188@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
i2c_recibiendo_reg2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
3268@Z8-6014h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[0]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[2]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[3]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[4]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[5]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[6]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[7]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[8]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2
RAM[9]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
RAM[10]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
RAM[11]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
RAM[12]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
RAM[13]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
RAM[14]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
�
0Net %s in module/entity %s does not have driver.3422*oasys2	
RAM[15]2
CPU2Q
MC:/Users/Ibra/proy24_5/proy24_5.srcs/sources_1/imports/Ibra/Downloads/cpu.vhd2
578@Z8-3848h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2
	i2c_sda_i2
CPUZ8-7129h px� 
o
9Port %s in module %s is either unconnected or has no load4866*oasys2
	i2c_scl_i2
CPUZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1401.684 ; gain = 550.199
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1401.684 ; gain = 550.199
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1401.684 ; gain = 550.199
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0062

1402.1022
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
2Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2Z
VC:/Users/Ibra/proy24_5/proy24_5.srcs/constrs_1/imports/sed_gitt_trabajo_2024/pines.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2Z
VC:/Users/Ibra/proy24_5/proy24_5.srcs/constrs_1/imports/sed_gitt_trabajo_2024/pines.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2X
VC:/Users/Ibra/proy24_5/proy24_5.srcs/constrs_1/imports/sed_gitt_trabajo_2024/pines.xdc2
.Xil/controlador_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1500.3362
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
W  A total of 2 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 2 instances
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0022

1500.3362
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:11 ; elapsed = 00:00:16 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:11 ; elapsed = 00:00:16 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:11 ; elapsed = 00:00:16 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
j
3inferred FSM for state register '%s' in module '%s'802*oasys2
estado_s_reg2
CPUZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_              state_boot |                              000 |                              000
h p
x
� 
y
%s
*synth2a
_               state_run |                              001 |                              001
h p
x
� 
y
%s
*synth2a
_         state_i2c_start |                              010 |                              011
h p
x
� 
y
%s
*synth2a
_          state_i2c_bits |                              011 |                              100
h p
x
� 
y
%s
*synth2a
_             state_delay |                              100 |                              010
h p
x
� 
y
%s
*synth2a
_          state_i2c_stop |                              101 |                              101
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
estado_s_reg2

sequential2
CPUZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:17 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               10 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 4     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	  11 Input   16 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input   16 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   6 Input   12 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input   10 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    9 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   7 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  11 Input    1 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	  12 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   6 Input    1 Bit        Muxes := 11    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:13 ; elapsed = 00:00:20 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:17 ; elapsed = 00:00:25 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:18 ; elapsed = 00:00:26 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:18 ; elapsed = 00:00:26 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |     7|
h px� 
2
%s*synth2
|3     |LUT1   |    28|
h px� 
2
%s*synth2
|4     |LUT2   |    13|
h px� 
2
%s*synth2
|5     |LUT3   |     9|
h px� 
2
%s*synth2
|6     |LUT4   |    25|
h px� 
2
%s*synth2
|7     |LUT5   |    14|
h px� 
2
%s*synth2
|8     |LUT6   |    33|
h px� 
2
%s*synth2
|9     |FDCE   |     3|
h px� 
2
%s*synth2
|10    |FDRE   |    48|
h px� 
2
%s*synth2
|11    |FDSE   |     2|
h px� 
2
%s*synth2
|12    |IBUF   |     6|
h px� 
2
%s*synth2
|13    |IOBUF  |     2|
h px� 
2
%s*synth2
|14    |OBUF   |    16|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:14 ; elapsed = 00:00:28 . Memory (MB): peak = 1500.336 ; gain = 550.199
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:21 ; elapsed = 00:00:30 . Memory (MB): peak = 1500.336 ; gain = 648.852
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0022

1500.3362
0.000Z17-268h px� 
S
-Analyzing %s Unisim elements for replacement
17*netlist2
9Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

1500.3362
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2Y
W  A total of 2 instances were transformed.
  IOBUF => IOBUF (IBUF, OBUFT): 2 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

b66feb80Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
362
192
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:242

00:00:352

1500.3362

1039.594Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0012

1500.3362
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2>
<C:/Users/Ibra/proy24_5/proy24_5.runs/synth_1/controlador.dcpZ17-1381h px� 
�
%s4*runtcl2n
lExecuting : report_utilization -file controlador_utilization_synth.rpt -pb controlador_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu May  2 20:38:48 2024Z17-206h px� 


End Record