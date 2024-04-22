-------------------------------------------------------------------------------
--
-- Title       : fp_fastconv_tb
-- Design      : Fast Convolution
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-- Description : Testbench file for complex testing FFT / IFFT
--
-- Has several important constants:
--
--  NFFT       - (p) - Number of stages = log2(FFT LENGTH)
--  SCALE      - (p) - Scale for FP23-2-INT16. NO_SCALE = "010000"
--  XSERIES    - (p) - Xilinx Series: "7SERIES" / "ULTRA"
--
-- How to check Fast Convolution:
-- 1. Create *.xpr (Vivado project)
-- 2. Add sources from src/
-- 3. Set this file as top for simulation
-- 4. Run *.m file from math/ directory. Set NFFT and other signal parameters.
--      After this you will get test file "test_signal.dat" with complex signal.
-- 5. Run simulation into Vivado / Aldec Active-HDL / ModelSim. 
-- 6. Rerun *.m script. Compare an ideal and HDL results.
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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

use ieee.std_logic_textio.all;
use std.textio.all;

entity fp_fastconv_tb is 
end fp_fastconv_tb;

architecture fp_fastconv_tb of fp_fastconv_tb is

-- **************************************************************** --
-- **** Constant declaration: change any parameter for testing **** --
-- **************************************************************** --

constant  NFFT        : integer:=8;  -- Number of stages = log2(FFT LENGTH)
constant  DATA_WIDTH  : integer:=16; -- Data width for signal imitator: 16.
constant  SCALE       : std_logic_vector(5 downto 0):="011101";
constant  XSERIES     : string:="ULTRA";

-- **************************************************************** --
-- ********* Signal declaration: clocks, reset, data etc. ********* --
-- **************************************************************** --

signal clk_dsp      : std_logic:='0';
signal clk_trd      : std_logic:='0';
signal reset        : std_logic:='0';

------------------------ Input data --------------------
signal di_dt        : std_logic_vector(63 downto 0):=(others=>'0'); 
signal di_en        : std_logic:='0';

------------------------ Output data -------------------
signal do_dt        : std_logic_vector(63 downto 0); 
signal do_en        : std_logic:='0';

------------------------ Sfunction ----------------------

signal sf_rd        : std_logic:='0';                
signal sf_ld        : std_logic_vector(1 downto 0):="00";
signal sf_ok        : std_logic:='0';                
signal sf_mx        : std_logic:='0';
signal sf_dt        : std_logic_vector(63 downto 0):=(others=>'0'); 
signal sf_en        : std_logic:='0';

begin

clk_dsp <= not clk_dsp after 5 ns;
clk_trd <= not clk_trd after 10 ns;

reset <= '1', '0' after 30 ns;

------------------------------------------------
UUT: entity work.fp23_fconv_core  
    generic map (
        NFFT                => NFFT,
        DATA                => 64,
        XSERIES             => XSERIES,
        USE_SCALE           => FALSE,
        USE_MLT_FOR_ADDSUB  => FALSE,
        USE_MLT_FOR_CMULT   => FALSE,
        USE_MLT_FOR_TWDLS   => FALSE
    )
    port map (
        ---- Clocks ----
        clk_trd         => clk_trd,
        clk_dsp         => clk_dsp,
        ---- Resets ----
        reset           => reset,
        ---- Data in / out ----
        di_dt           => di_dt,
        di_en           => di_en,

        do_dt           => do_dt,
        do_en           => do_en,

        sf_dt           => sf_dt,
        sf_en           => sf_en,
        sf_ld           => sf_ld,
        sf_ok           => sf_ok,
        sf_mx           => sf_mx,

        scale           => SCALE

    );


------------------------------------------------ 
read_signal: process is
    file fl_data      : text;
    constant fl_path  : string:="../../../../../math/test_signal.dat";

    variable l        : line;    
    variable lt1      : integer:=0; 
    variable lt2      : integer:=0; 
    variable lt3      : integer:=0; 
    variable lt4      : integer:=0; 
begin
    wait until (sf_ok = '1');
    lp_inf: for jj in 0 to 15 loop
        file_open( fl_data, fl_path, read_mode );

        while not endfile(fl_data) loop
            wait until rising_edge(clk_dsp);

            readline( fl_data, l ); 
            read( l, lt1 ); read( l, lt2 );
            read( l, lt3 ); read( l, lt4 );

            di_dt(15+16*3 downto 00+16*3) <= conv_std_logic_vector( lt4, 16 );
            di_dt(15+16*2 downto 00+16*2) <= conv_std_logic_vector( lt2, 16 );
            di_dt(15+16*1 downto 00+16*1) <= conv_std_logic_vector( lt3, 16 );
            di_dt(15+16*0 downto 00+16*0) <= conv_std_logic_vector( lt1, 16 );
            di_en <= '1';
        end loop;

        wait until rising_edge(clk_dsp);
        di_en <= '0';

        lp_Nk1: for ii in 0 to 7 loop
            wait until rising_edge(clk_dsp);
        end loop;

        file_close(fl_data);
    end loop;
    
    di_en <= '-';
    di_dt <= (others => '-');
    wait;
end process;

------------------------------------------------
read_sf: process is
    file file_st            : text;        
    constant file_sf0       : string:="../../../../../math/sf0_x64.dat";
    constant file_sf1       : string:="../../../../../math/sf1_x64.dat";

    variable l              : line; 
    variable lt1            : integer:=0;   
    variable lt2            : integer:=0;   
    variable lt3            : integer:=0;   
    variable lt4            : integer:=0; 
begin
    wait for 100 ns;
    file_open(file_st, file_sf0, read_mode);

    while not endfile(file_st) loop
        wait until rising_edge(clk_trd);

        readline( file_st, l ); 
        read( l, lt1 ); read( l, lt2 );
        read( l, lt3 ); read( l, lt4 );
        
        sf_dt(15+16*3 downto 00+16*3) <= conv_std_logic_vector( lt1, 16 );
        sf_dt(15+16*2 downto 00+16*2) <= conv_std_logic_vector( lt2, 16 );
        sf_dt(15+16*1 downto 00+16*1) <= conv_std_logic_vector( lt3, 16 );
        sf_dt(15+16*0 downto 00+16*0) <= conv_std_logic_vector( lt4, 16 );

        sf_en <= '1';
        sf_ld <= "01";
    end loop;
    
    wait until rising_edge(clk_trd);
    sf_en <= '0';
    sf_ld <= "00";
    sf_dt <= (others => '0');
    file_close(file_st);

    wait for 100 ns;
    file_open(file_st, file_sf1, read_mode);

    while not endfile(file_st) loop
        wait until rising_edge(clk_trd);

        readline( file_st, l ); 
        read( l, lt1 ); read( l, lt2 );
        read( l, lt3 ); read( l, lt4 );

        sf_dt(15+16*3 downto 00+16*3) <= conv_std_logic_vector( lt1, 16 );
        sf_dt(15+16*2 downto 00+16*2) <= conv_std_logic_vector( lt2, 16 );
        sf_dt(15+16*1 downto 00+16*1) <= conv_std_logic_vector( lt3, 16 );
        sf_dt(15+16*0 downto 00+16*0) <= conv_std_logic_vector( lt4, 16 );

        sf_en <= '1';
        sf_ld <= "10";
    end loop;

    wait until rising_edge(clk_trd);
    sf_en <= '0';
    sf_ld <= "00";
    sf_dt <= (others => '0');
    file_close(file_st);
    wait;
end process;

------------------------------------------------
write_out: process(clk_dsp) is
    constant file_name          : string:="../../../../../math/test_result.dat";
    file log                    : TEXT open WRITE_MODE is file_name;
    variable str                : LINE;
    variable spc                : string(1 to 4) := (others => ' ');
begin
    if rising_edge(clk_dsp) then    
        if (do_en = '1') then
            --------------------------------
            write(str, CONV_INTEGER(do_dt(15 downto 00)), LEFT);
            write(str, spc);            
            write(str, CONV_INTEGER(do_dt(31 downto 16)), LEFT);
            write(str, spc);            
            write(str, CONV_INTEGER(do_dt(47 downto 32)), LEFT);
            write(str, spc);            
            write(str, CONV_INTEGER(do_dt(63 downto 48)), LEFT);
            writeline(log, str);
        end if;
    end if;
end process; 

end fp_fastconv_tb;