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
-----------------------------------------------------------------------------
-- Entity: 	gr1553b_pads
-- File:	gr1553b_pads.vhd
-- Author:	Magnus Hjorth - Aeroflex Gaisler
-- Description:	Pad instantiations for GR1553B
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.gr1553b_pkg.all;
library techmap;
use techmap.gencomp.all;

entity gr1553b_pads is
  generic (
    padtech: integer;
    outen_pol: integer range 0 to 1;
    level: integer := ttl;
    slew: integer := 0;
    voltage: integer := x33v;
    strength: integer := 12;
    filter: integer := 0
    );
  port (
    txout: in gr1553b_txout_type;
    rxin: out gr1553b_rxin_type;
    busainen    : out std_logic;
    busainp     : in  std_logic;
    busainn     : in  std_logic;
    busaoutenin : out std_logic;
    busaoutp    : out std_logic;
    busaoutn    : out std_logic;
    busbinen    : out std_logic;
    busbinp     : in  std_logic;
    busbinn     : in  std_logic;
    busboutenin : out std_logic;
    busboutp    : out std_logic;
    busboutn    : out std_logic
    );
end;

architecture rtl of gr1553b_pads is
begin

  outin_gen: if outen_pol /= 0 generate
    busa_outin_pad : outpad
      generic map (tech => padtech, level => level, slew => slew,
                   voltage => voltage, strength => strength)
      port map (busaoutenin, txout.busA_txin);
    busb_outin_pad : outpad
      generic map (tech => padtech, level => level, slew => slew,
                   voltage => voltage, strength => strength)
      port map (busboutenin, txout.busB_txin);
  end generate;

  outen_gen: if outen_pol = 0 generate
    busa_outen_pad : outpad
      generic map (tech => padtech, level => level, slew => slew,
                   voltage => voltage, strength => strength)
      port map (busaoutenin, txout.busA_txen);
    busb_outen_pad : outpad
      generic map (tech => padtech, level => level, slew => slew,
                   voltage => voltage, strength => strength)
      port map (busboutenin, txout.busB_txen);
  end generate;


  busa_inen_pad : outpad
    generic map (tech => padtech, level => level, slew => slew,
                 voltage => voltage, strength => strength)
    port map (busainen, txout.busA_rxen);
  busa_inp_pad  : inpad
    generic map (tech => padtech, level => level, filter => filter,
                 voltage => voltage, strength => strength)
    port map (busainp,  rxin.busA_rxP);
  busa_inn_pad  : inpad
    generic map (tech => padtech, level => level, filter => filter,
                 voltage => voltage, strength => strength)
    port map (busainn,  rxin.busA_rxN);
  busa_outp_pad : outpad
    generic map (tech => padtech, level => level, slew => slew,
                 voltage => voltage, strength => strength)
    port map (busaoutp, txout.busA_txP);
  busa_outn_pad : outpad
    generic map (tech => padtech, level => level, slew => slew,
                 voltage => voltage, strength => strength)
    port map (busaoutn, txout.busA_txN);
  busb_inen_pad : outpad
    generic map (tech => padtech, level => level, slew => slew,
                 voltage => voltage, strength => strength)
    port map (busbinen, txout.busB_rxen);
  busb_inp_pad  : inpad
    generic map (tech => padtech, level => level, filter => filter,
                 voltage => voltage, strength => strength)
    port map (busbinp,  rxin.busB_rxP);
  busb_inn_pad  : inpad
    generic map (tech => padtech, level => level, filter => filter,
                 voltage => voltage, strength => strength)
    port map (busbinn,  rxin.busB_rxN);
  busb_outp_pad : outpad
    generic map (tech => padtech, level => level, slew => slew,
                 voltage => voltage, strength => strength)
    port map (busboutp, txout.busB_txP);
  busb_outn_pad : outpad
    generic map (tech => padtech, level => level, slew => slew,
                 voltage => voltage, strength => strength)
    port map (busboutn, txout.busB_txN);

end;

