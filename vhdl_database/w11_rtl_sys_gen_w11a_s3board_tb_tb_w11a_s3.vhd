-- $Id: tb_w11a_s3.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2007-2010 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    tb_w11a_s3
-- Description:    Configuration for tb_w11a_s3 for tb_s3board_fusp
--
-- Dependencies:   sys_w11a_s3
--
-- To test:        sys_w11a_s3
--
-- Verified (with (#1) ../../tb/tb_rritba_pdp11core_stim.dat
--                (#2) ../../tb/tb_pdp11_core_stim.dat):
-- Date         Rev  Code  ghdl  ise          Target     Comment
-- 2007-11-23    97  _tsim 0.26  9.1    J30   xc3s1000   d:ok (#2) 91497s; 632m
-- 2007-11-23    97  _tsim 0.26  9.1    J30   xc3s1000   d:ok (#1)  3356s; 632m
-- 2007-11-23    97  _ssim 0.26  8.1.03 I27   xc3s1000   c:ok (#2)  2227s
-- 2007-11-23    97  _ssim 0.26  8.1.03 I27   xc3s1000   c:ok (#1)    82s
-- 2007-10-21    91  -     0.26  -            -          d:ok (#2)
-- 2007-10-19    90  -     0.26  -            -          d:ok (#2)
-- 2007-10-19    90  -     0.26  -            -          d:ok (#1)
-- 
-- Revision History: 
-- Date         Rev Version  Comment
-- 2010-05-26   295   1.1.2  rename tb_s3board_pdp11core -> tb_w11a_s3
-- 2010-05-16   291   1.1.1  use now tb_s3board_fusp
-- 2010-05-02   287   1.1    use now tb_s3board_usp
-- 2007-09-23    84   1.0    Initial version 
------------------------------------------------------------------------------

configuration tb_w11a_s3 of tb_s3board_fusp is

  for sim
    for all : s3board_fusp_aif
      use entity work.sys_w11a_s3;
    end for;
  end for;

end tb_w11a_s3;
