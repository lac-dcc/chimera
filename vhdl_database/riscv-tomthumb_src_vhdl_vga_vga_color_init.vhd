library IEEE;
use IEEE.std_logic_1164.ALL;

package vga_color_init is

	type color_store_t is array(0 to 2047) of std_logic_vector(7 downto 0);

	constant COLOR_RAM_INIT : color_store_t := (
		-- colors for "This is a default text"
		X"F1",X"F1",X"F1",X"F1",   X"F1",   X"61",X"61",   X"F1",   X"F1",   X"F1",   X"F4",X"F4",X"F4",X"F4",X"F4",X"F4",X"F4",   X"F1",   X"F1",X"F1",X"F1",X"F1",
	
		others => X"0F"
	);

end package vga_color_init;
