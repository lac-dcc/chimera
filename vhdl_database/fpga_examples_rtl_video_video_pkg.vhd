library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package video_pkg is
	type rgb555_t is record
			r : unsigned(4 downto 0);
			g : unsigned(4 downto 0);
			b : unsigned(4 downto 0);
		end record;

	type rgb888_t is record
			r : unsigned(7 downto 0);
			g : unsigned(7 downto 0);
			b : unsigned(7 downto 0);
		end record;
end package;

package body video_pkg is
end package body;