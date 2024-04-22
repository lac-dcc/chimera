------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
------------------------------------------------------------------------------
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
library gaisler;
use gaisler.libdcom.all;
use gaisler.sim.all;
use work.debug.all;
library techmap;
use techmap.gencomp.all;
library micron;
use micron.components.all;
library grlib;
use grlib.stdlib.all;

use work.config.all;	-- configuration


entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 20;		-- system clock period
    romdepth  : integer := 22		-- rom address depth (flash 4 MB)
 --   sramwidth  : integer := 32;		-- ram data width (8/16/32)
 --   sramdepth  : integer := 20;		-- ram address depth
 --   srambanks  : integer := 2		-- number of ram banks
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal clk : std_logic := '0';
signal Rst    : std_logic := '0';			-- Reset
constant ct : integer := clkperiod/2;

signal address  : std_logic_vector(21 downto 0);
signal data     : std_logic_vector(31 downto 24);

signal romsn    : std_logic;
signal oen      : std_logic;
signal writen   : std_logic;
signal dsuen, dsutx, dsurx, dsubre, dsuact : std_logic;
signal dsurst   : std_logic;
signal error    : std_logic;
signal gpio_0	: std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal gpio_1	: std_logic_vector(CFG_GRGPIO2_WIDTH-1 downto 0);
    
signal sdcke    : std_logic;
signal sdcsn    : std_logic;
signal sdwen    : std_logic;                       -- write en
signal sdrasn   : std_logic;                       -- row addr stb
signal sdcasn   : std_logic;                       -- col addr stb
signal dram_ldqm : std_logic;
signal dram_udqm : std_logic;
signal sdclk    : std_logic;       

signal sw : std_logic_vector(0 to 2);      

signal ps2_clk       : std_logic;
signal ps2_dat       : std_logic;
signal vga_clk       : std_ulogic;
signal vga_blank     : std_ulogic;
signal vga_sync      : std_ulogic;
signal vga_hs        : std_ulogic;
signal vga_vs        : std_ulogic;
signal vga_r         : std_logic_vector(9 downto 0);
signal vga_g         : std_logic_vector(9 downto 0);
signal vga_b         : std_logic_vector(9 downto 0); 


constant lresp : boolean := false;


signal sa      	: std_logic_vector(13 downto 0);
signal sd   	: std_logic_vector(15 downto 0);


begin

  clk <= not clk after ct * 1 ns; --50 MHz clk 
  rst <= dsurst; --reset
  dsuen <= '1';
  dsubre <= '1'; -- inverted on the board
  sw(0) <= '1';
  gpio_0(CFG_GRGPIO_WIDTH-1 downto 0) <= (others => 'H');
  gpio_1(CFG_GRGPIO2_WIDTH-1 downto 0) <= (others => 'H');

  d3 : entity work.leon3mp
        generic map ( fabtech, memtech, padtech, clktech, disas, dbguart, pclow )
        port map (rst, clk, error, address(21 downto 0), data, 
	sa(11 downto 0), sa(12), sa(13), sd, sdclk, sdcke, sdcsn, sdwen, 
	sdrasn, sdcasn, dram_ldqm, dram_udqm, dsutx, dsurx, dsubre, dsuact,
	oen, writen, open, romsn, open, open, open, open, open, open, gpio_0, gpio_1,
        ps2_clk, ps2_dat, vga_clk, vga_blank, vga_sync, vga_hs, vga_vs, vga_r,
        vga_g, vga_b, sw);
  sd1 : if (CFG_SDCTRL = 1) generate
    u1: entity work.mt48lc16m16a2 generic map (addr_bits => 12, col_bits => 8, index => 1024, fname => sdramfile)
	PORT MAP(
            Dq => sd(15 downto 0), Addr => sa(11 downto 0),
            Ba => sa(13 downto 12), Clk => sdclk, Cke => sdcke,
            Cs_n => sdcsn, Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm(0) => dram_ldqm, Dqm(1) => dram_udqm );
  end generate;

  prom0 : sram generic map (index => 6, abits => romdepth, fname => promfile)
	port map (address(romdepth-1 downto 0), data(31 downto 24), romsn,
		  writen, oen);

  error <= 'H';			  -- ERROR pull-up

   iuerr : process
   begin
     wait for 2500 ns;
     if to_x01(error) = '1' then wait on error; end if;
     assert (to_x01(error) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  data <= buskeep(data) after 5 ns;
  sd <= buskeep(sd) after 5 ns;

  dsucom : process
    procedure dsucfg(signal dsurx : in std_logic; signal dsutx : out std_logic) is
    variable w32 : std_logic_vector(31 downto 0);
    variable c8  : std_logic_vector(7 downto 0);
    constant txp : time := 160 * 1 ns;
    begin
    dsutx <= '1';
    dsurst <= '0'; --reset low
    wait for 500 ns;
    dsurst <= '1'; --reset high
    wait; --evig w8
    wait for 5000 ns;
    txc(dsutx, 16#55#, txp);

--    txc(dsutx, 16#c0#, txp); --control byte
--    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp); --adress
--    txa(dsutx, 16#00#, 16#00#, 16#02#, 16#ae#, txp); --write data
--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#00#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#06#, 16#ae#, txp);
--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#24#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#06#, 16#03#, txp);
--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#06#, 16#fc#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2f#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#6f#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#11#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#04#, txp);
    txa(dsutx, 16#00#, 16#02#, 16#20#, 16#01#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#02#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#40#, 16#00#, 16#43#, 16#10#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#40#, 16#00#, 16#24#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#24#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#70#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#03#, txp);





    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#ff#, 16#ff#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#48#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#12#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#60#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#12#, 16#10#, txp);

    txc(dsutx, 16#80#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);

    txc(dsutx, 16#a0#, txp);
    txa(dsutx, 16#40#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);

    end;

  begin

    dsucfg(dsutx, dsurx);

    wait;
 end process;
end ;

