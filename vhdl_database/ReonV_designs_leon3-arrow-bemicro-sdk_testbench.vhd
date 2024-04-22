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
--  LEON3 BeMicro SDK design testbench
--  Copyright (C) 2011 - 2013 Aeroflex Gaisler
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.sim.all;
library techmap;
use techmap.gencomp.all;

use work.config.all;	-- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 20		-- system clock period
  );
end; 

architecture behav of testbench is

  constant promfile  : string := "prom.srec";  -- rom contents
  constant sramfile  : string := "ram.srec";  -- ram contents
  constant sdramfile : string := "ram.srec"; -- sdram contents

  constant ct : integer := clkperiod/2;

  signal cpu_rst_n    : std_ulogic := '0';
  signal clk_fpga_50m : std_ulogic := '0';
    
  -- DDR SDRAM
  signal ram_a        : std_logic_vector (13 downto 0);   -- ddr address
  signal ram_ck_p     : std_logic;
  signal ram_ck_n     : std_logic;
  signal ram_cke      : std_logic;
  signal ram_cs_n     : std_logic;
  signal ram_ws_n     : std_ulogic;                       -- ddr write enable
  signal ram_ras_n    : std_ulogic;                       -- ddr ras
  signal ram_cas_n    : std_ulogic;                       -- ddr cas
  signal ram_dm       : std_logic_vector(1 downto 0);     -- ram_udm & ram_ldm
  signal ram_dqs      : std_logic_vector (1 downto 0);    -- ram_udqs & ram_lqds
  signal ram_ba       : std_logic_vector (1 downto 0);    -- ddr bank address
  signal ram_d        : std_logic_vector (15 downto 0);   -- ddr data
  
  -- Ethernet PHY
  signal txd          : std_logic_vector(3 downto 0);
  signal rxd          : std_logic_vector(3 downto 0);
  signal tx_clk       : std_logic;
  signal rx_clk       : std_logic;
  signal tx_en        : std_logic;
  signal rx_dv        : std_logic;
  signal eth_crs      : std_logic;
  signal rx_er        : std_logic;
  signal eth_col      : std_logic;
  signal mdio         : std_logic;
  signal mdc          : std_logic;
  signal eth_reset_n  : std_logic;

  -- Temperature sensor
  signal temp_sc      : std_logic;
  signal temp_cs_n    : std_logic;
  signal temp_sio     : std_logic;
    
  -- LEDs
  signal f_led        : std_logic_vector(7 downto 0);
  
  -- User push-button
  signal pbsw_n       : std_logic;
  
  -- Reconfig SW1 and SW2
  signal reconfig_sw  : std_logic_vector(2 downto 1);
  
  -- SD card interface
  signal sd_dat0      : std_logic;
  signal sd_dat1      : std_logic;
  signal sd_dat2      : std_logic;
  signal sd_dat3      : std_logic;
  signal sd_cmd       : std_logic;
  signal sd_clk       : std_logic;
  
  -- Ethernet PHY sim model
  signal phy_tx_er    : std_ulogic;
  signal phy_gtx_clk  : std_ulogic;
  signal txdt         : std_logic_vector(7 downto 0) := (others => '0');
  signal rxdt         : std_logic_vector(7 downto 0) := (others => '0');

  -- EPCS
  signal epcs_data    : std_ulogic;
  signal epcs_dclk    : std_ulogic;
  signal epcs_csn     : std_logic;
  signal epcs_asdi    : std_logic;
  
begin

  -- clock and reset
  clk_fpga_50m <= not clk_fpga_50m after ct * 1 ns;
  cpu_rst_n <= '0', '1' after 200 ns;
  
  -- Push button, connected to DSU break, kept high
  pbsw_n <= 'H';

  reconfig_sw <= (others => 'H');
  
  -- LEON3 SoC
  d3 : entity work.leon3mp
    generic map (fabtech, memtech, padtech, clktech, ncpu, disas, dbguart, pclow)
    port map (
      cpu_rst_n, clk_fpga_50m,
      -- DDR SDRAM
      ram_a, ram_ck_p, ram_ck_n, ram_cke, ram_cs_n, ram_ws_n,
      ram_ras_n, ram_cas_n, ram_dm, ram_dqs, ram_ba, ram_d,
      -- Ethernet PHY
      txd, rxd, tx_clk, rx_clk, tx_en, rx_dv, eth_crs, rx_er,
      eth_col, mdio, mdc, eth_reset_n,
      -- Temperature sensor
      temp_sc, temp_cs_n, temp_sio,
      -- LEDs
      f_led,
      -- User push-button
      pbsw_n,
      -- Reconfig SW1 and SW2
      reconfig_sw,
      -- SD card interface
      sd_dat0, sd_dat1, sd_dat2, sd_dat3, sd_cmd, sd_clk,
      -- EPCS
      epcs_data, epcs_dclk, epcs_csn, epcs_asdi
    ); 

  -- SD card signals
  spiflashmod0 : spi_flash
    generic map (ftype => 3, debug => 0, dummybyte => 0)
    port map (sck => sd_clk, di => sd_cmd, do => sd_dat0, csn => sd_dat3);
  sd_dat0  <= 'Z'; sd_cmd  <= 'Z';

  -- EPCS
  spi0: spi_flash
    generic map (
      ftype => 4, debug => 0, fname => promfile, readcmd => CFG_SPIMCTRL_READCMD,
      dummybyte  => CFG_SPIMCTRL_DUMMYBYTE, dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
      memoffset  => CFG_SPIMCTRL_OFFSET)
    port map (sck => epcs_dclk, di => epcs_asdi, do => epcs_data,
              csn => epcs_csn, sd_cmd_timeout  => open,
              sd_data_timeout => open);
  
  -- On the BeMicro the temp_* signals are connected to a temperature sensor
  temp_sc <= 'H'; temp_sio <= 'H';
  
  -- DDR memory
  ddr0 : ddrram
    generic map(width => 16, abits => 14, colbits => 10, rowbits => 13,
                implbanks => 1, fname => sdramfile, density => 2)
    port map (ck => ram_ck_p, cke => ram_cke, csn => ram_cs_n,
              rasn => ram_ras_n, casn => ram_cas_n, wen => ram_ws_n,
              dm => ram_dm, ba => ram_ba, a => ram_a, dq => ram_d,
              dqs => ram_dqs);
  
  -- Ethernet PHY
  mdio <= 'H'; phy_tx_er <= '0'; phy_gtx_clk <= '0';
  txdt(3 downto 0) <= txd; rxd <= rxdt(3 downto 0);
  p0: phy
    generic map(base1000_t_fd => 0, base1000_t_hd => 0, address => 1)
    port map(eth_reset_n, mdio, tx_clk, rx_clk, rxdt, rx_dv,
             rx_er, eth_col, eth_crs, txdt, tx_en, phy_tx_er, mdc,
             phy_gtx_clk);

  -- LEDs
  f_led <= (others => 'H');
  
  -- Processor error mode indicator is connected to led(6).
  iuerr : process
  begin
    wait for 2500 ns;
    if to_x01(f_led(6)) = '1' then wait on f_led(6); end if;
    assert (to_x01(f_led(6)) = '1') 
      report "*** IU in error mode, simulation halted ***"
      severity failure ;
  end process;

end ;

