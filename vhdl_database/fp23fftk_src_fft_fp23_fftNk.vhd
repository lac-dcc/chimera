-------------------------------------------------------------------------------
--
-- Title       : fp23_fftNk
-- Design      : fp23fftk
-- Author      : Kapitanov
-- Company     :
--
-------------------------------------------------------------------------------
--
-- Description : Floating-point Unscaled Forward Fast Fourier Transform: N = 8 to 512K
--                  (You must use 2D-FFT for N > 512K!)
--
--    Input data: IN0 and IN1 where
--      IN0 - 1st half part of data
--      IN1 - 2nd half part of data flow (length = NFFT)
--    
--    Output data: OUT0 and OUT1 where
--      OUT0 - Even part of data
--      OUT1 - Odd part of data flow
--      
--      Clock enable (Input data valid) must be strobe N = 2^(NFFT) cycles
---     w/o interruption!!!
--
--      Example: 
--        Input data:   ________________________
--        DI_EN     ___/                        \____
--        DI_AA:        /0\/1\/2\/3\/4\/5\/6\/7\
--        DI_BB:        \8/\9/\A/\B/\C/\D/\E/\F/
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
use work.fp_m1_pkg.all;

entity fp23_fftNk is
    generic (
        NFFT                : integer:=16;          --! Number of FFT stages
        XSERIES             : string:="7SERIES";    --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
        USE_SCALE           : boolean:=FALSE;       --! use full scale rambs for twiddle factor
        USE_MLT_FOR_ADDSUB  : boolean:=FALSE; --! Use DSP48E1/2 blocks or not for Add/Sub
        USE_MLT_FOR_CMULT   : boolean:=FALSE; --! Use DSP48E1/2 blocks or not for Complex Mult
        USE_MLT_FOR_TWDLS   : boolean:=FALSE  --! Use DSP48E1/2 blocks or not for Twiddles
    );
    port (
        reset           : in  std_logic;        --! Global reset 
        clk             : in  std_logic;        --! System clock 
    
        data_in0        : in fp23_complex;      --! Input data Even
        data_in1        : in fp23_complex;      --! Input data Odd
        data_en         : in std_logic;         --! Input valid data

        --use_fly         : in std_logic;         --! '1' - use BFLY, '0' -don't use
        
        dout0           : out fp23_complex;     --! Output data Even
        dout1           : out fp23_complex;     --! Output data Odd
        dout_val        : out std_logic         --! Output valid data
    );
end fp23_fftNk;

architecture fp23_fftNk of fp23_fftNk is

constant Nwidth : integer:=(data_in0.re.exp'length+data_in0.re.man'length+1);
constant Nman   : integer:=data_in0.re.man'length;  

type complex_fp23xN     is array (NFFT-1 downto 0) of fp23_complex;

signal ia               : complex_fp23xN;
signal ib               : complex_fp23xN;
signal iax              : complex_fp23xN;
signal ibx              : complex_fp23xN;

signal oa               : complex_fp23xN;
signal ob               : complex_fp23xN;
signal oa1              : complex_fp23xN;
signal ob1              : complex_fp23xN;
--signal oa2              : complex_fp23xN;
--signal ob2              : complex_fp23xN;

signal ww               : complex_fp23xN;

signal bfly_en          : std_logic_vector(NFFT-1 downto 0); 
signal bfly_enx         : std_logic_vector(NFFT-1 downto 0);
signal bfly_vl          : std_logic_vector(NFFT-1 downto 0);
signal bfly_vl1         : std_logic_vector(NFFT-1 downto 0);
--signal bfly_vl2         : std_logic_vector(NFFT-1 downto 0);
signal del_en           : std_logic_vector(NFFT-2 downto 0);
signal del_vl           : std_logic_vector(NFFT-2 downto 0);   

type complex_WxN is array (NFFT-2 downto 0) of std_logic_vector(2*Nwidth-1 downto 0);
signal di_aa            : complex_WxN;
signal di_bb            : complex_WxN;
signal do_aa            : complex_WxN;
signal do_bb            : complex_WxN;

signal coe_en           : std_logic_vector(NFFT-1 downto 0);

begin

bfly_en(0) <= data_en;
ia(0) <= data_in0;
ib(0) <= data_in1;

CALC_STAGE: for ii in 0 to NFFT-1 generate
begin           
    --xFALSE_FLY: if (USE_FLY = false) generate
        --oa2(ii)      <= ia(ii);
        --ob2(ii)      <= ib(ii); 
        --bfly_vl2(ii) <= bfly_en(ii);
    --end generate;
    
    --xTRUE_FLY: if (USE_FLY = true) generate
        BUTTERFLY: entity work.fp23_bfly_fwd
            generic map (
                USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
                USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
                STAGE               => NFFT-1-ii,
                XSERIES             => XSERIES
            )
            port map (
                DT_IA               => iax(ii), 
                DT_IB               => ibx(ii),
                DI_EN               => bfly_enx(ii),
                DT_WW               => ww(ii),
                DT_OA               => oa1(ii), 
                DT_OB               => ob1(ii),
                DO_VL               => bfly_vl1(ii),
                reset               => reset, 
                clk                 => clk   
            ); 
            
        COE_ROM: entity work.rom_twiddle_gen
            generic map (        
                NFFT        => NFFT,
                STAGE       => ii,
                XSERIES     => XSERIES,
                USE_MLT     => USE_MLT_FOR_TWDLS,
                USE_SCALE   => USE_SCALE
            )
            port map (
                ww          => ww(ii),
                clk         => clk,
                ww_ena      => coe_en(ii),
                reset       => reset
            );              
    
        xALIGNE: entity work.fp23fft_align_data 
            generic map (       
                NFFT        => NFFT,
                STAGE       => ii,
                USE_SCALE   => USE_SCALE
            )
            port map (  
                clk         => clk,
                dt_ia       => ia(ii),
                dt_ib       => ib(ii),
                dt_xa       => iax(ii),
                dt_xb       => ibx(ii),
                fl_en       => bfly_en(ii),
                fl_vl       => bfly_enx(ii),
                tw_vl       => coe_en(ii)
            );

    bfly_vl(ii) <= bfly_vl1(ii);
    oa(ii) <= oa1(ii);
    ob(ii) <= ob1(ii);
end generate;

DELAY_STAGE: for ii in 0 to NFFT-2 generate
begin   
    di_aa(ii) <= (oa(ii).im.exp & oa(ii).im.sig & oa(ii).im.man & oa(ii).re.exp & oa(ii).re.sig & oa(ii).re.man);
    di_bb(ii) <= (ob(ii).im.exp & ob(ii).im.sig & ob(ii).im.man & ob(ii).re.exp & ob(ii).re.sig & ob(ii).re.man);
    del_en(ii) <= bfly_vl(ii);
    
    DELAY_LINE : entity work.fp_delay_line
        generic map (
            Nwidth      => 2*Nwidth,
            NFFT        => NFFT,
            stage       => ii
        )
        port map (
            ia          => di_aa(ii),
            ib          => di_bb(ii),
            din_en      => del_en(ii),
            oa          => do_aa(ii),
            ob          => do_bb(ii),
            dout_val    => del_vl(ii),
            reset       => reset,
            clk         => clk
        );

    ia(ii+1).re <= (do_aa(ii)(1*Nwidth-1 downto 0*Nwidth+Nman+1), do_aa(ii)(0*Nwidth+Nman), do_aa(ii)(0*Nwidth+Nman-1 downto 000000));
    ia(ii+1).im <= (do_aa(ii)(2*Nwidth-1 downto 1*Nwidth+Nman+1), do_aa(ii)(1*Nwidth+Nman), do_aa(ii)(1*Nwidth+Nman-1 downto Nwidth));
    ib(ii+1).re <= (do_bb(ii)(1*Nwidth-1 downto 0*Nwidth+Nman+1), do_bb(ii)(0*Nwidth+Nman), do_bb(ii)(0*Nwidth+Nman-1 downto 000000));
    ib(ii+1).im <= (do_bb(ii)(2*Nwidth-1 downto 1*Nwidth+Nman+1), do_bb(ii)(1*Nwidth+Nman), do_bb(ii)(1*Nwidth+Nman-1 downto Nwidth));
    bfly_en(ii+1) <= del_vl(ii);
end generate;     

pr_out: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            dout_val <= '0';
            dout0 <= (others => ("000000", '0', x"0000")); 
            dout1 <= (others => ("000000", '0', x"0000")); 
        else
            dout_val <= bfly_vl(NFFT-1);
            dout0 <= oa(NFFT-1);
            dout1 <= ob(NFFT-1);
        end if;
    end if;
end process;

end fp23_fftNk;