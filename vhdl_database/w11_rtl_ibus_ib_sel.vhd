-- $Id: ib_sel.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2010- by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    ib_sel - syn
-- Description:    ibus: address select logic
--
-- Dependencies:   -
-- Test bench:     tb/tb_pdp11_core (implicit)
-- Target Devices: generic
-- Tool versions:  ise 12.1-14.7; viv 2014.4; ghdl 0.29-0.31
--
-- Revision History: 
-- Date         Rev Version  Comment
-- 2010-10-23   335   1.0    Initial version (derived from rritb_sres_or_mon)
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.slvtypes.all;
use work.iblib.all;

-- ----------------------------------------------------------------------------

entity ib_sel is                        -- ibus address select logic
  generic (
    IB_ADDR : slv16;                    -- ibus address base
    SAWIDTH : natural := 0);            -- device subaddress space width
  port (
    CLK : in slbit;                     -- clock
    IB_MREQ :  in ib_mreq_type;         -- ibus request
    SEL : out slbit                     -- select state bit
  );
end ib_sel;

architecture syn of ib_sel is
  signal R_SEL : slbit := '0';  
begin

  assert SAWIDTH<=10                    -- at most 1k words devices
    report "assert(SAWIDTH<=10)" severity failure;
   
  proc_regs: process (CLK)
    variable isel : slbit := '0';
  begin
    if rising_edge(CLK) then
      isel := '0';
      if IB_MREQ.aval='1' and
        IB_MREQ.addr(12 downto SAWIDTH+1)=IB_ADDR(12 downto SAWIDTH+1) then
        isel := '1';
      end if;
      R_SEL <= isel;
    end if;
  end process proc_regs;

  SEL <= R_SEL;
  
end syn;
