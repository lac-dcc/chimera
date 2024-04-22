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

 
entity test_fifo is
end test_fifo;
 
architecture behavior of test_fifo is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component fifo
        port(
             reset : in  std_logic;
             clk_read : in  std_logic;
             clk_write : in  std_logic;
             data_in : in  std_logic_vector(15 downto 0);
             enable_write : in  std_logic;
             enable_read : in  std_logic;
             data_out : out  std_logic_vector(15 downto 0);
             full : out  std_logic;
             empty : out  std_logic
        );
    end component;
    

    --Inputs
    signal reset : std_logic := '0';
    signal clk_read : std_logic := '0';
    signal clk_write : std_logic := '0';
    signal data_in : std_logic_vector(15 downto 0) := (others => '0');
    signal enable_write : std_logic := '0';
    signal enable_read : std_logic := '0';

 	--Outputs
    signal data_out : std_logic_vector(15 downto 0);
    signal full : std_logic;
    signal empty : std_logic;
    signal last_empty : std_logic := '1';

    -- Clock period definitions
    constant clk_read_period : time := 20.83 ns;
    constant clk_write_period : time := 100 ns;
 
    signal write_count : unsigned(15 downto 0) := (0=>'1',others=>'0');
    signal read_count : unsigned(15 downto 0) := (0=>'1',others=>'0');
    signal do_read : std_logic := '0';
    signal read_toggle : std_logic := '0';
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
    uut: fifo
        port map(
            reset => reset,
            clk_read => clk_read,
            clk_write => clk_write,
            data_in => data_in,
            enable_write => enable_write,
            enable_read => enable_read,
            data_out => data_out,
            full => full,
            empty => empty
        );

    -- Clock process definitions
    clk_read_process :process
    begin
        read_toggle <= not read_toggle;
        --read_toggle <= '1';
        
		clk_read <= '0';
		wait for clk_read_period/2;
		clk_read <= '1';
        if (enable_read = '1') and (empty = '0') then
            read_count <= read_count + 1;
            assert data_out = std_logic_vector(read_count)
            report "wrong data" 
            severity failure;
--            severity warning;
        end if;
		wait for clk_read_period/2;
        enable_read <= read_toggle and do_read;
    end process;
 
    clk_write_process :process
    begin
		clk_write <= '0';
		wait for clk_write_period/2;
		clk_write <= '1';
        if (enable_write = '1') and (full = '0') then
            write_count <= write_count + 1;
        end if;
		wait for clk_write_period/2;
    end process;
    data_in <= std_logic_vector(write_count);

    -- Stimulus process
    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        reset <= '1';
        wait for 100 ns;	
        reset <= '0';

        wait for clk_read_period*10;
        

        -- fill fifo
        wait until full = '0';
        wait until rising_edge(clk_write);
        wait for clk_write_period/4;
        enable_write <= '1';
        wait until full = '1';
        enable_write <= '0';
        wait for 5 us;
    
        -- read fifo
        --wait until empty = '0';
        wait until rising_edge(clk_read);
        wait for clk_read_period/4;
        do_read <= '1';
        wait for 5*clk_read_period;
        do_read <= '0';
        wait for 5*clk_read_period;
        do_read <= '1';
--        wait for clk_read_period;
--        wait until empty = '1';
--        do_read <= '0';
--        wait for 1 us;



        wait;
    end process;

end;
