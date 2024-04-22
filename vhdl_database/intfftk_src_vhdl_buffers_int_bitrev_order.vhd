-------------------------------------------------------------------------------
--
-- Title       : Bit-reverse 
-- Design      : FFT
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
--    Version 1.0  13.08.2017
--       Description: Universal bitreverse algorithm for FFT project
--       It has several independent DPRAM components for FFT stages 
--       between 2k and 512k
--
--    Version 2.0  01.08.2018
--       Bit-reverse w/ signle cache RAM for operation!
--
--    Version 2.1  06.12.2018
--       Fix some logic errors and change RAM mode to READ_FIRST
--
--    Version 2.2  07.12.2018
--       Add PAIR parameter:
--
--       PAIR = TRUE : Convert data flow from bit-reverse order to normal order
--       PAIR = FALSE: Convert data flow from two-part bit-reverse order 
--                     to normal order.
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

entity int_bitrev_order is
    generic (
        PAIR         : boolean:=TRUE;   --! Bitreverse mode: 
                                        --  TRUE - Even/Odd or FALSE - Half Pair
        STAGES       : integer:=11;     --! FFT stages
        NWIDTH       : integer:=16      --! Data width
    );
    port (
        clk          : in  std_logic;   --! Clock
        reset        : in  std_logic;   --! Reset
        
        di_dt        : in  std_logic_vector(NWIDTH-1 downto 0); --! Data input
        di_en        : in  std_logic;   --! DATA enable

        do_dt        : out std_logic_vector(NWIDTH-1 downto 0); --! Data output    
        do_vl        : out std_logic    --! DATA valid
    );    
end int_bitrev_order;

architecture int_bitrev_order of int_bitrev_order is

function bit_pair(Mode: boolean; Len: integer; Dat: std_logic_vector) return std_logic_vector is
    variable Tmp : std_logic_vector(Len-1 downto 0);
begin 
    if (Mode = TRUE) then
        Tmp(Len-1) :=  Dat(Len-1);
        for ii in 0 to Len-2 loop
            Tmp(ii) := Dat(Len-2-ii);
        end loop;
        --Tmp(0) :=  Dat(Len-1);
        --for ii in 1 to Len-1 loop
        --    Tmp(ii) := Dat(ii-1);
        --end loop;
        --Tmp(Len-1) :=  Dat(0);
        --for ii in 1 to Len-1 loop
        --    Tmp(ii-1) := Dat(ii);
        --end loop;
    else
        for ii in 0 to Len-1 loop
            Tmp(ii) := Dat(Len-1-ii);
        end loop;
    end if;
    return Tmp; 
end function;

signal cnt       : std_logic_vector(STAGES downto 0); 

signal ram_adr   : std_logic_vector(STAGES-1 downto 0);
signal ram_di    : std_logic_vector(NWIDTH-1 downto 0);
signal ram_do    : std_logic_vector(NWIDTH-1 downto 0);

signal wea       : std_logic;
signal rdt       : std_logic;
signal vld       : std_logic;

signal cnt1st    : std_logic_vector(STAGES downto 0);    

type ram_t is array(0 to 2**(STAGES)-1) of std_logic_vector(NWIDTH-1 downto 0);
signal bmem     : ram_t;

begin

---------------- Data out and valid proc ----------------
pr_cnt1: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt1st <= (others => '0');        
        else
            if (di_en = '1') then
                if (cnt1st(STAGES) = '0') then
                    cnt1st <= cnt1st + '1';
                end if;
            end if;
        end if;
    end if;
end process;

---------------- Common proc ----------------
ram_di <= di_dt when rising_edge(clk);

pr_cnt: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt <= (others => '0');
        else
            if (di_en = '1') then
                cnt <= cnt + '1';
            end if;
        end if;
    end if;
end process;

wea <= di_en when rising_edge(clk);

---------------- Read / Address proc ----------------
vld <= rdt when rising_edge(clk);
rdt <= di_en and cnt1st(STAGES) when rising_edge(clk);

pr_adr: process(clk) is
begin
    if rising_edge(clk) then
        if (cnt(cnt'left) = '0') then
            ram_adr <= cnt(STAGES-1 downto 0);
        else    
            ram_adr <= bit_pair(PAIR, STAGES, cnt);
        end if;
    end if;
end process;

---------------- Mapping RAM block / distr ---------------- 
PR_RAM: process(clk) is
begin
    if (clk'event and clk = '1') then
        if (rdt = '1') then
            ram_do <= bmem(conv_integer(ram_adr));
        end if;
        if (wea = '1') then
            bmem(conv_integer(ram_adr)) <= ram_di;
        end if;
    end if;    
end process;

---------------- Data out and valid proc ----------------
do_dt <= ram_do; -- when rising_edge(clk);
do_vl <= vld;    -- when rising_edge(clk);

end int_bitrev_order;