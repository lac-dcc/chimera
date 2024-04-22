-------------------------------------------------------------------------------
--
-- i8244 Video Display Controller
--
-- $Id: i8244_sound_pack-p.vhd,v 1.3 2007/02/05 22:08:59 arnim Exp $
--
-- Copyright (c) 2007, Arnim Laeuger (arnim.laeuger@gmx.net)
--
-- All rights reserved
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.i8244_pack.byte_t;

package i8244_sound_pack is

  type sound_freq_t    is (SND_FREQ_LOW, SND_FREQ_HIGH);
  type sound_reg_sel_t is (SND_REG_NONE, SND_REG_0, SND_REG_1, SND_REG_2);

  type cpu2snd_t is
    record
      enable  : boolean;
      freq    : sound_freq_t;
      noise   : boolean;
      volume  : std_logic_vector(3 downto 0);
      reg_sel : sound_reg_sel_t;
      din     : byte_t;
    end record;

end;
