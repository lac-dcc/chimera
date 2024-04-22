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
use work.ocs.all;

-- Definitions for Denise implementation
package priv is

  -- Represent one hardware sprite
  type sprite_reg_t is record
    en      : std_ulogic;
    att     : std_ulogic;
    sh      : std_ulogic_vector(8 downto 0);
    data    : word_t;
    datb    : word_t;
  end record;
  type sprite_reg_array_t is array (integer range <>) of sprite_reg_t;

  type sel_sprite_t is record
    pos     : std_ulogic; -- --2 W
    ctl     : std_ulogic; -- --4 W
    data    : std_ulogic; -- --6 W
    datb    : std_ulogic; -- --8 W
  end record;
  constant SEL_SPRITE_NONE : sel_sprite_t := (
    pos   => '0',
    ctl   => '0',
    data  => '0',
    datb  => '0'
  );
  type sel_sprite_array_t is array (natural range <>) of sel_sprite_t;

  -- All register select targets
  type sel_t is record
    joy0dat : std_ulogic; -- 00A R
    joy1dat : std_ulogic; -- 00C R
    clxdat  : std_ulogic; -- 00E R
    joytest : std_ulogic; -- 036 W
    strequ  : std_ulogic; -- 038 S
    strvbl  : std_ulogic; -- 03A S
    strhor  : std_ulogic; -- 03C S
    strlong : std_ulogic; -- 03E S
    diwstrt : std_ulogic; -- 08E S
    diwstop : std_ulogic; -- 090 S
    clxcon  : std_ulogic; -- 098 W
    bplcon0 : std_ulogic; -- 100 W
    bplcon1 : std_ulogic; -- 102 W
    bplcon2 : std_ulogic; -- 104 W
    bpldat  : std_ulogic_vector(0 to 5);  -- 110..11A W
    spr     : sel_sprite_array_t(0 to 7); -- 140..17E W
    colorx  : std_ulogic;
    color   : std_ulogic_vector(0 to 31); -- 180..1BE W
  end record;
  constant SEL_NONE : sel_t := (
    joy0dat => '0',
    joy1dat => '0',
    clxdat  => '0',
    joytest => '0',
    strequ  => '0',
    strvbl  => '0',
    strhor  => '0',
    strlong => '0',
    diwstrt => '0',
    diwstop => '0',
    clxcon  => '0',
    bplcon0 => '0',
    bplcon1 => '0',
    bplcon2 => '0',
    bpldat  => (others => '0'),
    spr     => (others => SEL_SPRITE_NONE),
    colorx  => '0',
    color   => (others => '0')
  );

  -- register address decoder
  function gen_sel(
    rga     : rga_t
  ) return sel_t;

  -- return: clxdat
  function collision_detection_logic(
    sprbus  : std_ulogic_vector(15 downto 0);
    bplbus  : std_ulogic_vector( 5 downto 0);
    clxcon  : std_ulogic_vector(15 downto 0)
  ) return std_ulogic_vector;

  -- Either normal color selection procedure, or replace R/G/B bits.
  -- return: new rgb
  function hold_and_modify(
    normal  : rgb4_t;
    left    : rgb4_t;
    op      : std_ulogic_vector(1 downto 0);
    replace : std_ulogic_vector(3 downto 0)
  ) return rgb4_t;

  function isx(
    v : std_ulogic_vector
  ) return boolean;

end;

package body priv is
  function gen_sel(
    rga     : rga_t
  ) return sel_t
  is
    variable a : std_ulogic_vector(11 downto 0) := "000" & rga & "0";
    variable s : sel_t := SEL_NONE;
  begin
    if isx(a) then
      return s;
    end if;
    case a is
      when x"00A" => s.joy0dat    := '1';
      when x"00C" => s.joy1dat    := '1';
      when x"036" => s.joytest    := '1';
      when x"00E" => s.clxdat     := '1';
      when x"098" => s.clxcon     := '1';
      when x"038" => s.strequ     := '1';
      when x"03A" => s.strvbl     := '1';
      when x"03C" => s.strhor     := '1';
      when x"03E" => s.strlong    := '1';
      when x"08E" => s.diwstrt    := '1';
      when x"090" => s.diwstop    := '1';
      when x"100" => s.bplcon0    := '1';
      when x"102" => s.bplcon1    := '1';
      when x"104" => s.bplcon2    := '1';
      when x"110" => s.bpldat(0)  := '1';
      when x"112" => s.bpldat(1)  := '1';
      when x"114" => s.bpldat(2)  := '1';
      when x"116" => s.bpldat(3)  := '1';
      when x"118" => s.bpldat(4)  := '1';
      when x"11A" => s.bpldat(5)  := '1';

      when x"140" => s.spr(0).pos := '1';
      when x"142" => s.spr(0).ctl := '1';
      when x"144" => s.spr(0).data:= '1';
      when x"146" => s.spr(0).datb:= '1';
      when x"148" => s.spr(1).pos := '1';
      when x"14A" => s.spr(1).ctl := '1';
      when x"14C" => s.spr(1).data:= '1';
      when x"14E" => s.spr(1).datb:= '1';

      when x"150" => s.spr(2).pos := '1';
      when x"152" => s.spr(2).ctl := '1';
      when x"154" => s.spr(2).data:= '1';
      when x"156" => s.spr(2).datb:= '1';
      when x"158" => s.spr(3).pos := '1';
      when x"15A" => s.spr(3).ctl := '1';
      when x"15C" => s.spr(3).data:= '1';
      when x"15E" => s.spr(3).datb:= '1';

      when x"160" => s.spr(4).pos := '1';
      when x"162" => s.spr(4).ctl := '1';
      when x"164" => s.spr(4).data:= '1';
      when x"166" => s.spr(4).datb:= '1';
      when x"168" => s.spr(5).pos := '1';
      when x"16A" => s.spr(5).ctl := '1';
      when x"16C" => s.spr(5).data:= '1';
      when x"16E" => s.spr(5).datb:= '1';

      when x"170" => s.spr(6).pos := '1';
      when x"172" => s.spr(6).ctl := '1';
      when x"174" => s.spr(6).data:= '1';
      when x"176" => s.spr(6).datb:= '1';
      when x"178" => s.spr(7).pos := '1';
      when x"17A" => s.spr(7).ctl := '1';
      when x"17C" => s.spr(7).data:= '1';
      when x"17E" => s.spr(7).datb:= '1';

      when x"180" => s.color( 0)   := '1';
      when x"182" => s.color( 1)   := '1';
      when x"184" => s.color( 2)   := '1';
      when x"186" => s.color( 3)   := '1';
      when x"188" => s.color( 4)   := '1';
      when x"18A" => s.color( 5)   := '1';
      when x"18C" => s.color( 6)   := '1';
      when x"18E" => s.color( 7)   := '1';
      when x"190" => s.color( 8)   := '1';
      when x"192" => s.color( 9)   := '1';
      when x"194" => s.color(10)   := '1';
      when x"196" => s.color(11)   := '1';
      when x"198" => s.color(12)   := '1';
      when x"19A" => s.color(13)   := '1';
      when x"19C" => s.color(14)   := '1';
      when x"19E" => s.color(15)   := '1';
      when x"1A0" => s.color(16)   := '1';
      when x"1A2" => s.color(17)   := '1';
      when x"1A4" => s.color(18)   := '1';
      when x"1A6" => s.color(19)   := '1';
      when x"1A8" => s.color(20)   := '1';
      when x"1AA" => s.color(21)   := '1';
      when x"1AC" => s.color(22)   := '1';
      when x"1AE" => s.color(23)   := '1';
      when x"1B0" => s.color(24)   := '1';
      when x"1B2" => s.color(25)   := '1';
      when x"1B4" => s.color(26)   := '1';
      when x"1B6" => s.color(27)   := '1';
      when x"1B8" => s.color(28)   := '1';
      when x"1BA" => s.color(29)   := '1';
      when x"1BC" => s.color(30)   := '1';
      when x"1BE" => s.color(31)   := '1';
      when others =>
        null;
    end case;
    if (a and "0001" & "1100" & "0000") = "0001" & "1000" & "0000" then
      s.colorx := '1';
    end if;
    return s;
  end;


  -- BIT#   COLLISIONS REGISTERED
  -- -----  --------------------------
  -- 15     not used
  -- 14     Sprite 4 (or 5) to sprite 6 (or 7)
  -- 13     Sprite 2 (or 3) to sprite 6 (or 7)
  -- 12     Sprite 2 (or 3) to sprite 4 (or 5)
  -- 11     Sprite 0 (or 1) to sprite 6 (or 7)
  -- 10     Sprite 0 (or 1) to sprite 4 (or 5)
  -- 09     Sprite 0 (or 1) to sprite 2 (or 3)
  -- 08     Playfield 2 to sprite 6 (or 7)
  -- 07     Playfield 2 to sprite 4 (or 5)
  -- 06     Playfield 2 to sprite 2 (or 3)
  -- 05     Playfield 2 to sprite 0 (or 1)
  -- 04     Playfield 1 to sprite 6 (or 7)
  -- 03     Playfield 1 to sprite 4 (or 5)
  -- 02     Playfield 1 to sprite 2 (or 3)
  -- 01     Playfield 1 to sprite 0 (or 1)
  -- 00     Playfield 1 to playfield 2

  -- return: false iff sprite pixel is transparent
  function spren(
    sprbus  : std_ulogic_vector(15 downto 0);
    i       : natural range 0 to 7
  ) return boolean is
  begin
    return sprbus(2*i + 1 downto 2*i) /= "00";
  end;

  function collision_detection_logic(
    sprbus  : std_ulogic_vector(15 downto 0);
    bplbus  : std_ulogic_vector( 5 downto 0);
    clxcon  : std_ulogic_vector(15 downto 0)
  ) return std_ulogic_vector is
    variable ret : std_ulogic_vector(14 downto 0) := (others => '0');
    variable spr01 : boolean;
    variable spr23 : boolean;
    variable spr45 : boolean;
    variable spr67 : boolean;
    variable even_bpls : boolean;
    variable odd_bpls : boolean;
  begin
    spr01 := spren(sprbus, 0) or (spren(sprbus, 1) and clxcon(12) = '1');
    spr23 := spren(sprbus, 2) or (spren(sprbus, 3) and clxcon(13) = '1');
    spr45 := spren(sprbus, 4) or (spren(sprbus, 5) and clxcon(14) = '1');
    spr67 := spren(sprbus, 6) or (spren(sprbus, 7) and clxcon(15) = '1');
    -- "even" in documentation is with 1-based indexing. We use 0-based.
    even_bpls := (
      (clxcon(6+1) = '0' or (bplbus(1) = clxcon(1))) and
      (clxcon(6+3) = '0' or (bplbus(3) = clxcon(3))) and
      (clxcon(6+5) = '0' or (bplbus(5) = clxcon(5)))
    );
    odd_bpls := (
      (clxcon(6+0) = '0' or (bplbus(0) = clxcon(0))) and
      (clxcon(6+2) = '0' or (bplbus(2) = clxcon(2))) and
      (clxcon(6+4) = '0' or (bplbus(4) = clxcon(4)))
    );
    if spr45      and spr67     then ret(14) := '1'; end if;
    if spr23      and spr67     then ret(13) := '1'; end if;
    if spr23      and spr45     then ret(12) := '1'; end if;
    if spr01      and spr67     then ret(11) := '1'; end if;
    if spr01      and spr45     then ret(10) := '1'; end if;
    if spr01      and spr23     then ret( 9) := '1'; end if;
    if even_bpls  and spr67     then ret( 8) := '1'; end if;
    if even_bpls  and spr45     then ret( 7) := '1'; end if;
    if even_bpls  and spr23     then ret( 6) := '1'; end if;
    if even_bpls  and spr01     then ret( 5) := '1'; end if;
    if odd_bpls   and spr67     then ret( 4) := '1'; end if;
    if odd_bpls   and spr45     then ret( 3) := '1'; end if;
    if odd_bpls   and spr23     then ret( 2) := '1'; end if;
    if odd_bpls   and spr01     then ret( 1) := '1'; end if;
    if even_bpls  and odd_bpls  then ret( 0) := '1'; end if;
    return ret;
  end;

  -- return: rgb
  function hold_and_modify(
    normal  : rgb4_t;
    left    : rgb4_t;
    op      : std_ulogic_vector(1 downto 0);
    replace : std_ulogic_vector(3 downto 0)
  ) return rgb4_t is
    variable ret : rgb4_t;
  begin
    ret := left;
    case op is
      when "00"   => ret := normal; -- normal color selection procedure
      when "01"   => ret( 3 downto 0) := replace; -- blue  bits
      when "10"   => ret( 7 downto 4) := replace; -- green bits
      when others => ret(11 downto 8) := replace; -- red   bits
    end case;
    return ret;
  end;

  function isx(
    v : std_ulogic_vector
  ) return boolean is
  begin
    if
-- pragma translate_off
      is_x(v) or
-- pragma translate_on
      false
    then
      return true;
    end if;
    return false;
  end;

end;

