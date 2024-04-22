--
-- This file is part of the lafw16 project.
--
-- Copyright (C) 2014-2015 Gregor Anich
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
 
entity test_clockmux is
end test_clockmux;
 
architecture behavior of test_clockmux is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component clockmux
        port(
            clk_ctl : in std_logic;
            clk_sel : in std_logic_vector(1 downto 0);
            clk_in : in std_logic_vector(3 downto 0);
            clk_out : out std_logic
            );
    end component;
    

    --Inputs
    signal clk_ctl : std_logic := '0';
    signal clk_sel : unsigned(1 downto 0) := (others => '0');
    signal clk_in : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
    signal clk_out : std_logic;

    -- Clock period definitions
    constant clk_ctl_period : time := 10 ns;
    constant clk_in_0_period : time := 3 ns;
    constant clk_in_1_period : time := 17 ns;
    constant clk_in_2_period : time := 37 ns;
    constant clk_in_3_period : time := 113 ns;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
    uut: clockmux port map (
          clk_ctl => clk_ctl,
          clk_sel => std_logic_vector(clk_sel),
          clk_in => clk_in,
          clk_out => clk_out
        );

    -- Clock process definitions
    clk_ctl_process :process
    begin
		clk_ctl <= '0';
		wait for clk_ctl_period/2;
		clk_ctl <= '1';
		wait for clk_ctl_period/2;
    end process;
 
    clk_in_0_process :process
    begin
		clk_in(0) <= '0';
		wait for clk_in_0_period/2;
		clk_in(0) <= '1';
		wait for clk_in_0_period/2;
    end process;
    clk_in_1_process :process
    begin
		clk_in(1) <= '0';
		wait for clk_in_1_period/2;
		clk_in(1) <= '1';
		wait for clk_in_1_period/2;
    end process;
    clk_in_2_process :process
    begin
		clk_in(2) <= '0';
		wait for clk_in_2_period/2;
		clk_in(2) <= '1';
		wait for clk_in_2_period/2;
    end process;
    clk_in_3_process :process
    begin
		clk_in(3) <= '0';
		wait for clk_in_3_period/2;
		clk_in(3) <= '1';
		wait for clk_in_3_period/2;
    end process;
 

    -- Stimulus process
    stim_proc: process
    begin		

        clk_sel <= to_unsigned(0, clk_sel'length);
        wait for 1 us;
        clk_sel <= to_unsigned(1, clk_sel'length);
        wait for 1 us;
        clk_sel <= to_unsigned(2, clk_sel'length);
        wait for 1 us;
        clk_sel <= to_unsigned(3, clk_sel'length);
        wait for 1 us;

        wait;
    end process;

end;
