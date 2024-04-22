-- $Id: tb_tst_serloop2_n4d.vhd 1181 2019-07-08 17:00:50Z mueller $
-- SPDX-License-Identifier: GPL-3.0-or-later
-- Copyright 2017-2018 by Walter F.J. Mueller <W.F.J.Mueller@gsi.de>
--
------------------------------------------------------------------------------
-- Module Name:    tb_tst_serloop2_n4d - sim
-- Description:    Test bench for sys_tst_serloop2_n4d
--
-- Dependencies:   simlib/simclk
--                 xlib/sfs_gsim_core
--                 sys_tst_serloop2_n4d [UUT]
--                 tb/tb_tst_serloop
--
-- To test:        sys_tst_serloop2_n4d
--
-- Target Devices: generic
--
-- Revision History: 
-- Date         Rev Version  Comment
-- 2018-11-03  1064   1.0.1  use sfs_gsim_core
-- 2017-01-04   838   1.0    Initial version (cloned from tb_tst_serloop2_n4)
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

use work.slvtypes.all;
use work.xlib.all;
use work.simlib.all;
use work.sys_conf.all;

entity tb_tst_serloop2_n4d is
end tb_tst_serloop2_n4d;

architecture sim of tb_tst_serloop2_n4d is
  
  signal CLK100 : slbit := '0';
  
  signal CLKS : slbit := '0';
  signal CLKH : slbit := '0';

  signal I_RXD : slbit := '1';
  signal O_TXD : slbit := '1';
  signal O_RTS_N : slbit := '0';
  signal I_CTS_N : slbit := '0';
  signal I_SWI : slv16 := (others=>'0');
  signal I_BTN : slv5 := (others=>'0');

  signal RXD : slbit := '1';
  signal TXD : slbit := '1';
  signal RTS_N : slbit := '0';
  signal CTS_N : slbit := '0';
  signal SWI : slv16 := (others=>'0');
  signal BTN : slv5 := (others=>'0');
  
  constant clock_period : Delay_length :=   10 ns;
  constant clock_offset : Delay_length :=  200 ns;
  constant delay_time :   Delay_length :=    2 ns;
  
begin

  SYSCLK : simclk
    generic map (
      PERIOD => clock_period,
      OFFSET => clock_offset)
    port map (
      CLK       => CLK100
    );

  GEN_CLKSYS : sfs_gsim_core
    generic map (
      VCO_DIVIDE     => sys_conf_clksys_vcodivide,
      VCO_MULTIPLY   => sys_conf_clksys_vcomultiply,
      OUT_DIVIDE     => sys_conf_clksys_outdivide)
    port map (
      CLKIN   => CLK100,
      CLKFX   => CLKH,
      LOCKED  => open
    );
  
  GEN_CLKSER : sfs_gsim_core
    generic map (
      VCO_DIVIDE     => sys_conf_clkser_vcodivide,
      VCO_MULTIPLY   => sys_conf_clkser_vcomultiply,
      OUT_DIVIDE     => sys_conf_clkser_outdivide)
    port map (
      CLKIN   => CLK100,
      CLKFX   => CLKS,
      LOCKED  => open
    );
  
  UUT : entity work.sys_tst_serloop2_n4d
    port map (
      I_CLK100     => CLK100,
      I_RXD        => I_RXD,
      O_TXD        => O_TXD,
      O_RTS_N      => O_RTS_N,
      I_CTS_N      => I_CTS_N,
      I_SWI        => I_SWI,
      I_BTN        => I_BTN,
      I_BTNRST_N   => '1',
      O_LED        => open,
      O_RGBLED0    => open,
      O_RGBLED1    => open,
      O_ANO_N      => open,
      O_SEG_N      => open
    );

  GENTB : entity work.tb_tst_serloop
    port map (
      CLKS      => CLKS,
      CLKH      => CLKH,
      P0_RXD    => RXD,
      P0_TXD    => TXD,
      P0_RTS_N  => RTS_N,
      P0_CTS_N  => CTS_N,
      P1_RXD    => open,                -- port 1 unused for n4d !
      P1_TXD    => '0',
      P1_RTS_N  => '0',
      P1_CTS_N  => open,
      SWI       => SWI(7 downto 0),
      BTN       => BTN(3 downto 0)
    );

  I_RXD        <= RXD          after delay_time;
  TXD          <= O_TXD        after delay_time;
  RTS_N        <= O_RTS_N      after delay_time;
  I_CTS_N      <= CTS_N        after delay_time;

  I_SWI <= SWI after delay_time;
  I_BTN <= BTN after delay_time;

end sim;
