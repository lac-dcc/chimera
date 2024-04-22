-- $Id: tb_w11a_n3.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2011-2013 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    tb_w11a_n3
-- Description:    Configuration for tb_w11a_n3 for tb_nexys3_fusp_cuff
--
-- Dependencies:   sys_w11a_n3
--
-- To test:        sys_w11a_n3
--
-- Verified (with (#1) ../../tb/tb_rritba_pdp11core_stim.dat
--                (#2) ../../tb/tb_pdp11_core_stim.dat):
-- Date         Rev  Code  ghdl  ise          Target     Comment
-- 2011-11-25   295  -     -.--  -            -          -:-- 
-- 
-- Revision History: 
-- Date         Rev Version  Comment
-- 2013-04-21   509   1.1    now based on tb_nexys3_fusp_cuff
-- 2011-11-25   432   1.0    Initial version (cloned from _n2)
------------------------------------------------------------------------------

configuration tb_w11a_n3 of tb_nexys3_fusp_cuff is

  for sim
    for all : nexys3_fusp_cuff_aif
      use entity work.sys_w11a_n3;
    end for;
  end for;

end tb_w11a_n3;
