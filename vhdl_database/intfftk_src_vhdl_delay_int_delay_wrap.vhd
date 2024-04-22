-------------------------------------------------------------------------------
--
-- Title       : int_delay_wrap
-- Design      : fpfftk
-- Author      : Kapitanov Alexander 
-- E-mail      : sallador@bk.ru
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Common delay line for FFT (Bursting mode - I)
--
-------------------------------------------------------------------------------
--
--    Created: 12.11.2018. 
--
--    It is a huge delay line which combines all of delay lines for FFT core.
--    For (N and STAGE) pair you will see area resources after process of mapping.
--    SLICEM and LUTs used for short delay lines (shift registers / distr. mem).
--    RAMB36 and RAMB18 used for long delay lines.
--
--    Delay lines: 
--        NFFT =  2,  N =    4,  delay = 001 - FD,
--        NFFT =  3,  N =    8,  delay = 002 - 2*FD,
--        NFFT =  4,  N =   16,  delay = 004 - SLISEM/8 (SRL16),
--        NFFT =  5,  N =   32,  delay = 008 - SLISEM/4 (SRL16),
--        NFFT =  6,  N =   64,  delay = 016 - SLISEM/2 (SRL16),
--        NFFT =  7,  N =  128,  delay = 032 - SLISEM (SRL32),
--        NFFT =  8,  N =  256,  delay = 064 - 2*SLISEM (CLB/2),
--        NFFT =  9,  N =  512,  delay = 128 - 4*SLISEM (CLB), 
--        NFFT = 10,  N =   1K,  delay = 256 - 8*SLISEM (2*CLB), ** OR 4+1 RAMB18E1
--        NFFT = 11,  N =   2K,  delay = 512 - 4 RAMB18
--        NFFT = 12,  N =   4K,  delay = 01K - 6 RAMB18
--        NFFT = 13,  N =   8K,  delay = 02K - 16 RAMB18
--        NFFT = 14,  N =  16K,  delay = 04K - 32 RAMB18
--        NFFT = 15,  N =  32K,  delay = 08K - 64 RAMB18
--        NFFT = 16,  N =  64K,  delay = 16K - 128 RAMB18 
--        NFFT = 17,  N = 128K,  delay = 32K - 128 RAMB36 
--        NFFT = 18,  N = 256K,  delay = 64K - 256 RAMB36 etc.
--         
--  Example: NFFT = 4 stages  =>  (N = 2^NFFT = 16 points of FFT).
--           Number of delay line stages: NFFT-1 (from 0 to NFFT-2).
--           Plot time diagrams for stage 0, 1 and 2.
--
--    
-- Data enable (input) and data valid (output) strobes take N/2 clock cycles.
-- Data for "A" line - 1'st part of FFT data (from 0 to N/2-1)
-- Data for "B" line - 2'nd part of FFT data (from N/2 to N-1)
--
-- Delay line 0:      
-- 
-- Input:        ________________________
-- DI_EN     ___/                        \____
-- DI_AA:        /0\/1\/2\/3\/4\/5\/6\/7\
-- DI_BB:        \8/\9/\A/\B/\C/\D/\E/\F/
--                ___________
-- Cross*:    ___|           |________________
--
-- Output:              ________________________
-- DO_VL            ___/                        \___
-- DO_AA:               /0\/1\/2\/3\/8\/9\/A\/B\
-- DO_BB:               \4/\5/\6/\7/\C/\D/\E/\F/
--
--
-- Delay line 1: (Input for line 1 = output for line 0)
-- 
-- Input:        ________________________
-- DI_EN     ___/                        \____
-- DI_AA:        /0\/1\/2\/3\/8\/9\/A\/B\
-- DI_BB:        \4/\5/\6/\7/\C/\D/\E/\F/
--                _____       _____ 
-- Cross:     ___|     |_____|     |___________
--
-- Output:              ________________________
-- DO_VL            ___|                        |___
-- DO_AA:               /0\/1\/4\/5\/8\/9\/C\/D\
-- DO_BB:               \2/\3/\6/\7/\A/\B/\E/\F/
--
--
--
-- Delay line 2: (Input for line 2 = output for line 1)
-- 
-- Input:        ________________________
-- DI_EN     ___/                        \____
-- DI_AA:        /0\/1\/4\/5\/8\/9\/C\/D\
-- DI_BB:        \2/\3/\6/\7/\A/\B/\E/\F/
--                __    __    __    __ 
-- Cross:     ___|  |__|  |__|  |__|  |_______
--
-- Output:              ________________________
-- DO_VL            ___/                        \___
-- DO_AA:               /0\/2\/4\/6\/8\/A\/C\/E\
-- DO_BB:               \1/\3/\5/\7/\9/\B/\D/\F/
--
--
-- * - Cross signal used for data switching (A and B lines)
-- 
-------------------------------------------------------------------------------
--
--  Delay line scheme (+ example):
--                     
--         |           |             |            | 
--         |   _____   |    ______   |            | 
--         |  |     |  |   | MUXD |  |            | 
-- DI_BB --|->| N/4 |--|-->|------>--|------------|--> DO_BB
--         |  |_____|  |   | \  / |  |            | 
--         |           |   |  \/  |  |            | 
--         |           |   |  /\  |  |    _____   |    
--         |           |   | /  \ |  |   |     |  | 
-- DI_AA --|-----------|-->|------>--|-->| N/4 |--|--> DO_AA
--         |           |   |______|  |   |_____|  | 
--         |           |             |            | 
--         |           |             |            | 
--         X0          X1            X2           X3
--
--
-- Input data:       ________________________
-- ENABLE        ___/                        \____
-- X0_AA:            /0\/1\/2\/3\/4\/5\/6\/7\
-- X0_BB:            \8/\9/\A/\B/\C/\D/\E/\F/
--               
-- Delay B line:          
-- X1_AA:            /0\/1\/2\/3\/4\/5\/6\/7\
-- X1_BB:                        \8/\9/\A/\B/\C/\D/\E/\F/
--               
-- Multiplexing:       
-- X2_AA:            /0\/1\/2\/3\/8\/9\/A\/B\
-- X2_BB:                        \4/\5/\6/\7/\C/\D/\E/\F/
--                   
-- Delay A line (Output):        ________________________
-- VALID                     ___/                        \____
-- X3_AA:                        /0\/1\/2\/3\/8\/9\/A\/B\
-- X3_BB:                        \4/\5/\6/\7/\C/\D/\E/\F/
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

entity int_delay_wrap is
    generic (
        NFFT        : integer:=18; --! FFT NFFT
        STAGE       : integer:=0; --! Stage number
        NWIDTH      : integer:=64 --! Data width
    );
    port (
        DI_AA       : in  std_logic_vector(NWIDTH-1 downto 0); --! Data in even
        DI_BB       : in  std_logic_vector(NWIDTH-1 downto 0); --! Data in odd
        DI_EN       : in  std_logic; --! Data di_enble
        DO_AA       : out std_logic_vector(NWIDTH-1 downto 0); --! Data out even
        DO_BB       : out std_logic_vector(NWIDTH-1 downto 0); --! Data out odd
        DO_VL       : out std_logic; --! Data do_vlid

        RST         : in  std_logic; --! Reset
        CLK         : in  std_logic --! Clock
    );
end int_delay_wrap;

architecture int_delay_wrap of int_delay_wrap is 

CONSTANT N_INV       : integer:=NFFT-STAGE-2; 

---------------- Ram 0/1 signal declaration ----------------
signal ram0_di       : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal ram1_di       : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal ram0_do       : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal ram1_do       : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');

signal addr_rd0      : std_logic_vector(N_INV-1 downto 0);
signal addr_rd1      : std_logic_vector(N_INV-1 downto 0);
signal addr_wr0      : std_logic_vector(N_INV-1 downto 0);
signal addr_wr1      : std_logic_vector(N_INV-1 downto 0);

signal addr_wz1      : std_logic_vector(N_INV-1 downto 0);

signal rd0           : std_logic;
signal rd1           : std_logic;
signal we0           : std_logic;
signal we1           : std_logic;

---------------- Ram 0/1 arrays ----------------
type ram_t is array(0 to 2**(N_INV)-1) of std_logic_vector(NWIDTH-1 downto 0);  
signal bram0         : ram_t;
signal bram1         : ram_t;    

---------------- Switch / Counter / Delays ----------------
signal cross         : std_logic:='0';
signal cnt_adr       : std_logic_vector(N_INV downto 0);

signal valid         : std_logic;

signal di_az         : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal do_zz         : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal di_ez         : std_logic;

signal wr_1st        : std_logic;

begin

---- Common processes for delay lines ----
pr_wrcr: process(clk) is
begin
    if rising_edge(clk) then
        di_ez <= di_en;
        if (rst = '1') then 
            cnt_adr <= (others => '0');
        elsif (di_en = '1') then
             cnt_adr <= cnt_adr + '1';
        end if;
    end if;
end process;

cross <= cnt_adr(N_INV) when rising_edge(clk) and (di_en = '1');     

---------------- Write 1st Block ---------------- 
pr_cnt1st: process(clk) is

begin
    if rising_edge(clk) then
        if (rst = '1') then
            wr_1st <= '0';
        else
            if ((cnt_adr(N_INV) = '1') and (di_en = '1')) then
                wr_1st <= '1';
            end if;
        end if;
    end if;
end process;

ram0_di <= di_bb;

---- Address Read / write Ram 0 ----
addr_wr0 <= cnt_adr(N_INV-1 downto 0);
addr_rd0 <= cnt_adr(N_INV-1 downto 0);

---- Address Read / write Ram 1 ----
addr_wr1 <= addr_wz1 when rising_edge(clk);
addr_rd1 <= addr_wz1 when rising_edge(clk);

addr_wz1 <= cnt_adr(N_INV-1 downto 0) when rising_edge(clk);

---- R/W Ram 0 enable ----
we0 <= di_en;
rd0 <= di_en;

---- R/W Ram 1 enable ----
we1 <= di_ez when rising_edge(clk);
rd1 <= di_ez when rising_edge(clk);

------------ Switch Ram 1 Input ------------
pr_di: process(clk) is
begin        
    if rising_edge(clk) then
        di_az <= di_aa;
        if (cross = '1') then
            ram1_di <= ram0_do; 
        else
            ram1_di <= di_az;
        end if;
    end if;
end process; 

------------ Switch Output & Valid ------------
DO_AA <= ram1_do;
pr_do: process(clk) is
begin
    if rising_edge(clk) then
        valid <= di_ez and wr_1st;    
        if (cross = '1') then
            do_zz <= di_az;
        else
            do_zz <= ram0_do;
        end if;
        DO_BB <= do_zz;
        DO_VL <= valid;
    end if;
end process;

------------ First RAMB delay line ------------ 
xRAM0: process(clk) is
begin
    if (clk'event and clk = '1') then
        if (rd0 = '1') then
            ram0_do <= bram0(conv_integer(addr_rd0));
        end if;
        if (we0 = '1') then
            bram0(conv_integer(addr_wr0)) <= ram0_di;
        end if;
    end if;    
end process;

------------ Second RAMB delay line ------------
xRAM1: process(clk) is
begin
    if (clk'event and clk = '1') then
        if (rd1 = '1') then
            ram1_do <= bram1(conv_integer(addr_rd1));
        end if;
        if (we1 = '1') then
            bram1(conv_integer(addr_wr1)) <= ram1_di;
        end if;
    end if;
end process;

end int_delay_wrap;