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

 
entity test_sample is
end test_sample;
 
architecture behavior of test_sample is 
 
    -- component declaration for the unit under test (uut)
 
    component sample
    port(
         sample_run : in std_logic;
         sample_clk : in std_logic;
         sample_rate_divisor : in std_logic_vector(7 downto 0);
         channel_select : in std_logic_vector(15 downto 0);
         logic_data : in std_logic_vector(15 downto 0);
         fifo_reset : out std_logic;
         fifo_data : out std_logic_vector(15 downto 0);
         fifo_write : out std_logic;
         fifo_full : in std_logic;
         fifo_almost_full : in std_logic
        );
    end component;
    

    --Inputs
    signal sample_run : std_logic := '0';
    signal sample_clk : std_logic := '0';
    signal sample_rate_divisor : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(1, 8));
    signal channel_select : std_logic_vector(15 downto 0) := (others => '1');
    signal logic_data : std_logic_vector(15 downto 0) := "0101010101010101";
    signal fifo_full : std_logic := '1';
    signal fifo_almost_full : std_logic := '1';

 	--Outputs
    signal fifo_reset : std_logic;
    signal fifo_data : std_logic_vector(15 downto 0);
    signal fifo_write : std_logic;

   -- Clock period definitions
   constant sample_clk_period : time := 10 ns;
 
    signal do_count : std_logic := '0';
    signal count2 : unsigned(7 downto 0) := (others=>'0');
    signal count : unsigned(15 downto 0) := (others=>'0');
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sample PORT MAP (
          sample_run => sample_run,
          sample_clk => sample_clk,
          sample_rate_divisor => sample_rate_divisor,
          channel_select => channel_select,
          logic_data => logic_data,
          fifo_reset => fifo_reset,
          fifo_data => fifo_data,
          fifo_write => fifo_write,
          fifo_full => fifo_full,
          fifo_almost_full => fifo_almost_full
        );

    -- Clock process definitions
    sample_clk_process :process
    begin
        if (do_count = '1') then
            count2 <= count2 - 1;
            if (count2 = to_unsigned(0, count2'length)) then
                count2 <= unsigned(sample_rate_divisor);
                count <= count + 1;
                for i in 0 to 15
                loop
                    logic_data(i) <= to_unsigned(i + 1, 8)(to_integer(7 - count(2 downto 0)));
                    if (count(2 downto 0) = to_unsigned(0, count'length)) then
                        logic_data(i) <= count(4);
                    end if;
                end loop;
            end if;
        end if;
    
        sample_clk <= '0';
        wait for sample_clk_period/2;
        sample_clk <= '1';
        wait for sample_clk_period/2;
    end process;
 

   -- Stimulus process
   stim_proc: process
   begin
      --channel_select <= "0101010101010101";
      --channel_select <= "1010101010101010";
      --channel_select <= "0000000011111111";
      --channel_select <= "1111111100000000";
      channel_select <= "1111111111111111";
      --channel_select <= "1111000000000000";
--      channel_select <= "1111000000000000";
      
      sample_run <= '0';
      wait for sample_clk_period*5;
      sample_run <= '1';
      
      wait for sample_clk_period*(3+to_integer(unsigned(sample_rate_divisor)));
      fifo_full <= '0';
      fifo_almost_full <= '0';
      do_count <= '1';
      
      wait;
   end process;

END;
