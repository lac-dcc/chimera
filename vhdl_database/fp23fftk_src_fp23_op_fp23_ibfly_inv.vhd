-------------------------------------------------------------------------------
--
-- Title       : fp23_ibfly_inv
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
-- E-mail      : sallador@bk.ru
--
-- Description : DIT butterfly (Radix-2)
--
-------------------------------------------------------------------------------
--
--  Version 1.0  10.12.2017
--    Description: Simple butterfly Radix-2 for FFT (DIT)
--
--    Algorithm: Decimation in time
--
--    X = A+B*W, 
--    Y = A-B*W;
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

entity fp23_ibfly_inv is
    generic (
        STAGE               : integer:=0;       --! Butterfly stage
        USE_CONJ            : boolean:=FALSE;   --! Use conjugation for IFFT
        USE_MLT_FOR_ADDSUB  : boolean:=FALSE;   --! Use DSP48E1/2 blocks or not for Add/Sub
        USE_MLT_FOR_CMULT   : boolean:=FALSE;   --! Use DSP48E1/2 blocks or not for Complex Mult
        XSERIES             : string:="7SERIES" --! FPGA family: for 6/7 series: "7SERIES"; for ULTRASCALE: "ULTRA";
    );
    port (
        DT_IA               : in  fp23_complex; --! Even data in part
        DT_IB               : in  fp23_complex; --! Odd data in part
        DI_EN               : in  std_logic;    --! Data enable
        DT_WW               : in  fp23_complex; --! Twiddle data
        DT_OA               : out fp23_complex; --! Even data out
        DT_OB               : out fp23_complex; --! Odd data out
        DO_VL               : out std_logic;    --! Data valid
        RESET               : in  std_logic;    --! Global reset
        CLK                 : in  std_logic     --! Clock
    );
end fp23_ibfly_inv;

architecture fp23_ibfly_inv of fp23_ibfly_inv is

signal sum          : fp23_complex; 
signal dif          : fp23_complex;
signal bw           : fp23_complex;

signal aw           : fp23_complex;
signal dval_en      : std_logic_vector(2 downto 0);

begin
 
 
---- First butterfly: don't need multipliers! WW0 = {1, 0} ----
xST0: if (STAGE = 0) generate
begin
    bw <= DT_IB;
    aw <= DT_IA;
    dval_en(1) <= DI_EN;
end generate;
 
---- Second butterfly: WW0 = {1, 0} and WW1 = {0, -1} ----
xST1: if (STAGE = 1) generate
    signal dt_sw    : std_logic;
begin
    ---- Counter for twiddle factor ----
    pr_cnt: process(clk) is
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                dt_sw <= '0';
            elsif (DI_EN = '1') then
                dt_sw <= not dt_sw;
            end if;
        end if;
    end process;
    
    G_CONJ_FALSE: if (USE_CONJ = FALSE) generate
        ---- Flip twiddles ----
        pr_inv: process(clk) is
        begin
            if rising_edge(clk) then
                ---- WW(0){Re,Im} = {1, 0} ----
                if (dt_sw = '0') then
                    bw.re <= DT_IB.re;
                    bw.im <= DT_IB.im;
                ---- WW(1){Re,Im} = {0, 1} ----
                else
                    bw.re <= (DT_IB.im.exp, not(DT_IB.im.sig), DT_IB.im.man);
                    bw.im <= DT_IB.re;
                end if;
                aw <= DT_IA;
                dval_en(1) <= DI_EN;
            end if;
        end process;
    end generate;
    
    G_CONJ_TRUE: if (USE_CONJ = TRUE) generate
        ---- Flip twiddles ----
        pr_inv: process(clk) is
        begin
            if rising_edge(clk) then
                ---- WW(0){Re,Im} = {1, 0} ----
                if (dt_sw = '0') then
                    bw.re <= DT_IB.re;
                    bw.im <= DT_IB.im;
                ---- WW(1){Re,Im} = {0, 1} ----
                else
                    bw.re <= DT_IB.im;
                    bw.im <= (DT_IB.re.exp, not(DT_IB.re.sig), DT_IB.re.man);
                end if;
                aw <= DT_IA;
                dval_en(1) <= DI_EN;
            end if;
        end process;
    end generate; 
    
end generate;

xSTn: if (STAGE > 1) generate
    signal re_x_re      : fp23_data;
    signal im_x_im      : fp23_data;
    signal re_x_im      : fp23_data;
    signal im_x_re      : fp23_data;
    
    type complex_fp23x14 is array(13 downto 0) of fp23_complex;
    signal dt_ia_del    : complex_fp23x14;
    
begin
    dt_ia_del <= dt_ia_del(dt_ia_del'left-1 downto 0) & DT_IA when rising_edge(clk);
    
    -------- PROD = DT_IB * WW -------- 
    RE_RE_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => DT_IB.re,
            bb      => DT_WW.re,
            cc      => re_x_re,
            enable  => DI_EN,
            valid   => dval_en(0),
            reset   => reset,
            clk     => clk
        ); 
        
    IM_IM_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => DT_IB.im,
            bb      => DT_WW.im,
            cc      => im_x_im,
            enable  => DI_EN,
            reset   => reset,
            clk     => clk
        );
        
    RE_IM_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => DT_IB.re,
            bb      => DT_WW.im,
            cc      => re_x_im,
            enable  => DI_EN,
            reset   => reset,
            clk     => clk
        );
        
    IM_RE_MUL : entity work.fp23_mult
        generic map ( 
            XSERIES => XSERIES
        )   
        port map (
            aa      => DT_IB.im,
            bb      => DT_WW.re,
            cc      => im_x_re,
            enable  => DI_EN,
            reset   => reset,
            clk     => clk
        );
        
    G_CONJ_FALSE: if use_conj = FALSE generate
    begin
        -------- WW conjugation --------
        DT_OB_IM_SUB: entity work.fp23_addsub
            generic map ( 
                XSERIES => XSERIES,
                USE_MLT => USE_MLT_FOR_CMULT
            )       
            port map (
                aa      => im_x_re, 
                bb      => re_x_im,
                cc      => bw.im,
                addsub  => '1',
                reset   => reset,
                enable  => dval_en(0),
                clk     => clk  
            );
            
        DT_OB_RE_ADD: entity work.fp23_addsub 
            generic map ( 
                XSERIES => XSERIES,
                USE_MLT => USE_MLT_FOR_CMULT
            )       
            port map (
                aa      => re_x_re,
                bb      => im_x_im,
                cc      => bw.re,
                addsub  => '0',
                reset   => reset,
                enable  => dval_en(0),
                valid   => dval_en(1),
                clk     => clk  
            );
    end generate; 
    
    G_CONJ_TRUE: if use_conj = TRUE generate
    begin
        -------- WW conjugation --------
        DT_OB_IM_ADD: entity work.fp23_addsub
            generic map ( 
                XSERIES => XSERIES,
                USE_MLT => USE_MLT_FOR_CMULT
            )       
            port map (
                aa      => im_x_re,
                bb      => re_x_im,
                cc      => bw.im,
                reset   => reset,
                addsub  => '0',
                enable  => dval_en(0),
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
                cc      => bw.re,
                addsub  => '1',
                reset   => reset,
                enable  => dval_en(0),
                valid   => dval_en(1),
                clk     => clk  
            );
    end generate; 

    aw <= dt_ia_del(dt_ia_del'left);

end generate;

-------- DT_OA & DT_OB -------- 
ADDSUB_RE: entity work.fp23_addsub_dbl  
    generic map ( 
        XSERIES => XSERIES,
        USE_MLT => USE_MLT_FOR_ADDSUB
    )
    port map (
        aa      => aw.re,
        bb      => bw.re,
        cc_add  => sum.re,
        cc_sub  => dif.re,
        reset   => reset,
        enable  => dval_en(1),
        clk     => clk  
    );
    
ADD_IM: entity work.fp23_addsub_dbl
    generic map ( 
        XSERIES => XSERIES,
        USE_MLT => USE_MLT_FOR_ADDSUB
    )
    port map (
        aa      => aw.im,
        bb      => bw.im,
        cc_add  => sum.im,
        cc_sub  => dif.im,
        reset   => reset, 
        enable  => dval_en(1), 
        valid   => dval_en(2),
        clk     => clk  
    );


DT_OA <= sum;
DT_OB <= dif;
DO_VL <= dval_en(2);

end fp23_ibfly_inv;