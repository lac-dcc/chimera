------------------------------------------------------------------------------
--  LEON3 Demonstration design
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
use gaisler.jtag.all;
--pragma translate_off
use gaisler.sim.all;
library unisim;
use unisim.STARTUPE2;
--pragma translate_on
use work.config.all;


entity leon3mp is
  generic (
    fabtech                 : integer := CFG_FABTECH;
    memtech                 : integer := CFG_MEMTECH;
    padtech                 : integer := CFG_PADTECH;
    clktech                 : integer := CFG_CLKTECH;
    disas                   : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart                 : integer := CFG_DUART;     -- Print UART on console
    pclow                   : integer := CFG_PCLOW;
    use_ahbram_sim          : integer := 0
    );
  port (
    clk                : in    std_ulogic;
    -- Switches
    sw                 : in    std_logic_vector(15 downto 0);
    -- LEDs
    led                : out   std_logic_vector(15 downto 0);
    -- Buttons
    btnc               : in    std_ulogic;
    btnu               : in    std_ulogic;
    btnl               : in    std_ulogic;
    btnr               : in    std_ulogic;
    btnd               : in    std_ulogic;
    -- VGA connector
    vgared             : out   std_logic_vector(3 downto 0);
    vgablue            : out   std_logic_vector(3 downto 0);
    vgagreen           : out   std_logic_vector(3 downto 0);
    hsync              : out   std_ulogic;
    vsync              : out   std_ulogic;
    -- USB-RS232 interface
    rstx               : in    std_logic;
    rsrx               : out   std_logic;
    -- SPI
--pragma translate_off
    spi_sim_sck        : out   std_ulogic;
--pragma translate_on
    qspicsn            : out   std_ulogic;
    qspidb             : inout std_logic_vector(3 downto 0)
    );
end;

architecture rtl of leon3mp is

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
  
  signal vcc : std_logic;
  signal gnd : std_logic;

  signal gpioi : gpio_in_type;
  signal gpioo : gpio_out_type;

  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi : clkgen_in_type;
  signal cgo, cgo1 : clkgen_out_type;

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;

  signal gpti : gptimer_in_type;

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;

  signal clkm : std_ulogic
  -- pragma translate_off 
  := '0'
  -- pragma translate_on
  ;
  
  signal rstn : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_ulogic;
  signal lbtnc              : std_ulogic;
  
  -- RS232 APB Uart
  signal rxd1 : std_logic;
  signal txd1 : std_logic;

  attribute keep                     : boolean;
  attribute syn_keep                 : boolean;
  attribute syn_preserve             : boolean;
  attribute syn_keep of clkm         : signal is true;
  attribute syn_preserve of clkm     : signal is true;
  attribute keep of clkm             : signal is true;

  constant BOARD_FREQ : integer := 100000;                                -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;  -- cpu frequency in KHz

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= '1';
  gnd <= '0';

  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;


  btnc_pad : inpad generic map (tech  => padtech) port map (btnc, lbtnc);
  
  rst0 : rstgen generic map (acthigh => 1)
    port map (lbtnc, clkm, cgo.clklock, rstn, rstraw);

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
                 nahbm => CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG,
                 nahbs => 6)
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
                     CFG_NCPU-1, CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR,
                     CFG_REX, CFG_ALTWIN)
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
    dui.rxd <= rxd1;
  end generate;
  nouah : if CFG_AHB_UART = 0 generate apbo(4) <= apb_none; end generate;

  urx_pad : inpad generic map (tech  => padtech) port map (rstx, rxd1);
  utx_pad : outpad generic map (tech => padtech) port map (rsrx, txd1);
  txd1 <= duo.txd when sw(0) = '1' else u1o.txd;
  
  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU+CFG_AHB_UART)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU+CFG_AHB_UART),
               open, open, open, open, open, open, open, gnd);
  end generate;

----------------------------------------------------------------------
---  SPI Memory controller -------------------------------------------
----------------------------------------------------------------------
  spi_gen: if CFG_SPIMCTRL = 1 generate
    -- OPTIONALY set the offset generic (only affect reads).
    -- The first 4MB are used for loading the FPGA.
    -- For dual ouptut: readcmd => 16#3B#, dualoutput => 1
    spimctrl1 : spimctrl
      generic map (hindex => 0, hirq => 7, faddr => 16#000#, fmask => 16#ff0#,
                   ioaddr => 16#700#, iomask => 16#fff#, spliten => CFG_SPLIT,
                   sdcard => CFG_SPIMCTRL_SDCARD, readcmd => CFG_SPIMCTRL_READCMD,
                   dummybyte => CFG_SPIMCTRL_DUMMYBYTE, 
                   dualoutput => CFG_SPIMCTRL_DUALOUTPUT, scaler => CFG_SPIMCTRL_SCALER,
                   altscaler => CFG_SPIMCTRL_ASCALER)
      port map (rstn, clkm, ahbsi, ahbso(0), spmi, spmo);

    spi_mosi_pad : outpad generic map (tech => padtech)
      port map (qspidb(0), spmo.mosi);
    spi_miso_pad : inpad generic map (tech => padtech)
      port map (qspidb(1), spmi.miso);
    spi_slvsel0_pad : outpad generic map (tech => padtech)
      port map (qspicsn, spmo.csn);
    --spi_sck_pad : outpad generic map (tech => padtech) -- FIXME
    --  port map (scl, spmo.sck);

    spicclk: STARTUPE2
      port map (--CFGCLK => open, CFGMCLK => open, EOS => open, PREQ => open,
        CLK => '0', GSR => '0', GTS => '0', KEYCLEARB => '0', PACK => '0',
        USRCCLKO =>  spmo.sck, USRCCLKTS => '0', USRDONEO => '1', USRDONETS => '0' );
    --pragma translate_off
    spi_sim_sck <= spmo.sck;
    --pragma translate_on
    
  end generate;

  nospi: if CFG_SPIMCTRL = 0 generate
      ahbso(0) <= ahbs_none;
  end generate;

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

  -- Timer Unit
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
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 4, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(4));
  end generate;
  nobpromgen : if CFG_AHBROMEN = 0 generate
     ahbso(4) <= ahbs_none;
  end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ahbramgen : if CFG_AHBRAMEN = 1 generate
--pragma translate_off
    phys : if use_ahbram_sim = 0 generate
--pragma translate_on
    ahbram0 : ahbram
      generic map (hindex => 3, haddr => CFG_AHBRADDR, tech => CFG_MEMTECH,
                   kbytes => CFG_AHBRSZ, pipe => CFG_AHBRPIPE)
      port map (rstn, clkm, ahbsi, ahbso(3));
--pragma translate_off
    end generate;
    simram : if use_ahbram_sim /= 0 generate
      ahbram0 : ahbram_sim
      generic map (hindex => 3, haddr => CFG_AHBRADDR, tech => CFG_MEMTECH,
                   kbytes => 1024, pipe => CFG_AHBRPIPE, fname => "ram.srec")
      port map (rstn, clkm, ahbsi, ahbso(3));
    end generate;
--pragma translate_on
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(3) <= ahbs_none; end generate;

-----------------------------------------------------------------------
--  Test report module, only used for simulation ----------------------
-----------------------------------------------------------------------

--pragma translate_off
  test0 : ahbrep generic map (hindex => 5, haddr => 16#200#)
    port map (rstn, clkm, ahbsi, ahbso(5));
--pragma translate_on

-----------------------------------------------------------------------
---  Drive unused bus elements  ---------------------------------------
-----------------------------------------------------------------------

  nam1 : for i in (CFG_NCPU+CFG_AHB_UART+CFG_AHB_JTAG+1) to NAHBMST-1 generate
    ahbmo(i) <= ahbm_none;
  end generate;

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
    generic map (
      msg1 => "LEON3 Demonstration design for Digilent Basys3 board",
      fabtech => tech_table(fabtech), memtech => tech_table(memtech),
      mdel => 1
      );
-- pragma translate_on

end rtl;
