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
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;

entity clkgate is
  generic (tech : integer := 0; ncpu : integer := 1; dsuen : integer := 1);
  port (
    rst     : in  std_ulogic;
    clkin   : in  std_ulogic;
    pwd     : in  std_logic_vector(ncpu-1 downto 0);
    clkahb  : out std_ulogic;
    clkcpu  : out std_logic_vector(ncpu-1 downto 0)
  );
end;

architecture rtl of clkgate is
signal npwd, xpwd, ypwd : std_logic_vector(ncpu-1 downto 0);
signal vrst, wrst : std_logic_vector(ncpu-1 downto 0);
signal clken: std_logic_vector(ncpu-1 downto 0);
signal xrst, vcc : std_ulogic;
begin

  vcc <= '1';
  cand : for i in 0 to ncpu-1 generate
    clken(i) <= not npwd(i);
    clkand0 : clkand generic map (tech) port map (clkin, clken(i), clkcpu(i));
  end generate;
  cand0 : clkand generic map (tech) port map (clkin, vcc, clkahb);

  vrst <= (others => rst);
  r1 : if dsuen = 1 generate
    nreg : process(clkin)
    begin 
      if falling_edge(clkin) then 
        npwd <= pwd and vrst;
      end if;
    end process;
  end generate;

  r2 : if dsuen = 0 generate
    reg : process(clkin)
    begin 
      if rising_edge(clkin) then 
        xrst <= rst;
        xpwd <= pwd and wrst;
      end if;
    end process;
    wrst <= (others => xrst);
    nreg : process(clkin)
    begin 
      if falling_edge(clkin) then 
        npwd <= xpwd;
      end if;
    end process;
  end generate;

end;

