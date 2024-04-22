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
-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2012 Aeroflex Gaisler
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
use gaisler.jtag.all;
use gaisler.i2c.all;
use gaisler.spi.all;
-- pragma translate_off
use gaisler.sim.all;
-- pragma translate_on
use work.config.all;

entity leon3mp is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;
    dbguart   : integer := CFG_DUART;
    pclow     : integer := CFG_PCLOW
  );
  port (
    clock_50      : in  std_logic;

    led           : inout std_logic_vector(7 downto 0);

    key           : in    std_logic_vector(1 downto 0);

    sw            : in    std_logic_vector(3 downto 0);

    dram_ba       : out   std_logic_vector(1 downto 0);
    dram_dqm      : out   std_logic_vector(1 downto 0);
    dram_ras_n    : out   std_ulogic;
    dram_cas_n    : out   std_ulogic;
    dram_cke      : out   std_ulogic;
    dram_clk      : out   std_ulogic;
    dram_we_n     : out   std_ulogic;
    dram_cs_n     : out   std_ulogic;
    dram_dq       : inout std_logic_vector(15 downto 0);
    dram_addr     : out   std_logic_vector(12 downto 0);

    epcs_data0    : in    std_ulogic;
    epcs_dclk     : out   std_ulogic;
    epcs_ncso     : out   std_ulogic;
    epcs_asdo     : out   std_ulogic;

    i2c_sclk      : inout std_logic;
    i2c_sdat      : inout std_logic;
    g_sensor_cs_n : out   std_ulogic;
    g_sensor_int  : in    std_ulogic;

    adc_cs_n      : out   std_ulogic;
    adc_saddr     : out   std_ulogic;
    adc_sclk      : out   std_ulogic;
    adc_sdat      : in    std_ulogic;

    gpio_2        : inout std_logic_vector(12 downto 0);
    gpio_2_in     : in    std_logic_vector(2 downto 0);
    
    gpio_1_in     : in    std_logic_vector(1 downto 0);
    gpio_1        : inout std_logic_vector(33 downto 0);

    gpio_0_in     : in    std_logic_vector(1 downto 0);
    gpio_0        : inout std_logic_vector(33 downto 0)

    );
end;

architecture rtl of leon3mp is

  signal vcc, gnd   : std_logic_vector(4 downto 0);
  signal clkm, rstn, rstraw, sdclkl, lclk, rst, clklck : std_ulogic;

  signal sdi   : sdctrl_in_type;
  signal sdo   : sdctrl_out_type;

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;
  
  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to CFG_NCPU-1);
  signal irqo : irq_out_vector(0 to CFG_NCPU-1);

  signal dbgi : l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo : l3_debug_out_vector(0 to CFG_NCPU-1);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type; 

  signal fpi : grfpu_in_vector_type;
  signal fpo : grfpu_out_vector_type;
  
  signal stati : ahbstat_in_type;

  signal gpti : gptimer_in_type;

  signal i2ci : i2c_in_type;
  signal i2co : i2c_out_type;

  signal spii : spi_in_type;
  signal spio : spi_out_type;
  signal slvsel : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);
  
  signal gpio0i, gpio1i, gpio2i : gpio_in_type;
  signal gpio0o, gpio1o, gpio2o : gpio_out_type;

  signal dsubren : std_ulogic;

  signal tck, tms, tdi, tdo : std_logic;
  
  constant BOARD_FREQ : integer := 50000;	-- Board frequency in KHz, used in clkgen
  constant CPU_FREQ : integer := BOARD_FREQ * CFG_CLKMUL / CFG_CLKDIV;
  constant IOAEN : integer := 1;
  constant OEPOL : integer := padoen_polarity(padtech);

begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------

  vcc <= (others => '1'); gnd <= (others => '0');

  clk_pad : clkpad generic map (tech => padtech) port map (clock_50, lclk); 

  clkgen0 : entity work.clkgen_de0
    generic map (clk_mul => CFG_CLKMUL, clk_div => CFG_CLKDIV, 
                 clk_freq => BOARD_FREQ, sdramen => CFG_SDCTRL)
    port map (inclk0 => lclk, c0 => clkm, c0_2x => open, e0 => sdclkl,
              locked => clklck);

  sdclk_pad : outpad generic map (tech => padtech, slew => 1) 
	port map (dram_clk, sdclkl);

  resetn_pad : inpad generic map (tech => padtech) port map (key(0), rst); 

  rst0 : rstgen			-- reset generator (reset is active LOW)
  port map (rst, clkm, clklck, rstn, rstraw);

----------------------------------------------------------------------
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------
  
  ahb0 : ahbctrl 		-- AHB arbiter/multiplexer
  generic map (defmast => CFG_DEFMST, split => CFG_SPLIT, 
               rrobin => CFG_RROBIN, ioaddr => CFG_AHBIO, ioen => IOAEN,
               nahbm => CFG_NCPU+CFG_AHB_JTAG,
               nahbs => 6) 
  port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
-----  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------
  
  cpu : for i in 0 to CFG_NCPU-1 generate
    nosh : if CFG_GRFPUSH = 0 generate    
      u0 : leon3s 		-- LEON3 processor      
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
      u0 : leon3sh 		-- LEON3 processor      
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

  
  errorn_pad : outpad generic map (tech => padtech) port map (led(6), dbgo(0).error);
  
  dsugen : if CFG_DSU = 1 generate
    dsu0 : dsu3			-- LEON3 Debug Support Unit
      generic map (hindex => 2, haddr => 16#900#, hmask => 16#F00#, 
                   ncpu => CFG_NCPU, tbits => 30, tech => memtech, irq => 0,
                   kbytes => CFG_ATBSZ)
      port map (rstn, clkm, ahbmi, ahbsi, ahbso(2), dbgo, dbgi, dsui, dsuo);

    dsuen_pad : inpad generic map (tech => padtech) port map (sw(0), dsui.enable);    
    dsubre_pad : inpad generic map (tech => padtech) port map (key(1), dsubren);
    dsui.break <= not dsubren;
    dsuact_pad : outpad generic map (tech => padtech) port map (led(7), dsuo.active);
  end generate; 
  nodsu : if CFG_DSU = 0 generate 
    ahbso(2) <= ahbs_none; dsuo.tstop <= '0'; dsuo.active <= '0';
  end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => CFG_NCPU)
      port map(rstn, clkm, tck, tms, tdi, tdo, ahbmi, ahbmo(CFG_NCPU),
               open, open, open, open, open, open, open, gnd(0));
  end generate;
  
----------------------------------------------------------------------
---  Memory controllers ----------------------------------------------
----------------------------------------------------------------------

  sdctrl0 : if CFG_SDCTRL = 1 generate 	-- 16-bit SDRAM controller
    sdc : entity work.sdctrl16
      generic map (hindex => 3, haddr => 16#400#, hmask => 16#FE0#, 
                   ioaddr => 1, fast => 0, pwron => 0, invclk => 0, 
                   sdbits => 16, pageburst => 2)
      port map (rstn, clkm, ahbsi, ahbso(3), sdi, sdo);
    sa_pad : outpadv generic map (width => 13, tech => padtech) 
      port map (dram_addr, sdo.address(14 downto 2));
    ba0_pad : outpadv generic map (tech => padtech, width => 2) 
      port map (dram_ba, sdo.address(16 downto 15));
    sd_pad : iopadvv generic map (width => 16, tech => padtech, oepol => OEPOL) 
      port map (dram_dq(15 downto 0), sdo.data(15 downto 0), sdo.vbdrive(15 downto 0), sdi.data(15 downto 0));
    sdcke_pad : outpad generic map (tech => padtech) 
      port map (dram_cke, sdo.sdcke(0)); 
    sdwen_pad : outpad generic map (tech => padtech) 
      port map (dram_we_n, sdo.sdwen);
    sdcsn_pad : outpad generic map (tech => padtech) 
      port map (dram_cs_n, sdo.sdcsn(0)); 
    sdras_pad : outpad generic map (tech => padtech) 
      port map (dram_ras_n, sdo.rasn);
    sdcas_pad : outpad generic map (tech => padtech) 
      port map (dram_cas_n, sdo.casn);
    sddqm_pad : outpadv generic map (tech => padtech, width => 2) 
      port map (dram_dqm, sdo.dqm(1 downto 0));
  end generate;

  spimctrl0: if CFG_SPIMCTRL /= 0 generate -- SPI Memory Controller
    spimc : spimctrl
      generic map (hindex => 0, hirq => 10, faddr => 16#000#, fmask  => 16#f00#,
                   ioaddr => 16#002#, iomask => 16#fff#,
                   spliten => CFG_SPLIT, oepol => OEPOL,sdcard => CFG_SPIMCTRL_SDCARD,
                   readcmd => CFG_SPIMCTRL_READCMD, dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                   dualoutput => CFG_SPIMCTRL_DUALOUTPUT, scaler => CFG_SPIMCTRL_SCALER,
                   altscaler => CFG_SPIMCTRL_ASCALER, pwrupcnt => CFG_SPIMCTRL_PWRUPCNT,
                   offset => CFG_SPIMCTRL_OFFSET)
      port map (rstn, clkm, ahbsi, ahbso(0), spmi, spmo);
  end generate;
  nospimctrl0 : if CFG_SPIMCTRL = 0 generate spmo <= spimctrl_out_none; end generate;
  
  miso_pad : inpad generic map (tech => padtech)
    port map (epcs_data0, spmi.miso);
  mosi_pad : outpad generic map (tech => padtech)
    port map (epcs_asdo, spmo.mosi);
  sck_pad  : outpad generic map (tech => padtech)
    port map (epcs_dclk, spmo.sck);
  slvsel0_pad : outpad generic map (tech => padtech)
    port map (epcs_ncso, spmo.csn);  
  
----------------------------------------------------------------------
---  AHB ROM ---------------------------------------------------------
----------------------------------------------------------------------

  bpromgen : if CFG_AHBROMEN /= 0 and CFG_SPIMCTRL = 0 generate
    brom : entity work.ahbrom
      generic map (hindex => 0, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map (rstn, clkm, ahbsi, ahbso(0));
  end generate;
  noprom : if CFG_AHBROMEN = 0 and CFG_SPIMCTRL = 0 generate
    ahbso(0) <= ahbs_none;
  end generate;
  
----------------------------------------------------------------------
---  APB Bridge and various peripherals ------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl				-- AHB/APB bridge
    generic map (hindex => 1, haddr => CFG_APBADDR)
    port map (rstn, clkm, ahbsi, ahbso(1), apbi, apbo);

  apbo(0) <= apb_none;                  -- Typically occupied by memory controller
  
  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart			-- UART 1
      generic map (pindex => 1, paddr => 1,  pirq => 2, console => dbguart,
                   fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(1), u1i, u1o);
    u1i.extclk <= '0';
    u1i.ctsn <= '0';
    u1i.rxd <= '1';
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate apbo(1) <= apb_none; end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp			-- interrupt controller
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
    timer0 : gptimer 			-- timer unit
      generic map (pindex => 3, paddr => 3, pirq => CFG_GPT_IRQ,
                   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW,
                   ntimers => CFG_GPT_NTIM, nbits => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(3), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(3) <= apb_none; end generate;
  
  i2cm: if CFG_I2C_ENABLE = 1 generate  -- I2C master
    i2c0 : i2cmst
      generic map (pindex => 4, paddr => 4, pmask => 16#FFF#,
                   pirq => 3, filter => 3, dynfilt => 1)
      port map (rstn, clkm, apbi, apbo(4), i2ci, i2co);
  end generate;
  noi2cm: if CFG_I2C_ENABLE = 0 generate
    i2co.scloen <= '1'; i2co.sdaoen <= '1';
    i2co.scl <= '0'; i2co.sda <= '0';
  end generate;
  i2c_scl_pad : iopad generic map (tech => padtech)
    port map (i2c_sclk, i2co.scl, i2co.scloen, i2ci.scl);
  i2c_sda_pad : iopad generic map (tech => padtech)
    port map (i2c_sdat, i2co.sda, i2co.sdaoen, i2ci.sda);

  spic: if CFG_SPICTRL_ENABLE = 1 generate  -- SPI controller
    spi1 : spictrl
      generic map (pindex => 5, paddr  => 5, pmask  => 16#fff#, pirq => 5,
                   fdepth => CFG_SPICTRL_FIFO, slvselen => CFG_SPICTRL_SLVREG,
                   slvselsz => CFG_SPICTRL_SLVS, odmode => 0, netlist => 0,
                   syncram => CFG_SPICTRL_SYNCRAM, ft => CFG_SPICTRL_FT)
      port map (rstn, clkm, apbi, apbo(5), spii, spio, slvsel);
    spii.spisel <= '1';                 -- Master only
    spii.astart <= '0';
    miso_pad : inpad generic map (tech => padtech)
      port map (adc_sdat, spii.miso);
    mosi_pad : outpad generic map (tech => padtech)
      port map (adc_saddr, spio.mosi);
    sck_pad  : outpad generic map (tech => padtech)
      port map (adc_sclk, spio.sck);
    slvsel_pad : outpad generic map (tech => padtech)
      port map (adc_cs_n, slvsel(0));
  end generate spic;
  nospi: if CFG_SPICTRL_ENABLE = 0 generate
    miso_pad : inpad generic map (tech => padtech)
      port map (adc_sdat, spii.miso);
    mosi_pad : outpad generic map (tech => padtech)
      port map (adc_saddr, vcc(0));
    sck_pad  : outpad generic map (tech => padtech)
      port map (adc_sclk, gnd(0));
    slvsel_pad : outpad generic map (tech => padtech)
      port map (adc_cs_n, vcc(0));
  end generate;

  gpio0 : if CFG_GRGPIO_ENABLE /= 0 generate     -- GRGPIO0 port
    grgpio0: grgpio
      generic map( pindex => 9, paddr => 9, imask => CFG_GRGPIO_IMASK, nbits => CFG_GRGPIO_WIDTH)
      port map( rstn, clkm, apbi, apbo(9), gpio0i, gpio0o);
    pio_pads : for i in 0 to CFG_GRGPIO_WIDTH-1 generate
      pio_pad : iopad generic map (tech => padtech)
        port map (gpio_0(i), gpio0o.dout(i), gpio0o.oen(i), gpio0i.din(i));
    end generate;
  end generate;
  nogpio0: if CFG_GRGPIO_ENABLE = 0 generate apbo(9) <= apb_none; end generate;

  gpio1 : if CFG_GRGPIO2_ENABLE /= 0 generate     -- GRGPIO1 port
    grgpio1: grgpio
      generic map( pindex => 10, paddr => 10, imask => CFG_GRGPIO2_IMASK, nbits => CFG_GRGPIO2_WIDTH)
      port map( rstn, clkm, apbi, apbo(10), gpio1i, gpio1o);
    pio_pads : for i in 0 to CFG_GRGPIO2_WIDTH-1 generate
      pio_pad : iopad generic map (tech => padtech)
        port map (gpio_1(i), gpio1o.dout(i), gpio1o.oen(i), gpio1i.din(i));
    end generate;
  end generate;
  nogpio1: if CFG_GRGPIO2_ENABLE = 0 generate apbo(10) <= apb_none; end generate;

  grgpio2: grgpio                       -- GRGPIO2 port
    generic map( pindex => 11, paddr => 11, imask => 2**30, nbits => 31)
    port map( rstn, clkm, apbi, apbo(11), gpio2i, gpio2o);
  gpio_2_pads :  iopadvv generic map (tech => padtech, width => 13)
    port map (gpio_2(12 downto 0), gpio2o.dout(12 downto 0), gpio2o.oen(12 downto 0),
              gpio2i.din(12 downto 0));
  gpio_2_inpads : inpadv generic map (tech => padtech, width => 3)
    port map (gpio_2_in, gpio2i.din(15 downto 13));
  gpio_0_pads :  iopadvv generic map (tech => padtech, width => 2)
    port map (gpio_0(33 downto 32), gpio2o.dout(17 downto 16), gpio2o.oen(17 downto 16),
              gpio2i.din(17 downto 16));
  gpio_0_inpads : inpadv generic map (tech => padtech, width => 2)
    port map (gpio_0_in, gpio2i.din(19 downto 18));
  gpio_1_pads :  iopadvv generic map (tech => padtech, width => 2)
    port map (gpio_1(33 downto 32), gpio2o.dout(21 downto 20), gpio2o.oen(21 downto 20),
              gpio2i.din(21 downto 20));
  gpio_1_inpads : inpadv generic map (tech => padtech, width => 2)
    port map (gpio_1_in, gpio2i.din(23 downto 22));
  led_pads :  iopadvv generic map (tech => padtech, width => 6)
    port map (led(5 downto 0), gpio2o.dout(29 downto 24), gpio2o.oen(29 downto 24),
              gpio2i.din(29 downto 24));
  g_sensor_int_pad : inpad generic map (tech => padtech)
    port map (g_sensor_int, gpio2i.din(30));
--  g_sensor_cs_n_pad : outpad generic map (tech => padtech)
--    port map (g_sensor_cs_n, gpio2o.dout(31));
  g_sensor_cs_n <= '1';
--  gpio2i.din(31) <= gpio2o.dout(31);
  
  ahbs : if CFG_AHBSTAT = 1 generate	-- AHB status register
    stati <= ahbstat_in_none;
    ahbstat0 : ahbstat generic map (pindex => 15, paddr => 15, pirq => 1, nftslv => CFG_AHBSTATN)
      port map (rstn, clkm, ahbmi, ahbsi, stati, apbi, apbo(15));
  end generate;
  nop2 : if CFG_AHBSTAT = 0 generate apbo(15) <= apb_none; end generate;

-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------

  ocram : if CFG_AHBRAMEN = 1 generate 
    ahbram0 : ahbram generic map (hindex => 7, haddr => CFG_AHBRADDR, 
	tech => CFG_MEMTECH, kbytes => CFG_AHBRSZ)
    port map (rstn, clkm, ahbsi, ahbso(4));
  end generate;
  nram : if CFG_AHBRAMEN = 0 generate ahbso(4) <= ahbs_none; end generate;

-----------------------------------------------------------------------
---  Test report module  ----------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  test0 : ahbrep generic map (hindex => 5, haddr => 16#200#)
   port map (rstn, clkm, ahbsi, ahbso(5));
-- pragma translate_on

-----------------------------------------------------------------------
---  Boot message  ----------------------------------------------------
-----------------------------------------------------------------------

-- pragma translate_off
  x : report_design
  generic map (
   msg1 => "LEON3 Altera DE0-EP4CE22 Demonstration design",
   fabtech => tech_table(fabtech), memtech => tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on
end;

