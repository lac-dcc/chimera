-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2018 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- Implements a propagation delay emulation based on a (fast) emulation clock.
-- Recommended value for the clk cycle time is in the order of 5 to 7 ns.
-- About the propagation delay of one 7400 NAND gate.
--
-- This allows certain clock glitches to be emulated.
-- It prevents building impossible fast circuits.
--
-- Also as a bonus it turns everything into registered logic with at least
-- one flipflop on each emulated output allowing easier mapping to FPGAs.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
use work.ttl_pkg.ttl_t;

-- -----------------------------------------------------------------------

entity ttl_latency is
	generic (
		latency : integer := 1
	);
	port (
		clk : in std_logic;

		d : in ttl_t;
		q : out ttl_t
	);
end entity;

architecture rtl of ttl_latency is
	type pipeline_t is array(0 to latency) of ttl_t;
	signal pipeline : pipeline_t := (others => FLOAT);
begin
	q <= pipeline(latency);

	pipeline_gen : if latency > 0 generate
		process(clk, d)
		begin
			pipeline(0) <= d;
			if rising_edge(clk) then
				for i in 1 to latency loop
					pipeline(i) <= pipeline(i-1);
				end loop;
			end if;
		end process;
	end generate;
end architecture;
