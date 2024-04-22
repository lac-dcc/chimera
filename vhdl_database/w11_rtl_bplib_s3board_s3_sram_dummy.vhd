-- $Id: s3_sram_dummy.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2007-2010 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
-- 
------------------------------------------------------------------------------
-- Module Name:    s3_sram_dummy - syn
-- Description:    s3board: SRAM protection dummy
--
-- Dependencies:   -
-- Test bench:     -
-- Target Devices: generic
-- Tool versions:  xst 8.1-14.7; ghdl 0.18-0.31
-- Revision History: 
-- Date         Rev Version  Comment
-- 2010-04-17   278   1.0.2  renamed from sram_dummy
-- 2007-12-09   101   1.0.1  use _N for active low
-- 2007-12-08   100   1.0    Initial version 
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.slvtypes.all;

entity s3_sram_dummy is                 -- SRAM protection dummy
  port (
    O_MEM_CE_N : out slv2;              -- sram: chip enables  (act.low)
    O_MEM_BE_N : out slv4;              -- sram: byte enables  (act.low)
    O_MEM_WE_N : out slbit;             -- sram: write enable  (act.low)
    O_MEM_OE_N : out slbit;             -- sram: output enable (act.low)
    O_MEM_ADDR  : out slv18;            -- sram: address lines
    IO_MEM_DATA : inout slv32           -- sram: data lines
  );
end s3_sram_dummy;


architecture syn of s3_sram_dummy is
begin

  O_MEM_CE_N <= "11";                   -- disable sram chips
  O_MEM_BE_N <= "1111";
  O_MEM_WE_N <= '1';
  O_MEM_OE_N <= '1';
  O_MEM_ADDR  <= (others=>'0');
  IO_MEM_DATA <= (others=>'0');
  
end syn;
