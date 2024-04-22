-------------------------------------------------------------------------------- 
-- Copyright (c) 2007 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: wide_SRLC16E.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2007-08-08 13:41:53-06 $
-- /___/   /\    Date Created: May 1, 2007
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: wide_SRLC16E.vhd,rcs $
-- Revision 1.0  2007-08-08 13:41:53-06  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs. Xilinx and its licensors make 
-- and you receive no warranties or conditions, express, implied, statutory or 
-- otherwise, and Xilinx specifically disclaims any implied warranties of 
-- merchantability, non-infringement, or fitness for a particular purpose. 
-- Xilinx does not warrant that the functions contained in these designs will 
-- meet your requirements, or that the operation of these designs will be 
-- uninterrupted or error free, or that defects in the Designs will be 
-- corrected. Furthermore, Xilinx does not warrant or make any representations 
-- regarding use or the results of the use of the designs in terms of 
-- correctness, accuracy, reliability, or otherwise. The designs are not covered
-- by any other agreement that you may have with Xilinx. 
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
-- This module implements a wide 16 deep SRL function with dynamically adjusted 
-- depth of 1 to 16. The width of the function is control by the generic
-- WIDTH. 
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

library unisim; 
use unisim.vcomponents.all; 

entity wide_SRLC16E is
    generic (
        WIDTH:  integer := 10);
    port (
        clk:    in  std_logic;                          -- clock input
        ce:     in  std_logic;                          -- clock enable
        d:      in  std_logic_vector(WIDTH-1 downto 0); -- input bus
        a:      in  std_logic_vector(3 downto 0);       -- depth control
        q:      out std_logic_vector(WIDTH-1 downto 0));-- output bus
end wide_SRLC16E;

architecture xilinx of wide_SRLC16E is

begin

    genloop: for i in 0 to WIDTH-1 generate
        
        X0: SRLC16E 
            generic map (
                INIT    => "0000000000000000")
            port map (
                 Q      => q(i),
                 Q15    => open,
                 A0     => a(0),
                 A1     => a(1),
                 A2     => a(2),
                 A3     => a(3),
                 CE     => ce,
                 CLK    => clk,
                 D      => d(i));
    end generate;
    
end xilinx;
