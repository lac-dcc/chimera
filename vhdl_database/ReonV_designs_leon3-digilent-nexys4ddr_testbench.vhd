-----------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
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
    pclow     : integer := CFG_PCLOW;
    USE_MIG_INTERFACE_MODEL : boolean := false;
    clkperiod : integer := 10           -- system clock period
    );
end;

architecture behav of testbench is
  constant promfile  : string  := "prom.srec";      -- rom contents
  constant sdramfile : string  := "ram.srec";       -- sdram contents

  constant lresp    : boolean := false;
  constant ct       : integer := clkperiod/2;

  constant CFG_DDR2SP_DATAWIDTH : integer := 16;

  signal clk        : std_logic := '0';
  signal rst        : std_logic := '0';
  signal rstn      : std_logic;
  signal error      : std_logic;

  -- PROM flash
  signal address    : std_logic_vector(26 downto 0):=(others =>'0');
  signal data       : std_logic_vector(31 downto 0);
  signal RamCE      : std_logic;
  signal oen        : std_ulogic;
  signal writen     : std_ulogic;

  -- Debug support unit
  signal dsubre     : std_ulogic;

  -- AHB Uart
  signal dsurx      : std_ulogic;
  signal dsutx      : std_ulogic;

  -- APB Uart
  signal urxd       : std_ulogic;
  signal utxd       : std_ulogic;

  -- Ethernet signals
  signal erx_er     : std_ulogic;
  signal erx_crs    : std_ulogic;
  signal etxdt      : std_logic_vector(1 downto 0);

  -- SVGA signals
  signal vid_hsync  : std_ulogic;
  signal vid_vsync  : std_ulogic;
  signal vid_r      : std_logic_vector(3 downto 0);
  signal vid_g      : std_logic_vector(3 downto 0);
  signal vid_b      : std_logic_vector(3 downto 0);

  -- SPI flash signals
  signal spi_sel_n  : std_logic;
  signal spi_clk    : std_logic;
  signal spi_data   : std_logic_vector(3 downto 0);

  -- Output signals for LEDs
  signal led       : std_logic_vector(15 downto 0);

  signal brdyn     : std_ulogic;
  signal sw        : std_logic_vector(15 downto 0):= (others =>'0');
  signal btn       : std_logic_vector(4 downto 0):= (others =>'0');

  signal ddr2_dq         :    std_logic_vector(15 downto 0);
  signal ddr2_addr       :    std_logic_vector(12 downto 0);
  signal ddr2_ba         :    std_logic_vector(2 downto 0);
  signal ddr2_ras_n      :    std_ulogic;
  signal ddr2_cas_n      :    std_ulogic;
  signal ddr2_we_n       :    std_ulogic;
  signal ddr2_cke        :    std_logic_vector(0 downto 0);
  signal ddr2_odt        :    std_logic_vector(0 downto 0);
  signal ddr2_cs_n       :    std_logic_vector(0 downto 0);
  signal ddr2_dm         :    std_logic_vector(1 downto 0);
  signal ddr2_dqs_p      :    std_logic_vector(1 downto 0);
  signal ddr2_dqs_n      :    std_logic_vector(1 downto 0);
  signal ddr2_ck_p       :    std_logic_vector(0 downto 0);
  signal ddr2_ck_n       :    std_logic_vector(0 downto 0);

  -- MIG DDR2 Simulation parameters
  constant SIM_BYPASS_INIT_CAL : string := "FAST";
          -- # = "OFF" -  Complete memory init &
          --               calibration sequence
          -- # = "SKIP" - Not supported
          -- # = "FAST" - Complete memory init & use
          --              abbreviated calib sequence

  constant SIMULATION          : string := "TRUE";
          -- Should be TRUE during design simulations and
          -- FALSE during implementations

begin
  -- clock and reset
  clk        <= not clk after ct * 1 ns;
  rst        <= '1', '0' after 100 ns;
  rstn       <= not rst;
  dsubre     <= '0';
  urxd       <= 'H';
  --spi_sel_n  <= 'H';
  --spi_clk    <= 'L';
  
  d3 : entity work.leon3mp
    generic map (fabtech, memtech, padtech, clktech, disas, dbguart, pclow, SIM_BYPASS_INIT_CAL, SIMULATION, USE_MIG_INTERFACE_MODEL)
    port map (
      sys_clk_i     => clk, btnCpuResetn => rstn,
      
      -- DDR2
      ddr2_dq   => ddr2_dq, ddr2_addr => ddr2_addr, ddr2_ba   => ddr2_ba,
      ddr2_ras_n => ddr2_ras_n, ddr2_cas_n => ddr2_cas_n, ddr2_we_n  => ddr2_we_n,
      ddr2_cke   => ddr2_cke, ddr2_odt   => ddr2_odt, ddr2_cs_n  => ddr2_cs_n,
      ddr2_dm    => ddr2_dm, ddr2_dqs_p => ddr2_dqs_p, ddr2_dqs_n => ddr2_dqs_n,
      ddr2_ck_p  => ddr2_ck_p, ddr2_ck_n  => ddr2_ck_n,

      -- AHB Uart
      uart_txd_in     => dsurx,
      uart_rxd_out    => dsutx,

      -- PHY
      eth_crsdv      => erx_crs,
      eth_rxd        => etxdt,
      eth_rxerr      => erx_er,

      -- SPI
      QspiCSn    => spi_sel_n,
      QspiDB     => spi_data,
      QspiClk    => spi_clk,

      -- Output signals for LEDs
      led       => led,
      sw        => sw,
      btn       => btn);
      

  ddr2mem0 : ddr2ram
    generic map(width => CFG_DDR2SP_DATAWIDTH, abits => 13, babits => 3, colbits => 10, rowbits => 13,
                implbanks => 8, fname => sdramfile, speedbin=>1, density => 3, lddelay => (0 ns), swap => CFG_MIG_7SERIES, ldguard => 1)
    port map (ck => ddr2_ck_p(0), ckn => ddr2_ck_n(0), cke => ddr2_cke(0), csn => ddr2_cs_n(0),
              odt => ddr2_odt(0), rasn => ddr2_ras_n, casn => ddr2_cas_n, wen => ddr2_we_n,
              dm => ddr2_dm, ba => ddr2_ba, a => ddr2_addr, dq => ddr2_dq(15 downto 0),
              dqs => ddr2_dqs_p, dqsn =>ddr2_dqs_n, doload => led(4));

  spimem0: if CFG_SPIMCTRL = 1 generate
    s0 : spi_flash generic map (ftype => 4, debug => 0, fname => promfile,
                                readcmd => CFG_SPIMCTRL_READCMD,
                                dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                                dualoutput => CFG_SPIMCTRL_DUALOUTPUT) 
      port map (spi_clk, spi_data(0), spi_data(1), spi_sel_n);
  end generate spimem0;

  -- Ethernet model diasbled
  erx_crs <= '0'; etxdt<= (others =>'0'); erx_er<= '0';

  led(3) <= 'L';            -- ERROR pull-down
  error <= not led(3);      

  iuerr : process
    variable datav : std_logic_vector(31 downto 0);
  begin
    wait for 10 us;
    assert (to_X01(error) = '1')
      report "*** IU in error mode, simulation halted ***"
      severity failure;  
  end process;

  data <= buskeep(data) after 5 ns;

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


