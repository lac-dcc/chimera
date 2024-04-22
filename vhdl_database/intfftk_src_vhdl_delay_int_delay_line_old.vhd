-------------------------------------------------------------------------------
--
-- Title       : int_delay_line_old
-- Design      : fpfftk
-- Author      : Kapitanov Alexander 
-- E-mail      : sallador@bk.ru
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Cross-commutation delays (pipelined streaming)
--
-------------------------------------------------------------------------------
--
--    Version 1.0  29.09.2015
--      Description: Common delay line for FFT    
--        It is a huge delay line which combines all of delay lines for FFT core
--        For (N and stage) pair you will see area resources after process of mapping.
--        SLICEM and LUTs used for short delay lines (shift registers).
--        SLICEM and LUTs or (RAMB18) used for medium delay lines.
--        RAMB36 and RAMB18 used for long delay lines.
--
--    Version 1.1  03.10.2015 
--      Delay lines: 
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
--    Version 1.4  10.05.2018 
--               Delay line switching explained
--               
--  Example: NFFT = 4 stages  =>  (N = 2^NFFT = 16 points of FFT).             
--      Number of delay line stages: NFFT-1 (from 0 to NFFT-2).
--      Plot time diagrams for stage 0, 1 and 2.
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
-- 
--    Version 1.5  11.05.2018 
--               Delay line scheme (+ example):
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

entity int_delay_line_old is
    generic (
        NFFT     : integer:=18; --! FFT NFFT
        STAGE    : integer:=0; --! Stage number
        NWIDTH   : integer:=64 --! Data width
    );
    port (
        DI_AA    : in  std_logic_vector(NWIDTH-1 downto 0); --! Data in even
        DI_BB    : in  std_logic_vector(NWIDTH-1 downto 0); --! Data in odd
        DI_EN    : in  std_logic; --! Data di_enble
        DO_AA    : out std_logic_vector(NWIDTH-1 downto 0); --! Data out even
        DO_BB    : out std_logic_vector(NWIDTH-1 downto 0); --! Data out odd
        DO_VL    : out std_logic; --! Data do_vlid

        RST      : in  std_logic; --! Reset
        CLK      : in  std_logic --! Clock    
    );    
end int_delay_line_old;

architecture int_delay_line_old of int_delay_line_old is 

CONSTANT N_INV       : integer:=NFFT-STAGE-2; 

signal di_enz        : std_logic;

signal cross         : std_logic;
signal cnt_wrcr      : std_logic_vector(N_INV downto 0);
signal do_aa_e       : std_logic_vector(NWIDTH-1 downto 0);
signal do_bb_e       : std_logic_vector(NWIDTH-1 downto 0);

signal ram0_din      : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal ram0_dout     : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal ram1_din      : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');
signal ram1_dout     : std_logic_vector(NWIDTH-1 downto 0):=(others => '0');

signal di_aaz        : std_logic_vector(NWIDTH-1 downto 0);

begin
 
-- Common processes for delay lines --
pr_cnt_wrcr: process(clk) is
begin
    if rising_edge(clk) then
        if (rst = '1') then 
            cnt_wrcr <= (others => '0');
        elsif (di_enz = '1') then
            cnt_wrcr <= cnt_wrcr + '1';
        end if;    
    end if;
end process;

pr_din: process(clk) is
begin        
    if rising_edge(clk) then
        if (di_en = '1') then
            ram0_din <= di_bb;
        end if;
        if (cross = '1') then
            ram1_din <= ram0_dout; 
        else
            ram1_din <= di_aaz;
        end if;
    end if;
end process; 

do_aa <= do_aa_e;

G_DEL_SHORT: if (N_INV < 9) generate
    signal ram_del : std_logic_vector(2**(N_INV)-1 downto 0):=(others=>'0');
begin
    
    di_enz <= di_en;
    cross <= cnt_wrcr(N_INV);
    di_aaz <= di_aa;
    
    ram_del <= ram_del(2**(N_INV)-2 downto 0) & di_en when rising_edge(clk);
    
    -- RAMB delay line 1 -- 
    GEN_GRT1: if (N_INV > 0) generate
        constant delay  : integer:=2**(N_INV)-2;
        type std_logic_array_NarrxNWIDTH is array (delay downto 0) of std_logic_vector(NWIDTH-1 downto 0);    
        signal dout0, dout1    : std_logic_array_NarrxNWIDTH;
    begin            
        dout1 <= dout1(delay-1 downto 0) & ram1_din when rising_edge(clk);    
        dout0 <= dout0(delay-1 downto 0) & ram0_din when rising_edge(clk);

        ram1_dout <= dout1(delay);
        ram0_dout <= dout0(delay);
    end generate;
    
    -- RAMB delay line 0 -- 
    GEN_LOW1: if (N_INV = 0 ) generate
        ram0_dout <= ram0_din;
        ram1_dout <= ram1_din;
    end generate;
    
    do_vl <= ram_del(2**(N_INV)-1) when rising_edge(clk);
    
    pr_out: process(clk) is
    begin
        if rising_edge(clk) then
            if (ram_del(2**(N_INV)-1) = '1') then
                do_aa_e <= ram1_dout;
                if (cross = '1') then
                    do_bb_e <= di_aa;
                else
                    do_bb_e <= ram0_dout;
                end if;
            end if;
        end if;
    end process; 

    do_bb <= do_bb_e;
end generate; 

G_DEL_LONG: if (N_INV >= 9) generate

    signal cnt_wr      : std_logic_vector(N_INV-1 downto 0);    
    
    signal addrs       : std_logic_vector(N_INV-1 downto 0); 
    signal addrs1      : std_logic_vector(N_INV-1 downto 0);
    signal addrz       : std_logic_vector(N_INV-1 downto 0); 
    signal addrz1      : std_logic_vector(N_INV-1 downto 0);

    signal dir_aa      : std_logic_vector(NWIDTH-1 downto 0);

    signal do_bb_z     : std_logic_vector(NWIDTH-1 downto 0);
    signal del_o       : std_logic;

    signal we          : std_logic;
    signal wes         : std_logic;
    signal wes1        : std_logic;
    signal wez         : std_logic;
    signal wez1        : std_logic;
    signal do_vlid     : std_logic;
    
    signal rw_del      : std_logic;
    signal cnt_trd     : std_logic_vector(NFFT-2-stage downto 0);
    signal cnt_twr     : std_logic_vector(NFFT-2-stage downto 0);
    signal cnt_ena     : std_logic;    

    signal di_aa_ze    : std_logic_vector(NWIDTH-1 downto 0); 

    type ram_t is array(0 to 2**(N_INV)-1) of std_logic_vector(NWIDTH-1 downto 0);  
    signal bram0       : ram_t;
    signal bram1       : ram_t;

    --attribute ram_style    : string;
    --attribute ram_style of bram0    : signal is "block";
    --attribute ram_style of bram1    : signal is "block";   

begin
    pr_cnd: process(clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then 
                cnt_trd <= (0 => '1', others => '0');
                cnt_twr <= (0 => '1', others => '0');
                cnt_ena <= '0';
            else
                -- @write data --
                if (cnt_trd(NFFT-2-stage) = '1') then
                    cnt_trd <= (0 => '1', others => '0');
                else 
                    if (di_en = '1') then
                        cnt_trd <= cnt_trd + '1';
                    end if;    
                end if;                
                -- delayed data enable --
                if (cnt_trd(NFFT-2-stage) = '1') then
                    cnt_ena <= '1';
                elsif (cnt_twr(NFFT-2-stage) = '1') then
                    cnt_ena <= '0';
                end if;
                -- @read data --
                if (cnt_twr(NFFT-2-stage) = '1') then
                    cnt_twr <= (0 => '1', others => '0');
                else 
                    if (cnt_ena = '1') then
                        cnt_twr <= cnt_twr + '1';
                    end if;    
                end if;
            end if;
        end if;
    end process;    
    del_o <= cnt_ena when rising_edge(clk);
    
    di_enz <= di_en when rising_edge(clk);    
    cross <= cnt_wrcr(N_INV) when rising_edge(clk);
    di_aa_ze <= di_aa when rising_edge(clk);
    di_aaz <= di_aa_ze when rising_edge(clk);
    
    we   <= di_en when rising_edge(clk);
    wez  <= we when rising_edge(clk);

    wes  <= wez when rising_edge(clk);
    
    wez1 <= del_o when rising_edge(clk);     
    wes1 <= wez1 when rising_edge(clk); 
    do_vlid <= wes1 when rising_edge(clk);
    do_vl <= do_vlid when rising_edge(clk);    
    
    addrz   <= cnt_wrcr(N_INV-1 downto 0) when rising_edge(clk);
    addrz1  <= cnt_wr when rising_edge(clk);    
    addrs   <= addrz when rising_edge(clk);
    addrs1  <= addrz1 when rising_edge(clk);    
    
    pr_cnt: process(clk) is
    begin
        if rising_edge(clk) then
            if (rst = '1') then 
                cnt_wr <= (others => '0');
            else
                if (del_o = '1') then
                    cnt_wr <= cnt_wr + '1';
                end if;
            end if;
        end if;
    end process;
    
    pr_do_bb: process(clk) is
    begin
        if rising_edge(clk) then
            if (cross = '1') then
                do_bb_e <= dir_aa;
            else
                do_bb_e <= ram0_dout;
            end if;
        end if;
    end process;
    
    dir_aa   <= di_aa_ze when rising_edge(clk);    

    do_bb_z  <= do_bb_e when rising_edge(clk);
    do_bb    <= do_bb_z when rising_edge(clk);
    do_aa_e  <= ram1_dout when rising_edge(clk);
     
    -- First RAMB delay line -- 
    RAM0: process(clk) is
    begin
        if (clk'event and clk = '1') then
            if (del_o = '1') then
                ram0_dout <= bram0(conv_integer(cnt_wr)); -- dual port
            end if;
            if (we = '1') then
                bram0(conv_integer(cnt_wrcr(N_INV-1 downto 0))) <= ram0_din;
            end if;
        end if;    
    end process;
    
    -- Second RAMB delay line --
    RAM1: process(clk) is
    begin
        if (clk'event and clk = '1') then
            if (wes1 = '1') then
                ram1_dout <= bram1(conv_integer(addrs1)); -- dual port
            end if;               
            if (wes = '1') then
                bram1(conv_integer(addrs)) <= ram1_din;
            end if;
        end if;
    end process;
end generate;

end int_delay_line_old;