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

  constant ct       : integer := clkperiod/2;

  -- MIG Simulation parameters
  constant SIM_BYPASS_INIT_CAL : string := "FAST";
          -- # = "OFF" -  Complete memory init &
          --               calibration sequence
          -- # = "SKIP" - Not supported
          -- # = "FAST" - Complete memory init & use
          --              abbreviated calib sequence

  constant SIMULATION          : string := "TRUE";
          -- Should be TRUE during design simulations and
          -- FALSE during implementations

  signal sysclk             : std_ulogic := '0';
  -- LEDs
  signal led                : std_logic_vector(7 downto 0);
  -- Buttons
  signal btnc               : std_ulogic;
  signal btnd               : std_ulogic;
  signal btnl               : std_ulogic;
  signal btnr               : std_ulogic;
  signal cpu_resetn         : std_ulogic;
  -- Switches
  signal sw                 : std_logic_vector(7 downto 0);    
  -- USB-RS232 interface
  signal uart_tx_in         : std_logic;
  signal uart_rx_out        : std_logic;
  -- DDR3
  signal ddr3_dq            : std_logic_vector(15 downto 0);
  signal ddr3_dqs_p         : std_logic_vector(1 downto 0);
  signal ddr3_dqs_n         : std_logic_vector(1 downto 0);
  signal ddr3_addr          : std_logic_vector(14 downto 0);
  signal ddr3_ba            : std_logic_vector(2 downto 0);
  signal ddr3_ras_n         : std_logic;
  signal ddr3_cas_n         : std_logic;
  signal ddr3_we_n          : std_logic;
  signal ddr3_reset_n       : std_logic;
  signal ddr3_ck_p          : std_logic_vector(0 downto 0);
  signal ddr3_ck_n          : std_logic_vector(0 downto 0);
  signal ddr3_cke           : std_logic_vector(0 downto 0);
  signal ddr3_dm            : std_logic_vector(1 downto 0);
  signal ddr3_odt           : std_logic_vector(0 downto 0);
  -- Fan PWM
  signal fan_pwm            : std_ulogic;    
  -- SPI
  signal qspi_cs            : std_logic;
  signal qspi_dq            : std_logic_vector(3 downto 0);
  signal scl                : std_ulogic;

  signal gnd                : std_ulogic;

  signal phy_gtxclk      : std_logic := '0';
  signal phy_txer        : std_ulogic;
  signal phy_txd         : std_logic_vector(7 downto 0);
  signal phy_txctl_txen  : std_ulogic;
  signal phy_txclk       : std_ulogic;
  signal phy_rxer        : std_ulogic;
  signal phy_rxd         : std_logic_vector(7 downto 0);
  signal phy_rxctl_rxdv  : std_ulogic;
  signal phy_rxclk       : std_ulogic;
  signal phy_reset       : std_ulogic;
  signal phy_mdio        : std_logic;
  signal phy_mdc         : std_ulogic;
  signal phy_crs         : std_ulogic;
  signal phy_col         : std_ulogic;
  signal phy_int         : std_ulogic;
  signal phy_rxdl        : std_logic_vector(7 downto 0);
  signal phy_txdl        : std_logic_vector(7 downto 0);
  
begin

  gnd <= '0';

  -- clock and reset
  sysclk        <= not sysclk after ct * 1 ns;
  cpu_resetn    <= '0', '1' after 100 ns;

  d3 : entity work.leon3mp
    generic map (fabtech, memtech, padtech, clktech, disas, dbguart, pclow,
                 SIM_BYPASS_INIT_CAL, SIMULATION, USE_MIG_INTERFACE_MODEL)
    port map (
      sysclk => sysclk, led => led,
      btnc => btnc, btnd => btnd, btnl => btnl, btnr => btnr,
      cpu_resetn => cpu_resetn,
      sw => sw,
      uart_tx_in => uart_tx_in, uart_rx_out => uart_rx_out,
      ddr3_dq => ddr3_dq, ddr3_dqs_p => ddr3_dqs_p, ddr3_dqs_n => ddr3_dqs_n,
      ddr3_addr => ddr3_addr, ddr3_ba => ddr3_ba,
      ddr3_ras_n => ddr3_ras_n, ddr3_cas_n => ddr3_cas_n,
      ddr3_we_n => ddr3_we_n, ddr3_reset_n => ddr3_reset_n,
      ddr3_ck_p => ddr3_ck_p, ddr3_ck_n => ddr3_ck_n,
      ddr3_cke => ddr3_cke, ddr3_dm  => ddr3_dm, ddr3_odt => ddr3_odt,
      fan_pwm => fan_pwm,
      qspi_cs => qspi_cs, qspi_dq => qspi_dq, scl => scl,
      phy_txclk       => phy_gtxclk,
      phy_txd         => phy_txd(3 downto 0),
      phy_txctl_txen  => phy_txctl_txen,
      phy_rxd         => phy_rxd(3 downto 0)'delayed(0 ns),
      phy_rxctl_rxdv  => phy_rxctl_rxdv'delayed(0 ns),
      phy_rxclk       => phy_rxclk'delayed(0 ns),
      phy_reset       => phy_reset,
      phy_mdio        => phy_mdio,
      phy_mdc         => phy_mdc,
      phy_int         => '0'
     );

  ddr3mem0 : ddr3ram
    generic map(
      width => 16, abits => 15, colbits => 10, rowbits => 13,
      implbanks => 8, fname => sdramfile, speedbin=>1, density => 3, lddelay => (0 ns))
--      swap => CFG_MIG_7SERIES)
    port map (ck => ddr3_ck_p(0), ckn => ddr3_ck_n(0), cke => ddr3_cke(0), csn => gnd,
              odt => ddr3_odt(0), rasn => ddr3_ras_n, casn => ddr3_cas_n, wen => ddr3_we_n,
              dm => ddr3_dm, ba => ddr3_ba, a => ddr3_addr,
              resetn => ddr3_reset_n,
              dq => ddr3_dq(15 downto 0),
              dqs => ddr3_dqs_p, dqsn => ddr3_dqs_n, doload => led(4));

  spimem0: if CFG_SPIMCTRL = 1 generate
    s0 : spi_flash generic map (ftype => 4, debug => 0, fname => promfile,
                                readcmd => CFG_SPIMCTRL_READCMD,
                                dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                                dualoutput => CFG_SPIMCTRL_DUALOUTPUT) 
      port map (scl, qspi_dq(0), qspi_dq(1), qspi_cs);
  end generate spimem0;

  phy0 : if (CFG_GRETH = 1) generate

   phy_mdio <= 'H';
   phy_int <= '0';
   p0: phy
    generic map (
             address       => 7,
             extended_regs => 1,
             aneg          => 1,
             base100_t4    => 1,
             base100_x_fd  => 1,
             base100_x_hd  => 1,
             fd_10         => 1,
             hd_10         => 1,
             base100_t2_fd => 1,
             base100_t2_hd => 1,
             base1000_x_fd => 1,
             base1000_x_hd => 1,
             base1000_t_fd => 1,
             base1000_t_hd => 1,
             rmii          => 0,
             rgmii         => 1
    )
    port map(phy_reset, phy_mdio, phy_txclk, phy_rxclk, phy_rxd,
             phy_rxctl_rxdv, phy_rxer, phy_col, phy_crs, phy_txd,
             phy_txctl_txen, phy_txer, phy_mdc, phy_gtxclk);

  end generate;

  iuerr : process
  begin
    wait for 10 us;
    assert (to_X01(led(3)) = '0')
      report "*** IU in error mode, simulation halted ***"
      severity failure;  
  end process;

end;


