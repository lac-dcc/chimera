LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY spram IS
	GENERIC
	(
		widthad_a			: natural;
		width_a				: natural := 8;
		outdata_reg_a : string := "UNREGISTERED"
	);
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (widthad_a-1 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (width_a-1 DOWNTO 0)
	);
END spram;


ARCHITECTURE SYN OF spram IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (width_a-1 DOWNTO 0);

BEGIN
	q    <= sub_wire0(width_a-1 DOWNTO 0);

	altsyncram_component : altsyncram
	GENERIC MAP (
		clock_enable_input_a => "BYPASS",
		clock_enable_output_a => "BYPASS",
		intended_device_family => "Cyclone III",
--		lpm_hint => "ENABLE_RUNTIME_MOD=NO",
		lpm_hint=> "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=<FLAN>",
		lpm_type => "altsyncram",
		numwords_a => 2**widthad_a,
		operation_mode => "SINGLE_PORT",
		outdata_aclr_a => "NONE",
		outdata_reg_a => outdata_reg_a,
		power_up_uninitialized => "FALSE",
		read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
		widthad_a => widthad_a,
		width_a => width_a,
		width_byteena_a => 1
	)
	PORT MAP (
		wren_a => wren,
		clock0 => clock,
		address_a => address,
		data_a => data,
		q_a => sub_wire0
	);
END SYN;
