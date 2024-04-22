-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_minor_pack-p.vhd,v 1.3 2007/02/05 22:08:59 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.i8244_pack.byte_t;
use work.i8244_pack.col_attr_t;

package i8244_minor_pack is

  -- constants for minor object attributes
  constant minor_attr_x9_c : natural := 0;
  constant minor_attr_s_c  : natural := 1;
  constant minor_attr_d_c  : natural := 2;

  -- number of minor objects
  constant num_minor_objects_c : natural := 4;
  subtype  minor_obj_range_t is natural range 0 to num_minor_objects_c-1;

  -- minor object and patterns
  type minor_obj_t is
    record
      cam_y : byte_t;
      cam_x : byte_t;
      x9    : std_logic;
      s     : std_logic;
      d     : std_logic;
      col   : col_attr_t;
    end record;

  type minor_objs_t is array (minor_obj_range_t) of minor_obj_t;

  type minor_pattern_t  is array (0 to 7) of byte_t;
  type minor_patterns_t is array (minor_obj_range_t) of minor_pattern_t;

end;
