-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_pack-p.vhd,v 1.9 2007/02/05 22:08:59 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package i8244_pack is

  subtype byte_t is std_logic_vector(7 downto 0);
  type byte_array_t is array (natural range <>) of byte_t;

  subtype pos_t is unsigned(8 downto 0);

  function to_pos_f(int : in natural) return pos_t;
  function to_stdlogic(a : in boolean) return std_logic;

  constant is_ntsc_c : integer := 0;
  constant is_pal_c  : integer := 1;

  subtype col_attr_t  is std_logic_vector(2 downto 0);
  type    col_attrs_t is array (natural range <>) of col_attr_t;

end i8244_pack;


package body i8244_pack is

  function to_pos_f(int : in natural) return pos_t is
    variable result_v : pos_t;
  begin
    result_v := to_unsigned(int, pos_t'length);
    return result_v;
  end;

  function to_stdlogic(a : in boolean) return std_logic is
  begin
    if a then
      return '1';
    else
      return '0';
    end if;
  end;

end i8244_pack;
