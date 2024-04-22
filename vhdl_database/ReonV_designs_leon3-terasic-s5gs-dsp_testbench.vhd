------------------------------------------------------------------------------
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
    romdepth  : integer := 16;          -- rom address depth
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

  -- GPLL-CLK
  signal clkin_50 : std_ulogic := '0';        -- 1.8V 50 MHz, also to EPM2210F256
  signal clkintop_p : std_logic_vector(1 downto 0) := "00";   -- LVDS  100 MHz prog osc External Term
  signal clkinbot_p : std_logic_vector(1 downto 0) := "00";   -- LVDS  100 MHz prog osc clkinbot_p[0]
                                                 -- clkinbot_p[1] External Term.
  signal clk_125_p   : std_ulogic := '0';     -- LVDS 125 MHz GPLL-req's OCT.
  -- XCVR-REFCLK
  -- signal refclk1_ql0_p : std_ulogic; -- Default 100MHz
  -- signal refclk2_ql1_p : std_ulogic; -- Default 644.53125MHz
  -- signal refclk4_ql2_p : std_ulogic; --Default 282.5MHz
  -- signal refclk5_ql2_p : std_ulogic; --Default 148.5MHz
  -- signal refclk0_qr0_p : std_ulogic; --Default 100MHz
  -- signal refclk1_qr0_p : std_ulogic; --Default 156.25MHz
  -- signal refclk2_qr1_p : std_ulogic; --Default 625MHz
  -- signal refclk4_qr2_p : std_ulogic; --Default 100MHz
  -- signal refclk5_qr2_p : std_ulogic; --Default 270MHz (DisplayPort)
  -- Si571 VCXO
  signal sdi_clk148_up : std_ulogic;
  signal sdi_clk148_dn : std_ulogic;
  -- DDR3 Devices-x72
  signal ddr3_a        : std_logic_vector(13 downto 0); -- SSTL15  Address
  signal ddr3_ba       : std_logic_vector(2 downto 0); -- SSTL15  Bank Address
  signal ddr3_casn     : std_ulogic;         -- SSTL15 Column Address Strobe
  signal ddr3_clk_n    : std_ulogic;       -- SSTL15 Diff Clock - Neg
  signal ddr3_clk_p    : std_ulogic;       -- SSTL15 Diff Clock - Pos
  signal ddr3_cke      : std_ulogic;          -- SSTL15 Clock Enable
  signal ddr3_csn      : std_ulogic;         -- SSTL15 Chip Select
  signal ddr3_dm       : std_logic_vector(8 downto 0); -- SSTL15 Data Write Mask
  signal ddr3_dq       : std_logic_vector(71 downto 0);    -- SSTL15 Data Bus
  signal ddr3_dqs_n    : std_logic_vector(8 downto 0);  -- SSTL15 Diff Data Strobe - Neg
  signal ddr3_dqs_p    : std_logic_vector(8 downto 0); -- SSTL15 Diff Data Strobe - Pos
  signal ddr3_odt      : std_ulogic; -- SSTL15 On-Die Termination Enable
  signal ddr3_rasn     : std_ulogic; -- SSTL15 Row Address Strobe
  signal ddr3_resetn   : std_ulogic; -- SSTL15 Reset
  signal ddr3_wen      : std_ulogic; -- SSTL15 Write Enable
  signal rzqin_1p5     : std_ulogic; -- OCT Pin in Bank 4A
  -- QDR2 x18read/x18write
  signal qdrii_a       : std_logic_vector(19 downto 0);   -- HSTL15/18  Address
  signal qdrii_bwsn    : std_logic_vector(1 downto 0); -- HSTL15/18  //Byte Write Select
  signal qdrii_cq_n    : std_logic;       -- HSTL15/18 Read Data Clock - Neg
  signal qdrii_cq_p    : std_ulogic;       -- HSTL15/18 Read Data Clock - Pos
  signal qdrii_d       : std_logic_vector(17 downto 0);  -- HSTL15/18  //Write Data
  signal qdrii_doffn   : std_logic;       -- HSTL15/18  //PLL disable (TR=0)
  signal qdrii_k_n     : std_logic;        -- HSTL15/18  //Write Data Clock - Neg
  signal qdrii_k_p     : std_logic;        -- HSTL15/18  //Write Data Clock - Pos
  signal qdrii_q       : std_logic_vector(17 downto 0); -- HSTL15/18  //Read Data
  -- signal qdrii_odt : std_logic; -- HSTL15/18  //On-Die Termination Enable (QDRII Cn)
  signal qdrii_c_p     : std_logic; -- qdrii_qvld  HSTL15/18  Read Data Valid	(QDRII Cp)
  signal qdrii_rpsn    : std_logic; -- HSTL15/18 Read Port Select
  signal qdrii_wpsn    : std_logic; -- HSTL15/18 Write Port Select
  signal rzqin_1p8     : std_logic; -- OCT pin for QDRII/+ and RLDRAM II
  -- RLDRAM2-x18
  signal rldc_a        : std_logic_vector(22 downto 0); --HSTL15/18 Address
  signal rldc_ba       : std_logic_vector(2 downto 0); --/HSTL15/18 Bank Address
  signal rldc_ck_n     : std_logic;  --HSTL15/18  //Input Clock - Neg
  signal rldc_ck_p     : std_logic; --HSTL15/18  //Input Clock - Pos
  signal rldc_dq       : std_logic_vector(17 downto 0); --HSTL15/18  //Data
  signal rldc_dk_n     : std_logic; --HSTL15/18  //Write (Input) Data Clock - Neg
  signal rldc_dk_p     : std_logic; --HSTL15/18  //Write (Input) Data Clock - Pos
  signal rldc_qk_n     : std_logic_vector(1 downto 0); --HSTL15/18  //Read (Output) Data Clock - Neg
  signal rldc_qk_p     : std_logic_vector(1 downto 0); --HSTL15/18  //Read (Output) Data Clock - Pos
  signal rldc_dm       : std_logic; -- HSTL15/18  //Input Data Mask
  signal rldc_qvld     : std_logic; -- HSTL15/18  //Read Data Valid
  signal rldc_csn      : std_logic; -- HSTL15/18  //Chip Select
  signal rldc_wen      : std_logic; -- HSTL15/18  //Write Enable
  signal rldc_refn     : std_logic; -- HSTL15/18  //Ref Command
  -- Ethernet-10/100/1000
  signal enet_intn     : std_logic; -- 2.5V    //MDIO Interrupt (TR=0)
  signal enet_mdc      : std_logic; -- 2.5V    //MDIO Clock (TR=0)
  signal enet_mdio     : std_logic; -- 2.5V    //MDIO Data (TR=0)
  signal enet_resetn   : std_logic; -- 2.5V    //Device Reset (TR=0)
  signal enet_rx_p     : std_logic; -- LVDS NEED EXTERNAL TERM //SGMII Receive-req's OCT
  signal enet_tx_p     : std_logic;   -- LVDS    //SGMII Transmit
  -- FSM-Shared-Bus (Flash/Max)
  signal fm_a          : std_logic_vector(26 downto 0); -- 1.8V    //Address
  signal fm_d          : std_logic_vector(31 downto 0); -- 1.8V    //Data
  signal flash_advn    : std_logic; -- 1.8V    //Flash Address Valid
  signal flash_cen     : std_logic_vector(1 downto 0); -- 1.8V    //Flash Chip Enable
  signal flash_clk     : std_logic; -- 1.8V    //Flash Clock
  signal flash_oen     : std_logic; -- 1.8V    //Flash Output Enable
  signal flash_rdybsyn : std_logic_vector(1 downto 0); -- 1.8V    //Flash Ready/Busy
  signal flash_resetn  : std_logic; -- 1.8V    //Flash Reset
  signal flash_wen     : std_logic; -- 1.8V    //Flash Write Enable
  signal max5_ben      : std_logic_vector(3 downto 0); -- 1.5V    //Max V Byte Enable Per Byte
  signal max5_clk      : std_logic; -- 1.5V    //Max V Clk
  signal max5_csn      : std_logic; -- 1.5V    //Max V Chip Select
  signal max5_oen      : std_logic; -- 1.5V    //Max V Output Enable
  signal max5_wen      : std_logic; -- 1.5V    //Max V Write Enable
  -- Configuration
  -- signal fpga_data     : std_logic_vector(31 downto 0); -- 2.5V    //Configuration data
  -- Character-LCD
  signal lcd_csn       : std_ulogic;              -- 2.5V LCD Chip Select
  signal lcd_d_cn      : std_ulogic;             -- 2.5V LCD Data / Command Select
  signal lcd_data      : std_logic_vector(7 downto 0); -- 2.5V  LCD Data
  signal lcd_wen       : std_ulogic;             -- 2.5V LCD Write Enable
  -- User-IO
  signal user_dipsw    : std_logic_vector(7 downto 0); -- HSMB_VAR User DIP Switches (TR=0)
  signal user_led_g    : std_logic_vector(7 downto 0); -- 2.5V User LEDs
  signal user_led_r    : std_logic_vector(7 downto 0); -- 2.5V/1.8V User LEDs
  signal user_pb       : std_logic_vector(2 downto 0); -- HSMB_VAR User Pushbuttons (TR=0)
  signal cpu_resetn    : std_logic;  -- 2.5V  CPU Reset Pushbutton (TR=0)
  -- PCI-Express
  -- signal pcie_rx_p : in std_logic_vector(7 downto 0);      -- PCML14  PCIe Receive Data-req's OCT
  -- signal pcie_tx_p : out std_logic_vector(7 downto 0);     -- PCML14  PCIe Transmit Data
  -- signal pcie_refclk_p : in std_ulogic;  -- HCSL   PCIe Clock- Terminate on MB
  signal pcie_led_g3   : std_ulogic;  -- 2.5V    User LED - Labeled Gen3
  signal pcie_led_g2   : std_ulogic;  -- 2.5V    User LED - Labeled Gen2
  signal pcie_led_x1   : std_ulogic;  -- 2.5V    User LED - Labeled x1
  signal pcie_led_x4   : std_ulogic;  -- 2.5V    User LED - Labeled x4
  signal pcie_led_x8   : std_ulogic;  -- 2.5V    User LED - Labeled x8
  signal pcie_perstn   : std_ulogic;   -- 2.5V    PCIe Reset
  signal pcie_smbclk   : std_logic;    -- 2.5V    SMBus Clock (TR=0)
  signal pcie_smbdat   : std_logic; -- 2.5V    SMBus Data (TR=0)
  signal pcie_waken    : std_ulogic;   -- 2.5V    PCIe Wake-Up (TR=0)
                                   --         must install 0-ohm resistor
  -- USB 2.0
  signal usb_data      : std_logic_vector(7 downto 0); -- 1.5V from MAXV
  signal usb_addr      : std_logic_vector(1 downto 0); -- 1.5V from MAXV
  signal usb_clk       : std_logic; -- 3.3V from Cypress USB
  signal usb_full      : std_logic; -- 1.5V from MAXV
  signal usb_empty     : std_logic; -- 1.5V from MAXV
  signal usb_scl       : std_logic;  -- 1.5V from MAXV
  signal usb_sda       : std_logic; -- /1.5V from MAXV
  signal usb_oen       : std_ulogic; -- 1.5V from MAXV
  signal usb_rdn       : std_ulogic; -- 1.5V from MAXV
  signal usb_wrn       : std_ulogic; -- 1.5V from MAXV
  signal usb_resetn    : std_ulogic; -- 1.5V from MAXV
  -- QSFP
  -- qsfp_tx_p : out std_logic_vector(3 downto 0);
  -- qsfp_rx_p: in std_logic_vector (3 downto 0);
  signal qsfp_mod_seln  : std_ulogic;
  signal qsfp_rstn      : std_ulogic;
  signal qsfp_scl       : std_ulogic;
  signal qsfp_sda       : std_logic;
  signal qsfp_interruptn: std_ulogic;
  signal qsfp_mod_prsn  : std_logic;
  signal qsfp_lp_mode   : std_ulogic;
  -- DispayPort x4
  -- dp_ml_lane_p : out std_logic_vector(3 downto 0); -- Transceiver Data
  signal dp_aux_p       : std_logic;            -- LVDS (bi-directional) Auxillary Channel
  signal dp_aux_tx_p    : std_logic;           -- LVDS (transmit side) Auxillary Channel
  -- dp_aux_ch_p : std_logic;         -- LVDS (bi-directional) Auxillary Channel
  -- dp_aux_ch_n : std_logic;         -- LVDS (bi-directional) Auxillary Channel
  signal dp_hot_plug    : std_logic;            -- 2.5V Hot Plug Detect
  signal dp_return      : std_logic;           -- 2.5V Return for power
  signal dp_direction   : std_logic;           -- 2.5V Direction Select on M-LVDS Transceiver
  -- SDI-Video-Port
  -- sdi_rx_p : std_logic;          -- PCML14  //SDI Video Input-req's OCT
  -- sdi_tx_p : std_logic;         -- PCML14  //SDI Video Output
  -- sdi_clk148_dn : std_logic;    -- 2.5V    //VCO Frequency Down
  -- sdi_clk148_up : std_logic;    -- 2.5V    //VCO Frequency Up
  signal sdi_tx_sd_hdn  : std_logic;      -- 2.5V    //HD Mode Enable
  signal sdi_tx_en      : std_logic;      -- 2.5V  //Transmit Enable
  signal sdi_rx_en      : std_logic;      -- 2.5V  //Receive Enable - Tri-state
  signal sdi_rx_bypass  : std_logic;      -- 2.5V  //Receive Bypass
  -- Transceiver-SMA-Output
--  signal sma_tx_p       : std_logic;       -- PCML14 SMA Output Pair
  -- HSMC-Port-A
  -- signal hsma_rx_p : std_logic_vector(7 downto 0);  -- PCML14  //HSMA Receive Data-req's OCT
  -- signal hsma_tx_p : std_logic_vector(7 downto 0); -- PCML14  //HSMA Transmit Data
  -- Enable below for CMOS HSMC
  -- signal hsma_d : std_logic_vector(79 downto 0); -- /2.5V    //HSMA CMOS Data Bus
  -- Enable below for LVDS HSMC
  signal hsma_clk_in0    : std_logic;     --2.5V    //Primary single-ended CLKIN
  signal hsma_clk_in_p1  : std_logic;   -- LVDS    //Secondary diff. CLKIN
  signal hsma_clk_in_p2  : std_logic;   -- LVDS    //Primary Source-Sync CLKIN
  signal hsma_clk_out0   : std_logic;      -- 2.5V    //Primary single-ended CLKOUT
  signal hsma_clk_out_p1 : std_logic;     -- LVDS    //Secondary diff. CLKOUT
  signal hsma_clk_out_p2 : std_logic;    -- LVDS    //Primary Source-Sync CLKOUT
  signal hsma_d          : std_logic_vector(3 downto 0);   -- 2.5V    //Dedicated CMOS IO
  signal hsma_prsntn     : std_logic;        -- 2.5V    //HSMC Presence Detect Input
  signal hsma_rx_d_p     : std_logic_vector(16 downto 0);        -- LVDS    //LVDS Sounce-Sync Input
  signal hsma_tx_d_p     : std_logic_vector(16 downto 0);      -- LVDS    //LVDS Sounce-Sync Output
  signal hsma_rx_led     : std_logic;     -- 2.5V    //User LED - Labeled RX
  signal hsma_scl        : std_logic;        -- 2.5V    //SMBus Clock
  signal hsma_sda        : std_logic;      -- 2.5V    //SMBus Data
  signal hsma_tx_led     : std_logic;     -- 2.5V    //User LED - Labeled TX
  -- HSMC-Port-B
  -- signal hsmb_rx_p : std_logic_vector(7 downto 0);  -- PCML14  //HSMB Receive Data-req's OCT
  -- signal hsmb_tx_p : std_logic_vector(7 downto 0); -- PCML14  //HSMB Transmit Data
  -- Enable below for CMOS HSMC
  -- signal hsmb_d : std_logic_vector(79 downto 0); -- 2.5V    //HSMB CMOS Data Bus
  -- Enable below for LVDS HSMC
  signal hsmb_clk_in0     : std_logic;    -- 2.5V    //Primary single-ended CLKIN
  signal hsmb_clk_in_p1   : std_logic;    -- LVDS    //Secondary diff. CLKIN
  signal hsmb_clk_in_p2   : std_logic;    -- LVDS    //Primary Source-Sync CLKIN
  signal hsmb_clk_out0    : std_logic;   -- 2.5V    //Primary single-ended CLKOUT
  signal hsmb_clk_out_p1  : std_logic;   -- LVDS    //Secondary diff. CLKOUT
  signal hsmb_clk_out_p2  : std_logic;   -- LVDS    //Primary Source-Sync CLKOUT
  -- hsmb_d : inout std_logic_vector(3 downto 0); -- 2.5V Dedicated CMOS IO
  -- DQS Standard - 1.5V/1.8V/2.5V standards
  signal hsmb_a           : std_logic_vector(15 downto 0); -- Address 
  signal hsmb_addr_cmd    : std_logic_vector(0 downto 0); -- Additional Addres/Command pins
  signal hsmb_ba          : std_logic_vector(3 downto 0); -- Bank Address
  signal hsmb_casn        : std_logic;
  signal hsmb_rasn        : std_logic;
  signal hsmb_wen         : std_logic;
  signal hsmb_cke         : std_logic; -- Clock Enable
  signal hsmb_csn         : std_logic; -- Chip Select
  -- hsmb_c_p : out std_logic; -- c_p = QVLD; c_n = ODT
  signal hsmb_odt         : std_logic; -- ODT
  signal hsmb_qvld        : std_logic; -- QVLD
  signal hsmb_dm          : std_logic_vector(3 downto 0); -- Data Mask
  signal hsmb_dq          : std_logic_vector(31 downto 0); -- Data
  signal hsmb_dqs_p       : std_logic_vector(3 downto 0); -- Data Strobe positive
  signal hsmb_dqs_n       : std_logic_vector(3 downto 0); -- Data Strobe negative
  signal hsmb_prsntn      : std_logic; -- 2.5V    //HSMC Presence Detect Input
  signal hsmb_rx_led      : std_logic; -- 2.5V    //User LED - Labeled RX
  signal hsmb_scl         : std_logic;    -- 2.5V    //SMBus Clock
  signal hsmb_sda         : std_logic;   -- 2.5V    //SMBus Data
  signal hsmb_tx_led      : std_logic;  -- 2.5V    //User LED - Labeled TX
  signal rzqin_hsmb_var   : std_logic;

  signal enet_rx_p_d : std_logic;
  signal enet_resetn_inv: std_ulogic;
  constant slips     : integer := 11;

begin

  -- clock and reset

  clkin_50 <= not clkin_50 after 10 ns;
  clkintop_p <= not clkintop_p after 5 ns;
  clkinbot_p <= not clkinbot_p after 5 ns;
  clk_125_p <= not clk_125_p after 4 ns;

  cpu_resetn <= '0', '1' after 200 ns;

  -- various interfaces
  user_dipsw <= (others => 'H');
  user_pb <= (others => 'H');

  -- LEON3 SoC
  d3 : entity work.leon3mp
    generic map (
      fabtech, memtech, padtech, clktech, disas, dbguart, pclow)
    port map (
      clkin_50,
      clkintop_p,
      clkinbot_p,
      clk_125_p,
      sdi_clk148_up, sdi_clk148_dn,
      ddr3_a, ddr3_ba, ddr3_casn, ddr3_clk_n, ddr3_clk_p, ddr3_cke, ddr3_csn,
      ddr3_dm, ddr3_dq, ddr3_dqs_n, ddr3_dqs_p, ddr3_odt, ddr3_rasn,
      ddr3_resetn, ddr3_wen, rzqin_1p5,
      qdrii_a, qdrii_bwsn, qdrii_cq_n, qdrii_cq_p, qdrii_d,
      qdrii_doffn, qdrii_k_n, qdrii_k_p, qdrii_q,
      qdrii_c_p, qdrii_rpsn, qdrii_wpsn, rzqin_1p8,
      rldc_a, rldc_ba, rldc_ck_n, rldc_ck_p, rldc_dq, rldc_dk_n, rldc_dk_p,
      rldc_qk_n, rldc_qk_p, rldc_dm, rldc_qvld, rldc_csn, rldc_wen, rldc_refn,
      enet_intn, enet_mdc, enet_mdio, enet_resetn, enet_rx_p, enet_tx_p,
      fm_a, fm_d, flash_advn, flash_cen, flash_clk, flash_oen,
      flash_rdybsyn, flash_resetn, flash_wen,
      max5_ben, max5_clk, max5_csn, max5_oen, max5_wen,
      lcd_csn, lcd_d_cn, lcd_data, lcd_wen,
      user_dipsw, user_led_g, user_led_r, user_pb,
      cpu_resetn,
      pcie_led_g3, pcie_led_g2, pcie_led_x1, pcie_led_x4, pcie_led_x8,
      pcie_perstn, pcie_smbclk, pcie_smbdat, pcie_waken,
      usb_data, usb_addr, usb_clk, usb_full, usb_empty, usb_scl,
      usb_sda, usb_oen, usb_rdn, usb_wrn, usb_resetn,
      qsfp_mod_seln, qsfp_rstn, qsfp_scl, qsfp_sda, qsfp_interruptn,
      qsfp_mod_prsn, qsfp_lp_mode,
      dp_aux_p, dp_aux_tx_p,
      dp_hot_plug, dp_return, dp_direction,
      sdi_tx_sd_hdn, sdi_tx_en, sdi_rx_en, sdi_rx_bypass,
--      sma_tx_p,
      hsma_clk_in0, hsma_clk_in_p1, hsma_clk_in_p2, hsma_clk_out0,
      hsma_clk_out_p1, hsma_clk_out_p2, hsma_d, hsma_prsntn, hsma_rx_d_p,
      hsma_tx_d_p, hsma_rx_led, hsma_scl, hsma_sda, hsma_tx_led,
      hsmb_clk_in0, hsmb_clk_in_p1, hsmb_clk_in_p2, hsmb_clk_out0,
      hsmb_clk_out_p1, hsmb_clk_out_p2,
      hsmb_a, hsmb_addr_cmd, hsmb_ba, hsmb_casn, hsmb_rasn, hsmb_wen,
      hsmb_cke, hsmb_csn, hsmb_odt, hsmb_qvld, hsmb_dm, hsmb_dq, hsmb_dqs_p,
      hsmb_dqs_n, hsmb_prsntn, hsmb_rx_led, hsmb_scl, hsmb_sda, hsmb_tx_led,
      rzqin_hsmb_var
      );

  enet_resetn_inv <= not enet_resetn;
  ethsim0 : if CFG_GRETH /= 0 generate
    -- delaying rx line
    enet_rx_p <= transport enet_rx_p_d after 0.8 ns * slips;

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
        memtech   => memtech,
        transtech => fabtech
        )
      port map(
        rstn      => cpu_resetn,
        clk_125   => clk_125_p,
        rst_125   => enet_resetn_inv,
        eth_rx_p  => enet_rx_p_d,
        eth_tx_p  => enet_tx_p,
        mdio      => enet_mdio,
        mdc       => enet_mdc
        );
  end generate;

  -- Note we use a low romdepth and aliasing to hide that we don't boot from address 0
  proms : for i in 0 to 3 generate
    prom0 : sram generic map (index => 3-i, abits => romdepth, fname => promfile)
      port map (fm_a(romdepth downto 1), fm_d(31-8*i downto 24-8*i),
                flash_cen(0), flash_wen, flash_oen);
  end generate;
  fm_d <= buskeep(fm_d) after 5 ns;
  flash_rdybsyn  <= "HH";

  test0 :  grtestmod
    port map ( cpu_resetn, flash_clk, user_led_g(0), fm_a(20 downto 1), fm_d,
             '0', flash_oen, flash_wen);

  iuerr : process
  begin
    wait for 2500 ns;
    if to_x01(user_led_r(0)) = '1' then wait on user_led_r(0); end if;
    assert (to_x01(user_led_r(0)) = '1')
      report "*** IU in error mode, simulation halted ***"
      severity failure ;
  end process;

end ;

