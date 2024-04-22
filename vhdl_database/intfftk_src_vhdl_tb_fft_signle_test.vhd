-------------------------------------------------------------------------------
--
-- Title       : fft_signle_test
-- Design      : fpfftk
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-- Description : Testbench file for complex testing FFT / IFFT
--
-- Has several important constants:
--
--   NFFT          - (p) - Number of stages = log2(FFT LENGTH)
--   SCALE         - (s) - Scale factor for float-to-fix transform
--   DATA_WIDTH    - (p) - Data width for signal imitator: 8-32 bits.
--   TWDL_WIDTH    - (p) - Data width for twiddle factor : 16-24 bits.
--
--   RAMB_TYPE     - (p) - Cross-commutation type: "WRAP" / "CONT"
--       "WRAP" - data valid strobe can be bursting (no need continuous valid),
--       "CONT" - data valid must be continuous (strobe length = N/2 points);
--
--   OWIDTH        - (p) - Data width for signal output: 16, 24, 32 bits.
--   FLY_FWD       - (s) - Use butterflies into Forward FFT: 1 - TRUE, 0 - FALSE
--   DBG_FWD       - (p) - 1 - Debug in FFT (save file in FP32 on selected stage)    
--   DT_RND        - (s) - Data output multiplexer for rounding            
--   XSERIES       - (p) - FPGA Series: ULTRASCALE / 7SERIES
--   USE_MLT       - (p) - Use Multiplier for calculation M_PI in Twiddle factor
--   MODE          - (p) - Select output data format and roun mode
--
--           - "UNSCALED" - Output width = Input width + log(N)
--           - "ROUNDING" - Output width = Input width, use round()
--           - "TRUNCATE" - Output width = Input width, use floor()
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

entity fft_signle_test is 
end fft_signle_test;

architecture fft_signle_test of fft_signle_test is           
  
function set_mode(inmod: string) return integer is
begin
    if    (inmod = "UNSCALED") then return  2;
    elsif (inmod = "ROUNDING") then return  1;
    elsif (inmod = "TRUNCATE") then return  0;
    else                            return -1;
    end if;
end function;

-- **************************************************************** --
-- **** Constant declaration: change any parameter for testing **** --
-- **************************************************************** --
constant NFFT            : integer:=7; -- Number of stages = log2(FFT LENGTH)

constant DATA_WIDTH      : integer:=16; -- Data width for signal imitator    : 8-32.
constant TWDL_WIDTH      : integer:=16; -- Data width for twiddle factor     : 16-24.

constant FLY_FWD         : std_logic:='1'; -- 1 - Use butterflies for Forward FFT    

constant XSERIES         : string:="NEW"; -- FPGA Series: ULTRA / 7SERIES
constant USE_MLT         : boolean:=FALSE; -- 1 - Use Multiplier for calculation M_PI

constant RAMB_TYPE       : string:="WRAP"; -- Cross-commutation type: WRAP / CONT
----------------------------------------------------------------
constant MODE1           : string:="UNSCALED";
constant MODE2           : string:="TRUNCATE";
constant MODE3           : string:="ROUNDING";

constant FORMAT1         : integer:=set_mode(MODE1)/2;
constant FORMAT2         : integer:=set_mode(MODE2)/2;
constant FORMAT3         : integer:=set_mode(MODE3)/2;

constant RNDMOD1         : integer:=(set_mode(MODE1) mod 2);
constant RNDMOD2         : integer:=(set_mode(MODE2) mod 2);
constant RNDMOD3         : integer:=(set_mode(MODE3) mod 2);

-- **************************************************************** --
-- ********* Signal declaration: clocks, reset, data etc. ********* --
-- **************************************************************** --
signal clk               : std_logic:='0';
signal rstn              : std_logic:='0';
signal rstp              : std_logic:='1';
signal start             : std_logic:='0';
---------------- In / Out data ----------------    
signal di_re             : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0'); 
signal di_im             : std_logic_vector(DATA_WIDTH-1 downto 0):=(others=>'0'); 
signal di_en             : std_logic:='0';

begin

clk <= not clk after 5 ns;
rstn <= '0', '1' after 30 ns;
rstp <= not rstn;
start <= '0', '1' after 100 ns;

---------------------------------------------------------------- 
read_signal: process is
    file fl_data      : text;
    constant fl_path  : string:="../../../../../math/di_single.dat";

    variable l        : line;    
    variable lt1      : integer:=0; 
    variable lt2      : integer:=0; 
begin            
    wait for 5 ns;
    if (rstp = '1') then    
        di_en <= '0';
        di_re <= (others => '0');
        di_im <= (others => '0');
    else    
        -- wait for 100 ns;
        wait until (start = '1');
        
        lp_inf: for jj in 0 to 63 loop

            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;
        
            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');

            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;

            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');

            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;
        
            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');


            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;

            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');

            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;

            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');

            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;

            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');
            wait until rising_edge(clk);
            wait until rising_edge(clk);

            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l ); 
                    read( l, lt1 ); read( l, lt2 );     
                    
                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
                    
                    wait until rising_edge(clk);
                    di_en <= '0';
                    di_re <= (others => '0');
                    di_im <= (others => '0');
                    wait until rising_edge(clk);
                    wait until rising_edge(clk);
            end loop;
            
            file_close( fl_data);
            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l ); 
                    read( l, lt1 ); read( l, lt2 );     
                    
                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
                    
                    wait until rising_edge(clk);
                    di_en <= '0';
                    di_re <= (others => '0');
                    di_im <= (others => '0');
                    wait until rising_edge(clk);
                    wait until rising_edge(clk);
            end loop;
            
            file_close( fl_data);



            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');
            
            lp1_Nk: for ii in 0 to 7 loop
                wait until rising_edge(clk);
            end loop;



            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;

            file_close( fl_data);

            file_open( fl_data, fl_path, read_mode );

            while not endfile(fl_data) loop
                wait until rising_edge(clk);
                    readline( fl_data, l );
                    read( l, lt1 ); read( l, lt2 );

                    di_re <= conv_std_logic_vector( lt1, DATA_WIDTH );
                    di_im <= conv_std_logic_vector( lt2, DATA_WIDTH );
                    di_en <= '1'; 
            end loop;
        
            file_close( fl_data);           

            wait until rising_edge(clk);
            di_en <= '0';
            di_re <= (others => '0');
            di_im <= (others => '0');
            
            lp2_Nk: for ii in 0 to 15 loop
                wait until rising_edge(clk);
            end loop;

        end loop;
        
        di_en <= 'X';
        di_re <= (others => 'X');
        di_im <= (others => 'X');
        wait;
        
    end if;
end process; 


xUUT: if (NFFT > 0) generate

    signal sc_re    : std_logic_vector(0*NFFT+DATA_WIDTH-1 downto 0);
    signal sc_im    : std_logic_vector(0*NFFT+DATA_WIDTH-1 downto 0);
    signal sc_vl    : std_logic;

    signal un_re    : std_logic_vector(1*NFFT+DATA_WIDTH-1 downto 0);
    signal un_im    : std_logic_vector(1*NFFT+DATA_WIDTH-1 downto 0);
    signal un_vl    : std_logic;
    
    signal rn_re    : std_logic_vector(0*NFFT+DATA_WIDTH-1 downto 0);
    signal rn_im    : std_logic_vector(0*NFFT+DATA_WIDTH-1 downto 0);
    signal rn_vl    : std_logic;    

begin
    
UUT_UNSCALED: entity work.int_fft_single_path
    generic map (
        DATA_WIDTH  => DATA_WIDTH,
        TWDL_WIDTH  => TWDL_WIDTH,
        -- MODE        => "UNSCALED",
        FORMAT      => FORMAT1,
        RNDMODE     => RNDMOD1,
        XSERIES     => XSERIES,
        NFFT        => NFFT,
        USE_MLT     => USE_MLT
    )
    port map ( 
        ---- Common signals ----
        RESET       => rstp,
        CLK         => clk,    
        ---- Input data ----
        DI_RE       => di_re,
        DI_IM       => di_im,
        DI_EN       => di_en,
        ---- Output data ----
        DO_RE       => un_re,
        DO_IM       => un_im,
        DO_VL       => un_vl,
        ---- Butterflies ----
        FLY_FWD     => fly_fwd
    );

UUT_SCALED: entity work.int_fft_single_path
    generic map (
        DATA_WIDTH  => DATA_WIDTH,
        TWDL_WIDTH  => TWDL_WIDTH,
        -- MODE        => "TRUNCATE",
        FORMAT      => FORMAT2,
        RNDMODE     => RNDMOD2,
        XSERIES     => XSERIES,
        NFFT        => NFFT,
        USE_MLT     => USE_MLT
    )
    port map (
        ---- Common signals ----
        RESET       => rstp,
        CLK         => clk,    
        ---- Input data ----
        DI_RE       => di_re,
        DI_IM       => di_im,
        DI_EN       => di_en,
        ---- Output data ----
        DO_RE       => sc_re,
        DO_IM       => sc_im,
        DO_VL       => sc_vl,
        ---- Butterflies ----
        FLY_FWD     => fly_fwd
    );

UUT_ROUND: entity work.int_fft_single_path
    generic map (
        DATA_WIDTH  => DATA_WIDTH,
        TWDL_WIDTH  => TWDL_WIDTH,    
        -- MODE        => "ROUNDING",
        FORMAT      => FORMAT3,
        RNDMODE     => RNDMOD3,
        XSERIES     => XSERIES,
        NFFT        => NFFT,
        USE_MLT     => USE_MLT
    )
    port map (
        ---- Common signals ----
        RESET       => rstp,
        CLK         => clk,
        ---- Input data ----
        DI_RE       => di_re,
        DI_IM       => di_im,
        DI_EN       => di_en,
        ---- Output data ----
        DO_RE       => rn_re,
        DO_IM       => rn_im,
        DO_VL       => rn_vl,
        ---- Butterflies ----
        FLY_FWD     => fly_fwd
    );
end generate;

------------------------------------------------
end fft_signle_test; 