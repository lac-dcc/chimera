-------------------------------------------------------------------------------
--
-- Title       : iobuf_fft_int2
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Convert data from interleave-2 mode to delay-path [N/2].
--               Common clock. Data enable strobe can't be wrapped. 
--
-------------------------------------------------------------------------------
--
--  Version 1.0  25.04.2019
--
--  BITREV   : boolean  -  Bit-reverse mode:
--                              FALSE - int2-to-half, TRUE - half-to-int2
--  DATA     : integer  -  Input/Output Data width
--  ADDR     : integer  -  Address depth (number of FFT stages)
--
--
--  Example 1 (Mode BITREV = FALSE): Interleave-2 to Half-part data.        
--
--  Data in:
--      DIx: ...0246...
--      DIx: ...1357...
--
--  Data out: (two parts of data)
--      DOx: .......0123...
--      DOx: .......4567...
--
--  Example 2 (Mode BITREV = TRUE): Half-part data to Interleave-2.        
--
--  Data in:
--      DIx: ...0123...
--      DIx: ...4567...
--
--  Data out: (interleave-2)
--      DOx: .......0246...
--      DOx: .......1357...
--
--  NB! See the difference between 'iobuf_fft_int2' & 'iobuf_wrap_int2' !!!
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--
--  GNU GENERAL PUBLIC LICENSE
--  Version 3, 29 June 2007
--
--  Copyright (c) 2019 Kapitanov Alexander
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

entity iobuf_fft_int2 is
    generic (
        BITREV      : boolean:=FALSE;--! Bit-reverse mode
        DATA        : integer:= 32;  --! Data Width
        ADDR        : integer:= 10   --! Address depth
    );
    port (
        ---- Common signals ----
        CLK         : in  std_logic; --! Clock
        RST         : in  std_logic; --! Reset
        ---- Input data ----
        DT_INT0     : in  std_logic_vector(DATA-1 downto 0); --! Data Even
        DT_INT1     : in  std_logic_vector(DATA-1 downto 0); --! Data Odd
        DT_EN01     : in  std_logic; --! Data enable
        ---- Output data ----
        DT_REV0     : out std_logic_vector(DATA-1 downto 0); --! FC: First part
        DT_REV1     : out std_logic_vector(DATA-1 downto 0); --! FC: Second part
        DT_VL01     : out std_logic --! Data valid
    );
end iobuf_fft_int2;
 
architecture iobuf_fft_int2 of iobuf_fft_int2 is

---------------- Input data ----------------
signal dt_ena        : std_logic;

---------------- RAM signals ----------------
signal ram_dia       : std_logic_vector(DATA-1 downto 0);
signal ram_dib       : std_logic_vector(DATA-1 downto 0);
    
signal ram_wr        : std_logic;
signal ram_rd        : std_logic;
signal ram_rdz       : std_logic;
    
signal ram_adra      : std_logic_vector(ADDR-1 downto 0);
signal ram_adrb      : std_logic_vector(ADDR-1 downto 0);
    
signal ram_doa       : std_logic_vector(DATA-1 downto 0);
signal ram_dob       : std_logic_vector(DATA-1 downto 0);
    
signal rd_1st        : std_logic;

---------------- Calculate Bit / Index Position -----------------
type str_arr is array(0 to ADDR-1) of std_logic_vector(ADDR-1 downto 0);
type int_arr is array(0 to ADDR-1) of integer;

---------------- Calculate bit position for counter reset --------
function hi_bits(mode : boolean) return int_arr is
    variable Arr_Hot : int_arr;
begin
    Arr_Hot(0) := ADDR-1;
    Arr_Hot(1) := ADDR-1;
    for jj in 2 to ADDR-1 loop
        if (mode = FALSE) then
            Arr_Hot(jj) := jj-1;
        else
            Arr_Hot(jj) := ADDR-jj;
        end if;
    end loop;
    return Arr_Hot; 
end function;

function str_array(mode, incr : boolean) return str_arr is
    variable Tmp_Std : std_logic_vector(ADDR-1 downto 0);
    variable Dat_Std : std_logic_vector(ADDR-1 downto 0);    
    variable Arr_Hot : str_arr;
begin
    if (mode = FALSE) then
        if (incr = FALSE) then
            Dat_Std :=(1 => '1', others => '0');
        else
            Dat_Std :=(0 => '1', others => '0');
        end if;
    else
        if (incr = FALSE) then
            Dat_Std :=(0 => '1', others => '0');
        else
            Dat_Std :=((ADDR-1) => '1', others => '0');
        end if;    
    end if;
    
    Arr_Hot(0) := Dat_Std;
    if (mode = FALSE) then    
        ---- Inverse One-Hot Encoding ----
        for jj in 0 to ADDR-2 loop
            Tmp_Std(Tmp_Std'left-1 downto 0) := Arr_Hot(jj)(Tmp_Std'left downto 1); 
            Tmp_Std(Tmp_Std'left) := Arr_Hot(jj)(0);
            
            Arr_Hot(jj+1) := Tmp_Std;
        end loop;
    else
        for jj in 0 to ADDR-2 loop
            Tmp_Std(Tmp_Std'left downto 1) := Arr_Hot(jj)(Tmp_Std'left-1 downto 0); 
            Tmp_Std(0) := Arr_Hot(jj)(Tmp_Std'left);
            
            Arr_Hot(jj+1) := Tmp_Std;
        end loop;
    end if;

    return Arr_Hot; 
end function;

constant STD_DEL       : str_arr:=str_array(BITREV, TRUE);
constant STD_INC       : str_arr:=str_array(BITREV, FALSE);
constant INC_BIT       : int_arr:=hi_bits(BITREV);

signal in_cnt          : integer range 0 to ADDR-1;
signal sw_cnt          : std_logic_vector(ADDR-1 downto 0);

signal WR_RNG          : integer range 0 to ADDR-1;
signal WR_INC          : std_logic_vector(ADDR-1 downto 0);
signal WR_DEL          : std_logic_vector(ADDR-1 downto 0);

signal WR_INZ          : std_logic_vector(ADDR-1 downto 0);

signal sw_inc          : std_logic;
signal sw_ena          : std_logic;

signal cnt_even        : std_logic_vector(ADDR-1 downto 0);
signal cnt_odd         : std_logic_vector(ADDR-1 downto 0);
signal sw_ptr          : std_logic_vector(ADDR-1 downto 0);


type mem_type is array ((2**ADDR)-1 downto 0) of std_logic_vector(DATA-1 downto 0);
shared variable mem : mem_type:=(others => (others => '0'));

--attribute ram_style : string;
--attribute ram_style of mem : variable is "block"; 

begin

---------------- Write Increment ---------------- 
pr_del: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then
            sw_cnt <= (0 => '1', others => '0');
            sw_inc <= '0';
            in_cnt <= 1;
            WR_INC <= STD_INC(0);
            WR_DEL <= STD_DEL(0);
            WR_RNG <= INC_BIT(0);
        else
            if (dt_en01 = '1') then
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
                    else
                        in_cnt <= in_cnt + 1;
                    end if;
                    WR_INC <= STD_INC(in_cnt);
                    WR_DEL <= STD_DEL(in_cnt);
                    WR_RNG <= INC_BIT(in_cnt);
                end if;
            end if;
            sw_inc <= sw_cnt(sw_cnt'left);
        end if;
    end if;
end process;

WR_INZ <= WR_INC when rising_edge(clk);

---------------- Write Counters ---------------- 
pr_wr: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then
            cnt_even <= (others => '0');
            cnt_odd  <= WR_DEL;
            sw_ptr   <= (0 => '1', others => '0');
            sw_ena   <= '0';
        else
            ---- Find increment mux ----
            if (dt_en01 = '1') then
                if (sw_ptr(WR_RNG) = '1') then
                    sw_ptr <= (0 => '1', others => '0');
                    sw_ena <= '1';
                else
                    sw_ptr <= sw_ptr + '1';
                    sw_ena <= '0';
                end if;
            end if;
            ---- Find address counter ----
            if (dt_ena = '1') then        
                if (sw_inc = '1') then
                    cnt_even <= (others => '0');
                    cnt_odd  <= WR_DEL;
                else
                    ---- Write Counter ----
                    if (sw_ena = '1') then
                        cnt_even <= cnt_even + WR_INZ + 1;
                        cnt_odd  <= cnt_odd  + WR_INZ + 1;
                    else
                        cnt_even <= cnt_even + WR_INZ;
                        cnt_odd  <= cnt_odd  + WR_INZ;
                    end if;
                end if;
            end if;
        end if;
    end if;
end process;

---------------- Read 1st ----------------
pr_pr1st: process(clk) is
begin
    if (clk'event and clk='1') then
        if (rst = '1') then
            rd_1st <= '0';
        else
            if ((dt_en01 = '1') and sw_ptr(sw_ptr'left) = '1') then
                rd_1st <= '1';
            end if;
        end if;
    end if;
end process;

dt_ena <= dt_en01 when rising_edge(clk);

---------------- RAM 0/1 mapping ----------------
ram_dia <= dt_int0 when rising_edge(clk);
ram_dib <= dt_int1 when rising_edge(clk);

ram_adra <= cnt_even;
ram_adrb <= cnt_odd;

---------------- RAM Write / Read ----------------
pr_rdwr: process(clk) is
begin
    if (clk'event and clk='1') then
        if (rst = '1') then
            ram_wr <= '0';
            ram_rd <= '0';
        else
            ram_wr <= dt_en01;
            ram_rd <= dt_en01 and rd_1st;
        end if;
    end if;
end process;

---------------- Data out ----------------
pr_out: process(clk) is
begin
    if (clk'event and clk='1') then
        if (rst = '1') then
            dt_rev0 <= (others => '0');
            dt_rev1 <= (others => '0');
            dt_vl01 <= '0';
        else
            dt_rev0 <= ram_doa;
            dt_rev1 <= ram_dob;
            dt_vl01 <= ram_rdz;
        end if;
    end if;
end process;
ram_rdz <= ram_rd when rising_edge(clk);

---------------- Attach Dual-port one-clock RAM ----------------
-- Port A write --
pr_wa: process(clk) is
begin
    if (clk'event and clk='1') then
        ram_doa <= mem(conv_integer(ram_adra));
        if (ram_wr = '1') then
            mem(conv_integer(ram_adra)) := ram_dia;
        end if; 
    end if;
end process;

-- Port B write --
pr_wb: process(clk) is
begin
    if (clk'event and clk='1') then
        ram_dob <= mem(conv_integer(ram_adrb));
        if (ram_wr = '1') then
            mem(conv_integer(ram_adrb)) := ram_dib;
        end if; 
    end if;
end process;

end iobuf_fft_int2;