-- ############# Sweet32 microprocessor - simple PWM peripheral ##############
-- ###########################################################################
-- Module Name:		simple_PWM.vhd
-- Module Version:	0.1
-- Module author:	Valentin Angelovski
-- Module date:		14/09/2014
-- Project IDE:		Lattice Diamond ver. 3.1.0.96
--
--------------------------------------------------------------------------------/
--
-- Copyright (C) 2014 Valentin Angelovski
--
-- This source file may be used and distributed without
-- restriction provided that this copyright statement is not
-- removed from the file and that any derivative work contains
-- the original copyright notice and the associated disclaimer.
--
-- This source file is free software; you can redistribute it
-- and/or modify it under the terms of the GNU Lesser General
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any
-- later version.
--
-- This source is distributed in the hope that it will be
-- useful, but WITHOUT ANY WARRANTY; without even the implied
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
-- PURPOSE. See the GNU Lesser General Public License for more
-- details.
--
-- You should have received a copy of the GNU Lesser General
-- Public License along with this source; if not, download it
-- from http://www.opencores.org/lgpl.shtml
--
----------------------------------------------------------------------------------/
--
--
-- Happy Experimenting! :-)
--
-- Version release history
-- 14/09/2014 v0.1 (Initial beta pre-release)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_PWM is
	port (
	clk, rst	: in	std_logic;				-- Clocks, resets etc
	pwm_value	: in	unsigned (11 downto 0);	-- PWM value input reg
	PWM_Q		: out	std_logic				-- PWM output pin
	);
end;

architecture behavior of simple_PWM is

	signal pwm_acc: unsigned (11 downto 0);

begin

PWM_Q <= pwm_acc(11);	-- Left acc carry bit provides Left channel PWM output

	process (clk, rst)
	begin
		if rst = '0' then
			pwm_acc <= (others => '0');
		elsif rising_edge(clk) then
			-- PWM output block (essentially a binary-rate multiplier..)
			pwm_acc <= ('0' & pwm_acc(10 downto 0))	-- all but the carry
				+ pwm_value			 				-- input demand (lower 8-bits of data-in)
				+ pwm_acc(11 downto 11);			-- the carry bit
		end if;
	end process;

end architecture;
