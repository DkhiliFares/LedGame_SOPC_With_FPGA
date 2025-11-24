# Legal Notice: (C)2025 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	SoPC_mon_processeur 	SoPC_mon_processeur:*
set 	SoPC_mon_processeur_oci 	SoPC_mon_processeur_nios2_oci:the_SoPC_mon_processeur_nios2_oci
set 	SoPC_mon_processeur_oci_break 	SoPC_mon_processeur_nios2_oci_break:the_SoPC_mon_processeur_nios2_oci_break
set 	SoPC_mon_processeur_ocimem 	SoPC_mon_processeur_nios2_ocimem:the_SoPC_mon_processeur_nios2_ocimem
set 	SoPC_mon_processeur_oci_debug 	SoPC_mon_processeur_nios2_oci_debug:the_SoPC_mon_processeur_nios2_oci_debug
set 	SoPC_mon_processeur_wrapper 	SoPC_mon_processeur_jtag_debug_module_wrapper:the_SoPC_mon_processeur_jtag_debug_module_wrapper
set 	SoPC_mon_processeur_jtag_tck 	SoPC_mon_processeur_jtag_debug_module_tck:the_SoPC_mon_processeur_jtag_debug_module_tck
set 	SoPC_mon_processeur_jtag_sysclk 	SoPC_mon_processeur_jtag_debug_module_sysclk:the_SoPC_mon_processeur_jtag_debug_module_sysclk
set 	SoPC_mon_processeur_oci_path 	 [format "%s|%s" $SoPC_mon_processeur $SoPC_mon_processeur_oci]
set 	SoPC_mon_processeur_oci_break_path 	 [format "%s|%s" $SoPC_mon_processeur_oci_path $SoPC_mon_processeur_oci_break]
set 	SoPC_mon_processeur_ocimem_path 	 [format "%s|%s" $SoPC_mon_processeur_oci_path $SoPC_mon_processeur_ocimem]
set 	SoPC_mon_processeur_oci_debug_path 	 [format "%s|%s" $SoPC_mon_processeur_oci_path $SoPC_mon_processeur_oci_debug]
set 	SoPC_mon_processeur_jtag_tck_path 	 [format "%s|%s|%s" $SoPC_mon_processeur_oci_path $SoPC_mon_processeur_wrapper $SoPC_mon_processeur_jtag_tck]
set 	SoPC_mon_processeur_jtag_sysclk_path 	 [format "%s|%s|%s" $SoPC_mon_processeur_oci_path $SoPC_mon_processeur_wrapper $SoPC_mon_processeur_jtag_sysclk]
set 	SoPC_mon_processeur_jtag_sr 	 [format "%s|*sr" $SoPC_mon_processeur_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$SoPC_mon_processeur_oci_break_path|break_readreg*] -to [get_keepers *$SoPC_mon_processeur_jtag_sr*]
set_false_path -from [get_keepers *$SoPC_mon_processeur_oci_debug_path|*resetlatch]     -to [get_keepers *$SoPC_mon_processeur_jtag_sr[33]]
set_false_path -from [get_keepers *$SoPC_mon_processeur_oci_debug_path|monitor_ready]  -to [get_keepers *$SoPC_mon_processeur_jtag_sr[0]]
set_false_path -from [get_keepers *$SoPC_mon_processeur_oci_debug_path|monitor_error]  -to [get_keepers *$SoPC_mon_processeur_jtag_sr[34]]
set_false_path -from [get_keepers *$SoPC_mon_processeur_ocimem_path|*MonDReg*] -to [get_keepers *$SoPC_mon_processeur_jtag_sr*]
set_false_path -from *$SoPC_mon_processeur_jtag_sr*    -to *$SoPC_mon_processeur_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$SoPC_mon_processeur_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$SoPC_mon_processeur_oci_debug_path|monitor_go
