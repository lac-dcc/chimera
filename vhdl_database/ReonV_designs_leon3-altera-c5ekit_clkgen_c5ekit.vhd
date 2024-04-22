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

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;

entity clkgen_c5ekit is
  port (
    clkin: in std_ulogic;
    clkm: out std_ulogic;
    ssclk: out std_ulogic;
    locked: out std_ulogic
    );
end;

architecture rtl of clkgen_c5ekit is

	component syspll1 is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
	end component syspll1;

  signal cgi: clkgen_in_type;
  signal cgo: clkgen_out_type;
  signal gnd: std_ulogic;
begin

  pll0: syspll1
    port map (clkin, '0', clkm, locked);
  ssclk <= '0';
  
end;

