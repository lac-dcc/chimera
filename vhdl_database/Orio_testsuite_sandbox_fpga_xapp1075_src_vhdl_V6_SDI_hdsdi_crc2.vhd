-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: hdsdi_crc2.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-11-14 09:16:24-07 $
-- /___/   /\    Date Created: May 20, 2008
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: hdsdi_crc2.vhd,rcs $
-- Revision 1.1  2008-11-14 09:16:24-07  jsnow
-- Added register initializers.
--
-- Revision 1.0  2008-06-12 15:42:11-06  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs exclusively with Xilinx
-- products. Xilinx and its licensors make and you receive no warranties or 
-- conditions, express, implied, statutory or otherwise, and Xilinx specifically
-- disclaims any implied warranties of merchantability, non-infringement, or 
-- fitness for a particular purpose. Xilinx does not warrant that the functions 
-- contained in these designs will meet your requirements, or that the operation
-- of these designs will be uninterrupted or error free, or that defects in the 
-- Designs will be corrected. Furthermore, Xilinx does not warrant or make any 
-- representations regarding use or the results of the use of the designs in 
-- terms of correctness, accuracy, reliability, or otherwise. The designs are 
-- not covered by any other agreement that you may have with Xilinx. 
--
-- LIMITATION OF LIABILITY. In no event will Xilinx or its licensors be liable 
-- for any damages, including without limitation direct, indirect, incidental, 
-- special, reliance or consequential damages arising from the use or operation 
-- of the designs or accompanying documentation, however caused and on any 
-- theory of liability. This limitation will apply even if Xilinx has been 
-- advised of the possibility of such damage. This limitation shall apply 
-- not-withstanding the failure of the essential purpose of any limited remedies
-- herein.
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
----------------------------------------------------------------------------------
-- 
-- This module does a 18-bit CRC calculation.
-- 
-- The calculation is the SMPTE292M defined CRC18 calculation with a polynomial 
-- of x^18 + x^5 + x^4 + 1. The function considers the LSB of the video data as 
-- the first bit shifted into the CRC generator, although the implementation 
-- given here is a fully parallel CRC, calculating all 18 CRC bits from the 
-- 10-bit video data in one clock cycle.  
-- 
-- The clr input must be asserted coincident with the first input data word of
-- a new CRC calculation. The clr input forces the old CRC value stored in the
-- module's crc_reg to be discarded and a new calculation begins as if the old 
-- CRC value had been cleared to zero.
--
--This module is the same as hdsdi_crc, but adds an enable input in addition to
--the clock enable.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity hdsdi_crc2 is
    port (
        clk:        in  std_logic;              -- word rate clock (74.25 MHz)
        ce:         in  std_logic;              -- clock enable
        en:         in  std_logic;              -- enable input
        rst:        in  std_logic;              -- async reset
        clr:        in  std_logic;              -- assert during first cycle of CRC calc
        d:          in  xavb_data_stream_type;  -- video word input
        crc_out:    out xavb_hd_crc18_type);    -- CRC output value
end hdsdi_crc2;

architecture synth of hdsdi_crc2 is

-------------------------------------------------------------------------------
-- Signal definitions
--
signal x10 :    std_logic;      -- intermediate results
signal x9 :     std_logic;
signal x8 :     std_logic;
signal x7 :     std_logic;
signal x6 :     std_logic;
signal x5 :     std_logic;
signal x4 :     std_logic;
signal x3 :     std_logic;
signal x2 :     std_logic;
signal x1 :     std_logic;
signal newcrc : xavb_hd_crc18_type;                     -- input to CRC register
signal crc :    xavb_hd_crc18_type;                     -- output of crc_reg unless clr is asserted, then 0
signal crc_reg: xavb_hd_crc18_type := (others => '0');  -- internal CRC reg

begin

    --
    -- The previous CRC value is represented by the variable crc. This value is
    -- combined with the new data word to form the new CRC value. Normally, crc is
    -- equal to the contents of the crc_reg. However, if the clr input is asserted,
    -- the crc value is set to all zeros.
    --
    crc <= (others => '0') when clr = '1' else crc_reg;

    --
    -- The x variables are intermediate terms used in the new CRC calculation.
    --                             
    x10 <= d(9) xor crc(9);
    x9  <= d(8) xor crc(8);
    x8  <= d(7) xor crc(7);
    x7  <= d(6) xor crc(6);
    x6  <= d(5) xor crc(5);
    x5  <= d(4) xor crc(4);
    x4  <= d(3) xor crc(3);
    x3  <= d(2) xor crc(2);
    x2  <= d(1) xor crc(1);
    x1  <= d(0) xor crc(0);

    --
    -- These assignments generate the new CRC value.
    --
    newcrc(0)  <= crc(10);
    newcrc(1)  <= crc(11);
    newcrc(2)  <= crc(12);
    newcrc(3)  <= x1   xor crc(13);
    newcrc(4)  <= (x2  xor x1) xor crc(14);
    newcrc(5)  <= (x3  xor x2) xor crc(15);
    newcrc(6)  <= (x4  xor x3) xor crc(16);
    newcrc(7)  <= (x5  xor x4) xor crc(17);
    newcrc(8)  <= (x6  xor x5) xor x1;
    newcrc(9)  <= (x7  xor x6) xor x2;
    newcrc(10) <= (x8  xor x7) xor x3;
    newcrc(11) <= (x9  xor x8) xor x4;
    newcrc(12) <= (x10 xor x9) xor x5;
    newcrc(13) <= x10 xor x6;
    newcrc(14) <= x7;
    newcrc(15) <= x8;
    newcrc(16) <= x9;
    newcrc(17) <= x10;

    --
    -- This is the crc_reg. On each clock cycle when ce is asserted, it loads 
    -- the newcrc value. The module's crc_out vector is always assigned to the 
    -- contents of the crc_reg.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            crc_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                if en = '1' then
                    crc_reg <= newcrc;
                end if;
            end if;
        end if;
    end process;

    crc_out <= crc_reg;

end synth;