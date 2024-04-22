-- Motion object PROM for Atari Super Breakout
-- This stores the ball image, it was originally a 32 byte bipolar PROM but the ball image is only a 3x3 block
-- so it can be implemented as combinational logic which is platform agnostic
-- 2017 James Sweet

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity K6_PROM is 
port(		
			clock				: in  std_logic;
			address			: in 	std_logic_vector(4 downto 0);
			q			  		: out	std_logic_vector(7 downto 0)
			);
end K6_PROM;

architecture rtl of K6_PROM is

begin

K6: process(clock, address)
begin
	if rising_edge(clock) then
		case address is
			when "00000" =>
				q <= "11100000";
			when "00001" =>
				q <= "11100000"; 
			when "00010" =>
				q <= "11100000"; 
			when others =>
				q <= "00000000";
			end case;
	end if;
end process;

end rtl;