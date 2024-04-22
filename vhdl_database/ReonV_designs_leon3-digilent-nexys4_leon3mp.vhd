------------------------------------------------------------------------------
--  LEON3 Demonstration design
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
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
use techmap.allclkgen.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.spi.all;
use gaisler.net.all;
use gaisler.jtag.all;
--pragma translate_off
use gaisler.sim.all;
library unisim;
use unisim.BUFG;
use unisim.PLLE2_ADV;
use unisim.STARTUPE2;
--pragma translate_on
library esa;
use esa.memoryctrl.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech  : integer := CFG_FABTECH;
    memtech  : integer := CFG_MEMTECH;
    padtech  : integer := CFG_PADTECH;
    clktech  : integer := CFG_CLKTECH;
    disas    : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart  : integer := CFG_DUART;     -- Print UART on console
    pclow    : integer := CFG_PCLOW
    );
  port (
    clk             : in    std_ulogic;

    -- onBoard Cellular RAM, Numonyx StrataFlash and Numonyx Quad Flash
    RamOE           : out   std_ulogic;
    RamWE           : out   std_ulogic;

    RamAdv          : out   std_ulogic;
    RamCE           : out   std_ulogic;
    RamClk          : out   std_ulogic;
    RamCRE          : out   std_ulogic;
    RamLB           : out   std_ulogic;
    RamUB           : out   std_ulogic;
    --RamWait         : in   std_ulogic;

    QspiCSn         : out   std_ulogic;
    QspiDB          : inout std_logic_vector(3 downto 0);

    address         : out   std_logic_vector(22 downto 0);

    data            : inout std_logic_vector(15 downto 0);

    -- 7 segment display
    --seg             : out   std_logic_vector(6 downto 0);
    --an              : out   std_logic_vector(7 downto 0);

    -- LEDs
    Led             : out   std_logic_vector(15 downto 0);

    -- Switches
    sw              : in    std_logic_vector(15 downto 0);

    -- Buttons
    btnCpuResetn    : in    std_ulogic;
    btn             : in    std_logic_vector(4 downto 0);

    -- VGA Connector
    --vgaRed          : out   std_logic_vector(2 downto 0);
    --vgaGreen        : out   std_logic_vector(2 downto 0);
    --vgaBlue         : out   std_logic_vector(2 downto 1);

    --Hsync           : out   std_ulogic;
    --Vsync           : out   std_ulogic;

    -- 12 pin connectors
    --ja              : inout std_logic_vector(7 downto 0);
    --jb              : inout std_logic_vector(7 downto 0);
    --jc              : inout std_logic_vector(7 downto 0);
    --jd              : inout std_logic_vector(7 downto 0);

    -- SMSC ethernet PHY
    PhyRstn         : out   std_ulogic;
    PhyCrs          : in    std_ulogic;
    PhyClk50Mhz     : out   std_ulogic;

    PhyTxd          : out   std_logic_vector(1 downto 0);
    PhyTxEn         : out   std_ulogic;

    PhyRxd          : in    std_logic_vector(1 downto 0);
    PhyRxEr         : in    std_ulogic;

    PhyMdc          : out   std_ulogic;
    PhyMdio         : inout std_logic;

    -- Pic USB-HID interface
    --~ PS2KeyboardData : inout std_logic;
    --~ PS2KeyboardClk  : inout std_logic;

    --~ PS2MouseData    : inout std_logic;
    --~ PS2MouseClk     : inout std_logic;

    --~ PicGpio         : out   std_logic_vector(1 downto 0);

    -- USB-RS232 interface
    RsRx            : in    std_logic;
    RsTx            : out   std_logic
  );
end;

architecture rtl of leon3mp is
  component PLLE2_ADV
  generic (
     BANDWIDTH : string := "OPTIMIZED";
     CLKFBOUT_MULT : integer := 5;
     CLKFBOUT_PHASE : real := 0.0;
     CLKIN1_PERIOD : real := 0.0;
     CLKIN2_PERIOD : real := 0.0;
     CLKOUT0_DIVIDE : integer := 1;
     CLKOUT0_DUTY_CYCLE : real := 0.5;
     CLKOUT0_PHASE : real := 0.0;
     CLKOUT1_DIVIDE : integer := 1;
     CLKOUT1_DUTY_CYCLE : real := 0.5;
     CLKOUT1_PHASE : real := 0.0;
     CLKOUT2_DIVIDE : integer := 1;
     CLKOUT2_DUTY_CYCLE : real := 0.5;
     CLKOUT2_PHASE : real := 0.0;
     CLKOUT3_DIVIDE : integer := 1;
     CLKOUT3_DUTY_CYCLE : real := 0.5;
     CLKOUT3_PHASE : real := 0.0;
     CLKOUT4_DIVIDE : integer := 1;
     CLKOUT4_DUTY_CYCLE : real := 0.5;
     CLKOUT4_PHASE : real := 0.0;
     CLKOUT5_DIVIDE : integer := 1;
     CLKOUT5_DUTY_CYCLE : real := 0.5;
     CLKOUT5_PHASE : real := 0.0;
     COMPENSATION : string := "ZHOLD";
     DIVCLK_DIVIDE : integer := 1;
     REF_JITTER1 : real := 0.0;
     REF_JITTER2 : real := 0.0;
     STARTUP_WAIT : string := "FALSE"
  );
  port (
     CLKFBOUT : out std_ulogic := '0';
     CLKOUT0 : out std_ulogic := '0';
     CLKOUT1 : out std_ulogic := '0';
     CLKOUT2 : out std_ulogic := '0';
     CLKOUT3 : out std_ulogic := '0';
     CLKOUT4 : out std_ulogic := '0';
     CLKOUT5 : out std_ulogic := '0';
     DO : out std_logic_vector (15 downto 0);
     DRDY : out std_ulogic := '0';
     LOCKED : out std_ulogic := '0';
     CLKFBIN : in std_ulogic;
     CLKIN1 : in std_ulogic;
     CLKIN2 : in std_ulogic;
     CLKINSEL : in std_ulogic;
     DADDR : in std_logic_vector(6 downto 0);
     DCLK : in std_ulogic;
     DEN : in std_ulogic;
     DI : in std_logic_vector(15 downto 0);
     DWE : in std_ulogic;
     PWRDWN : in std_ulogic;
     RST : in std_ulogic
  );
  end component;

 component STARTUPE2
 generic (
    PROG_USR : string := "FALSE";
    SIM_CCLK_FREQ : real := 0.0
  );
  port (
    CFGCLK               : out std_ulogic;
    CFGMCLK              : out std_ulogic;
    EOS                  : out std_ulogic;
    PREQ                 : out std_ulogic;
    CLK                  : in std_ulogic;
    GSR                  : in std_ulogic;
    GTS                  : in std_ulogic;
    KEYCLEARB            : in std_ulogic;
    PACK                 : in std_ulogic;
    USRCCLKO             : in std_ulogic;
    USRCCLKTS            : in std_ulogic;
    USRDONEO             : in std_ulogic;
    USRDONETS            : in std_ulogic
  );
  end component;

  component BUFG port (O : out std_logic; I : in std_logic); end component;

  signal CLKFBOUT      : std_logic;
  signal CLKFBIN       : std_logic;
  signal eth_pll_rst   : std_logic;
  signal eth_clk_nobuf : std_logic;
  signal eth_clk90_nobuf : std_logic;
  signal eth_clk       : std_logic;
  signal eth_clk90     : std_logic;

  signal vcc : std_logic;
  signal gnd : std_logic;

  signal memi : memory_in_type;
  signal memo : memory_out_type;
  signal wpo  : wprot_out_type;

  signal gpioi : gpio_in_type;
  signal gpioo : gpio_out_type;

  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi : clkgen_in_type;
  signal cgo : clkgen_out_type;

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;
  signal ndsuact : std_ulogic;

  signal ethi : eth_in_type;
  signal etho : eth_out_type;

  signal gpti : gptimer_in_type;

  signal spii : spi_in_type;
  signal spio : spi_out_type;
  signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;

  signal clkm, rstn, clkml  : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal btnCpuReset       : std_logic;
  signal lock               : std_logic;

  -- RS232 APB Uart
  signal rxd1 : std_logic;
  signal txd1 : std_logic;

  attribute keep                     : boolean;
  attribute syn_keep                 : boolean;
  attribute syn_preserve             : boolean;
  attribute syn_keep of lock         : signal is true;
  attribute syn_keep of clkml        : signal is true;
  attribute syn_keep of clkm         : signal is true;
  attribute syn_preserve of clkml    : signal is true;
  attribute syn_preserve of clkm     : signal is true;
  attribute keep of lock             : signal is true;
  attribute keep of clkml            : signal is true;
  attribute keep of clkm             : signal is true;

  constant BOARD_FREQ : integer := 100000;                                -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1';
  gnd <= '0';

  led(15 downto 4) <= (others =>'0'); -- unused leds off

  btnCpuReset<= not btnCpuResetn;
  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;

  rst0 : rstgen generic map (acthigh => 1)
    port map (btnCpuReset, clkm, lock, rstn, rstraw);
  lock <= cgo.clklock;

  -- clock generator
  clkgen0 : clkgen
    generic map (fabtech, CFG_CLKMUL, CFG_CLKDIV, 0, 0, 0, 0, 0, BOARD_FREQ, 0)
    port map (clk, gnd, clkm, open, open, open, open, cgi, cgo, open, open, open);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
                 rrobin  => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => 1,
                 nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH,
                 nahbs => 8)
    port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  -- LEON3 processor
  leon3gen : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      u0 : leon3s
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
                     0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
                     CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
                     CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
                     CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
                     CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR,
                     CFG_NCPU-1, CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso, irqi(i), irqo(i), dbgi(i), dbgo(i));
    end generate;

    led(3)  <= not dbgo(0).error;
    led(2)  <= not dsuo.active;

    -- LEON3 Debug Support Unit
    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3
        generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, ahbpf => CFG_AHBPF,
                     ncpu   => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);

      --dsubre_pad : inpad generic map (tech  => padtech) port map (dsubre, dsui.break);

      dsui.enable <= '1';

    end generate;
  end generate;
  nodsu : if CFG_DSU = 0 generate
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  -- Debug UART
  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0 : ahbuart
      generic map (hindex => CFG_NCPU, pindex => 4, paddr => 7)
      port map (rstn, clkm, dui, duo, apbi, apbo(4), ahbmi, ahbmo(CFG_NCPU));
    dsurx_pad : inpad generic map (tech  => padtech) port map (RsRx, dui.rxd);
    dsutx_pad : outpad generic map (tech => padtech) port map (RsTx, duo.txd);
    led(0) <= not dui.rxd;
    led(1) <= not duo.txd;
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(4) <= apb_none; end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd);
  end generate;

----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  mg2 : if CFG_MCTRL_LEON2 = 1 generate        -- LEON2 memory controller
    sr1 : mctrl generic map (hindex => 5, pindex => 0, paddr => 0, rommask => 0,
        iomask => 0, ram8 => CFG_MCTRL_RAM8BIT, ram16 => CFG_MCTRL_RAM16BIT,srbanks=>1)
      port map (rstn, clkm, memi, memo, ahbsi, ahbso(5), apbi, apbo(0), wpo, open);
  end generate;

  memi.brdyn  <= '1';
  memi.bexcn  <= '1';
  memi.writen <= '1';
  memi.wrn    <= "1111";
  memi.bwidth <= "01";

  mg0 : if (CFG_MCTRL_LEON2 = 0) generate
    apbo(0) <= apb_none;
    ahbso(5) <= ahbs_none;
    memo.bdrive(0) <= '1';
  end generate;

  mgpads : if (CFG_MCTRL_LEON2 /= 0) generate
    addr_pad : outpadv generic map (tech => padtech, width => 23)
      port map (address, memo.address(23 downto 1));
    oen_pad : outpad generic map (tech => padtech)
      port map (RamOE, memo.oen);
    cs_pad : outpad generic map (tech => padtech)
      port map (RamCE, memo.ramsn(0));
    lb_pad : outpad generic map (tech => padtech)
      port map (RamLB, memo.mben(0));
    ub_pad : outpad generic map (tech => padtech)
      port map (RamUB, memo.mben(1));
    wri_pad : outpad generic map (tech => padtech)
      port map (RamWE, memo.writen);
  end generate;

  bdr : iopadv generic map (tech => padtech, width => 8)
    port map (data(7 downto 0), memo.data(23 downto 16),
              memo.bdrive(1), memi.data(23 downto 16));
  bdr2 : iopadv generic map (tech => padtech, width => 8)
    port map (data(15 downto 8), memo.data(31 downto 24),
              memo.bdrive(0), memi.data(31 downto 24));
  RamCRE <= '0';
  RamClk <= '0';
  RamAdv <= '0';

----------------------------------------------------------------------
---  SPI Memory controller -------------------------------------------
----------------------------------------------------------------------
  -- OPTIONALY set the offset generic (only affect reads).
  -- The first 4MB are used for loading the FPGA.
  -- For dual ouptut: readcmd => 16#3B#, dualoutput => 1
  spimctrl1 : spimctrl
  generic map (hindex => 7, hirq => 7, faddr => 16#b00#, fmask => 16#ff0#,
    ioaddr => 16#700#, iomask => 16#fff#, spliten => CFG_SPLIT,
    sdcard => 0, readcmd => 16#0B#, dummybyte => 1, dualoutput => 0,
    scaler => 1, altscaler => 2)
  port map (rstn, clkm, ahbsi, ahbso(7), spmi, spmo);

  --QspiDB(3) <= '1'; QspiDB(2) <= '1';
  spi_QspiDB_2_pad : outpad generic map (tech => padtech)
    port map (QspiDB(2), '1');
  spi_QspiDB_3_pad : outpad generic map (tech => padtech)
    port map (QspiDB(3), '1');

--  spi_bdr : iopad generic map (tech => padtech)
--    port map (QspiDB(0), spmo.mosi, spmo.mosioen, spmi.mosi);
  spi_mosi_pad : outpad generic map (tech => padtech)
    port map (QspiDB(0), spmo.mosi);
  spi_miso_pad : inpad generic map (tech => padtech)
    port map (QspiDB(1), spmi.miso);
  spi_slvsel0_pad : outpad generic map (tech => padtech)
    port map (QspiCSn, spmo.csn);

  -- MACRO for assigning the SPI output clock
  spicclk: STARTUPE2
  port map (--CFGCLK => open, CFGMCLK => open, EOS => open, PREQ => open,
    CLK => '0', GSR => '0', GTS => '0', KEYCLEARB => '0', PACK => '0',
    USRCCLKO =>  spmo.sck, USRCCLKTS => '0', USRDONEO => '1', USRDONETS => '0' );

----------------------------------------------------------------------
---  DDR2 memory controller ------------------------------------------
----------------------------------------------------------------------
  noddr : if (CFG_DDR2SP+CFG_MIG_DDR2) = 0 generate lock <= '1'; end generate;

----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  -- APB Bridge
  apb0 : apbctrl
    generic map (hindex => 1, haddr => CFG_APBADDR)
    port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo);

  -- Interrupt controller
  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp
      generic map (pindex => 2, paddr => 2, ncpu => CFG_NCPU)
      port map (rstn, clkm, apbi, apbo(2), irqo, irqi);
  end generate;
  irq3 : if CFG_IRQ3_ENABLE = 0 generate
    x : for i in 0 to CFG_NCPU-1 generate
      irqi(i).irl <= "0000";
    end generate;
    apbo(2) <= apb_none;
  end generate;

  -- Time Unit
  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
                   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW,
                   ntimers => CFG_GPT_NTIM, nbits  => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex   => 1, paddr => 1, pirq => 2, console => dbguart, fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.rxd    <= rxd1;
    u1i.ctsn   <= '0';
    u1i.extclk <= '0';
    txd1       <= u1o.txd;
--    serrx_pad : inpad generic map (tech  => padtech) port map (dsurx, rxd1);
--    sertx_pad : outpad generic map (tech => padtech) port map (dsutx, txd1);
--    led(0) <= not rxd1;
--    led(1) <= not txd1;
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;


  nospi: if CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 0 generate
    apbo(7) <= apb_none;
  end generate;

-----------------------------------------------------------------------
---  ETHERNET ---------------------------------------------------------
-----------------------------------------------------------------------

  eth0 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm
      generic map(hindex => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
                  pindex => 15, paddr => 15, pirq => 12, memtech => memtech,
                  mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
                  nsync => 1, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
                  macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 7,
                  ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G, rmii => 1)
      port map(rst => rstn, clk => clkm, ahbmi => ahbmi,
               ahbmo => ahbmo(CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG),
               apbi => apbi, apbo => apbo(15), ethi => ethi, etho => etho);
      PhyRstn<=rstn;
  end generate;
  etxc_pad : outpad generic map (tech => padtech)
      port map (PhyClk50Mhz, eth_clk);
  ethpads : if (CFG_GRETH = 1) generate
    emdio_pad : iopad generic map (tech => padtech)
      port map (PhyMdio, etho.mdio_o, etho.mdio_oe, ethi.mdio_i);
	ethi.rmii_clk<=eth_clk90;
    erxd_pad : inpadv generic map (tech => padtech, width => 2) --8
      port map (PhyRxd, ethi.rxd(1 downto 0));
    erxer_pad : inpad generic map (tech => padtech)
      port map (PhyRxEr, ethi.rx_er);
    erxcr_pad : inpad generic map (tech => padtech)
      port map (PhyCrs, ethi.rx_crs);
	etxd_pad : outpadv generic map (tech => padtech, width => 2)
      port map (PhyTxd, etho.txd(1 downto 0));
    etxen_pad : outpad generic map (tech => padtech)
      port map (PhyTxEn, etho.tx_en);
    emdc_pad : outpad generic map (tech => padtech)
      port map (PhyMdc, etho.mdc);
  end generate;

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 6, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(6));
  end generate;
  nobpromgen : if CFG_AHBROMEN = 0 generate
     ahbso(6) <= ahbs_none;
  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ahbramgen : if CFG_AHBRAMEN = 1 generate
    ahbram0 : ahbram
      generic map (hindex => 3, haddr => CFG_AHBRADDR, tech => CFG_MEMTECH,
                   kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
      port map (rstn, clkm, ahbsi, ahbso(3));
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(3) <= ahbs_none; end generate;

-----------------------------------------------------------------------
--  Test report module, only used for simulation ----------------------
-----------------------------------------------------------------------

--pragma translate_off
  test0 : ahbrep generic map (hindex => 4, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(4));
--pragma translate_on

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+CFG_GRETH+1) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => "LEON3 Demonstration design for Digilent NEXYS 4 board",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

-----------------------------------------------------------------------
---  Ethernet Clock Generation  ---------------------------------------
-----------------------------------------------------------------------

  -- 50 MHz clock for output
  bufgclk0  : BUFG port map (I => eth_clk_nobuf, O => eth_clk);

  -- 50 MHz with +90 deg phase for Rx GRETH
  bufgclk45 : BUFG port map (I => eth_clk90_nobuf, O => eth_clk90);

  CLKFBIN <= CLKFBOUT;
  eth_pll_rst <= not cgi.pllrst;

  PLLE2_ADV_inst : PLLE2_ADV generic map (
    BANDWIDTH          => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
    CLKFBOUT_MULT      => 8,   -- Multiply value for all CLKOUT, (2-64)
    CLKFBOUT_PHASE     => 0.0, -- Phase offset in degrees of CLKFB, (-360.000-360.000).
    -- CLKIN_PERIOD: Input clock period in nS to ps resolution (i.e. 33.333 is 30 MHz).
    CLKIN1_PERIOD      => 1000000.0/real(100000.0),
    CLKIN2_PERIOD      => 0.0,
    -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for CLKOUT (1-128)
    CLKOUT0_DIVIDE     => 16,
    CLKOUT1_DIVIDE     => 16,
    CLKOUT2_DIVIDE     => 1,
    CLKOUT3_DIVIDE     => 1,
    CLKOUT4_DIVIDE     => 1,
    CLKOUT5_DIVIDE     => 1,
    -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for CLKOUT outputs (0.001-0.999).
    CLKOUT0_DUTY_CYCLE => 0.5,
    CLKOUT1_DUTY_CYCLE => 0.5,
    CLKOUT2_DUTY_CYCLE => 0.5,
    CLKOUT3_DUTY_CYCLE => 0.5,
    CLKOUT4_DUTY_CYCLE => 0.5,
    CLKOUT5_DUTY_CYCLE => 0.5,
    -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for CLKOUT outputs (-360.000-360.000).
    CLKOUT0_PHASE      => 0.0,
    CLKOUT1_PHASE      => 90.0,
    CLKOUT2_PHASE      => 0.0,
    CLKOUT3_PHASE      => 0.0,
    CLKOUT4_PHASE      => 0.0,
    CLKOUT5_PHASE      => 0.0,
    COMPENSATION       => "ZHOLD", -- ZHOLD, BUF_IN, EXTERNAL, INTERNAL
    DIVCLK_DIVIDE      => 1, -- Master division value (1-56)
    -- REF_JITTER: Reference input jitter in UI (0.000-0.999).
    REF_JITTER1        => 0.0,
    REF_JITTER2        => 0.0,
    STARTUP_WAIT       => "TRUE" -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
  )
  port map (
    -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
    CLKOUT0           => eth_clk_nobuf,
    CLKOUT1           => eth_clk90_nobuf,
    CLKOUT2           => open,
    CLKOUT3           => open,
    CLKOUT4           => open,
    CLKOUT5           => open,
    -- DRP Ports: 16-bit (each) output: Dynamic reconfigration ports
    DO                => open,
    DRDY              => open,
    -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
    CLKFBOUT          => CLKFBOUT,
    -- Status Ports: 1-bit (each) output: PLL status ports
    LOCKED            => open,
    -- Clock Inputs: 1-bit (each) input: Clock inputs
    CLKIN1            => clk,
    CLKIN2            => '0',
    -- Con trol Ports: 1-bit (each) input: PLL control ports
    CLKINSEL          => '1',
    PWRDWN            => '0',
    RST               => eth_pll_rst,
    -- DRP Ports: 7-bit (each) input: Dynamic reconfigration ports
    DADDR             => "0000000",
    DCLK              => '0',
    DEN               => '0',
    DI                => "0000000000000000",
    DWE               => '0',
    -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
    CLKFBIN           => CLKFBIN
  );
end rtl;

