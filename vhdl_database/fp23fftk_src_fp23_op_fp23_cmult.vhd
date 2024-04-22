-------------------------------------------------------------------------------
--
-- Title       : fp23_cmult
-- Design      : fpfftk
-- Author      : Kapitanov
-- Company     :
--
-- Description : floating point complex multiplier
--
-------------------------------------------------------------------------------
--
--  Version 1.0  19.12.2015
--               Description: Complex floating point multiplier
--
--                  DC_RE = DA_RE * DB_RE - DA_IM * DB_IM
--                  DC_IM = DA_RE * DB_IM + DA_IM * DB_RE
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
use ieee.std_logic_unsigned.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

library work;
use work.fp_m1_pkg.fp23_complex;
use work.fp_m1_pkg.fp23_data; 

entity fp23_cmult is
    generic (
        XSERIES : string:="7SERIES" --! Xilinx series
    );
    port (
        DA      : in  fp23_complex; --! Data A (input)
        DB      : in  fp23_complex; --! Data B (input)  
        ENA     : in  STD_LOGIC;    --! Input data enable
 
        DC      : out fp23_complex; --! Data C (output) 
        VAL     : out STD_LOGIC;    --! Output data valid

        RESET   : in  STD_LOGIC;    --! Reset
        CLK     : in  STD_LOGIC     --! Clock
    );  
end fp23_cmult;

architecture fp23_cmult of fp23_cmult is

signal fp23_cc      : fp23_complex; 
signal fp23_val     : std_logic;
signal fp23_mlt     : std_logic;

signal fp23_are_bre : fp23_data;    
signal fp23_are_bim : fp23_data;
signal fp23_aim_bre : fp23_data;    
signal fp23_aim_bim : fp23_data;

constant CM_SCALE   : std_logic_vector(5 downto 0):="011111";

begin
   
---------------- FlOAT MULTIPLY A*B ----------------
ARExBRE : entity work.fp23_mult
    generic map ( 
        XSERIES => XSERIES,
        EXP_DIF => CM_SCALE
    )
    port map (
        aa      => DA.re,
        bb      => DB.re,
        cc      => fp23_are_bre,
        enable  => ENA,
        valid   => fp23_mlt,
        reset   => RESET,
        clk     => clk
    );  
    
AIMxBIM : entity work.fp23_mult
    generic map ( 
        XSERIES => XSERIES,
        EXP_DIF => CM_SCALE
    )
    port map (
        aa      => DA.im,
        bb      => DB.im,
        cc      => fp23_aim_bim,
        enable  => ENA,
        valid   => open,
        reset   => RESET,
        clk     => clk
    );  
    
    
ARExBIM : entity work.fp23_mult
    generic map ( 
        XSERIES => XSERIES,
        EXP_DIF => CM_SCALE
    )
    port map (
        aa      => DA.re,
        bb      => DB.im,
        cc      => fp23_are_bim,
        enable  => ENA,
        valid   => open,
        reset   => RESET,
        clk     => clk
    );      
    
AIMxBRE : entity work.fp23_mult
    generic map ( 
        XSERIES => XSERIES,
        EXP_DIF => CM_SCALE
    )
    port map (
        aa      => DA.im,
        bb      => DB.re,
        cc      => fp23_aim_bre,
        enable  => ENA,
        valid   => open,
        reset   => RESET,
        clk     => clk
    );

---------------- FlOAT ADD/SUB +/- ---------------- 
AB_ADD : entity work.fp23_addsub
    generic map ( 
        XSERIES => XSERIES 
    )   
    port map (
        aa      => fp23_are_bim,
        bb      => fp23_aim_bre,
        cc      => fp23_cc.im,
        addsub  => '0',
        reset   => RESET,
        enable  => fp23_mlt,
        valid   => fp23_val, 
        clk     => clk
    );
    
AB_SUB : entity work.fp23_addsub
    generic map ( 
        XSERIES => XSERIES 
    )   
    port map (
        aa      => fp23_are_bre,
        bb      => fp23_aim_bim,
        cc      => fp23_cc.re,
        addsub  => '1',
        reset   => RESET,
        enable  => fp23_mlt,
        valid   => open, 
        clk     => clk
    );      

DC <= fp23_cc when rising_edge(clk);
VAL <= fp23_val when rising_edge(clk);

end fp23_cmult;