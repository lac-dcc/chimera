-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2010 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
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
-- gen_pipeline.vhd
--
-- -----------------------------------------------------------------------
--
-- Configurable pipeline building block.
--
-- -----------------------------------------------------------------------
-- pipelineLength - Length of the pipeline (in clock ticks), can also be zero
-- bits           - width of the pipeline
-- clk            - clock
-- reset          - Synchronous reset, set everything to zero
-- ena            - Clock enable
-- d              - Data input
-- q              - Data output
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity gen_pipeline is
	generic (
		pipelineLength : integer := 1;
		bits : integer := 8
	);
	port (
		clk : in std_logic;
		reset : in std_logic := '0';
		ena : in std_logic := '1';
		
		d : in unsigned(bits-1 downto 0);
		q : out unsigned(bits-1 downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of gen_pipeline is
	type pipelineDef is array(0 to pipelineLength) of unsigned(q'range);
	signal pipeline : pipelineDef := (others => (others => '0'));
begin
	q <= pipeline(pipelineLength);
	
	process(clk, d)
	begin
		pipeline(0) <= d;
		if rising_edge(clk) then
			if ena = '1' then
				if pipelineLength > 0 then
					for i in 1 to pipelineLength loop
						pipeline(i) <= pipeline(i-1);
					end loop;
				end if;
			end if;
			if reset = '1' then
				if pipelineLength > 0 then
					for i in 1 to pipelineLength loop
						pipeline(i) <= (others => '0');
					end loop;
				end if;
			end if;			
		end if;
	end process;
end architecture;




