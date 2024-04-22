------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
-------------------------------------------------------------------------------
--  Copyright (C) 2009-2013, Aeroflex Gaisler AB
-------------------------------------------------------------------------------
-- Entity:      spw_2x_lvttl_pads
-- File:        spw_2x_lvttl_pads.vhd
-- Author:      Marko Isomaki, Aeroflex Gaisler
-- Contact:     support@gaisler.com
-- Description: pads for SpW signals in router ASIC LVTTL ports
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.config.all;

library techmap;
use techmap.gencomp.all;

library grlib;
use grlib.stdlib.conv_std_logic;

entity spw_lvttl_pads is
  generic (
    padtech       : integer := 0;
    oepol         : integer := 0;
    level         : integer := 0;
    voltage       : integer := 0;
    filter        : integer := 0;
    strength      : integer := 4;
    slew          : integer := 0;
    input_type    : integer := 0 
  );
  port (
    ---------------------------------------------------------------------------
    -- Signals going off-chip
    ---------------------------------------------------------------------------
    spw_rxd       : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_rxs       : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txd       : out std_logic_vector(0 to CFG_SPW_NUM-1);
    spw_txs       : out std_logic_vector(0 to CFG_SPW_NUM-1);
    ---------------------------------------------------------------------------
    -- Signals to core
    ---------------------------------------------------------------------------
    lspw_rxd      : out std_logic_vector(0 to CFG_SPW_NUM-1);
    lspw_rxs      : out std_logic_vector(0 to CFG_SPW_NUM-1);
    lspw_txd      : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    lspw_txs      : in  std_logic_vector(0 to CFG_SPW_NUM-1)
  );
end entity;

architecture rtl of spw_lvttl_pads is
begin
  ------------------------------------------------------------------------------
  -- SpW port pads
  ------------------------------------------------------------------------------
  spw_pads : for i in 0 to CFG_SPW_NUM-1 generate
   spw_pad_input: if input_type <= 3 generate
    spw_rxd_pad : inpad
      generic map (
        tech     => padtech,
        level    => level,
        voltage  => voltage,
        filter   => filter,
        strength => strength)
      port map (
        pad      => spw_rxd(i),
        o        => lspw_rxd(i));

    spw_rxs_pad : inpad
      generic map (
        tech     => padtech,
        level    => level,
        voltage  => voltage,
        filter   => filter,
        strength => strength)
      port map (
        pad      => spw_rxs(i),
        o        => lspw_rxs(i));
   end generate;
   spw_no_pad_input: if input_type >= 4 generate
      lspw_rxd(i) <= spw_rxd(i);
      lspw_rxs(i) <= spw_rxs(i);
   end generate;
    
    spw_txd_pad : outpad
      generic map (
        tech     => padtech,
        level    => level,
        slew     => slew,
        voltage  => voltage,
        strength => strength)
      port map (
        pad      => spw_txd(i),
        i        => lspw_txd(i));
    
    spw_txs_pad : outpad
      generic map (
        tech     => padtech,
        level    => level,
        slew     => slew,
        voltage  => voltage,
        strength => strength)
      port map (
        pad      => spw_txs(i),
        i        => lspw_txs(i));
  end generate;
   
end;

