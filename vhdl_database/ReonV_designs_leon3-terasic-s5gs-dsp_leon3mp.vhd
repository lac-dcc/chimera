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
--  LEON3 Demonstration design
--  Copyright (C) 2016 Cobham Gaisler
------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
library grlib, techmap;
use grlib.amba.all;
use grlib.devices.all;
use grlib.stdlib.all;


use techmap.gencomp.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.net.all;
use gaisler.jtag.all;
use gaisler.ddrpkg.all;
use gaisler.l2cache.all;

-- pragma translate_off
use gaisler.sim.all;
-- pragma translate_on

library esa;
use esa.memoryctrl.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;   -- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (
    -- GPLL-CLK
    clkin_50 : in std_ulogic;                    -- 1.8V 50 MHz, also to EPM2210F256
    clkintop_p : in std_logic_vector(1 downto 0);   -- LVDS  100 MHz prog osc External Term
    clkinbot_p : in std_logic_vector(1 downto 0);   -- LVDS  100 MHz prog osc clkinbot_p[0]
                                                 -- clkinbot_p[1] External Term.
    clk_125_p   : in std_ulogic;                 -- LVDS 125 MHz GPLL-req's OCT.
    -- XCVR-REFCLK
    -- refclk1_ql0_p : in std_ulogic;    -- Default 100MHz
    -- refclk2_ql1_p : in std_ulogic; -- Default 644.53125MHz
    -- refclk4_ql2_p : in std_ulogic; --Default 282.5MHz
    -- refclk5_ql2_p : in std_ulogic; --Default 148.5MHz
    -- refclk0_qr0_p : in std_ulogic; --Default 100MHz
    -- refclk1_qr0_p : in std_ulogic; --Default 156.25MHz
    -- refclk2_qr1_p : in std_ulogic; --Default 625MHz
    -- refclk4_qr2_p : in std_ulogic; --Default 100MHz
    -- refclk5_qr2_p : in std_ulogic; --Default 270MHz (DisplayPort)
    -- Si571 VCXO
    sdi_clk148_up : out std_ulogic;
    sdi_clk148_dn : out std_ulogic;
    -- DDR3 Devices-x72
    ddr3_a        : out std_logic_vector(13 downto 0); -- SSTL15  Address
    ddr3_ba       : out std_logic_vector(2 downto 0); -- SSTL15  Bank Address
    ddr3_casn     : out std_ulogic;         -- SSTL15 Column Address Strobe
    ddr3_clk_n    : out std_ulogic;       -- SSTL15 Diff Clock - Neg
    ddr3_clk_p    : out std_ulogic;       -- SSTL15 Diff Clock - Pos
    ddr3_cke      : out std_ulogic;          -- SSTL15 Clock Enable
    ddr3_csn      : out std_ulogic;         -- SSTL15 Chip Select
    ddr3_dm       : inout std_logic_vector(8 downto 0); -- SSTL15 Data Write Mask
    ddr3_dq       : inout std_logic_vector(71 downto 0);    -- SSTL15 Data Bus
    ddr3_dqs_n    : inout std_logic_vector(8 downto 0);  -- SSTL15 Diff Data Strobe - Neg
    ddr3_dqs_p    : inout std_logic_vector(8 downto 0); -- SSTL15 Diff Data Strobe - Pos
    ddr3_odt      : out std_ulogic; -- SSTL15 On-Die Termination Enable
    ddr3_rasn     : out std_ulogic; -- SSTL15 Row Address Strobe
    ddr3_resetn   : out std_ulogic; -- SSTL15 Reset
    ddr3_wen      : out std_ulogic; -- SSTL15 Write Enable
    rzqin_1p5     : in std_ulogic; -- OCT Pin in Bank 4A
    -- QDR2 x18read/x18write
    qdrii_a       : out std_logic_vector(19 downto 0);   -- HSTL15/18  Address
    qdrii_bwsn    : out std_logic_vector(1 downto 0); -- HSTL15/18  //Byte Write Select
    qdrii_cq_n    : in std_logic;       -- HSTL15/18 Read Data Clock - Neg
    qdrii_cq_p    : in std_ulogic;       -- HSTL15/18 Read Data Clock - Pos
    qdrii_d       : out std_logic_vector(17 downto 0);  -- HSTL15/18  //Write Data
    qdrii_doffn   : out std_logic;       -- HSTL15/18  //PLL disable (TR=0)
    qdrii_k_n     : out std_logic;        -- HSTL15/18  //Write Data Clock - Neg
    qdrii_k_p     : out std_logic;        -- HSTL15/18  //Write Data Clock - Pos
    qdrii_q       : in std_logic_vector(17 downto 0); -- HSTL15/18  //Read Data
    -- qdrii_odt : out std_logic; -- HSTL15/18  //On-Die Termination Enable (QDRII Cn)
    qdrii_c_p     : in std_logic; -- qdrii_qvld  HSTL15/18  Read Data Valid	(QDRII Cp)
    qdrii_rpsn    : out std_logic; -- HSTL15/18 Read Port Select
    qdrii_wpsn    : out std_logic; -- HSTL15/18 Write Port Select
    rzqin_1p8     : in std_logic; -- OCT pin for QDRII/+ and RLDRAM II
    -- RLDRAM2-x18
    rldc_a        : out std_logic_vector(22 downto 0); --HSTL15/18 Address
    rldc_ba       : out std_logic_vector(2 downto 0); --/HSTL15/18 Bank Address
    rldc_ck_n     : out std_logic;  --HSTL15/18  //Input Clock - Neg
    rldc_ck_p     : out std_logic; --HSTL15/18  //Input Clock - Pos
    rldc_dq       : inout std_logic_vector(17 downto 0); --HSTL15/18  //Data
    rldc_dk_n     : out std_logic; --HSTL15/18  //Write (Input) Data Clock - Neg
    rldc_dk_p     : out std_logic; --HSTL15/18  //Write (Input) Data Clock - Pos
    rldc_qk_n     : in std_logic_vector(1 downto 0); --HSTL15/18  //Read (Output) Data Clock - Neg
    rldc_qk_p     : in std_logic_vector(1 downto 0); --HSTL15/18  //Read (Output) Data Clock - Pos
    rldc_dm       : out std_logic; -- HSTL15/18  //Input Data Mask
    rldc_qvld     : in std_logic; -- HSTL15/18  //Read Data Valid
    rldc_csn      : out std_logic; -- HSTL15/18  //Chip Select
    rldc_wen      : out std_logic; -- HSTL15/18  //Write Enable
    rldc_refn     : out std_logic; -- HSTL15/18  //Ref Command
    -- Ethernet-10/100/1000
    enet_intn     : in std_logic; -- 2.5V    //MDIO Interrupt (TR=0)
    enet_mdc      : out std_logic; -- 2.5V    //MDIO Clock (TR=0)
    enet_mdio     : inout std_logic; -- 2.5V    //MDIO Data (TR=0)
    enet_resetn   : out std_logic; -- 2.5V    //Device Reset (TR=0)
    enet_rx_p     : in std_logic; -- LVDS NEED EXTERNAL TERM //SGMII Receive-req's OCT
    enet_tx_p     : out std_logic;   -- LVDS    //SGMII Transmit
    -- FSM-Shared-Bus (Flash/Max)
    fm_a          : out std_logic_vector(26 downto 0); -- 1.8V    //Address
    fm_d          : inout std_logic_vector(31 downto 0); -- 1.8V    //Data
    flash_advn    : out std_logic; -- 1.8V    //Flash Address Valid
    flash_cen     : out std_logic_vector(1 downto 0); -- 1.8V    //Flash Chip Enable
    flash_clk     : out std_logic; -- 1.8V    //Flash Clock
    flash_oen     : out std_logic; -- 1.8V    //Flash Output Enable
    flash_rdybsyn : in std_logic_vector(1 downto 0); -- 1.8V    //Flash Ready/Busy
    flash_resetn  : out std_logic; -- 1.8V    //Flash Reset
    flash_wen     : out std_logic; -- 1.8V    //Flash Write Enable
    max5_ben      : out std_logic_vector(3 downto 0); -- 1.5V    //Max V Byte Enable Per Byte
    max5_clk      : inout std_logic; -- 1.5V    //Max V Clk
    max5_csn      : out std_logic; -- 1.5V    //Max V Chip Select
    max5_oen      : out std_logic; -- 1.5V    //Max V Output Enable
    max5_wen      : out std_logic; -- 1.5V    //Max V Write Enable
    -- Configuration
    -- fpga_data     : inout std_logic_vector(31 downto 0); -- 2.5V    //Configuration data
    -- Character-LCD
    lcd_csn       : out std_ulogic;              -- 2.5V LCD Chip Select
    lcd_d_cn      : out std_ulogic;             -- 2.5V LCD Data / Command Select
    lcd_data      : inout std_logic_vector(7 downto 0); -- 2.5V  LCD Data
    lcd_wen       : out std_ulogic;             -- 2.5V LCD Write Enable
    -- User-IO
    user_dipsw    : in std_logic_vector(7 downto 0); -- HSMB_VAR User DIP Switches (TR=0)
    user_led_g    : out std_logic_vector(7 downto 0); -- 2.5V User LEDs
    user_led_r    : out std_logic_vector(7 downto 0); -- 2.5V/1.8V User LEDs
    user_pb       : in std_logic_vector(2 downto 0); -- HSMB_VAR User Pushbuttons (TR=0)
    cpu_resetn    : in std_logic;  -- 2.5V  CPU Reset Pushbutton (TR=0)
    -- PCI-Express
    -- pcie_rx_p : in std_logic_vector(7 downto 0);      -- PCML14  PCIe Receive Data-req's OCT
    -- pcie_tx_p : out std_logic_vector(7 downto 0);     -- PCML14  PCIe Transmit Data
    -- pcie_refclk_p : in std_ulogic;  -- HCSL   PCIe Clock- Terminate on MB
    pcie_led_g3   : out std_ulogic;  -- 2.5V    User LED - Labeled Gen3
    pcie_led_g2   : out std_ulogic;  -- 2.5V    User LED - Labeled Gen2
    pcie_led_x1   : out std_ulogic;  -- 2.5V    User LED - Labeled x1
    pcie_led_x4   : out std_ulogic;  -- 2.5V    User LED - Labeled x4
    pcie_led_x8   : out std_ulogic;  -- 2.5V    User LED - Labeled x8
    pcie_perstn   : in std_ulogic;   -- 2.5V    PCIe Reset
    pcie_smbclk   : in std_logic;    -- 2.5V    SMBus Clock (TR=0)
    pcie_smbdat   : inout std_logic; -- 2.5V    SMBus Data (TR=0)
    pcie_waken    : out std_ulogic;   -- 2.5V    PCIe Wake-Up (TR=0)
                                   --         must install 0-ohm resistor
    -- USB 2.0
    usb_data      : inout std_logic_vector(7 downto 0); -- 1.5V from MAXV
    usb_addr      : inout std_logic_vector(1 downto 0); -- 1.5V from MAXV
    usb_clk       : inout std_logic; -- 3.3V from Cypress USB
    usb_full      : out std_logic; -- 1.5V from MAXV
    usb_empty     : out std_logic; -- 1.5V from MAXV
    usb_scl       : in std_logic;  -- 1.5V from MAXV
    usb_sda       : inout std_logic; -- /1.5V from MAXV
    usb_oen       : in std_ulogic; -- 1.5V from MAXV
    usb_rdn       : in std_ulogic; -- 1.5V from MAXV
    usb_wrn       : in std_ulogic; -- 1.5V from MAXV
    usb_resetn    : in std_ulogic; -- 1.5V from MAXV
    -- QSFP
    -- qsfp_tx_p : out std_logic_vector(3 downto 0);
    -- qsfp_rx_p: in std_logic_vector (3 downto 0);
    qsfp_mod_seln  : out std_ulogic;
    qsfp_rstn      : out std_ulogic;
    qsfp_scl       : out std_ulogic;
    qsfp_sda       : inout std_logic;
    qsfp_interruptn: in std_ulogic;
    qsfp_mod_prsn  : in std_logic;
    qsfp_lp_mode   : in std_ulogic;
    -- DispayPort x4
    -- dp_ml_lane_p : out std_logic_vector(3 downto 0); -- Transceiver Data
    dp_aux_p       : in std_logic;            -- LVDS (bi-directional) Auxillary Channel
    dp_aux_tx_p    : out std_logic;           -- LVDS (transmit side) Auxillary Channel
    -- dp_aux_ch_p : inout std_logic;         -- LVDS (bi-directional) Auxillary Channel
    -- dp_aux_ch_n : inout std_logic;         -- LVDS (bi-directional) Auxillary Channel
    dp_hot_plug    : in std_logic;            -- 2.5V Hot Plug Detect
    dp_return      : out std_logic;           -- 2.5V Return for power
    dp_direction   : out std_logic;           -- 2.5V Direction Select on M-LVDS Transceiver
    -- SDI-Video-Port
    -- sdi_rx_p : in std_logic;          -- PCML14  //SDI Video Input-req's OCT
    -- sdi_tx_p : out std_logic;         -- PCML14  //SDI Video Output
    -- sdi_clk148_dn : out std_logic;    -- 2.5V    //VCO Frequency Down
    -- sdi_clk148_up : out std_logic;    -- 2.5V    //VCO Frequency Up
    sdi_tx_sd_hdn  : out std_logic;      -- 2.5V    //HD Mode Enable
    sdi_tx_en      : out std_logic;      -- 2.5V  //Transmit Enable
    sdi_rx_en      : out std_logic;      -- 2.5V  //Receive Enable - Tri-state
    sdi_rx_bypass  : out std_logic;      -- 2.5V  //Receive Bypass
    -- Transceiver-SMA-Output
--    sma_tx_p       : in std_logic;       -- PCML14 SMA Output Pair
    -- HSMC-Port-A
    -- hsma_rx_p : in std_logic_vector(7 downto 0);  -- PCML14  //HSMA Receive Data-req's OCT
    -- hsma_tx_p : out std_logic_vector(7 downto 0); -- PCML14  //HSMA Transmit Data
    -- Enable below for CMOS HSMC
    --  hsma_d : inout std_logic_vector(79 downto 0); -- /2.5V    //HSMA CMOS Data Bus
    -- Enable below for LVDS HSMC
    hsma_clk_in0    : in std_logic;     --2.5V    //Primary single-ended CLKIN
    hsma_clk_in_p1  : in std_logic;   -- LVDS    //Secondary diff. CLKIN
    hsma_clk_in_p2  : in std_logic;   -- LVDS    //Primary Source-Sync CLKIN
    hsma_clk_out0   : out std_logic;      -- 2.5V    //Primary single-ended CLKOUT
    hsma_clk_out_p1 : out std_logic;     -- LVDS    //Secondary diff. CLKOUT
    hsma_clk_out_p2 : out std_logic;    -- LVDS    //Primary Source-Sync CLKOUT
    hsma_d          : inout std_logic_vector(3 downto 0);   -- 2.5V    //Dedicated CMOS IO
    hsma_prsntn     : in std_logic;        -- 2.5V    //HSMC Presence Detect Input
    hsma_rx_d_p     : in std_logic_vector(16 downto 0);        -- LVDS    //LVDS Sounce-Sync Input
    hsma_tx_d_p     : out std_logic_vector(16 downto 0);      -- LVDS    //LVDS Sounce-Sync Output
    hsma_rx_led     : out std_logic;     -- 2.5V    //User LED - Labeled RX
    hsma_scl        : out std_logic;        -- 2.5V    //SMBus Clock
    hsma_sda        : inout std_logic;      -- 2.5V    //SMBus Data
    hsma_tx_led     : out std_logic;     -- 2.5V    //User LED - Labeled TX
    -- HSMC-Port-B
    -- hsmb_rx_p : in std_logic_vector(7 downto 0);  -- PCML14  //HSMB Receive Data-req's OCT
    -- hsmb_tx_p : out std_logic_vector(7 downto 0); -- PCML14  //HSMB Transmit Data
    -- Enable below for CMOS HSMC
    -- hsmb_d : inout std_logic_vector(79 downto 0); -- 2.5V    //HSMB CMOS Data Bus
    -- Enable below for LVDS HSMC
    hsmb_clk_in0     : in std_logic;    -- 2.5V    //Primary single-ended CLKIN
    hsmb_clk_in_p1   : in std_logic;    -- LVDS    //Secondary diff. CLKIN
    hsmb_clk_in_p2   : in std_logic;    -- LVDS    //Primary Source-Sync CLKIN
    hsmb_clk_out0    : out std_logic;   -- 2.5V    //Primary single-ended CLKOUT
    hsmb_clk_out_p1  : out std_logic;   -- LVDS    //Secondary diff. CLKOUT
    hsmb_clk_out_p2  : out std_logic;   -- LVDS    //Primary Source-Sync CLKOUT
    -- hsmb_d : inout std_logic_vector(3 downto 0); -- 2.5V Dedicated CMOS IO
    -- DQS Standard - 1.5V/1.8V/2.5V standards
    hsmb_a           : inout std_logic_vector(15 downto 0); -- Address
    hsmb_addr_cmd    : inout std_logic_vector(0 downto 0); -- Additional Addres/Command pins
    hsmb_ba          : inout std_logic_vector(3 downto 0); -- Bank Address
    hsmb_casn        : inout std_logic;
    hsmb_rasn        : inout std_logic;
    hsmb_wen         : inout std_logic;
    hsmb_cke         : inout std_logic; -- Clock Enable
    hsmb_csn         : inout std_logic; -- Chip Select
    -- hsmb_c_p : out std_logic; -- c_p = QVLD; c_n = ODT
    hsmb_odt         : inout std_logic; -- ODT
    hsmb_qvld        : inout std_logic; -- QVLD
    hsmb_dm          : inout std_logic_vector(3 downto 0); -- Data Mask
    hsmb_dq          : inout std_logic_vector(31 downto 0); -- Data
    hsmb_dqs_p       : inout std_logic_vector(3 downto 0); -- Data Strobe positive
    hsmb_dqs_n       : inout std_logic_vector(3 downto 0); -- Data Strobe negative
    hsmb_prsntn      : in std_logic; -- 2.5V    //HSMC Presence Detect Input
    hsmb_rx_led      : out std_logic; -- 2.5V    //User LED - Labeled RX
    hsmb_scl         : out std_logic;    -- 2.5V    //SMBus Clock
    hsmb_sda         : inout std_logic;   -- 2.5V    //SMBus Data
    hsmb_tx_led      : out std_logic;  -- 2.5V    //User LED - Labeled TX
    rzqin_hsmb_var   : in std_logic
    );
end;

architecture rtl of leon3mp is

  constant blength : integer := 12;
  constant fifodepth : integer := 8;
  constant burstlen : integer := 16;     -- burst length in 32-bit words

  signal vcc, gnd   : std_logic_vector(7 downto 0);

  signal memi  : memory_in_type;
  signal memo  : memory_out_type;
  signal wpo   : wprot_out_type;
  signal del_addr : std_logic_vector(25 downto 1);
  signal del_ce, del_we: std_logic;
  signal del_bwa_n, del_bwb_n: std_logic_vector(1 downto 0);

  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal edcl_ahbmi : ahb_mst_in_type;
  signal edcl_ahbmo : ahb_mst_out_vector_type(1 downto 0);

  signal ddr3if_ahbsi: ahb_slv_in_type;
  signal ddr3if_ahbso: ahb_slv_out_type;

  signal mem_ahbsi : ahb_slv_in_type;
  signal mem_ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal mem_ahbmi : ahb_mst_in_type;
  signal mem_ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal clkm, rstn, rstraw : std_logic;
  signal cgi, cgi_125  : clkgen_in_type;
  signal cgo, cgo_125  : clkgen_out_type;
  signal u1i : uart_in_type;
  signal u1o : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;

  signal stati : ahbstat_in_type;

  signal gpti : gptimer_in_type;
  signal gpto : gptimer_out_type;

  signal gpioi : gpio_in_type;
  signal gpioo : gpio_out_type;

  signal dsubren : std_logic;

  signal tck, tms, tdi, tdo : std_logic;

  signal fpi : grfpu_in_vector_type;
  signal fpo : grfpu_out_vector_type;

  signal nolock   : ahb2ahb_ctrl_type;
  signal noifctrl : ahb2ahb_ifctrl_type;

  signal e0_reset, e1_reset     : std_logic;
  signal e0_mdio_o, e1_mdio_o   : std_logic;
  signal e0_mdio_oe, e1_mdio_oe : std_logic;
  signal e0_mdio_i, e1_mdio_i   : std_logic;
  signal e0_mdc, e1_mdc         : std_logic;
  signal e0_mdint, e1_mdint     : std_logic;

  signal ref_clk, ref_rstn, ref_rst: std_logic;

  signal led_crs1, led_link1, led_col1, led_an1, led_char_err1, led_disp_err1 : std_logic;
  signal led_crs2, led_link2, led_col2, led_an2, led_char_err2, led_disp_err2 : std_logic;
  signal led1_int, led2_int, led3_int, led4_int, led5_int, led6_int, led7_int : std_logic;

  constant BOARD_FREQ : integer := 50000;        -- Board frequency in KHz
  constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
  constant IOAEN : integer := 1;
  constant OEPOL : integer := padoen_polarity(padtech);
  constant DEBUG_BUS : integer  := 0;   -- Could add config setting for this.
  constant EDCL_SEP_AHB : integer := DEBUG_BUS;

  attribute syn_keep : boolean;
  attribute syn_preserve : boolean;
  attribute keep : boolean;

  signal ddr_clkv   : std_logic_vector(2 downto 0);
  signal ddr_clkbv  : std_logic_vector(2 downto 0);
  signal ddr_ckev   : std_logic_vector(1 downto 0);
  signal ddr_csbv   : std_logic_vector(1 downto 0);
  signal ddr_clk_fb           : std_ulogic;
  signal clkm125              : std_logic;
  signal clklock, lock, clkml : std_logic;

--  signal slide_switch: std_logic_vector(3 downto 0);

  signal counter1 : std_logic_vector(26 downto 0);
  signal counter2 : std_logic_vector(3 downto 0);
  signal bitslip_int : std_logic;
  signal tx_rstn0, tx_rstn1, rx_rstn0, rx_rstn1 : std_logic;

  signal clkddr_l : std_logic;

  signal user_led_light: std_logic_vector(7 downto 0);  -- 1=light 0=dark/off
  signal user_led_color: std_logic_vector(7 downto 0);  -- 1=green 0=red

  -- Bus indices on main AHB bus
  constant hsindex_mctrl : integer := 0;
  constant hsindex_apbc  : integer := hsindex_mctrl+CFG_MCTRL_LEON2;
  constant hsindex_dsu   : integer := hsindex_apbc+1;  -- 2
  constant hsindex_ddr3  : integer := hsindex_dsu + CFG_DSU*(1-DEBUG_BUS);  --3
  constant hsindex_l2c   : integer := hsindex_ddr3;  -- replaces same slot as DDR3 controller
  constant hsindex_aram  : integer := hsindex_ddr3+1;
  constant hsindex_repm  : integer := hsindex_aram+CFG_AHBRAMEN;
  constant hsindex_free  : integer := hsindex_repm
--pragma translate_off
                                      +1
--pragma translate_on
                                      ;

  constant hmindex_jtag : integer := CFG_NCPU;
  constant hmindex_eth  : integer := hmindex_jtag+CFG_AHB_JTAG*(1-DEBUG_BUS);
  constant hmindex_dbgb : integer := hmindex_eth+CFG_GRETH;
  constant hmindex_free : integer := hmindex_dbgb+DEBUG_BUS;

begin

  user_led_g <= not (user_led_light and user_led_color);
  user_led_r <= not (user_led_light and not user_led_color);

  user_led_light <= (not gpioo.oen(3 downto 0)) & "0111";
  user_led_color <= gpioo.dout(3 downto 0) & "0" & lock & (not dsuo.active) & (dbgo(0).error);

  nolock <= ahb2ahb_ctrl_none;
  noifctrl <= ahb2ahb_ifctrl_none;

  max5_ben <= "1111";
  max5_clk <= clkin_50;
  max5_csn <= '1';
  max5_oen <= '1';
  max5_wen <= '1';

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= (others => '1');
  gnd <= (others => '0');

  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw;

  clklock <= cgo.clklock and lock;
  clkgen0 : clkgen                      -- clock generator using toplevel generic 'freq'
    generic map (tech    => CFG_CLKTECH, clk_mul => CFG_CLKMUL,
                 clk_div => CFG_CLKDIV, sdramen => 0,
                 noclkfb => CFG_CLK_NOFB, freq => BOARD_FREQ)
    port map (clkin => clkin_50, pciclkin => gnd(0), clk => clkm, clkn => open,
              clk2x => open, sdclk => open, pciclk => open,
              cgi   => cgi, cgo => cgo);

  rst0 : rstgen                 -- reset generator
    port map (cpu_resetn, clkm, clklock, rstn, rstraw);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl                -- AHB arbiter/multiplexer
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, fpnpen => CFG_FPNPEN,
                 rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => IOAEN,
                 ahbtrace => CFG_AHB_DTRACE,
                 nahbm => hmindex_free,
                 nahbs => hsindex_free)
    port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

  ahbmo(ahbmo'high downto hmindex_free) <= (others => ahbm_none);
  ahbso(ahbso'high downto hsindex_free) <= (others => ahbs_none);

----------------------------------------------------------------------
---  LEON3 processor         -----------------------------------------
----------------------------------------------------------------------

  cpu : for i in 0 to CFG_NCPU-1 generate
    nosh : if CFG_GRFPUSH = 0 generate
      u0 : leon3s               -- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU*(1-CFG_GRFPUSH), CFG_V8,
                     0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
                     CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
                     CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
                     CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
                     CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
                     0, 0, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
                  irqi(i), irqo(i), dbgi(i), dbgo(i));
    end generate;
  end generate;

  sh : if CFG_GRFPUSH = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      u0 : leon3sh              -- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
                     0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
                     CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
                     CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
                     CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
                     CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
                     0, 0, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
                  irqi(i), irqo(i), dbgi(i), dbgo(i), fpi(i), fpo(i));
    end generate;

    grfpush0 : grfpushwx generic map ((CFG_FPU-1), CFG_NCPU, fabtech)
      port map (clkm, rstn, fpi, fpo);

  end generate;

  -- errorn_pad : odpad generic map (tech => padtech) port map (user_led_g(0), dbgo(0).error);

----------------------------------------------------------------------
---  Debug                   -----------------------------------------
----------------------------------------------------------------------
  -- Debug DSU and debug links can be connected to the system on two
  -- ways:
  --
  -- a) Directly to the main AHB bus
  -- b) Connected via a dedicated debug AHB bus that is connected to
  --    the main AHB bus via a AHB/AHB bridge.


  dsui.enable <= '1';
  dsubre_pad : inpad generic map (tech => padtech) port map (user_pb(0), dsubren);
  dsui.break <= not dsubren;
  -- dsuact_pad : outpad generic map (tech => padtech) port map (user_led_g(1), dsuo.active);

  nodbgbus : if DEBUG_BUS /= 1 generate
    -- DSU and debug links directly connected to main bus

    edcl_ahbmi <= ahbmi;
    -- EDCL ahbmo interfaces are not used in this configuration

    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3                 -- LEON3 Debug Support Unit
        generic map (hindex => hsindex_dsu, haddr => 16#E00#, hmask => 16#FC0#,
                     ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(hsindex_dsu), dbgo, dbgi, dsui, dsuo);
    end generate;
    nodsu : if CFG_DSU = 0 generate
      dsuo.tstop <= '0'; dsuo.active <= '0';
    end generate;

    ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
      ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => hmindex_jtag)
        port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(hmindex_jtag),
                 open, open, open, open, open, open, open, gnd(0));
    end generate;
  end generate;

  dbgbus : if DEBUG_BUS = 1 generate
    -- DSU and debug links connected via AHB/AHB bridge to process
    dbgsubsys : block
      constant DBG_AHBIO : integer := 16#EFF#;

      signal dbg_ahbsi   : ahb_slv_in_type;
      signal dbg_ahbso   : ahb_slv_out_vector := (others => ahbs_none);
      signal dbg_ahbmi   : ahb_mst_in_type;
      signal dbg_ahbmo   : ahb_mst_out_vector := (others => ahbm_none);
    begin

      edcl_ahbmi <= dbg_ahbmi;
      dbg_ahbmo(CFG_AHB_JTAG) <= edcl_ahbmo(0);
      dbg_ahbmo(CFG_AHB_JTAG+1) <= edcl_ahbmo(1);

      dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3_mb                 -- LEON3 Debug Support Unit
        generic map (hindex => 0, haddr => 16#E00#, hmask => 16#FC0#,
                     ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, dbg_ahbsi, dbg_ahbso(0), ahbsi, dbgo, dbgi, dsui, dsuo);
      end generate;
      nodsu : if CFG_DSU = 0 generate
        dbg_ahbso(0) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
      end generate;

      membustrc : if true generate
        ahbtrace0: ahbtrace_mb
          generic map (
            hindex  => 2,
            ioaddr  => 16#000#,
            iomask  => 16#E00#,
            tech    => memtech,
            irq     => 0,
            kbytes  => 8,
            ahbfilt => 2)
          port map(
            rst     => rstn,
            clk     => clkm,
            ahbsi   => dbg_ahbsi,
            ahbso   => dbg_ahbso(2),
            tahbmi  => mem_ahbmi,
            tahbsi  => mem_ahbsi);
      end generate;

      ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
        ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => 0)
          port map(rstn, clkm, tck, tms, tdi, tdo, dbg_ahbmi, dbg_ahbmo(0),
                 open, open, open, open, open, open, open, gnd(0));
      end generate;

      ahb0 : ahbctrl                -- AHB arbiter/multiplexer
        generic map (defmast => CFG_DEFMST, split => 0, fpnpen => CFG_FPNPEN,
                     rrobin => CFG_RROBIN, ioaddr => DBG_AHBIO,
                     ioen => 1,
                     nahbm => CFG_AHB_JTAG+CFG_GRETH,
                     nahbs => 3)
        port map (rstn, clkm, dbg_ahbmi, dbg_ahbmo, dbg_ahbsi, dbg_ahbso);

      -- Bridge connecting debug bus -> processor bus
      -- Configuration:
      -- Prefetching with a maximum burst length of 8 words
      -- No interrupt synchronisation
      -- Debug cores cannot make locked accesses => lckdac = 0
      -- Slave maximum access size: 32
      -- Master maximum access size: 128
      -- Read and write combining
      -- No special handling for instruction bursts
      debug_bridge: ahb2ahb
        generic map (
          memtech     => 0,
          hsindex     => 1,
          hmindex     => hmindex_dbgb,
          slv         => 0,
          dir         => 1,
          ffact       => 1,
          pfen        => 1,
          wburst      => burstlen,
          iburst      => 8,
          rburst      => burstlen,
          irqsync     => 0,
          bar0        => ahb2ahb_membar(16#000#, '1', '1', 16#800#),
          bar1        => ahb2ahb_membar(16#800#, '0', '0', 16#C00#),
          bar2        => ahb2ahb_membar(16#C00#, '0', '0', 16#E00#),
          bar3        => ahb2ahb_membar(16#F00#, '0', '0', 16#F00#),
          sbus        => 2,
          mbus        => 0,
          ioarea      => 16#FFF#,
          ibrsten     => 0,
          lckdac      => 0,
          slvmaccsz   => 32,
          mstmaccsz   => 32,
          rdcomb      => 0,
          wrcomb      => 0,
          combmask    => 0,
          allbrst     => 0,
          ifctrlen    => 0,
          fcfs        => 0,
          fcfsmtech   => 0,
          scantest    => 0,
          split       => 0,
          pipe        => 0)
        port map (
          rstn        => rstn,
          hclkm       => clkm,
          hclks       => clkm,
          ahbsi       => dbg_ahbsi,
          ahbso       => dbg_ahbso(1),
          ahbmi       => ahbmi,
          ahbmo       => ahbmo(hmindex_dbgb),
          ahbso2      => ahbso,
          lcki        => nolock,
          lcko        => open,
          ifctrl      => noifctrl);
    end block dbgsubsys;
  end generate;

----------------------------------------------------------------------
---  Memory subsystem   ----------------------------------------------
----------------------------------------------------------------------
  -- Byte swap to be compatible with GRMON CFI flash routines
  data_pad3 : iopadvv generic map (tech => padtech, width => 8, oepol => OEPOL)
    port map (fm_d(31 downto 24), memo.data(7 downto 0), memo.vbdrive(7 downto 0), memi.data(7 downto 0));
  data_pad2 : iopadvv generic map (tech => padtech, width => 8, oepol => OEPOL)
    port map (fm_d(23 downto 16), memo.data(15 downto 8), memo.vbdrive(15 downto 8), memi.data(15 downto 8));
  data_pad1 : iopadvv generic map (tech => padtech, width => 8, oepol => OEPOL)
    port map (fm_d(15 downto 8), memo.data(23 downto 16), memo.vbdrive(23 downto 16), memi.data(23 downto 16));
  data_pad0 : iopadvv generic map (tech => padtech, width => 8, oepol => OEPOL)
    port map (fm_d(7 downto 0), memo.data(31 downto 24), memo.vbdrive(31 downto 24), memi.data(31 downto 24));

  fm_a(26 downto 1) <= memo.address(27 downto 2);
  fm_a(0) <= '0';
  flash_clk <= '0';
  flash_resetn <= rstn;
  flash_cen <= memo.romsn(0) & memo.romsn(0);
  flash_oen <= memo.oen;
  flash_wen <= memo.writen;
  flash_advn <= '0';

  memi.brdyn <= '1';
  memi.bexcn <= '1';
  memi.writen <= '1';
  memi.wrn <= (others => '1');
  memi.bwidth <= "10";
  memi.sd <= (others => '0');
  memi.cb <= (others => '0');
  memi.scb <= (others => '0');
  memi.edac <= '0';

  mctrl0 : if CFG_MCTRL_LEON2 = 1 generate
    mctrl0 : mctrl generic map (hindex => hsindex_mctrl, pindex => 0,
      romaddr => 16#000#, rommask => 16#f80#,
      ioaddr => 0, iomask => 0,
      ramaddr => 0, rammask => 0,
      ram8 => CFG_MCTRL_RAM8BIT, 
      ram16 => CFG_MCTRL_RAM16BIT,
      sden => CFG_MCTRL_SDEN, 
      invclk => CFG_MCTRL_INVCLK,
      sepbus => CFG_MCTRL_SEPBUS)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(hsindex_mctrl), apbi, apbo(0), wpo, open);
  end generate;

  nomctrl0: if CFG_MCTRL_LEON2 = 0 generate
    apbo(0) <= apb_none;
    memo <= memory_out_none;
  end generate;

  -----------------------------------------------------------------------------
  -- DDR3 Interface
  -----------------------------------------------------------------------------
  ddr3if0: entity work.ddr3if
    generic map (
      hindex => hsindex_ddr3*(1-CFG_L2_EN),
      haddr => 16#400#, hmask => 16#C00#,
		burstlen => 16
      )
    port map (
      pll_ref_clk => clkintop_p(0),
      global_reset_n => cpu_resetn,
      mem_a => ddr3_a,
      mem_ba => ddr3_ba,
      mem_ck => ddr3_clk_p,
      mem_ck_n => ddr3_clk_n,
      mem_cke => ddr3_cke,
      mem_reset_n => ddr3_resetn,
      mem_cs_n => ddr3_csn,
      mem_dm => ddr3_dm,
      mem_ras_n => ddr3_rasn,
      mem_cas_n => ddr3_casn,
      mem_we_n =>  ddr3_wen,
      mem_dq => ddr3_dq,
      mem_dqs => ddr3_dqs_p,
      mem_dqs_n => ddr3_dqs_n,
      mem_odt => ddr3_odt,
      oct_rzqin => rzqin_1p5,
      ahb_clk => clkm,
      ahb_rst => rstn,
      ahbsi => ddr3if_ahbsi,
      ahbso => ddr3if_ahbso
      );



  l2cdis : if CFG_L2_EN = 0 generate
    ddr3if_ahbsi <= ahbsi;
    ahbso(hsindex_ddr3) <= ddr3if_ahbso;
    lock <= '1';
  end generate;
  -----------------------------------------------------------------------------
  -- L2 cache covering DDR2 SDRAM memory controller
  -----------------------------------------------------------------------------
  l2cen : if CFG_L2_EN /= 0 generate
    memorysubsys : block
      constant MEM_AHBIO : integer := 16#FFE#;
    begin
      l2c0 : l2c
        generic map(hslvidx => hsindex_l2c, hmstidx => 0, cen => CFG_L2_PEN,
                    haddr => 16#400#, hmask => 16#c00#, ioaddr => 16#FF0#,
                    cached => CFG_L2_MAP, repl => CFG_L2_RAN, ways => CFG_L2_WAYS,
                    linesize => CFG_L2_LSZ, waysize => CFG_L2_SIZE,
                    memtech => memtech, bbuswidth => AHBDW,
                    bioaddr => MEM_AHBIO, biomask => 16#fff#,
                    sbus => 0, mbus => 1, arch => CFG_L2_SHARE,
                    ft => CFG_L2_EDAC)
        port map(rst => rstn, clk => clkm, ahbsi => ahbsi, ahbso => ahbso(hsindex_l2c),
                 ahbmi => mem_ahbmi, ahbmo => mem_ahbmo(0), ahbsov => mem_ahbso);

      ahb0 : ahbctrl                -- AHB arbiter/multiplexer
        generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
                     rrobin => CFG_RROBIN, ioaddr => MEM_AHBIO,
                     ioen => IOAEN, nahbm => 1, nahbs => 1)
        port map (rstn, clkm, mem_ahbmi, mem_ahbmo, mem_ahbsi, mem_ahbso);

      lock <= '1';

      mem_ahbso(mem_ahbso'high downto 1) <= (others => ahbs_none);
      mem_ahbmo(mem_ahbmo'high downto 1) <= (others => ahbm_none);
      mem_ahbso(0) <= ddr3if_ahbso;
      ddr3if_ahbsi <= mem_ahbsi;

    end block memorysubsys;
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl                                -- AHB/APB bridge
    generic map (hindex => hsindex_apbc, haddr => CFG_APBADDR)
    port map (rstn, clkm, ahbsi, ahbso(hsindex_apbc), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
                   fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd <= '1' ;
    u1i.ctsn <= '0'; u1i.extclk <= '0';
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp                    -- interrupt controller
      generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
      port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer                    -- timer unit
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
                   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM,
                   nbits => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GR GPIO unit
    grgpio0: grgpio
      generic map( pindex => 9, paddr => 9, imask => CFG_GRGPIO_IMASK,
                   nbits => CFG_GRGPIO_WIDTH)
      port map( rstn, clkm, apbi, apbo(9), gpioi, gpioo);
    gpioi.din(6 downto 4) <= user_pb;
    gpioi.din(31 downto 7) <= (others => '0');
    gpioi.din(3 downto 0) <= "0000";
    -- dout/oen(3:0) mapped to LEDs above
  end generate;

  ahbs : if CFG_AHBSTAT = 1 generate    -- AHB status register
    stati.cerror(0) <= memo.ce;
    ahbstat0 : ahbstat
      generic map (pindex => 15, paddr => 15, pirq => 1,
                   nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;
  nop2 : if CFG_AHBSTAT = 0 generate apbo(15) <= apb_none; end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC

    -- 125 MHz Gigabit ethernet clock generator from 50 MHz input
    sgmii_pll0 : clkgen
      generic map (
        tech    => CFG_CLKTECH,
        clk_mul => 5,
        clk_div => 2,
        sdramen => 0,
        freq    => 50000
      )
      port map (
        clkin     => clkin_50,
        pciclkin  => gnd(0),
        clk       => ref_clk,
        clkn      => open,
        clk2x     => open,
        sdclk     => open,
        pciclk    => open,
        cgi       => cgi_125,
        cgo       => cgo_125
      );

    -- 125 MHz clock reset synchronizer
    rst2 : rstgen
      generic map (acthigh => 0)
      port map (e0_reset, ref_clk, cgo_125.clklock, ref_rstn, open);

    ref_rst <= not ref_rstn;

    e0 : greths_mb        -- Gaisler Ethernet MAC 0
      generic map (
        hindex      => hmindex_eth,
        ehindex     => CFG_AHB_JTAG,
        pindex      => 11,
        paddr       => 11,
        pirq        => 6,
        fabtech     => fabtech,
        memtech     => memtech,
        mdcscaler   => CPU_FREQ/1000,
        enable_mdio => 1,
        nsync       => 2,
        edcl        => CFG_DSU_ETH,
        edclbufsz   => CFG_ETH_BUF,
        burstlength => burstlen,
        macaddrh    => CFG_ETH_ENM,
        macaddrl    => CFG_ETH_ENL, 
        phyrstadr   => 0,
        ipaddrh     => CFG_ETH_IPM,
        ipaddrl     => CFG_ETH_IPL,
        edclsepahbg => EDCL_SEP_AHB,
        giga        => CFG_GRETH1G,
        sim         => 1,
        mdiohold    => 4
        )
      port map (
        rst             => rstn,
        clk             => clkm,
        ahbmi           => ahbmi,
        ahbmo           => ahbmo(hmindex_eth),
        ahbmi2          => edcl_ahbmi,
        ahbmo2          => edcl_ahbmo(0),
        apbi            => apbi,
        apbo            => apbo(11),
        -- High-speed Serial Interface
        clk_125         => ref_clk,
        rst_125         => ref_rst,
        eth_rx_p        => enet_rx_p,
        eth_tx_p        => enet_tx_p,
        -- MDIO interface
        reset           => e0_reset,
        mdio_o          => e0_mdio_o,
        mdio_oe         => e0_mdio_oe,
        mdio_i          => e0_mdio_i,
        mdc             => e0_mdc,
        mdint           => e0_mdint,
        -- Control signals
        phyrstaddr      => "00000",
        edcladdr        => "0001",
        edclsepahb      => '1',
        edcldisable     => '0',
        debug_pcs_mdio  => '0'
        );

    ethrst_pad : outpad generic map (tech => padtech)
      port map (enet_resetn, e0_reset);

    emdio0_pad : iopad generic map (tech => padtech)
      port map (enet_mdio, e0_mdio_o, e0_mdio_oe, e0_mdio_i);

    emdc0_pad : outpad generic map (tech => padtech)
      port map (enet_mdc, e0_mdc);

    eint0_pad : inpad generic map (tech => padtech)
      port map (enet_intn, e0_mdint);

  end generate;

  noeth0 : if CFG_GRETH = 0 generate
    edcl_ahbmo(0) <= ahbm_none;
  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate
    ahbram0 : ahbram generic map (hindex => hsindex_aram, haddr => CFG_AHBRADDR,
      tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ)
    port map ( rstn, clkm, ahbsi, ahbso(hsindex_aram));
  end generate;

-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off

  test0 : ahbrep generic map (hindex => hsindex_repm, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(hsindex_repm));

-- pragma translate_on
-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => system_table(ALTERA_DE4),
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on
end;

