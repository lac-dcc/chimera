-- Listing 4.14
--******************************************************************
--Notes to run on logi:  
-- * Using a 2 registers rather than 4.
-- * the upper 6 bits of the register are  are a static value of "000000" 
--  	the lower 2 bits are taken from the sw(1:0) values.  
-- * btn(0) latches regsiter 1, btn(1) latches regsiter 2.

--******************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity disp_mux_test is
   port(
      clk: in std_logic;
      btn_n: in std_logic_vector(1 downto 0);
      sw_n: in std_logic_vector(1 downto 0);
      an: out std_logic_vector(3 downto 0);
		led: out std_logic_vector(1 downto 0);
      sseg: out std_logic_vector(7 downto 0)
   );
end disp_mux_test;

architecture arch of disp_mux_test is

	signal d1_reg: std_logic_vector(7 downto 0);
	signal d0_reg: std_logic_vector(7 downto 0);
   signal sw, btn: std_logic_vector(1 downto 0);

begin

sw <= not(sw_n);	--invert sw and btns
btn <= not(btn_n);

disp_unit: entity work.disp_mux
      port map(
				clk=>clk, reset=>'0',
				in3=>d1_reg, 
				in2=>d1_reg, 
				in1=>d0_reg,
				in0=>d0_reg, 
				an=>an, 
				sseg=>sseg
			);
			

	--enabling the registers using the push buttons
   process (clk)
   begin
      if (clk'event and clk='1') then
         if (btn = "10") then
				d1_reg <= "000000" & sw;	
         end if;
         if (btn = "01") then
            d0_reg <= "000000" & sw; 
         end if;
      end if;
   end process;
	
end arch;