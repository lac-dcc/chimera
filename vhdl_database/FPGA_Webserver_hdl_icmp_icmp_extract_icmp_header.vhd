----------------------------------------------------------------------------------
-- Engineer: Mike Field <hamster@snap.net.nz> 
-- 
-- Module Name: icmp_extract_icmp_header - Behavioral
--
-- Description: Remove the ICMP header details off of the data packet
--              and pass the data on if valid. 
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
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity icmp_extract_icmp_header is
    Port ( clk            : in  STD_LOGIC;
       data_valid_in  : in  STD_LOGIC;
       data_in        : in  STD_LOGIC_VECTOR (7 downto 0);
       data_valid_out : out STD_LOGIC := '0';
       data_out       : out STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
       
       icmp_type       : out STD_LOGIC_VECTOR (7 downto 0)  := (others => '0');
       icmp_code       : out STD_LOGIC_VECTOR (7 downto 0)  := (others => '0');
       icmp_checksum   : out STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
       icmp_identifier : out STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
       icmp_sequence   : out STD_LOGIC_VECTOR (15 downto 0) := (others => '0'));
end icmp_extract_icmp_header;

architecture Behavioral of icmp_extract_icmp_header is
    signal count             : unsigned(3 downto 0)         := (others => '0');
    signal i_icmp_type       : STD_LOGIC_VECTOR (7 downto 0)  := (others => '0');
    signal i_icmp_code       : STD_LOGIC_VECTOR (7 downto 0)  := (others => '0');
    signal i_icmp_checksum   : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal i_icmp_identifier : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal i_icmp_sequence   : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
begin
    icmp_type       <= i_icmp_type;
    icmp_code       <= i_icmp_code;
    icmp_checksum   <= i_icmp_checksum;
    icmp_identifier <= i_icmp_identifier;
    icmp_sequence   <= i_icmp_sequence;

process(clk)
    begin
        if rising_edge(clk) then
            data_out       <= data_in;
            if data_valid_in = '1' then
                -- Note, at count of zero,  
                case count is
                    when "0000" => i_icmp_type                    <= data_in;
                    when "0001" => i_icmp_code                    <= data_in;
                    when "0010" => i_icmp_checksum(7 downto 0)    <= data_in;
                    when "0011" => i_icmp_checksum(15 downto 8)   <= data_in;
                    when "0100" => i_icmp_identifier(7 downto 0)  <= data_in;
                    when "0101" => i_icmp_identifier(15 downto 8) <= data_in;
                    when "0110" => i_icmp_sequence(7 downto 0)    <= data_in;
                    when "0111" => i_icmp_sequence(15 downto 8)   <= data_in;
                    when others => if i_icmp_type = x"08" and i_icmp_code = x"00" then 
                                     data_valid_out <= data_valid_in;
                                     data_out       <= data_in;
                                   else
                                     data_valid_out <= '0';
                                     data_out       <= (others => '0');
                                   end if;
                end case;
                if count /= "1111" then
                    count <= count+1;
                end if;
            else
               data_valid_out <= '0';
               data_out       <= data_in;
               count <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;
