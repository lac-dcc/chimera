--  Copyright (C) 2020-2021 Martin Åberg
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
--  You should have received a copy of the GNU General Public License along
--  with this program; if not, write to the Free Software Foundation, Inc.,
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--

library ieee;
use ieee.std_logic_1164.all;

-- Definitions for Amiga custom chipset.
package ocs is
  subtype addr_t  is std_ulogic_vector(11 downto  0);
  subtype word_t  is std_ulogic_vector(15 downto  0);
  subtype rgb4_t  is std_ulogic_vector(11 downto  0);
  subtype byte_t  is std_ulogic_vector( 7 downto  0);
  subtype rga_t   is std_ulogic_vector( 8 downto  1);
  type rgb4_array_t is array (integer range <>) of rgb4_t;
  type word_array_t is array (integer range <>) of word_t;
  type byte_array_t is array (integer range <>) of byte_t;

  constant RGA_STRHOR   : addr_t := x"03C";
  constant RGA_DIWSTRT  : addr_t := x"08E";
  constant RGA_DIWSTOP  : addr_t := x"090";
  constant RGA_JOY0DAT  : addr_t := x"00A";
  constant RGA_JOY1DAT  : addr_t := x"00C";
  constant RGA_JOYTEST  : addr_t := x"036";
  constant RGA_BPLCON0  : addr_t := x"100";
  constant RGA_BPLCON1  : addr_t := x"102";
  constant RGA_BPLCON2  : addr_t := x"104";

  constant RGA_BPL1DAT  : addr_t := x"110";
  constant RGA_BPL2DAT  : addr_t := x"112";
  constant RGA_BPL3DAT  : addr_t := x"114";
  constant RGA_BPL4DAT  : addr_t := x"116";
  constant RGA_BPL5DAT  : addr_t := x"118";
  constant RGA_BPL6DAT  : addr_t := x"11A";

  constant RGA_COLOR00  : addr_t := x"180";
  constant RGA_COLOR01  : addr_t := x"182";
  constant RGA_COLOR02  : addr_t := x"184";
  constant RGA_COLOR03  : addr_t := x"186";
  constant RGA_COLOR04  : addr_t := x"188";
  constant RGA_COLOR05  : addr_t := x"18A";
  constant RGA_COLOR06  : addr_t := x"18C";
  constant RGA_COLOR07  : addr_t := x"18E";

  type denise_in_t is record
    clk7    : std_ulogic;
    cck     : std_ulogic;
    rga     : std_ulogic_vector( 8 downto  1);
    drd     : std_ulogic_vector(15 downto  0);
    m0v     : std_ulogic;
    m0h     : std_ulogic;
    m1v     : std_ulogic;
    m1h     : std_ulogic;
    ncsync  : std_ulogic;
    ncdac   : std_ulogic;
  end record;

  type denise_out_t is record
    drd     : std_ulogic_vector(15 downto  0);
    drd_oe  : std_ulogic;
    rgb     : rgb4_array_t(0 to 1);
    nzd     : std_ulogic_vector(0 to 1);
    nburst  : std_ulogic;

    -- external bus driver control
    drd_ext_noe       : std_ulogic;
    drd_ext_to_denice : std_ulogic;
  end record;
end;

