------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2013 Aeroflex Gaisler
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
use gaisler.net.all;
use work.debug.all;
library techmap;
use techmap.gencomp.all;
library micron;
use micron.components.all;
library grlib;
use grlib.stdlib.all;
use grlib.amba.all;

use work.config.all;    -- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;   -- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 10;          -- system clock period
    romdepth  : integer := 25;          -- rom address depth
    sramwidth  : integer := 32;         -- ram data width (8/16/32)
    sramdepth  : integer := 20;         -- ram address depth
    srambanks  : integer := 2           -- number of ram banks
    );
end; 

architecture behav of testbench is

  constant promfile  : string := "prom.srec";  -- rom contents
  constant sramfile  : string := "ram.srec";  -- ram contents
  constant sdramfile : string := "ram.srec"; -- sdram contents

  constant ct : integer := clkperiod/2;

  -- clocks
  signal OSC_50_BANK2  : std_logic := '0';
  signal OSC_50_BANK3  : std_logic := '0';
  signal OSC_50_BANK4  : std_logic := '0';
  signal OSC_50_BANK5  : std_logic := '0';
  signal OSC_50_BANK6  : std_logic := '0';
  signal OSC_50_BANK7  : std_logic := '0';
  signal PLL_CLKIN_p   : std_logic := '0';
  signal SMA_CLKIN_p   : std_logic := '0';
--signal  SMA_GXBCLK_p  : std_logic;
  signal GCLKIN        : std_logic := '0';
--  signal GCLKOUT_FPGA  : std_logic := '0';
--  signal SMA_CLKOUT_p  : std_logic := '0';
  signal clk_125       : std_logic := '0';
  -- cpu reset
  signal CPU_RESET_n   : std_ulogic := '0';
  -- max i/o
--  signal MAX_CONF_D    : std_logic_vector(3 downto 0);
--  signal MAX_I2C_SCLK  : std_logic;
--  signal MAX_I2C_SDAT  : std_logic;
  -- LEDs
  signal  LED          : std_logic_vector(7 downto 0);
  -- buttons
  signal  BUTTON       : std_logic_vector(3 downto 0);  
  -- switches
  signal  SW           : std_logic_vector(3 downto 0);
  -- slide switches
  signal SLIDE_SW      : std_logic_vector(3 downto 0);
  -- temperature
--  signal TEMP_SMCLK    : std_logic;
--  signal TEMP_SMDAT    : std_logic;
--  signal TEMP_INT_n    : std_logic;
  -- current
  signal CSENSE_ADC_FO : std_logic;
  signal CSENSE_SCK    : std_logic;
  signal CSENSE_SDI    : std_logic;
  signal CSENSE_SDO    : std_logic;
  signal CSENSE_CS_n   : std_logic_vector(1 downto 0);     
  -- fan
  signal FAN_CTRL      : std_logic;
  -- eeprom
  signal EEP_SCL       : std_logic;
  signal EEP_SDA       : std_logic;
  -- sdcard
--  signal SD_CLK        : std_logic;
--  signal SD_CMD        : std_logic;
--  signal SD_DAT        : std_logic_vector(3 downto 0);
--  signal SD_WP_n       : std_logic;
  -- Ethernet interfaces
signal    ETH_INT_n     : std_logic_vector(3 downto 0);
signal    ETH_MDC       : std_logic_vector(3 downto 0);
signal    ETH_MDIO      : std_logic_vector(3 downto 0);
signal    ETH_RST_n     : std_ulogic;
signal    ETH_RX_p      : std_logic_vector(3 downto 0);
signal    ETH_TX_p      : std_logic_vector(3 downto 0);
  -- PCIe interfaces
--signal    PCIE_PREST_n  : std_ulogic;
--signal    PCIE_REFCLK_p : std_ulogic;
--signal    PCIE_RX_p     : std_logic_vector(7 downto 0);
--signal    PCIE_SMBCLK   : std_logic;
--signal    PCIE_SMBDAT   : std_logic;
--signal    PCIE_TX_p     : std_logic_vector(7 downto 0);
--signal    PCIE_WAKE_n   : std_logic;
  -- Flash and SRAM, shared signals
  signal FSM_A         : std_logic_vector(25 downto 1);
  signal FSM_D         : std_logic_vector(15 downto 0);
  -- Flash control
  signal FLASH_ADV_n   : std_ulogic;
  signal FLASH_CE_n    : std_ulogic;
  signal FLASH_CLK     : std_ulogic;
  signal FLASH_OE_n    : std_ulogic;
  signal FLASH_RESET_n : std_ulogic;
  signal FLASH_RYBY_n  : std_ulogic;
  signal FLASH_WE_n    : std_ulogic;
  -- SSRAM control
  signal SSRAM_ADV     : std_ulogic;
  signal SSRAM_BWA_n   : std_ulogic;
  signal SSRAM_BWB_n   : std_ulogic;
  signal SSRAM_CE_n    : std_ulogic;
  signal SSRAM_CKE_n   : std_ulogic;
  signal SSRAM_CLK     : std_ulogic;
  signal SSRAM_OE_n    : std_ulogic;
  signal SSRAM_WE_n    : std_ulogic;
  -- USB OTG
--signal    OTG_A         : std_logic_vector(17 downto 1);
--signal    OTG_CS_n      : std_ulogic;
--signal    OTG_D         : std_logic_vector(31 downto 0);
--signal    OTG_DC_DACK   : std_ulogic;
--signal    OTG_DC_DREQ   : std_ulogic;
--signal    OTG_DC_IRQ    : std_ulogic;
--signal    OTG_HC_DACK   : std_ulogic;
--signal    OTG_HC_DREQ   : std_ulogic;
--signal    OTG_HC_IRQ    : std_ulogic;
--signal    OTG_OE_n      : std_ulogic;
--signal    OTG_RESET_n   : std_ulogic;
--signal    OTG_WE_n      : std_ulogic;
  -- SATA
--signal    SATA_REFCLK_p    : std_logic;
--signal    SATA_HOST_RX_p   : std_logic_vector(1 downto 0);
--signal    SATA_HOST_TX_p   : std_logic_vector(1 downto 0);
--signal   SATA_DEVICE_RX_p : std_logic_vector(1 downto 0);
--signal    SATA_DEVICE_TX_p : std_logic_vector(1 downto 0);
  -- DDR2 SODIMM
signal    M1_DDR2_addr    : std_logic_vector(15 downto 0);
signal    M1_DDR2_ba      : std_logic_vector(2 downto 0);
signal    M1_DDR2_cas_n   : std_logic;
signal    M1_DDR2_cke     : std_logic_vector(1 downto 0);
signal    M1_DDR2_clk     : std_logic_vector(1 downto 0);
signal    M1_DDR2_clk_n   : std_logic_vector(1 downto 0);
signal    M1_DDR2_cs_n    : std_logic_vector(1 downto 0);
signal    M1_DDR2_dm      : std_logic_vector(7 downto 0);
signal    M1_DDR2_dq      : std_logic_vector(63 downto 0);
signal    M1_DDR2_dqs     : std_logic_vector(7 downto 0);
signal    M1_DDR2_dqsn    : std_logic_vector(7 downto 0);
signal    M1_DDR2_odt     : std_logic_vector(1 downto 0);
signal    M1_DDR2_ras_n   : std_logic;
-- signal    M1_DDR2_SA    : std_logic_vector(1 downto 0);
-- signal    M1_DDR2_SCL   : std_logic;
-- signal    M1_DDR2_SDA   : std_logic;
signal    M1_DDR2_we_n    : std_logic;
signal    M1_DDR2_oct_rdn : std_logic;
signal    M1_DDR2_oct_rup : std_logic;

  -- DDR2 SODIMM
--signal    M2_DDR2_addr  : std_logic_vector(15 downto 0);
--signal    M2_DDR2_ba    : std_logic_vector(2 downto 0);
--signal    M2_DDR2_cas_n : std_logic;
--signal    M2_DDR2_cke   : std_logic_vector(1 downto 0);
--signal    M2_DDR2_clk   : std_logic_vector(1 downto 0);
--signal    M2_DDR2_clk_n : std_logic_vector(1 downto 0);
--signal    M2_DDR2_cs_n  : std_logic_vector(1 downto 0);
--signal    M2_DDR2_dm    : std_logic_vector(7 downto 0);
--signal    M2_DDR2_dq    : std_logic_vector(63 downto 0);
--signal    M2_DDR2_dqs   : std_logic_vector(7 downto 0);
--signal    M2_DDR2_dqsn  : std_logic_vector(7 downto 0);
--signal    M2_DDR2_odt   : std_logic_vector(1 downto 0);
--signal    M2_DDR2_ras_n : std_logic;
--signal    M2_DDR2_SA    : std_logic_vector(1 downto 0);
--signal    M2_DDR2_SCL   : std_logic;
--signal    M2_DDR2_SDA   : std_logic;
--signal    M2_DDR2_we_n  : std_logic;
  -- GPIO
  signal GPIO0_D       : std_logic_vector(35 downto 0);
--  signal GPIO1_D       : std_logic_vector(35 downto 0); 
  -- Ext I/O
  signal EXT_IO        :  std_logic;
  -- HSMC A
--  signal HSMA_CLKIN_n1 : std_logic;
--  signal HSMA_CLKIN_n2 : std_logic;
--  signal HSMA_CLKIN_p1 : std_logic;
--  signal HSMA_CLKIN_p2 : std_logic;
--  signal HSMA_CLKIN0   : std_logic;
  signal HSMA_CLKOUT_n2 : std_logic;
  signal HSMA_CLKOUT_p2 : std_logic;
--  signal HSMA_D        : std_logic_vector(3 downto 0);
--  HSMA_GXB_RX_p : std_logic_vector(3 downto 0);
--  HSMA_GXB_TX_p : std_logic_vector(3 downto 0);
--  signal HSMA_OUT_n1   : std_logic;
--  signal HSMA_OUT_p1   : std_logic;
--  signal HSMA_OUT0     : std_logic;
--  HSMA_REFCLK_p : in std_logic;
--  signal HSMA_RX_n     : std_logic_vector(16 downto 0);
--  signal HSMA_RX_p     : std_logic_vector(16 downto 0);
--  signal HSMA_TX_n     : std_logic_vector(16 downto 0);
--  signal HSMA_TX_p     : std_logic_vector(16 downto 0); 
  -- HSMC_B
--  signal HSMB_CLKIN_n1 : std_logic;
--  signal HSMB_CLKIN_n2 : std_logic;
--  signal HSMB_CLKIN_p1 : std_logic;
--  signal HSMB_CLKIN_p2 : std_logic;
--  signal HSMB_CLKIN0   : std_logic;
--  signal HSMB_CLKOUT_n2 : std_logic;
--  signal HSMB_CLKOUT_p2 : std_logic;
--  signal HSMB_D        : std_logic_vector(3 downto 0);
--  signal  HSMB_GXB_RX_p : in std_logic_vector(3 downto 0);
--  signal  HSMB_GXB_TX_p : out std_logic_vector(3 downto 0);
--  signal HSMB_OUT_n1   : std_logic;
--  signal HSMB_OUT_p1   : std_logic;
--  signal HSMB_OUT0     : std_logic;
--  signal  HSMB_REFCLK_p : in std_logic;
--  signal HSMB_RX_n     : std_logic_vector(16 downto 0);
--  signal HSMB_RX_p     : std_logic_vector(16 downto 0);
--  signal HSMB_TX_n     : std_logic_vector(16 downto 0);
--  signal HSMB_TX_p     : std_logic_vector(16 downto 0);  
  -- HSMC i2c
--  signal HSMC_SCL      : std_logic;
--  signal HSMC_SDA      : std_logic;
  -- Display
--  signal SEG0_D        : std_logic_vector(6 downto 0);
--  signal SEG1_D        : std_logic_vector(6 downto 0);
--  signal SEG0_DP       : std_ulogic;
--  signal SEG1_DP       : std_ulogic;  
  -- UART
  signal UART_CTS      : std_ulogic;
  signal UART_RTS      : std_ulogic;
  signal UART_RXD      : std_logic;
  signal UART_TXD      : std_logic;
  signal dsuen, dsubren, dsuact : std_ulogic;
  signal dsurst   : std_ulogic;

  signal rst_125         : std_logic;

  constant lresp : boolean := false;

  constant slips : integer := 11;

  signal ETH_RX_p_0_d : std_logic;
  signal ETH_RX_p_1_d : std_logic;
begin

  -- clock and reset
  -- 50 MHz clocks
  OSC_50_BANK2 <= not OSC_50_BANK2 after 10 ns;
  OSC_50_BANK3 <= not OSC_50_BANK3 after 10 ns;
  OSC_50_BANK4 <= not OSC_50_BANK4 after 10 ns;
  OSC_50_BANK5 <= not OSC_50_BANK5 after 10 ns;
  OSC_50_BANK6 <= not OSC_50_BANK6 after 10 ns;
  OSC_50_BANK7 <= not OSC_50_BANK7 after 10 ns;
  -- 100 MHz
  PLL_CLKIN_p <= not PLL_CLKIN_p after 5 ns;
  SMA_CLKIN_p <= not SMA_CLKIN_p after 10 ns;
  GCLKIN <= not GCLKIN after 10 ns;
  clk_125 <= not clk_125 after 4 ns;

  CPU_RESET_n <= '0', '1' after 200 ns;
  -- various interfaces
--  MAX_CONF_D    <= (others => 'H');
--  MAX_I2C_SDAT  <= 'H';
  BUTTON <= "HHHH";
  SW <= (others => 'H');
  SLIDE_SW <= (others => 'L');
--  TEMP_SMDAT <= 'H';
--  TEMP_INT_n <= 'H';
  CSENSE_SCK <= 'H';
  CSENSE_SDO <= 'H';
  EEP_SDA    <= 'H';
--  SD_CMD     <= 'H';
--  SD_DAT     <= (others => 'H');
--  SD_WP_n    <= 'H';
  GPIO0_D    <= (others => 'H');
--  GPIO1_D    <= (others => 'H');
  EXT_IO     <= 'H';
  LED(0)     <= 'H';

-- HSMC_SDA   <= 'H';

  UART_RTS <= '1';
  UART_RXD <= 'H';

  -- LEON3 SoC
  d3 : entity work.leon3mp
    generic map (
      fabtech, memtech, padtech, clktech, disas, dbguart, pclow)
    port map (
      OSC_50_BANK2, OSC_50_BANK3, OSC_50_BANK4, OSC_50_BANK5, OSC_50_BANK6,
      OSC_50_BANK7, PLL_CLKIN_p, SMA_CLKIN_p,
--    SMA_GXBCLK_p
      GCLKIN,
--      GCLKOUT_FPGA, SMA_CLKOUT_p,
      -- cpu reset
      CPU_RESET_n,
      -- max i/o
--      MAX_CONF_D, MAX_I2C_SCLK, MAX_I2C_SDAT,
      -- LEDs
      LED,
      -- buttons
      BUTTON,       
      -- switches
      SW,
      -- slide switches
      SLIDE_SW,
      -- temperature
--      TEMP_SMCLK, TEMP_SMDAT, TEMP_INT_n,
      -- current
      CSENSE_ADC_FO, CSENSE_SCK, CSENSE_SDI, CSENSE_SDO, CSENSE_CS_n,       
      -- fan
      FAN_CTRL,
      -- eeprom
      EEP_SCL, EEP_SDA,
      -- sdcard
--      SD_CLK, SD_CMD, SD_DAT, SD_WP_n,
      -- Ethernet interfaces
      ETH_INT_n, ETH_MDC, ETH_MDIO, ETH_RST_n, ETH_RX_p, ETH_TX_p,
      -- PCIe interfaces
--    PCIE_PREST_n, PCIE_REFCLK_p, PCIE_RX_p, PCIE_SMBCLK,
--    PCIE_SMBDAT, PCIE_TX_p PCIE_WAKE_n
      -- Flash and SRAM, shared signals
      FSM_A, FSM_D,
      -- Flash control
      FLASH_ADV_n, FLASH_CE_n, FLASH_CLK, FLASH_OE_n,
      FLASH_RESET_n, FLASH_RYBY_n, FLASH_WE_n,
      -- SSRAM control
      SSRAM_ADV, SSRAM_BWA_n, SSRAM_BWB_n, SSRAM_CE_n,
      SSRAM_CKE_n, SSRAM_CLK, SSRAM_OE_n, SSRAM_WE_n,
      -- USB OTG
--    OTG_A, OTG_CS_n, OTG_D, OTG_DC_DACK, OTG_DC_DRE, OTG_DC_IRQ,
--    OTG_HC_DACK, OTG_HC_DREQ, OTG_HC_IRQ, OTG_OE_n, OTG_RESET_n,
--    OTG_WE_n,
      -- SATA
--    SATA_REFCLK_p, SATA_HOST_RX_p, SATA_HOST_TX_p, SATA_DEVICE_RX_p, SATA_DEVICE_TX_p,
      -- DDR2 SODIMM
      M1_DDR2_addr, M1_DDR2_ba, M1_DDR2_cas_n, M1_DDR2_cke, M1_DDR2_clk, M1_DDR2_clk_n,
      M1_DDR2_cs_n, M1_DDR2_dm, M1_DDR2_dq, M1_DDR2_dqs,  M1_DDR2_dqsn, M1_DDR2_odt,
      M1_DDR2_ras_n,
--      M1_DDR2_SA, M1_DDR2_SCL, M1_DDR2_SDA,
      M1_DDR2_we_n,
      M1_DDR2_oct_rdn, M1_DDR2_oct_rup,
      -- DDR2 SODIMM
--    M2_DDR2_addr, M2_DDR2_ba, M2_DDR2_cas_n, M2_DDR2_cke, M2_DDR2_clk, M2_DDR2_clk_n
--    M2_DDR2_cs_n, M2_DDR2_dm, M2_DDR2_dq, M2_DDR2_dqs, M2_DDR2_dqsn, M2_DDR2_odt,
--    M2_DDR2_ras_n, M2_DDR2_SA, M2_DDR2_SCL, M2_DDR2_SDA M2_DDR2_we_n
      -- GPIO
      GPIO0_D,
--      GPIO1_D,
      -- Ext I/O
--    EXT_IO,       
      -- HSMC A
--    HSMA_CLKIN_n1, HSMA_CLKIN_n2, HSMA_CLKIN_p1, HSMA_CLKIN_p2, HSMA_CLKIN0,
      HSMA_CLKOUT_n2, HSMA_CLKOUT_p2, 
--    HSMA_D,
--    HSMA_GXB_RX_p, HSMA_GXB_TX_p,
--    HSMA_OUT_n1, HSMA_OUT_p1, HSMA_OUT0,
--    HSMA_REFCLK_p,
--    HSMA_RX_n, HSMA_RX_p, HSMA_TX_n, HSMA_TX_p,   
      -- HSMC_B
--    HSMB_CLKIN_n1, HSMB_CLKIN_n2, HSMB_CLKIN_p1, HSMB_CLKIN_p2, HSMB_CLKIN0,
--    HSMB_CLKOUT_n2, HSMB_CLKOUT_p2, HSMB_D,
--    HSMB_GXB_RX_p, HSMB_GXB_TX_p,
--    HSMB_OUT_n1, HSMB_OUT_p1, HSMB_OUT0,
--    HSMB_REFCLK_p,
--    HSMB_RX_n, HSMB_RX_p, HSMB_TX_n, HSMB_TX_p,
      -- HSMC i2c
--    HSMC_SCL, HSMC_SDA,
      -- Display
--    SEG0_D, SEG1_D, SEG0_DP, SEG1_DP,
      -- UART
      UART_CTS, UART_RTS, UART_RXD, UART_TXD
      );


  ethsim0 : if CFG_GRETH /= 0 generate

  rst_125 <= not CPU_RESET_n;

  -- delaying rx line
  ETH_RX_p(0) <= transport ETH_RX_p_0_d after 0.8 ns * slips;
  
  p0: ser_phy
    generic map(
      address       => 0,
      extended_regs => 1,
      aneg          => 1,
      fd_10         => 1,
      hd_10         => 1,

      base100_t4    => 1,
      base100_x_fd  => 1,
      base100_x_hd  => 1,
      base100_t2_fd => 1,
      base100_t2_hd => 1,

      base1000_x_fd => CFG_GRETH1G,
      base1000_x_hd => CFG_GRETH1G,
      base1000_t_fd => CFG_GRETH1G,
      base1000_t_hd => CFG_GRETH1G,
      fabtech   => fabtech,
      memtech   => memtech
    )
    port map(
      rstn      => CPU_RESET_n,
      clk_125   => clk_125,
      rst_125   => rst_125,
      eth_rx_p  => ETH_RX_p_0_d,
      eth_tx_p  => ETH_TX_p(0),
      mdio      => ETH_MDIO(0),
      mdc       => ETH_MDC(0)
    );

  end generate;

  ethsim1 : if CFG_GRETH2 /= 0 generate

  -- delaying rx line
  ETH_RX_p(1) <= transport ETH_RX_p_1_d after 0.8 ns * slips;

  p1: ser_phy
    generic map(
      address       => 1,
      extended_regs => 1,
      aneg          => 1,
      fd_10         => 1,
      hd_10         => 1,

      base100_t4    => 1,
      base100_x_fd  => 1,
      base100_x_hd  => 1,
      base100_t2_fd => 1,
      base100_t2_hd => 1,
      
      base1000_x_fd => CFG_GRETH21G,
      base1000_x_hd => CFG_GRETH21G,
      base1000_t_fd => CFG_GRETH21G,
      base1000_t_hd => CFG_GRETH21G,
      fabtech   => fabtech,
      memtech   => memtech
    )
    port map(
      rstn      => CPU_RESET_n,
      clk_125   => clk_125,
      rst_125   => rst_125,
      eth_rx_p  => ETH_RX_p_1_d,
      eth_tx_p  => ETH_TX_p(1),
      mdio      => ETH_MDIO(1),
      mdc       => ETH_MDC(1)
    );

  end generate;

  prom0 : sram16 generic map (index => 4, abits => romdepth, fname => promfile)
  port map (FSM_A(romdepth downto 1), FSM_D, FLASH_CE_n, FLASH_CE_n, FLASH_CE_n,
                FLASH_WE_n, FLASH_OE_n);
  FLASH_RYBY_n  <= 'H';

  ddr2mem0 : ddr2ram
    generic map(
      width     => 64,
      abits     => 14,
      babits    => 3,
      colbits   => 10,
      rowbits   => 11,
      implbanks => 8,
      fname     => sdramfile,
      speedbin  => 1,
      density   => 3,
      lddelay   => (0 ns),
      swap      => 0,
      ldguard   => 1
      )
    port map (
      a       => M1_DDR2_addr(13 downto 0), -- ddr2_addr,
      ba      => M1_DDR2_ba, -- ddr2_ba,
      ck      => M1_DDR2_clk(0), -- ddr2_ck_p(0),
      ckn     => M1_DDR2_clk_n(0), -- ddr2_ck_n(0),
      cke     => M1_DDR2_cke(0), -- ddr2_cke(0),
      csn     => M1_DDR2_cs_n(0), -- ddr2_cs_n(0),
      dm      => M1_DDR2_dm, -- ddr2_dm,
      rasn    => M1_DDR2_ras_n, -- ddr2_ras_n,
      casn    => M1_DDR2_cas_n, -- ddr2_cas_n,
      wen     => M1_DDR2_we_n, -- ddr2_we_n,
      dq      => M1_DDR2_dq, -- ddr2_dq(15 downto 0),
      dqs     => M1_DDR2_dqs, -- ddr2_dqs_p,
      dqsn    => M1_DDR2_dqsn, -- ddr2_dqs_n,
      odt     => M1_DDR2_odt(0), -- ddr2_odt(0),
      doload  => LED(2)
    );

  test0 :  grtestmod
    generic map ( width => 16 )
    port map ( CPU_RESET_n, OSC_50_BANK3, LED(0), FSM_A(20 downto 1), FSM_D,
             '0', FLASH_OE_n, FLASH_WE_n);

  iuerr : process
  begin
    wait for 2500 ns;
    if to_x01(LED(0)) = '1' then wait on LED(0); end if;
    assert (to_x01(LED(0)) = '1') 
      report "*** IU in error mode, simulation halted ***"
      severity failure ;
  end process;

  FSM_D <= buskeep(FSM_D) after 5 ns;

  dsucom : process
    procedure dsucfg(signal dsurx : in std_ulogic; signal dsutx : out std_ulogic) is
    variable w32 : std_logic_vector(31 downto 0);
    variable c8  : std_logic_vector(7 downto 0);
    constant txp : time := 320 * 1 ns;
    begin
    dsutx <= '1';
    dsurst <= '0';
    wait for 2500 ns;
    dsurst <= '1';
    wait;
    wait for 5000 ns;
    txc(dsutx, 16#55#, txp);    -- sync uart--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#20#, 16#2e#, txp);--
    wait for 25000 ns;
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#01#, txp);--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#24#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0D#, txp);--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#70#, 16#11#, 16#78#, txp);
    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#0D#, txp);--
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#44#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#20#, 16#00#, txp);--
    txc(dsutx, 16#80#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#44#, txp);--
    wait;
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#0a#, 16#aa#, txp);
    txa(dsutx, 16#00#, 16#55#, 16#00#, 16#55#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#0a#, 16#a0#, txp);
    txa(dsutx, 16#01#, 16#02#, 16#09#, 16#33#, txp);--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2e#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2e#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#80#, 16#00#, 16#02#, 16#10#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#40#, 16#00#, 16#24#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#24#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#70#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#03#, txp);--




    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#ff#, 16#ff#, txp);--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#48#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#12#, txp);--
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#60#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#12#, 16#10#, txp);--
    txc(dsutx, 16#80#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);--
    txc(dsutx, 16#a0#, txp);
    txa(dsutx, 16#40#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);--
    end;--
  begin--
    dsucfg(UART_TXD, UART_RXD);--
    wait;
  end process;
end ;

