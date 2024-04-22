LIBRARY	IEEE;
USE	IEEE.STD_LOGIC_1164.ALL;
USE	IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nvram is
port(
	addr	:in std_logic_vector(12 downto 0);
	rd		:in std_logic;
	wr		:in std_logic_vector(1 downto 0);
	wdat	:in std_logic_vector(15 downto 0);
	rdat	:out std_logic_vector(15 downto 0);
	doe		:out std_logic;
	wp		:in std_logic_vector(7 downto 0);
	
	SCLin	:in std_logic;
	SCLout	:out std_logic;
	SDAin	:in std_logic;
	SDAout	:out std_logic;
	
	I2Csft	:in std_logic;
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end nvram;
architecture rtl of nvram is
signal	ramwr	:std_logic_vector(1 downto 0);
signal	cont_addr	:std_logic_vector(13 downto 0);
signal	cont_wr		:std_logic;
signal	cont_wrs	:std_logic_vector(1 downto 0);
signal	cont_wdat	:std_logic_vector(7 downto 0);
signal	cont_rdath	:std_logic_vector(7 downto 0);
signal	cont_rdatl	:std_logic_vector(7 downto 0);
signal	cont_rdat	:std_logic_vector(7 downto 0);
component nvmemu
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;
component nvmeml
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;
begin
	ramwr<=	"00" when ce='0' else
			"00" when wp/=x"31" else
			wr;
	
	-- FIXME: had an existing ce
	doe<='1' when ce='1' and rd='1' else '0';
	
	cont_wrs<=	"10" when cont_addr(0)='0' and cont_wr='1' else
				"01" when cont_addr(1)='1' and cont_wr='1' else
				"00";
	
	ramh	:nvmemu port map(addr,cont_addr(13 downto 1),clk,wdat(15 downto 8),cont_wdat,ramwr(1),cont_wrs(1),rdat(15 downto 8),cont_rdath);
	raml	:nvmeml port map(addr,cont_addr(13 downto 1),clk,wdat( 7 downto 0),cont_wdat,ramwr(0),cont_wrs(0),rdat( 7 downto 0),cont_rdatl);
	
	cont_wdat<=cont_rdath when cont_addr(0)='0' else cont_rdatl;
end rtl;