-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_major_pack-p.vhd,v 1.7 2007/02/05 22:08:59 arnim Exp $
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

package i8244_major_pack is

  subtype lss_t      is std_logic_vector(8 downto 0);
  subtype rom_addr_t is std_logic_vector(8 downto 0);
  subtype rom_data_t is std_logic_vector(7 downto 0);

  type major_attr_t is
    record
      lss : lss_t;
      col : col_attr_t;
    end record;

  constant num_major_quad_attr_c   : natural := 4;
  subtype  major_quad_attr_range_t is natural range 0 to num_major_quad_attr_c-1;
  type     major_quad_attrs_t      is array (major_quad_attr_range_t) of major_attr_t;

  type major_obj_t is
    record
      cam_y : byte_t;
      cam_x : byte_t;
      attr  : major_attr_t;
    end record;

  constant num_major_objects_c : natural := 12;
  subtype  major_obj_range_t   is natural range 0 to num_major_objects_c-1;
  type     major_objs_t        is array (major_obj_range_t) of major_obj_t;

  type major_quad_obj_t is
    record
      cam_y : byte_t;
      cam_x : byte_t;
      attrs : major_quad_attrs_t;
    end record;

  constant num_major_quad_objects_c : natural := 4;
  subtype  major_quad_obj_range_t   is natural range 0 to num_major_quad_objects_c-1;
  type     major_quad_objs_t        is array (major_quad_obj_range_t) of major_quad_obj_t;

  constant num_all_major_objects_c  : natural := num_major_quad_objects_c +
                                                 num_major_objects_c;
  subtype  all_major_obj_range_t    is natural range 0 to num_all_major_objects_c-1;

end;
