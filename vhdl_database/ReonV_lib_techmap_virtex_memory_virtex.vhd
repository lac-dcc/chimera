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
-- Entity: 	various
-- File:	memory_virtex.vhd
-- Author:	Aeroflex Gaisler AB
-- Description:	Memory generators for Xilinx Virtex rams
------------------------------------------------------------------------------


-- parametrisable sync ram generator using UNISIM RAMB4 block rams

library ieee;
use ieee.std_logic_1164.all;
--pragma translate_off
library unisim;
use unisim.RAMB4_S1;
use unisim.RAMB4_S2;
use unisim.RAMB4_S4;
use unisim.RAMB4_S8;
use unisim.RAMB4_S16;
use unisim.RAMB4_S16_S16;
--pragma translate_on
library grlib;
use grlib.config_types.all;
use grlib.config.all;
library techmap;
use techmap.gencomp.all;

entity virtex_syncram is
  generic ( abits : integer := 6; dbits : integer := 8);
  port (
    clk     : in std_ulogic;
    address : in std_logic_vector (abits -1 downto 0);
    datain  : in std_logic_vector (dbits -1 downto 0);
    dataout : out std_logic_vector (dbits -1 downto 0);
    enable  : in std_ulogic;
    write   : in std_ulogic
  );
end;

architecture behav of virtex_syncram is
  component generic_syncram
  generic ( abits : integer := 10; dbits : integer := 8 );
  port (
    clk      : in std_ulogic;
    address  : in std_logic_vector((abits -1) downto 0);
    datain   : in std_logic_vector((dbits -1) downto 0);
    dataout  : out std_logic_vector((dbits -1) downto 0);
    write    : in std_ulogic);
  end component;
  component ramb4_s16 port (
    do   : out std_logic_vector (15 downto 0);
    addr : in  std_logic_vector (7 downto 0);
    clk  : in  std_ulogic;
    di   : in  std_logic_vector (15 downto 0);
    en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S8
  port (do   : out std_logic_vector (7 downto 0);
        addr : in  std_logic_vector (8 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (7 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S4
  port (do   : out std_logic_vector (3 downto 0);
        addr : in  std_logic_vector (9 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (3 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S2
  port (do   : out std_logic_vector (1 downto 0);
        addr : in  std_logic_vector (10 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (1 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S1
  port (do   : out std_logic_vector (0 downto 0);
        addr : in  std_logic_vector (11 downto 0);
        clk  : in  std_ulogic;
        di   : in  std_logic_vector (0 downto 0);
        en, rst, we : in std_ulogic);
  end component;
  component RAMB4_S16_S16
  generic (SIM_COLLISION_CHECK : string := "ALL");
  port (
        doa    : out std_logic_vector (15 downto 0);
        dob    : out std_logic_vector (15 downto 0);
	addra  : in  std_logic_vector (7 downto 0);
	addrb  : in  std_logic_vector (7 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (15 downto 0);
	dib    : in  std_logic_vector (15 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
signal gnd : std_ulogic;
signal do, di : std_logic_vector(dbits+32 downto 0);
signal xa, ya : std_logic_vector(19 downto 0);
begin
  gnd <= '0';
  dataout <= do(dbits-1 downto 0);
  di(dbits-1 downto 0) <= datain; di(dbits+32 downto dbits) <= (others => '0');
  xa(abits-1 downto 0) <= address; xa(19 downto abits) <= (others => '0');
  ya(abits-1 downto 0) <= address; ya(19 downto abits) <= (others => '1');

  a0 : if (abits <= 5) and (GRLIB_CONFIG_ARRAY(grlib_techmap_strict_ram) = 0) generate
    r0 : generic_syncram generic map (abits, dbits)
         port map (clk, address, datain, do(dbits-1 downto 0), write);
    do(dbits+32 downto dbits) <= (others => '0');
  end generate;
  a7 : if ((abits > 5 or GRLIB_CONFIG_ARRAY(grlib_techmap_strict_ram) /= 0) and
           (abits <= 7) and (dbits <= 32)) generate
    r0 : RAMB4_S16_S16
      generic map(SIM_COLLISION_CHECK => "GENERATE_X_ONLY")
      port map ( do(31 downto 16), do(15 downto 0),
	xa(7 downto 0), ya(7 downto 0), clk, clk, di(31 downto 16),
	di(15 downto 0), enable, enable, gnd, gnd, write, write);
    do(dbits+32 downto 32) <= (others => '0');
  end generate;
  a8 : if (((abits > 5 or GRLIB_CONFIG_ARRAY(grlib_techmap_strict_ram) /= 0) and
            (abits <= 7) and (dbits > 32)) or (abits = 8)) generate
    x : for i in 0 to ((dbits-1)/16) generate
      r : RAMB4_S16 port map ( do (((i+1)*16)-1 downto i*16), xa(7 downto 0),
	clk, di (((i+1)*16)-1 downto i*16), enable, gnd, write );
    end generate;
    do(dbits+32 downto 16*(((dbits-1)/16)+1)) <= (others => '0');
  end generate;
  a9 : if abits = 9 generate
    x : for i in 0 to ((dbits-1)/8) generate
      r : RAMB4_S8 port map ( do (((i+1)*8)-1 downto i*8), xa(8 downto 0),
	clk, di (((i+1)*8)-1 downto i*8), enable, gnd, write );
    end generate;
    do(dbits+32 downto 8*(((dbits-1)/8)+1)) <= (others => '0');
  end generate;
  a10 : if abits = 10 generate
    x : for i in 0 to ((dbits-1)/4) generate
      r : RAMB4_S4 port map ( do (((i+1)*4)-1 downto i*4), xa(9 downto 0),
	clk, di (((i+1)*4)-1 downto i*4), enable, gnd, write );
    end generate;
    do(dbits+32 downto 4*(((dbits-1)/4)+1)) <= (others => '0');
  end generate;
  a11 : if abits = 11 generate
    x : for i in 0 to ((dbits-1)/2) generate
      r : RAMB4_S2 port map ( do (((i+1)*2)-1 downto i*2), xa(10 downto 0),
	clk, di (((i+1)*2)-1 downto i*2), enable, gnd, write );
    end generate;
    do(dbits+32 downto 2*(((dbits-1)/2)+1)) <= (others => '0');
  end generate;
  a12 : if abits = 12 generate
    x : for i in 0 to (dbits-1) generate
      r : RAMB4_S1 port map ( do (i downto i), xa(11 downto 0),
	clk, di(i downto i), enable, gnd, write );
    end generate;
    do(dbits+32 downto dbits) <= (others => '0');
  end generate;

  a13 : if abits > 12 generate
    x: generic_syncram generic map (abits, dbits)
      port map (clk, address, datain, do(dbits-1 downto 0), write);
    do(dbits+32 downto dbits) <= (others => '0');
  end generate;

end;

library ieee;
use ieee.std_logic_1164.all;
--pragma translate_off
library unisim;
use unisim.RAMB4_S1_S1;
use unisim.RAMB4_S2_S2;
use unisim.RAMB4_S4_S4;
use unisim.RAMB4_S8_S8;
use unisim.RAMB4_S16_S16;
--pragma translate_on

entity virtex_syncram_dp is
  generic (
    abits : integer := 6; dbits : integer := 8
  );
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
    write2   : in std_ulogic);
end;

architecture behav of virtex_syncram_dp is
 component RAMB4_S1_S1
  generic (SIM_COLLISION_CHECK : string := "ALL");
  port (
        doa    : out std_logic_vector (0 downto 0);
        dob    : out std_logic_vector (0 downto 0);
	addra  : in  std_logic_vector (11 downto 0);
	addrb  : in  std_logic_vector (11 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (0 downto 0);
	dib    : in  std_logic_vector (0 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S2_S2
  generic (SIM_COLLISION_CHECK : string := "ALL");
  port (
        doa    : out std_logic_vector (1 downto 0);
        dob    : out std_logic_vector (1 downto 0);
	addra  : in  std_logic_vector (10 downto 0);
	addrb  : in  std_logic_vector (10 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (1 downto 0);
	dib    : in  std_logic_vector (1 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S4_S4
  generic (SIM_COLLISION_CHECK : string := "ALL");
  port (
        doa    : out std_logic_vector (3 downto 0);
        dob    : out std_logic_vector (3 downto 0);
	addra  : in  std_logic_vector (9 downto 0);
	addrb  : in  std_logic_vector (9 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (3 downto 0);
	dib    : in  std_logic_vector (3 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S8_S8
  generic (SIM_COLLISION_CHECK : string := "ALL");
  port (
        doa    : out std_logic_vector (7 downto 0);
        dob    : out std_logic_vector (7 downto 0);
	addra  : in  std_logic_vector (8 downto 0);
	addrb  : in  std_logic_vector (8 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (7 downto 0);
	dib    : in  std_logic_vector (7 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;
  component RAMB4_S16_S16
  generic (SIM_COLLISION_CHECK : string := "ALL");
  port (
        doa    : out std_logic_vector (15 downto 0);
        dob    : out std_logic_vector (15 downto 0);
	addra  : in  std_logic_vector (7 downto 0);
	addrb  : in  std_logic_vector (7 downto 0);
	clka   : in  std_ulogic;
	clkb   : in  std_ulogic;
	dia    : in  std_logic_vector (15 downto 0);
	dib    : in  std_logic_vector (15 downto 0);
	ena    : in  std_ulogic;
	enb    : in  std_ulogic;
	rsta   : in  std_ulogic;
	rstb   : in  std_ulogic;
	wea    : in  std_ulogic;
	web    : in  std_ulogic
       );
  end component;

signal gnd, vcc : std_ulogic;
signal do1, do2, di1, di2 : std_logic_vector(dbits+16 downto 0);
signal addr1, addr2 : std_logic_vector(19 downto 0);
begin
  gnd <= '0'; vcc <= '1';
  dataout1 <= do1(dbits-1 downto 0); dataout2 <= do2(dbits-1 downto 0);
  di1(dbits-1 downto 0) <= datain1; di1(dbits+16 downto dbits) <= (others => '0');
  di2(dbits-1 downto 0) <= datain2; di2(dbits+16 downto dbits) <= (others => '0');
  addr1(abits-1 downto 0) <= address1; addr1(19 downto abits) <= (others => '0');
  addr2(abits-1 downto 0) <= address2; addr2(19 downto abits) <= (others => '0');

  a8 : if abits <= 8 generate
    x : for i in 0 to ((dbits-1)/16) generate
      r0 : RAMB4_S16_S16
        generic map (SIM_COLLISION_CHECK => "GENERATE_X_ONLY")
        port map (
	do1(((i+1)*16)-1 downto i*16), do2(((i+1)*16)-1 downto i*16),
	addr1(7 downto 0), addr2(7 downto 0), clk1, clk2,
	di1(((i+1)*16)-1 downto i*16), di2(((i+1)*16)-1 downto i*16),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a9 : if abits = 9 generate
    x : for i in 0 to ((dbits-1)/8) generate
      r0 : RAMB4_S8_S8
        generic map (SIM_COLLISION_CHECK => "GENERATE_X_ONLY")
        port map (
	do1(((i+1)*8)-1 downto i*8), do2(((i+1)*8)-1 downto i*8),
	addr1(8 downto 0), addr2(8 downto 0), clk1, clk2,
	di1(((i+1)*8)-1 downto i*8), di2(((i+1)*8)-1 downto i*8),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a10: if abits = 10 generate
    x : for i in 0 to ((dbits-1)/4) generate
      r0 : RAMB4_S4_S4
        generic map (SIM_COLLISION_CHECK => "GENERATE_X_ONLY")
        port map (
	do1(((i+1)*4)-1 downto i*4), do2(((i+1)*4)-1 downto i*4),
	addr1(9 downto 0), addr2(9 downto 0), clk1, clk2,
	di1(((i+1)*4)-1 downto i*4), di2(((i+1)*4)-1 downto i*4),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a11: if abits = 11 generate
    x : for i in 0 to ((dbits-1)/2) generate
      r0 : RAMB4_S2_S2
        generic map (SIM_COLLISION_CHECK => "GENERATE_X_ONLY")
        port map (
	do1(((i+1)*2)-1 downto i*2), do2(((i+1)*2)-1 downto i*2),
	addr1(10 downto 0), addr2(10 downto 0), clk1, clk2,
	di1(((i+1)*2)-1 downto i*2), di2(((i+1)*2)-1 downto i*2),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

  a12: if abits = 12 generate
    x : for i in 0 to ((dbits-1)/1) generate
      r0 : RAMB4_S1_S1
        generic map (SIM_COLLISION_CHECK => "GENERATE_X_ONLY")
        port map (
	do1(((i+1)*1)-1 downto i*1), do2(((i+1)*1)-1 downto i*1),
	addr1(11 downto 0), addr2(11 downto 0), clk1, clk2,
	di1(((i+1)*1)-1 downto i*1), di2(((i+1)*1)-1 downto i*1),
   	enable1, enable2, gnd, gnd, write1, write2);
    end generate;
  end generate;

-- pragma translate_off
  a_to_high : if abits > 12 generate
    x : process
    begin
      assert false
      report  "Address depth larger than 12 not supported for virtex_syncram_dp"
      severity failure;
      wait;
    end process;
  end generate;
-- pragma translate_on

end;

