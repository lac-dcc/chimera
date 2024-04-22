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
-- state machine for receiving data from the spi interface
--
-- first byte of packet is the address and r/w bit, second is the data
-- when data is written it is put onto data_out bus and enable_write is strobed
-- when data is read enable_read is strobed and data must be put onto data_in
--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity spi is
    port(
        clk          : in std_logic; -- system clock (48MHz)
        reset        : in std_logic; -- reset (sync)
        -- spi interface signals
        ss_n         : in std_logic; -- slave select (inverted)
        sclk         : in std_logic; -- serial clock
        mosi         : in std_logic; -- master out slave in
        miso         : out std_logic; -- master in slave out
        -- communication with other logic
        enable_write : out std_logic; -- write data to address
        enable_read  : out std_logic; -- laod data from address
        addr         : out std_logic_vector(6 downto 0); -- address
        data_out     : out std_logic_vector(7 downto 0); -- data to write
        data_in      : in std_logic_vector(7 downto 0) -- loaded data
    );
end spi;


architecture behavioral of spi is

    type state_t is(
        idle, -- slave select inactive
        recv_addr, -- receiving address and r/w bit
        recv_addr_done, -- address received
        load_data, -- if read: load data from address
        load_data_wait, -- if read: wait for data
        recv_send_data, -- recv/send data
        recv_send_data_done -- if write: store data to address
    );
    
    signal state     : state_t;
    signal bit_count : unsigned(2 downto 0); -- bit counter
    signal bits      : unsigned(7 downto 0); -- data
    signal ss_n_last : std_logic;
    signal sclk_last : std_logic;
    signal read_flag : std_logic; -- 0: write, 1: read

begin

    -- FIXME: increase address after read/write?
   
    process(clk)
    begin
        if rising_edge(clk) then
            enable_write <= '0';
            enable_read <= '0';
            if (reset = '1') then
                state <= idle;
            elsif (state = idle) then
                if (ss_n_last = '1' and ss_n = '0') then -- slave select
                    state <= recv_addr;
                    bit_count <= (others=>'0');
                    bits <= (others=>'0');
                    read_flag <= '1';
                    miso <= '0';
                end if;
            elsif (state = recv_addr or state = recv_send_data) then
                if (ss_n = '1') then
                    state <= idle;
                elsif (sclk_last = '0' and sclk = '1') then -- rising edge
                    -- shift in/out one bit
                    miso <= bits(7);
                    bits <= bits(6 downto 0) & mosi;
                    if (bit_count = 7) then -- byte received
                        if (state = recv_addr) then
                            state <= recv_addr_done;
                        elsif (state = recv_send_data) then
                            state <= recv_send_data_done;
                        end if;
                    end if;
                    bit_count <= bit_count + 1;
                end if;
            elsif (state = recv_addr_done) then
                read_flag <= bits(7);
                addr <= std_logic_vector(bits(6 downto 0));
                if (bits(7) = '1') then -- read
                    state <= load_data;
                    enable_read <= '1';
                else -- write
                    state <= recv_send_data;
                    bits <= (others=>'0');
                end if;
            elsif (state = load_data) then
                state <= load_data_wait;
                enable_read <= '1';
            elsif (state = load_data_wait) then
                bits <= unsigned(data_in);
                state <= recv_send_data;
            elsif (state = recv_send_data_done) then
                state <= recv_send_data;
                if (read_flag = '0') then -- write
                    data_out <= std_logic_vector(bits);
                    enable_write <= '1';
                end if;
            end if;
            
            ss_n_last <= ss_n;
            sclk_last <= sclk;
        end if;
    end process;
    
end behavioral;
