-----------------------------------------------------------------------------
--  LEON3/LEON4 Demonstration design
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
library grlib, techmap;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
use techmap.gencomp.all;
use techmap.allclkgen.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.spi.all;
use gaisler.i2c.all;
use gaisler.net.all;
use gaisler.jtag.all;
use gaisler.pci.all;
use gaisler.ddrpkg.all;
use gaisler.l2cache.all;
use gaisler.subsys.all;

library esa;
use esa.memoryctrl.all;
use esa.pcicomp.all;
use work.config.all;

-- pragma translate_off
library unisim;
use unisim.BUFG;
use unisim.IBUFDS;
-- pragma translate_on
-- pragma translate_on

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    transtech : integer := CFG_TRANSTECH;
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;   -- Print UART on console
    pclow     : integer := CFG_PCLOW
  );
  port (
    fpga_cpu_reset_b : in  std_ulogic;
    user_clksys      : in  std_ulogic;  -- 100 MHz main clock
    sysace_fpga_clk  : in  std_ulogic;  -- 33 MHz

    -- Flash
    flash_we_b       : out std_ulogic;
    flash_wait       : in  std_ulogic;
    flash_reset_b    : out std_ulogic;
    flash_oe_b       : out std_ulogic;
    flash_d          : inout std_logic_vector(15 downto 0);
    flash_clk        : out std_ulogic;
    flash_ce_b       : out std_ulogic;
    flash_adv_b      : out std_logic;
    flash_a          : out std_logic_vector(21 downto 0);    
--pragma translate_off
    -- For debug output module 
    sram_bw          : out std_ulogic;
    sim_d            : inout std_logic_vector(31 downto 16);
    iosn             : out std_ulogic;
--pragma translate_on

    -- DDR2 slot 1
    dimm1_ddr2_we_b  : out std_ulogic;
    dimm1_ddr2_s_b   : out std_logic_vector(1 downto 0);
    dimm1_ddr2_ras_b : out std_ulogic;
    dimm1_ddr2_pll_clkin_p : out std_ulogic;
    dimm1_ddr2_pll_clkin_n : out std_ulogic;
    dimm1_ddr2_odt   : out std_logic_vector(1 downto 0);
    dimm1_ddr2_dqs_p : inout std_logic_vector(8 downto 0);
    dimm1_ddr2_dqs_n : inout std_logic_vector(8 downto 0);
    dimm1_ddr2_dqm   : out std_logic_vector(8 downto 0);
    dimm1_ddr2_dq    : inout std_logic_vector(71 downto 0);
    dimm1_ddr2_cke   : out std_logic_vector(1 downto 0);
--    dimm1_ddr2_cb    : inout std_logic_vector(7 downto 0);
    dimm1_ddr2_cas_b : out std_ulogic;
    dimm1_ddr2_ba    : out std_logic_vector(2 downto 0);
    dimm1_ddr2_a     : out std_logic_vector(13 downto 0);

    -- DDR2 slot 0
    dimm0_ddr2_we_b  : out std_ulogic;
    dimm0_ddr2_s_b   : out std_logic_vector(1 downto 0);
    dimm0_ddr2_ras_b : out std_ulogic;
    dimm0_ddr2_pll_clkin_p : out std_ulogic;
    dimm0_ddr2_pll_clkin_n : out std_ulogic;
    dimm0_ddr2_odt   : out std_logic_vector(1 downto 0);
    dimm0_ddr2_dqs_p : inout std_logic_vector(8 downto 0);
    dimm0_ddr2_dqs_n : inout std_logic_vector(8 downto 0);
    dimm0_ddr2_dqm   : out std_logic_vector(8 downto 0);
    dimm0_ddr2_dq    : inout std_logic_vector(71 downto 0);
    dimm0_ddr2_cke   : out std_logic_vector(1 downto 0);
--    dimm0_ddr2_cb    : inout std_logic_vector(7 downto 0);
    dimm0_ddr2_cas_b : out std_ulogic;
    dimm0_ddr2_ba    : out std_logic_vector(2 downto 0);
    dimm0_ddr2_a     : out std_logic_vector(13 downto 0);
    dimm0_ddr2_reset_n : out std_ulogic;

    -- Ethernet PHY0
    phy0_txer        : out std_ulogic;
    phy0_txd         : out std_logic_vector(3 downto 0);
    phy0_txctl_txen  : out std_ulogic;
    phy0_txclk       : in  std_ulogic;
    phy0_rxer        : in  std_ulogic;
    phy0_rxd         : in  std_logic_vector(3 downto 0);
    phy0_rxctl_rxdv  : in  std_ulogic;
    phy0_rxclk       : in  std_ulogic;
    phy0_reset       : out std_ulogic;
    phy0_mdio        : inout std_logic;
    phy0_mdc         : out std_ulogic;
--    phy0_int         : in  std_ulogic;

    -- Ethernet PHY1 SGMII
    sgmiiclk_qo_p    : in  std_logic;
    sgmiiclk_qo_n    : in  std_logic;
    phy1_reset       : out std_logic;
    phy1_mdio        : inout std_logic;
    phy1_mdc         : out std_logic;
    phy1_int         : out std_logic;
    phy1_sgmii_tx_p  : out std_logic;
    phy1_sgmii_tx_n  : out std_logic;
    phy1_sgmii_rx_p  : in  std_logic;
    phy1_sgmii_rx_n  : in  std_logic;

    -- System ACE MPU
    sysace_mpa       : out std_logic_vector(6 downto 0);
    sysace_mpce      : out std_ulogic;
    sysace_mpirq     : in  std_ulogic;
    sysace_mpoe      : out std_ulogic;
    sysace_mpwe      : out std_ulogic;
    sysace_mpd       : inout std_logic_vector(15 downto 0);

    -- GPIO/Green LEDs
    dbg_led          : inout std_logic_vector(3 downto 0);

    -- Red/Green LEDs
    opb_bus_error    : out std_ulogic;
    plb_bus_error    : out std_ulogic;

    -- LCD
--     fpga_lcd_rw      : out std_ulogic;
--     fpga_lcd_rs      : out std_ulogic;
--     fpga_lcd_e       : out std_ulogic;
--     fpga_lcd_db      : out std_logic_vector(7 downto 0);

    -- DVI
    dvi_xclk_p       : out std_ulogic;
    dvi_xclk_n       : out std_ulogic;
    dvi_v            : out std_ulogic;
    dvi_reset_b      : out std_ulogic;
    dvi_h            : out std_ulogic;
    dvi_gpio1        : inout std_logic;
    dvi_de           : out std_ulogic;
    dvi_d            : out std_logic_vector(11 downto 0);

    -- PCI
    pci_p_trdy_b     : inout std_logic;
    pci_p_stop_b     : inout std_logic;
    pci_p_serr_b     : inout std_logic;
    pci_p_rst_b      : inout std_logic;
    pci_p_req_b      : in  std_logic_vector(0 to 4);
    pci_p_perr_b     : inout std_logic;
    pci_p_par        : inout std_logic;
    pci_p_lock_b     : inout std_logic;
    pci_p_irdy_b     : inout std_logic;
    pci_p_intd_b     : in std_logic;
    pci_p_intc_b     : in std_logic;
    pci_p_intb_b     : in std_logic;
    pci_p_inta_b     : in std_logic;
    pci_p_gnt_b      : out std_logic_vector(0 to 4);
    pci_p_frame_b    : inout std_logic;
    pci_p_devsel_b   : inout std_logic;
    pci_p_clk5_r     : out std_ulogic;
    pci_p_clk5       : in  std_ulogic;
    pci_p_clk4_r     : out std_ulogic;
    pci_p_clk3_r     : out std_ulogic;
    pci_p_clk1_r     : out std_ulogic;
    pci_p_clk0_r     : out std_ulogic;
    pci_p_cbe_b      : inout std_logic_vector(3 downto 0);
    pci_p_ad         : inout std_logic_vector(31 downto 0);
--    pci_fpga_idsel   : in  std_ulogic;

    sbr_pwg_rsm_rstj : inout std_logic;
    sbr_nmi_r        : in  std_ulogic;
    sbr_intr_r       : in  std_ulogic;
    sbr_ide_rst_b    : inout std_logic;
    
    -- IIC/SMBus and sideband signals
    iic_sda_dvi      : inout std_logic;
    iic_scl_dvi      : inout std_logic;
    fpga_sda         : inout std_logic;
    fpga_scl         : inout std_logic;
    iic_therm_b      : in  std_ulogic;
    iic_reset_b      : out std_ulogic;
    iic_irq_b        : in  std_ulogic;
    iic_alert_b      : in  std_ulogic;

    -- SPI
    spi_data_out     : in  std_logic;
    spi_data_in      : out std_ulogic;
    spi_data_cs_b    : out std_ulogic;
    spi_clk          : out std_ulogic;
    
    -- UARTs
    uart1_txd        : out std_ulogic;
    uart1_rxd        : in  std_ulogic;
    uart1_rts_b      : out std_ulogic;
    uart1_cts_b      : in  std_ulogic;
    uart0_txd        : out std_ulogic;
    uart0_rxd        : in  std_ulogic;
    uart0_rts_b      : out std_ulogic
--    uart0_cts_b      : in  std_ulogic

    -- System monitor
--    test_mon_vrefp   : in std_ulogic;
--    test_mon_vp0_p   : in std_ulogic;
--    test_mon_vn0_n   : in std_ulogic
--    test_mon_avdd    : in std_ulogic    
    );
end;

architecture rtl of leon3mp is

component svga2ch7301c
  generic (
    tech    : integer := 0;
    idf     : integer := 0;
    dynamic : integer := 0
    );
  port (
    clk         : in  std_ulogic;
    rstn        : in  std_ulogic;
    clksel      : in  std_logic_vector(1 downto 0);
    vgao        : in  apbvga_out_type;
    vgaclk_fb   : in  std_ulogic;
    clk25_fb    : in  std_ulogic;
    clk40_fb    : in  std_ulogic;
    clk65_fb    : in  std_ulogic;
    vgaclk      : out std_ulogic;
    clk25       : out std_ulogic;
    clk40       : out std_ulogic;
    clk65       : out std_ulogic;
    dclk_p      : out std_ulogic;
    dclk_n      : out std_ulogic;
    locked      : out std_ulogic;
    data        : out std_logic_vector(11 downto 0);
    hsync       : out std_ulogic;
    vsync       : out std_ulogic;
    de          : out std_ulogic
    );
end component;

component BUFG port (O : out std_logic; I : in std_logic); end component;

component IBUFDS
  generic ( CAPACITANCE : string := "DONT_CARE";
    DIFF_TERM : boolean := FALSE; IBUF_DELAY_VALUE : string := "0";
    IFD_DELAY_VALUE : string := "AUTO"; IOSTANDARD : string := "DEFAULT");
  port ( O : out std_ulogic; I : in std_ulogic; IB : in std_ulogic);
end component;

constant blength : integer := 12;
constant fifodepth : integer := 8;
constant maxahbm : integer := NCPU+CFG_AHB_UART+CFG_AHB_JTAG+
                              CFG_SVGA_ENABLE+CFG_GRETH+CFG_GRETH2+CFG_GRPCI2_TARGET+CFG_GRPCI2_DMA;
               
signal ddr0_clk_fb, ddr1_clk_fb  : std_logic;
signal vcc, gnd   : std_logic_vector(31 downto 0);
signal memi  : memory_in_type;
signal memo  : memory_out_type;
signal wpo   : wprot_out_type;

signal apbi, apb1i  : apb_slv_in_type;
signal apbo, apb1o  : apb_slv_out_vector := (others => apb_none);
signal ahbsi : ahb_slv_in_type;
signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
signal ahbmi : ahb_mst_in_type;
signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);
signal ddr2spa_ahbsi : ahb_slv_in_type;
signal ddr2spa_ahbso : ahb_slv_out_vector_type(1 downto 0);

signal clkm, clkm2x, rstn, rstraw, flashclkl : std_ulogic;
signal clkddr, clk_200 : std_ulogic;
signal clk25, clk40, clk65 : std_ulogic;

signal cgi, cgi2, cgi3 : clkgen_in_type;
signal cgo, cgo2, cgo3 : clkgen_out_type;

signal u1i, dui : uart_in_type;
signal u1o, duo : uart_out_type;

signal irqi : irq_in_vector(0 to NCPU-1);
signal irqo : irq_out_vector(0 to NCPU-1);

signal sysi : leon_dsu_stat_base_in_type;
signal syso : leon_dsu_stat_base_out_type;

signal perf : l3stat_in_type;

signal ethi, ethi1, ethi2 : eth_in_type;
signal etho, etho1, etho2 : eth_out_type;

signal gpti : gptimer_in_type;

signal gpioi : gpio_in_type;
signal gpioo : gpio_out_type;

signal clklock, lock0, lock1, lclk, clkml0, clkml1 : std_ulogic;
signal tck, tckn, tms, tdi, tdo : std_ulogic;
signal rst : std_ulogic;

signal egtx_clk_fb : std_ulogic;
signal egtx_clk, legtx_clk, l2egtx_clk : std_ulogic;

signal sgmii_refclk, sgmii_rst: std_logic;
signal mdio_reset, mdio_o, mdio_oe, mdio_i, mdc, mdint : std_logic;

signal vgao  : apbvga_out_type;
signal lcd_datal : std_logic_vector(11 downto 0);
signal lcd_hsyncl, lcd_vsyncl, lcd_del, lcd_reset_bl : std_ulogic;
signal clk_sel : std_logic_vector(1 downto 0);
signal vgalock : std_ulogic;
signal clkvga, clkvga_p, clkvga_n : std_ulogic;

signal i2ci, dvi_i2ci : i2c_in_type;
signal i2co, dvi_i2co : i2c_out_type;

signal spii : spi_in_type;
signal spio : spi_out_type;
signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

constant BOARD_FREQ_200 : integer := 200000;   -- input frequency in KHz
constant BOARD_FREQ : integer := 100000;   -- input frequency in KHz
constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
constant I2C_FILTER : integer := (CPU_FREQ*5+50000)/100000+1;

-- DDR clock is 200 MHz clock unless CFG_DDR2SP_NOSYNC is set. If that config
-- option is set the DDR clock is 2x CPU clock.
constant DDR_FREQ : integer :=
  BOARD_FREQ_200 - (BOARD_FREQ_200 - 2*CPU_FREQ)*CFG_DDR2SP_NOSYNC;

constant IOAEN : integer := CFG_DDR2SP+CFG_GRACECTRL;

signal stati : ahbstat_in_type;

signal ddr0_clkv        : std_logic_vector(2 downto 0);
signal ddr0_clkbv       : std_logic_vector(2 downto 0);
signal ddr1_clkv        : std_logic_vector(2 downto 0);
signal ddr1_clkbv       : std_logic_vector(2 downto 0);

signal clkace : std_ulogic;
signal acei   : gracectrl_in_type;
signal aceo   : gracectrl_out_type;

signal sysmoni : grsysmon_in_type;
signal sysmono : grsysmon_out_type;

signal pciclk, pci_clk, pci_clk_fb : std_ulogic;
signal pci_arb_gnt : std_logic_vector(0 to 7);
signal pci_arb_req : std_logic_vector(0 to 7);
signal pci_arb_reql : std_logic_vector(0 to 4);
signal pci_reql : std_ulogic;
signal pci_host, pci_66 : std_ulogic;
signal pci_intv : std_logic_vector(3 downto 0);
signal pcii : pci_in_type;
signal pcio : pci_out_type;
signal pci_dirq : std_logic_vector(3 downto 0);
signal clkma, clkmb, clkmc : std_ulogic;

signal clk0_tb, rst0_tb, rst0_tbn : std_ulogic;
signal phy_init_done : std_ulogic;


attribute syn_keep : boolean;
attribute syn_preserve : boolean;
attribute syn_keep of clkml0 : signal is true;
attribute syn_preserve of clkml0 : signal is true;
attribute syn_keep of clkml1 : signal is true;
attribute syn_preserve of clkml1 : signal is true;
attribute syn_keep of clkm : signal is true;
attribute syn_preserve of clkm : signal is true;
attribute syn_keep of egtx_clk : signal is true;
attribute syn_preserve of egtx_clk : signal is true;
attribute syn_keep of clkvga : signal is true;
attribute syn_preserve of clkvga : signal is true;
attribute syn_keep of clk25 : signal is true;
attribute syn_preserve of clk25 : signal is true;
attribute syn_keep of clk40 : signal is true;
attribute syn_preserve of clk40 : signal is true;
attribute syn_keep of clk65 : signal is true;
attribute syn_preserve of clk65 : signal is true;
attribute syn_keep of phy_init_done : signal is true;
attribute syn_preserve of phy_init_done : signal is true;
attribute syn_keep of pciclk : signal is true;
attribute syn_preserve of pciclk : signal is true;
attribute syn_keep of sgmii_refclk : signal is true;
attribute syn_preserve of sgmii_refclk : signal is true;

attribute keep : boolean;
attribute keep of lock0 : signal is true;
attribute keep of lock1 : signal is true;
attribute keep of clkml0 : signal is true;
attribute keep of clkml1 : signal is true;
attribute keep of clkm : signal is true;
attribute keep of egtx_clk : signal is true;
attribute keep of clkvga : signal is true;
attribute keep of clk25 : signal is true;
attribute keep of clk40 : signal is true;
attribute keep of clk65 : signal is true;
attribute keep of pciclk : signal is true;
attribute keep of sgmii_refclk : signal is true;

attribute syn_noprune : boolean;
attribute syn_noprune of sysace_fpga_clk_pad : label is true;
               
begin

  vcc <= (others => '1'); gnd <= (others => '0');
  rst0_tbn <= not rst0_tb; 
----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------
  
  flashclk_pad : outpad generic map (tech => padtech, slew => 1, strength => 24) 
    port map (flash_clk, flashclkl);

  sysace_fpga_clk_pad : clkpad generic map (tech => padtech, level => cmos, voltage => x25v) 
    port map (sysace_fpga_clk, clkace);

  pci_p_clk5_pad : clkpad generic map (tech => padtech, level => cmos, voltage => x25v)
    port map (pci_p_clk5, pci_clk_fb);
  pci_p_clk5_r_pad : outpad generic map (tech => padtech, level => pci33)
    port map (pci_p_clk5_r, pci_clk);
  pci_p_clk4_r_pad : outpad generic map (tech => padtech, level => pci33)
    port map (pci_p_clk4_r, pci_clk);
  pci_p_clk3_r_pad : outpad generic map (tech => padtech, level => pci33)
    port map (pci_p_clk3_r, pci_clk);
  pci_p_clk1_r_pad : outpad generic map (tech => padtech, level => pci33)
    port map (pci_p_clk1_r, pci_clk);
  pci_p_clk0_r_pad : outpad generic map (tech => padtech, level => pci33)
    port map (pci_p_clk0_r, pci_clk);
  
  clkgen0 : clkgen              -- system clock generator
    generic map (CFG_FABTECH, CFG_CLKMUL, CFG_CLKDIV, 1, 1,
                 1, CFG_PCIDLL, CFG_PCISYSCLK, BOARD_FREQ, 1)
    port map (lclk, pci_clk_fb, clkmc, open, clkm2x, flashclkl, pciclk, cgi, cgo,
              open, open, clk_200);
  cgi.pllctrl <= "00"; cgi.pllrst <= rstraw; cgi.pllref <= '0';

--   clkgen1 : clkgen           -- Ethernet 1G PHY clock generator
--     generic map (CFG_FABTECH, 5, 4, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
--     port map (lclk, gnd(0), egtx_clk, open, open, open, open, cgi2, cgo2);
--   cgi2.pllctrl <= "00"; cgi2.pllrst <= rstraw; --cgi2.pllref <= egtx_clk_fb;
--   egtx_clk_pad : outpad generic map (tech => padtech)
--       port map (phy_gtx_clk, egtx_clk);

  clkgen2 : clkgen              -- PCI clock generator
    generic map (CFG_FABTECH, 2, 6, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
    port map (lclk, gnd(0), pci_clk, open, open, open, open, cgi3, cgo3);
  cgi3.pllctrl <= "00"; cgi3.pllrst <= rstraw;  cgi3.pllref <= '0';

  iic_reset_b_pad : outpad generic map (tech => padtech)
    port map (iic_reset_b, rstn);
  
  resetn_pad : inpad generic map (tech => padtech, level => cmos, voltage => x25v)
    port map (fpga_cpu_reset_b, rst); 
  rst0 : rstgen                 -- reset generator
    port map (rst, clkm, clklock, rstn, rstraw);
  clklock <= lock0 and lock1 and cgo.clklock and cgo3.clklock;

  clk_pad : clkpad generic map (tech => padtech, arch => 2, level => cmos, voltage => x25v) 
    port map (user_clksys, lclk);
  
  
----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl                -- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
        rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, devid => XILINX_ML510,
        ioen => IOAEN, nahbm => maxahbm, nahbs => 11)
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON processor and DSU -----------------------------------------
----------------------------------------------------------------------

  leon : leon_dsu_stat_base
    generic map (
      leon => CFG_LEON, ncpu => ncpu, fabtech => fabtech, memtech => memtech,
      nwindows => CFG_NWIN, dsu => CFG_DSU, fpu => CFG_FPU, v8 => CFG_V8, cp => 0,
      mac => CFG_MAC, pclow => pclow, notag => 0, nwp => CFG_NWP, icen => CFG_ICEN,
      irepl => CFG_IREPL, isets => CFG_ISETS, ilinesize => CFG_ILINE,
      isetsize => CFG_ISETSZ, isetlock => CFG_ILOCK, dcen => CFG_DCEN,
      drepl => CFG_DREPL, dsets => CFG_DSETS, dlinesize => CFG_DLINE,
      dsetsize => CFG_DSETSZ, dsetlock => CFG_DLOCK, dsnoop => CFG_DSNOOP,
      ilram => CFG_ILRAMEN, ilramsize => CFG_ILRAMSZ, ilramstart => CFG_ILRAMADDR,
      dlram => CFG_DLRAMEN, dlramsize => CFG_DLRAMSZ, dlramstart => CFG_DLRAMADDR,
      mmuen => CFG_MMUEN, itlbnum => CFG_ITLBNUM, dtlbnum => CFG_DTLBNUM,
      tlb_type => CFG_TLB_TYPE, tlb_rep => CFG_TLB_REP, lddel => CFG_LDDEL,
      disas => disas, tbuf => CFG_ITBSZ, pwd => CFG_PWD, svt => CFG_SVT,
      rstaddr => CFG_RSTADDR, smp => ncpu-1, cached => CFG_DFIXED,
      wbmask => CFG_BWMASK, busw => CFG_CACHEBW, netlist => CFG_LEON_NETLIST,
      ft => CFG_LEONFT_EN, npasi => CFG_NP_ASI, pwrpsr => CFG_WRPSR,
      rex => CFG_REX, altwin => CFG_ALTWIN, mmupgsz => CFG_MMU_PAGE,
      grfpush => CFG_GRFPUSH,
      dsu_hindex => 2, dsu_haddr => 16#D00#, dsu_hmask => 16#F00#, atbsz => CFG_ATBSZ,
      stat => CFG_STAT_ENABLE, stat_pindex => 12, stat_paddr => 16#100#,
      stat_pmask => 16#ffc#, stat_ncnt => CFG_STAT_CNT, stat_nmax => CFG_STAT_NMAX)
    port map (
      rstn => rstn, ahbclk => clkm, cpuclk => clkm, hclken => vcc(0),
      leon_ahbmi => ahbmi, leon_ahbmo => ahbmo(CFG_NCPU-1 downto 0),
      leon_ahbsi => ahbsi, leon_ahbso => ahbso,
      irqi => irqi, irqo => irqo,
      stat_apbi => apbi, stat_apbo => apbo(12), stat_ahbsi => ahbsi,
      stati => perf,
      dsu_ahbsi => ahbsi, dsu_ahbso => ahbso(2),
      dsu_tahbmi => ahbmi, dsu_tahbsi => ahbsi,
      sysi => sysi, syso => syso);

  sysi.dsu_enable <= '1';
  sysi.dsu_break <= not gpioo.val(0); -- Position on GPIO DIP switch
  
  opb_bus_error_pad : outpad generic map (tech => padtech)
    port map (opb_bus_error, syso.proc_errorn);
  plb_bus_error_pad : outpad generic map (tech => padtech)
    port map (plb_bus_error, syso.dsu_active);
    
  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0: ahbuart              -- Debug UART
      generic map (hindex => NCPU, pindex => 7, paddr => 7)
      port map (rstn, clkm, dui, duo, apbi, apbo(7), ahbmi, ahbmo(NCPU));
  end generate;

  nodcom : if CFG_AHB_UART = 0 generate
    duo.txd <= '0'; duo.rtsn <= '1';
  end generate;
  
  dsurx_pad : inpad generic map (tech => padtech, level => cmos, voltage => x33v)
    port map (uart0_rxd, dui.rxd); 
  dsutx_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v)
    port map (uart0_txd, duo.txd);
--  dsucts_pad : inpad generic map (tech => padtech, level => cmos, voltage => x33v)
--    port map (uart0_cts_b, dui.ctsn);
  dsurts_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v)
    port map (uart0_rts_b, duo.rtsn);

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd(0));
  end generate;
  
----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  memi.writen <= '1'; memi.wrn <= "1111"; memi.bwidth <= "01";
  memi.brdyn <= '1'; memi.bexcn <= '1';

  mctrl0 : if CFG_MCTRL_LEON2 = 1 generate
    mctrl0 : mctrl generic map (hindex => 3, pindex => 0,
        ramaddr => 0, rammask => 0, paddr => 0, srbanks => 0,
        ram8 => CFG_MCTRL_RAM8BIT,  ram16 => CFG_MCTRL_RAM16BIT,
        sden => CFG_MCTRL_SDEN, invclk => CFG_MCTRL_INVCLK,
        sepbus => CFG_MCTRL_SEPBUS)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(3), apbi, apbo(0), wpo);
  end generate;
  ftmctrl0 : if CFG_MCTRLFT = 1 generate     -- FT memory controller
    sr1 : ftmctrl generic map (hindex => 3, pindex => 0, 
        ramaddr => 0, rammask => 0, paddr => 0, srbanks => 0, sden => CFG_MCTRLFT_SDEN,
        ram8 => CFG_MCTRLFT_RAM8BIT, ram16 => CFG_MCTRLFT_RAM16BIT,
        invclk => CFG_MCTRLFT_INVCLK, 
        sepbus => CFG_MCTRLFT_SEPBUS,
        edac => CFG_MCTRLFT_EDAC)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(3), apbi, apbo(0), wpo);
  end generate;

  nomctrl: if (CFG_MCTRL_LEON2 + CFG_MCTRLFT) = 0 generate
    memo.address <= (others => '0'); memo.romsn <= (others => '1');
    memo.oen <= '1'; memo.wrn <= (others => '1');
    memo.vbdrive <= (others => '1'); memo.writen <= '1'; 
  end generate;
  
  flash_reset_b_pad  : outpad generic map (tech => padtech) 
    port map (flash_reset_b, rstn);
--   flash_wait_pad : inpad generic map (tech => padtech)
--     port map (flash_wait, );
  flash_adv_b_pad : outpad generic map (tech => padtech) 
        port map (flash_adv_b, gnd(0)); 
  flash_a_pads : outpadv generic map (width => 22, tech => padtech) 
        port map (flash_a, memo.address(22 downto 1)); 
  flash_ce_b_pad : outpad generic map (tech => padtech) 
        port map (flash_ce_b, memo.romsn(0)); 
  flash_oe_b_pad  : outpad generic map (tech => padtech) 
        port map (flash_oe_b, memo.oen);
--pragma translate_off
  rwen_pad : outpad generic map (tech => padtech) 
        port map (sram_bw, memo.wrn(3)); 
  sim_d_pads : iopadvv generic map (tech => padtech, width => 16)
    port map (sim_d, memo.data(15 downto 0), 
                memo.vbdrive(15 downto 0), memi.data(15 downto 0));
  iosn_pad  : outpad generic map (tech => padtech) 
        port map (iosn, memo.iosn);
--pragma translate_on
  flash_we_b_pad  : outpad generic map (tech => padtech) 
        port map (flash_we_b, memo.writen);
  flash_d_pads : iopadvv generic map (tech => padtech, width => 16)
      port map (flash_d, memo.data(31 downto 16), 
                memo.vbdrive(31 downto 16), memi.data(31 downto 16));
      
  dbg_led0_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v)
    port map (dbg_led(3), phy_init_done);

  clkm <= clkma; clkma <= clkmb; clkmb <= clkmc;

  -----------------------------------------------------------------------------
  -- L2 cache, optionally covering DDR2 SDRAM memory controller
  -----------------------------------------------------------------------------
  l2cen : if CFG_L2_EN /= 0 generate
    l2cblock : block
      signal mem_ahbsi : ahb_slv_in_type;
      signal mem_ahbso : ahb_slv_out_vector := (others => ahbs_none);
      signal mem_ahbmi : ahb_mst_in_type;
      signal mem_ahbmo : ahb_mst_out_vector := (others => ahbm_none);
      signal l2c_stato : std_logic_vector(10 downto 0);
    begin
      l2c0 : l2c generic map (
        hslvidx => 0, hmstidx => 0, cen => CFG_L2_PEN, 
        haddr => 16#400#, hmask => 16#c00#, ioaddr => 16#FF0#, 
        cached => CFG_L2_MAP, repl => CFG_L2_RAN, ways => CFG_L2_WAYS, 
        linesize => CFG_L2_LSZ, waysize => CFG_L2_SIZE,
        memtech => memtech, bbuswidth => AHBDW,
        bioaddr => 16#FFE#, biomask => 16#fff#, 
        sbus => 0, mbus => 1, arch => CFG_L2_SHARE,
        ft => CFG_L2_EDAC)
        port map(rst => rstn, clk => clkm, ahbsi => ahbsi, ahbso => ahbso(0),
                 ahbmi => mem_ahbmi, ahbmo => mem_ahbmo(0), ahbsov => mem_ahbso,
                 sto => l2c_stato);

      memahb0 : ahbctrl                -- AHB arbiter/multiplexer
        generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
                     rrobin => CFG_RROBIN, ioaddr => 16#FFE#,
                     ioen => 1, nahbm => 1, nahbs => 2)
        port map (rstn, clkm, mem_ahbmi, mem_ahbmo, mem_ahbsi, mem_ahbso);

      mem_ahbso(1 downto 0) <= ddr2spa_ahbso;
      ddr2spa_ahbsi <= mem_ahbsi;

      perf.event(15 downto 7) <= (others => '0');
      perf.esource(15 downto 7) <= (others => (others => '0'));
      perf.event(6)  <= l2c_stato(10);  -- Data uncorrectable error
      perf.event(5)  <= l2c_stato(9);   -- Data correctable error
      perf.event(4)  <= l2c_stato(8);   -- Tag uncorrectable error
      perf.event(3)  <= l2c_stato(7);   -- Tag correctable error
      perf.event(2)  <= l2c_stato(2);   -- Bus access
      perf.event(1)  <= l2c_stato(1);   -- Miss
      perf.event(0)  <= l2c_stato(0);   -- Hit
      perf.esource(6 downto 3) <= (others => (others => '0'));
      perf.esource(2 downto 0) <= (others => l2c_stato(6 downto 3));
      perf.req <= (others => '0');
      perf.sel <= (others => '0');
      perf.latcnt <= '0';
      --perf.timer  <= dbgi(0).timer(31 downto 0);
    end block l2cblock;
  end generate l2cen;
  nol2c : if CFG_L2_EN = 0 generate
    ahbso(1 downto 0) <= ddr2spa_ahbso;
    ddr2spa_ahbsi <= ahbsi;
    perf <= l3stat_in_none;
  end generate;
  
  -----------------------------------------------------------------------------
  -- DDR2 SDRAM memory controller
  -----------------------------------------------------------------------------
  ddrsp0 : if (CFG_DDR2SP /= 0) generate

    phy_init_done <= '1';
    -- DDR clock selection
    -- If the synchronization registers are removed in the DDR controller, we
    -- assume that the user wants to run at 2x the system clock. Otherwise the
    -- DDR clock is generated from the 200 MHz clock.
    ddrclkselarb: if CFG_DDR2SP_NOSYNC = 0 generate
      BUFGDDR : BUFG port map (I => clk_200, O => clkddr);
    end generate;
    ddrclksel2x: if CFG_DDR2SP_NOSYNC /= 0 generate
      clkddr <= clkm2x;
    end generate;
    dimm0_ddr2_reset_n_pad : outpad generic map (tech => padtech, level => cmos, voltage => x33v)
      port map (dimm0_ddr2_reset_n, rst);
    -- Slot 0
    ddrc0 : ddr2spa generic map ( fabtech => fabtech, memtech => memtech, 
      hindex => 0, haddr => 16#400#, hmask => 16#e00#, ioaddr => 1, 
      pwron => CFG_DDR2SP_INIT, MHz => DDR_FREQ/1000, TRFC => CFG_DDR2SP_TRFC, 
      clkmul => CFG_DDR2SP_FREQ/10 - (CFG_DDR2SP_FREQ/10-1)*CFG_DDR2SP_NOSYNC,
      clkdiv => 20 - (19)*CFG_DDR2SP_NOSYNC, ahbfreq => CPU_FREQ/1000,
      col => CFG_DDR2SP_COL, Mbyte => CFG_DDR2SP_SIZE, ddrbits => CFG_DDR2SP_DATAWIDTH,
      ddelayb0 => CFG_DDR2SP_DELAY0, ddelayb1 => CFG_DDR2SP_DELAY1, 
      ddelayb2 => CFG_DDR2SP_DELAY2, ddelayb3 => CFG_DDR2SP_DELAY3, 
      ddelayb4 => CFG_DDR2SP_DELAY4, ddelayb5 => CFG_DDR2SP_DELAY5,
      ddelayb6 => CFG_DDR2SP_DELAY6, ddelayb7 => CFG_DDR2SP_DELAY7,
      cbdelayb0 => CFG_DDR2SP_DELAY0, cbdelayb1 => CFG_DDR2SP_DELAY0,
      cbdelayb2 => CFG_DDR2SP_DELAY0, cbdelayb3 => CFG_DDR2SP_DELAY0,
      readdly => 1, rskew => 0, oepol => 0,
      dqsgating => 0, rstdel  => 200, eightbanks => 1,
      numidelctrl => 2 + CFG_DDR2SP_DATAWIDTH/64, norefclk => 0, odten => 3,
      nosync => CFG_DDR2SP_NOSYNC, ft => CFG_DDR2SP_FTEN, ftbits => CFG_DDR2SP_FTWIDTH)
    port map (rst, rstn, clkddr, clkm, clk_200, lock0, clkml0, clkml0,
              ddr2spa_ahbsi, ddr2spa_ahbso(0),
              ddr0_clkv, ddr0_clkbv, ddr0_clk_fb, ddr0_clk_fb,
              dimm0_ddr2_cke,  dimm0_ddr2_s_b, dimm0_ddr2_we_b, dimm0_ddr2_ras_b, 
              dimm0_ddr2_cas_b, dimm0_ddr2_dqm(CFG_DDR2SP_FTWIDTH/8+CFG_DDR2SP_DATAWIDTH/8-1 downto 0),
              dimm0_ddr2_dqs_p(CFG_DDR2SP_FTWIDTH/8+CFG_DDR2SP_DATAWIDTH/8-1 downto 0),
              dimm0_ddr2_dqs_n(CFG_DDR2SP_FTWIDTH/8+CFG_DDR2SP_DATAWIDTH/8-1 downto 0), dimm0_ddr2_a,
              dimm0_ddr2_ba(2 downto 0), dimm0_ddr2_dq(CFG_DDR2SP_FTWIDTH+CFG_DDR2SP_DATAWIDTH-1 downto 0),
              dimm0_ddr2_odt);
    dimm0_ddr2_pll_clkin_p <= ddr0_clkv(0);
    dimm0_ddr2_pll_clkin_n <= ddr0_clkbv(0);
    -- Ground unused bank address and memory mask
--    dimm0_ddr2_ba_notused_pad : outpad generic map (tech => padtech, level => SSTL18_I)
--      port map (dimm0_ddr2_ba(2), gnd(0));
    dimm0_ddr2_dqm_notused8_pad : outpad generic map (tech => padtech, level => SSTL18_I)
      port map (dimm0_ddr2_dqm(8), gnd(0));
    -- Tri-state unused data strobe
    dimm0_dqsp_notused8_pad : iopad generic map (tech => padtech, level => SSTL18_II)
      port map (dimm0_ddr2_dqs_p(8), gnd(0), vcc(0), open);
    dimm0_dqsn_notused8_pad : iopad generic map (tech => padtech, level => SSTL18_II)
      port map (dimm0_ddr2_dqs_n(8), gnd(0), vcc(0), open);
    -- Tristate unused check bits
    dimm0_cb_notused_pad : iopadv generic map (tech => padtech, width => 8, level => SSTL18_II)
      port map (dimm0_ddr2_dq(71 downto 64), gnd(7 downto 0), vcc(0), open);
    -- Handle signals not used with 32-bit interface
    ddr032bit: if CFG_DDR2SP_DATAWIDTH /= 64 generate
      dimm0_ddr2_dqm_notused30_pads : outpadv generic map (tech => padtech, width => 4, level => SSTL18_I)
        port map (dimm0_ddr2_dqm(3 downto 0), gnd(3 downto 0));
      dimm0_dqsp_notused30_pads : iopadv generic map (tech => padtech, width => 4, level => SSTL18_II)
        port map (dimm0_ddr2_dqs_p(3 downto 0), gnd(3 downto 0), vcc(0), open);
      dimm0_dqsn_notused30_pads : iopadv generic map (tech => padtech, width => 4, level => SSTL18_II)
        port map (dimm0_ddr2_dqs_n(3 downto 0), gnd(3 downto 0), vcc(0), open);
      dimm0_dq_notused_pads : iopadv generic map (tech => padtech, width => 32, level => SSTL18_II)
        port map (dimm0_ddr2_dq(31 downto 0), gnd, vcc(0), open);
    end generate;
    
    -- Slot 1
    ddrc1 : ddr2spa generic map ( fabtech => fabtech, memtech => memtech, 
      hindex => 1, haddr => 16#600#, hmask => 16#E00#, ioaddr => 2, 
      pwron => CFG_DDR2SP_INIT, MHz => DDR_FREQ/1000, TRFC => CFG_DDR2SP_TRFC, 
      clkmul => CFG_DDR2SP_FREQ/10 - (CFG_DDR2SP_FREQ/10-1)*CFG_DDR2SP_NOSYNC,
      clkdiv => 20 - (19)*CFG_DDR2SP_NOSYNC, ahbfreq => CPU_FREQ/1000,
      col => CFG_DDR2SP_COL, Mbyte => CFG_DDR2SP_SIZE, ddrbits => CFG_DDR2SP_DATAWIDTH,
      ddelayb0 => CFG_DDR2SP_DELAY0, ddelayb1 => CFG_DDR2SP_DELAY1, 
      ddelayb2 => CFG_DDR2SP_DELAY2, ddelayb3 => CFG_DDR2SP_DELAY3, 
      ddelayb4 => CFG_DDR2SP_DELAY4, ddelayb5 => CFG_DDR2SP_DELAY5,
      ddelayb6 => CFG_DDR2SP_DELAY6, ddelayb7 => CFG_DDR2SP_DELAY7,
      readdly => 1, rskew => 0, oepol => 0,
      dqsgating => 0, rstdel  => 200, eightbanks => 1,
      numidelctrl => 2 + CFG_DDR2SP_DATAWIDTH/64, norefclk => 0, odten => 3,
      nosync => CFG_DDR2SP_NOSYNC)
    port map (rst, rstn, clkddr, clkm, clk_200, lock1, clkml1, clkml1,
              ddr2spa_ahbsi, ddr2spa_ahbso(1),
              ddr1_clkv, ddr1_clkbv, ddr1_clk_fb, ddr1_clk_fb,
              dimm1_ddr2_cke,  dimm1_ddr2_s_b, dimm1_ddr2_we_b, dimm1_ddr2_ras_b, 
              dimm1_ddr2_cas_b, dimm1_ddr2_dqm(7 downto 4*(32/CFG_DDR2SP_DATAWIDTH)),
              dimm1_ddr2_dqs_p(7 downto 4*(32/CFG_DDR2SP_DATAWIDTH)),
              dimm1_ddr2_dqs_n(7 downto 4*(32/CFG_DDR2SP_DATAWIDTH)), dimm1_ddr2_a,
              dimm1_ddr2_ba(2 downto 0), dimm1_ddr2_dq(63 downto 32*(32/ CFG_DDR2SP_DATAWIDTH)),
              dimm1_ddr2_odt);
    dimm1_ddr2_pll_clkin_p <= ddr1_clkv(0);
    dimm1_ddr2_pll_clkin_n <= ddr1_clkbv(0);
    -- Ground unused bank address and memory mask
--    dimm1_ddr2_ba_notused_pad : outpad generic map (tech => padtech, level => SSTL18_I)
--      port map (dimm1_ddr2_ba(2), gnd(0));
    dimm1_ddr2_dqm_notused8_pad : outpad generic map (tech => padtech, level => SSTL18_I)
      port map (dimm1_ddr2_dqm(8), gnd(0));
    -- Tri-state unused data strobe
    dimm1_dqsp_notused8_pad : iopad generic map (tech => padtech, level => SSTL18_II)
      port map (dimm1_ddr2_dqs_p(8), gnd(0), vcc(0), open);
    dimm1_dqsn_notused8_pad : iopad generic map (tech => padtech, level => SSTL18_II)
      port map (dimm1_ddr2_dqs_n(8), gnd(0), vcc(0), open);
    -- Tristate unused check bits
    dimm1_cb_notused_pad : iopadv generic map (tech => padtech, width => 8, level => SSTL18_II)
      port map (dimm1_ddr2_dq(71 downto 64), gnd(7 downto 0), vcc(0), open);
    -- Handle signals not used with 32-bit interface
    ddr132bit: if CFG_DDR2SP_DATAWIDTH /= 64 generate
      dimm1_ddr2_dqm_notused30_pads : outpadv generic map (tech => padtech, width => 4, level => SSTL18_I)
        port map (dimm1_ddr2_dqm(3 downto 0), gnd(3 downto 0));
      dimm1_dqsp_notused30_pads : iopadv generic map (tech => padtech, width => 4, level => SSTL18_II)
        port map (dimm1_ddr2_dqs_p(3 downto 0), gnd(3 downto 0), vcc(0), open);
      dimm1_dqsn_notused30_pads : iopadv generic map (tech => padtech, width => 4, level => SSTL18_II)
        port map (dimm1_ddr2_dqs_n(3 downto 0), gnd(3 downto 0), vcc(0), open);
      dimm1_dq_notused_pads : iopadv generic map (tech => padtech, width => 32, level => SSTL18_II)
        port map (dimm1_ddr2_dq(31 downto 0), gnd, vcc(0), open);
    end generate;
  end generate;

--  noddr :  if (CFG_DDR2SP = 0) generate lock0 <= '1'; lock1 <= '1'; end generate;
  
----------------------------------------------------------------------
---  System ACE I/F Controller ---------------------------------------
----------------------------------------------------------------------
  
  grace: if CFG_GRACECTRL = 1 generate
    grace0 : gracectrl generic map (hindex => 5, hirq => 5,
        haddr => 16#000#, hmask => 16#fff#, split => CFG_SPLIT)
      port map (rstn, clkm, clkace, ahbsi, ahbso(5), acei, aceo);
  end generate;

  nograce: if CFG_GRACECTRL = 0 generate
    aceo <= gracectrl_none;
  end generate nograce;
  
  sysace_mpa_pads : outpadv generic map (width => 7, tech => padtech) 
    port map (sysace_mpa, aceo.addr); 
  sysace_mpce_pad : outpad generic map (tech => padtech)
    port map (sysace_mpce, aceo.cen); 
  sysace_mpd_pads : iopadv generic map (tech => padtech, width => 16)
    port map (sysace_mpd, aceo.do, aceo.doen, acei.di); 
  sysace_mpoe_pad : outpad generic map (tech => padtech)
    port map (sysace_mpoe, aceo.oen);
  sysace_mpwe_pad : outpad generic map (tech => padtech)
    port map (sysace_mpwe, aceo.wen); 
  sysace_mpirq_pad : inpad generic map (tech => padtech)
    port map (sysace_mpirq, acei.irq); 
  
----------------------------------------------------------------------
---  AHB ROM ---------------------------------------------------------
----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 10, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map (rstn, clkm, ahbsi, ahbso(10));
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl                                -- AHB/APB bridge
    generic map (hindex => 4, haddr => CFG_APBADDR, nslaves => 16)
    port map (rstn, clkm, ahbsi, ahbso(4), apbi, apbo);

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
                   fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.extclk <= '0';
  end generate;

  noua1: if CFG_UART1_ENABLE = 0 generate u1o.txd <= '0'; u1o.rtsn <= '1'; end generate;

  ua1rx_pad : inpad generic map (tech => padtech) port map (uart1_rxd, u1i.rxd); 
  ua1tx_pad : outpad generic map (tech => padtech) port map (uart1_txd, u1o.txd);
  ua1cts_pad : inpad generic map (tech => padtech) port map (uart1_cts_b, u1i.ctsn);
  ua1rts_pad : outpad generic map (tech => padtech) port map (uart1_rts_b, u1o.rtsn);
  
  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp                    -- interrupt controller
    generic map (pindex => 2, paddr => 2, ncpu => NCPU)
    port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;
  pci_dirq(3 downto 1) <= (others => '0');
  pci_dirq(0) <= orv(irqi(0).irl);

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer                    -- timer unit
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ, 
        sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM, 
        nbits => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(syso.dsu_tstop);
  end generate;

  nogpt : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  svga : if CFG_SVGA_ENABLE /= 0 generate
    svga0 : svgactrl generic map(memtech => memtech, pindex => 14, paddr => 14,
        hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG, 
        clk0 => 40000, clk1 => 40000, clk2 => 25000, clk3 => 15385, burstlen => 6)
       port map(rstn, clkm, clkvga, apbi, apbo(14), vgao, ahbmi, 
                ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG), clk_sel);
    
    dvi0 : svga2ch7301c generic map (tech => fabtech, idf => 2)
      port map (lclk, rstraw, clk_sel, vgao, clkvga, clk25, clk40, clk65,
                clkvga, clk25, clk40, clk65, clkvga_p, clkvga_n, 
                vgalock, lcd_datal, lcd_hsyncl, lcd_vsyncl, lcd_del);
    
    i2cdvi : i2cmst
      generic map (pindex => 6, paddr => 6, pmask => 16#FFF#,
                   pirq => 6, filter => I2C_FILTER)
      port map (rstn, clkm, apbi, apbo(6), dvi_i2ci, dvi_i2co);
  end generate;

  novga : if CFG_SVGA_ENABLE = 0 generate 
     apbo(14) <= apb_none; apbo(6) <= apb_none;
     lcd_datal <= (others => '0'); clkvga_p <= '0'; clkvga_n <= '0';
     lcd_hsyncl <= '0'; lcd_vsyncl <= '0'; lcd_del <= '0';
     dvi_i2co.scloen <= '1'; dvi_i2co.sdaoen <= '1';
  end generate;

  dvi_d_pad : outpadv generic map (width => 12, tech => padtech)
    port map (dvi_d, lcd_datal);
  dvi_xclk_p_pad : outpad generic map (tech => padtech)
    port map (dvi_xclk_p, clkvga_p);
  dvi_xclk_n_pad : outpad generic map (tech => padtech)
    port map (dvi_xclk_n, clkvga_n);
  dvi_h_pad : outpad generic map (tech => padtech)
    port map (dvi_h, lcd_hsyncl);
  dvi_v_pad : outpad generic map (tech => padtech)
    port map (dvi_v, lcd_vsyncl);
  dvi_de_pad : outpad generic map (tech => padtech)
    port map (dvi_de, lcd_del);
  dvi_reset_b_pad : outpad generic map (tech => padtech)
    port map (dvi_reset_b, rstn);
  iic_scl_dvi_pad : iopad generic map (tech => padtech)
    port map (iic_scl_dvi, dvi_i2co.scl, dvi_i2co.scloen, dvi_i2ci.scl);
  iic_sda_dvi_pad : iopad generic map (tech => padtech)
    port map (iic_sda_dvi, dvi_i2co.sda, dvi_i2co.sdaoen, dvi_i2ci.sda);

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GPIO unit
    grgpio0: grgpio
    generic map(pindex => 8, paddr => 8, imask => CFG_GRGPIO_IMASK, nbits => CFG_GRGPIO_WIDTH)
      port map(rst => rstn, clk => clkm, apbi => apbi, apbo => apbo(8),
               gpioi => gpioi, gpioo => gpioo);
  end generate;

  nogpio0: if CFG_GRGPIO_ENABLE = 0 generate
    gpioo.oen <= (others => '1'); gpioo.val <= (others => '0');
    gpioo.dout <= (others => '1');
  end generate;

  dbg_led_0 : inpad generic map (tech => padtech)
    port map (dbg_led(0), gpioi.din(0));
  dbg_led_pads : iopadvv generic map (tech => padtech, width => 2,  level => cmos, voltage => x33v)
    port map (dbg_led(2 downto 1), gpioo.dout(2 downto 1), gpioo.oen(2 downto 1), 
                gpioi.din(2 downto 1));
  dvi_gpio_pad : iopad generic map (tech => padtech)
    port map (dvi_gpio1, gpioo.dout(4), gpioo.oen(4), gpioi.din(4));
  iic_therm_b_pad : inpad generic map (tech => padtech)
    port map (iic_therm_b, gpioi.din(9));
  iic_irq_b_pad : inpad generic map (tech => padtech)
    port map (iic_irq_b, gpioi.din(10));
  iic_alert_b_pad : inpad generic map (tech => padtech)
    port map (iic_alert_b, gpioi.din(11));
  sbr_pwg_rsm_rstj_pad : iopad generic map (tech => padtech, level => cmos, voltage => x25v)
    port map (sbr_pwg_rsm_rstj, gpioo.dout(7), gpioo.oen(7), gpioi.din(7));
  sbr_nmi_r_pad : inpad generic map (tech => padtech)
    port map (sbr_nmi_r, gpioi.din(6));
  sbr_intr_r_pad : inpad generic map (tech => padtech, level => cmos, voltage => x25v)
    port map (sbr_intr_r, gpioi.din(5));
  sbr_ide_rst_b_pad : iopad generic map (tech => padtech)
    port map (sbr_ide_rst_b, gpioo.dout(8), gpioo.oen(8), gpioi.din(8));

  i2cm: if CFG_I2C_ENABLE = 1 generate  -- I2C master
    i2c0 : i2cmst
      generic map (pindex => 9, paddr => 9, pmask => 16#FFF#,
                   pirq => 3, filter => I2C_FILTER)
      port map (rstn, clkm, apbi, apbo(9), i2ci, i2co);
  end generate;

  noi2cm: if CFG_I2C_ENABLE = 0 generate
    i2co.scloen <= '1'; i2co.sdaoen <= '1';
    i2co.scl <= '0'; i2co.sda <= '0';
  end generate;
  
  i2c_scl_pad : iopad generic map (tech => padtech)
    port map (fpga_scl, i2co.scl, i2co.scloen, i2ci.scl);
  i2c_sda_pad : iopad generic map (tech => padtech)
    port map (fpga_sda, i2co.sda, i2co.sdaoen, i2ci.sda);
  
  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
    spi1 : spictrl
      generic map (pindex => 10, paddr  => 10, pmask  => 16#fff#, pirq => 12,
                   fdepth => CFG_SPICTRL_FIFO, slvselen => CFG_SPICTRL_SLVREG,
                   slvselsz => CFG_SPICTRL_SLVS, odmode => 0, netlist => 0,
                   syncram => CFG_SPICTRL_SYNCRAM, ft => CFG_SPICTRL_FT)
      port map (rstn, clkm, apbi, apbo(10), spii, spio, slvsel);
    spii.spisel <= '1';                 -- Master only
    miso_pad : inpad generic map (tech => padtech)
      port map (spi_data_out, spii.miso);
    mosi_pad : outpad generic map (tech => padtech)
      port map (spi_data_in, spio.mosi);
    sck_pad  : outpad generic map (tech => padtech)
      port map (spi_clk, spio.sck);
    slvsel_pad : outpad generic map (tech => padtech)
      port map (spi_data_cs_b, slvsel(0));
  end generate spic;

  nospi: if CFG_SPICTRL_ENABLE = 0 generate
    miso_pad : inpad generic map (tech => padtech)
      port map (spi_data_out, spii.miso);
    mosi_pad : outpad generic map (tech => padtech)
      port map (spi_data_in, vcc(0));
    sck_pad  : outpad generic map (tech => padtech)
      port map (spi_clk, gnd(0));
    slvsel_pad : outpad generic map (tech => padtech)
      port map (spi_data_cs_b, vcc(0));
  end generate;
  
  ahbs : if CFG_AHBSTAT = 1 generate    -- AHB status register
    stati <= ahbstat_in_none;
    ahbstat0 : ahbstat generic map (pindex => 15, paddr => 15, pirq => 7,
                                    nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;

  apb1 : apbctrl                                -- AHB/APB bridge
    generic map (hindex => 6, haddr => CFG_APBADDR + 1, nslaves => 3)
    port map (rstn, clkm, ahbsi, ahbso(6), apb1i, apb1o);
  
-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

    eth1 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
      e1 : grethm generic map(hindex => NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE, 
        pindex => 11, paddr => 11, pirq => 4, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
        nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 7,
        ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G)
      port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE), 
        apbi => apbi, apbo => apbo(11), ethi => ethi, etho => etho); 

      emdio_pad : iopad generic map (tech => padtech) 
        port map (phy0_mdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
      etxc_pad : clkpad generic map (tech => padtech, arch => 2, level => cmos, voltage => x25v) 
        port map (phy0_txclk, ethi.tx_clk);
      erxc_pad : clkpad generic map (tech => padtech, arch => 2, level => cmos, voltage => x25v) 
        port map (phy0_rxclk, ethi.rx_clk);
      erxd_pad : inpadv generic map (tech => padtech, width => 4) 
        port map (phy0_rxd, ethi.rxd(3 downto 0));
      erxdv_pad : inpad generic map (tech => padtech) 
        port map (phy0_rxctl_rxdv, ethi.rx_dv);
      erxer_pad : inpad generic map (tech => padtech) 
        port map (phy0_rxer, ethi.rx_er);

      -- Collision detect and carrier sense are not connected on the
      -- board.
      ethi.rx_col <= '0';
      ethi.rx_crs <= ethi.rx_dv;
      
      etxd_pad : outpadv generic map (tech => padtech, width => 4) 
        port map (phy0_txd, etho.txd(3 downto 0));
      etxen_pad : outpad generic map (tech => padtech) 
        port map (phy0_txctl_txen, etho.tx_en);
      etxer_pad : outpad generic map (tech => padtech) 
        port map (phy0_txer, etho.tx_er);
      emdc_pad : outpad generic map (tech => padtech) 
        port map (phy0_mdc, etho.mdc);
      erst_pad : outpad generic map (tech => padtech) 
        port map (phy0_reset, rstn);
--      ethi.gtx_clk <= egtx_clk;
    end generate;
    
    eth2 : if CFG_GRETH2 = 1 generate -- Gaisler ethernet MAC

      sgmii_rst <= not rst;

      refclk_bufds : IBUFDS
        port map (
          I     =>  sgmiiclk_qo_p,
          IB    =>  sgmiiclk_qo_n,
          O     =>  sgmii_refclk);

      e2 : greths generic map(hindex => NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+CFG_GRETH, 
        pindex => 2, paddr => 2, pirq => 10,
        fabtech => fabtech, memtech => memtech, transtech => transtech,
        mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH2_FIFO,
        nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 7,
        ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH21G)
      port map(
        rst => rstn,
        clk => clkm,
        ahbmi => ahbmi,
        ahbmo => ahbmo(NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+CFG_GRETH), 
        apbi => apb1i,
        apbo => apb1o(2),
        -- High-speed Serial Interface
        clk_125   => sgmii_refclk,
        rst_125   => sgmii_rst,
        eth_rx_p  => phy1_sgmii_rx_p,
        eth_rx_n  => phy1_sgmii_rx_n,
        eth_tx_p  => phy1_sgmii_tx_p,
        eth_tx_n  => phy1_sgmii_tx_n,
        -- MDIO interface
        reset     => mdio_reset,
        mdio_o    => mdio_o,
        mdio_oe   => mdio_oe,
        mdio_i    => mdio_i,
        mdc       => mdc,
        mdint     => mdint,
        -- Control signals
        phyrstaddr  => "00000",
        edcladdr    => "0000",
        edclsepahb  => '0',
        edcldisable => '0'
        ); 

      e2mdio_pad : iopad generic map (tech => padtech) 
        port map (phy1_mdio, mdio_o, mdio_oe, mdio_i);
      e2mdc_pad : outpad generic map (tech => padtech) 
        port map (phy1_mdc, mdc);
      e2rst_pad : outpad generic map (tech => padtech) 
        port map (phy1_reset, mdio_reset);
      e2int_pad : outpad generic map (tech => padtech) 
        port map (phy1_int, mdint);

    end generate;
-----------------------------------------------------------------------
---  PCI   ------------------------------------------------------------
----------------------------------------------------------------------

  pp : if (CFG_GRPCI2_MASTER+CFG_GRPCI2_TARGET) /= 0 generate
    pci0 : grpci2 
    generic map (
      memtech => memtech,
      oepol => 0,
      hmindex => NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+CFG_GRETH+CFG_GRETH2,
      hdmindex => NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+CFG_GRETH+CFG_GRETH2+1,
      hsindex => 7,
      haddr => 16#800#,
      hmask => 16#c00#,
      ioaddr => 16#400#,
      pindex => 4,
      paddr => 4,
      irq => 5,
      irqmode => 0,
      master => CFG_GRPCI2_MASTER,
      target => CFG_GRPCI2_TARGET,
      dma => CFG_GRPCI2_DMA,
      tracebuffer => CFG_GRPCI2_TRACE,
      vendorid => CFG_GRPCI2_VID,
      deviceid => CFG_GRPCI2_DID,
      classcode => CFG_GRPCI2_CLASS,
      revisionid => CFG_GRPCI2_RID,
      cap_pointer => CFG_GRPCI2_CAP,
      ext_cap_pointer => CFG_GRPCI2_NCAP,
      iobase => CFG_AHBIO,
      extcfg => CFG_GRPCI2_EXTCFG,
      bar0 => CFG_GRPCI2_BAR0,
      bar1 => CFG_GRPCI2_BAR1,
      bar2 => CFG_GRPCI2_BAR2,
      bar3 => CFG_GRPCI2_BAR3,
      bar4 => CFG_GRPCI2_BAR4,
      bar5 => CFG_GRPCI2_BAR5,
      fifo_depth => CFG_GRPCI2_FDEPTH,
      fifo_count => CFG_GRPCI2_FCOUNT,
      conv_endian => CFG_GRPCI2_ENDIAN,
      deviceirq => CFG_GRPCI2_DEVINT,
      deviceirqmask => CFG_GRPCI2_DEVINTMSK,
      hostirq => CFG_GRPCI2_HOSTINT,
      hostirqmask => CFG_GRPCI2_HOSTINTMSK,
      nsync => 2,
      hostrst => 1,
      bypass => CFG_GRPCI2_BYPASS,
      debug => 0,
      tbapben => 0,
      tbpindex => 5,
      tbpaddr => 16#400#,
      tbpmask => 16#C00#
      )
    port map (
      rstn,
      clkm,
      pciclk,
      pci_dirq,
      pcii,
      pcio,
      apbi,
      apbo(4),
      ahbsi,
      ahbso(7),
      ahbmi,
      ahbmo(NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+CFG_GRETH+CFG_GRETH2),
      ahbmi,
      ahbmo(NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_SVGA_ENABLE+CFG_GRETH+CFG_GRETH2+1)
      );

    pcia0 : if CFG_PCI_ARB = 1 generate -- PCI arbiter
      pciarb0 : pciarb generic map (pindex => 13, paddr => 13, nb_agents => CFG_PCI_ARB_NGNT,
                                    apb_en => CFG_PCI_ARBAPB)
        port map (clk => pciclk, rst_n => pcii.rst, req_n => pci_arb_req, frame_n => pcii.frame,
                  gnt_n => pci_arb_gnt, pclk => clkm, prst_n => rstn, apbi => apbi, apbo => apbo(13));
      -- Internal connection of req(2)
      pci_arb_req(0 to 4) <= pci_arb_reql(0 to 1) & pci_reql & pci_arb_reql(3 to 4);
      pci_arb_req(5 to 7) <= (others => '1');
    end generate;
  end generate;

  nopcia0: if CFG_GRPCI2_MASTER = 0 or CFG_PCI_ARB = 0 generate
    pci_arb_gnt <= (others => '1');
  end generate;

  nopci_mtf: if CFG_GRPCI2_MASTER+CFG_GRPCI2_TARGET = 0 generate
    pcio <= pci_out_none;
  end generate;
  
  pgnt_pad : outpadv generic map (tech => padtech, width => 5, level => pci33) 
    port map (pci_p_gnt_b, pci_arb_gnt(0 to 4));
  preq_pad : inpadv generic map (tech => padtech, width => 5, level => pci33) 
    port map (pci_p_req_b, pci_arb_reql);

  pcipads0 : pcipads          -- PCI pads
    generic map (padtech => padtech, host => 2, int => 14, no66 => 1, onchipreqgnt => 1,
                 drivereset => 1, constidsel => 1)
    port map (pci_rst => pci_p_rst_b, pci_gnt => pci_arb_gnt(2), pci_idsel => '0', --pci_fpga_idsel,
              pci_lock => pci_p_lock_b, pci_ad => pci_p_ad, pci_cbe => pci_p_cbe_b,
              pci_frame => pci_p_frame_b, pci_irdy => pci_p_irdy_b, pci_trdy => pci_p_trdy_b,
              pci_devsel => pci_p_devsel_b, pci_stop => pci_p_stop_b, pci_perr => pci_p_perr_b,
              pci_par => pci_p_par, pci_req => pci_reql, pci_serr =>  pci_p_serr_b,
              pci_host => pci_host, pci_66 => pci_66, pcii => pcii, pcio => pcio, pci_int => pci_intv);
  pci_intv <= pci_p_intd_b & pci_p_intc_b & pci_p_intb_b & pci_p_inta_b;
  pci_host <= '0';   -- Always host
  pci_66 <= '0';
    
-----------------------------------------------------------------------
---  SYSTEM MONITOR ---------------------------------------------------
-----------------------------------------------------------------------

  grsmon: if CFG_GRSYSMON = 1 generate
    sysm0 : grsysmon generic map (tech => fabtech, hindex => 8,
         hirq => 1, caddr => 16#003#, cmask => 16#fff#,
         saddr => 16#004#, smask => 16#ffe#, split => CFG_SPLIT,
         extconvst => 0, wrdalign => 1, INIT_40 => X"0000",
         INIT_41 => X"0000", INIT_42 => X"0800", INIT_43 => X"0000",
         INIT_44 => X"0000", INIT_45 => X"0000", INIT_46 => X"0000",
         INIT_47 => X"0000", INIT_48 => X"0000", INIT_49 => X"0000",
         INIT_4A => X"0000", INIT_4B => X"0000", INIT_4C => X"0000",
         INIT_4D => X"0000", INIT_4E => X"0000", INIT_4F => X"0000",
         INIT_50 => X"0000", INIT_51 => X"0000", INIT_52 => X"0000",
         INIT_53 => X"0000", INIT_54 => X"0000", INIT_55 => X"0000",
         INIT_56 => X"0000", INIT_57 => X"0000",
         SIM_MONITOR_FILE => "sysmon.txt")
      port map (rstn, clkm, ahbsi, ahbso(8), sysmoni, sysmono);
    sysmoni.convst <= '0';
    sysmoni.convstclk <= '0';
    sysmoni.vauxn <= (others => '0');
    sysmoni.vauxp <= (others => '0');
--    sysmoni.vn <= test_mon_vn0_n;
--    sysmoni.vp <= test_mon_vp0_p;
  end generate grsmon;
  
-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate 
    ahbram0 : ahbram generic map (hindex => 9, haddr => CFG_AHBRADDR, 
        tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
    port map ( rstn, clkm, ahbsi, ahbso(9));
  end generate;
  
-----------------------------------------------------------------------
---  AHB DEBUG --------------------------------------------------------
-----------------------------------------------------------------------

--  dma0 : ahbdma
--    generic map (hindex => CFG_NCPU+CFG_AHB_UART+CFG_GRETH+CFG_GRETH2+CFG_AHB_JTAG,
--      pindex => 13, paddr => 13, dbuf => 6)
--    port map (rstn, clkm, apbi, apbo(13), ahbmi, 
--      ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_GRETH+CFG_GRETH2+CFG_AHB_JTAG));

--  at0 : ahbtrace
--  generic map ( hindex  => 7, ioaddr => 16#200#, iomask => 16#E00#,
--    tech    => memtech, irq     => 0, kbytes  => 8) 
--  port map ( rstn, clkm, ahbmi, ahbsi, ahbso(7));

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

--  nam1 : for i in (NCPU+CFG_AHB_UART+CFG_ETH+CFG_AHB_ETH+CFG_AHB_JTAG) to NAHBMST-1 generate
--    ahbmo(i) <= ahbm_none;
--  end generate;
--  nap0 : for i in 11 to NAPBSLV-1 generate apbo(i) <= apb_none; end generate;
--  nah0 : for i in 8 to NAHBSLV-1 generate ahbso(i) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => system_table(XILINX_ML510),
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;

