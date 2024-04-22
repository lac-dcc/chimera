--altdq_dqs CBX_SINGLE_OUTPUT_FILE="ON" DELAY_BUFFER_MODE="LOW" DELAY_DQS_ENABLE_BY_HALF_CYCLE="FALSE" device_family="stratixiii" DQ_HALF_RATE_USE_DATAOUTBYPASS="FALSE" DQ_INPUT_REG_ASYNC_MODE="NONE" DQ_INPUT_REG_CLK_SOURCE="CORE" DQ_INPUT_REG_MODE="DDIO" DQ_INPUT_REG_POWER_UP="HIGH" DQ_INPUT_REG_SYNC_MODE="NONE" DQ_INPUT_REG_USE_CLKN="FALSE" DQ_IPA_ADD_INPUT_CYCLE_DELAY="FALSE" DQ_IPA_ADD_PHASE_TRANSFER_REG="FALSE" DQ_IPA_BYPASS_OUTPUT_REGISTER="TRUE" DQ_IPA_INVERT_PHASE="FALSE" DQ_IPA_PHASE_SETTING=0 DQ_OE_REG_ASYNC_MODE="PRESET" DQ_OE_REG_MODE="FF" DQ_OE_REG_POWER_UP="HIGH" DQ_OE_REG_SYNC_MODE="NONE" DQ_OUTPUT_REG_ASYNC_MODE="NONE" DQ_OUTPUT_REG_MODE="DDIO" DQ_OUTPUT_REG_POWER_UP="HIGH" DQ_OUTPUT_REG_SYNC_MODE="NONE" DQS_CTRL_LATCHES_ENABLE="FALSE" DQS_DELAY_CHAIN_DELAYCTRLIN_SOURCE="CORE" DQS_DELAY_CHAIN_PHASE_SETTING=0 DQS_DQSN_MODE="DIFFERENTIAL" DQS_ENABLE_CTRL_ADD_PHASE_TRANSFER_REG="FALSE" DQS_ENABLE_CTRL_INVERT_PHASE="FALSE" DQS_ENABLE_CTRL_PHASE_SETTING=0 DQS_OE_REG_ASYNC_MODE="PRESET" DQS_OE_REG_MODE="DDIO" DQS_OE_REG_POWER_UP="HIGH" DQS_OE_REG_SYNC_MODE="NONE" DQS_OFFSETCTRL_ENABLE="FALSE" DQS_OUTPUT_REG_ASYNC_MODE="NONE" DQS_OUTPUT_REG_MODE="DDIO" DQS_OUTPUT_REG_POWER_UP="LOW" DQS_OUTPUT_REG_SYNC_MODE="NONE" DQS_PHASE_SHIFT=0 IO_CLOCK_DIVIDER_CLK_SOURCE="CORE" IO_CLOCK_DIVIDER_INVERT_PHASE="FALSE" IO_CLOCK_DIVIDER_PHASE_SETTING=0 LEVEL_DQS_ENABLE="FALSE" NUMBER_OF_BIDIR_DQ=8 NUMBER_OF_CLK_DIVIDER=0 NUMBER_OF_INPUT_DQ=0 NUMBER_OF_OUTPUT_DQ=0 OCT_REG_MODE="FF" USE_DQ_INPUT_DELAY_CHAIN="TRUE" USE_DQ_IPA="FALSE" USE_DQ_IPA_PHASECTRLIN="FALSE" USE_DQ_OE_DELAY_CHAIN1="FALSE" USE_DQ_OE_DELAY_CHAIN2="FALSE" USE_DQ_OE_PATH="TRUE" USE_DQ_OUTPUT_DELAY_CHAIN1="FALSE" USE_DQ_OUTPUT_DELAY_CHAIN2="FALSE" USE_DQS="TRUE" USE_DQS_DELAY_CHAIN="FALSE" USE_DQS_DELAY_CHAIN_PHASECTRLIN="FALSE" USE_DQS_ENABLE="FALSE" USE_DQS_ENABLE_CTRL="FALSE" USE_DQS_ENABLE_CTRL_PHASECTRLIN="FALSE" USE_DQS_INPUT_DELAY_CHAIN="FALSE" USE_DQS_INPUT_PATH="FALSE" USE_DQS_OE_DELAY_CHAIN1="FALSE" USE_DQS_OE_DELAY_CHAIN2="FALSE" USE_DQS_OE_PATH="TRUE" USE_DQS_OUTPUT_DELAY_CHAIN1="FALSE" USE_DQS_OUTPUT_DELAY_CHAIN2="FALSE" USE_DQS_OUTPUT_PATH="TRUE" USE_DQSBUSOUT_DELAY_CHAIN="FALSE" USE_DQSENABLE_DELAY_CHAIN="FALSE" USE_DYNAMIC_OCT="TRUE" USE_HALF_RATE="FALSE" USE_IO_CLOCK_DIVIDER_MASTERIN="FALSE" USE_IO_CLOCK_DIVIDER_PHASECTRLIN="FALSE" USE_OCT_DELAY_CHAIN1="FALSE" USE_OCT_DELAY_CHAIN2="FALSE" bidir_dq_input_data_in bidir_dq_input_data_out_high bidir_dq_input_data_out_low bidir_dq_io_config_ena bidir_dq_oct_in bidir_dq_oct_out bidir_dq_oe_in bidir_dq_oe_out bidir_dq_output_data_in_high bidir_dq_output_data_in_low bidir_dq_output_data_out bidir_dq_sreset config_clk config_datain config_update dq_input_reg_clk dq_output_reg_clk dqs_areset dqs_oct_in dqs_oct_out dqs_oe_in dqs_oe_out dqs_output_data_in_high dqs_output_data_in_low dqs_output_data_out dqs_output_reg_clk dqsn_oct_in dqsn_oct_out dqsn_oe_in dqsn_oe_out oct_reg_clk
--VERSION_BEGIN 8.0SP1 cbx_altdq_dqs 2008:06:02:292401 cbx_mgl 2008:06:02:292401 cbx_stratixiii 2008:06:18:296807  VERSION_END


-- Copyright (C) 1991-2008 Altera Corporation
--  Your use of Altera Corporation's design tools, logic functions 
--  and other software and tools, and its AMPP partner logic 
--  functions, and any output files from any of the foregoing 
--  (including device programming or simulation files), and any 
--  associated documentation or information are expressly subject 
--  to the terms and conditions of the Altera Program License 
--  Subscription Agreement, Altera MegaCore Function License 
--  Agreement, or other applicable license agreement, including, 
--  without limitation, that your use is for the sole purpose of 
--  programming logic devices manufactured by Altera and sold by 
--  Altera or its authorized distributors.  Please refer to the 
--  applicable agreement for further details.



 LIBRARY altera;
 USE altera.all;

 LIBRARY stratixiii;
 USE stratixiii.all;

--synthesis_resources = stratixiii_ddio_in 8 stratixiii_ddio_oe 2 stratixiii_ddio_out 9 stratixiii_delay_chain 8 stratixiii_dqs_config 2 stratixiii_ff 18 stratixiii_io_clock_divider 2 stratixiii_io_config 10 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  dq_dqs_inst IS 
	 PORT 
	 ( 
		 bidir_dq_input_data_in	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 bidir_dq_input_data_out_high	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 bidir_dq_input_data_out_low	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 bidir_dq_io_config_ena	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '1');
		 bidir_dq_oct_in	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 bidir_dq_oct_out	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 bidir_dq_oe_in	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 bidir_dq_oe_out	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 bidir_dq_output_data_in_high	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 bidir_dq_output_data_in_low	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 bidir_dq_output_data_out	:	OUT  STD_LOGIC_VECTOR (7 DOWNTO 0);
		 bidir_dq_sreset	:	IN  STD_LOGIC_VECTOR (7 DOWNTO 0) := (OTHERS => '0');
		 config_clk	:	IN  STD_LOGIC := '0';
		 config_datain	:	IN  STD_LOGIC := '0';
		 config_update	:	IN  STD_LOGIC := '0';
		 dq_input_reg_clk	:	IN  STD_LOGIC := '0';
		 dq_output_reg_clk	:	IN  STD_LOGIC := '0';
		 dqs_areset	:	IN  STD_LOGIC := '0';
		 dqs_oct_in	:	IN  STD_LOGIC := '0';
		 dqs_oct_out	:	OUT  STD_LOGIC;
		 dqs_oe_in	:	IN  STD_LOGIC := '0';
		 dqs_oe_out	:	OUT  STD_LOGIC;
		 dqs_output_data_in_high	:	IN  STD_LOGIC := '0';
		 dqs_output_data_in_low	:	IN  STD_LOGIC := '0';
		 dqs_output_data_out	:	OUT  STD_LOGIC;
		 dqs_output_reg_clk	:	IN  STD_LOGIC := '0';
		 dqsn_oct_in	:	IN  STD_LOGIC := '0';
		 dqsn_oct_out	:	OUT  STD_LOGIC;
		 dqsn_oe_in	:	IN  STD_LOGIC := '0';
		 dqsn_oe_out	:	OUT  STD_LOGIC;
		 oct_reg_clk	:	IN  STD_LOGIC := '0'
	 ); 
 END dq_dqs_inst;

 ARCHITECTURE RTL OF dq_dqs_inst IS

--	 ATTRIBUTE synthesis_clearbox : boolean;
--	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS true;
	 ATTRIBUTE ALTERA_ATTRIBUTE : string;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF RTL : ARCHITECTURE IS "{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_0_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_1_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_2_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_3_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_4_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_5_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_6_output_ddio_out_inst"" }DQ_GROUP=9;{ -from ""dqs_output_ddio_out_inst"" -to ""bidir_dq_7_output_ddio_out_inst"" }DQ_GROUP=9";

	 SIGNAL  wire_bidir_dq_0_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_0_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_1_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_1_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_2_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_2_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_3_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_3_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_4_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_4_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_5_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_5_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_6_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_6_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_7_ddio_in_inst_regouthi	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_7_ddio_in_inst_regoutlo	:	STD_LOGIC;
	 SIGNAL  wire_dqs_oe_ddio_oe_inst_w_lg_dataout1w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dqs_oe_ddio_oe_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_dqsn_oe_ddio_oe_inst_w_lg_dataout2w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dqsn_oe_ddio_oe_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_0_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_1_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_2_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_3_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_4_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_5_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_6_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_7_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_dqs_output_ddio_out_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_0_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_1_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_2_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_3_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_4_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_5_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_6_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_7_input_delay_chain_inst_dataout	:	STD_LOGIC;
	 SIGNAL  wire_dqs_config_0_inst_dividerphasesetting	:	STD_LOGIC;
	 SIGNAL  wire_dqs_config_1_inst_dividerphasesetting	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_0_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_0_oe_ff_inst_w_lg_q11w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_0_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_1_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_1_oe_ff_inst_w_lg_q28w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_1_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_2_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_2_oe_ff_inst_w_lg_q41w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_2_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_3_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_3_oe_ff_inst_w_lg_q54w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_3_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_4_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_4_oe_ff_inst_w_lg_q67w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_4_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_5_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_5_oe_ff_inst_w_lg_q80w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_5_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_6_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_6_oe_ff_inst_w_lg_q93w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_6_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_7_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_7_oe_ff_inst_w_lg_q106w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_7_oe_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_dqs_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_dqsn_oct_ff_inst_q	:	STD_LOGIC;
	 SIGNAL  wire_io_clock_divider_0_inst_slaveout	:	STD_LOGIC;
	 SIGNAL  wire_bidir_dq_0_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_1_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_2_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_3_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_4_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_5_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_6_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_bidir_dq_7_io_config_inst_padtoinputregisterdelaysetting	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  dqs_config_ena	:	STD_LOGIC;
	 SIGNAL  dqs_io_config_ena	:	STD_LOGIC;
	 SIGNAL  dqsn_io_config_ena	:	STD_LOGIC;
	 SIGNAL  io_clock_divider_clk	:	STD_LOGIC;
	 COMPONENT  stratixiii_ddio_in
	 GENERIC 
	 (
		async_mode	:	STRING := "none";
		power_up	:	STRING := "low";
		sync_mode	:	STRING := "none";
		use_clkn	:	STRING := "false";
		lpm_type	:	STRING := "stratixiii_ddio_in"
	 );
	 PORT
	 ( 
		areset	:	IN STD_LOGIC := '0';
		clk	:	IN STD_LOGIC := '0';
		clkn	:	IN STD_LOGIC := '0';
		datain	:	IN STD_LOGIC := '0';
		ena	:	IN STD_LOGIC := '1';
		regouthi	:	OUT STD_LOGIC;
		regoutlo	:	OUT STD_LOGIC;
		sreset	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_ddio_oe
	 GENERIC 
	 (
		async_mode	:	STRING := "none";
		power_up	:	STRING := "low";
		sync_mode	:	STRING := "none";
		lpm_type	:	STRING := "stratixiii_ddio_oe"
	 );
	 PORT
	 ( 
		areset	:	IN STD_LOGIC := '0';
		clk	:	IN STD_LOGIC := '0';
		dataout	:	OUT STD_LOGIC;
		ena	:	IN STD_LOGIC := '1';
		oe	:	IN STD_LOGIC := '1';
		sreset	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_ddio_out
	 GENERIC 
	 (
		async_mode	:	STRING := "none";
		half_rate_mode	:	STRING := "false";
		power_up	:	STRING := "low";
		sync_mode	:	STRING := "none";
		use_new_clocking_model	:	STRING := "false";
		lpm_type	:	STRING := "stratixiii_ddio_out"
	 );
	 PORT
	 ( 
		areset	:	IN STD_LOGIC := '0';
		clk	:	IN STD_LOGIC := '0';
		clkhi	:	IN STD_LOGIC := '0';
		clklo	:	IN STD_LOGIC := '0';
		datainhi	:	IN STD_LOGIC := '0';
		datainlo	:	IN STD_LOGIC := '0';
		dataout	:	OUT STD_LOGIC;
		ena	:	IN STD_LOGIC := '1';
		muxsel	:	IN STD_LOGIC := '0';
		sreset	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_delay_chain
	 PORT
	 ( 
		datain	:	IN STD_LOGIC := '0';
		dataout	:	OUT STD_LOGIC;
		delayctrlin	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_dqs_config
	 PORT
	 ( 
		clk	:	IN STD_LOGIC := '0';
		datain	:	IN STD_LOGIC := '0';
		dataout	:	OUT STD_LOGIC;
		dividerphasesetting	:	OUT STD_LOGIC;
		dqoutputphaseinvert	:	OUT STD_LOGIC;
		dqoutputphasesetting	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		dqsbusoutdelaysetting	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		dqsenablectrlphaseinvert	:	OUT STD_LOGIC;
		dqsenablectrlphasesetting	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		dqsenabledelaysetting	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		dqsinputphasesetting	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		dqsoutputphaseinvert	:	OUT STD_LOGIC;
		dqsoutputphasesetting	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		ena	:	IN STD_LOGIC := '1';
		enadataoutbypass	:	OUT STD_LOGIC;
		enadqsenablephasetransferreg	:	OUT STD_LOGIC;
		enainputcycledelaysetting	:	OUT STD_LOGIC;
		enainputphasetransferreg	:	OUT STD_LOGIC;
		enaoctcycledelaysetting	:	OUT STD_LOGIC;
		enaoctphasetransferreg	:	OUT STD_LOGIC;
		enaoutputcycledelaysetting	:	OUT STD_LOGIC;
		enaoutputphasetransferreg	:	OUT STD_LOGIC;
		octdelaysetting1	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		octdelaysetting2	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		resyncinputphaseinvert	:	OUT STD_LOGIC;
		resyncinputphasesetting	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		update	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_ff
	 GENERIC 
	 (
		--POWER_UP	:	STRING := "DONT_CARE"; -- *** ???
		POWER_UP	:	STRING := "low";
		lpm_type	:	STRING := "stratixiii_ff"
	 );
	 PORT
	 ( 
		aload	:	IN STD_LOGIC := '0';
		asdata	:	IN STD_LOGIC := '0';
		clk	:	IN STD_LOGIC := '0';
		clrn	:	IN STD_LOGIC := '1'; 
		d	:	IN STD_LOGIC := '0';
		ena	:	IN STD_LOGIC := '1';
		q	:	OUT STD_LOGIC;
		sclr	:	IN STD_LOGIC := '0';
		sload	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_io_clock_divider
	 GENERIC 
	 (
		delay_buffer_mode	:	STRING := "high";
		invert_phase	:	STRING := "false";
		phase_setting	:	NATURAL := 0;
		sim_buffer_delay_increment	:	NATURAL := 10;
		sim_high_buffer_intrinsic_delay	:	NATURAL := 175;
		sim_low_buffer_intrinsic_delay	:	NATURAL := 350;
		use_masterin	:	STRING := "false";
		use_phasectrlin	:	STRING := "true";
		lpm_type	:	STRING := "stratixiii_io_clock_divider"
	 );
	 PORT
	 ( 
		clk	:	IN STD_LOGIC := '0';
		clkout	:	OUT STD_LOGIC;
		delayctrlin	:	IN STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
		masterin	:	IN STD_LOGIC := '0';
		phasectrlin	:	IN STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
		phaseinvertctrl	:	IN STD_LOGIC := '0';
		phaseselect	:	IN STD_LOGIC := '0';
		slaveout	:	OUT STD_LOGIC
	 ); 
	 END COMPONENT;
	 COMPONENT  stratixiii_io_config
	 PORT
	 ( 
		clk	:	IN STD_LOGIC := '0';
		datain	:	IN STD_LOGIC := '0';
		dataout	:	OUT STD_LOGIC;
		ena	:	IN STD_LOGIC := '1';
		outputdelaysetting1	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		outputdelaysetting2	:	OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		padtoinputregisterdelaysetting	:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		update	:	IN STD_LOGIC := '0'
	 ); 
	 END COMPONENT;
 BEGIN

	bidir_dq_input_data_out_high <= ( wire_bidir_dq_7_ddio_in_inst_regouthi & wire_bidir_dq_6_ddio_in_inst_regouthi & wire_bidir_dq_5_ddio_in_inst_regouthi & wire_bidir_dq_4_ddio_in_inst_regouthi & wire_bidir_dq_3_ddio_in_inst_regouthi & wire_bidir_dq_2_ddio_in_inst_regouthi & wire_bidir_dq_1_ddio_in_inst_regouthi & wire_bidir_dq_0_ddio_in_inst_regouthi);
	bidir_dq_input_data_out_low <= ( wire_bidir_dq_7_ddio_in_inst_regoutlo & wire_bidir_dq_6_ddio_in_inst_regoutlo & wire_bidir_dq_5_ddio_in_inst_regoutlo & wire_bidir_dq_4_ddio_in_inst_regoutlo & wire_bidir_dq_3_ddio_in_inst_regoutlo & wire_bidir_dq_2_ddio_in_inst_regoutlo & wire_bidir_dq_1_ddio_in_inst_regoutlo & wire_bidir_dq_0_ddio_in_inst_regoutlo);
	bidir_dq_oct_out <= ( wire_bidir_dq_7_oct_ff_inst_q & wire_bidir_dq_6_oct_ff_inst_q & wire_bidir_dq_5_oct_ff_inst_q & wire_bidir_dq_4_oct_ff_inst_q & wire_bidir_dq_3_oct_ff_inst_q & wire_bidir_dq_2_oct_ff_inst_q & wire_bidir_dq_1_oct_ff_inst_q & wire_bidir_dq_0_oct_ff_inst_q);
	bidir_dq_oe_out <= ( wire_bidir_dq_7_oe_ff_inst_w_lg_q106w & wire_bidir_dq_6_oe_ff_inst_w_lg_q93w & wire_bidir_dq_5_oe_ff_inst_w_lg_q80w & wire_bidir_dq_4_oe_ff_inst_w_lg_q67w & wire_bidir_dq_3_oe_ff_inst_w_lg_q54w & wire_bidir_dq_2_oe_ff_inst_w_lg_q41w & wire_bidir_dq_1_oe_ff_inst_w_lg_q28w & wire_bidir_dq_0_oe_ff_inst_w_lg_q11w);
	bidir_dq_output_data_out <= ( wire_bidir_dq_7_output_ddio_out_inst_dataout & wire_bidir_dq_6_output_ddio_out_inst_dataout & wire_bidir_dq_5_output_ddio_out_inst_dataout & wire_bidir_dq_4_output_ddio_out_inst_dataout & wire_bidir_dq_3_output_ddio_out_inst_dataout & wire_bidir_dq_2_output_ddio_out_inst_dataout & wire_bidir_dq_1_output_ddio_out_inst_dataout & wire_bidir_dq_0_output_ddio_out_inst_dataout);
	dqs_config_ena <= '1';
	dqs_io_config_ena <= '1';
	dqs_oct_out <= wire_dqs_oct_ff_inst_q;
	dqs_oe_out <= wire_dqs_oe_ddio_oe_inst_w_lg_dataout1w(0);
	dqs_output_data_out <= wire_dqs_output_ddio_out_inst_dataout;
	dqsn_io_config_ena <= '1';
	dqsn_oct_out <= wire_dqsn_oct_ff_inst_q;
	dqsn_oe_out <= wire_dqsn_oe_ddio_oe_inst_w_lg_dataout2w(0);
	io_clock_divider_clk <= '0';
	bidir_dq_0_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_0_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_0_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_0_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(0)
	  );
	bidir_dq_1_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_1_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_1_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_1_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(1)
	  );
	bidir_dq_2_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_2_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_2_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_2_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(2)
	  );
	bidir_dq_3_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_3_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_3_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_3_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(3)
	  );
	bidir_dq_4_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_4_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_4_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_4_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(4)
	  );
	bidir_dq_5_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_5_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_5_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_5_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(5)
	  );
	bidir_dq_6_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_6_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_6_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_6_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(6)
	  );
	bidir_dq_7_ddio_in_inst :  stratixiii_ddio_in
	  GENERIC MAP (
		async_mode => "none",
		power_up => "high",
		sync_mode => "none",
		use_clkn => "false"
	  )
	  PORT MAP ( 
		clk => dq_input_reg_clk,
		datain => wire_bidir_dq_7_input_delay_chain_inst_dataout,
		regouthi => wire_bidir_dq_7_ddio_in_inst_regouthi,
		regoutlo => wire_bidir_dq_7_ddio_in_inst_regoutlo,
		sreset => bidir_dq_sreset(7)
	  );
	wire_dqs_oe_ddio_oe_inst_w_lg_dataout1w(0) <= NOT wire_dqs_oe_ddio_oe_inst_dataout;
	dqs_oe_ddio_oe_inst :  stratixiii_ddio_oe
	  GENERIC MAP (
		async_mode => "preset",
		power_up => "high",
		sync_mode => "none"
	  )
	  PORT MAP ( 
		areset => dqs_areset,
		clk => dqs_output_reg_clk,
		dataout => wire_dqs_oe_ddio_oe_inst_dataout,
		oe => dqs_oe_in
	  );
	wire_dqsn_oe_ddio_oe_inst_w_lg_dataout2w(0) <= NOT wire_dqsn_oe_ddio_oe_inst_dataout;
	dqsn_oe_ddio_oe_inst :  stratixiii_ddio_oe
	  GENERIC MAP (
		async_mode => "preset",
		power_up => "high",
		sync_mode => "none"
	  )
	  PORT MAP ( 
		clk => dqs_output_reg_clk,
		dataout => wire_dqsn_oe_ddio_oe_inst_dataout,
		oe => dqsn_oe_in
	  );
	bidir_dq_0_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(0),
		datainlo => bidir_dq_output_data_in_low(0),
		dataout => wire_bidir_dq_0_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(0)
	  );
	bidir_dq_1_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(1),
		datainlo => bidir_dq_output_data_in_low(1),
		dataout => wire_bidir_dq_1_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(1)
	  );
	bidir_dq_2_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(2),
		datainlo => bidir_dq_output_data_in_low(2),
		dataout => wire_bidir_dq_2_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(2)
	  );
	bidir_dq_3_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(3),
		datainlo => bidir_dq_output_data_in_low(3),
		dataout => wire_bidir_dq_3_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(3)
	  );
	bidir_dq_4_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(4),
		datainlo => bidir_dq_output_data_in_low(4),
		dataout => wire_bidir_dq_4_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(4)
	  );
	bidir_dq_5_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(5),
		datainlo => bidir_dq_output_data_in_low(5),
		dataout => wire_bidir_dq_5_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(5)
	  );
	bidir_dq_6_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(6),
		datainlo => bidir_dq_output_data_in_low(6),
		dataout => wire_bidir_dq_6_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(6)
	  );
	bidir_dq_7_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "high",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		clkhi => dq_output_reg_clk,
		clklo => dq_output_reg_clk,
		datainhi => bidir_dq_output_data_in_high(7),
		datainlo => bidir_dq_output_data_in_low(7),
		dataout => wire_bidir_dq_7_output_ddio_out_inst_dataout,
		muxsel => dq_output_reg_clk,
		sreset => bidir_dq_sreset(7)
	  );
	dqs_output_ddio_out_inst :  stratixiii_ddio_out
	  GENERIC MAP (
		async_mode => "none",
		half_rate_mode => "false",
		power_up => "low",
		sync_mode => "none",
		use_new_clocking_model => "true"
	  )
	  PORT MAP ( 
		areset => dqs_areset,
		clkhi => dqs_output_reg_clk,
		clklo => dqs_output_reg_clk,
		datainhi => dqs_output_data_in_high,
		datainlo => dqs_output_data_in_low,
		dataout => wire_dqs_output_ddio_out_inst_dataout,
		muxsel => dqs_output_reg_clk
	  );
	bidir_dq_0_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(0),
		dataout => wire_bidir_dq_0_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_0_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_1_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(1),
		dataout => wire_bidir_dq_1_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_1_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_2_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(2),
		dataout => wire_bidir_dq_2_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_2_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_3_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(3),
		dataout => wire_bidir_dq_3_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_3_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_4_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(4),
		dataout => wire_bidir_dq_4_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_4_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_5_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(5),
		dataout => wire_bidir_dq_5_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_5_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_6_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(6),
		dataout => wire_bidir_dq_6_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_6_io_config_inst_padtoinputregisterdelaysetting
	  );
	bidir_dq_7_input_delay_chain_inst :  stratixiii_delay_chain
	  PORT MAP ( 
		datain => bidir_dq_input_data_in(7),
		dataout => wire_bidir_dq_7_input_delay_chain_inst_dataout,
		delayctrlin => wire_bidir_dq_7_io_config_inst_padtoinputregisterdelaysetting
	  );
	dqs_config_0_inst :  stratixiii_dqs_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		dividerphasesetting => wire_dqs_config_0_inst_dividerphasesetting,
		ena => dqs_config_ena,
		update => config_update
	  );
	dqs_config_1_inst :  stratixiii_dqs_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		dividerphasesetting => wire_dqs_config_1_inst_dividerphasesetting,
		ena => dqs_config_ena,
		update => config_update
	  );
	bidir_dq_0_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(0),
		q => wire_bidir_dq_0_oct_ff_inst_q
	  );
	wire_bidir_dq_0_oe_ff_inst_w_lg_q11w(0) <= NOT wire_bidir_dq_0_oe_ff_inst_q;
	bidir_dq_0_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(0),
		q => wire_bidir_dq_0_oe_ff_inst_q,
		sclr => bidir_dq_sreset(0)
	  );
	bidir_dq_1_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(1),
		q => wire_bidir_dq_1_oct_ff_inst_q
	  );
	wire_bidir_dq_1_oe_ff_inst_w_lg_q28w(0) <= NOT wire_bidir_dq_1_oe_ff_inst_q;
	bidir_dq_1_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(1),
		q => wire_bidir_dq_1_oe_ff_inst_q,
		sclr => bidir_dq_sreset(1)
	  );
	bidir_dq_2_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(2),
		q => wire_bidir_dq_2_oct_ff_inst_q
	  );
	wire_bidir_dq_2_oe_ff_inst_w_lg_q41w(0) <= NOT wire_bidir_dq_2_oe_ff_inst_q;
	bidir_dq_2_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(2),
		q => wire_bidir_dq_2_oe_ff_inst_q,
		sclr => bidir_dq_sreset(2)
	  );
	bidir_dq_3_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(3),
		q => wire_bidir_dq_3_oct_ff_inst_q
	  );
	wire_bidir_dq_3_oe_ff_inst_w_lg_q54w(0) <= NOT wire_bidir_dq_3_oe_ff_inst_q;
	bidir_dq_3_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(3),
		q => wire_bidir_dq_3_oe_ff_inst_q,
		sclr => bidir_dq_sreset(3)
	  );
	bidir_dq_4_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(4),
		q => wire_bidir_dq_4_oct_ff_inst_q
	  );
	wire_bidir_dq_4_oe_ff_inst_w_lg_q67w(0) <= NOT wire_bidir_dq_4_oe_ff_inst_q;
	bidir_dq_4_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(4),
		q => wire_bidir_dq_4_oe_ff_inst_q,
		sclr => bidir_dq_sreset(4)
	  );
	bidir_dq_5_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(5),
		q => wire_bidir_dq_5_oct_ff_inst_q
	  );
	wire_bidir_dq_5_oe_ff_inst_w_lg_q80w(0) <= NOT wire_bidir_dq_5_oe_ff_inst_q;
	bidir_dq_5_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(5),
		q => wire_bidir_dq_5_oe_ff_inst_q,
		sclr => bidir_dq_sreset(5)
	  );
	bidir_dq_6_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(6),
		q => wire_bidir_dq_6_oct_ff_inst_q
	  );
	wire_bidir_dq_6_oe_ff_inst_w_lg_q93w(0) <= NOT wire_bidir_dq_6_oe_ff_inst_q;
	bidir_dq_6_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(6),
		q => wire_bidir_dq_6_oe_ff_inst_q,
		sclr => bidir_dq_sreset(6)
	  );
	bidir_dq_7_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => bidir_dq_oct_in(7),
		q => wire_bidir_dq_7_oct_ff_inst_q
	  );
	wire_bidir_dq_7_oe_ff_inst_w_lg_q106w(0) <= NOT wire_bidir_dq_7_oe_ff_inst_q;
	bidir_dq_7_oe_ff_inst :  stratixiii_ff
	  GENERIC MAP (
		POWER_UP => "HIGH"
	  )
	  PORT MAP ( 
		clk => dq_output_reg_clk,
		d => bidir_dq_oe_in(7),
		q => wire_bidir_dq_7_oe_ff_inst_q,
		sclr => bidir_dq_sreset(7)
	  );
	dqs_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => dqs_oct_in,
		q => wire_dqs_oct_ff_inst_q
	  );
	dqsn_oct_ff_inst :  stratixiii_ff
	  PORT MAP ( 
		clk => oct_reg_clk,
		d => dqsn_oct_in,
		q => wire_dqsn_oct_ff_inst_q
	  );
	io_clock_divider_0_inst :  stratixiii_io_clock_divider
	  GENERIC MAP (
		invert_phase => "false",
		phase_setting => 0,
		use_masterin => "false",
		use_phasectrlin => "false"
	  )
	  PORT MAP ( 
		clk => io_clock_divider_clk,
		phaseselect => wire_dqs_config_0_inst_dividerphasesetting,
		slaveout => wire_io_clock_divider_0_inst_slaveout
	  );
	io_clock_divider_1_inst :  stratixiii_io_clock_divider
	  GENERIC MAP (
		invert_phase => "false",
		phase_setting => 0,
		use_masterin => "true",
		use_phasectrlin => "false"
	  )
	  PORT MAP ( 
		clk => io_clock_divider_clk,
		masterin => wire_io_clock_divider_0_inst_slaveout,
		phaseselect => wire_dqs_config_1_inst_dividerphasesetting
	  );
	bidir_dq_0_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(0),
		padtoinputregisterdelaysetting => wire_bidir_dq_0_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_1_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(1),
		padtoinputregisterdelaysetting => wire_bidir_dq_1_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_2_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(2),
		padtoinputregisterdelaysetting => wire_bidir_dq_2_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_3_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(3),
		padtoinputregisterdelaysetting => wire_bidir_dq_3_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_4_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(4),
		padtoinputregisterdelaysetting => wire_bidir_dq_4_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_5_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(5),
		padtoinputregisterdelaysetting => wire_bidir_dq_5_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_6_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(6),
		padtoinputregisterdelaysetting => wire_bidir_dq_6_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	bidir_dq_7_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => bidir_dq_io_config_ena(7),
		padtoinputregisterdelaysetting => wire_bidir_dq_7_io_config_inst_padtoinputregisterdelaysetting,
		update => config_update
	  );
	dqs_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => dqs_io_config_ena,
		update => config_update
	  );
	dqsn_io_config_inst :  stratixiii_io_config
	  PORT MAP ( 
		clk => config_clk,
		datain => config_datain,
		ena => dqsn_io_config_ena,
		update => config_update
	  );

 END RTL; --dq_dqs_inst
--VALID FILE

