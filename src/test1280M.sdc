## Generated SDC file "counter.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Intel Corporation"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 222 09/21/2018 SJ Pro Edition"

## DATE    "Sat May 22 22:57:03 2021"

##
## DEVICE  "10CX220YF780E5G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {ECLK0} -period 25.000 -waveform { 0.000 12.500 } [get_ports {ECLK0}]
create_clock -name {altera_reserved_tck} -period 10.000 -waveform { 0.000 5.00 } [get_ports {altera_reserved_tck}]



#**************************************************************
# Create Generated Clock
#**************************************************************
create_generated_clock -name {genclk_u0|iopll_0|outclk0} -source [get_pins {genclk_u0|iopll_0|altera_iopll_i|c10gx_pll|iopll_inst|refclk[0]}] -duty_cycle 50/1 -multiply_by 16 -divide_by 2 -master_clock {ECLK0} [get_pins {genclk_u0|iopll_0|altera_iopll_i|c10gx_pll|iopll_inst|outclk[0]}] 
#create_generated_clock -name {genclk_u0|iopll_0|outclk1} -source [get_pins {genclk_u0|iopll_0|altera_iopll_i|c10gx_pll|iopll_inst|refclk[0]}] -duty_cycle 50/1 -multiply_by 16 -divide_by 16 -master_clock {ECLK0} [get_pins {genclk_u0|iopll_0|altera_iopll_i|c10gx_pll|iopll_inst|outclk[1]}] 
#create_generated_clock -name {genclk_u0|iopll_0|outclk2} -source [get_pins {genclk_u0|iopll_0|altera_iopll_i|c10gx_pll|iopll_inst|refclk[0]}] -duty_cycle 50/1 -multiply_by 16 -divide_by 80 -master_clock {ECLK0} [get_pins {genclk_u0|iopll_0|altera_iopll_i|c10gx_pll|iopll_inst|outclk[2]}] 




#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.040  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.130  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.130  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {altera_reserved_tck}]  0.210  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {altera_reserved_tck}]  0.210  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.040  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.130  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.130  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -rise_to [get_clocks {altera_reserved_tck}]  0.210  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk0}] -fall_to [get_clocks {altera_reserved_tck}]  0.210  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.090  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.090  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.090  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.090  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -rise_to [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk1}] -fall_to [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk2}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.130  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk2}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.130  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk2}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk2}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk2}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {genclk_u0|iopll_0|outclk2}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk2}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.130  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk2}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.130  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk2}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk2}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk2}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {genclk_u0|iopll_0|outclk2}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk2}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {hardware_i2c_top_inst|i2c_slave_top_inst|count[2]}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -fall_from [get_clocks {hardware_i2c_top_inst|I2C_Master_inst|clock}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk1}]  0.200  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.210  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.210  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.210  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {genclk_u0|iopll_0|outclk0}]  0.210  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}]  0.030  



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

