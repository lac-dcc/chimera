-- $Id: crc16.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2014- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    crc16 - syn
-- Description:    16bit CRC generator, use CCITT polynomial
--                      x^16 + x^12 + x^5 + 1   (0x1021)
--
--
-- Dependencies:   -
-- Test bench:     -
-- Target Devices: generic
-- Tool versions:  ise 14.7; viv 2014.4; ghdl 0.31
--
-- Synthesized (xst):
-- Date         Rev  ise         Target      flop lutl lutm slic t peri
-- 2014-09-27   595 14.7  131013 xc6slx16-2    16   16    -    4
--
-- Revision History: 
-- Date         Rev Version  Comment
-- 2014-09-27   595   1.0    Initial version 
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.slvtypes.all;
use work.comlib.all;

entity crc16 is                         -- crc-16 generator, checker
  generic (
    INIT: slv16 := (others=>'0'));      -- initial state of crc register
  port (
    CLK : in slbit;                     -- clock
    RESET : in slbit;                   -- reset
    ENA : in slbit;                     -- update enable
    DI : in slv8;                       -- input data
    CRC : out slv16                     -- crc code
  );
end crc16;


architecture syn of crc16 is
  signal R_CRC : slv16 := INIT;         -- state registers
begin

  proc_regs: process (CLK)
  begin

    if rising_edge(CLK) then
      if RESET = '1' then
        R_CRC <= INIT;
      else
        if ENA = '1' then
          R_CRC <= crc16_update(R_CRC, DI);
        end if;
      end if;
    end if;

  end process proc_regs;

  CRC <= R_CRC;
  
end syn;
