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
-- Entity:      various
-- File:        memory_saed32.vhd
-- Author:      Fredrik Ringhage - Aeroflex Gaisler AB
-- Description: Memory generators for SAED32
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
-- pragma translate_off
library saed32;
use saed32.SRAM1RW64x32;
use saed32.SRAM1RW128x48;
use saed32.SRAM1RW128x48;
-- pragma translate_on

entity saed32_syncram is
  generic ( abits : integer := 10; dbits : integer := 8);
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector(abits -1 downto 0);
    datain   : in std_logic_vector(dbits -1 downto 0);
    dataout  : out std_logic_vector(dbits -1 downto 0);
    enable   : in std_ulogic;
    write    : in std_ulogic
  );
end;

architecture rtl of saed32_syncram is

 component SRAM1RW64x32 is
  port (
    A   : in  std_logic_vector( 5  downto 0 );
    CE  : in  std_logic;
    WEB  : in  std_logic;
    OEB  : in  std_logic;
    CSB  : in  std_logic;    
    I   : in  std_logic_vector( 31  downto 0 );
    O   : out std_logic_vector( 31  downto 0 )
  );
 end component;

 component SRAM1RW128x48 is
  port (
    A   : in  std_logic_vector( 6  downto 0 );
    CE  : in  std_logic;
    WEB  : in  std_logic;
    OEB  : in  std_logic;
    CSB  : in  std_logic;    
    I   : in  std_logic_vector( 47  downto 0 );
    O   : out std_logic_vector( 47  downto 0 )
  );
 end component;

 component SRAM1RW1024x8 is
  port (
    A   : in  std_logic_vector( 9  downto 0 );
    CE  : in  std_logic;
    WEB  : in  std_logic;
    OEB  : in  std_logic;
    CSB  : in  std_logic;    
    I   : in  std_logic_vector( 7  downto 0 );
    O   : out std_logic_vector( 7  downto 0 )
  );
 end component;


  signal d, q, gnd : std_logic_vector(48 downto 0);
  signal a : std_logic_vector(17 downto 0);
  signal vcc, csn, wen : std_ulogic;
  --constant synopsys_bug : std_logic_vector(31 downto 0) := (others => '0');

begin

  csn <= not enable; wen <= not write;
  gnd <= (others => '0'); vcc <= '1';

  a(17 downto abits) <= (others => '0');
  d(48 downto dbits) <= (others => '0');
  
  a(abits -1 downto 0) <= address;
  d(dbits -1 downto 0) <= datain(dbits -1 downto 0);

  a6 : if (abits <= 6) generate
      id0 : SRAM1RW64x32 port map (A => a(5 downto 0), CE => clk,  WEB => wen,  OEB => gnd(0), CSB => csn, I => d(31 downto 0), O => q(31 downto 0));
  end generate;

  a7 : if (abits = 7) generate
      id0 : SRAM1RW128x48 port map (A => a(6 downto 0), CE => clk,  WEB => wen,  OEB => gnd(0), CSB => csn, I => d(47 downto 0), O => q(47 downto 0));
  end generate;

  a10 : if (abits >= 8 and abits <= 10) generate
    x : for i in 0 to ((dbits-1)/8) generate
      id0 : SRAM1RW1024x8 port map (A => a(9 downto 0), CE => clk,  WEB => wen,  OEB => gnd(0), CSB => csn, I => d(((i+1)*8)-1 downto i*8), O => q(((i+1)*8)-1 downto i*8));
    end generate;
  end generate;

  dataout <= q(dbits -1 downto 0);

-- pragma translate_off
  a_to_high : if (abits > 10) or (dbits > 32) generate
    x : process
    begin
      assert false
      report  "Unsupported memory size (saed32)"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on


end;

library ieee;
use ieee.std_logic_1164.all;

entity saed32_syncram_dp is
  generic ( abits : integer := 6; dbits : integer := 8 );
  port (
    clk1     : in std_ulogic;
    address1 : in std_logic_vector((abits -1) downto 0);
    datain1  : in std_logic_vector((dbits -1) downto 0);
    dataout1 : out std_logic_vector((dbits -1) downto 0);
    enable1  : in std_ulogic;
    write1   : in std_ulogic;
    clk2     : in std_ulogic;
    address2 : in std_logic_vector((abits -1) downto 0);
    datain2  : in std_logic_vector((dbits -1) downto 0);
    dataout2 : out std_logic_vector((dbits -1) downto 0);
    enable2  : in std_ulogic;
    write2   : in std_ulogic
   );
end;

architecture rtl of saed32_syncram_dp is

begin

end;

library ieee;
use ieee.std_logic_1164.all;

entity saed32_syncram_2p is
  generic ( abits : integer := 8; dbits : integer := 32; sepclk : integer := 0);
  port (
    rclk  : in std_ulogic;
    rena  : in std_ulogic;
    raddr : in std_logic_vector (abits -1 downto 0);
    dout  : out std_logic_vector (dbits -1 downto 0);
    wclk  : in std_ulogic;
    waddr : in std_logic_vector (abits -1 downto 0);
    din   : in std_logic_vector (dbits -1 downto 0);
    write : in std_ulogic);
end;


architecture rtl of saed32_syncram_2p is

begin



end;

