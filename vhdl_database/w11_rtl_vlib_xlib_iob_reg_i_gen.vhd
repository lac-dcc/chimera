-- $Id: iob_reg_i_gen.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2007- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    iob_reg_i_gen - syn
-- Description:    Registered IOB, input only, vector
--
-- Dependencies:   -
-- Test bench:     -
-- Target Devices: generic Spartan, Virtex
-- Tool versions:  ise 8.1-14.7; viv 2014.4; ghdl 0.18-0.31
-- Revision History: 
-- Date         Rev Version  Comment
-- 2007-12-16   101   1.0.1  add INIT generic port
-- 2007-12-08   100   1.0    Initial version 
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.slvtypes.all;
use work.xlib.all;

entity iob_reg_i_gen is                 -- registered IOB, input, vector
  generic (
    DWIDTH : positive := 16;            -- data port width
    INIT : slbit := '0');               -- initial state
  port (
    CLK  : in slbit;                    -- clock
    CE   : in slbit := '1';             -- clock enable
    DI   : out slv(DWIDTH-1 downto 0);  -- input data
    PAD  : in slv(DWIDTH-1 downto 0)    -- i/o pad
  );
end iob_reg_i_gen;


architecture syn of iob_reg_i_gen is

  signal R_DI  : slv(DWIDTH-1 downto 0) := (others=>INIT);

  attribute iob : string;
  attribute iob of R_DI : signal is "true";

begin

  proc_regs: process (CLK)
  begin
    if rising_edge(CLK) then
      if CE = '1' then
        R_DI <= PAD;
      end if;
    end if;
  end process proc_regs;

  DI <= R_DI;
  
end syn;
