-- Listing 4.16
-- Notes to run on logi:
-- * using sw & btn to create a = 4 bit hex value shown on sseg0.
-- * the upper sseg3 and sseg4 shows the sum of a with itself.  
-- * the user can dynamically change the value of a and see the resultant
-- sum on the upper 2 ssegs.  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity hex_mux_test is
   port(
      clk: in std_logic;
		btn_n: in std_logic_vector(1 downto 0);
      sw_n: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
		an_l:out std_logic;
      sseg: out std_logic_vector(7 downto 0)
   );
end hex_mux_test;

architecture arch of hex_mux_test is
   signal a, b : unsigned(7 downto 0);
   signal sum: std_logic_vector(7 downto 0);
	signal btn, sw : std_logic_vector(1 downto 0);
	
begin
	btn <= not(btn_n);
	sw <= not(sw_n);
 
	an_l <= '0';		
   disp_unit: entity work.disp_hex_mux
      port map(
				clk=>clk, 
				reset=>'0',
				hex3=>sum(7 downto 4), 
				hex2=>sum(3 downto 0),
				hex1=>"0000",
				hex0=> sw & btn,
				dp_in=>"0000", 
				an=>an, 
				sseg=>sseg
			);  
			
   a <= "0000" & unsigned(sw & btn);
	--b <= "000000" & unsigned(btn(1 downto 0));	--! there only 4 switches repeat the with the low 4
   --b <= "0000" & unsigned(sw( downto 4));
   sum <= std_logic_vector(a + a);
end arch;