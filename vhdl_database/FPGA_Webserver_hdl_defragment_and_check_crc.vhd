----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz> 
-- 
-- Module Name: defragment_and_check_crc - Behavioral
--
-- Description: Defragment packets into a stream of contiguious bytes,
--              NOTE - does not yet check CRCs. 
-- 
------------------------------------------------------------------------------------
-- FPGA_Webserver from https://github.com/hamsternz/FPGA_Webserver
------------------------------------------------------------------------------------
-- The MIT License (MIT)
-- 
-- Copyright (c) 2015 Michael Alan Field <hamster@snap.net.nz>
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity defragment_and_check_crc is
    Port (  clk               : in  STD_LOGIC;
            input_data_enable  : in  STD_LOGIC;           
            input_data         : in  STD_LOGIC_VECTOR (7 downto 0);
            input_data_present : in  STD_LOGIC;
            input_data_error   : in  STD_LOGIC;
            packet_data_valid  : out STD_LOGIC := '0';
            packet_data        : out STD_LOGIC_VECTOR (7 downto 0) := (others=>'0'));
end defragment_and_check_crc;

architecture Behavioral of defragment_and_check_crc is
    type a_buffer is array(0 to 2047) of std_logic_vector(8 downto 0);
    signal data_buffer : a_buffer := (others => (others => '0'));
    
    signal read_addr            : unsigned(10 downto 0) := (others => '0'); 
    signal start_of_packet_addr : unsigned(10 downto 0) := (others => '0'); 
    signal write_addr           : unsigned(10 downto 0) := (others => '0');
    --------------------------------------------------------------------
    -- because all frames must be > 15 bytes long, the maximum frames 
    -- in the buffer is 2048/15 = 136
    --------------------------------------------------------------------
    signal complete_packets    : unsigned(7 downto 0) := (others => '0');
    
    signal input_data_present_last  : std_logic := '0'; 
    
    signal ram_data_out : std_logic_vector(8 downto 0);
begin
    packet_data_valid <= ram_data_out(8);
    packet_data       <= ram_data_out(7 downto 0);

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--!! TODO: CRC CHECK NOT YET IMPLEMENTED
--!!       ERROR CHECK NOT YET IMPLEMENTED
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
process(clk)
    variable v_complete_packets : unsigned(7 downto 0) := (others => '0');
    begin
        if rising_edge(clk) then
            --------------------------------------------------
            -- The decrementing of complete_packets is delayed
            -- one cycle (occurs after the cycle where the data
            -- is read.
            --
            -- This is done this way to allow the data
            -- to be held in a block RAM, rather than using
            -- a huge amount of LUTs.
            ----------------------------------------------------
            if v_complete_packets /= 0 and ram_data_out(8) = '0' then
                v_complete_packets := v_complete_packets - 1;
            else
                v_complete_packets := complete_packets;
            end if;


            ---------------------------------------
            -- Writing in any fragments of a packet
            ---------------------------------------
            if input_data_enable = '1' then
                if input_data_present_last = '0' then
                    if input_data_present = '0' then
                       ------------------------------------------------------------
                        -- What to do if there are two or more idle words in a row
                        ------------------------------------------------------------
                        NULL;
                    else
                        --------------------------------
                        -- What to do on start of packet
                        --------------------------------
                        start_of_packet_addr <= write_addr; 
                        data_buffer(to_integer(write_addr)) <= input_data_present & input_data;
                        write_addr <= write_addr + 1;
                    end if;
                else
                    if input_data_present = '1' then
                        data_buffer(to_integer(write_addr)) <= input_data_present & input_data;
                        write_addr <= write_addr + 1;
                    else
                       ------------------------------------------------------------
                        -- What to do on end of packet
                        ------------------------------------------------------------
                        -- Skip backwards over the frame check sequence (CRC) when 
                        -- we see the end of packet.
                        --  
                        -- If the packet had any errors we will skip back to the start 
                        -- of the packet (but am not checking at the moment!) 
                        -----------------------------------------------------------
                        v_complete_packets := v_complete_packets + 1;
                        data_buffer(to_integer(write_addr-4)) <= input_data_present & input_data;
                        write_addr <= write_addr - 4 + 1;
                    end if;
                end if;
                ------------------------------------------------
                -- Remember if we had data this active cycle, so
                -- we can detect the starts and ends of packets
                ------------------------------------------------
                input_data_present_last <= input_data_present; 
            end if;
            
            ---------------------------------------
            -- Streaming out any completed packets
            ---------------------------------------
            if v_complete_packets /= 0 then
                ram_data_out        <= data_buffer(to_integer(read_addr));
                read_addr           <= read_addr+1;
            else
                ram_data_out        <= (others => '0');
            end if;
            complete_packets <= v_complete_packets;
        end if;
    end process;

end Behavioral;
