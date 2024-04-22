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
-- pragma translate_off
library unisim;
use unisim.BUFG;
-- pragma translate_on
library techmap;
use techmap.gencomp.all;
use techmap.allclkgen.all;


entity vga_clkgen is
  port (
    resetn  : in  std_logic;
    sel     : in  std_logic_vector(1 downto 0);
    clk25   : in  std_logic;
    clkm    : in  std_logic;
    clk50   : in  std_logic;
    clkout  : out std_logic
  );
end;

architecture struct of vga_clkgen is
component BUFG port ( O : out std_logic; I : in std_logic); end component;
signal clk65, clksel : std_logic;

begin

  -- 65 MHz clock generator 

  clkgen65 : clkmul_virtex2 generic map (13, 5) port map (resetn, clk25, clk65);

  clk_select : process (clk25, clk50, clk65, sel)
  begin
    case sel is
    when "00" => clksel <= clk25;
    when "01" => clksel <= clkm;
    when "10" => clksel <= clk50;
    when "11" => clksel <= clk65;
    when others => clksel <= '0';
    end case;
  end process;

  bufg1 : BUFG port map (I => clksel, O => clkout);

end;

