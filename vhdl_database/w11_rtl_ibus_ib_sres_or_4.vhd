-- $Id: ib_sres_or_4.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2007-2010 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    ib_sres_or_4 - syn
-- Description:    ibus: result or, 4 input
--
-- Dependencies:   -
-- Test bench:     tb/tb_pdp11_core (implicit)
-- Target Devices: generic
-- Tool versions:  ise 8.1-14.7; viv 2014.4; ghdl 0.18-0.31
--
-- Revision History: 
-- Date         Rev Version  Comment
-- 2010-10-23   335   1.1    add ib_sres_or_mon
-- 2008-08-22   161   1.0.2  renamed pdp11_ibres_ -> ib_sres_; use iblib
-- 2008-01-05   110   1.0.1  rename IB_MREQ(ena->req) SRES(sel->ack, hold->busy)
-- 2007-12-29   107   1.0    Initial version 
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.slvtypes.all;
use work.iblib.all;

-- ----------------------------------------------------------------------------

entity ib_sres_or_4 is                  -- ibus result or, 4 input
  port (
    IB_SRES_1 :  in ib_sres_type;                 -- ib_sres input 1
    IB_SRES_2 :  in ib_sres_type := ib_sres_init; -- ib_sres input 2
    IB_SRES_3 :  in ib_sres_type := ib_sres_init; -- ib_sres input 3
    IB_SRES_4 :  in ib_sres_type := ib_sres_init; -- ib_sres input 4
    IB_SRES_OR : out ib_sres_type       -- ib_sres or'ed output
  );
end ib_sres_or_4;

architecture syn of ib_sres_or_4 is
  
begin

  proc_comb : process (IB_SRES_1, IB_SRES_2, IB_SRES_3, IB_SRES_4)
  begin

    IB_SRES_OR.ack  <= IB_SRES_1.ack or
                       IB_SRES_2.ack or
                       IB_SRES_3.ack or
                       IB_SRES_4.ack;
    IB_SRES_OR.busy <= IB_SRES_1.busy or
                       IB_SRES_2.busy or
                       IB_SRES_3.busy or
                       IB_SRES_4.busy;
    IB_SRES_OR.dout <= IB_SRES_1.dout or
                       IB_SRES_2.dout or
                       IB_SRES_3.dout or
                       IB_SRES_4.dout;
    
  end process proc_comb;

-- synthesis translate_off
  ORMON : ib_sres_or_mon
    port map (
      IB_SRES_1 => IB_SRES_1,
      IB_SRES_2 => IB_SRES_2,
      IB_SRES_3 => IB_SRES_3,
      IB_SRES_4 => IB_SRES_4
    );
-- synthesis translate_on
  
end syn;
