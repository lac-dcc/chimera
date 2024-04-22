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

entity syspll1 is
  port (
    refclk   : in  std_logic := 'X'; -- clk
    rst      : in  std_logic := 'X'; -- reset
    outclk_0 : out std_logic;        -- clk
    locked   : out std_logic         -- export
    );
end;

architecture sim of syspll1 is
begin
  p: process
    variable vclk: std_logic := '0';
  begin
    outclk_0 <= vclk;
    wait for 5.555 ns;
    vclk := not vclk;
  end process;

  locked <= '0', '1' after 1 us;

end;

