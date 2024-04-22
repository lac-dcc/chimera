-------------------------------------------------------------------------------
--
-- Title       : inbuf_half_wrap
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Simple input buffer for BURSTING mode of input data
--               Input data flow doesn't need cont. enable strobe!
--               Memory size: 2^(N-1) words, where N = ADDR - num of FFT stages
--
-- Version 1.0 : 05.12.2018
--               Description: Single input buffer w/o interleave modes.
--
--    Input data: {Re/Im} flow (w/o interleave mode)
--    Output data: {Re/Im} flow (as inputs)
--    Signle clock for input and output.
--
-- Example: ADDR = 3: (NFFT = (2^ADDR) = 8 points)
--
-- Timing diagram:
--
-- Input strobes: 
--        DI: ..0..123..4..5.6..7..0123..4.56....7....... > (0 to N-1),
--
-- Output strobes:
--  1st - DA: ...........0..1.2..3........0.12....3...... > (0   to N/2-1),
--  2nd - DB: ...........4..5.6..7........4.56....7...... > (N/2 to N-1).
--
-- OR:
--
-- Input strobes: 
--        DI: ..01234567..01234567..... > (0 to N-1),
--
-- Output strobes:
--  1st - DA: .......0123......0123.... > (0   to N/2-1),
--  2nd - DB: .......4567......4567.... > (N/2 to N-1).
--
--
-- Parameters:
--      ADDR - number of FFT/iFFT stages (butterflies), ADDR = log2(NFFT). 
--      DATA - Data width (input / output).
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

entity inbuf_half_wrap is
    generic (
        ADDR    : integer:=10; --! FFT ADDR
        DATA    : integer:=32  --! Data width
    );
    port(
        ---- Common signals ----
        clk     : in  std_logic; --! Clock
        reset   : in  std_logic; --! Reset
        
        ---- Input data ----
        di_dt   : in  std_logic_vector(DATA-1 downto 0); --! Data In
        di_en   : in  std_logic; --! Data enable
        ---- Output data ----
        da_dt   : out std_logic_vector(DATA-1 downto 0); --! Even Data
        db_dt   : out std_logic_vector(DATA-1 downto 0); --! Odd Data
        ab_vl   : out std_logic --! Data valid
    );
end inbuf_half_wrap;

architecture inbuf_half_wrap of inbuf_half_wrap is

signal ram_we       : std_logic;
signal ram_re       : std_logic;

signal cnt_ad       : std_logic_vector(ADDR-1 downto 0);
signal ram_addr     : std_logic_vector(ADDR-2 downto 0);
signal ram_dia      : std_logic_vector(DATA-1 downto 0);
signal ram_doa      : std_logic_vector(DATA-1 downto 0);
signal ram_vl       : std_logic;

-- Shared mem signal
type mem_type is array ((2**(ADDR-1))-1 downto 0) of std_logic_vector(DATA-1 downto 0);
shared variable mem : mem_type:=(others => (others => '0'));

begin

pr_cnt: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt_ad <= (others => '0');
            ram_we <= '0';
            ram_re <= '0';
        else
            ---- Write / Read enable ----
            ram_we <= di_en and not cnt_ad(ADDR-1);
            ram_re <= di_en and cnt_ad(ADDR-1);
            ---- Write address ----
            if (di_en = '1') then
                cnt_ad <= cnt_ad + '1';
            end if;
        end if;
    end if;
end process;    

pr_ram: process(clk) is
begin
    if rising_edge(clk) then
        ram_addr <= cnt_ad(ADDR-2 downto 0);
        ram_dia  <= di_dt;
        ram_vl   <= ram_re;
    end if;
end process;

---------------- Mapping dual-port RAM --------------------
pr_mem: process(clk) is
begin
    if (clk'event and clk='1') then
        if (ram_re = '1') then
            ram_doa <= mem(conv_integer(ram_addr));
        end if;
        if (ram_we = '1') then
            mem(conv_integer(ram_addr)) := ram_dia;
        end if;
    end if;
end process;

da_dt <= ram_doa;
db_dt <= ram_dia when rising_edge(clk);
ab_vl <= ram_vl;

end inbuf_half_wrap;