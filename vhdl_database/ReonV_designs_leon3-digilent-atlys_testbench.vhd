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
  signal ddr_clk    : std_logic;
  signal ddr_clkb   : std_logic;
  signal ddr_cke    : std_logic;
  signal ddr_we     : std_ulogic;                       -- write enable
  signal ddr_ras    : std_ulogic;                       -- ras
  signal ddr_cas    : std_ulogic;                       -- cas
  signal ddr_dm     : std_logic_vector(1 downto 0);     -- dm
  signal ddr_dqs    : std_logic_vector(1 downto 0);     -- dqs
  signal ddr_dqsn   : std_logic_vector(1 downto 0);     -- dqsn
  signal ddr_ad     : std_logic_vector(12 downto 0);    -- address
  signal ddr_ba     : std_logic_vector(2 downto 0);     -- bank address
  signal ddr_dq     : std_logic_vector(15 downto 0);    -- data
  signal ddr_dq2    : std_logic_vector(15 downto 0);    -- data
  signal ddr_odt    : std_logic;
  signal ddr_rzq    : std_logic;
  signal ddr_zio    : std_logic;
  signal ddr_csb    : std_ulogic := '0';
  
  signal txd1, rxd1 : std_logic;       

  signal genio      : std_logic_vector(7 downto 0) := (others => '0');
  signal switch     : std_logic_vector(7 downto 0) := (others => '0');
  signal led        : std_logic_vector(7 downto 0);
  signal button     : std_logic_vector(4 downto 0) := (others => '0');

  -- Ethernet
  signal erx_clk    : std_ulogic;
  signal erxd       : std_logic_vector(7 downto 0);
  signal erx_dv     : std_ulogic;
  signal erx_er     : std_ulogic;
  signal erx_col    : std_ulogic;
  signal erx_crs    : std_ulogic;
  signal etx_clk    : std_ulogic;
  signal etxd       : std_logic_vector(7 downto 0);
  signal etx_en     : std_ulogic;
  signal etx_er     : std_ulogic;
  signal egtxclk    : std_ulogic;
  signal emdc       : std_ulogic;
  signal emdio      : std_logic;
  signal emdint     : std_ulogic;

  signal ps2clk     : std_logic_vector(1 downto 0);
  signal ps2data    : std_logic_vector(1 downto 0);

   -- SPI flash
  signal spi_sel_n  : std_logic;
  signal spi_clk    : std_ulogic;
  signal spi_dq0   : std_logic;
  signal spi_dq1   : std_logic;
  signal spi_dq2   : std_logic;
  signal spi_dq3   : std_logic;
  
  signal errorn     : std_logic;

begin

  -- system clock
  clk <= (not clk) after clkperiod * 0.5 ns;

  -- reset
  rst <= '0', '1' after 2500 ns;

  rxd1 <= 'H';
  ps2clk <= "HH"; ps2data <= "HH";

  -- enable DSU
  switch(7) <= '1';
  switch(6) <= '0';

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
      resetn    => rst,
      clk       => clk,
      ddr_clk   => ddr_clk,
      ddr_clkb  => ddr_clkb,
      ddr_cke   => ddr_cke,
      ddr_odt   => ddr_odt,
      ddr_we    => ddr_we,
      ddr_ras   => ddr_ras,
      ddr_cas   => ddr_cas,
      ddr_dm    => ddr_dm,
      ddr_dqs   => ddr_dqs,
      ddr_dqsn  => ddr_dqsn,
      ddr_ad    => ddr_ad,
      ddr_ba    => ddr_ba,
      ddr_dq    => ddr_dq,
      ddr_rzq   => ddr_rzq,
      ddr_zio   => ddr_zio,
      txd1      => txd1,
      rxd1      => rxd1,
      pmoda     => genio,
      switch    => switch,
      led       => led,
      button    => button,
      erx_clk   => erx_clk,
      erxd      => erxd,
      erx_dv    => erx_dv,
      erx_er    => erx_er,
      erx_col   => erx_col,
      erx_crs   => erx_crs,
      etx_clk   => etx_clk,
      etxd      => etxd,
      etx_en    => etx_en,
      etx_er    => etx_er,
      erst      => open,
      egtxclk   => egtxclk,
      emdc      => emdc,
      emdio     => emdio,
      emdint    => emdint,
      kbd_clk   => ps2clk(0),
      kbd_data  => ps2data(0),
      mou_clk   => ps2clk(1),
      mou_data  => ps2data(1),
      spi_sel_n => spi_sel_n,
      spi_clk   => spi_clk,
      spi_dq1   => spi_dq1,
      spi_dq0   => spi_dq0,
      spi_dq2   => spi_dq2,
      spi_dq3   => spi_dq3,
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
      di        => spi_dq0,
      do        => spi_dq1,
      csn       => spi_sel_n );

  u1: ddr2ram
    generic map (width => 16, abits => 13, babits => 3,
                 colbits => 10, rowbits => 13, implbanks => 8,
                 fname => sdramfile, speedbin => 1)
    port map (ck => ddr_clk, ckn => ddr_clkb, cke => ddr_cke, csn => ddr_csb,
              odt => ddr_odt, rasn => ddr_ras, casn => ddr_cas, wen => ddr_we,
              dm => ddr_dm, ba => ddr_ba, a => ddr_ad,
              dq => ddr_dq2, dqs => ddr_dqs, dqsn => ddr_dqsn);

  ddr2delay0 : delay_wire 
    generic map(data_width => ddr_dq'length, delay_atob => 0.0, delay_btoa => 13.5)
    port map(a => ddr_dq, b => ddr_dq2);

  ps2devs: for i in 0 to 1 generate
    ps2_device(ps2clk(i), ps2data(i));
  end generate ps2devs;

  phy0 : if (CFG_GRETH = 1) generate
    emdio <= 'H'; 
    p0: phy
      generic map (base1000_t_fd => 0, base1000_t_hd => 0, address => 7)
      port map (rst, emdio, etx_clk, erx_clk, erxd, erx_dv,
        erx_er, erx_col, erx_crs, etxd, etx_en, etx_er, emdc, egtxclk);
  end generate;

  -- Monitor error indication.
  errorn <= not led(7);

  iuerr: process
  begin
    wait for 5000 ns;
    if to_x01(errorn) = '1' then wait on errorn; end if;
    assert (to_x01(errorn) = '1') 
      report "*** IU in error mode, simulation halted ***"
      severity failure ;
  end process;

  -- Write serial port output to stdout.
  --uart0: process
  --  constant bit_interval : time := 1 sec / 38400.0;
  --  variable d : std_logic_vector(7 downto 0);
  --  variable c : character;
  --  variable lin : line;
  --begin
  --  rxc(txd1, d, bit_interval);
  --  c := character'val(conv_integer(d));
  --  if c = LF then
  --    std.textio.writeline(output, lin);
  --  elsif c /= CR then
  --    std.textio.write(lin, c);
  --  end if;
  --end process;

end;

