LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

ENTITY dprom_2r IS
	GENERIC
	(
		INIT_FILE			: string := "";
		--NUMWORDS_A		: natural;
		WIDTHAD_A			: natural;
		WIDTH_A				: natural := 8;
		--NUMWORDS_B		: natural;
		WIDTHAD_B			: natural;
		WIDTH_B				: natural := 8;
    outdata_reg_a : string := "UNREGISTERED";
    outdata_reg_b : string := "UNREGISTERED"
	);
	PORT
	(
		address_a		: in std_logic_vector (WIDTHAD_A-1 downto 0);
		address_b		: in std_logic_vector (WIDTHAD_B-1 downto 0);
		clock				: in std_logic ;
		q_a					: out std_logic_vector (WIDTH_A-1 downto 0);
		q_b					: out std_logic_vector (WIDTH_B-1 downto 0)
	);
END dprom_2r;


ARCHITECTURE SYN OF dprom_2r IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (WIDTH_A-1 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (WIDTH_B-1 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC ;
	SIGNAL sub_wire3_bv	: BIT_VECTOR (WIDTH_A-1 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (WIDTH_A-1 DOWNTO 0);
	SIGNAL sub_wire4_bv	: BIT_VECTOR (WIDTH_B-1 DOWNTO 0);
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (WIDTH_B-1 DOWNTO 0);



	COMPONENT altsyncram
	GENERIC (
		address_reg_b		: STRING;
		clock_enable_input_a		: STRING;
		clock_enable_input_b		: STRING;
		clock_enable_output_a		: STRING;
		clock_enable_output_b		: STRING;
		indata_reg_b		: STRING;
		init_file		: STRING;
		init_file_layout		: STRING;
		intended_device_family		: STRING;
		lpm_type		: STRING;
		numwords_a		: NATURAL;
		numwords_b		: NATURAL;
		operation_mode		: STRING;
		outdata_aclr_a		: STRING;
		outdata_aclr_b		: STRING;
		outdata_reg_a		: STRING;
		outdata_reg_b		: STRING;
		power_up_uninitialized		: STRING;
		ram_block_type		: STRING;
		widthad_a		: NATURAL;
		widthad_b		: NATURAL;
		width_a		: NATURAL;
		width_b		: NATURAL;
		width_byteena_a		: NATURAL;
		width_byteena_b		: NATURAL;
		wrcontrol_wraddress_reg_b		: STRING
	);
	PORT (
			wren_a	: IN STD_LOGIC ;
			wren_b	: IN STD_LOGIC ;
			clock0	: IN STD_LOGIC ;
			address_a	: IN STD_LOGIC_VECTOR (WIDTHAD_A-1 DOWNTO 0);
			address_b	: IN STD_LOGIC_VECTOR (WIDTHAD_B-1 DOWNTO 0);
			q_a	: OUT STD_LOGIC_VECTOR (WIDTH_A-1 DOWNTO 0);
			q_b	: OUT STD_LOGIC_VECTOR (WIDTH_B-1 DOWNTO 0);
			data_a	: IN STD_LOGIC_VECTOR (WIDTH_A-1 DOWNTO 0);
			data_b	: IN STD_LOGIC_VECTOR (WIDTH_B-1 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	sub_wire2    <= '0';
	sub_wire3_bv(WIDTH_A-1 DOWNTO 0) <= (others => '0');
	sub_wire3    <= To_stdlogicvector(sub_wire3_bv);
	sub_wire4_bv(WIDTH_B-1 DOWNTO 0) <= (others => '0');
	sub_wire4    <= To_stdlogicvector(sub_wire4_bv);
	q_a    <= sub_wire0(WIDTH_A-1 DOWNTO 0);
	q_b    <= sub_wire1(WIDTH_B-1 DOWNTO 0);

	altsyncram_component : altsyncram
	GENERIC MAP (
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_a => "BYPASS",
		clock_enable_output_b => "BYPASS",
		indata_reg_b => "CLOCK0",
		init_file => INIT_FILE,
		init_file_layout => "PORT_A",
		intended_device_family => "Cyclone III",
		lpm_type => "altsyncram",
		numwords_a => 2**WIDTHAD_A,
		numwords_b => 2**WIDTHAD_B,
		operation_mode => "BIDIR_DUAL_PORT",
		outdata_aclr_a => "NONE",
		outdata_aclr_b => "NONE",
		outdata_reg_a => outdata_reg_a,
		outdata_reg_b => outdata_reg_b,
		power_up_uninitialized => "FALSE",
		ram_block_type => "M9K",
		widthad_a => WIDTHAD_A,
		widthad_b => WIDTHAD_B,
		width_a => WIDTH_A,
		width_b => WIDTH_B,
		width_byteena_a => 1,
		width_byteena_b => 1,
		wrcontrol_wraddress_reg_b => "CLOCK0"
	)
	PORT MAP (
		wren_a => sub_wire2,
		wren_b => sub_wire2,
		clock0 => clock,
		address_a => address_a,
		address_b => address_b,
		data_a => sub_wire3,
		data_b => sub_wire4,
		q_a => sub_wire0,
		q_b => sub_wire1
	);

END SYN;
