----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: strobe_gen - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Generates a single clock pulse strobe on rising edge of input. 
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity strobe_gen is
	port(
		reset		: in std_logic;
		signal_in	: in std_logic;	
		clock_out	: in std_logic;
		strobe_out	: out std_logic);
end strobe_gen;

--}} End of automatically maintained section

architecture arch_strobe_gen of strobe_gen is

	signal edge_detect : std_logic_vector(2 downto 0);

begin
  
	strobe_out <= '1' when (edge_detect = "110") else '0';
	
	gen_edge_detect : process(reset, clock_out)
	begin
		if (reset = '1')then
			edge_detect <= "000";
		elsif (rising_edge(clock_out))then
			edge_detect <= signal_in & edge_detect(2 downto 1);	
		end if;
	end process;

end arch_strobe_gen;
