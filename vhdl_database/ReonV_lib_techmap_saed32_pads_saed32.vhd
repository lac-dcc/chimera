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
-- Package:     saed32pads
-- File:        pads_saed32.vhd
-- Author:      Fredrik Ringhage - Aeroflex Gaisler AB
-- Description: SAED32 pad wrappers
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
package saed32pads is
  -- input pad

  component I1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; VDDIO : inout std_logic; VDD : inout std_logic; R_EN : in std_logic; VSSIO : inout std_logic;DOUT  : out std_logic);  end component;

  -- input pad with pull-up and pull-down

  component B4I1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT: out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;

  -- schmitt input pad

  component ISH1025_EW port(PADIO : inout std_logic; VSS : inout std_logic; VDDIO : inout std_logic; VDD : inout std_logic; R_EN : in std_logic; VSSIO : inout std_logic; DOUT  : out std_logic); end component;

  -- output pads

  component D4I1025_NS  port(PADIO : inout std_logic; VSS : inout std_logic; EN : in std_logic; VDDIO : inout std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DIN : in std_logic); end component;
  component D12I1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; EN : in std_logic; VDDIO : inout std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DIN : in std_logic); end component;
  component D16I1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; EN : in std_logic; VDDIO : inout std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DIN : in std_logic); end component;

  -- bidirectional pads (and tri-state output pads)

  component B4ISH1025_NS  port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;
  component B12ISH1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;
  component B16ISH1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;

end;

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;
library work;
use work.all;

-- pragma translate_off
library saed32;
use saed32.I1025_NS;
use saed32.B4I1025_NS;
use saed32.ISH1025_EW;
-- pragma translate_on

entity saed32_inpad is
  generic (level : integer := 0; voltage : integer := 0; filter : integer := 0);
  port (pad : in std_logic; o : out std_logic);
end; 
architecture rtl of saed32_inpad is
  component I1025_NS    port(PADIO : inout std_logic; VSS : inout std_logic; VDDIO : inout std_logic; VDD : inout std_logic; R_EN : in std_logic; VSSIO : inout std_logic; DOUT  : out std_logic);  end component;
  component B4I1025_NS  port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT: out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic);  end component;
  component ISH1025_EW  port(PADIO : inout std_logic; VSS : inout std_logic; VDDIO : inout std_logic; VDD : inout std_logic; R_EN : in std_logic; VSSIO : inout std_logic; DOUT  : out std_logic); end component;

  signal localout,localpad : std_logic;

begin
  norm : if filter = 0 generate
    ip : I1025_NS port map (PADIO => localpad, DOUT => localout, VSS => OPEN, R_EN => '1', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;
  pu : if filter = pullup generate
    ip : B4I1025_NS port map (PADIO  => localpad, PULL_UP => '1', PULL_DOWN => '0', DOUT => localout, DIN => '0', VSS => OPEN, R_EN => '1', EN => '0', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;
  pd : if filter = pulldown generate
    ip : B4I1025_NS port map (PADIO  => localpad, PULL_UP => '0', PULL_DOWN => '1', DOUT => localout, DIN => '0', VSS => OPEN, R_EN => '1', EN => '0', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;
  sch : if filter = schmitt generate
    ip : ISH1025_EW port map (PADIO => localpad, DOUT => localout, VSS => OPEN, R_EN => '1', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;
  
  o <= localout;
  localpad <= pad;
  
end;

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;
library work;
use work.all;

-- pragma translate_off
library saed32;
use saed32.B4ISH1025_NS;
use saed32.B12ISH1025_NS;
use saed32.B16ISH1025_NS;
-- pragma translate_on

entity saed32_iopad  is
  generic (level : integer := 0; slew : integer := 0;
     voltage : integer := 0; strength : integer := 0);
  port (pad : inout std_logic; i, en : in std_logic; o : out std_logic);
end ;
architecture rtl of saed32_iopad is
  component B4ISH1025_NS  port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;
  component B12ISH1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;
  component B16ISH1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;

  signal localen : std_logic;
  signal localout,localpad : std_logic;

begin

  localen <= not en;

  f4 : if (strength <= 4)  generate
      op : B4ISH1025_NS port map (DIN => i,PADIO => pad, DOUT => o, VSS => OPEN, R_EN => localen, EN => en, VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN, PULL_UP => '0', PULL_DOWN => '0');
  end generate;
  f12 : if (strength > 4)  and (strength <= 12)  generate
      op : B12ISH1025_NS port map (DIN => i, PADIO => pad, DOUT => o, VSS => OPEN, R_EN => localen, EN => en, VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN, PULL_UP => '0', PULL_DOWN => '0');
  end generate;
  f16 : if (strength > 12)  generate
      op : B16ISH1025_NS port map (DIN => i, PADIO => pad, DOUT => o, VSS => OPEN, R_EN => localen, EN => en, VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN, PULL_UP => '0', PULL_DOWN => '0');
  end generate;

end;

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;
library work;
use work.all;

-- pragma translate_off
library saed32;
use saed32.D4I1025_NS;
use saed32.D12I1025_NS;
use saed32.D16I1025_NS;
-- pragma translate_on

entity saed32_outpad  is
  generic (level : integer := 0; slew : integer := 0;
     voltage : integer := 0; strength : integer := 0);
  port (pad : out std_logic; i : in std_logic);
end ;
architecture rtl of saed32_outpad is
  component D4I1025_NS  port(PADIO : inout std_logic; VSS : inout std_logic; EN : in std_logic; VDDIO : inout std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DIN : in std_logic); end component;
  component D12I1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; EN : in std_logic; VDDIO : inout std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DIN : in std_logic); end component;
  component D16I1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; EN : in std_logic; VDDIO : inout std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DIN : in std_logic); end component;

  signal localout,localpad : std_logic;

begin
  f4 : if (strength <= 4)  generate
      op : D4I1025_NS port map (DIN => i, PADIO => localpad, VSS => OPEN, EN => '1', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;
  f12 : if (strength > 4) and (strength <= 12)  generate
      op : D12I1025_NS port map (DIN => i, PADIO => localpad, VSS => OPEN, EN => '1', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;
  f16 : if (strength > 12) generate
      op : D16I1025_NS port map (DIN => i, PADIO => localpad, VSS => OPEN, EN => '1', VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN);
  end generate;

  pad <= localpad;

end;

library ieee;
use ieee.std_logic_1164.all;
library techmap;
use techmap.gencomp.all;
library work;
use work.all;

-- pragma translate_off
library saed32;
use saed32.B4ISH1025_NS;
use saed32.B12ISH1025_NS;
use saed32.B16ISH1025_NS;
-- pragma translate_on

entity saed32_toutpad  is
  generic (level : integer := 0; slew : integer := 0;
     voltage : integer := 0; strength : integer := 0);
  port (pad : out std_logic; i, en : in std_logic);
end ;
architecture rtl of saed32_toutpad is
  component B4ISH1025_NS  port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;
  component B12ISH1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;
  component B16ISH1025_NS port(PADIO : inout std_logic; VSS : inout std_logic; PULL_UP : in std_logic; VDDIO : inout std_logic; EN : in std_logic; VDD : inout std_logic; VSSIO : inout std_logic; DOUT : out std_logic; DIN : in std_logic; PULL_DOWN : in std_logic; R_EN : in std_logic); end component;

  signal localpad : std_logic;

begin

  f4 : if (strength <= 4)  generate
      op : B4ISH1025_NS port map (DIN => i,PADIO => localpad, DOUT => OPEN, VSS => OPEN, R_EN => '0', EN => en, VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN, PULL_UP => '0', PULL_DOWN => '0');
  end generate;
  f12 : if (strength > 4)  and (strength <= 12)  generate
      op : B12ISH1025_NS port map (DIN => i, PADIO => localpad, DOUT => OPEN, VSS => OPEN, R_EN => '0', EN => en, VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN, PULL_UP => '0', PULL_DOWN => '0');
  end generate;
  f16 : if (strength > 12)  generate
      op : B16ISH1025_NS port map (DIN => i, PADIO => localpad, DOUT => OPEN, VSS => OPEN, R_EN => '0', EN => en, VDDIO => OPEN, VDD => OPEN, VSSIO => OPEN, PULL_UP => '0', PULL_DOWN => '0');
  end generate;
  
  pad <= localpad;
  
end;

