-------------------------------------------------------------------------------
--
-- Title       : Bit-reverse cache (Universal single RAM)
-- Design      : Fast Fourier Transform
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
--    Version 1.0  13.08.2018
--       Description: Universal bitreverse algorithm for FFT project
--       It has several independent DPRAM components for FFT stages 
--       between 2k and 512k
--
--    Version 2.0  01.08.2018
--       Bit-reverse w/ signle cache RAM for operation!
--
--    Version 2.1  03.12.2018
--       Fix some logic errors and change RAM mode to READ_FIRST
--
--    Version 2.2  08.12.2018
--       Add new feature: increment and data counter for signle RAM op.
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

entity int_bitrev_cache is
    generic (
        STAGES       : integer:=11; --! FFT stages
        NWIDTH       : integer:=16  --! Data width
    );
    port (
        clk          : in  std_logic; --! Clock
        reset        : in  std_logic; --! Reset
        
        di_dt        : in  std_logic_vector(NWIDTH-1 downto 0); --! Data input
        di_en        : in  std_logic; --! DATA enable

        do_dt        : out std_logic_vector(NWIDTH-1 downto 0); --! Data output
        do_vl        : out std_logic --! DATA valid
    );
end int_bitrev_cache;

architecture int_bitrev_cache of int_bitrev_cache is

type add_type is array(0 to STAGES-1) of std_logic_vector(STAGES-1 downto 0);
type msb_type is array(0 to STAGES-1) of integer;

---------------- Calculate Increment ----------------
function adr_inc return add_type is
    variable tmp_ret : add_type;
begin
    tmp_ret(0) := (0 => '1', others => '0');
    xL: for ii in 1 to STAGES-1 loop
        tmp_ret(ii) :=  ((STAGES-ii) => '1', others => '0');
    end loop;
    return tmp_ret;
end function;

---------------- Calculate Index Counter ----------------
function adr_msb return msb_type is
    variable tmp_ret : msb_type;
begin
    tmp_ret(0) := STAGES;
    xL: for ii in 1 to STAGES-1 loop
        tmp_ret(ii) := ii;
    end loop;
    return tmp_ret;
end function;

---------------- Write / Read pointers ----------------
constant INC_ADD      : add_type:=adr_inc;
constant INC_MSB      : msb_type:=adr_msb; 

signal RW_MSB         : integer range 0 to STAGES-1;
signal RW_ADD         : std_logic_vector(STAGES-1 downto 0);

---------------- RAM input / output ----------------
type ram_t is array(0 to 2**(STAGES)-1) of std_logic_vector(NWIDTH-1 downto 0);
signal bmem           : ram_t;

signal ram_di         : std_logic_vector(NWIDTH-1 downto 0);
signal ram_do         : std_logic_vector(NWIDTH-1 downto 0);
signal ram_wr         : std_logic;
signal ram_rd         : std_logic;
signal ram_adr        : std_logic_vector(STAGES-1 downto 0);

---------------- Counter / Increment ----------------
signal wr_1st         : std_logic;

signal in_cnt         : integer range 0 to STAGES-1;
signal sw_cnt         : std_logic_vector(STAGES downto 0);

signal cnt_adr        : std_logic_vector(STAGES-1 downto 0);
signal cnt_ptr        : std_logic_vector(STAGES downto 0);

begin

---------------- Write 1st Block ---------------- 
pr_cnt1st: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            wr_1st <= '0';
        elsif (sw_cnt(sw_cnt'left) = '1') then
            wr_1st <= '1';
        end if;
    end if;
end process;

---------------- Write Increment ---------------- 
pr_del: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            sw_cnt <= (0 => '1', others => '0');
            in_cnt <= 1;
            RW_MSB <= INC_MSB(0);
            RW_ADD <= INC_ADD(0);
        else
            if (di_en = '1') then
                if (sw_cnt(sw_cnt'left) = '1') then
                    ---- Counter for Arrays ----
                    if (in_cnt = (STAGES-1)) then
                        in_cnt <= 0;
                    else
                        in_cnt <= in_cnt + 1;
                    end if;
                    ---- Find MSB and Increment ----
                    RW_MSB <= INC_MSB(in_cnt);
                    RW_ADD <= INC_ADD(in_cnt);
                    ---- Counter for increments ----
                    sw_cnt <= (0 => '1', others => '0');
                else
                    sw_cnt <= sw_cnt + '1';
                end if;
            end if;
        end if;
    end if;
end process;

---------------- Write Counters ---------------- 
pr_ena: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            cnt_ptr <= (0 => '1', others => '0');
            cnt_adr <= (others => '0');
        else
            ---- Write enable ----
            if (di_en = '1') then
                if (cnt_ptr(RW_MSB) = '1') then
                    cnt_ptr <= (0 => '1', others => '0');
                else
                    cnt_ptr <= cnt_ptr + '1';
                end if;
            end if;

            ---- Find adress counter ----
            if (di_en = '1') then
                if (sw_cnt(sw_cnt'left) = '1') then
                    cnt_adr <= (others => '0');
                else
                    ---- Write Counter ----
                    if (cnt_ptr(RW_MSB) = '1') then
                        cnt_adr <= cnt_adr + RW_ADD + 1;
                    else
                        cnt_adr <= cnt_adr + RW_ADD;
                    end if;
                end if;
            end if;
        end if;

        ---- Prepare RAM inputs ----
        ram_di  <= di_dt;
        ram_wr  <= di_en;
        ram_rd  <= di_en and wr_1st;
        ram_adr <= cnt_adr;
    end if;
end process;

------------------ Mapping RAM block / distr ----------------
PR_RAM: process(clk) is
begin
    if (clk'event and clk = '1') then
        if (ram_rd = '1') then
            ram_do <= bmem(conv_integer(ram_adr));
        end if;
        if (ram_wr = '1') then
            bmem(conv_integer(ram_adr)) <= ram_di;
        end if;
    end if;
end process;

------------------ Data out and valid proc ----------------
do_dt <= ram_do; -- when rising_edge(clk);
do_vl <= ram_rd when rising_edge(clk);

end int_bitrev_cache;