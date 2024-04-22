-- HC55516/HC55564 Continuously Variable Slope Delta decoder
-- (c)2015 vlait
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity hc55564 is 
port
(
	clk        : in std_logic;
	cen        : in std_logic;
	rst        : in std_logic;
	bit_in     : in std_logic;
	sample_out : out std_logic_vector(15 downto 0)
);
 
end hc55564;  

architecture hdl of hc55564 is 
  constant h   	: integer := (1 - 1/8)  *256; --integrator decay (1 - 1/8) * 256 = 224
  constant b   	: integer := (1 - 1/256)*256; --syllabic decay (1 - 1/256) * 256 = 255
  
  constant s_min  : unsigned(15 downto 0) := to_unsigned(40, 16);
  constant s_max  : unsigned(15 downto 0) := to_unsigned(5120, 16);

  signal runofn_new : std_logic_vector(2 downto 0);
  signal runofn 	: std_logic_vector(2 downto 0);
  signal res1 		: unsigned(31 downto 0);
  signal res2 		: unsigned(31 downto 0);
  signal x_new		: unsigned(16 downto 0);
  signal x   		: unsigned(15 downto 0);  --integrator
  signal s   		: unsigned(15 downto 0);  --syllabic
  signal old_cen  : std_logic;
begin

res1 <= x * h;
res2 <= s * b;
runofn_new <= runofn(1 downto 0) & bit_in;
x_new <= ('0'&res1(23 downto 8)) + s when bit_in = '1' else ('0'&res1(23 downto 8)) - s;

process(clk, rst, bit_in)
begin
	-- reset ??
	if rising_edge(clk) then
		old_cen <= cen;
		if old_cen = '0' and cen = '1' then
			runofn <= runofn_new;
			if runofn_new = "000" or runofn_new = "111" then
				s <= s + 40;
				if (s + 40) > s_max then
					s <= s_max;
				end if;
			else 
				s <= res2(23 downto 8);
				if res2(23 downto 8) < s_min then
					s <= s_min;
				end if;
			end if;

			if x_new(16) = '1' then
				x <= (others => bit_in);
			else
				x <= x_new(15 downto 0);
			end if;
		end if;
	end if;
end process;

sample_out <= std_logic_vector(x);

end architecture hdl;