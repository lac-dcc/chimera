-------------------------------------------------------------------------------
--
-- Title       : fft_double_test
-- Design      : fpfftk
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-- Description : Testbench file for complex testing FFT / IFFT
--
-- Has several important constants:
--
--  NFFT          - (p) - Number of stages = log2(FFT LENGTH)
--  DATA_WIDTH    - (p) - Data width for signal imitator: 8-32 bits.
--  TWDL_WIDTH    - (p) - Data width for twiddle factor : 16-24 bits.
--  RAMB_TYPE     - (p) -    Cross-commutation type: "WRAP" / "CONT"
--      "WRAP" - data valid strobe can be bursting (no need continuous valid),
--      "CONT" - data valid must be continuous (strobe length = N/2 points);
--
--  FLY_FWD        - (s) - Use butterflies into Forward FFT: 1 - TRUE, 0 - FALSE
--  DBG_FWD        - (p) - 1 - Debug in FFT (save file in FP32 on selected stage)
--  XSERIES        - (p) - FPGA Series: 
--      "NEW" - ULTRASCALE,
--      "OLD" - 6/7-SERIES;
--
--  USE_MLT        - (p) - Use Multiplier for calculation M_PI in Twiddle factor
--  MODE           - (p) - Select output data format and roun mode
--
--       - "UNSCALED" - Output width = Input width + log(N)
--       - "ROUNDING" - Output width = Input width, use round()
--       - "TRUNCATE" - Output width = Input width, use floor()
--
--   Old modes: 
--
--   FORMAT        - (p) - 1 - Use Unscaled mode / 0 - Scaled (truncate) mode
--   RNDMODE       - (p) - 1 - Round, 0 - Floor, while (FORMAT = 0)
--
-- where: (p) - generic parameter, (s) - signal.
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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

use ieee.std_logic_textio.all;
use std.textio.all;

entity fft_double_test is 
end fft_double_test;

architecture fft_double_test of fft_double_test is

-- **************************************************************** --
-- **** Constant declaration: change any parameter for testing **** --
-- **************************************************************** --
constant  NFFT        : integer:=7; -- Number of stages = log2(FFT LENGTH)
constant  FORMAT      : integer:=1;  -- 1 - Use Unscaled mode / 0 - Scaled (truncate) mode
constant  RNDMODE     : integer:=1;  -- 1 - Rounding (round), 0 - Truncate (floor)

constant  DATA_WIDTH  : integer:=16; -- Data width for signal imitator    : 8-32.
constant  TWDL_WIDTH  : integer:=16; -- Data width for twiddle factor     : 16-24.

constant  FLY_FWD     : std_logic:='1'; -- 1 - Use butterflies for Forward FFT
constant  FLY_INV     : std_logic:='1'; -- 1 - Use butterflies for Forward FFT

constant  XSERIES     : string:="NEW"; -- FPGA Series: ULTRA / 7SERIES
constant  USE_MLT     : boolean:=FALSE; -- 1 - Use Multiplier for calculation M_PI

constant  RAMB_TYPE   : string:="WRAP"; -- Cross-commutation type: WRAP / CONT

-- **************************************************************** --
-- ********* Signal declaration: clocks, reset, data etc. ********* --
-- **************************************************************** --
signal clk          : std_logic:='0';
signal reset        : std_logic:='0';
signal start        : std_logic:='0';

------------------------ Input data --------------------    
signal d0_re        : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0'); 
signal d1_re        : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0'); 
signal d0_im        : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0'); 
signal d1_im        : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0'); 
signal di_en        : std_logic:='0';

------------------------ Output data --------------------  
signal q0_re        : std_logic_vector(2*FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal q1_re        : std_logic_vector(2*FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal q0_im        : std_logic_vector(2*FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal q1_im        : std_logic_vector(2*FORMAT*NFFT+DATA_WIDTH-1 downto 0);
signal qo_vl        : std_logic;


begin

clk <= not clk after 5 ns;
reset <= '1', '0' after 30 ns;
start <= '0', '1' after 200 ns;

------------------------------------------------ 
read_signal: process is
    file fl_data      : text;
    constant fl_path  : string:="../../../../../math/di_double.dat";

    variable l        : line;    
    variable lt1      : integer:=0; 
    variable lt2      : integer:=0; 
    variable lt3      : integer:=0; 
    variable lt4      : integer:=0; 
begin            
    wait for 5 ns;
    if (reset = '1') then
        di_en <= '0';
        d0_re <= (others => '0');
        d1_re <= (others => '0');
        d0_re <= (others => '0');
        d1_im <= (others => '0');
    else    
        wait until (start = '1');
        lp_inf: for jj in 0 to 15 loop

            file_open( fl_data, fl_path, read_mode );

            -- lp_32k: for ii in 0 to Nst2x-1 loop
            while not endfile(fl_data) loop
                wait until rising_edge(clk);

                readline( fl_data, l ); 
                read( l, lt1 ); read( l, lt2 );
                read( l, lt3 ); read( l, lt4 );

                d0_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                d1_re <= conv_std_logic_vector( lt2, DATA_WIDTH );
                d0_im <= conv_std_logic_vector( lt3, DATA_WIDTH );
                d1_im <= conv_std_logic_vector( lt4, DATA_WIDTH );
                di_en <= '1';

                if (RAMB_TYPE = "WRAP") then
                    wait until rising_edge(clk);
                    di_en <= '0';
                end if;
            end loop;

            wait until rising_edge(clk);
            di_en <= '0';
            d0_re <= (others => '0');
            d1_re <= (others => '0');
            d0_im <= (others => '0');
            d1_im <= (others => '0');

            lp_Nk: for ii in 0 to 31 loop
                wait until rising_edge(clk);
            end loop;            
            --lp_Nk: for ii in 0 to (2**NFFT-1)-1 loop
            --    wait until rising_edge(clk);
            --end loop;

            file_close(fl_data);

            
        end loop;
        
        di_en <= 'X';
        d0_re <= (others => 'X');
        d1_re <= (others => 'X');
        d0_re <= (others => 'X');
        d1_im <= (others => 'X');
        wait;
        
    end if;
end process;

------------------------------------------------
wr_dout: process(clk) is -- write file_io.out (++ done goes to '1')
    file fin_log    : TEXT open WRITE_MODE is "../../../../../math/dout_pair.dat";
    variable stx    : LINE;
    variable spc    : string(1 to 4) := (others => ' ');    
begin
    if rising_edge(clk) then
        if (qo_vl = '1') then
            write(stx, CONV_INTEGER(q0_re(NFFT+NFFT+DATA_WIDTH-1 downto NFFT+NFFT+DATA_WIDTH-1-16)), LEFT);
            write(stx, spc);
            write(stx, CONV_INTEGER(q1_re(NFFT+NFFT+DATA_WIDTH-1 downto NFFT+NFFT+DATA_WIDTH-1-16)), LEFT);
            write(stx, spc);
            write(stx, CONV_INTEGER(q0_im(NFFT+NFFT+DATA_WIDTH-1 downto NFFT+NFFT+DATA_WIDTH-1-16)), LEFT);
            write(stx, spc);
            write(stx, CONV_INTEGER(q1_im(NFFT+NFFT+DATA_WIDTH-1 downto NFFT+NFFT+DATA_WIDTH-1-16)), LEFT);
            writeline(fin_log, stx);
        end if;
    end if;
end process;

------------------------------------------------
UUT_PAIR: entity work.int_fft_ifft_pair
    generic map ( 
        RAMB_TYPE    => RAMB_TYPE,
        DATA_WIDTH   => DATA_WIDTH,
        TWDL_WIDTH   => TWDL_WIDTH,
        FORMAT       => FORMAT,
        XSERIES      => XSERIES,
        NFFT         => NFFT,
        USE_MLT      => USE_MLT
    )
    port map ( 
        ---- Common signals ----
        RESET        => reset,
        CLK          => clk,
        ---- Input data ----
        D0_RE        => d0_re,
        D1_RE        => d1_re,
        D0_IM        => d0_im,
        D1_IM        => d1_im,
        DI_EN        => di_en,
        ---- Output data ----
        Q0_RE        => q0_re,  
        Q1_RE        => q1_re, 
        Q0_IM        => q0_im, 
        Q1_IM        => q1_im, 
        QO_VL        => qo_vl,
        ---- Butterflies ----
        FLY_FWD      => FLY_FWD,
        FLY_INV      => FLY_INV
    );
------------------------------------------------
end fft_double_test;