library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
generic (
c_clkfreq	: integer := 100_000_000;
c_debtime	: integer := 1000;
c_initval	: std_logic	:= '0'
);
port (
clk			: in std_logic;
sw_i		: in std_logic_vector (1 downto 0);
button_i	: in std_logic;
led_o		: out std_logic_vector (15 downto 0)
);
end top;

architecture Behavioral of top is

component debounce is
generic (
c_clkfreq	: integer := 100_000_000;
c_debtime	: integer := 1000;
c_initval	: std_logic	:= '0'
);
port (
clk			: in std_logic;
signal_i	: in std_logic;
signal_o	: out std_logic
);
end component;

signal counter_sw1	: std_logic_vector (7 downto 0) := (others => '0');
signal counter_sw2	: std_logic_vector (7 downto 0) := (others => '0');

signal sw1_previus	: std_logic := '0';
signal sw2_previus	: std_logic := '0';
signal sw1_deb		: std_logic := '0';

signal rise_edge_sw1: std_logic := '0';
signal rise_edge_sw2: std_logic := '0';

begin

debounce_i : debounce
generic map(
c_clkfreq	=> c_clkfreq    ,
c_debtime	=> c_debtime    ,
c_initval	=> c_initval
)
port map(
clk			=> clk,
signal_i	=> sw_i(0),
signal_o	=> sw1_deb
);

process (clk) begin
if (rising_edge(clk)) then

	sw1_previus	<= sw1_deb;
	sw2_previus	<= sw_i(1);
	
	if (sw1_deb = '1' and sw1_previus = '0') then
		rise_edge_sw1	<= '1';
	else
		rise_edge_sw1	<= '0';
	end if;
	
	if (sw_i(1) = '1' and sw2_previus = '0') then
		rise_edge_sw2	<= '1';
	else
		rise_edge_sw2	<= '0';
	end if;	
	
	if (rise_edge_sw1 = '1') then
		counter_sw1	<= counter_sw1 + 1;
	end if;
	
	if (rise_edge_sw2 = '1') then
		counter_sw2	<= counter_sw2 + 1;
	end if;	
	
	if (button_i = '1') then
		counter_sw1	<= (others => '0');
		counter_sw2	<= x"00";
	end if;

end if;
end process;

led_o(7 downto 0)	<= counter_sw1;
led_o(15 downto 8)	<= counter_sw2;

end Behavioral;