-- $Id: tb_w11a_n2.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2010-2013 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    tb_w11a_n2
-- Description:    Configuration for tb_w11a_n2 for tb_nexys2_fusp_cuff
--
-- Dependencies:   sys_w11a_n2
--
-- To test:        sys_w11a_n2
--
-- Verified (with (#1) ../../tb/tb_rritba_pdp11core_stim.dat
--                (#2) ../../tb/tb_pdp11_core_stim.dat):
-- Date         Rev  Code  ghdl  ise          Target     Comment
-- 2010-05-28   295  -     -.--  -            -          -:-- 
-- 
-- Revision History: 
-- Date         Rev Version  Comment
-- 2013-04-21   509   1.1    now based on tb_nexys2_fusp_cuff
-- 2010-05-26   295   1.0    Initial version (cloned from _s3)
------------------------------------------------------------------------------

configuration tb_w11a_n2 of tb_nexys2_fusp_cuff is

  for sim
    for all : nexys2_fusp_cuff_aif
      use entity work.sys_w11a_n2;
    end for;
  end for;

end tb_w11a_n2;
