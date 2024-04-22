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
--  Copyright (C) 2014 Aeroflex Gaisler
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
use gaisler.spi.all;
use gaisler.can.all;
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
    -- clocks
    OSC_50_BANK2  : in std_logic;
    OSC_50_BANK3  : in std_logic;
    OSC_50_BANK4  : in std_logic;
    OSC_50_BANK5  : in std_logic;
    OSC_50_BANK6  : in std_logic;
    OSC_50_BANK7  : in std_logic;
    PLL_CLKIN_p   : in std_logic;
    SMA_CLKIN_p   : in std_logic;
--  SMA_GXBCLK_p  : in std_logic;
    GCLKIN        : in std_logic;
--    GCLKOUT_FPGA  : out std_logic;
--    SMA_CLKOUT_p  : out std_logic;

    -- cpu reset
    CPU_RESET_n   : in std_ulogic;

    -- max i/o
--    MAX_CONF_D    : inout std_logic_vector(3 downto 0);
--    MAX_I2C_SCLK  : out std_logic;
--    MAX_I2C_SDAT  : inout std_logic;

    -- LEDs
    LED           : out std_logic_vector(7 downto 0);

    -- buttons
    BUTTON        : in std_logic_vector(3 downto 0);
        
    -- switches
    SW            : in std_logic_vector(3 downto 0);

    -- slide switches
    SLIDE_SW      : in std_logic_vector(3 downto 0);

    -- temperature
--    TEMP_SMCLK    : out std_logic;
--    TEMP_SMDAT    : inout std_logic;
--    TEMP_INT_n    : in std_logic;

    -- current
    CSENSE_ADC_FO : out std_logic;
    CSENSE_SCK    : inout std_logic;
    CSENSE_SDI    : out std_logic;
    CSENSE_SDO    : in std_logic;
    CSENSE_CS_n   : out std_logic_vector(1 downto 0);
        
    -- fan
    FAN_CTRL      : out std_logic;

    -- eeprom
    EEP_SCL       : out std_logic;
    EEP_SDA       : inout std_logic;

    -- sdcard
 --   SD_CLK        : out std_logic;
 --   SD_CMD        : inout std_logic;
 --   SD_DAT        : inout std_logic_vector(3 downto 0);
 --   SD_WP_n       : in std_logic;

    -- Ethernet interfaces
    ETH_INT_n     : in std_logic_vector(3 downto 0);
    ETH_MDC       : out std_logic_vector(3 downto 0);
    ETH_MDIO      : inout std_logic_vector(3 downto 0);
    ETH_RST_n     : out std_ulogic;
    ETH_RX_p      : in std_logic_vector(3 downto 0);
    ETH_TX_p      : out std_logic_vector(3 downto 0);

    -- PCIe interfaces
--    PCIE_PREST_n  : in std_ulogic;
--    PCIE_REFCLK_p : in std_ulogic;
--    PCIE_RX_p     : in std_logic_vector(7 downto 0);
--    PCIE_SMBCLK   : in std_logic;
--    PCIE_SMBDAT   : inout std_logic;
--    PCIE_TX_p     : out std_logic_vector(7 downto 0);
--    PCIE_WAKE_n   : out std_logic;

    -- Flash and SRAM, shared signals
    FSM_A         : out std_logic_vector(25 downto 1);
    FSM_D         : inout std_logic_vector(15 downto 0);

    -- Flash control
    FLASH_ADV_n   : out std_ulogic;
    FLASH_CE_n    : out std_ulogic;
    FLASH_CLK     : out std_ulogic;
    FLASH_OE_n    : out std_ulogic;
    FLASH_RESET_n : out std_ulogic;
    FLASH_RYBY_n  : in std_ulogic;
    FLASH_WE_n    : out std_ulogic;

    -- SSRAM control
    SSRAM_ADV     : out std_ulogic;
    SSRAM_BWA_n   : out std_ulogic;
    SSRAM_BWB_n   : out std_ulogic;
    SSRAM_CE_n    : out std_ulogic;
    SSRAM_CKE_n   : out std_ulogic;
    SSRAM_CLK     : out std_ulogic;
    SSRAM_OE_n    : out std_ulogic;
    SSRAM_WE_n    : out std_ulogic;

    -- USB OTG
--    OTG_A         : out std_logic_vector(17 downto 1);
--    OTG_CS_n      : out std_ulogic;
--    OTG_D         : inout std_logic_vector(31 downto 0);
--    OTG_DC_DACK   : out std_ulogic;
--    OTG_DC_DREQ   : in std_ulogic;
--    OTG_DC_IRQ    : in std_ulogic;
--    OTG_HC_DACK   : out std_ulogic;
--    OTG_HC_DREQ   : in std_ulogic;
--    OTG_HC_IRQ    : in std_ulogic;
--    OTG_OE_n      : out std_ulogic;
--    OTG_RESET_n   : out std_ulogic;
--    OTG_WE_n      : out std_ulogic;

    -- SATA
--    SATA_REFCLK_p    : in  std_logic;
--    SATA_HOST_RX_p   : in  std_logic_vector(1 downto 0);
--    SATA_HOST_TX_p   : out std_logic_vector(1 downto 0);
--    SATA_DEVICE_RX_p : in  std_logic_vector(1 downto 0);
--    SATA_DEVICE_TX_p : out std_logic_vector(1 downto 0);


    -- DDR2 SODIMM
    M1_DDR2_addr  : out std_logic_vector(15 downto 0);
    M1_DDR2_ba    : out std_logic_vector(2 downto 0);
    M1_DDR2_cas_n : out std_logic;
    M1_DDR2_cke   : out std_logic_vector(1 downto 0);
    M1_DDR2_clk   : out std_logic_vector(1 downto 0);
    M1_DDR2_clk_n : out std_logic_vector(1 downto 0);
    M1_DDR2_cs_n  : out std_logic_vector(1 downto 0);
    M1_DDR2_dm    : out std_logic_vector(7 downto 0);
    M1_DDR2_dq    : inout std_logic_vector(63 downto 0);
    M1_DDR2_dqs   : inout std_logic_vector(7 downto 0);
    M1_DDR2_dqsn  : inout std_logic_vector(7 downto 0);
    M1_DDR2_odt   : out std_logic_vector(1 downto 0);
    M1_DDR2_ras_n : out std_logic;
--    M1_DDR2_SA    :  out std_logic_vector(1 downto 0);
--    M1_DDR2_SCL   : out std_logic;
--    M1_DDR2_SDA   : inout std_logic;
    M1_DDR2_we_n  : out std_logic;

    M1_DDR2_oct_rdn     : in  std_logic;
    M1_DDR2_oct_rup     : in  std_logic;

    -- DDR2 SODIMM
--    M2_DDR2_addr  : out std_logic_vector(15 downto 0);
--    M2_DDR2_ba    : out std_logic_vector(2 downto 0);
--    M2_DDR2_cas_n : out std_logic;
--    M2_DDR2_cke   : out std_logic_vector(1 downto 0);
--    M2_DDR2_clk   : out std_logic_vector(1 downto 0);
--    M2_DDR2_clk_n : out std_logic_vector(1 downto 0);
--    M2_DDR2_cs_n  : out std_logic_vector(1 downto 0);
--    M2_DDR2_dm    : out std_logic_vector(7 downto 0);
--    M2_DDR2_dq    : inout std_logic_vector(63 downto 0);
--    M2_DDR2_dqs   : inout std_logic_vector(7 downto 0);
--    M2_DDR2_dqsn  : inout std_logic_vector(7 downto 0);
--    M2_DDR2_odt   : out std_logic_vector(1 downto 0);
--    M2_DDR2_ras_n : out std_logic;
--    M2_DDR2_SA    : out std_logic_vector(1 downto 0);
--    M2_DDR2_SCL   : out std_logic;
--    M2_DDR2_SDA   : inout std_logic;
--    M2_DDR2_we_n  : out std_logic;

    -- GPIO
    GPIO0_D       : inout std_logic_vector(35 downto 0);
--    GPIO1_D       : inout std_logic_vector(35 downto 0);
        
    -- Ext I/O
--    EXT_IO        : inout std_logic;
        
    -- HSMC A
--    HSMA_CLKIN_n1 : in std_logic;
--    HSMA_CLKIN_n2 : in std_logic;
--    HSMA_CLKIN_p1 : in std_logic;
--    HSMA_CLKIN_p2 : in std_logic;
--    HSMA_CLKIN0   : in std_logic;
    HSMA_CLKOUT_n2 : out std_logic;
    HSMA_CLKOUT_p2 : out std_logic;
--    HSMA_D        : inout std_logic_vector(3 downto 0);
--    HSMA_GXB_RX_p : in std_logic_vector(3 downto 0);
--    HSMA_GXB_TX_p : out std_logic_vector(3 downto 0);
--    HSMA_OUT_n1   : inout std_logic;
--    HSMA_OUT_p1   : inout std_logic;
--    HSMA_OUT0     : inout std_logic;
--    HSMA_REFCLK_p : in std_logic;
--    HSMA_RX_n     : inout std_logic_vector(16 downto 0);
--    HSMA_RX_p     : inout std_logic_vector(16 downto 0);
--    HSMA_TX_n     : inout std_logic_vector(16 downto 0);
--    HSMA_TX_p     : inout std_logic_vector(16 downto 0);
        
    -- HSMC_B
--    HSMB_CLKIN_n1 : in std_logic;
--    HSMB_CLKIN_n2 : in std_logic;
--    HSMB_CLKIN_p1 : in std_logic;
--    HSMB_CLKIN_p2 : in std_logic;
--    HSMB_CLKIN0   : in std_logic;
--    HSMB_CLKOUT_n2 : out std_logic;
--    HSMB_CLKOUT_p2 : out std_logic;
--    HSMB_D        : inout std_logic_vector(3 downto 0);
--    HSMB_GXB_RX_p : in std_logic_vector(3 downto 0);
--    HSMB_GXB_TX_p : out std_logic_vector(3 downto 0);
--    HSMB_OUT_n1   : inout std_logic;
--    HSMB_OUT_p1   : inout std_logic;
--    HSMB_OUT0     : inout std_logic;
--    HSMB_REFCLK_p : in std_logic;
--    HSMB_RX_n     : inout std_logic_vector(16 downto 0);
--    HSMB_RX_p     : inout std_logic_vector(16 downto 0);
--    HSMB_TX_n     : inout std_logic_vector(16 downto 0);
--    HSMB_TX_p     : inout std_logic_vector(16 downto 0);
    
    -- HSMC i2c
--    HSMC_SCL      : out std_logic;
--    HSMC_SDA      : inout std_logic;

    -- Display
--    SEG0_D        : out std_logic_vector(6 downto 0);
--    SEG1_D        : out std_logic_vector(6 downto 0);
--    SEG0_DP       : out std_ulogic;
--    SEG1_DP       : out std_ulogic;
    
    -- UART
    UART_CTS      : out std_ulogic;
    UART_RTS      : in std_ulogic;
    UART_RXD      : in std_ulogic;
    UART_TXD      : out std_ulogic
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

  signal mem_ahbsi : ahb_slv_in_type;
  signal mem_ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal mem_ahbmi : ahb_mst_in_type;
  signal mem_ahbmo : ahb_mst_out_vector := (others => ahbm_none);
  
  signal clkm, rstn, rstraw : std_logic;
  signal cgi, cgi_125  : clkgen_in_type;
  signal cgo, cgo_125  : clkgen_out_type;
  signal u1i, dui  : uart_in_type;
  signal u1o, duo  : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type; 

  signal spii, spislvi : spi_in_type;
  signal spio, spislvo : spi_out_type;
  signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

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

  constant BOARD_FREQ : integer := 100000;        -- Board frequency in KHz
  constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
  constant IOAEN : integer := 1;
  constant OEPOL : integer := padoen_polarity(padtech);
  constant DEBUG_BUS : integer  := CFG_L2_EN;
  constant EDCL_SEP_AHB : integer := CFG_L2_EN;
  
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

  signal gprego : std_logic_vector(15 downto 0);

  signal slide_switch: std_logic_vector(3 downto 0);

  signal counter1 : std_logic_vector(26 downto 0);
  signal counter2 : std_logic_vector(3 downto 0);
  signal bitslip_int : std_logic;
  signal tx_rstn0, tx_rstn1, rx_rstn0, rx_rstn1 : std_logic;

  signal clkddr_l : std_logic;

begin

  nolock <= ahb2ahb_ctrl_none;
  noifctrl <= ahb2ahb_ifctrl_none;
  
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
    port map (clkin => PLL_CLKIN_p, pciclkin => gnd(0), clk => clkm, clkn => open,
              clk2x => open, sdclk => open, pciclk => open,
              cgi   => cgi, cgo => cgo);
  
  -- clk125_pad : clkpad generic map (tech => padtech) port map (clk125, lclk125);
  -- clkm125 <= clk125;

  rst0 : rstgen                 -- reset generator
    port map (CPU_RESET_n, clkm, clklock, rstn, rstraw);
  
  led2_pad : outpad generic map (tech => padtech) port map (LED(2), lock);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl                -- AHB arbiter/multiplexer
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, fpnpen => CFG_FPNPEN,
                 rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => IOAEN,
                 nahbm => CFG_NCPU+(CFG_AHB_UART+CFG_AHB_JTAG)*(1-DEBUG_BUS)+
                 DEBUG_BUS+CFG_GRETH+CFG_GRETH2,
                 nahbs => 8)
    port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

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

  errorn_pad : odpad generic map (tech => padtech) port map (LED(0), dbgo(0).error);

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
  dsubre_pad : inpad generic map (tech => padtech) port map (BUTTON(0), dsubren);
  dsui.break <= not dsubren; 
  dsuact_pad : outpad generic map (tech => padtech) port map (LED(1), dsuo.active);

  dui.rxd <= uart_rxd when slide_sw(0) = '0' else '1';
  
  nodbgbus : if DEBUG_BUS /= 1 generate
    -- DSU and debug links directly connected to main bus

    edcl_ahbmi <= ahbmi;
    -- EDCL ahbmo interfaces are not used in this configuration
    
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3                 -- LEON3 Debug Support Unit
        generic map (hindex => 2, haddr => 16#E00#, hmask => 16#FC0#, 
                     ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);  
    end generate;
    nodsu : if CFG_DSU = 0 generate 
      ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
    end generate;
  
    dcomgen : if CFG_AHB_UART = 1 generate
      dcom0: ahbuart		-- Debug UART
        generic map (hindex => CFG_NCPU, pindex => 7, paddr => 7)
        port map (rstn, clkm, dui, duo, apbi, apbo(7), ahbmi, ahbmo(CFG_NCPU));
    end generate;
--  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;
  
    ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
      ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
        port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
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
      dbg_ahbmo(CFG_AHB_UART+CFG_AHB_JTAG) <= edcl_ahbmo(0);
      dbg_ahbmo(CFG_AHB_UART+CFG_AHB_JTAG+1) <= edcl_ahbmo(1);
      
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
      
      dcomgen : if CFG_AHB_UART = 1 generate
        dcom0: ahbuart		-- Debug UART
          generic map (hindex => 0, pindex => 7, paddr => 7)
          port map (rstn, clkm, dui, duo, apbi, apbo(7), dbg_ahbmi, dbg_ahbmo(0));
      end generate;
--  nouah : if CFG_AHB_UART = 0 generate apbo(7) <= apb_none; end generate;

      ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
        ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_AHB_UART)
          port map(rstn, clkm, tck, tms, tdi, tdo, dbg_ahbmi, dbg_ahbmo(CFG_AHB_UART),
                 open, open, open, open, open, open, open, gnd(0));
      end generate;

      ahb0 : ahbctrl                -- AHB arbiter/multiplexer
        generic map (defmast => CFG_DEFMST, split => 0, fpnpen => CFG_FPNPEN,
                     rrobin => CFG_RROBIN, ioaddr => DBG_AHBIO,
                     ioen => 1,
                     nahbm => CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_GRETH2,
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
          hmindex     => CFG_NCPU+CFG_GRETH+CFG_GRETH2,
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
          ahbmo       => ahbmo(CFG_NCPU+CFG_GRETH+CFG_GRETH2),
          ahbso2      => ahbso,
          lcki        => nolock,
          lcko        => open,
          ifctrl      => noifctrl);
    end block dbgsubsys;
  end generate;
  
----------------------------------------------------------------------
---  Memory subsystem   ----------------------------------------------
----------------------------------------------------------------------
  data_pad : iopadvv generic map (tech => padtech, width => 16, oepol => OEPOL)
    port map (FSM_D, memo.data(31 downto 16), memo.vbdrive(31 downto 16), memi.data(31 downto 16));
  
  FSM_A <= memo.address(25 downto 1);
  FLASH_CLK <= clkm;
  FLASH_RESET_n <= rstn;
  FLASH_CE_n <= memo.romsn(0);
  FLASH_OE_n <= memo.oen;
  FLASH_WE_n <= memo.writen;
  FLASH_ADV_n <= '0';

  memi.brdyn <= '1';
  memi.bexcn <= '1';
  memi.writen <= '1';
  memi.wrn <= (others => '1');
  memi.bwidth <= "01";
  memi.sd <= (others => '0');
  memi.cb <= (others => '0');
  memi.scb <= (others => '0');
  memi.edac <= '0';

  mctrl0 : if CFG_MCTRL_LEON2 = 1 generate
    mctrl0 : mctrl generic map (hindex => 0, pindex => 0,
      romaddr => 16#000#, rommask => 16#fc0#,
      ioaddr => 0, iomask => 0,
      ramaddr => 0, rammask => 0,
      ram8 => CFG_MCTRL_RAM8BIT, 
      ram16 => CFG_MCTRL_RAM16BIT,
      sden => CFG_MCTRL_SDEN, 
      invclk => CFG_MCTRL_INVCLK,
      sepbus => CFG_MCTRL_SEPBUS)
    port map (rstn, clkm, memi, memo, ahbsi, ahbso(0), apbi, apbo(0), wpo, open);
  end generate;

  nomctrl0: if CFG_MCTRL_LEON2 = 0 generate
    ahbso(0) <= ahbs_none;
    apbo(0) <= apb_none;
    memo <= memory_out_none;
  end generate;

  -----------------------------------------------------------------------------
  -- DDR2 SDRAM memory controller
  -----------------------------------------------------------------------------
  l2cdis : if CFG_L2_EN = 0 generate
    ddr2cen: if CFG_DDR2SP /= 0 generate
      ddr2c : ddr2spa
        generic map (
          fabtech         => stratix4,                  cbdelayb0       => 0,
          memtech         => memtech,                   cbdelayb1       => 0,
          rskew           => 0,                         cbdelayb2       => 0,
          hindex          => 3,                         cbdelayb3       => 0,
          haddr           => 16#400#,                   numidelctrl     => 0,
          hmask           => 16#C00#,                   norefclk        => 0,
          ioaddr          => 1,                         odten           => 3,
          iomask          => 16#fff#,                   octen           => 1,
          MHz             => CFG_DDR2SP_FREQ,           dqsgating       => 0,
          TRFC            => CFG_DDR2SP_TRFC,           nosync          => CFG_DDR2SP_NOSYNC,
          clkmul          => 16,                        eightbanks      => 1,
          clkdiv          => 3,                         dqsse           => 0,
          col             => 10,                        burstlen        => burstlen,
          Mbyte           => 1024,                      ahbbits         => ahbdw,
          rstdel          => 0,                         ft              => CFG_DDR2SP_FTEN,
          pwron           => CFG_DDR2SP_INIT,           ftbits          => CFG_DDR2SP_FTWIDTH,
          oepol           => 0,                         bigmem          => 0,
          ddrbits         => CFG_DDR2SP_DATAWIDTH,      raspipe         => 0,
          ahbfreq         => CPU_FREQ/1000,             nclk            => 2,
          readdly         => 0,                         scantest        => 0,
          ddelayb0        => CFG_DDR2SP_DELAY0,         ncs             => 1,
          ddelayb1        => CFG_DDR2SP_DELAY1,         cke_rst         => 1,
          ddelayb2        => CFG_DDR2SP_DELAY2,         pipe_ctrl       => 1,
          ddelayb3        => CFG_DDR2SP_DELAY3,
          ddelayb4        => CFG_DDR2SP_DELAY4,
          ddelayb5        => CFG_DDR2SP_DELAY5,
          ddelayb6        => CFG_DDR2SP_DELAY6,
          ddelayb7        => CFG_DDR2SP_DELAY7
        )
        port map (
          rst_ddr         => CPU_RESET_n,
          rst_ahb         => rstn,
          clk_ddr         => OSC_50_BANK4,
          clk_ahb         => clkm,
          clkref200       => clkm,
          lock            => lock,
          clkddro         => clkddr_l,
          clkddri         => clkddr_l,
          ahbsi           => ahbsi,
          ahbso           => ahbso(3),
          ddr_ad          => M1_DDR2_addr(13 downto 0),
          ddr_ba          => M1_DDR2_ba,
          ddr_clk         => M1_DDR2_clk,
          ddr_clkb        => M1_DDR2_clk_n,
          ddr_cke         => M1_DDR2_cke,
          ddr_csb         => M1_DDR2_cs_n,
          ddr_dm          => M1_DDR2_dm,
          ddr_rasb        => M1_DDR2_ras_n,
          ddr_casb        => M1_DDR2_cas_n,
          ddr_web         => M1_DDR2_we_n,
          ddr_dq          => M1_DDR2_dq,
          ddr_dqs         => M1_DDR2_dqs,
          ddr_dqsn        => M1_DDR2_dqsn,
          ddr_odt         => M1_DDR2_odt,
          ddr_clk_fb_out  => open,
          ddr_clk_fb      => '0',
          ce              => open,
          oct_rdn         => M1_DDR2_oct_rdn,
          oct_rup         => M1_DDR2_oct_rup
        );
    end generate;
    ddr2cdis: if CFG_DDR2SP = 0 generate
      ahbso(3) <= ahbs_none;
      lock <= '1';
    end generate;
  end generate;
  -----------------------------------------------------------------------------
  -- L2 cache covering DDR2 SDRAM memory controller
  -----------------------------------------------------------------------------
  l2cen : if CFG_L2_EN /= 0 generate
    memorysubsys : block
      constant MEM_AHBIO : integer := 16#FFE#;
    begin
      l2c0 : l2c
        generic map(hslvidx => 3, hmstidx => 0, cen => CFG_L2_PEN, 
                    haddr => 16#400#, hmask => 16#c00#, ioaddr => 16#FF0#, 
                    cached => CFG_L2_MAP, repl => CFG_L2_RAN, ways => CFG_L2_WAYS, 
                    linesize => CFG_L2_LSZ, waysize => CFG_L2_SIZE,
                    memtech => memtech, bbuswidth => AHBDW,
                    bioaddr => MEM_AHBIO, biomask => 16#fff#, 
                    sbus => 0, mbus => 1, arch => CFG_L2_SHARE,
                    ft => CFG_L2_EDAC)
        port map(rst => rstn, clk => clkm, ahbsi => ahbsi, ahbso => ahbso(3),
                 ahbmi => mem_ahbmi, ahbmo => mem_ahbmo(0), ahbsov => mem_ahbso);

      ahb0 : ahbctrl                -- AHB arbiter/multiplexer
        generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
                     rrobin => CFG_RROBIN, ioaddr => MEM_AHBIO,
                     ioen => IOAEN, nahbm => 1, nahbs => 1)
        port map (rstn, clkm, mem_ahbmi, mem_ahbmo, mem_ahbsi, mem_ahbso);
    
      ddr2cen: if CFG_DDR2SP /= 0 generate
        ddr2c : ddr2spa
          generic map (
            fabtech         => stratix4,                  cbdelayb0       => 0,
            memtech         => memtech,                   cbdelayb1       => 0,
            rskew           => 0,                         cbdelayb2       => 0,
            hindex          => 3,                         cbdelayb3       => 0,
            haddr           => 16#400#,                   numidelctrl     => 0,
            hmask           => 16#C00#,                   norefclk        => 0,
            ioaddr          => 1,                         odten           => 3,
            iomask          => 16#fff#,                   octen           => 1,
            MHz             => CFG_DDR2SP_FREQ,           dqsgating       => 0,
            TRFC            => CFG_DDR2SP_TRFC,           nosync          => CFG_DDR2SP_NOSYNC,
            clkmul          => 16,                        eightbanks      => 1,
            clkdiv          => 3,                         dqsse           => 0,
            col             => 10,                        burstlen        => burstlen,
            Mbyte           => 1024,                      ahbbits         => ahbdw,
            rstdel          => 0,                         ft              => CFG_DDR2SP_FTEN,
            pwron           => CFG_DDR2SP_INIT,           ftbits          => CFG_DDR2SP_FTWIDTH,
            oepol           => 0,                         bigmem          => 0,
            ddrbits         => CFG_DDR2SP_DATAWIDTH,      raspipe         => 0,
            ahbfreq         => CPU_FREQ/1000,             nclk            => 2,
            readdly         => 0,                         scantest        => 0,
            ddelayb0        => CFG_DDR2SP_DELAY0,         ncs             => 1,
            ddelayb1        => CFG_DDR2SP_DELAY1,         cke_rst         => 1,
            ddelayb2        => CFG_DDR2SP_DELAY2,         pipe_ctrl       => 1,
            ddelayb3        => CFG_DDR2SP_DELAY3,
            ddelayb4        => CFG_DDR2SP_DELAY4,
            ddelayb5        => CFG_DDR2SP_DELAY5,
            ddelayb6        => CFG_DDR2SP_DELAY6,
            ddelayb7        => CFG_DDR2SP_DELAY7
          )
          port map (
            rst_ddr         => CPU_RESET_n,
            rst_ahb         => rstn,
            clk_ddr         => OSC_50_BANK4,
            clk_ahb         => clkm,
            clkref200       => clkm,
            lock            => lock,
            clkddro         => clkddr_l,
            clkddri         => clkddr_l,
            ahbsi           => mem_ahbsi,
            ahbso           => mem_ahbso(0),
            ddr_ad          => M1_DDR2_addr(13 downto 0),
            ddr_ba          => M1_DDR2_ba,
            ddr_clk         => M1_DDR2_clk,
            ddr_clkb        => M1_DDR2_clk_n,
            ddr_cke         => M1_DDR2_cke,
            ddr_csb         => M1_DDR2_cs_n,
            ddr_dm          => M1_DDR2_dm,
            ddr_rasb        => M1_DDR2_ras_n,
            ddr_casb        => M1_DDR2_cas_n,
            ddr_web         => M1_DDR2_we_n,
            ddr_dq          => M1_DDR2_dq,
            ddr_dqs         => M1_DDR2_dqs,
            ddr_dqsn        => M1_DDR2_dqsn,
            ddr_odt         => M1_DDR2_odt,
            ddr_clk_fb_out  => open,
            ddr_clk_fb      => '0',
            ce              => open,
            oct_rdn         => M1_DDR2_oct_rdn,
            oct_rup         => M1_DDR2_oct_rup
          );
      end generate;
      ddr2cdis: if CFG_DDR2SP = 0 generate
        mem_ahbso(0) <= ahbs_none;
        lock <= '1';
      end generate;
    end block memorysubsys;
  end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl                                -- AHB/APB bridge
    generic map (hindex => 1, haddr => CFG_APBADDR)
    port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo );

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
                   fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd <= '1' when slide_sw(0) = '0' else uart_rxd;
    u1i.ctsn <= uart_rts; u1i.extclk <= '0'; 
  end generate;
  uart_txd <= u1o.txd when slide_sw(0) = '1' else duo.txd;
  uart_cts <= u1o.rtsn;
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

    pio_pads : for i in 0 to CFG_GRGPIO_WIDTH-1 generate
      pio_pad : iopad generic map (tech => padtech)
        port map (GPIO0_D(i), gpioo.dout(i), gpioo.oen(i), gpioi.din(i));
    end generate;
  end generate;
  unused_pio_pads : for i in (CFG_GRGPIO_WIDTH*CFG_GRGPIO_ENABLE) to 35 generate
    GPIO0_D(i) <= '0';
  end generate;

  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
    spi1 : spictrl
      generic map (pindex => 10, paddr  => 10, pmask  => 16#fff#, pirq => 10,
                   fdepth => CFG_SPICTRL_FIFO, slvselen => CFG_SPICTRL_SLVREG,
                   slvselsz => CFG_SPICTRL_SLVS, odmode => 0, netlist => 0,
                   syncram => CFG_SPICTRL_SYNCRAM, ft => CFG_SPICTRL_FT)
      port map (rstn, clkm, apbi, apbo(10), spii, spio, slvsel);
    spii.spisel <= '1';                 -- Master only
    miso_pad : inpad generic map (tech => padtech)
      port map (CSENSE_SDO, spii.miso);
    mosi_pad : outpad generic map (tech => padtech)
      port map (CSENSE_SDI, spio.mosi);
    sck_pad  : outpad generic map (tech => padtech)
      port map (CSENSE_SCK, spio.sck);
    slvsel_pad : outpad generic map (tech => padtech)
      port map (CSENSE_CS_n(0), slvsel(0));
    slvseladc_pad : outpad generic map (tech => padtech)
      port map (CSENSE_ADC_FO, slvsel(1));
  end generate spic;
  
  ahbs : if CFG_AHBSTAT = 1 generate    -- AHB status register
    stati.cerror(0) <= memo.ce;
    ahbstat0 : ahbstat
      generic map (pindex => 15, paddr => 15, pirq => 1,
                   nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;
  nop2 : if CFG_AHBSTAT = 0 generate apbo(15) <= apb_none; end generate;

  fan_pad : outpad generic map (tech => padtech) port map (FAN_CTRL, vcc(0));
  
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
        clkin     => OSC_50_BANK3,
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
        hindex      => CFG_NCPU+(CFG_AHB_UART+CFG_AHB_JTAG)*(1-DEBUG_BUS),
        ehindex     => CFG_AHB_UART+CFG_AHB_JTAG,
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
        sim         => 1
        )
      port map (
        rst             => rstn,
        clk             => clkm,
        ahbmi           => ahbmi,
        ahbmo           => ahbmo(CFG_NCPU+(CFG_AHB_UART+CFG_AHB_JTAG)*(1-DEBUG_BUS)),
        ahbmi2          => edcl_ahbmi,
        ahbmo2          => edcl_ahbmo(0),
        apbi            => apbi,
        apbo            => apbo(11),
        -- High-speed Serial Interface
        clk_125         => ref_clk,
        rst_125         => ref_rst,
        eth_rx_p        => ETH_RX_p(0),
        eth_tx_p        => ETH_TX_p(0),
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
        edcldisable     => slide_switch(1),
        debug_pcs_mdio  => gprego(0)
        );

    ethrst_pad : outpad generic map (tech => padtech)
      port map (ETH_RST_n, e0_reset);

    emdio0_pad : iopad generic map (tech => padtech)
      port map (ETH_MDIO(0), e0_mdio_o, e0_mdio_oe, e0_mdio_i);

    emdc0_pad : outpad generic map (tech => padtech)
      port map (ETH_MDC(0), e0_mdc);

    eint0_pad : inpad generic map (tech => padtech)
      port map (ETH_INT_n(0), e0_mdint);

    grgpreg0 : grgpreg
      generic map (
        pindex  => 8,
        paddr   => 4,
        rstval  => 0
      )
      port map (
        rst     => rstn,
        clk     => clkm,
        apbi    => apbi,
        apbo    => apbo(8),
        gprego  => gprego
      );

    -- LEDs
    led3_pad : outpad generic map (tech => padtech) port map (LED(3), vcc(0));
    led4_pad : outpad generic map (tech => padtech) port map (LED(4), vcc(0));
    led5_pad : outpad generic map (tech => padtech) port map (LED(5), vcc(0));
    led6_pad : outpad generic map (tech => padtech) port map (LED(6), vcc(0));
    led7_pad : outpad generic map (tech => padtech) port map (LED(7), vcc(0));

  end generate;

  noeth0 : if CFG_GRETH = 0 generate
    edcl_ahbmo(0) <= ahbm_none;
  end generate;

  eth1: if CFG_GRETH2 = 1 generate -- Gaisler ethernet MAC
    
    e1 : greths_mb        -- Gaisler Ethernet MAC 1
      generic map (
        hindex      => CFG_NCPU+(CFG_AHB_UART+CFG_AHB_JTAG)*(1-DEBUG_BUS)+CFG_GRETH,
        ehindex     => CFG_AHB_UART+CFG_AHB_JTAG+1,
        pindex      => 12,
        paddr       => 12,
        pirq        => 7,
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
        phyrstadr   => 1,
        ipaddrh     => CFG_ETH_IPM,
        ipaddrl     => CFG_ETH_IPL,
        edclsepahbg => EDCL_SEP_AHB,
        giga        => CFG_GRETH21G,
        sim         => 1
        )
      port map (
        rst             => rstn,
        clk             => clkm,
        ahbmi           => ahbmi,
        ahbmo           => ahbmo(CFG_NCPU+(CFG_AHB_UART+CFG_AHB_JTAG)*(1-DEBUG_BUS)+CFG_GRETH),
        ahbmi2          => edcl_ahbmi, 
        ahbmo2          => edcl_ahbmo(1),
        apbi            => apbi,
        apbo            => apbo(12),
        -- High-speed Serial Interface
        clk_125         => ref_clk,
        rst_125         => ref_rst,
        eth_rx_p        => ETH_RX_p(1),
        eth_tx_p        => ETH_TX_p(1),
        -- MDIO interface
        reset           => e1_reset,
        mdio_o          => e1_mdio_o,
        mdio_oe         => e1_mdio_oe,
        mdio_i          => e1_mdio_i,
        mdc             => e1_mdc,
        mdint           => e1_mdint,
        -- Control signals
        phyrstaddr      => "00001",
        edcladdr        => "0010",
        edclsepahb      => '1',
        edcldisable     => slide_switch(1)
        );

    -- MDIO interface setup
    emdio1_pad : iopad generic map (tech => padtech)
      port map (ETH_MDIO(1), e1_mdio_o, e1_mdio_oe, e1_mdio_i);

    emdc1_pad : outpad generic map (tech => padtech)
      port map (ETH_MDC(1), e1_mdc);

    eint1_pad : inpad generic map (tech => padtech)
      port map (ETH_INT_n(1), e1_mdint);

  end generate;

  noeth2 : if CFG_GRETH2 = 0 generate
    edcl_ahbmo(1) <= ahbm_none;
  end generate;

  edcl_pad : inpad
    generic map (tech => padtech)
    port map (SLIDE_SW(1), slide_switch(1));

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate 
    ahbram0 : ahbram generic map (hindex => 5, haddr => CFG_AHBRADDR, 
      tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ)
    port map ( rstn, clkm, ahbsi, ahbso(5));
  end generate;

  nram : if CFG_AHBRAMEN = 0 generate ahbso(5) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

nam : for i in (CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+CFG_GRETH2) to NAHBMST-1 generate
  ahbmo(i) <= ahbm_none;
end generate;
-- nap0 : for i in 11 to NAPBSLV-1 generate apbo(i) <= apb_none; end generate;
-- apbo(6) <= apb_none;

--ahbmo(ahbmo'high downto nahbm) <= (others => ahbm_none);
ahbso(ahbso'high downto 6) <= (others => ahbs_none);
--apbo(napbs to apbo'high) <= (others => apb_none);

-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off

  test0 : ahbrep generic map (hindex => 4, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(4));

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

