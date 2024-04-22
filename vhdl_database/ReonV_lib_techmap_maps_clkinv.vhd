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
-- Entity: 	clkinv
-- File:	clkinv.vhd
-- Author:	Fredrik Ringhage - Aeroflex Gaisler Research
-- Description: SET protected inverters for clock tree
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.gencomp.all;
use work.allclkgen.all;

entity clkinv is
  generic(tech : integer := 0);
  port(
    i  :  in  std_ulogic;
    o  :  out std_ulogic
  );
end entity;

architecture rtl of clkinv is
begin
  
  tec : if has_clkinv(tech) = 1 generate

    saed : if (tech = saed32) generate
      x0 : clkinv_saed32 port map (i => i, o => o);
    end generate;

    dar : if (tech = dare) generate
      x0 : clkinv_dare port map (i => i, o => o);
    end generate;

    rhs : if (tech = rhs65) generate
      x0 : clkinv_rhs65 port map (i => i, o => o);
    end generate;

  end generate;

  gen : if has_clkinv(tech) = 0 generate
    o <= not i;
  end generate;

end architecture;




