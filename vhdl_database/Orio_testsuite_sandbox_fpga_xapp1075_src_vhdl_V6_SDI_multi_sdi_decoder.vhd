-------------------------------------------------------------------------------- 
-- Copyright (c) 2008 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Solutions Development Group, Xilinx, Inc.
--  \   \        Filename: $RCSfile: multi_sdi_decoder.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2008-11-14 11:26:11-07 $
-- /___/   /\    Date Created: May 21, 2004
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: multi_sdi_decoder.vhd,rcs $
-- Revision 1.2  2008-11-14 11:26:11-07  jsnow
-- Added register initializers.
--
-- Revision 1.1  2004-08-23 13:24:04-06  jsnow
-- Comment changes only.
--
-- Revision 1.0  2004-05-21 15:47:48-06  jsnow
-- Initial Revision
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
-- This is a multi-rate SDI decoder module that supports both SD-SDI (SMPTE 
-- 259M)and HD-SDI (SMPTE 292M).
-- 
-- SDI specifies that the serial bit stream shall be encoded in two ways. First,
-- a generator polynomial of x^9 + x^4 + 1 is used to generate a scrambled NRZ 
-- bit sequence. Next, a generator polynomial of x + 1 is used to produce the 
-- final polarity free NRZI sequence which is transmitted over the physical 
-- layer.
-- 
-- The decoder module described in this file sits at the receiving end of the
-- SDI link and reverses the two encoding steps to extract the original data. 
-- First, the x + 1 generator polynomial is used to convert the bit stream from 
-- NRZI to NRZ. Next, the x^9 + x^4 + 1 generator polynomial is used to 
-- descramble the data.
-- 
-- When running in HD-SDI mode (hd_sd = 0), 20 bits are decoded every clock 
-- cycle. When running in SD-SDI mode (hd_sd = 1), the 10-bit SD-SDI data must 
-- be placed on the MS 10 bits of the d port. Ten bits are decoded every clock 
-- cycle and the decoded 10 bits are output on the 10 MS bits of the q port.
-- 
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.hdsdi_pkg.all;

entity multi_sdi_decoder is
    port (
        clk:        in  std_logic;      -- word rate clock (74.25 MHz)
        rst:        in  std_logic;      -- async reset
        ce:         in  std_logic;      -- clock enable
        hd_sd:      in  std_logic;      -- 0 = HD, 1 = SD
        d:          in  hd_vid20_type;  -- input data port
        q:          out hd_vid20_type); -- output data port
end multi_sdi_decoder;

architecture synth of multi_sdi_decoder is

--
-- Signal definitions
--
signal prev_d19 :   std_logic := '0';                               -- previous d[19] bit
signal prev_nrz :   std_logic_vector(8 downto 0) := (others => '0');-- holds 9 MSB from NRZI-to-NRZ for use in next clock cycle
signal out_reg :    hd_vid20_type := (others => '0');               -- output register
signal desc_wide :  std_logic_vector(28 downto 0);                  -- concat of two input words used by descrambler
signal nrz :        hd_vid20_type;                                  -- output of NRZI-to-NRZ converter
signal nrz_in :     hd_vid20_type;                                  -- input to NRZI-to-NRZ converter

begin
    --
    -- prev_d19 register
    --
    -- This register holds the MSB of the previous clock period's input port
    -- contents so that a 21-bit input vector is available to the NRZI-to-NRZ 
    -- converter.
    -- 
    process(clk, rst)
    begin
        if rst = '1' then
            prev_d19 <= '0';
        elsif clk'event and clk = '1' then
            if ce = '1' then
                prev_d19 <= d(19);
            end if;
        end if;
    end process;

    --
    -- NRZI-to-NRZ converter
    --
    -- The 20 XOR gates generated by this statement convert the 21-bit wide
    -- nrzi data to 20 bits of NRZ data. Each bit from the in_reg is XORed with
    -- the bit that preceeded it in the bit stream. The LSB of d is XORed with 
    -- the MSB of in_reg from the previous clock period that is held in the 
    -- prev_d19 register. If only 10 bits are being decoded (SD-SDI mode) then
    -- the prev_d19 bit must be XORed with bit 10 instead of bit 0 and the
    -- LS 10 bits out of this block are not used.
    --
    nrz_in(19 downto 11) <= d(18 downto 10);
    nrz_in(10)           <= prev_d19 when hd_sd = '1' else d(9);
    nrz_in(9 downto 1)   <= d(8 downto 0);
    nrz_in(0)            <= prev_d19;

    nrz <= d xor nrz_in;

    --
    -- prev_nrz Input register of the descrambler
    --
    -- This register is a pipeline delay register which loads from the output of
    -- the NRZI-to-NRZ converter. It only holds the nine MSBs from the converter
    -- which get combined with 20-bits coming from the converter on the next 
    -- clock cycle to form a 29-bit wide input vector to the descrambler.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            prev_nrz <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                prev_nrz <= nrz(19 downto 11);
            end if;
        end if;
    end process;

    --
    -- The desc_wide vector is the input to the descrambler below. This vector
    -- differs between HD-SDI mode and SD-SDI mode since the LS bits from the
    -- NRZI-to-NRZ converter are not valid in SD-SDI mode.
    --
    desc_wide(28 downto 19) <= nrz(19 downto 10);
    desc_wide(18 downto 10) <= prev_nrz  when hd_sd = '1' else nrz(9 downto 1);
    desc_wide(9)            <= nrz(0);
    desc_wide(8 downto 0)   <= prev_nrz;

    -- 
    -- Descrambler
    --
    -- A for loop is used to generate the HD-SDI x^9 + x^4 + 1 polynomial for 
    -- each of the 20-bits to be output using the 29-bit desc_wide input vector 
    -- that is made up of the contents of the prev_nrz register and the output 
    -- of the NRZI-to-NRZ converter.
    --
    process(clk, rst)
    begin
        if rst = '1' then
            out_reg <= (others => '0');
        elsif clk'event and clk = '1' then
            if ce = '1' then
                for i in 0 to 19 loop
                    out_reg(i) <= (desc_wide(i) xor desc_wide(i + 4)) xor 
                                   desc_wide(i + 9);
                end loop;
            end if;
        end if;
    end process;
            
    q <= out_reg;

end synth;