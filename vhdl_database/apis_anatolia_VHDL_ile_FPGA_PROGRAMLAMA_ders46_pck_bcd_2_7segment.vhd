library ieee;
use ieee.std_logic_1164.all;

package pck_bcd_2_7segment is

---------------------------------------------------------------------------------------
-- COMPONENT DECLERATIONS
---------------------------------------------------------------------------------------
-- debounce
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

-- bcd_incrementor
component bcd_incrementor is
generic (
c_birlerlim	: integer := 9;
c_onlarlim	: integer := 5
);
port (
clk			: in std_logic;
increment_i	: in std_logic;
reset_i		: in std_logic;
birler_o	: out std_logic_vector (3 downto 0);
onlar_o		: out std_logic_vector (3 downto 0)
);
end component;

-- bcd_to_sevenseg
-- component bcd_to_sevenseg is
-- port (
-- bcd_i		: in std_logic_vector (3 downto 0);
-- sevenseg_o	: out std_logic_vector (7 downto 0)
-- );
-- end component;

---------------------------------------------------------------------------------------
-- CONSTANT DEFINITIONS
---------------------------------------------------------------------------------------
constant c_clkfreq				: integer := 100_000_000;
constant c_timer1mslim			: integer := c_clkfreq/1000;
constant c_salise_counter_lim	: integer := c_clkfreq/100;
constant c_saniye_counter_lim	: integer := 100;	-- 100 saliseye kadar sayacak ve 1 artacak saniye
constant c_dakika_counter_lim	: integer := 60;	-- 60 saniyeye kadar sayacak ve 1 artacak dakika

function bcd_2_7segment (
bcd: std_logic_vector(3 downto 0)
) return std_logic_vector;

end pck_bcd_2_7segment;


package body pck_bcd_2_7segment is

function bcd_2_7segment(
bcd: std_logic_vector(3 downto 0)
) return std_logic_vector is

variable seven_segment: std_logic_vector(7 downto 0);

begin

	case bcd is
		
		when "0000" =>			
			seven_segment	:= "00000011"; -- CACBCCCDCECFCGDP
			
		when "0001" =>		
			seven_segment	:= "10011111"; -- CACBCCCDCECFCGDP
			
		when "0010" =>		
			seven_segment	:= "00100101"; -- CACBCCCDCECFCGDP
			
		when "0011" =>
			seven_segment	:= "00001101"; -- CACBCCCDCECFCGDP
			
		when "0100" =>
			seven_segment	:= "10011001"; -- CACBCCCDCECFCGDP
			
		when "0101" =>
			seven_segment	:= "01001001"; -- CACBCCCDCECFCGDP
			
		when "0110" =>
			seven_segment	:= "01000001"; -- CACBCCCDCECFCGDP
			
		when "0111" =>
			seven_segment	:= "00011111"; -- CACBCCCDCECFCGDP
			
		when "1000" =>
			seven_segment	:= "00000001"; -- CACBCCCDCECFCGDP
			
		when "1001" =>
			seven_segment	:= "00001001"; -- CACBCCCDCECFCGDP
			
		when others =>
			seven_segment	:= "11111111"; -- CACBCCCDCECFCGDP
		
	end case;

	return seven_segment;

end bcd_2_7segment;

end pck_bcd_2_7segment;