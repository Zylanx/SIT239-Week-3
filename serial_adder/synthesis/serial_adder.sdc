## Generated SDC file "serial_adder.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

## DATE    "Sat Jul 31 07:49:36 2021"

##
## DEVICE  "5CSEBA6U23I7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {i_clk} -period "50MHz" -waveform { 0.000 10.000 } [get_ports {i_clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {i_clk}] -rise_to [get_clocks {i_clk}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {i_clk}] -rise_to [get_clocks {i_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {i_clk}] -fall_to [get_clocks {i_clk}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {i_clk}] -fall_to [get_clocks {i_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {i_clk}] -rise_to [get_clocks {i_clk}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {i_clk}] -rise_to [get_clocks {i_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {i_clk}] -fall_to [get_clocks {i_clk}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {i_clk}] -fall_to [get_clocks {i_clk}] -hold 0.060  


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

set_false_path -from * -to [get_ports {i_sliders[0] i_sliders[1] i_sliders[2]}]
set_false_path -from * -to [get_ports {o_leds[0] o_leds[1] o_leds[2] o_leds[3]}]
set_false_path -from [get_ports {i_sliders[0] i_sliders[1] i_sliders[2]}] -to *
set_false_path -from [get_ports {o_leds[0] o_leds[1] o_leds[2] o_leds[3]}] -to *


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

