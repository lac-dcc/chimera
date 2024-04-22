-------------------------------------------------------------------------------
--
-- Title       : fp23_fconv_core
-- Design      : Fast Convolution
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-- Base core for fast convolution, NFFT - parameter (number of FFT stages)
-- Include: FFT, IFFT, Complex mult, Input and Output buffers.
-- Number of filter taps: N = Nfft/2.
--
-- Note: use Matlab function: y = fir1(x, N) and add N/2 zeros for Support Func.
--
--
-- Input data - two complex (Re, Im) words per one clock (interleave-2 mode),
-- Output data - two complex (Re, Im) words per one clock.
--
-- Total data width - DATA, so one word has DATA/4 data width.
--
--
-- Support Function has 2 blocks: 0/1. It helps you change function without 
-- interruption fast convolution process.
-- 
-- Input parameters:
--
--    --------------------- --------- ----------------------------------------
--   | Parameter           | Type    | Description                            |
--    --------------------- --------- ----------------------------------------
--   | DATA                | integer | Data width: [I/Q] two words per clock  |
--   | NFFT                | integer | Number of FFT stages - log2(N)         |
--   | XSERIES             | string  | FPGA family: "7SERIES" / "ULTRA"       |
--   | USE_SCALE           | boolean | Full scale RAMB for twiddles           |
--   | USE_MLT_FOR_ADDSUB  | boolean | Use or not DSP blocks for Add/Sub Op.  |
--   | USE_MLT_FOR_CMULT   | boolean | Use or not DSP blocks for CMult.       |
--   | USE_MLT_FOR_TWDLS   | boolean | Use or not DSP blocks for Twiddles     |
--    --------------------- --------- ----------------------------------------
--
-- Main scheme for Fast Convolution:
--
--      -------  (1)     -------  (2)  -------  (3) --------  (4) --------  (5)
-- (0) |       |------> |       |     |       |    |        |    |        |
-- --->| INBUF |        | FFTx2 |---->| CMULT |--->| IFFTx2 |--->| OUTBUF |--->
--     |       |------> |       |     |       |    |        |    |        |
--      -------          -------       -------      --------      -------- 
--                                        ^
--                                        | (6)
--                                     .------.
--                                    /  MUX   \
--                                    ----------
--                                     /     \     (7)
--                                   -----   -----  
--                                  |     | |     |
--                                  | SF0 | | SF1 |
--                                  |     | |     |
--                                   -----   ----- 
--
-- List of signals:
--
--  (0) - Input signal, interleave-2 mode: 2 complex word per clock cycle.
--          {Im_Odd, Re_Odd, Im_Even, Re_Odd}, Data Width - DATA
--  (1) - Split input signal for two paths. Original flow and NFFT/2-shifted.
--  (2) - Forward FFT output (2 ind. flows)
--  (3) - Data after complex multiplier: Data[FFT] * Data[SF]
--  (4) - Inverse FFT output (2 ind. flows)
--  (5) - Output data (interleave-2 mode)
--  (6) - SFunction (in freq domain)
--  (7) - Two independent buffers for Sfunction.
--
-- List of nodes: 
--
-- INBUF   - Input Buffer: split input data flow to 2 ind. flows: 
--          original and shifted. See example:
--
-- Example (N = 4)
-- 
-- IN:     ..0..123...456..7..89.......
-- 
-- OUT_0:  .............0123....4567...
-- OUT 1:  .............2345....6789...
--
-- FFTx2/IFFTx2 - two Forward/Inverse  FFT cores for original and shifted data.
-- CMULT   - Complex multiplier.
-- OUTBUF  - Output buffer (convert to interleave-2 mode).
-- SF0/1   - Support function in freq domain.
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

library work;
use work.fp_m1_pkg.fp23_complex;
use work.fp_m1_pkg.int16_complex;

entity fp23_fconv_core is    
    generic (
        DATA                : integer := 64;        --! Data width: double of [I/Q]
        NFFT                : integer := 13;        --! Number of FFT stages
        XSERIES             : string  :="ULTRA";    --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
        USE_SCALE           : boolean :=FALSE;      --! Use full scale rambs for twiddle factor
        USE_MLT_FOR_ADDSUB  : boolean :=FALSE;      --! Use DSP for Add/Sub
        USE_MLT_FOR_CMULT   : boolean :=FALSE;      --! Use DSP for Complex Mult
        USE_MLT_FOR_TWDLS   : boolean :=FALSE       --! Use DSP for Twiddles
    );
    port (
        ---- Clocks ----
        clk_trd             : in std_logic; --! System clock
        clk_dsp             : in std_logic; --! DSP core clock

        ---- Resets ----
        reset               : in std_logic; --! Global reset
        ---- Input data (two complex words in one clock) ----
        di_dt              : in std_logic_vector(DATA-1 downto 0); --! Chan0 Input data
        di_en              : in std_logic; --! Chan0 input valid

        ---- Result (Fast convolution) ----
        do_dt               : out std_logic_vector(DATA-1 downto 0); --! Data Out (64)
        do_en               : out std_logic; --! Data Out enable

        ---- SF control ----
        sf_dt               : in std_logic_vector(63 downto 0); --! Support Function
        sf_en               : in std_logic; --! SupFunc enable (on clk_trd)
        sf_ld               : in std_logic_vector(1 downto 0); --! Load SF to RAM 0/1
        sf_ok               : out std_logic; --! SF RAM is ready to load
        sf_mx               : in std_logic;  --! Select SF RAM 0/1
        ---- Scale Floating-point vectors ----
        scale               : in std_logic_vector(5 downto 0) --! Scale Fp2Fix data
    );
end entity;

architecture fp23_fconv_core of fp23_fconv_core is

signal rst_clk_dsp          : std_logic;

------------------ Input multiplexer and input buffers --------------------
signal buf_dat0             : std_logic_vector(DATA/2-1 downto 0);
signal buf_dat1             : std_logic_vector(DATA/2-1 downto 0);
signal buf_dat2             : std_logic_vector(DATA/2-1 downto 0);
signal buf_ena              : std_logic;

signal fix0_di              : int16_complex;
signal fix1_di              : int16_complex;
signal fix2_di              : int16_complex;
signal fix_ena              : std_logic;

signal flt0_do              : int16_complex;
--signal flt1_do              : int16_complex;
signal flt2_do              : int16_complex;
--signal flt3_do              : int16_complex;
signal fltn_vl              : std_logic;

signal sf0_dat              : fp23_complex;
signal sf1_dat              : fp23_complex;
signal s01_ena              : std_logic;
signal s01_rdy              : std_logic;

signal shf0_di              : std_logic_vector(DATA/2-1 downto 0);
signal shf1_di              : std_logic_vector(DATA/2-1 downto 0);
signal sh01_en              : std_logic;

signal dt0_out              : std_logic_vector(DATA/2-1 downto 0);
signal dt1_out              : std_logic_vector(DATA/2-1 downto 0);
signal d01_val              : std_logic;

begin 

rst_clk_dsp <= reset when rising_edge(clk_dsp);

------------------ Input buffer (Flow-0/1) --------------------
xINBUF: entity work.inbuf_fastconv_int2
    generic map (
        NFFT        => NFFT,
        DATA        => DATA/2
    )
    port map (
        ---- Common signals ----
        CLK         => clk_dsp,
        RST         => rst_clk_dsp,
        ---- Input data ----
        DI_IN0      => di_dt(1*DATA/2-1 downto 0*DATA/2),
        DI_IN1      => di_dt(2*DATA/2-1 downto 1*DATA/2),
        DI_ENA      => di_en,
        ---- Output data ----
        F0_DT0      => buf_dat0,
        F0_DT1      => buf_dat1,
        F1_DT0      => open,     -- NB! FC0_DT1 = FC1_DT0 ...
        F1_DT1      => buf_dat2,
        FC_VAL      => buf_ena
    );

fix0_di <= (buf_dat0(15 downto 00), buf_dat0(31 downto 16));
fix1_di <= (buf_dat1(15 downto 00), buf_dat1(31 downto 16));
fix2_di <= (buf_dat2(15 downto 00), buf_dat2(31 downto 16));
fix_ena <= buf_ena;

------------------ Fast Convolution: Double lin conv. --------------------
xFC01: entity work.fp23_linconv_dbl
    generic map (
        DATA                => DATA,
        NFFT                => NFFT,
        XSERIES             => XSERIES,
        USE_SCALE           => USE_SCALE,
        USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
        USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
        USE_MLT_FOR_TWDLS   => USE_MLT_FOR_TWDLS
    ) 
    port map (
        clk                 => clk_dsp,
        reset               => rst_clk_dsp,

        ---- Input data: Two linear conv. ----
        fix0_di             => fix0_di,
        fix1_di             => fix1_di,
        fix2_di             => fix2_di,
        fix_ena             => fix_ena,

        ---- Output data: Two linear conv. ----
        flt0_do             => flt0_do,
        --flt1_do             => flt1_do,
        flt2_do             => flt2_do,
        --flt3_do             => flt3_do,
        fltn_vl             => fltn_vl,

        ---- Output data: Two linear conv. ----
        sf0_dat             => sf0_dat,
        sf1_dat             => sf1_dat,
        s01_ena             => s01_ena,
        s01_rdy             => s01_rdy,

        flt_scl             => scale
    );

shf0_di <= flt0_do.im & flt0_do.re;
shf1_di <= flt2_do.im & flt2_do.re;
sh01_en <= fltn_vl;

------------------ Reverse (Flow-0/1) Output Buffer --------------------
xOUTBUF: entity work.iobuf_fft_int2
    generic map (
        BITREV      => TRUE,
        DATA        => DATA/2,
        ADDR        => NFFT
    )
    port map (
        ---- Common signals ----
        CLK         => clk_dsp,
        RST         => rst_clk_dsp,
        ---- Input data ----
        DT_INT0     => shf0_di,
        DT_INT1     => shf1_di,
        DT_EN01     => sh01_en,
        ---- Output data ----
        DT_REV0     => dt0_out,
        DT_REV1     => dt1_out,
        DT_VL01     => d01_val
    );

do_dt <= dt1_out & dt0_out;
do_en <= d01_val;

------------------ Support function --------------------
xSF: entity work.fp23_sfunc_dbl
        generic map (
            SFMODE      => "INV", -- "FWD" / "INV"   
            NFFT        => NFFT
        )
        port map (
            clk_dsp     => clk_dsp,
            clk_trd     => clk_trd,
            reset       => rst_clk_dsp,

            fx_sf_re0   => sf_dt(15 downto 00),
            fx_sf_im0   => sf_dt(31 downto 16),
            fx_sf_reN   => sf_dt(47 downto 32),
            fx_sf_imN   => sf_dt(63 downto 48),
            
            fx_sf_en    => sf_en,
            
            sf_rd       => s01_rdy,
            sf_ld       => sf_ld,
            sf_ok       => sf_ok,
            sf_mx       => sf_mx,

            fp_sf_dt0   => sf0_dat, 
            fp_sf_dt1   => sf1_dat,
            fp_sf_en    => s01_ena
        );  

end fp23_fconv_core;