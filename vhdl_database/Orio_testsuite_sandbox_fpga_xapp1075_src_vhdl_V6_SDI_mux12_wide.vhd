-------------------------------------------------------------------------------- 
-- Copyright (c) 2009 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: mux12_wide.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2009-03-11 15:27:56-06 $
-- /___/   /\    Date Created: January 8, 2009
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: mux12_wide.vhd,rcs $
-- Revision 1.0  2009-03-11 15:27:56-06  jsnow
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
-- This module implements an 11-bit wide mux function optimized to use the
-- LUT6 and CLB mux functions.The width of the function is control by
-- the generic WIDTH. 
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim; 
use unisim.vcomponents.all; 

entity mux12_wide is
    generic (
        WIDTH:  integer := 10);
    port (
        d0 :    in  std_logic_vector(WIDTH-1 downto 0);
        d1 :    in  std_logic_vector(WIDTH-1 downto 0);
        d2 :    in  std_logic_vector(WIDTH-1 downto 0);
        d3 :    in  std_logic_vector(WIDTH-1 downto 0);
        d4 :    in  std_logic_vector(WIDTH-1 downto 0);
        d5 :    in  std_logic_vector(WIDTH-1 downto 0);
        d6 :    in  std_logic_vector(WIDTH-1 downto 0);
        d7 :    in  std_logic_vector(WIDTH-1 downto 0);
        d8 :    in  std_logic_vector(WIDTH-1 downto 0);
        d9 :    in  std_logic_vector(WIDTH-1 downto 0);
        d10 :   in  std_logic_vector(WIDTH-1 downto 0);
        d11 :   in  std_logic_vector(WIDTH-1 downto 0);
        sel :   in  std_logic_vector(3 downto 0);
        y :     out std_logic_vector(WIDTH-1 downto 0));
end mux12_wide;

architecture xilinx of mux12_wide is

signal lut0_o : std_logic_vector(WIDTH-1 downto 0);
signal lut1_o : std_logic_vector(WIDTH-1 downto 0);
signal lut2_o : std_logic_vector(WIDTH-1 downto 0);
signal mux0_o : std_logic_vector(WIDTH-1 downto 0);
signal mux1_o : std_logic_vector(WIDTH-1 downto 0);

begin

    genloop: for i in 0 to WIDTH-1 generate
        
        LUT0: LUT6_L
            generic map (
                INIT    => X"FF00F0F0CCCCAAAA")
            port map (
                 LO     => lut0_o(i),
                 I0     => d0(i),
                 I1     => d1(i),
                 I2     => d2(i),
                 I3     => d3(i),
                 I4     => sel(0),
                 I5     => sel(1));

        LUT1: LUT6_L
            generic map (
                INIT    => X"FF00F0F0CCCCAAAA")
            port map (
                 LO     => lut1_o(i),
                 I0     => d4(i),
                 I1     => d5(i),
                 I2     => d6(i),
                 I3     => d7(i),
                 I4     => sel(0),
                 I5     => sel(1));

        MUX0: MUXF7
            port map (
                O       => mux0_o(i),
                I0      => lut0_o(i),
                I1      => lut1_o(i),
                S       => sel(2));

        LUT2: LUT6_L
            generic map (
                INIT    => X"FF00F0F0CCCCAAAA")
            port map (
                 LO     => lut2_o(i),
                 I0     => d8(i),
                 I1     => d9(i),
                 I2     => d10(i),
                 I3     => d11(i),
                 I4     => sel(0),
                 I5     => sel(1));

        MUX2: MUXF8
            port map (
                O       => y(i),
                I0      => mux0_o(i),
                I1      => lut2_o(i),
                S       => sel(3));

    end generate;
    
end xilinx;
