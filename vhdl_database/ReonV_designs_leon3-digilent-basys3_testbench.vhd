-----------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2016 Cobham Gaisler
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
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.libdcom.all;
use gaisler.sim.all;
library techmap;
use techmap.gencomp.all;
use work.debug.all;

use work.config.all;

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;   -- Print UART on console
    pclow     : integer := CFG_PCLOW
    );
end;

architecture behav of testbench is
  constant promfile  : string  := "prom.srec";      -- rom contents

  constant lresp    : boolean := false;

  signal clk                : std_ulogic := '0';
  -- Switches
  signal sw                 : std_logic_vector(15 downto 0);
  -- LEDs
  signal led                : std_logic_vector(15 downto 0);
  -- Buttons
  signal btnc               : std_ulogic;
  signal btnu               : std_ulogic;
  signal btnl               : std_ulogic;
  signal btnr               : std_ulogic;
  signal btnd               : std_ulogic;
  -- VGA connector
  signal vgared             : std_logic_vector(3 downto 0);
  signal vgablue            : std_logic_vector(3 downto 0);
  signal vgagreen           : std_logic_vector(3 downto 0);
  signal hsync              : std_ulogic;
  signal vsync              : std_ulogic;
  -- USB-RS232 interface
  signal rstx               : std_logic;
  signal rsrx               : std_logic;
  -- SPI
  signal spi_sim_sck        : std_logic;
  signal qspicsn            : std_logic;
  signal qspidb             : std_logic_vector(3 downto 0);

begin
  -- clock and reset
  clk        <= not clk after 5 ns;
  btnc        <= '1', '0' after 100 ns;
  
  d3 : entity work.leon3mp
    generic map (fabtech, memtech, padtech, clktech, disas, dbguart, pclow,
                 use_ahbram_sim => 1)
    port map (
      clk => clk, sw => sw, led => led,
      btnc => btnc, btnu => btnu, btnl => btnl, btnr => btnr, btnd => btnd,
      vgared => vgared, vgablue => vgablue, vgagreen => vgagreen,
      hsync => hsync, vsync => vsync,
      rstx => rstx, rsrx => rsrx,
      spi_sim_sck => spi_sim_sck,
      qspicsn => qspicsn, qspidb => qspidb);

  spimem0: if CFG_SPIMCTRL = 1 generate
    s0 : spi_flash generic map (ftype => 4, debug => 0, fname => promfile,
                                readcmd => CFG_SPIMCTRL_READCMD,
                                dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                                dualoutput => CFG_SPIMCTRL_DUALOUTPUT) 
      port map (spi_sim_sck, qspidb(0), qspidb(1), qspicsn);
  end generate spimem0;

  iuerr : process
  begin
    wait for 10 us;
    assert (to_X01(led(3)) = '0')
      report "*** IU in error mode, simulation halted ***"
      severity failure;  
  end process;

end;


