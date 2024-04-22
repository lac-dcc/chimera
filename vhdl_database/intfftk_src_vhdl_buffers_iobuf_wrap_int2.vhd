-------------------------------------------------------------------------------
--
-- Title       : iobuf_wrap_int2
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Convert data from interleave-2 mode to delay-path [N/2].
--               Common clock for input and output. 
--               Input enable strobe CAN be wrapped!
--               Continuous or block data stream. 
--
-------------------------------------------------------------------------------
--     
--  Example 1: (Mode BITREV = FALSE): Interleave-2 to Half-part data.        
--
--  Data in:
--      DIx: ...0..2..4..6...
--      DIx: ...1..3..5..7...
--
--  Data out: (two parts of data)
--      DOx: .............0..1..2..3...
--      DOx: .............4..5..6..7...
--
--
--  Example 2: (Mode BITREV = TRUE): Half-part data to Interleave-2.        
--
--  Data in:
--      DIx: ...0..1..2..3...
--      DIx: ...4..5..6..7...
--
--  Data out: (interleave-2)
--      DOx: .............0..2..4..6...
--      DOx: .............1..3..5..7...
--
--  NB! See the difference between 'iobuf_flow_int2' & 'iobuf_wrap_int2' !!!
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity iobuf_wrap_int2 is
    generic (
        BITREV     : boolean:=FALSE;--! Bit-reverse mode (FALSE - int2-to-half, TRUE - half-to-int2)
        DATA       : integer:= 32;  --! Data Width
        ADDR       : integer:= 10   --! Address depth
    );
    port (
        rst        : in  std_logic; --! Common reset (high)
        clk        : in  std_logic; --! Common clock        

        dt_int0    : in  std_logic_vector(DATA-1 downto 0);    
        dt_int1    : in  std_logic_vector(DATA-1 downto 0);    
        dt_en01    : in  std_logic;
        
        dt_rev0    : out std_logic_vector(DATA-1 downto 0);
        dt_rev1    : out std_logic_vector(DATA-1 downto 0);
        dt_vl01    : out std_logic
    );
end iobuf_wrap_int2;
 
architecture iobuf_wrap_int2 of iobuf_wrap_int2 is

type add_type is array(0 to ADDR-1) of std_logic_vector(ADDR-2 downto 0);
type inc_type is array(0 to ADDR-1) of std_logic_vector(ADDR-2 downto 0);
type msb_type is array(0 to ADDR-1) of integer;

---------------- Calculate Index Counter ----------------
function adr_msb(mode: boolean) return msb_type is
    variable tmp_ret : msb_type;
begin
    tmp_ret(0) := ADDR-1;
    xL: for ii in 1 to ADDR-1 loop
        if (mode = FALSE) then
            tmp_ret(ii) := ii-1;
        else
            tmp_ret(ii) := ADDR-ii-1;
        end if;
    end loop;
    return tmp_ret;
end function;

---------------- Calculate Delay ----------------
function adr_shift(mode: boolean) return inc_type is
    variable tmp_arr : std_logic_vector(ADDR-1 downto 0);
    variable tmp_ret : inc_type;
begin
    if (mode = FALSE) then
        xL1: for ii in 0 to ADDR-1 loop
            tmp_arr := ((ADDR-1-ii) => '1', others => '0');
            tmp_ret(ii) := tmp_arr(ADDR-2 downto 0);
        end loop;
    else
        tmp_ret(0) := (others => '0');
        xL2: for ii in 1 to ADDR-1 loop
            tmp_arr := (ii-1 => '1', others => '0');
            tmp_ret(ii) := tmp_arr(ADDR-2 downto 0);
        end loop;            
    end if;
    return tmp_ret;
end function;

---------------- Calculate Increment ----------------
function adr_increment(mode: boolean) return add_type is
    variable tmp_arr : std_logic_vector(ADDR-1 downto 0);
    variable tmp_ret : add_type;
begin
    tmp_ret(0) := (0 => '1', others => '0');
    
    xL: for ii in 1 to ADDR-1 loop
        if (mode = FALSE) then
            tmp_arr :=  ((ADDR-ii) => '1', others => '0');
        else
            tmp_arr :=  (ii => '1', others => '0');
        end if;
        tmp_ret(ii) := tmp_arr(ADDR-2 downto 0);
    end loop;
    return tmp_ret;
end function;

constant INC_MSB      : msb_type:=adr_msb(BITREV); 
constant INC_DEL      : inc_type:=adr_shift(BITREV); 
constant INC_ADD      : add_type:=adr_increment(BITREV);
 
---------------- Write / Read pointers ----------------
signal WR_MSB         : integer range 0 to ADDR-1;
signal WR_DEL         : std_logic_vector(ADDR-2 downto 0);
signal WR_ADD         : std_logic_vector(ADDR-2 downto 0);

signal WR_INZ         : std_logic_vector(ADDR-2 downto 0);
---------------- RAM input / output ----------------
signal ram_dia        : std_logic_vector(DATA-1 downto 0);
signal ram_dib        : std_logic_vector(DATA-1 downto 0);
    
signal ram0_dia       : std_logic_vector(DATA-1 downto 0);
signal ram0_dib       : std_logic_vector(DATA-1 downto 0);
signal ram1_dia       : std_logic_vector(DATA-1 downto 0);
signal ram1_dib       : std_logic_vector(DATA-1 downto 0);

signal ram0_doa       : std_logic_vector(DATA-1 downto 0);
signal ram0_dob       : std_logic_vector(DATA-1 downto 0);
signal ram1_doa       : std_logic_vector(DATA-1 downto 0);
signal ram1_dob       : std_logic_vector(DATA-1 downto 0);

---------------- RAM Address Wr / Rd ----------------
signal cnt_wr0        : std_logic_vector(ADDR-2 downto 0);
signal cnt_wr1        : std_logic_vector(ADDR-2 downto 0);

signal adr_wr0        : std_logic_vector(ADDR-2 downto 0);
signal adr_wr1        : std_logic_vector(ADDR-2 downto 0);

---------------- RAM read / write enable ----------------
signal ram0_wr0       : std_logic;
signal ram0_wr1       : std_logic;
signal ram1_wr0       : std_logic;
signal ram1_wr1       : std_logic;

signal ram0_we0       : std_logic;
signal ram0_we1       : std_logic;
signal ram1_we0       : std_logic;
signal ram1_we1       : std_logic;

signal ram0_re0       : std_logic;
signal ram0_re1       : std_logic;
signal ram1_re0       : std_logic;
signal ram1_re1       : std_logic;

---------------- Calculate Bit / Index Position -----------------
signal dt_ena         : std_logic;

signal sw_inc         : std_logic;

signal in_cnt         : integer range 0 to ADDR-1;
signal sw_cnt         : std_logic_vector(ADDR-1 downto 0);
signal sw_adr         : std_logic_vector(ADDR-1 downto 0);

signal cnt_ptr        : std_logic_vector(ADDR-1 downto 0);
signal cnt_ena        : std_logic;

signal wr_1st         : std_logic;
signal wr_1zz         : std_logic;
signal in_rst         : std_logic;

begin

---------------- Write 1st Block ---------------- 
pr_cnt1st: process(clk) is
begin
    if rising_edge(clk) then
        wr_1zz <= wr_1st;
        if (rst = '1') then
            wr_1st <= '0';
        else
            if ((sw_adr(sw_adr'left) = '1') and (dt_en01 = '1')) then
                wr_1st <= '1';
            end if;
        end if;
    end if;
end process;

---------------- Write Increment ---------------- 
pr_del: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then
            sw_cnt <= (0 => '1', others => '0');
            sw_adr <= (others => '0');

            in_rst <= '0';
            in_cnt <= 1;
            
            WR_MSB <= INC_MSB(0);
            WR_DEL <= INC_DEL(0);
            WR_ADD <= INC_ADD(0);
        else
            if (dt_en01 = '1') then
                if ((sw_cnt(sw_cnt'left) = '1') and (in_rst = '1')) then
                    sw_adr <= (others => '0');
                else
                    sw_adr <= sw_adr + '1';
                end if;

                ---- Counter for WR0 / WR1 ----
                if (sw_cnt(sw_cnt'left) = '1') then
                    sw_cnt <= (0 => '1', others => '0');
                else
                    sw_cnt <= sw_cnt + '1';
                end if;

                ---- Counter for Arrays ----
                if (sw_cnt(sw_cnt'left) = '1') then
                    if (in_cnt = (ADDR-1)) then
                        in_cnt <= 0;
                        in_rst <= '1';
                    else
                        in_cnt <= in_cnt + 1;
                        in_rst <= '0';
                    end if;
                    WR_MSB <= INC_MSB(in_cnt);
                    WR_DEL <= INC_DEL(in_cnt);
                    WR_ADD <= INC_ADD(in_cnt);
                end if;
            end if;    
            sw_inc <= sw_cnt(sw_cnt'left);
        end if;
    end if;
end process;

WR_INZ <= WR_ADD when rising_edge(clk);

---------------- Write Counters ---------------- 
pr_wr: process(clk) is
begin
    if rising_edge(clk) then
        dt_ena <= dt_en01;
        
        if (rst = '1') then
            ram0_wr0 <= '0';
            ram0_wr1 <= '0';
            ram1_wr0 <= '0';
            ram1_wr1 <= '0';
            
            cnt_wr0 <= (others => '0');
            cnt_wr1 <= WR_DEL;

            cnt_ptr <= (0 => '1', others => '0');
            cnt_ena    <= '0';
        else
            ---- Write enable ----
            if (dt_en01 = '1') then
                if (cnt_ptr(WR_MSB) = '1') then
                    cnt_ptr <= (0 => '1', others => '0');
                    cnt_ena <= '1';
                else
                    cnt_ptr <= cnt_ptr + '1';
                    cnt_ena <= '0';
                end if;
            end if;    

            ---- Find adress counter ----
            if (dt_ena = '1') then
                if (sw_inc = '1') then
                    cnt_wr0 <= (others => '0');
                    cnt_wr1 <= WR_DEL;
                else
                    ---- Write Counter ----
                    if (cnt_ena = '1' and ram0_wr1 = '0') then
                        cnt_wr0 <= cnt_wr0 + WR_INZ + 1;
                        cnt_wr1 <= cnt_wr1 + WR_INZ + 1;
                    else
                        cnt_wr0 <= cnt_wr0 + WR_INZ;
                        cnt_wr1 <= cnt_wr1 + WR_INZ;
                    end if;
                end if;
            end if;

            ---- Find increment mux ----
            -- if (dt_en01 = '1') then
            ram0_wr0 <= dt_en01 and not sw_adr(WR_MSB);
            ram0_wr1 <= dt_en01 and (not (WR_ADD(0) or sw_adr(WR_MSB)));
            ram1_wr0 <= dt_en01 and (WR_ADD(0) or sw_adr(WR_MSB));
            ram1_wr1 <= dt_en01 and (not WR_ADD(0) and sw_adr(WR_MSB));
            -- end if;
        end if;
    end if;
end process;

------------ RAM 0/1 mapping ------------
pr_din: process(clk) is
begin
    if rising_edge(clk) then
        ---- Input data delays ----
        ram_dia <= dt_int0;
        ram_dib <= dt_int1;
        ---- Mux input data ----
        if (ram0_wr0 = '1') then
            ram0_dia <= ram_dia;
            ram0_dib <= ram_dib;
        end if;
        if (ram1_wr0 = '1') then
            ram1_dia <= ram_dia;
            ram1_dib <= ram_dib;
        end if;
        ---- Write enable to RAMBs ----
        ram0_we0 <= ram0_wr0;
        ram0_we1 <= ram0_wr1;
        ram1_we0 <= ram1_wr1;
        ram1_we1 <= ram1_wr0;
        
        ram0_re0 <= ram0_we0 and wr_1zz;
        ram0_re1 <= ram0_we1 and wr_1zz;
        ram1_re0 <= ram1_we0 and wr_1zz;
        ram1_re1 <= ram1_we1 and wr_1zz;

        ---- Address R/W RAMBs ----
        adr_wr0 <= cnt_wr0;
        adr_wr1 <= cnt_wr1;
    end if;
end process;

------------ Output data ------------
pr_dout: process(clk) is
begin
    if rising_edge(clk) then
        ---- Mux output data 0 ----
        if (ram0_re0 = '1') then
            dt_rev0 <= ram0_doa;
        elsif (ram1_re0 = '1') then
            dt_rev0 <= ram1_doa;
        end if;
        ---- Mux output data 1 ----
        if (ram0_re1 = '1') then
            dt_rev1 <= ram0_dob;
        elsif (ram1_re1 = '1') then
            dt_rev1 <= ram1_dob;
        end if;
        ---- Mux output valid 01 ----
        dt_vl01 <= (ram0_re0 or ram1_re0) and (ram0_re1 or ram1_re1);
    end if;
end process;

------------ RAM 0 Component ------------
xTDP_RAM0: entity work.ramb_tdp_rw
    generic map (
        DATA    => DATA,
        ADDR    => ADDR-1
        )
    port map (
        clk     => clk,
        -- Port A --
        a_wr    => ram0_we0,
        a_rd    => ram0_we0,
        a_addr  => adr_wr0,
        a_din   => ram0_dia, 
        a_dout  => ram0_doa,
        -- Port B --
        b_wr    => ram0_we1,
        b_rd    => ram0_we1,
        b_addr  => adr_wr1,
        b_din   => ram0_dib, 
        b_dout  => ram0_dob
    );

------------ RAM 1 Component ------------
xTDP_RAM1: entity work.ramb_tdp_rw
    generic map (
        DATA    => DATA,
        ADDR    => ADDR-1
        )
    port map (
        clk     => clk,
        -- Port A --
        a_wr    => ram1_we0,
        a_rd    => ram1_we0,
        a_addr  => adr_wr0,
        a_din   => ram1_dia, 
        a_dout  => ram1_doa,
        -- Port B --
        b_wr    => ram1_we1,
        b_rd    => ram1_we1,
        b_addr  => adr_wr1,
        b_din   => ram1_dib, 
        b_dout  => ram1_dob
    );

end iobuf_wrap_int2;