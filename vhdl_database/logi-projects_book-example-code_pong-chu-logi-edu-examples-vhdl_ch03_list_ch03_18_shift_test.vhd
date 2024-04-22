-- Listing 3.18
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--******************************************************************
-- Note to run on logi:
-- * The led to sseg display is used on the 4x sseg display.  This emulates 
-- 	8 x linear leds. 
-- * The bit pattern upper 6 bits are static "110101" with the low 2 bits
-- taken from the swith values.  
-- - The pushbuttons are used to shift the bit pattern
-- * Notes: Search for --! to see the changed sections
--*******************************************************************/
entity shifter_test is
   port(
		clk: in std_logic;
      sw_n: in std_logic_vector(1 downto 0);
      btn_n: in std_logic_vector(1 downto 0);
	  sseg: out std_logic_vector(7 downto 0);
      an: out std_logic_vector(3 downto 0)
   );
end shifter_test;

architecture arch of shifter_test is
signal btn, sw: std_logic_vector(1 downto 0);
signal led: std_logic_vector(7 downto 0);


begin
btn <= not(btn_n);
sw <= not(sw_n);

shift_unit: entity work.barrel_shifter(multi_stage_arch)
   	port map(
			a=> ("110101" & sw) , 
			amt=> '0' & btn, 
			y=>led
		); --110101 hard coded as upper 6 bits of teh shift value
      --!port map(a=>sw, amt=>btn, y=>led);
	--!port map(a=> ("000000" & sw) , amt=>btn, y=>led);
	
--using the sseg to emulate 8x leds
led_to_sseg: entity work.led8_sseg
	port map (
		  clk => clk,
		  reset => '0',
		  led => led,
		  an_edu => an,
		  sseg_out => sseg  
	);
	 
	
end arch;
