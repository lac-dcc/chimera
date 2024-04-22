-------------------------------------------------------------------------------
--
-- Title       : outbuf_half_path
-- Design      : FFT
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Output buffer (useful for SPDF FFTs)
-- 
-- Version 1.0 : 03.11.2017
--      Description: Output buffer for FFT-IFFT project
--      It has several independent DPRAM components for FFT ADDR 
--      between 2k and 512k
--
--      Input data: {Re/Im} two parts (w/o interleave mode)
--      Output data: {Re/Im} parts (two half-part data)
--      Signle clock for input and output.
--
-- Example: ADDR = 3 (NFFT = (2^ADDR) = 8 points)
--
-- Input strobes: 
--
--  DA: ....0123........0123... > (0   to N/2-1),
--  DB: ....4567........4567... > (N/2 to N-1).
--
-- Output strobes:
--
--  DO: ....01234567....01234567... > (0 to N-1),
--
-- Parameters:
--    ADDR - number of FFT/iFFT stages (butterflies), ADDR = log2(NFFT). 
--    DATA - Data width (input / output).
--
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--  GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--  Copyright (c) 2018 Kapitanov Alexander
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
--  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
--  APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT 
--  HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY 
--  OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, 
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
--  PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM 
--  IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF 
--  ALL NECESSARY SERVICING, REPAIR OR CORRECTION. 
-- 
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity outbuf_half_path is
    generic (
        ADDR   : integer:=10; --! FFT ADDR
        DATA   : integer:=32  --! Data width
    );
    port (
        ---- Common signals ----
        clk     : in  std_logic; --! Clock
        reset   : in  std_logic; --! Reset (Positive Sync)
        
        ---- Input data ----
        do_dt   : out std_logic_vector(DATA-1 downto 0); --! Data In
        do_en   : out std_logic; --! Data enable
        ---- Output data ----
        da_dt   : in  std_logic_vector(DATA-1 downto 0); --! Even Data
        db_dt   : in  std_logic_vector(DATA-1 downto 0); --! Odd Data
        ab_vl   : in  std_logic --! Data valid
    );    
end outbuf_half_path;

architecture outbuf_half_path of outbuf_half_path is

signal cnt           : std_logic_vector(ADDR-1 downto 0);
signal addr_wr       : std_logic_vector(ADDR-2 downto 0);

signal cnt_rd        : std_logic_vector(ADDR-1 downto 0);
signal ena_rd        : std_logic;
signal ena_rdz       : std_logic;

signal ram_wea       : std_logic;

signal ram_rdad      : std_logic_vector(ADDR-2 downto 0);        
signal ram_doa       : std_logic_vector(DATA-1 downto 0);
signal da_dtz1       : std_logic_vector(DATA-1 downto 0);

-- Shared mem signal
type mem_type is array (0 to (2**(ADDR-1))-1) of std_logic_vector(DATA-1 downto 0);
signal mem : mem_type;

begin

pr_cnt: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt      <= (0 => '1', others => '0');
            addr_wr  <= (others => '0');
            cnt_rd   <= (0 => '1', others => '0');
            ena_rd   <= '0';

            ram_rdad <= (others => '0');
        else

            if (ab_vl = '1') then
                if (cnt(cnt'left) = '1') then
                    cnt <= (0 => '1', others => '0');
                else
                    cnt <= cnt + '1';
                end if;
            end if;    
            
            if (ab_vl = '1') then
                addr_wr <= addr_wr + '1';
            end if;

            if (ena_rd = '1') then
                if (cnt_rd(cnt_rd'left) = '1') then
                    cnt_rd   <= (0 => '1', others => '0');
                    ram_rdad <= (others => '0');
                else
                    cnt_rd   <= cnt_rd + '1';
                    ram_rdad <= ram_rdad + '1';
                end if;
            end if;
            
            if (cnt(cnt'left) = '1') then
                if (ab_vl = '1') then
                    ena_rd <= '1';
                end if;
            elsif (cnt_rd(cnt_rd'left) = '1') then
                ena_rd <= '0';
            end if;
            
        end if;
    end if;
end process;

ena_rdz <= ena_rd when rising_edge(clk);
da_dtz1 <= da_dt  when rising_edge(clk);

pr_data: process(clk) is
begin
    if rising_edge(clk) then
        -- if (ram_wea = '1') then
        if (ena_rdz = '0') then
            do_dt <= da_dtz1;
            do_en <= ram_wea;
        else
            do_dt <= ram_doa;
            do_en <= ena_rdz;
        end if;
    end if;
end process;

ram_wea <= ab_vl when rising_edge(clk);

---------------- Mapping dual-port RAM --------------------
pr_mem: process(clk)
begin
    if (clk'event and clk='1') then
        if (ena_rd = '1') then
            ram_doa <= mem(conv_integer(ram_rdad));
        end if;
        if (ab_vl = '1') then
            mem(conv_integer(addr_wr)) <= db_dt;
        end if;
    end if;
end process;


end outbuf_half_path;