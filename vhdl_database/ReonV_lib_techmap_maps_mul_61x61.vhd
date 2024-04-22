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
-- Entity: 	mul_61x61
-- File:	mul_61x61.vhd
-- Author:	Edvin Catovic - Gaisler Research
-- Description:	61x61 multiplier
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;

entity mul_61x61 is
  generic (multech : integer := 0;
           fabtech : integer := 0);
    port(A       : in std_logic_vector(60 downto 0);
         B       : in std_logic_vector(60 downto 0);
         EN      : in std_logic;
         CLK     : in std_logic;
         PRODUCT : out std_logic_vector(121 downto 0));
end;


architecture rtl of mul_61x61 is

component dw_mul_61x61 is
    port(A       : in std_logic_vector(60 downto 0);
         B       : in std_logic_vector(60 downto 0);
         CLK     : in std_logic;
         PRODUCT : out std_logic_vector(121 downto 0));
end component;

component gen_mul_61x61 is
    port(A       : in std_logic_vector(60 downto 0);
         B       : in std_logic_vector(60 downto 0);
         EN      : in std_logic;
         CLK     : in std_logic;
         PRODUCT : out std_logic_vector(121 downto 0));
end component;

component axcel_mul_61x61 is
    port(A       : in std_logic_vector(60 downto 0);
         B       : in std_logic_vector(60 downto 0);
         EN      : in std_logic;
         CLK     : in std_logic;
         PRODUCT : out std_logic_vector(121 downto 0));
end component;

component virtex4_mul_61x61
port(
  A : in std_logic_vector(60 downto 0);
  B : in std_logic_vector(60 downto 0);
  EN :  in std_logic;
  CLK :  in std_logic;
  PRODUCT : out std_logic_vector(121 downto 0));
end component;

component virtex6_mul_61x61
port(
  A : in std_logic_vector(60 downto 0);
  B : in std_logic_vector(60 downto 0);
  EN :  in std_logic;
  CLK :  in std_logic;
  PRODUCT : out std_logic_vector(121 downto 0));
end component;

component virtex7_mul_61x61
port(
  A : in std_logic_vector(60 downto 0);
  B : in std_logic_vector(60 downto 0);
  EN :  in std_logic;
  CLK :  in std_logic;
  PRODUCT : out std_logic_vector(121 downto 0));
end component;

component kintex7_mul_61x61
port(
  A : in std_logic_vector(60 downto 0);
  B : in std_logic_vector(60 downto 0);
  EN :  in std_logic;
  CLK :  in std_logic;
  PRODUCT : out std_logic_vector(121 downto 0));
end component;

begin

  gen0 : if multech = 0 generate
    mul0 : gen_mul_61x61 port map (A, B, EN, CLK, PRODUCT);
  end generate;

  dw0 : if multech = 1 generate
    mul0 : dw_mul_61x61 port map (A, B, CLK, PRODUCT);
  end generate;

  tech0 : if multech = 3 generate
    axd0 : if fabtech = axdsp generate
      mul0 : axcel_mul_61x61 port map (A, B, EN, CLK, PRODUCT);
    end generate;
    xc5v : if fabtech = virtex5 generate
      mul0 : virtex4_mul_61x61 port map (A, B, EN, CLK, PRODUCT);
    end generate;
    xc6v : if fabtech = virtex6 generate
      mul0 : virtex6_mul_61x61 port map (A, B, EN, CLK, PRODUCT);
    end generate;
    gen0 : if not ((fabtech = axdsp) or (fabtech = virtex5) or (fabtech = virtex6)) generate
      mul0 : gen_mul_61x61 port map (A, B, EN, CLK, PRODUCT);
    end generate;
  end generate;

end;

