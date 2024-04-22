-------------------------------------------------------------------------------
--
-- Title       : fp23_bfly_fwd
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-- E-mail      : sallador@bk.ru
--
-- Description : DIF butterfly (Radix-2)
--
-------------------------------------------------------------------------------
--
--  Version 1.0  07.04.2013
--               Description: Simple butterfly Radix-2 for FFT (DIF)
--                  Algorithm: Decimation in frequency
--                  Delays: Multiplier = 5,Add/Sub = 14,Total = 14+14+5=33.
--                  X = (A+B),Y = (A-B)*W
--
--    Algorithm: Decimation in frequency
--
--    X = (A+B),
--    Y = (A-B)*W;
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
use work.fp_m1_pkg.fp23_data;

entity fp23_bfly_fwd is
    generic (
        STAGE               : integer:=0;       --! Butterfly stage
        USE_MLT_FOR_ADDSUB  : boolean:=FALSE;   --! Use DSP48E1/2 blocks or not for Add/Sub
        USE_MLT_FOR_CMULT   : boolean:=FALSE;   --! Use DSP48E1/2 blocks or not for Complex Mult
        XSERIES             : string:="7SERIES" --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
    );
    port (
        -- Input data for butterfly --
        DT_IA               : in  fp23_complex; --! Even data in part
        DT_IB               : in  fp23_complex; --! Odd data in part
        DI_EN               : in  std_logic;    --! Data enable
        -- Twiddles --
        DT_WW               : in  fp23_complex; --! Twiddle data
        -- Output data for butterfly --
        DT_OA               : out fp23_complex; --! Even data out
        DT_OB               : out fp23_complex; --! Odd data out
        DO_VL               : out std_logic;    --! Data valid
        -- Common signals --
        RESET               : in  std_logic;    --! Global reset
        CLK                 : in  std_logic     --! Clock
    );
end fp23_bfly_fwd;

architecture fp23_bfly_fwd of fp23_bfly_fwd is

signal sum          : fp23_complex; 
signal dif          : fp23_complex;
signal dval_en      : std_logic_vector(2 downto 0);

begin

-------- SUM = A + B --------
ADDSUB_RE: entity work.fp23_addsub_dbl
    generic map ( 
        XSERIES => XSERIES,
        USE_MLT => USE_MLT_FOR_ADDSUB
    )
    port map (
        aa      => DT_IA.re,
        bb      => DT_IB.re,
        cc_add  => sum.re,
        cc_sub  => dif.re,
        enable  => DI_EN,
        valid   => dval_en(0),
        reset   => reset,
        clk     => clk 
    );

ADDSUB_IM: entity work.fp23_addsub_dbl
    generic map ( 
        XSERIES => XSERIES,
        USE_MLT => USE_MLT_FOR_ADDSUB
    )
    port map (
        aa      => DT_IA.im,
        bb      => DT_IB.im,
        cc_add  => sum.im,
        cc_sub  => dif.im,
        enable  => DI_EN,
        reset   => reset,
        clk     => clk 
    );

---- First butterfly: don't need multipliers! WW0 = {1,0} ----
xST0: if (STAGE = 0) generate
begin
    DT_OA <= sum;
    DT_OB <= dif;
    DO_VL <= dval_en(0);
end generate;

---- Second butterfly: WW0 = {1,0} and WW1 = {0,-1} ----
xST1: if (STAGE = 1) generate
    signal dt_sw    : std_logic;
begin
    ---- Counter for twiddle factor ----
    pr_cnt: process(clk) is
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                dt_sw <= '0';
            elsif (dval_en(0) = '1') then
                dt_sw <= not dt_sw;
            end if;
        end if;
    end process;

    ---- Flip twiddles ----
    pr_inv: process(clk) is
    begin
        if rising_edge(clk) then
            ---- WW(0){Re,Im} = {1,0} ----
            if (dt_sw = '0') then
                dt_ob.re <= dif.re;
                dt_ob.im <= dif.im;
            ---- WW(1){Re,Im} = {0,1} ----
            else
                dt_ob.re <= dif.im;
                dt_ob.im <= (dif.re.exp,not(dif.re.sig),dif.re.man);
            end if;
            dt_oa <= sum;
            do_vl <= dval_en(0);
        end if;
    end process;
end generate;

xSTn: if (STAGE > 1) generate
    type complex_fp23x14 is array(13 downto 0) of fp23_complex;

    signal re_x_re      : fp23_data;
    signal im_x_im      : fp23_data;
    signal re_x_im      : fp23_data;
    signal im_x_re      : fp23_data;

    signal sob          : fp23_complex;
    signal sum_del      : complex_fp23x14;

begin
    -------- PROD = DIF * WW --------
    RE_RE_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => dif.re,
            bb      => DT_WW.re,
            cc      => re_x_re,
            enable  => dval_en(0),
            valid   => dval_en(1), 
            reset   => reset,
            clk     => clk
        );

    IM_IM_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => dif.im,
            bb      => DT_WW.im,
            cc      => im_x_im,
            enable  => dval_en(0),
            reset   => reset,
            clk     => clk
        ); 

    RE_IM_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => dif.re,
            bb      => DT_WW.im,
            cc      => re_x_im,
            enable  => dval_en(0),
            reset   => reset,
            clk     => clk
        ); 

    IM_RE_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => dif.im,
            bb      => DT_WW.re,
            cc      => im_x_re,
            enable  => dval_en(0),
            reset   => reset,
            clk     => clk
        );

    -------- DT_OB = COMPL MULT --------
    DT_OB_IM_ADD: entity work.fp23_addsub
        generic map ( 
            XSERIES => XSERIES,
            USE_MLT => USE_MLT_FOR_CMULT
        )       
        port map (
            aa      => re_x_im,
            bb      => im_x_re,
            cc      => sob.im,
            addsub  => '0',
            enable  => dval_en(1),
            reset   => reset,
            clk     => clk
        );

    DT_OB_RE_SUB: entity work.fp23_addsub
        generic map ( 
            XSERIES => XSERIES,
            USE_MLT => USE_MLT_FOR_CMULT
        )       
        port map (
            aa      => re_x_re,
            bb      => im_x_im,
            cc      => sob.re,
            addsub  => '1',
            enable  => dval_en(1),
            valid   => dval_en(2),
            reset   => reset,
            clk     => clk
        );

    -------- DT_OA = SHIFT REGISTER --------
    pr_sumdel: process(clk) is
    begin
        if rising_edge(clk) then
            sum_del <= sum_del(sum_del'left-1 downto 0) & sum;
        end if;
    end process;

    DT_OA <= sum_del(sum_del'left);
    DT_OB <= sob;
    DO_VL <= dval_en(2);
end generate;

end fp23_bfly_fwd;