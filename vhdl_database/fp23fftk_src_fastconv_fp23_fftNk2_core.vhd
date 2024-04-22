-------------------------------------------------------------------------------
--
-- Title       : fp23_fftNk2_core
-- Design      : Fast Convolution
-- Author      : Kapitanov
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- Description : Floating-point Forward / Inverse Fast Fourier Transform
--                  N = 8 to 128K. (you must use 2D-FFT for N > 128K!)
--
--    Input data: IN0 and IN1 where
--      IN0 - 1st half part of data
--      IN1 - 2nd half part of data flow (length = NFFT)
--    
--    Output data: OUT0 and OUT1 where
--      OUT0 - Even part of data
--      OUT1 - Odd part of data flow
--      
--    RAMB_TYPE:
--        > CONT MODE: Clock enable (Input data valid) must be cont. strdt_obe 
--        N = 2^(NFFT) cycles w/o interruption!!!
--        > WRAP MODE: Clock enable (Input data valid) can be bursting
--
--    RAMB_TYPE - Cross-commutation type: "WRAP" / "CONT"
--       "WRAP" - data valid strdt_obe can be bursting (no need continuous valid),
--       "CONT" - data valid must be continuous (strdt_obe length = N/2 points);
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
use work.fp_m1_pkg.fp23_complex;

entity fp23_fftNk2_core is
    generic (
        INVERSE             : boolean:=FALSE;       --! Forward / Inverse FFT
        NFFT                : integer:=16;          --! Number of FFT stages
        XSERIES             : string:="7SERIES";    --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
        USE_CONJ            : boolean:=FALSE;       --! Use conjugation for the butterfly           
        USE_SCALE           : boolean:=FALSE;       --! Use full scale rambs for twiddle factor
        USE_MLT_FOR_ADDSUB  : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Add/Sub
        USE_MLT_FOR_CMULT   : boolean:=FALSE;       --! Use DSP48E1/2 blocks or not for Complex Mult
        USE_MLT_FOR_TWDLS   : boolean:=FALSE        --! Use DSP48E1/2 blocks or not for Twiddles
    );
    port (
        -- System signals --
        RESET               : in  std_logic;        --! Gldt_obal reset
        CLK                 : in  std_logic;        --! System clock
        -- Input data --
        FC0_IN0             : in fp23_complex;      --! Fast Conv. 0 (0 to N/2)
        FC0_IN1             : in fp23_complex;      --! Fast Conv. 0 (N/2 to N)
        FC1_IN0             : in fp23_complex;      --! Fast Conv. 1 (0 to N/2)
        FC1_IN1             : in fp23_complex;      --! Fast Conv. 1 (N/2 to N)
        F01_ENA             : in std_logic;         --! Input valid data
        -- Output data --
        FC0_DO0             : out fp23_complex;     --! Output FFT 0 (0 to N/2)
        FC0_DO1             : out fp23_complex;     --! Output FFT 0 (N/2 to N)
        FC1_DO0             : out fp23_complex;     --! Output FFT 1 (0 to N/2)
        FC1_DO1             : out fp23_complex;     --! Output FFT 1 (N/2 to N)
        F01_VAL             : out std_logic         --! Output valid data
    );
end fp23_fftNk2_core;

architecture fp23_fftNk2_core of fp23_fftNk2_core is

constant Nwid   : integer:=fc0_in0.re.man'length+fc0_in0.re.exp'length+1;
constant Nman   : integer:=fc0_in0.re.man'length;

type complex_fp23xN     is array (NFFT-1 downto 0) of fp23_complex;

signal dt0_ia               : complex_fp23xN;
signal dt0_ib               : complex_fp23xN;
signal dt1_ia               : complex_fp23xN;
signal dt1_ib               : complex_fp23xN;

signal dt0_oa               : complex_fp23xN;
signal dt0_ob               : complex_fp23xN;
signal dt1_oa               : complex_fp23xN;
signal dt1_ob               : complex_fp23xN;

signal dt0_xa               : complex_fp23xN;
signal dt0_xb               : complex_fp23xN;
signal dt1_xa               : complex_fp23xN;
signal dt1_xb               : complex_fp23xN;

signal twd_ww               : complex_fp23xN;

signal dat_en               : std_logic_vector(NFFT-1 downto 0);
signal coe_en               : std_logic_vector(NFFT-1 downto 0);
signal fly_en               : std_logic_vector(NFFT-1 downto 0);
signal fly_vl               : std_logic_vector(NFFT-1 downto 0);

signal del_en               : std_logic_vector(NFFT-2 downto 0);
signal del_vl               : std_logic_vector(NFFT-2 downto 0);

type complex_WxN is array (NFFT-2 downto 0) of std_logic_vector(2*Nwid-1 downto 0);
signal di0_aa            : complex_WxN;
signal di0_bb            : complex_WxN;
signal do0_aa            : complex_WxN;
signal do0_bb            : complex_WxN;

signal di1_aa            : complex_WxN;
signal di1_bb            : complex_WxN;
signal do1_aa            : complex_WxN;
signal do1_bb            : complex_WxN;

begin

dat_en(0) <= f01_ena;
dt0_ia(0) <= fc0_in0;
dt0_ib(0) <= fc0_in1;
dt1_ia(0) <= fc1_in0;
dt1_ib(0) <= fc1_in1;

xCALC: for ii in 0 to NFFT-1 generate  
    begin
        xFWD: if (INVERSE = FALSE) generate
            xBF0: entity work.fp23_bfly_fwd
                generic map (
                    USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
                    USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
                    STAGE               => NFFT-1-ii,
                    XSERIES             => XSERIES
                )
                port map (
                    dt_ia               => dt0_xa(ii),
                    dt_ib               => dt0_xb(ii),
                    di_en               => fly_en(ii),
                    dt_ww               => twd_ww(ii),
                    dt_oa               => dt0_oa(ii),
                    dt_ob               => dt0_ob(ii),
                    do_vl               => fly_vl(ii),
                    reset               => reset,
                    clk                 => clk
                );

            xBF1: entity work.fp23_bfly_fwd
                generic map (
                    USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
                    USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
                    STAGE               => NFFT-1-ii,
                    XSERIES             => XSERIES
                )
                port map (
                    dt_ia               => dt1_xa(ii),
                    dt_ib               => dt1_xb(ii),
                    di_en               => fly_en(ii),
                    dt_ww               => twd_ww(ii),
                    dt_oa               => dt1_oa(ii),
                    dt_ob               => dt1_ob(ii),
                    do_vl               => open,
                    reset               => reset,
                    clk                 => clk
                );

            xALGN0: entity work.fp23fft_align_data 
                generic map (
                    NFFT                => NFFT,
                    STAGE               => ii,
                    USE_SCALE           => USE_SCALE
                )
                port map (
                    clk                 => clk,
                    dt_ia               => dt0_ia(ii),
                    dt_ib               => dt0_ib(ii),
                    dt_xa               => dt0_xa(ii),
                    dt_xb               => dt0_xb(ii),
                    fl_en               => dat_en(ii),
                    fl_vl               => fly_en(ii),
                    tw_vl               => coe_en(ii)
                );

            xALGN1: entity work.fp23fft_align_data 
                generic map (
                    NFFT                => NFFT,
                    STAGE               => ii,
                    USE_SCALE           => USE_SCALE
                )
                port map (
                    clk                 => clk,
                    dt_ia               => dt1_ia(ii),
                    dt_ib               => dt1_ib(ii),
                    dt_xa               => dt1_xa(ii),
                    dt_xb               => dt1_xb(ii),
                    fl_en               => '0',
                    fl_vl               => open,
                    tw_vl               => open
                );

            xTWD_GEN: entity work.rom_twiddle_gen
                generic map (
                    NFFT                => NFFT,
                    STAGE               => ii,
                    XSERIES             => XSERIES,
                    USE_MLT             => USE_MLT_FOR_TWDLS,
                    USE_SCALE           => USE_SCALE
                )
                port map (
                    ww                  => twd_ww(ii),
                    clk                 => clk,
                    ww_ena              => coe_en(ii),
                    reset               => reset
                );
        end generate;

        xINV: if (INVERSE = TRUE) generate
            xBF0: entity work.fp23_ibfly_inv
                generic map (
                    USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
                    USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
                    STAGE               => ii,
                    USE_CONJ            => USE_CONJ,
                    XSERIES             => XSERIES
                )
                port map (
                    dt_ia               => dt0_xa(ii),
                    dt_ib               => dt0_xb(ii),
                    di_en               => fly_en(ii),
                    dt_ww               => twd_ww(ii),
                    dt_oa               => dt0_oa(ii),
                    dt_ob               => dt0_ob(ii),
                    do_vl               => fly_vl(ii),
                    reset               => reset,
                    clk                 => clk
                );

            xBF1: entity work.fp23_ibfly_inv
                generic map (
                    USE_MLT_FOR_ADDSUB  => USE_MLT_FOR_ADDSUB,
                    USE_MLT_FOR_CMULT   => USE_MLT_FOR_CMULT,
                    STAGE               => ii,
                    USE_CONJ            => USE_CONJ,
                    XSERIES             => XSERIES
                )
                port map (
                    dt_ia               => dt1_xa(ii),
                    dt_ib               => dt1_xb(ii),
                    di_en               => fly_en(ii),
                    dt_ww               => twd_ww(ii),
                    dt_oa               => dt1_oa(ii),
                    dt_ob               => dt1_ob(ii),
                    do_vl               => open,
                    reset               => reset,
                    clk                 => clk
                );

            xALGN0: entity work.fp23ifft_align_data 
                generic map (
                    NFFT                => NFFT,
                    STAGE               => ii,
                    USE_SCALE           => USE_SCALE
                )
                port map (
                    clk                 => clk,
                    dt_ia               => dt0_ia(ii),
                    dt_ib               => dt0_ib(ii),
                    dt_xa               => dt0_xa(ii),
                    dt_xb               => dt0_xb(ii),
                    fl_en               => dat_en(ii),
                    fl_vl               => fly_en(ii)
                );

            xALGN1: entity work.fp23ifft_align_data 
                generic map (
                    NFFT                => NFFT,
                    STAGE               => ii,
                    USE_SCALE           => USE_SCALE
                )
                port map (
                    clk                 => clk,
                    dt_ia               => dt1_ia(ii),
                    dt_ib               => dt1_ib(ii),
                    dt_xa               => dt1_xa(ii),
                    dt_xb               => dt1_xb(ii),
                    fl_en               => '0',
                    fl_vl               => open
                );

            coe_en(ii) <= dat_en(ii);

            xTWD_GEN: entity work.rom_twiddle_gen
                generic map (
                    NFFT                => NFFT,
                    STAGE               => NFFT-1-ii,
                    XSERIES             => XSERIES,
                    USE_MLT             => USE_MLT_FOR_TWDLS,
                    USE_SCALE           => USE_SCALE
                )
                port map (
                    ww                  => twd_ww(ii),
                    clk                 => clk,
                    ww_ena              => coe_en(ii),
                    reset               => reset
                );
        end generate;
end generate;

xDELAY_LINE: for ii in 0 to NFFT-2 generate
begin   
    -- Input data for delay lines --
    di0_aa(ii) <= (dt0_oa(ii).im.exp & dt0_oa(ii).im.sig & dt0_oa(ii).im.man & dt0_oa(ii).re.exp & dt0_oa(ii).re.sig & dt0_oa(ii).re.man);
    di0_bb(ii) <= (dt0_ob(ii).im.exp & dt0_ob(ii).im.sig & dt0_ob(ii).im.man & dt0_ob(ii).re.exp & dt0_ob(ii).re.sig & dt0_ob(ii).re.man);
    di1_aa(ii) <= (dt1_oa(ii).im.exp & dt1_oa(ii).im.sig & dt1_oa(ii).im.man & dt1_oa(ii).re.exp & dt1_oa(ii).re.sig & dt1_oa(ii).re.man);
    di1_bb(ii) <= (dt1_ob(ii).im.exp & dt1_ob(ii).im.sig & dt1_ob(ii).im.man & dt1_ob(ii).re.exp & dt1_ob(ii).re.sig & dt1_ob(ii).re.man);
    del_en(ii) <= fly_vl(ii);

    -- Output data for delay lines --
    dt0_ia(ii+1).re <= (do0_aa(ii)(1*Nwid-1 downto 0*Nwid+Nman+1), do0_aa(ii)(0*Nwid+Nman), do0_aa(ii)(0*Nwid+Nman-1 downto 000000));
    dt0_ia(ii+1).im <= (do0_aa(ii)(2*Nwid-1 downto 1*Nwid+Nman+1), do0_aa(ii)(1*Nwid+Nman), do0_aa(ii)(1*Nwid+Nman-1 downto Nwid));
    dt0_ib(ii+1).re <= (do0_bb(ii)(1*Nwid-1 downto 0*Nwid+Nman+1), do0_bb(ii)(0*Nwid+Nman), do0_bb(ii)(0*Nwid+Nman-1 downto 000000));
    dt0_ib(ii+1).im <= (do0_bb(ii)(2*Nwid-1 downto 1*Nwid+Nman+1), do0_bb(ii)(1*Nwid+Nman), do0_bb(ii)(1*Nwid+Nman-1 downto Nwid));
    
    dt1_ia(ii+1).re <= (do1_aa(ii)(1*Nwid-1 downto 0*Nwid+Nman+1), do1_aa(ii)(0*Nwid+Nman), do1_aa(ii)(0*Nwid+Nman-1 downto 000000));
    dt1_ia(ii+1).im <= (do1_aa(ii)(2*Nwid-1 downto 1*Nwid+Nman+1), do1_aa(ii)(1*Nwid+Nman), do1_aa(ii)(1*Nwid+Nman-1 downto Nwid));
    dt1_ib(ii+1).re <= (do1_bb(ii)(1*Nwid-1 downto 0*Nwid+Nman+1), do1_bb(ii)(0*Nwid+Nman), do1_bb(ii)(0*Nwid+Nman-1 downto 000000));
    dt1_ib(ii+1).im <= (do1_bb(ii)(2*Nwid-1 downto 1*Nwid+Nman+1), do1_bb(ii)(1*Nwid+Nman), do1_bb(ii)(1*Nwid+Nman-1 downto Nwid));
    dat_en(ii+1)    <= del_vl(ii);
    
    xFWD: if (INVERSE = FALSE) generate
        xDEL0 : entity work.int_delay_wrap
            generic map (
                NWIDTH      => 2*Nwid,
                NFFT        => NFFT,
                STAGE       => ii
            )
            port map (
                DI_AA       => di0_aa(ii),
                DI_BB       => di0_bb(ii),
                DI_EN       => del_en(ii),
                DO_AA       => do0_aa(ii),
                DO_BB       => do0_bb(ii),
                DO_VL       => del_vl(ii),
                RST         => reset,
                clk         => clk
            );

        xDEL1 : entity work.int_delay_wrap
            generic map (
                NWIDTH      => 2*Nwid,
                NFFT        => NFFT,
                STAGE       => ii
            )
            port map (
                DI_AA       => di1_aa(ii),
                DI_BB       => di1_bb(ii),
                DI_EN       => del_en(ii),
                DO_AA       => do1_aa(ii),
                DO_BB       => do1_bb(ii),
                DO_VL       => open,
                RST         => reset,
                clk         => clk
            );
    end generate;
    
    xINV: if (INVERSE = TRUE) generate
        xDEL0 : entity work.int_delay_wrap
            generic map (
                NWIDTH      => 2*Nwid,
                NFFT        => NFFT,
                STAGE       => NFFT-2-ii
            )
            port map (
                DI_AA       => di0_aa(ii),
                DI_BB       => di0_bb(ii),
                DI_EN       => del_en(ii),
                DO_AA       => do0_aa(ii),
                DO_BB       => do0_bb(ii),
                DO_VL       => del_vl(ii),
                RST         => reset,
                clk         => clk
            );

        xDEL1 : entity work.int_delay_wrap
            generic map (
                NWIDTH      => 2*Nwid,
                NFFT        => NFFT,
                STAGE       => NFFT-2-ii
            )
            port map (
                DI_AA       => di1_aa(ii),
                DI_BB       => di1_bb(ii),
                DI_EN       => del_en(ii),
                DO_AA       => do1_aa(ii),
                DO_BB       => do1_bb(ii),
                DO_VL       => open,
                RST         => reset,
                clk         => clk
            );
    end generate; 
end generate;     

pr_out: process(clk) is
begin
    if rising_edge(clk) then
        if (reset = '1') then
            f01_val <= '0';
            fc0_do0 <= (others => ("000000", '0', x"0000")); 
            fc0_do1 <= (others => ("000000", '0', x"0000")); 
            fc1_do0 <= (others => ("000000", '0', x"0000")); 
            fc1_do1 <= (others => ("000000", '0', x"0000")); 
        else
            f01_val <= fly_vl(NFFT-1);
            fc0_do0 <= dt0_oa(NFFT-1);
            fc0_do1 <= dt0_ob(NFFT-1);
            fc1_do0 <= dt1_oa(NFFT-1);
            fc1_do1 <= dt1_ob(NFFT-1);
        end if;
    end if;
end process;

end fp23_fftNk2_core;



