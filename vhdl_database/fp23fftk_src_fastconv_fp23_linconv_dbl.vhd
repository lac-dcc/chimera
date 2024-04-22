-------------------------------------------------------------------------------
--
-- Title       : fp23_linconv_dbl
-- Design      : Fast Convolution
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : Double linear fast convolutions (FFT + Compl. Mult + IFFT)
--
-- Use Matlab function: y = fir1(x, N) and add N/2 zeros for Support Func.
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
use ieee.std_logic_unsigned.all;

library work;
use work.fp_m1_pkg.fp23_complex;
use work.fp_m1_pkg.int16_complex;

entity fp23_linconv_dbl is    
    generic (
        DATA                : integer := 64;        --! Data width: double of [I/Q]
        NFFT                : integer := 13;        --! Number of FFT stages
        XSERIES             : string:="7SERIES";    --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
        USE_SCALE           : boolean:=FALSE;       --! Use full scale rambs for twiddle factor
        USE_MLT_FOR_ADDSUB  : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Add/Sub
        USE_MLT_FOR_CMULT   : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Complex Mult
        USE_MLT_FOR_TWDLS   : boolean:=FALSE        --! Use DSP48E1/2 blocks or not for Twiddles
    );  
    port (
        ---- Common ----
        clk                 : in  std_logic; --! DSP core clock 
        reset               : in  std_logic; --! Global reset 

        ---- Input data for two linear conv. ----
        fix0_di             : in  int16_complex; --! Fc0 data (Real / Imag)
        fix1_di             : in  int16_complex; --! Fc1 data (Real / Imag)
        fix2_di             : in  int16_complex; --! Fc2 data (Real / Imag)
        fix_ena             : in  std_logic; --! Input valid

        ---- Output data: Two linear conv. ----
        flt0_do             : out int16_complex; --! Fc0 data (Real / Imag)
        --flt1_do             : out int16_complex; --! Fc1 data (Real / Imag)
        flt2_do             : out int16_complex; --! Fc2 data (Real / Imag)
        --flt3_do             : out int16_complex; --! Fc3 data (Real / Imag)
        fltn_vl             : out std_logic; --! Output valid

        ---- Output data: Two linear conv. ----
        sf0_dat             : in  fp23_complex; --! Sup. Function 0
        sf1_dat             : in  fp23_complex; --! Sup. Function 1
        s01_ena             : in  std_logic;    --! Enable for Compl. Mult
        s01_rdy             : out std_logic;    --! Ready to read from SF RAM

        flt_scl             : in  std_logic_vector(5 downto 0)  --! Scale for Floating-point
    );
end entity;

architecture fp23_linconv_dbl of fp23_linconv_dbl is

signal fft0_fc              : fp23_complex;
signal fft1_fc              : fp23_complex;
signal fft2_fc              : fp23_complex;
signal ffts_vl              : std_logic;

signal fft0_fc0             : fp23_complex;
signal fft0_fc1             : fp23_complex;
signal fft1_fc0             : fp23_complex;
signal fft1_fc1             : fp23_complex;
signal ffts_val             : std_logic;

signal ifft0_fc0            : fp23_complex;
signal ifft0_fc1            : fp23_complex;
signal ifft1_fc0            : fp23_complex;
signal ifft1_fc1            : fp23_complex;
signal iffts_val            : std_logic;

TYPE fft_delay is ARRAY (9 downto 0) of fp23_complex;
signal fft0_zz0             : fft_delay;
signal fft0_zz1             : fft_delay;
signal fft1_zz0             : fft_delay;
signal fft1_zz1             : fft_delay;

signal fc0_cm0              : fp23_complex;
signal fc0_cm1              : fp23_complex;
signal fc1_cm0              : fp23_complex;
signal fc1_cm1              : fp23_complex;

signal fc0_ml0              : fp23_complex;
signal fc0_ml1              : fp23_complex;
signal fc1_ml0              : fp23_complex;
signal fc1_ml1              : fp23_complex;
signal mlt_val              : std_logic;


begin 

-- NB! FC0_DT1 = FC1_DT0 ...

-------------------- FIX to FLOAT --------------------  
xFIX0_RE: entity work.fp23_fix2float
    port map (
        din         => fix0_di.re,
        ena         => fix_ena,
        dout        => fft0_fc.re,
        vld         => ffts_vl,
        clk         => clk,
        reset       => reset
    );

xFIX0_IM: entity work.fp23_fix2float
    port map (
        din         => fix0_di.im,
        ena         => fix_ena,
        dout        => fft0_fc.im,
        vld         => open,
        clk         => clk,
        reset       => reset
    );

xFIX1_RE: entity work.fp23_fix2float
    port map (
        din         => fix1_di.re,
        ena         => fix_ena,
        dout        => fft1_fc.re,
        vld         => open,
        clk         => clk,
        reset       => reset
    );

xFIX1_IM: entity work.fp23_fix2float
    port map (
        din         => fix1_di.im,
        ena         => fix_ena,
        dout        => fft1_fc.im,
        vld         => open,
        clk         => clk,
        reset       => reset
    );

xFIX2_RE: entity work.fp23_fix2float
    port map (
        din         => fix2_di.re,
        ena         => fix_ena,
        dout        => fft2_fc.re,
        vld         => open,
        clk         => clk,
        reset       => reset
    );

xFIX2_IM: entity work.fp23_fix2float
    port map (
        din         => fix2_di.im,
        ena         => fix_ena,
        dout        => fft2_fc.im,
        vld         => open,
        clk         => clk,
        reset       => reset
    );

------------------ FC-0/1 FFT --------------------
xFFT01: entity work.fp23_fftNk2_core
    generic map (
        NFFT                => NFFT,
        INVERSE             => FALSE,
        USE_CONJ            => FALSE,
        XSERIES             => XSERIES,
        USE_SCALE           => USE_SCALE,
        USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
        USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
        USE_MLT_FOR_TWDLS   => USE_MLT_FOR_TWDLS
    )
    port map (
        ---- Common signals ----
        CLK                 => clk,
        RESET               => reset,
        ---- Input data ----
        FC0_IN0             => fft0_fc,
        FC0_IN1             => fft1_fc,
        FC1_IN0             => fft1_fc,
        FC1_IN1             => fft2_fc,
        F01_ENA             => ffts_vl,
        ---- Output data ----
        FC0_DO0             => fft0_fc0,
        FC0_DO1             => fft0_fc1,
        FC1_DO0             => fft1_fc0,
        FC1_DO1             => fft1_fc1,
        F01_VAL             => ffts_val
    );

s01_rdy <= ffts_val;

------------------ COMPLEX MULTs --------------------
fft0_zz0 <= fft0_zz0(fft0_zz0'left-1 downto 0) & fft0_fc0 when rising_edge(clk);
fft0_zz1 <= fft0_zz1(fft0_zz1'left-1 downto 0) & fft0_fc1 when rising_edge(clk);  
fft1_zz0 <= fft1_zz0(fft1_zz0'left-1 downto 0) & fft1_fc0 when rising_edge(clk);  
fft1_zz1 <= fft1_zz1(fft1_zz1'left-1 downto 0) & fft1_fc1 when rising_edge(clk);  

fc0_cm0  <= fft0_zz0(fft0_zz0'left);
fc0_cm1  <= fft0_zz1(fft0_zz1'left);
fc1_cm0  <= fft1_zz0(fft1_zz0'left);
fc1_cm1  <= fft1_zz1(fft1_zz1'left);

xFC0_CM0: entity work.fp23_cmult
    generic map (XSERIES => XSERIES)
    port map (
        DA      => fc0_cm0,
        DB      => sf0_dat,
        ENA     => s01_ena,
        
        DC      => fc0_ml0,
        VAL     => mlt_val,

        RESET   => reset,       
        CLK     => clk
    );  

xFC0_CM1: entity work.fp23_cmult 
    generic map (XSERIES => XSERIES)
    port map (
        DA      => fc0_cm1,
        DB      => sf1_dat,
        ENA     => s01_ena,
        
        DC      => fc0_ml1,
        VAL     => open,
        RESET   => reset,
        CLK     => clk
    );

xFC1_CM0: entity work.fp23_cmult
    generic map (XSERIES => XSERIES)
    port map (
        DA      => fc1_cm0,
        DB      => sf0_dat,
        ENA     => s01_ena,
        
        DC      => fc1_ml0,
        VAL     => open,

        RESET   => reset,       
        CLK     => clk
    );  

xFC1_CM1: entity work.fp23_cmult 
    generic map (XSERIES => XSERIES)
    port map (
        DA      => fc1_cm1,
        DB      => sf1_dat,
        ENA     => s01_ena,
        
        DC      => fc1_ml1,
        VAL     => open,
        RESET   => reset,
        CLK     => clk
    );

------------------ FC-0/1 IFFT --------------------
xIFFT01: entity work.fp23_fftNk2_core
    generic map (
        NFFT                => NFFT,
        INVERSE             => TRUE,
        USE_CONJ            => FALSE,
        XSERIES             => XSERIES,
        USE_SCALE           => USE_SCALE,
        USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
        USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
        USE_MLT_FOR_TWDLS   => USE_MLT_FOR_TWDLS
    )
    port map (
        ---- Common signals ----
        CLK                 => clk,
        RESET               => reset,
        ---- Input data ----
        FC0_IN0             => fc0_ml0,
        FC0_IN1             => fc0_ml1,
        FC1_IN0             => fc1_ml0,
        FC1_IN1             => fc1_ml1,
        F01_ENA             => mlt_val,
        ---- Output data ----
        FC0_DO0             => ifft0_fc0,
        --FC0_DO1             => ifft0_fc1,
        FC1_DO0             => ifft1_fc0,
        --FC1_DO1             => ifft1_fc1,
        F01_VAL             => iffts_val 
    );

------------------ FLOAT-2-FIX --------------------
xFIX0RE: entity work.fp23_float2fix
    port map (
        din         => ifft0_fc0.re,
        dout        => flt0_do.re,
        clk         => clk,
        reset       => reset,
        ena         => iffts_val,
        scale       => flt_scl,
        vld         => fltn_vl,
        overflow    => open
    );

xFIX0IM: entity work.fp23_float2fix
    port map (
        din         => ifft0_fc0.im,
        dout        => flt0_do.im,
        clk         => clk,
        reset       => reset,
        ena         => iffts_val,
        scale       => flt_scl,
        vld         => open,
        overflow    => open
    );

xFIX2RE: entity work.fp23_float2fix
    port map (
        din         => ifft1_fc0.re,
        dout        => flt2_do.re,
        clk         => clk,
        reset       => reset,
        ena         => iffts_val,
        scale       => flt_scl,
        vld         => open,
        overflow    => open
    );

xFIX2IM: entity work.fp23_float2fix
    port map (
        din         => ifft1_fc0.im,
        dout        => flt2_do.im,
        clk         => clk,
        reset       => reset,
        ena         => iffts_val,
        scale       => flt_scl,
        vld         => open,
        overflow    => open
    );

end fp23_linconv_dbl;