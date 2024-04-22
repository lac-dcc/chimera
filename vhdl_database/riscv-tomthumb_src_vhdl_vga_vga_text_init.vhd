library IEEE;
use IEEE.std_logic_1164.ALL;

package vga_text_init is

	type text_store_t is array(0 to 2047) of std_logic_vector(7 downto 0);

	constant TEXT_RAM_INIT : text_store_t := (
		-- "This is a default text :-)"
		X"54",X"68",X"69",X"73",   X"00",   X"69",X"73",   X"00",   X"61",   X"00",   X"64",X"65",X"66",X"61",X"75",X"6c",X"74",   X"00",   X"74",X"65",X"78",X"74",   X"00",   X"01",
	
		others => X"2e"
	);

end package vga_text_init;
