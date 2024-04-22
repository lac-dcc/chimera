-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_grid_pack-p.vhd,v 1.5 2007/02/05 22:08:59 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.i8244_pack.byte_array_t;

package i8244_grid_pack is

  subtype hbar_t  is std_logic_vector(8 downto 0);
  type    hbars_t is array (natural range 0 to 8) of hbar_t;

  -- grid configuration
  type grid_bars_t is
    record
      hbars : hbars_t;
      vbars : byte_array_t(0 to 9);
    end record;
  --
  type grid_cfg_t is
    record
      enable : std_logic;
      wide   : std_logic;
      dot_en : std_logic;
      bars   : grid_bars_t;
    end record;

end;
