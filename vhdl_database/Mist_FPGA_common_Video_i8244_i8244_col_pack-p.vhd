-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_col_pack-p.vhd,v 1.4 2007/03/11 11:40:58 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package i8244_col_pack is

  constant r_c : natural := 0;
  constant g_c : natural := 1;
  constant b_c : natural := 2;

  subtype rgb_val_t    is natural range 0 to 255;
  type    rgb_triple_t is array (natural range 0 to  2) of
    rgb_val_t;
  type    rgb_table_t  is array (natural range 0 to 15) of
    rgb_triple_t;

  -----------------------------------------------------------------------------
  -- Full RGB Value Array
  --
  -- Refer to vdc.c of o2em source distribution.
  --
  constant full_rgb_table_c : rgb_table_t := (
  --        R              G              B            LRGB
    (r_c => 16#00#, g_c => 16#00#, b_c => 16#00#),  -- 0000
    (r_c => 16#0e#, g_c => 16#3d#, b_c => 16#d4#),  -- 0001
    (r_c => 16#00#, g_c => 16#98#, b_c => 16#1b#),  -- 0010
    (r_c => 16#00#, g_c => 16#bb#, b_c => 16#d9#),  -- 0011
    (r_c => 16#c7#, g_c => 16#00#, b_c => 16#08#),  -- 0100
    (r_c => 16#cc#, g_c => 16#16#, b_c => 16#b3#),  -- 0101
    (r_c => 16#9d#, g_c => 16#87#, b_c => 16#10#),  -- 0110
    (r_c => 16#e1#, g_c => 16#de#, b_c => 16#e1#),  -- 0111
    (r_c => 16#5f#, g_c => 16#6e#, b_c => 16#6b#),  -- 1000
    (r_c => 16#6a#, g_c => 16#a1#, b_c => 16#ff#),  -- 1001
    (r_c => 16#3d#, g_c => 16#f0#, b_c => 16#7a#),  -- 1010
    (r_c => 16#31#, g_c => 16#ff#, b_c => 16#ff#),  -- 1011
    (r_c => 16#ff#, g_c => 16#42#, b_c => 16#55#),  -- 1100
    (r_c => 16#ff#, g_c => 16#98#, b_c => 16#ff#),  -- 1101
    (r_c => 16#d9#, g_c => 16#ad#, b_c => 16#5d#),  -- 1110
    (r_c => 16#ff#, g_c => 16#ff#, b_c => 16#ff#)   -- 1111
    );
  --
  -----------------------------------------------------------------------------

end;
