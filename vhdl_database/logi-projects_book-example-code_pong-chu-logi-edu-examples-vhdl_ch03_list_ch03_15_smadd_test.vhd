-- Listing 3.15
--******************************************************************
-- Notes to run on logi:
--	* The default A and B values are 2.  The sw0/1 values are the - sign bits by defaulT
--	* user can uncommnet option 2 to use the buttons to control bit0 of a and b.
-- SSEG0 = A when buttons0/1 = "00" (default)
-- SSEG0 = B when buttons0/1 = "01"
-- SSEG0 = A when buttons0/1 = "10" or "11"
-- * exepriment by changing the a and b static values.
--*******************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sm_add_test is
   port(
      clk: in std_logic;
      btn_n: in std_logic_vector(1 downto 0);
      sw_n: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0)
   );
end sm_add_test;

architecture arch of sm_add_test is
	signal btn, sw: std_logic_vector(1 downto 0);	--invert the btn signals
	signal a, b : std_logic_vector(3 downto 0);
	
   signal sum, mout, oct: std_logic_vector(3 downto 0);
   signal led3, led2, led1, led0: std_logic_vector(7 downto 0);
begin
	btn <= not(btn_n);
	sw <= not(sw_n);
	--an <= not(n_an);

	--base value of 2 with switch with switch values negative bit3.
	--(COMMENT THIS IS RUNNING OPTION2)
	a <= sw(0) & "010" ;
	b <= sw(1) & "010" ;
	-- OPTION2 (UNCOMMENT THIS IF WANT TO RUN)base value of 2 with switch with switch values = low bit. (+1)
--	a <= "001" & sw(0);
--	b <= "001" & sw(1);	

   -- instantiate adder
   sm_adder_unit: entity work.sign_mag_add
      generic map(N=>4)
      --!port map(a=>sw(3 downto 0), b=>sw(7 downto 4),
		port map(a=> a, 
					b=> b,
               sum=>sum
					);

   -- 3-to-1 mux to select a number to display
   with btn select
      mout <= 	a when "00",  -- a
					b when "01",  -- b
					sum when others;           -- sum

   -- magnitude displayed on rightmost 7-seg LED
   oct <= '0' & mout(2 downto 0);
   sseg_unit: entity work.hex_to_sseg
      port map(
			hex=>oct, 
			dp=>'0', 
			sseg=>led0
		);
		
	-- sign displayed on 2nd 7-seg LED
	led1 <= "01000000" when mout(3)='1' else -- middle bar  -- based on 1 bit, we will use sw(1) as the signed bit.
			  "00000000";                      -- blank
		  
	-- other two 7-seg LEDs blank
	led2 <= "00000000";
	led3 <= "00000000";

   -- instantiate display multiplexer
   disp_unit: entity work.disp_mux
      port map(
         clk=>clk, reset=>'0',
         in0=>led0, 
			in1=>led1, 
			in2=>led2, 
			in3=>led3,
         --an=>n_an, 
			an=>an,
			sseg=>sseg
		);
			
end arch;