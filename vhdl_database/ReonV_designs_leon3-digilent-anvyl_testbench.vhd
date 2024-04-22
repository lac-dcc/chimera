-----------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
--
--  Modified by Joris van Rantwijk to support Digilent Atlys board.
--  Modified by Aeroflex Gaisler
--
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
use std.textio.all;
library gaisler;
use gaisler.libdcom.all;
use gaisler.sim.all;
library techmap;
use techmap.gencomp.all;
use work.debug.all;
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

    clkperiod : integer := 20		-- system clock period
  );
end; 

architecture behav of testbench is

  constant promfile  : string := "prom.srec";  -- rom contents
  constant sdramfile : string := "ram.srec"; -- sdram contents

  signal clk      : std_logic := '0';
  signal rst      : std_logic := '0';			-- Reset

  signal GND      : std_ulogic := '0';
  signal VCC      : std_ulogic := '1';
  signal NC       : std_ulogic := 'Z';

  -- DDR2 memory
  signal ddr_clk     : std_logic;
  signal ddr_clkb    : std_logic;
  signal ddr_cke     : std_logic;
  signal ddr_odt     : std_logic;
  signal ddr_we      : std_ulogic;
  signal ddr_ras     : std_ulogic;
  signal ddr_cas     : std_ulogic;
  signal ddr_dm      : std_logic_vector (1 downto 0);
  signal ddr_dqs     : std_logic_vector (1 downto 0);
  signal ddr_dqsn    : std_logic_vector (1 downto 0);
  signal ddr_ad      : std_logic_vector (12 downto 0);
  signal ddr_ba      : std_logic_vector (2 downto 0);
  signal ddr_dq      : std_logic_vector (15 downto 0);
  signal ddr_dq2     : std_logic_vector (15 downto 0);
 
  signal dsuen        : std_ulogic;     -- switch(7)
  signal dsubre       : std_ulogic;     -- switch(6)
  signal dsuact       : std_ulogic;    -- led(6)
  signal errorn       : std_ulogic;    -- led(7)

  signal txd1        : std_ulogic;          -- UART1 tx data
  signal rxd1        : std_ulogic;          -- UART1 rx data

  -- GPIO
  signal led         : std_logic_vector(5 downto 0);
  signal switch      : std_logic_vector(5 downto 0);
  signal gyrled      : std_logic_vector(5 downto 0);
  signal button      : std_logic_vector(2 downto 0);
  signal dipswitch   : std_logic_vector(7 downto 0);

  -- SMSC ethernet PHY
  signal PhyCrs          : std_ulogic;
  signal PhyClk50Mhz     : std_ulogic;  -- from Refclk from Phy to rmii 

  signal PhyTxd          : std_logic_vector(1 downto 0);
  signal PhyTxEn         : std_ulogic;

  signal PhyRxd          : std_logic_vector(1 downto 0);
  signal PhyRxEr         : std_ulogic;

  signal PhyMdc          : std_ulogic;
  signal PhyMdio         : std_logic;

  -- PS/2
  signal kbd_clk     : std_logic;
  signal kbd_data    : std_logic;
  signal mou_clk     : std_logic;
  signal mou_data    : std_logic;

  -- SPI flash
  signal spi_sel_n   : std_logic;
  signal spi_clk     : std_logic;
  signal spi_miso    : std_logic;
  signal spi_mosi    : std_logic;

  -- HDMI port
  signal tmdstx_clk_p : std_logic;
  signal tmdstx_clk_n : std_logic;
  signal tmdstx_dat_p : std_logic_vector(2 downto 0);
  signal tmdstx_dat_n : std_logic_vector(2 downto 0);

begin

  -- system clock
  clk <= (not clk) after clkperiod * 0.5 ns;

  -- reset
  rst <= '0', '1' after 2500 ns;

  rxd1 <= 'H';
  kbd_clk <= 'H'; kbd_data <= 'H';

  -- enable DSU
  dsuen <= '1';
  dsubre <= '0';

  cpu : entity work.leon3mp
    generic map (
      fabtech   => fabtech,
      memtech   => memtech,
      padtech   => padtech,
      clktech   => clktech,
      disas     => disas,
      dbguart   => dbguart,
      pclow     => pclow )
    port map (
      resetn       => rst,
      clk          => clk,
      ddr_clk      => ddr_clk,
      ddr_clkb     => ddr_clkb,
      ddr_cke      => ddr_cke,
      ddr_odt      => ddr_odt,
      ddr_we       => ddr_we,
      ddr_ras      => ddr_ras,
      ddr_cas      => ddr_cas,
      ddr_dm       => ddr_dm,
      ddr_dqs      => ddr_dqs,
      ddr_dqsn     => ddr_dqsn,
      ddr_ad       => ddr_ad,
      ddr_ba       => ddr_ba,
      ddr_dq       => ddr_dq,
      dsuen        => dsuen,
      dsubre       => dsubre,
      dsuact       => dsuact,
      errorn       => errorn,
      txd1         => txd1,
      rxd1         => rxd1,
      led          => led,
      switch       => switch,
      gyrled       => gyrled,
      button       => button,
      dipswitch    => dipswitch,
      PhyCrs       => PhyCrs,
      PhyClk50Mhz  => PhyClk50Mhz,
      PhyTxd       => PhyTxd,
      PhyTxEn      => PhyTxEn,
      PhyRxd       => PhyRxd,
      PhyRxEr      => PhyRxEr,
      PhyMdc       => PhyMdc,
      PhyMdio      => PhyMdio,
      kbd_clk      => kbd_clk,
      kbd_data     => kbd_data,
      mou_clk      => mou_clk,
      mou_data     => mou_data,
      spi_sel_n    => spi_sel_n,
      spi_clk      => spi_clk,
      spi_miso     => spi_miso,
      spi_mosi     => spi_mosi,
      tmdstx_clk_p => open,
      tmdstx_clk_n => open,
      tmdstx_dat_p => open,
      tmdstx_dat_n => open );

  prom0 : spi_flash
    generic map (
      ftype      => 4,
      debug      => 0,
      fname      => promfile,
      readcmd    => CFG_SPIMCTRL_READCMD,
      dummybyte  => CFG_SPIMCTRL_DUMMYBYTE,
      dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
      memoffset  => CFG_SPIMCTRL_OFFSET)
    port map (
      sck       => spi_clk,
      di        => spi_mosi,
      do        => spi_miso,
      csn       => spi_sel_n );

  u1: ddr2ram
    generic map (width => 16, abits => 13, babits => 3,
                 colbits => 10, rowbits => 13, implbanks => 8,
                 fname => sdramfile, speedbin => 1)
    port map (ck => ddr_clk, ckn => ddr_clkb, cke => ddr_cke, csn => GND,
              odt => ddr_odt, rasn => ddr_ras, casn => ddr_cas, wen => ddr_we,
              dm => ddr_dm, ba => ddr_ba, a => ddr_ad,
              dq => ddr_dq2, dqs => ddr_dqs, dqsn => ddr_dqsn);

  ddr2delay0 : delay_wire 
    generic map(data_width => ddr_dq'length, delay_atob => 0.0, delay_btoa => 13.5)
    port map(a => ddr_dq, b => ddr_dq2);

  ps2_device(kbd_clk, kbd_data);

  iuerr: process
  begin
    wait for 5000 ns;
    if to_x01(errorn) = '1' then wait on errorn; end if;
    assert (to_x01(errorn) = '1') 
      report "*** IU in error mode, simulation halted ***"
      severity failure ;
  end process;

end;

