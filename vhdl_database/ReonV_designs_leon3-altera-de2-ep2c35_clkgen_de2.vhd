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
library altera_mf;
-- pragma translate_off
use altera_mf.altpll;
-- pragma translate_on

entity clkgen_de2 is
  generic (
    clk_mul  : integer := 1; 
    clk_div  : integer := 1;
    clk_freq : integer := 25000;
    clk2xen  : integer := 0;          
    sdramen  : integer := 0
  );
  port (
    inclk0  : in  std_ulogic;
    c0	    : out std_ulogic;
    c0_2x   : out std_ulogic;
    e0	    : out std_ulogic; 
    locked  : out std_ulogic
);
end;

architecture rtl of clkgen_de2 is

  component altpll
  generic (   
    intended_device_family : string := "Stratix" ;
    operation_mode         : string := "NORMAL" ;
    compensate_clock       : string := "CLK0" ;
    inclk0_input_frequency : positive;
    width_clock            : positive := 6;
    clk0_multiply_by       : positive := 1;
    clk0_divide_by         : positive := 1;
    clk1_multiply_by       : positive := 1;
    clk1_divide_by         : positive := 1;    
    clk2_multiply_by       : positive := 1;
    clk2_divide_by         : positive := 1    

  );
  port (
    inclk       : in std_logic_vector(1 downto 0);
    clk         : out std_logic_vector(width_clock-1 downto 0);
    locked      : out std_logic
  );
  end component;

  signal clkout	: std_logic_vector (5 downto 0);
  signal inclk	: std_logic_vector (1 downto 0);

  constant clk_period : integer := 1000000000/clk_freq;
  constant CLK_MUL2X : integer := clk_mul * 2;
begin

  inclk <= '0' & inclk0;
  c0 <= clkout(0); c0_2x <= clkout(1);

  sden : if sdramen = 1 generate
    altpll0 : altpll
    generic map ( 
      intended_device_family => "Cyclone II",
      operation_mode => "ZERO_DELAY_BUFFER", 
      compensate_clock => "CLK2",
      inclk0_input_frequency => clk_period, 
      clk0_multiply_by => clk_mul, clk0_divide_by => clk_div,
      clk1_multiply_by => 5, clk1_divide_by => 10,
      clk2_multiply_by => clk_mul, clk2_divide_by => clk_div)
    port map (inclk => inclk, clk => clkout, locked => locked);

    e0 <= clkout(2);   
  end generate;

  nosd : if sdramen = 0 generate
    altpll0 : altpll
    generic map ( 
      intended_device_family => "Cyclone II",
      operation_mode => "NORMAL", 
      inclk0_input_frequency => clk_period, 
      clk0_multiply_by => clk_mul, clk0_divide_by => clk_div,
      clk1_multiply_by => 5, clk1_divide_by => 10)
    port map (inclk => inclk, clk => clkout, locked => locked);

    e0 <= '0';
  end generate;

end;

