-------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2011 Aeroflex Gaisler AB
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
  constant promfile  : string  := "prom.srec";        -- rom contents
  constant sdramfile : string  := "ram.srec";       -- sdram contents

  constant lresp    : boolean := false;

  signal reset            : std_ulogic := '1';
  signal clk48            : std_ulogic := '0';
  signal errorn           : std_logic;
  signal mcb3_dram_dq     : std_logic_vector(15 downto 0);
  signal mcb3_rzq         : std_logic;
  signal mcb3_zio         : std_logic;
  signal mcb3_dram_dqs    : std_logic_vector(1 downto 0);
  signal mcb3_dram_dqs_n  : std_logic_vector(1 downto 0);
  signal mcb3_dram_a      : std_logic_vector(12 downto 0);
  signal mcb3_dram_ba     : std_logic_vector(2 downto 0);
  signal mcb3_dram_cke    : std_logic;
  signal mcb3_dram_ras_n  : std_logic;
  signal mcb3_dram_cas_n  : std_logic;
  signal mcb3_dram_we_n   : std_logic;
  signal mcb3_dram_dm     : std_logic_vector(1 downto 0);
  signal mcb3_dram_udm    : std_logic;
  signal mcb3_dram_ck     : std_logic;
  signal mcb3_dram_ck_n   : std_logic;
  signal dsubre           : std_ulogic;       -- Debug Unit break (connect to button)
  signal dsuact           : std_ulogic;       -- Debug Unit break (connect to button)
  signal dsurx            : std_ulogic;
  signal dsutx            : std_ulogic;
  signal rxd1             : std_ulogic;
  signal txd1             : std_ulogic;
  signal sd_dat           : std_logic;
  signal sd_cmd           : std_logic;
  signal sd_sck           : std_logic;
  signal sd_dat3          : std_logic;


  signal csb             : std_logic := '0';   -- dummy
  
begin
  -- clock and reset
  clk48      <= not clk48 after 10.417 ns;
  reset      <= '1', '0' after 300 ns;
  dsubre     <= '0';

  sd_dat     <= 'H';
  sd_cmd     <= 'H';
  sd_sck     <= 'H';
  
  d3 : entity work.leon3mp
    generic map (fabtech, memtech, padtech, clktech, disas, dbguart, pclow)
    port map (
      reset            => reset,
      clk48            => clk48,
      -- Processor error output
      errorn           => errorn,
      -- DDR SDRAM
      mcb3_dram_dq     => mcb3_dram_dq,
      mcb3_rzq         => mcb3_rzq,
      mcb3_zio         => mcb3_zio,
      mcb3_dram_udqs   => mcb3_dram_dqs(1),
      mcb3_dram_udqs_n => mcb3_dram_dqs_n(1),
      mcb3_dram_dqs    => mcb3_dram_dqs(0),
      mcb3_dram_dqs_n  => mcb3_dram_dqs_n(0),
      mcb3_dram_a      => mcb3_dram_a,
      mcb3_dram_ba     => mcb3_dram_ba,
      mcb3_dram_cke    => mcb3_dram_cke,
      mcb3_dram_ras_n  => mcb3_dram_ras_n,
      mcb3_dram_cas_n  => mcb3_dram_cas_n,
      mcb3_dram_we_n   => mcb3_dram_we_n,
      mcb3_dram_dm     => mcb3_dram_dm(0),
      mcb3_dram_udm    => mcb3_dram_dm(1), 
      mcb3_dram_ck     => mcb3_dram_ck,
      mcb3_dram_ck_n   => mcb3_dram_ck_n,
      -- Debug support unit
      dsubre           => dsubre,
      dsuact           => dsuact,
      -- AHB UART (debug link)
      dsurx            => dsurx,
      dsutx            => dsutx, 
      -- UART
      rxd1             => rxd1,
      txd1             => txd1,
      -- SD card
      sd_dat           => sd_dat,
      sd_cmd           => sd_cmd,
      sd_sck           => sd_sck,
      sd_dat3          => sd_dat3
      );


  migddr2mem : if (CFG_MIG_DDR2 = 1) generate 
    ddr0 : ddr2ram
      generic map(width => 16, abits => 13, babits => 3, colbits => 10, rowbits => 13,
                  implbanks => 1, fname => sdramfile, speedbin=>9, density => 2,
                  lddelay => 115 us)
      port map (ck => mcb3_dram_ck, ckn => mcb3_dram_ck_n, cke => mcb3_dram_cke, csn => csb,
                odt => '0', rasn => mcb3_dram_ras_n, casn => mcb3_dram_cas_n, wen => mcb3_dram_we_n,
                dm => mcb3_dram_dm, ba => mcb3_dram_ba, a => mcb3_dram_a(12 downto 0),
                dq => mcb3_dram_dq, dqs => mcb3_dram_dqs, dqsn => mcb3_dram_dqs_n);
  end generate;

  --spimem0: if CFG_SPIMCTRL = 1 generate
  --  s0 : spi_flash generic map (ftype => 4, debug => 0, fname => promfile,
  --                              readcmd => CFG_SPIMCTRL_READCMD,
  --                              dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
  --                              dualoutput => 0)  -- Dual output is not supported in this design
  --    port map (spi_clk, spi_mosi, data(24), spi_sel_n);
  --end generate spimem0;

  iuerr : process
  begin
    wait for 5 us;
    assert (to_X01(errorn) = '1')
      report "*** IU in error mode, simulation halted ***"
      severity failure;
  end process;

  dsucom : process
    procedure dsucfg(signal dsurx : in std_ulogic; signal dsutx : out std_ulogic) is
      variable w32 : std_logic_vector(31 downto 0);
      variable c8  : std_logic_vector(7 downto 0);
      constant txp : time := 160 * 1 ns;
    begin
      dsutx  <= '1';
      wait;
      wait for 5000 ns;
      txc(dsutx, 16#55#, txp);          -- sync uart
      txc(dsutx, 16#a0#, txp);
      txa(dsutx, 16#40#, 16#00#, 16#00#, 16#00#, txp);
      rxi(dsurx, w32, txp, lresp);

-- txc(dsutx, 16#c0#, txp);
-- txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
-- txa(dsutx, 16#00#, 16#00#, 16#00#, 16#ef#, txp);
--
-- txc(dsutx, 16#c0#, txp);
-- txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
-- txa(dsutx, 16#00#, 16#00#, 16#ff#, 16#ff#, txp);
--
-- txc(dsutx, 16#c0#, txp);
-- txa(dsutx, 16#90#, 16#40#, 16#00#, 16#48#, txp);
-- txa(dsutx, 16#00#, 16#00#, 16#00#, 16#12#, txp);
--
-- txc(dsutx, 16#c0#, txp);
-- txa(dsutx, 16#90#, 16#40#, 16#00#, 16#60#, txp);
-- txa(dsutx, 16#00#, 16#00#, 16#12#, 16#10#, txp);
--
-- txc(dsutx, 16#80#, txp);
-- txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
-- rxi(dsurx, w32, txp, lresp);
    end;
  begin
    dsucfg(dsutx, dsurx);
    wait;
  end process;
end;


