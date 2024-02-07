##Clock
#IO_L13P_T2_MRCC_35 Schematic name=SYSCLK
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { CLK }];
create_clock -add -name sys_clk_pin -period 5.00 -waveform {0 2.5} [get_ports { CLK }];

##LEDS
#IO_L14P_T2_SRCC_34 Schematic name=LD0
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { LEDS[0] }];
#IO_L14N_T2_SRCC_34 Schematic name=LD1
set_property -dict { PACKAGE_PIN P20   IOSTANDARD LVCMOS33 } [get_ports { LEDS[1] }];
#IO_0_34 Schematic name=LD2
set_property -dict { PACKAGE_PIN R19   IOSTANDARD LVCMOS33 } [get_ports { LEDS[2] }];
#IO_L15P_T2_DQS_34 Schematic name=LD3
set_property -dict { PACKAGE_PIN T20   IOSTANDARD LVCMOS33 } [get_ports { LEDS[3] }];
#IO_25_34 Schematic name=LD4
set_property -dict { PACKAGE_PIN T19   IOSTANDARD LVCMOS33 } [get_ports { LEDS[4] }];


##Push button
#IO_L19N_T3_VREF_34 Schematic name=SW0
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { RESET }];

##UART
#IO_L6P_T0_35 Schematic name=JA1_P
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { TXD }];
#IO_L6N_T0_VREF_35 Schematic name=JA1_N
set_property -dict { PACKAGE_PIN F17   IOSTANDARD LVCMOS33 } [get_ports { RXD }];