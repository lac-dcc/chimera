--
-- This file is part of the la16fw project.
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
----------------------------------------------------------------------------------
--
-- samples the logic inputs and converts the data into blocks of 16 samples per
-- enabled channel
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sample is
    port(
        sample_clk          : in std_logic; -- sample clock, 100 or 160MHz
        sample_run          : in std_logic; -- set to '1' to sample, '0' to reset
        sample_rate_divisor : in std_logic_vector(7 downto 0); -- sample rate = clock / (div + 1)
        logic_data          : in std_logic_vector(15 downto 0); -- input pins
        channel_select      : in std_logic_vector(15 downto 0); -- channel select bits, async (must only be changed while sample_tick is inactive)
        fifo_data           : out std_logic_vector(15 downto 0) := (others=>'0'); -- data to fifo
        fifo_reset          : out std_logic := '0'; -- reset/clear fifo (sync'd to sample clock)
        fifo_write          : out std_logic; -- tell fifo to write data on next clock
        fifo_full           : in std_logic;
        fifo_almost_full    : in std_logic
    );
end sample;


architecture behavioral of sample is

    function sl2int(x : std_logic) return integer is
    begin
        if (x = '1') then return 1; else return 0; end if;
    end;
    
    subtype vector16_t is std_logic_vector(15 downto 0);
    type vector16_arr_t is array (natural range <>) of vector16_t;

    signal sample_run_get            : std_logic; -- sample_run signal accross clock domains
    signal sample_tick_count         : unsigned(7 downto 0); -- used to divide sample clock
    signal sample_tick               : std_logic; -- flag when sample_tick_count reached zero
    signal sample_count              : unsigned(4 downto 0); -- count samples
    signal logic_data_reg            : std_logic_vector(15 downto 0); -- "register" input
    signal input_write_reg           : std_logic; -- used to switch between the two input shift regs
    signal last_input_write_reg      : std_logic;
    signal input_shift_in            : std_logic_vector(0 to 1); -- enable shift into input shiftreg
    signal input_shift_out           : std_logic_vector(0 to 1); -- enable shift out of input shiftreg
    signal input_shiftreg_data       : vector16_arr_t(0 to 1);
    signal input_shiftreg_data_valid : std_logic;
    signal write_to_fifo             : std_logic := '0';
    signal fifo_write_int            : std_logic := '0';
    signal fifo_write_sequence       : vector16_t;
    signal fifo_write_count          : unsigned(3 downto 0);
    signal fifo_ready                : std_logic := '0';
    
    attribute TIG : string;
    attribute TIG of sample_rate_divisor : signal is "TRUE";
    attribute TIG of channel_select : signal is "TRUE";
    
    signal DEBUG : boolean := false;--true;
    signal count : unsigned(31 downto 0);
    signal wait_write : std_logic := '0';
    
begin

    -- sync sample_run signal to sample_clk
    signal_inst : entity work.syncsignal
        port map(
            clk_output => sample_clk,
            input      => sample_run,
            output     => sample_run_get
        );

    -- input shiftregs
    gen : for i in 0 to 1 generate
    begin
        input_shiftreg_inst : entity work.input_shiftreg
            port map (
                clk       => sample_clk,
                shift_in  => input_shift_in(i),
                data_in   => logic_data_reg,
                shift_out => input_shift_out(i),
                data_out  => input_shiftreg_data(i)
            );
    end generate gen;

    -- sample input data and write it to fifo
    fifo_write <= fifo_write_int;
    input_write_reg <= sample_count(4);
    process (sample_clk)
    begin
        if rising_edge(sample_clk) then
            -- divide sample clock
            if (sample_run_get = '1') and (fifo_ready = '1') then
                if (sample_tick_count = 0) then
                    sample_tick_count <= unsigned(sample_rate_divisor);
                else
                    sample_tick_count <= sample_tick_count - 1;
                end if;
            else
                sample_tick_count <= unsigned(sample_rate_divisor);
            end if;
            sample_tick <= '0';
            if (sample_tick_count = 0) then
                sample_tick <= '1';
            end if;

            -- write data from input shiftreg to fifo
            last_input_write_reg <= input_write_reg;
            input_shift_out <= (others=>'0');
            fifo_write_int <= '0';
            if (write_to_fifo = '1') then
                input_shift_out(sl2int(not last_input_write_reg)) <= '1';
                fifo_data <= input_shiftreg_data(sl2int(not last_input_write_reg));
                fifo_write_int <= fifo_write_sequence(0);
                fifo_write_sequence <= fifo_write_sequence(0) & fifo_write_sequence(15 downto 1);
                fifo_write_count <= fifo_write_count + 1;
                if (fifo_write_count = 15) then
                    write_to_fifo <= '0';
                end if;
            end if;

            -- read input
            logic_data_reg <= logic_data;
            input_shift_in <= (others=>'0');
            if (sample_run_get = '1') and (fifo_ready = '1') and (sample_tick = '1') then
                -- shift data into currently active input shiftreg
                input_shift_in(sl2int(input_write_reg)) <= '1';
                -- shift enabled channels from other input shiftreg to fifo
                --input_shift_out(sl2int(not input_write_reg)) <= '1';
                -- count sample to know when to switch between input shiftreg etc.
                sample_count <= sample_count + 1;
                if (sample_count = 16) then
                    -- 16th sample so the first input shiftreg is full next clock edge
                    input_shiftreg_data_valid <= '1';
                end if;
                if (sample_count = 16) or ((input_shiftreg_data_valid = '1') and (sample_count = 0)) then
                    write_to_fifo <= '1';
                    input_shift_out(sl2int(not input_write_reg)) <= '1';
                end if;
            end if;
            
            --debug
            if DEBUG then
               fifo_write_int <= '0';
               wait_write <= '0';
               if (sample_run_get = '1') and (fifo_ready = '1') and
                  ( (fifo_almost_full = '0') or ((fifo_write_int = '0') and (fifo_full = '0')) ) and
                  (wait_write = '0') then--and (count /= 176*1024) then
                  fifo_data <= std_logic_vector(count(15 downto 0) + 1);
                   --fifo_data <= std_logic_vector(count(25 downto 10) + 1);
                   fifo_write_int <= '1';
                   --wait_write <= '1';
                   count <= count + 1;
               end if;
            end if;

            -- check for overflow
            if (fifo_ready = '1') and (fifo_full = '1') then
                -- FIXME: set some status bit?
            end if;
            
            -- reset
            fifo_reset <= '0';
            if (fifo_ready = '0') and (fifo_full = '0') then
                fifo_ready <= '1';
            end if;
            if (sample_run_get = '0') then
                sample_count <= (others=>'0');
                last_input_write_reg <= '0';
                input_shiftreg_data_valid <= '0';
                write_to_fifo <= '0';
                fifo_write_sequence <= channel_select;
                fifo_write_count <= (others=>'0');
                fifo_ready <= '0';
                fifo_data <= (others=>'0');
                fifo_reset <= '1';
                count <= (others=>'0');
            end if;
            
        end if;
    end process;
    
end behavioral;

