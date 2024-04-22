-------------------------------------------------------------------------------
--
-- Title       : int_dit2_fly
-- Design      : FFT
-- Author      : Kapitanov Alexander
-- Company     : 
-- E-mail      : sallador@bk.ru
--
-------------------------------------------------------------------------------
--
-- Version 1.0 : 12.04.2018
--
-- Description : Simple butterfly Radix-2 for FFT (DIT)
--
-- Algorithm: Decimation in time
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
use ieee.std_logic_unsigned.all;

entity int_dit2_fly is
    generic(
        -- IS_SIM      : boolean:=FALSE; --! Simulation model: TRUE / FALSE
        STAGE       : integer:=0;  --! Butterfly stages
        SCALE       : integer:=0;  --! 1 - Scaled FFT, 0 - Unscaled
        DTW         : integer:=16; --! Data width
        TFW         : integer:=16; --! Twiddle factor width
        RNDMODE     : integer:=0; --! Rounding mode: TRUNC - 0 / ROUND - 1      
        XSER        : string:="OLD" --! Xilinx series: NEW - DSP48E2, OLD - DSP48E1
    );
    port(
        IA_RE       : in  std_logic_vector(DTW-1 downto 0); --! Re even input data
        IA_IM       : in  std_logic_vector(DTW-1 downto 0); --! Im even input data
        IB_RE       : in  std_logic_vector(DTW-1 downto 0); --! Re odd  input data
        IB_IM       : in  std_logic_vector(DTW-1 downto 0); --! Im odd  input data
        IN_EN       : in  std_logic; --! Data clock enable
        
        WW_RE       : in  std_logic_vector(TFW-1 downto 0); --! Re twiddle factor
        WW_IM       : in  std_logic_vector(TFW-1 downto 0); --! Im twiddle factor
        
        OA_RE       : out std_logic_vector(DTW-SCALE downto 0); --! Re even output data
        OA_IM       : out std_logic_vector(DTW-SCALE downto 0); --! Im even output data
        OB_RE       : out std_logic_vector(DTW-SCALE downto 0); --! Re odd  output data
        OB_IM       : out std_logic_vector(DTW-SCALE downto 0); --! Im odd  output data
        DO_VL       : out std_logic;    --! Output data valid           
        
        RST         : in  std_logic;    --! Global Reset
        CLK         : in  std_logic     --! DSP Clock   
    );
end int_dit2_fly;

architecture int_dit2_fly of int_dit2_fly is

function find_delay(sVAR : string; iDW, iTW: integer) return integer is
    variable ret_val : integer;
    variable loDSP : integer;
    variable hiDSP : integer;
begin
    if (sVAR = "OLD") then loDSP := 25; else loDSP := 27; end if;
    if (sVAR = "OLD") then hiDSP := 43; else hiDSP := 45; end if;

    ---- TWIDDLE WIDTH UP TO 18 ----
    if (iTW < 19) then
        if (iDW <= loDSP) then
            ret_val := 4;
        elsif ((iDW > loDSP) and (iDW < hiDSP)) then
            ret_val := 6;
        else
            ret_val := 8;
        end if;
    ---- TWIDDLE WIDTH FROM 18 TO 25 ----
    elsif ((iTW > 18) and (iTW <= loDSP)) then
        if (iDW < 19) then
            ret_val := 4;
        elsif ((iDW > 18) and (iDW < 36)) then
            ret_val := 6;
        else
            ret_val := 8;
        end if;     
    else
        ret_val := 0; 
    end if;
    return ret_val; 
end function find_delay;

constant DATA_DELAY : integer:=find_delay(XSER, DTW, TFW);
type std_logic_delayN is array (DATA_DELAY-1 downto 0) of std_logic_vector(DTW-1 downto 0);


function addsub_delay(iDW: integer) return integer is
    variable ret_val : integer:=0;
begin
    if (iDW < 48) then
        ret_val := 2;
    else 
        ret_val := 3;
    end if;
    return ret_val; 
end function addsub_delay;

constant ADD_DELAY  : integer:=addsub_delay(DTW+SCALE+RNDMODE)+RNDMODE;

signal az_re        : std_logic_vector(DTW-1 downto 0);
signal az_im        : std_logic_vector(DTW-1 downto 0);
signal bw_re        : std_logic_vector(DTW-1 downto 0);
signal bw_im        : std_logic_vector(DTW-1 downto 0);

begin
    ---------------------------------------------------------------
    -------- SUM = (A + B), DIF = (A-B) --------
    xUNSCALED: if ((SCALE = 0) or (RNDMODE = 0)) generate   
        xADD_RE: entity work.int_addsub_dsp48
            generic map (
                DSPW    => DTW-SCALE,
                XSER    => XSER
            )
            port map (
                IA_RE   => az_re(DTW-1 downto SCALE),
                IA_IM   => az_im(DTW-1 downto SCALE),
                IB_RE   => bw_re(DTW-1 downto SCALE),
                IB_IM   => bw_im(DTW-1 downto SCALE),

                OX_RE   => OA_RE,
                OX_IM   => OA_IM,
                OY_RE   => OB_RE,
                OY_IM   => OB_IM,

                RST     => rst,
                CLK     => clk
            );  
    end generate;
    ---------------- ROUNDING MODE ----------------
    xROUND: if ((RNDMODE = 1) and (SCALE = 1)) generate
        signal da_re        : std_logic_vector(DTW downto 0);
        signal da_im        : std_logic_vector(DTW downto 0);
        signal db_re        : std_logic_vector(DTW downto 0);
        signal db_im        : std_logic_vector(DTW downto 0);
    begin

        xADD_RE: entity work.int_addsub_dsp48
                generic map (
                    DSPW    => DTW,
                    XSER    => XSER
                )
                port map (
                    IA_RE   => az_re,
                    IA_IM   => az_im,
                    IB_RE   => bw_re,
                    IB_IM   => bw_im,

                    OX_RE   => da_re,
                    OX_IM   => da_im,
                    OY_RE   => db_re,
                    OY_IM   => db_im,

                    RST     => rst,
                    CLK     => clk
                );
                
        ---- Rounding mode: +/- 0.5 ----    
        pr_rnd: process(clk) is
        begin
            if rising_edge(clk) then
                if (da_re(0) = '0') then
                    OA_RE <= da_re(DTW downto 1);
                else
                    OA_RE <= da_re(DTW downto 1) + '1';
                end if;
                if (da_im(0) = '0') then
                    OA_IM <= da_im(DTW downto 1);
                else
                    OA_IM <= da_im(DTW downto 1) + '1';
                end if; 
                if (db_re(0) = '0') then
                    OB_RE <= db_re(DTW downto 1);
                else
                    OB_RE <= db_re(DTW downto 1) + '1';
                end if;
                if (db_im(0) = '0') then
                    OB_IM <= db_im(DTW downto 1);
                else
                    OB_IM <= db_im(DTW downto 1) + '1';
                end if; 
            end if;
        end process;        
    end generate;
    ---------------------------------------------------------------
    
    ---- First butterfly: don't need multipliers! WW0 = {1, 0} ----
    xST0: if (STAGE = 0) generate
        signal vl_zz : std_logic_vector(ADD_DELAY-1 downto 0);
    begin
        bw_re <= IB_RE;
        bw_im <= IB_IM;
        az_re <= IA_RE;
        az_im <= IA_IM;     
        DO_VL <= vl_zz(vl_zz'left);
        vl_zz <= vl_zz(vl_zz'left-1 downto 0) & IN_EN when rising_edge(clk);
    end generate;
    ---------------------------------------------------------------

    ---- Second butterfly: WW0 = {1, 0} and WW1 = {0, -1} ----
    xST1: if (STAGE = 1) generate
        signal vl_zz    : std_logic_vector(ADD_DELAY downto 0);
        signal dt_sw    : std_logic;

    begin
        ---- Counter for twiddle factor ----
        pr_cnt: process(clk) is
        begin
            if rising_edge(clk) then
                if (rst = '1') then
                    dt_sw <= '0';
                elsif (IN_EN = '1') then
                    dt_sw <= not dt_sw;
                end if;
            end if;
        end process;
        
        --------------------------------------------------------------
        ---- NB! Multiplication by (-1) is the same as inverse.   ----
        ---- But in 2's complement you should inverse data and +1 ----
        ---- Most negative value in 2's complement is WIERD NUM   ----
        ---- So: for positive values use Y = not(X) + 1,          ----
        ---- and for negative values use Y = not(X)               ----
        --------------------------------------------------------------
        
        ---- Flip twiddles ----
        pr_inv: process(clk) is
        begin
            if rising_edge(clk) then
                ---- WW(0){Re,Im} = {1, 0} ----
                if (dt_sw = '0') then
                    bw_re <= IB_RE;
                    bw_im <= IB_IM;
                ---- WW(1){Re,Im} = {0, -1} ----
                else
                    -- bw_re <= IB_IM;
                    bw_im <= IB_RE;
                    if (IB_IM(DTW-1) = '0') then
                        bw_re <= not(IB_IM) + '1';
                    else
                        bw_re <= not(IB_IM);
                    end if;
                end if;
                ---- Delay ----
                az_re <= IA_RE;
                az_im <= IA_IM;
            end if;
        end process;

        DO_VL <= vl_zz(vl_zz'left);
        
        vl_zz <= vl_zz(vl_zz'left-1 downto 0) & IN_EN when rising_edge(clk);
    end generate;

    ---------------------------------------------------------------
    ---- Others ----
    xSTn: if (STAGE > 1) generate   
        signal dz_re    : std_logic_delayN;
        signal dz_im    : std_logic_delayN;

        signal vl_zz    : std_logic_vector(DATA_DELAY+ADD_DELAY-1 downto 0);
    begin
        dz_re <= dz_re(DATA_DELAY-2 downto 0) & IA_RE when rising_edge(clk);
        dz_im <= dz_im(DATA_DELAY-2 downto 0) & IA_IM when rising_edge(clk);
        az_re <= dz_re(DATA_DELAY-1);
        az_im <= dz_im(DATA_DELAY-1);
        
        vl_zz <= vl_zz(vl_zz'left-1 downto 0) & IN_EN when rising_edge(clk);

    -------- PROD = DIF * WW --------   
    xCMPL: entity work.int_cmult_dsp48
        generic map (
            -- IS_SIM  => IS_SIM,  
            DTW     => DTW,
            TWD     => TFW,
            XSER    => XSER
        )
        port map (
            DI_RE   => IB_IM,
            DI_IM   => IB_RE,
            WW_RE   => WW_RE,
            WW_IM   => WW_IM,

            DO_RE   => bw_im,
            DO_IM   => bw_re,

            RST     => rst,
            CLK     => clk
        );  

        DO_VL <= vl_zz(vl_zz'left);
    end generate;
    ---------------------------------------------------------------
end int_dit2_fly;