-- Listing 3.13
--******************************************************************
-- Notes to run on logi:
-- * uses sw(1:0) & btn(1:0) as 4 bits to be displayed on the 4x sseg dispaly.
-- * The inc value increments the 4 bit value by 1 and displays this.
--*******************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity hex_to_sseg_test is
   port(
      clk: in std_logic;
      sw_n: in std_logic_vector(1 downto 0);
	  btn_n: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
	  led: out std_logic_vector(1 downto 0);
      sseg: out std_logic_vector(7 downto 0)
   );
end hex_to_sseg_test;

architecture arch of hex_to_sseg_test is
   signal inc: std_logic_vector(7 downto 0);
   signal led3, led2, led1, led0: std_logic_vector(7 downto 0);
	signal sw, btn : std_logic_vector(1 downto 0);
begin
	sw <= not(sw_n);	--invert the switch values.
	btn <= not(btn_n);
   -- increment input
   --inc <= std_logic_vector(unsigned(sw & sw) + 1);
	inc <= std_logic_vector("0000" & unsigned(sw & btn) + 1);
	led <= sw;

   -- instantiate four instances of hex decoders
   -- instance for 4 LSBs of input
   sseg_unit_0: entity work.hex_to_sseg
      --!port map(hex=>sw(3 downto 0), dp =>'0', sseg=>led0);
		port map(hex=>sw & btn, dp =>'0', sseg=>led0);
   -- instance for 4 MSBs of input
   sseg_unit_1: entity work.hex_to_sseg
      --!port map(hex=>sw(7 downto 4), dp =>'0', sseg=>led1);
		port map(hex=>sw & btn, dp =>'0', sseg=>led1);
   -- instance for 4 LSBs of incremented value
   sseg_unit_2: entity work.hex_to_sseg
      --!port map(hex=>inc(3 downto 0), dp =>'1', sseg=>led2);
		port map(hex=>inc(3 downto 0), dp =>'1', sseg=>led2);
   -- instance for 4 MSBs of incremented value
   sseg_unit_3: entity work.hex_to_sseg
      --!port map(hex=>inc(7 downto 4), dp =>'1', sseg=>led3);
		port map(hex=>inc(3 downto 0), dp =>'1', sseg=>led3);

   -- instantiate 7-seg LED display time-multiplexing module
   disp_unit: entity work.disp_mux
      port map(
         clk=>clk, reset=>'0',
         in0=>led0, in1=>led1, in2=>led2, in3=>led3,
         an=>an, sseg=>sseg);
	
			
end arch;