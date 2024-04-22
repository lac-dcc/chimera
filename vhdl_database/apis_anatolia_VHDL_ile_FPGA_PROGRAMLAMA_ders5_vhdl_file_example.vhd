--------------------------------------------------------------------------------
-- LIBRARY and PACKAGE DECLERATIONS
--------------------------------------------------------------------------------
-- standard package
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- user defined package
use work.PCK_MYPACKAGE.ALL;

--------------------------------------------------------------------------------
-- ENTITY
--------------------------------------------------------------------------------
entity my_entity_name is
generic (
c_clkfreq	: integer	:= 100_000_000;
c_sclkfreq	: integer	:= 1_000_000;
c_i2cfreq	: integer	:= 400_000;
c_bitnum	: integer	:= 8;
c_is_sim	: boolean	:= false;
c_cfgr_reg	: std_logic_vector (7 downto 0)	:= x"A3"
);
port (
input1_i	: in 	std_logic_vector (c_bitnum-1 downto 0);
input2_i	: in 	std_logic;
output1_o	: out 	std_logic;
output2_o	: out 	std_logic;
inout1_io	: inout std_logic_vector (15 downto 0);
inout1_io	: inout std_logic
);
end my_entity_name;

--------------------------------------------------------------------------------
-- ARCHITECTURE
--------------------------------------------------------------------------------
architecture Behavioral of my_entity_name is

--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
constant c_constant1	: integer									:= 30;
constant c_timer1mslim	: integer									:= c_clkfreq/1000;
constant c_constant2	: std_logic_vector (c_bitnum-1 downto 0)	:= (others => '0');

--------------------------------------------------------------------------------
-- COMPONENT DECLERATIONS
--------------------------------------------------------------------------------
component my_component is
generic (
gen1	: integer 	:= 10;
gen2	: std_logic := '0'
);
port (
in1_i	: in std_logic_vector (c_bitnum-1 downto 0);
out1_o	: out std_logic
);
end component my_component;

--------------------------------------------------------------------------------
-- TYPES
--------------------------------------------------------------------------------
type t_state is (S_START, S_OPERATION, S_TERMINATE, S_IDLE);
-- subtype is a type with a constraint
subtype t_decimal_digit is integer range 0 to 9;
subtype t_byte is bit_vector (7 downto 0);
-- record
type my_record_type is record
	param1	: std_logic;
	param2	: std_logic_vector (3 downto 0);
end record;

--------------------------------------------------------------------------------
-- SIGNALS
--------------------------------------------------------------------------------
signal s0		: std_logic_vector (7 downto 0);			-- signal without initialization
signal s1		: std_logic_vector (7 downto 0) := x"00";	-- signal with initialization
signal s2		: integer range 0 to 255		:= 0;		-- integer signal with range limit, 8-bit HW
signal s3		: integer 						:= 0;		-- integer signal without range limit, 32-bit HW
signal s4		: std_logic 					:= '0';
signal state	: t_state						: S_START;
signal bcd		: t_decimal_digit				: 0;
signal opcode	: t_byte						: x"BA";
signal s_record	: my_record_type;

--------------------------------------------------------------------------------
-- BEGIN
--------------------------------------------------------------------------------	
begin

--------------------------------------------------------------------------------
-- COMPONENT INSTANTIATIONS
--------------------------------------------------------------------------------
mycomp1 : my_component
generic map(
gen1	=> c_i2cfreq,
gen2	=> '0'
)
port map(
in1_i	=> input1_i,
out1_o	=> output1_o
);

--------------------------------------------------------------------------------
-- CONCURRENT ASSIGNMENTS
--------------------------------------------------------------------------------
s1	<= 	x"01" when s0 < 30 else
		x"02" when s0 < 40 else
		x"03";
		
with state select
s0	<=	x"01" when S_START,
		x"02" when S_OPERATION,
		x"03" when S_TERMINATE,
		x"04" when others;
		
s3	<= 5 + 2;
s4	<= input1_i(1) and input1_i(2) xor input2_i;
s4	<= ...	-- multiple driven net eror

s_record.param1	<= '0';
s_record.param2	<= "0101";

input2_io		<= '0' when sda_ena_n = '0' else 'Z';	-- 'Z' is open collector - or high impedance - or high Z

--------------------------------------------------------------------------------
-- SEQUENTIAL ASSIGNMENTS - PROCESS BLOCK
-- NOTE: Process blocks work concurrently with each others
--			Tool gives multiple driven net error if a signal is assigned in mutliple process blocks
--------------------------------------------------------------------------------
-- COMBINATIONAL PROCESS
P_COMBINATIONAL	: process (s0, state, input1_i, input2_i) begin

	-- if / elsif / else block
	if (s0 < 30) then
		s1	<= x"01";
	elsif (s0 < 40) then
		s1	<= x"02";
	else
		s1	<= x"03";
	end if;
	
	-- case block
	case state is
	
		when S_START =>
			s0	<= x"01";
		when S_OPERATION =>
			s0	<= x"02";
		when S_TERMINATE =>
			s0	<= x"03";
		when others =>
			s0	<= x"04";
	
	end case;
	
	s4	<= input1_i(1) and input1_i(2) xor input2_i;
	s4	<= input1_i(1) or input1_i(2) xnor input2_i;	-- NOT multiple driven net

end process P_COMBINATIONAL;


--------------------------------------------------------------------------------
-- SEQUENTIAL PROCESS
P_SEQUENTIAL : process (clk) begin
if (rising_edge(clk)) then

	-- ...

end if;
end process P_SEQUENTIAL;

end Behavioral;