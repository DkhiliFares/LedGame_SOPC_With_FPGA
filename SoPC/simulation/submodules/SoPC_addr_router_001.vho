--IP Functional Simulation Model
--VERSION_BEGIN 13.0 cbx_mgl 2013:06:12:18:04:42:SJ cbx_simgen 2013:06:12:18:03:40:SJ  VERSION_END


-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Altera disclaims all warranties of any kind).


--synopsys translate_off

--synthesis_resources = mux21 23 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  SoPC_addr_router_001 IS 
	 PORT 
	 ( 
		 clk	:	IN  STD_LOGIC;
		 reset	:	IN  STD_LOGIC;
		 sink_data	:	IN  STD_LOGIC_VECTOR (88 DOWNTO 0);
		 sink_endofpacket	:	IN  STD_LOGIC;
		 sink_ready	:	OUT  STD_LOGIC;
		 sink_startofpacket	:	IN  STD_LOGIC;
		 sink_valid	:	IN  STD_LOGIC;
		 src_channel	:	OUT  STD_LOGIC_VECTOR (5 DOWNTO 0);
		 src_data	:	OUT  STD_LOGIC_VECTOR (88 DOWNTO 0);
		 src_endofpacket	:	OUT  STD_LOGIC;
		 src_ready	:	IN  STD_LOGIC;
		 src_startofpacket	:	OUT  STD_LOGIC;
		 src_valid	:	OUT  STD_LOGIC
	 ); 
 END SoPC_addr_router_001;

 ARCHITECTURE RTL OF SoPC_addr_router_001 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_27m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_28m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_33m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_37m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_38m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_43m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_44m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_47m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_48m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_53m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_54m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_55m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_57m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_channel_58m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_31m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_40m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_41m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_49m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_50m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_51m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_59m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_60m_dataout	:	STD_LOGIC;
	 SIGNAL	wire_sopc_addr_router_001_src_data_61m_dataout	:	STD_LOGIC;
	 SIGNAL  wire_w_lg_w_sink_data_range120w320w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range123w296w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range144w271w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w2w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range123w277w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range126w278w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_sink_data_range147w270w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  s_wire_sopc_addr_router_001_src_channel_1_298_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_sopc_addr_router_001_src_channel_2_315_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_sopc_addr_router_001_src_channel_3_332_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_sopc_addr_router_001_src_channel_4_349_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_sopc_addr_router_001_src_channel_5_366_dataout :	STD_LOGIC;
	 SIGNAL  wire_w_sink_data_range120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_sink_data_range147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_w_lg_w_sink_data_range120w320w(0) <= wire_w_sink_data_range120w(0) AND wire_w_lg_w_sink_data_range123w277w(0);
	wire_w_lg_w_sink_data_range123w296w(0) <= wire_w_sink_data_range123w(0) AND wire_w_lg_w_sink_data_range126w278w(0);
	wire_w_lg_w_sink_data_range144w271w(0) <= wire_w_sink_data_range144w(0) AND wire_w_lg_w_sink_data_range147w270w(0);
	wire_w1w(0) <= NOT s_wire_sopc_addr_router_001_src_channel_1_298_dataout;
	wire_w2w(0) <= NOT s_wire_sopc_addr_router_001_src_channel_2_315_dataout;
	wire_w_lg_w_sink_data_range123w277w(0) <= NOT wire_w_sink_data_range123w(0);
	wire_w_lg_w_sink_data_range126w278w(0) <= NOT wire_w_sink_data_range126w(0);
	wire_w_lg_w_sink_data_range147w270w(0) <= NOT wire_w_sink_data_range147w(0);
	s_wire_sopc_addr_router_001_src_channel_1_298_dataout <= (((wire_w_lg_w_sink_data_range144w271w(0) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND sink_data(51));
	s_wire_sopc_addr_router_001_src_channel_2_315_dataout <= (((((((((((wire_w_lg_w_sink_data_range123w277w(0) AND wire_w_lg_w_sink_data_range126w278w(0)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND sink_data(51));
	s_wire_sopc_addr_router_001_src_channel_3_332_dataout <= ((((((((((wire_w_lg_w_sink_data_range123w296w(0) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND sink_data(51));
	s_wire_sopc_addr_router_001_src_channel_4_349_dataout <= (((((((((((((NOT sink_data(39)) AND wire_w_lg_w_sink_data_range123w277w(0)) AND sink_data(41)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND sink_data(51));
	s_wire_sopc_addr_router_001_src_channel_5_366_dataout <= (((((((((((wire_w_lg_w_sink_data_range120w320w(0) AND sink_data(41)) AND (NOT sink_data(42))) AND (NOT sink_data(43))) AND (NOT sink_data(44))) AND (NOT sink_data(45))) AND (NOT sink_data(46))) AND (NOT sink_data(47))) AND sink_data(48)) AND (NOT sink_data(49))) AND (NOT sink_data(50))) AND sink_data(51));
	sink_ready <= src_ready;
	src_channel <= ( wire_sopc_addr_router_001_src_channel_53m_dataout & wire_sopc_addr_router_001_src_channel_54m_dataout & wire_sopc_addr_router_001_src_channel_55m_dataout & s_wire_sopc_addr_router_001_src_channel_5_366_dataout & wire_sopc_addr_router_001_src_channel_57m_dataout & wire_sopc_addr_router_001_src_channel_58m_dataout);
	src_data <= ( sink_data(88 DOWNTO 79) & wire_sopc_addr_router_001_src_data_59m_dataout & wire_sopc_addr_router_001_src_data_60m_dataout & wire_sopc_addr_router_001_src_data_61m_dataout & sink_data(75 DOWNTO 0));
	src_endofpacket <= sink_endofpacket;
	src_startofpacket <= sink_startofpacket;
	src_valid <= sink_valid;
	wire_w_sink_data_range120w(0) <= sink_data(39);
	wire_w_sink_data_range123w(0) <= sink_data(40);
	wire_w_sink_data_range126w(0) <= sink_data(41);
	wire_w_sink_data_range144w(0) <= sink_data(47);
	wire_w_sink_data_range147w(0) <= sink_data(48);
	wire_sopc_addr_router_001_src_channel_27m_dataout <= wire_w1w(0) AND NOT(s_wire_sopc_addr_router_001_src_channel_2_315_dataout);
	wire_sopc_addr_router_001_src_channel_28m_dataout <= s_wire_sopc_addr_router_001_src_channel_1_298_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_2_315_dataout);
	wire_sopc_addr_router_001_src_channel_33m_dataout <= s_wire_sopc_addr_router_001_src_channel_2_315_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_3_332_dataout);
	wire_sopc_addr_router_001_src_channel_37m_dataout <= wire_sopc_addr_router_001_src_channel_27m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_3_332_dataout);
	wire_sopc_addr_router_001_src_channel_38m_dataout <= wire_sopc_addr_router_001_src_channel_28m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_3_332_dataout);
	wire_sopc_addr_router_001_src_channel_43m_dataout <= wire_sopc_addr_router_001_src_channel_33m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_4_349_dataout);
	wire_sopc_addr_router_001_src_channel_44m_dataout <= s_wire_sopc_addr_router_001_src_channel_3_332_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_4_349_dataout);
	wire_sopc_addr_router_001_src_channel_47m_dataout <= wire_sopc_addr_router_001_src_channel_37m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_4_349_dataout);
	wire_sopc_addr_router_001_src_channel_48m_dataout <= wire_sopc_addr_router_001_src_channel_38m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_4_349_dataout);
	wire_sopc_addr_router_001_src_channel_53m_dataout <= wire_sopc_addr_router_001_src_channel_43m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_channel_54m_dataout <= wire_sopc_addr_router_001_src_channel_44m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_channel_55m_dataout <= s_wire_sopc_addr_router_001_src_channel_4_349_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_channel_57m_dataout <= wire_sopc_addr_router_001_src_channel_47m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_channel_58m_dataout <= wire_sopc_addr_router_001_src_channel_48m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_data_31m_dataout <= wire_w1w(0) OR s_wire_sopc_addr_router_001_src_channel_2_315_dataout;
	wire_sopc_addr_router_001_src_data_40m_dataout <= wire_w2w(0) AND NOT(s_wire_sopc_addr_router_001_src_channel_3_332_dataout);
	wire_sopc_addr_router_001_src_data_41m_dataout <= wire_sopc_addr_router_001_src_data_31m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_3_332_dataout);
	wire_sopc_addr_router_001_src_data_49m_dataout <= s_wire_sopc_addr_router_001_src_channel_3_332_dataout OR s_wire_sopc_addr_router_001_src_channel_4_349_dataout;
	wire_sopc_addr_router_001_src_data_50m_dataout <= wire_sopc_addr_router_001_src_data_40m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_4_349_dataout);
	wire_sopc_addr_router_001_src_data_51m_dataout <= wire_sopc_addr_router_001_src_data_41m_dataout OR s_wire_sopc_addr_router_001_src_channel_4_349_dataout;
	wire_sopc_addr_router_001_src_data_59m_dataout <= wire_sopc_addr_router_001_src_data_49m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_data_60m_dataout <= wire_sopc_addr_router_001_src_data_50m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);
	wire_sopc_addr_router_001_src_data_61m_dataout <= wire_sopc_addr_router_001_src_data_51m_dataout AND NOT(s_wire_sopc_addr_router_001_src_channel_5_366_dataout);

 END RTL; --SoPC_addr_router_001
--synopsys translate_on
--VALID FILE
