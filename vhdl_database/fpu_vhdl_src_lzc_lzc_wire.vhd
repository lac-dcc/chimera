-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package lzc_wire is

	type lzc_64_in_type is record
		a : std_logic_vector(63 downto 0);
	end record;

	type lzc_64_out_type is record
		c : std_logic_vector(5 downto 0);
	end record;

	type lzc_256_in_type is record
		a : std_logic_vector(255 downto 0);
	end record;

	type lzc_256_out_type is record
		c : std_logic_vector(7 downto 0);
	end record;

end package;
