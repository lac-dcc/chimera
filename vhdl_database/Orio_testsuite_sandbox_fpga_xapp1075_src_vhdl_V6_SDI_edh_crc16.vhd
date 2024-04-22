-------------------------------------------------------------------------------- 
-- Copyright (c) 2004 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow, Advanced Product Division, Xilinx, Inc.
--  \   \        Filename: $RCSfile: edh_crc16.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2005-01-18 10:41:23-07 $
-- /___/   /\    Date Created: May 8, 2002 
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: edh_crc16.vhd,rcs $
-- Revision 1.0  2005-01-18 10:41:23-07  jsnow
-- Header update.
--
-------------------------------------------------------------------------------- 
--   
--   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" 
--   AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND 
--   SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, 
--   OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, 
--   APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION 
--   THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT, 
--   AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE 
--   FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY 
--   WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE 
--   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR 
--   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF 
--   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
--   FOR A PARTICULAR PURPOSE. 
--
-------------------------------------------------------------------------------- 
--
-- This module does a 16-bit CRC calculation.
-- 
-- The calculation is a standard CRC16 calculation with a polynomial of x^16 + x^12
-- + x^5 + 1. The function considers the LSB of the video data as the first bit
-- shifted into the CRC generator, although the implementation given here is a
-- fully parallel CRC, calculating all 16 CRC bits from the 10-bit video data in
-- one clock cycle.  
-- 
-- The assignment statements have all be optimized to use 4-input XOR gates
-- wherever possible to fit efficiently in the Xilinx FPGA architecture.
-- 
-- There are two input ports: c and d. The 16-bit c port must be connected to the
-- CRC "accumulation" register hold the last calculated CRC value. The 10-bit d
-- port is connected to the video stream.
-- 
-- The output port, crc, must be connected to the input of CRC "accumulation"
-- register.
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

use work.anc_edh_pkg.all;

entity edh_crc16 is
    port (
        c:      in    crc16_type;       -- current CRC value
        d:      in    video_type;       -- input data word
        crc:    inout crc16_type);      -- new calculated CRC value
end;

architecture synth of edh_crc16 is

-------------------------------------------------------------------------------
-- Signal definitions
--
signal t1:      std_ulogic;     -- intermediate product term used several times


begin
    
    t1 <= d(4) xor c(4) xor d(0) xor c(0);

    crc(0)  <= c(10) xor crc(12);
    crc(1)  <= c(11) xor d(0) xor c(0) xor crc(13);
    crc(2)  <= c(12) xor d(1) xor c(1) xor crc(14);
    crc(3)  <= c(13) xor d(2) xor c(2) xor crc(15);
    crc(4)  <= c(14) xor d(3) xor c(3);
    crc(5)  <= c(15) xor t1;
    crc(6)  <= d(0)  xor c(0) xor crc(11);
    crc(7)  <= d(1)  xor c(1) xor crc(12);
    crc(8)  <= d(2)  xor c(2) xor crc(13);
    crc(9)  <= d(3)  xor c(3) xor crc(14);
    crc(10) <= t1    xor crc(15);
    crc(11) <= d(5)  xor c(5) xor d(1) xor c(1);
    crc(12) <= d(6)  xor c(6) xor d(2) xor c(2);
    crc(13) <= d(7)  xor c(7) xor d(3) xor c(3);
    crc(14) <= d(8)  xor c(8) xor t1;
    crc(15) <= d(9)  xor c(9) xor crc(11);

end synth;