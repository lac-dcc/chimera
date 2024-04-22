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
-- Entity: 	clkand
-- File:	clkand.vhd
-- Author:	Jiri Gaisler - Gaisler Research
-- Description:	Clock gating
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.gencomp.all;
use work.allclkgen.all;

entity clkand is
  generic( tech : integer := 0;
           ren  : integer range 0 to 1 := 0;  -- registered enable
           isdummy: integer range 0 to 1 := 0);  -- dummy gate (en must be always-1)
  port(
    i      :  in  std_ulogic;
    en     :  in  std_ulogic;
    o      :  out std_ulogic;
    tsten  :  in  std_ulogic := '0';
    odup   :  out std_ulogic;
    odup2  :  out std_ulogic;
    odup3  :  out std_ulogic;
    odup4  :  out std_ulogic
  );
end entity;

architecture rtl of clkand is
signal eni : std_ulogic;
signal oi: std_ulogic;

-- set to 1 to skip using ICGs and assign oi <= o for dummy gates in code below
constant use_empty_dummy: tech_ability_type := (inferred => 0, easic45 => 1, rhs65 => 1, others => 0);

-- set to 1 to add 5 ps delay between oi and o in RTL sim (for clock delta balancing)
-- set to 2 to add no delay between oi and o
constant use_standard_delay: tech_ability_type := (inferred => 1, others => 1);

begin

  re : if ren = 1 generate
    renproc : process(i)
    begin
      if falling_edge(i) then eni <= en; end if;
    end process;
  end generate;

  ce : if ren = 0 generate eni <= en; end generate;
  
  struct : if has_clkand(tech) = 1 and not (isdummy=1 and use_empty_dummy(tech)=1) generate
    xil : if is_unisim(tech) = 1 generate
      clkgate : clkand_unisim port map(I => i, en => eni, O => oi);
    end generate;

    ut : if (tech = ut25) generate
      clkgate : clkand_ut025crh port map(I => i, en => eni, O => oi);
    end generate;

    rhl : if (tech = rhlib18t) generate
      clkgate : clkand_rh_lib18t port map(I => i, en => eni, O => oi, tsten => tsten);
    end generate;

    ut13 : if (tech = ut130) generate
      clkgate : clkand_ut130hbd port map(I => i, en => eni, O => oi, tsten => tsten);
    end generate;

    ut09 : if (tech = ut90) generate
      clkgate : clkand_ut90nhbd port map(I => i, en => eni, O => oi, tsten => tsten);
    end generate;

    n2x : if (tech = easic45) generate
      clkgate : clkand_n2x port map(i => i, en => eni, o => oi, tsten => tsten);
    end generate;

    saed : if (tech = saed32) generate
      clkgate : clkand_saed32 port map(i => i, en => eni, o => oi, tsten => tsten);
    end generate;

    rhs : if (tech = rhs65) generate
      clkgate : clkand_rhs65 port map(i => i, en => eni, o => oi, tsten => '0');
    end generate;

    dar : if (tech = dare) generate
      clkgate : clkand_dare port map(i => i, en => eni, o => o, tsten => tsten);
    end generate;
  end generate;

  gen : if has_clkand(tech) = 0 generate
    oi <= i and (eni or tsten);
  end generate;

  edummy: if isdummy=1 and use_empty_dummy(tech)=1 generate
    oi <= i;
  end generate;

  stddelay1: if use_standard_delay(tech)=1 generate
    o <= oi
--pragma translate_off
         after 5 ps
--pragma translate_on
         ;
    odup <= oi
--pragma translate_off
         after 5 ps
--pragma translate_on
         ;
    odup2 <= oi
--pragma translate_off
         after 5 ps
--pragma translate_on
         ;
    odup3 <= oi
--pragma translate_off
         after 5 ps
--pragma translate_on
         ;
    odup4 <= oi
--pragma translate_off
         after 5 ps
--pragma translate_on
         ;
  end generate;

  stddelay2: if use_standard_delay(tech)=2 generate
    o <= oi;
    odup <= oi;
    odup2 <= oi;
    odup3 <= oi;
    odup4 <= oi;
  end generate;

end architecture;



library ieee;
use ieee.std_logic_1164.all;
use work.gencomp.all;
use work.allclkgen.all;

entity clkrand is
  generic( tech : integer := 0);
  port(
    i      :  in  std_ulogic;
    en     :  in  std_ulogic;
    o      :  out std_ulogic;
    tsten  :  in  std_ulogic := '0'
  );
end entity;

architecture rtl of clkrand is
signal eni : std_ulogic;
begin
  ut13 : if (tech = ut130) generate
    eni <= en or tsten;
    clkgate : clkrand_ut130hbd port map(I => i, en => en, O => o);
  end generate;
  nonut13 : if (tech /= ut130) generate
    clkgate : clkand generic map (tech, 1)
              port map (i, en, o, tsten);
  end generate;
end;

