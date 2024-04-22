------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2004 Jiri Gaisler, Gaisler Research
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
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.jtag.all;
use gaisler.i2c.all;
use gaisler.net.all;
--pragma translate_off
use gaisler.sim.all;
--pragma translate_on
library esa;
use esa.memoryctrl.all;
use work.config.all;

entity leon3mp is
  generic (
    fabtech : integer := CFG_FABTECH;
    memtech : integer := CFG_MEMTECH;
    padtech : integer := CFG_PADTECH;
    disas   : integer := CFG_DISAS;     -- Enable disassembly to console
    dbguart : integer := CFG_DUART;     -- Print UART on console
    pclow   : integer := CFG_PCLOW
    );
  port (

    -- Clock and reset
    diff_clkin_top_125_p: in std_ulogic;
    diff_clkin_bot_125_p: in std_ulogic;
    clkin_50_fpga_right: in std_ulogic;
    clkin_50_fpga_top: in std_ulogic;
    clkout_sma: out std_ulogic;
    cpu_resetn: in std_ulogic;

    -- DDR3
    ddr3_ck_p: out std_ulogic;
    ddr3_ck_n: out std_ulogic;
    ddr3_cke: out std_ulogic;
    ddr3_rstn: out std_ulogic;
    ddr3_csn: out std_ulogic;
    ddr3_rasn: out std_ulogic;
    ddr3_casn: out std_ulogic;
    ddr3_wen: out std_ulogic;
    ddr3_ba: out std_logic_vector(2 downto 0);
    ddr3_a : out std_logic_vector(13 downto 0);
    ddr3_dqs_p: inout std_logic_vector(3 downto 0);
    ddr3_dqs_n: inout std_logic_vector(3 downto 0);
    ddr3_dq: inout std_logic_vector(31 downto 0);
    ddr3_dm: out std_logic_vector(3 downto 0);
    ddr3_odt: out std_ulogic;
    ddr3_oct_rzq: in std_ulogic;

    -- LPDDR2
    lpddr2_ck_p: out std_ulogic;
    lpddr2_ck_n: out std_ulogic;
    lpddr2_cke: out std_ulogic;
    lpddr2_a: out std_logic_vector(9 downto 0);
    lpddr2_dqs_p: inout std_logic_vector(1 downto 0);
    lpddr2_dqs_n: inout std_logic_vector(1 downto 0);
    lpddr2_dq: inout std_logic_vector(15 downto 0);
    lpddr2_dm: out std_logic_vector(1 downto 0);
    lpddr2_csn: out std_ulogic;
    lpddr2_oct_rzq: in std_ulogic;

    -- Flash and SSRAM interface
    fm_a: out std_logic_vector(26 downto 1);
    fm_d: in std_logic_vector(15 downto 0);
    flash_clk: out std_ulogic;
    flash_resetn: out std_ulogic;
    flash_cen: out std_ulogic;          -- Driven const low by MAXV CPLD?
    flash_advn: out std_ulogic;
    flash_wen: out std_ulogic;
    flash_oen: out std_ulogic;
    flash_rdybsyn: in std_ulogic;
    ssram_clk: out std_ulogic;
    ssram_oen: out std_ulogic;
    sram_cen: out std_ulogic;
    ssram_bwen: out std_ulogic;
    ssram_bwan: out std_ulogic;
    ssram_bwbn: out std_ulogic;
    ssram_adscn: out std_ulogic;
    ssram_adspn: out std_ulogic;
    ssram_zzn: out std_ulogic;          -- Name incorrect, this is active high
    ssram_advn: out std_ulogic;

    -- EEPROM
    eeprom_scl    : inout std_ulogic;
    eeprom_sda    : inout std_ulogic;

    -- UART
    uart_rxd      : in  std_ulogic;
    uart_rts      : in  std_ulogic;     -- Note CTS and RTS mixed up on PCB
    uart_txd      : out std_ulogic;
    uart_cts      : out std_ulogic;

    -- USB UART Interface
    usb_uart_rstn     : in std_ulogic;  -- inout
    usb_uart_ri       : in    std_ulogic;
    usb_uart_dcd      : in    std_ulogic;
    usb_uart_dtr      : out   std_ulogic;
    usb_uart_dsr      : in    std_ulogic;
    usb_uart_txd      : out   std_ulogic;
    usb_uart_rxd      : in    std_ulogic;
    usb_uart_rts      : in    std_ulogic;
    usb_uart_cts      : out   std_ulogic;
    usb_uart_gpio2    : in    std_ulogic;
    usb_uart_suspend  : in    std_ulogic;
    usb_uart_suspendn : in    std_ulogic;

    -- Ethernet port A
    eneta_rx_clk: in std_ulogic;
    eneta_tx_clk: in std_ulogic;
    eneta_intn: in std_ulogic;
    eneta_resetn: out std_ulogic;
    eneta_mdio: inout std_ulogic;
    eneta_mdc: out std_ulogic;
    eneta_rx_er: in std_ulogic;
    eneta_tx_er: out std_ulogic;
    eneta_rx_col: in std_ulogic;
    eneta_rx_crs: in std_ulogic;
    eneta_tx_d: out std_logic_vector(3 downto 0);
    eneta_rx_d: in std_logic_vector(3 downto 0);
    eneta_gtx_clk: out std_ulogic;
    eneta_tx_en: out std_ulogic;
    eneta_rx_dv: in std_ulogic;

    -- Ethernet port B
    enetb_rx_clk: in std_ulogic;
    enetb_tx_clk: in std_ulogic;
    enetb_intn: in std_ulogic;
    enetb_resetn: out std_ulogic;
    enetb_mdio: inout std_ulogic;
    enetb_mdc: out std_ulogic;
    enetb_rx_er: in std_ulogic;
    enetb_tx_er: out std_ulogic;
    enetb_rx_col: in std_ulogic;
    enetb_rx_crs: in std_ulogic;
    enetb_tx_d: out std_logic_vector(3 downto 0);
    enetb_rx_d: in std_logic_vector(3 downto 0);
    enetb_gtx_clk: out std_ulogic;
    enetb_tx_en: out std_ulogic;
    enetb_rx_dv: in std_ulogic;

    -- LEDs, switches, GPIO
    user_led      : out   std_logic_vector(3 downto 0);
    user_dipsw    : in    std_logic_vector(3 downto 0);
    dip_3p3V      : in    std_ulogic;
    user_pb       : in    std_logic_vector(3 downto 0);
    overtemp_fpga : out   std_ulogic;
    header_p      : in    std_logic_vector(5 downto 0);  -- inout
    header_n      : in    std_logic_vector(5 downto 0);  -- inout
    header_d      : in    std_logic_vector(7 downto 0);  -- inout

    -- LCD
    lcd_data      : in std_logic_vector(7 downto 0);  -- inout
    lcd_wen       : out std_ulogic;
    lcd_csn       : out std_ulogic;
    lcd_d_cn      : out std_ulogic;

    -- HIGH-SPEED-MEZZANINE-CARD Interface
    -- This has been commented out as some pins have been placed in
    -- violation with the Altera diff pad keep-out rules.
--    hsmc_clk_in0: in std_ulogic;
--    hsmc_clk_out0: out std_ulogic;       -- changed due to placement rule
--    hsmc_clk_in_p: in std_logic_vector(2 downto 1);
--    hsmc_clk_out_p: out std_logic_vector(2 downto 1);
--    hsmc_d: in std_logic_vector(3 downto 0);  -- inout
--    hsmc_tx_d_p: out std_logic_vector(16 downto 0);
--    hsmc_rx_d_p: in std_logic_vector(16 downto 0);
--    hsmc_rx_led: out std_ulogic;
--    hsmc_tx_led: out std_ulogic;
--    hsmc_scl: out std_ulogic;            -- in due to placement rule
--    hsmc_sda: in std_ulogic;         -- inout
--    hsmc_prsntn: in std_ulogic;

    -- MAX V CPLD interface
    max5_csn: out std_ulogic;
    max5_wen: out std_ulogic;
    max5_oen: out std_ulogic;
    max5_ben: out std_logic_vector(3 downto 0);
    max5_clk: out std_ulogic;

    -- USB Blaster II
    usb_clk       : in std_ulogic;
    usb_data      : in std_logic_vector(7 downto 0);  -- inout
    usb_addr      : in std_logic_vector(1 downto 0);  -- inout
    usb_scl       : in std_ulogic;   -- inout
    usb_sda       : in std_ulogic;   -- inout
    usb_resetn    : in std_ulogic;
    usb_oen       : in std_ulogic;
    usb_rdn       : in std_ulogic;
    usb_wrn       : in std_ulogic;
    usb_full      : out std_ulogic;
    usb_empty     : out std_ulogic;
    fx2_resetn    : in std_ulogic

    );
end;

architecture rtl of leon3mp is

  constant USE_AHBREP: integer := 0
--pragma translate_off
                                  +1
--pragma translate_on
                                  ;

  -- Bus indexes
  constant hmi_cpu     : integer := 0;
  constant hmi_greth1  : integer := hmi_cpu     + CFG_NCPU;
  constant hmi_greth2  : integer := hmi_greth1  + CFG_GRETH;
  constant hmi_ahbuart : integer := hmi_greth2  + CFG_GRETH2;
  constant hmi_ahbjtag : integer := hmi_ahbuart + CFG_AHB_UART;
  constant nahbm       : integer := hmi_ahbjtag + CFG_AHB_JTAG;

  constant hsi_ssrctrl : integer := 0;
  constant hsi_apbctrl : integer := hsi_ssrctrl + (CFG_SSCTRL + CFG_AHBROMEN + 1)/2;
  constant hsi_dsu     : integer := hsi_apbctrl + 1;
  constant hsi_ddr3    : integer := hsi_dsu     + CFG_DSU;
  constant hsi_lpddr2  : integer := hsi_ddr3    + 1;
  constant hsi_ahbrep  : integer := hsi_lpddr2  + 1;
  constant nahbs       : integer := hsi_ahbrep  + USE_AHBREP;

  constant pi_irqmp   : integer := 0;
  constant pi_apbuart : integer := pi_irqmp   + CFG_IRQ3_ENABLE;
  constant pi_gpt     : integer := pi_apbuart + CFG_UART1_ENABLE;
  constant pi_ahbuart : integer := pi_gpt     + CFG_GPT_ENABLE;
  constant pi_ssrctrl : integer := pi_ahbuart + CFG_AHB_UART;
  constant pi_greth1  : integer := pi_ssrctrl + CFG_SSCTRL;
  constant pi_greth2  : integer := pi_greth1  + CFG_GRETH;
  constant pi_i2cmst  : integer := pi_greth2  + CFG_GRETH2;
  constant napbs      : integer := pi_i2cmst  + CFG_I2C_ENABLE;

  constant CPU_FREQ  : integer := 75000;

  signal clklock: std_ulogic;
  signal clkm: std_ulogic;
  signal ssclk: std_ulogic;
  signal rstn: std_ulogic;

  signal ahbmi: ahb_mst_in_type;
  signal ahbmo: ahb_mst_out_vector;
  signal ahbsi: ahb_slv_in_type;
  signal ahbso: ahb_slv_out_vector;
  signal apbi: apb_slv_in_type;
  signal apbo: apb_slv_out_vector;

  signal irqi: irq_in_vector(CFG_NCPU-1 downto 0);
  signal irqo: irq_out_vector(CFG_NCPU-1 downto 0);
  signal dbgi: l3_debug_in_vector(0 to CFG_NCPU-1);
  signal dbgo: l3_debug_out_vector(0 to CFG_NCPU-1);
  signal dsui: dsu_in_type;
  signal dsuo: dsu_out_type;
  signal gpti: gptimer_in_type;

  signal sri: memory_in_type;
  signal sro: memory_out_type;
  signal del_addr: std_logic_vector(26 downto 1);
  signal del_ce: std_logic;
  signal del_bwe, del_bwa, del_bwb: std_logic_vector(1 downto 0);

  signal ui_serial, ui_usb, ui, dui: uart_in_type;
  signal uo_serial, uo_usb, uo, duo: uart_out_type;

  signal ethi1,ethi2: eth_in_type;
  signal etho1,etho2: eth_out_type;
  
  signal i2ci: i2c_in_type;
  signal i2co: i2c_out_type;
  
  signal vcc, gnd: std_ulogic;

--  signal logsig: std_logic_vector(31 downto 0);

begin

  vcc <= '1';
  gnd <= '0';

  -----------------------------------------------------------------------------
  -- Clocking and reset
  -----------------------------------------------------------------------------

  user_led(0) <= not clklock;
  
  clkgen0: entity work.clkgen_c5ekit
    port map (clkin_50_fpga_right, clkm, open, clklock);

  rstgen0: rstgen
    generic map (syncrst => CFG_NOASYNC)
    port map (cpu_resetn, clkm, clklock, rstn);

  -----------------------------------------------------------------------------
  -- AMBA bus fabric
  -----------------------------------------------------------------------------

  ahbctrl0: ahbctrl
    generic map (defmast => CFG_DEFMST, split => CFG_SPLIT,
                 rrobin => CFG_RROBIN,ioaddr => CFG_AHBIO, fpnpen => CFG_FPNPEN,
                 enbusmon => CFG_AHB_MON, assertwarn => CFG_AHB_MONWAR,
                 asserterr => CFG_AHB_MONERR, ahbtrace => CFG_AHB_DTRACE,
                 nahbm => nahbm, nahbs => nahbs)
    port map (rstn,clkm,ahbmi,ahbmo,ahbsi,ahbso);

  apbctrl0: apbctrl
    generic map (hindex => hsi_apbctrl, haddr => CFG_APBADDR, nslaves => napbs)
    port map (rstn,clkm,ahbsi,ahbso(hsi_apbctrl),apbi,apbo);

  ahbmo(ahbmo'high downto nahbm) <= (others => ahbm_none);
  ahbso(ahbso'high downto nahbs) <= (others => ahbs_none);
  apbo(napbs to apbo'high) <= (others => apb_none);
  
  -----------------------------------------------------------------------------
  -- LEON3 Processor(s), DSU, timer and IRQ controller
  -----------------------------------------------------------------------------

  errorn_pad : outpad generic map (tech => padtech) port map (user_led(3), dbgo(0).error);
  dsubre_pad : inpad generic map (tech  => padtech) port map (user_pb(3), dsui.break);
  user_led(2) <= not dsuo.active;
  dsui.enable <= '1';

  l3 : if CFG_LEON3 = 1 generate
    cpu : for i in 0 to CFG_NCPU-1 generate
      u0 : leon3s                         -- LEON3 processor
        generic map (i, fabtech, memtech, CFG_NWIN, CFG_DSU, CFG_FPU, CFG_V8,
                   0, CFG_MAC, pclow, CFG_NOTAG, CFG_NWP, CFG_ICEN, CFG_IREPL, CFG_ISETS, CFG_ILINE,
                   CFG_ISETSZ, CFG_ILOCK, CFG_DCEN, CFG_DREPL, CFG_DSETS, CFG_DLINE, CFG_DSETSZ,
                   CFG_DLOCK, CFG_DSNOOP, CFG_ILRAMEN, CFG_ILRAMSZ, CFG_ILRAMADDR, CFG_DLRAMEN,
                   CFG_DLRAMSZ, CFG_DLRAMADDR, CFG_MMUEN, CFG_ITLBNUM, CFG_DTLBNUM, CFG_TLB_TYPE, CFG_TLB_REP,
                   CFG_LDDEL, disas, CFG_ITBSZ, CFG_PWD, CFG_SVT, CFG_RSTADDR, CFG_NCPU-1,
                   CFG_DFIXED, CFG_SCAN, CFG_MMU_PAGE, CFG_BP, CFG_NP_ASI, CFG_WRPSR)
        port map (clkm, rstn, ahbmi, ahbmo(i), ahbsi, ahbso,
                irqi(i), irqo(i), dbgi(i), dbgo(i));
    end generate;

    dsugen : if CFG_DSU = 1 generate
      dsu0 : dsu3                         -- LEON3 Debug Support Unit
        generic map (hindex => hsi_dsu, haddr => 16#900#, hmask => 16#F00#,
                   ncpu   => CFG_NCPU, tbits => 30, tech => memtech, irq => 0, kbytes => CFG_ATBSZ)
        port map (rstn, clkm, ahbmi, ahbsi, ahbso(hsi_dsu), dbgo, dbgi, dsui, dsuo);
    end generate;
  end generate;
  noleon: if CFG_LEON3 = 0 generate
    irqo <= (others => ('0',"0000",'0','0','0'));
    dbgo <= (others => dbgo_none);
  end generate;
  nodsu : if CFG_DSU = 0 or CFG_LEON3 = 0 generate
    dsuo.tstop <= '0'; dsuo.active <= '0'; dsuo.pwd <= (others => '0');
  end generate;

  irqctrl : if CFG_IRQ3_ENABLE /= 0 generate
    irqctrl0 : irqmp                    -- interrupt controller
      generic map (pindex => pi_irqmp, paddr => 2, ncpu => CFG_NCPU)
      port map (rstn, clkm, apbi, apbo(pi_irqmp), irqo, irqi);
  end generate;

  gpt : if CFG_GPT_ENABLE /= 0 generate
    timer0 : gptimer                    -- timer unit
      generic map (pindex => pi_gpt, paddr => 3, pirq => CFG_GPT_IRQ,
                   sepirq => CFG_GPT_SEPIRQ, sbits => CFG_GPT_SW, ntimers => CFG_GPT_NTIM,
                   nbits  => CFG_GPT_TW)
      port map (rstn, clkm, apbi, apbo(pi_gpt), gpti, open);
    gpti <= gpti_dhalt_drive(dsuo.tstop);
  end generate;

  -----------------------------------------------------------------------------
  -- Debug links
  -----------------------------------------------------------------------------

  dcomgen : if CFG_AHB_UART = 1 generate
    dcom0 : ahbuart                     -- Debug UART
      generic map (hindex => hmi_ahbuart, pindex => pi_ahbuart, paddr => 7)
      port map (rstn, clkm, dui, duo, apbi, apbo(pi_ahbuart), ahbmi, ahbmo(hmi_ahbuart));
  end generate;
  nouah : if CFG_AHB_UART = 0 generate
    duo.rtsn <= '0'; duo.txd <= '0';
    duo.scaler <= (others => '0'); duo.txen <= '0';
    duo.flow <= '0'; duo.rxen <= '0';
  end generate;

  ahbjtaggen0 :if CFG_AHB_JTAG = 1 generate
    ahbjtag0 : ahbjtag generic map(tech => fabtech, hindex => hmi_ahbjtag, nsync => 2)
      port map(rstn, clkm, gnd, gnd, gnd, open, ahbmi, ahbmo(hmi_ahbjtag),
               open, open, open, open, open, open, open, gnd);
  end generate;

  -- EDCL included in Ethernet below

  -----------------------------------------------------------------------------
  -- Memory controllers
  -----------------------------------------------------------------------------

  fm_a <= del_addr; -- sro.address(26 downto 1);
--  fm_d_pad: iopadvv
--    generic map (tech => padtech, width => 16)
--    port map (pad => fm_d, i => sro.data(31 downto 16),
--              en => sro.vbdrive(31 downto 16), o => sri.data(31 downto 16));
  sri.data(31 downto 16) <= fm_d;
  flash_clk <= '0';
  flash_resetn <= '1';
  flash_cen <= '0'; -- sro.romsn(0);
  flash_advn <= '0';
  flash_wen <= sro.writen or sro.romsn(0);
  flash_oen <= sro.oen or sro.romsn(0);
  ssram_clk <= clkm;
  ssram_oen <= sro.oen;
  sram_cen <= del_ce; -- sro.ramsn(0);
  ssram_bwen <= del_bwe(1); -- sro.writen;
  ssram_bwan <= del_bwa(1); -- sro.wrn(0);
  ssram_bwbn <= del_bwb(1); -- sro.wrn(1);
  ssram_adscn <= '1';
  ssram_adspn <= '0';
  ssram_zzn <= '0';
  ssram_advn <= '1';

  sri.data(15 downto 0) <= sri.data(31 downto 16);
  sri.brdyn <= '1';
  sri.bexcn <= '1';
  sri.writen <= '1';
  sri.wrn <= (others => '1');
  sri.bwidth <= "01";
  sri.sd <= (others => '0');
  sri.cb <= (others => '0');
  sri.scb <= (others => '0');
  sri.edac <= '0';

  delproc: process(clkm)
  begin
    if rising_edge(clkm) then
      del_addr <= sro.address(26 downto 1);
      del_ce <= sro.ramsn(0);
      del_bwe <= del_bwe(0) & sro.writen;
      del_bwa <= del_bwa(0) & sro.wrn(0);
      del_bwb <= del_bwb(0) & sro.wrn(1);
    end if;
  end process;

  ssrctrl: if CFG_SSCTRL = 1 generate
    ssrctrl0: gaisler.memctrl.ssrctrl
      generic map (hindex => hsi_ssrctrl, pindex => pi_ssrctrl,
                   romaddr => 16#000#, rommask => 16#fc0#,
                   ioaddr => 0, iomask => 0,
                   ramaddr => 0, rammask => 0,
                   bus16 => CFG_SSCTRLP16
                   )
      port map (rstn, clkm, ahbsi, ahbso(hsi_ssrctrl), apbi, apbo(pi_ssrctrl), sri, sro);
  end generate;
  nossrctrl: if CFG_SSCTRL = 0 generate
    sro <= memory_out_none;
  end generate;

  bpromgen : if CFG_AHBROMEN /= 0 and CFG_SSCTRL = 0 generate
    brom : entity work.ahbrom
      generic map (hindex => hsi_ssrctrl, haddr => CFG_AHBRODDR, pipe => CFG_AHBROPIP)
      port map ( rstn, clkm, ahbsi, ahbso(hsi_ssrctrl));
  end generate;

  ddr3if0: entity work.ddr3if
    generic map (
      hindex => hsi_ddr3,
      haddr => 16#400#, hmask => 16#E00#
    ) port map (
      pll_ref_clk => diff_clkin_top_125_p,
      global_reset_n => cpu_resetn,
      mem_a => ddr3_a,
      mem_ba => ddr3_ba,
      mem_ck => ddr3_ck_p,
      mem_ck_n => ddr3_ck_n,
      mem_cke => ddr3_cke,
      mem_reset_n => ddr3_rstn,
      mem_cs_n => ddr3_csn,
      mem_dm => ddr3_dm,
      mem_ras_n => ddr3_rasn,
      mem_cas_n => ddr3_casn,
      mem_we_n =>  ddr3_wen,
      mem_dq => ddr3_dq,
      mem_dqs => ddr3_dqs_p,
      mem_dqs_n => ddr3_dqs_n,
      mem_odt => ddr3_odt,
      oct_rzqin => ddr3_oct_rzq,
      ahb_clk => clkm,
      ahb_rst => rstn,
      ahbsi => ahbsi,
      ahbso => ahbso(hsi_ddr3)
      );

  lpddr2if0: entity work.lpddr2if
    generic map (
      hindex => hsi_lpddr2,
      haddr => 16#600#, hmask => 16#F00#
    ) port map (
      pll_ref_clk => diff_clkin_bot_125_p,
      global_reset_n => cpu_resetn,
      mem_ca => lpddr2_a,
      mem_ck => lpddr2_ck_p,
      mem_ck_n => lpddr2_ck_n,
      mem_cke => lpddr2_cke,
      mem_cs_n => lpddr2_csn,
      mem_dm => lpddr2_dm,
      mem_dq => lpddr2_dq,
      mem_dqs => lpddr2_dqs_p,
      mem_dqs_n => lpddr2_dqs_n,
      oct_rzqin => lpddr2_oct_rzq,
      ahb_clk => clkm,
      ahb_rst => rstn,
      ahbsi => ahbsi,
      ahbso => ahbso(hsi_lpddr2)
      );

  -----------------------------------------------------------------------------
  -- UART
  -----------------------------------------------------------------------------

  srx_pad  : inpad generic map (tech  => padtech) port map (uart_rxd, ui_serial.rxd);
  srts_pad : inpad generic map (tech  => padtech) port map (uart_rts, ui_serial.ctsn);
  stx_pad  : outpad generic map (tech => padtech) port map (uart_txd, uo_serial.txd);
  scts_pad : outpad generic map (tech => padtech) port map (uart_cts, uo_serial.rtsn);
  urx_pad  : inpad generic map (tech  => padtech) port map (usb_uart_rxd, ui_usb.rxd);
  urts_pad : inpad generic map (tech  => padtech) port map (usb_uart_rts, ui_usb.ctsn);
  utx_pad  : outpad generic map (tech => padtech) port map (usb_uart_txd, uo_usb.txd);
  ucts_pad : outpad generic map (tech => padtech) port map (usb_uart_cts, uo_usb.rtsn);
  usb_uart_dtr <= '0';
  ui_serial.extclk <= '0'; ui_usb.extclk <= '0';

  -- UART switch
  ui  <= ui_serial when user_dipsw(0)='0' else ui_usb;
  dui <= ui_usb    when user_dipsw(0)='0' else ui_serial;
  uo_serial <= uo  when user_dipsw(0)='0' else duo;
  uo_usb    <= duo when user_dipsw(0)='0' else uo;

  ua1 : if CFG_UART1_ENABLE /= 0 generate
    uart1 : apbuart                     -- UART 1
      generic map (pindex   => pi_apbuart, paddr => 1, pirq => 2, console => dbguart,
                   fifosize => CFG_UART1_FIFO)
      port map (rstn, clkm, apbi, apbo(pi_apbuart), ui, uo);
  end generate;
  noua0 : if CFG_UART1_ENABLE = 0 generate
    uo.rtsn <= '0'; uo.txd <= '0'; uo.scaler <= (others => '0');
    uo.txen <= '0'; uo.flow <= '0'; uo.rxen <= '0';
  end generate;

  -- AHBUART, see under Debug links above

  -----------------------------------------------------------------------------
  -- Ethernet
  -----------------------------------------------------------------------------

  emdio_pad : iopad generic map (tech => padtech)
    port map (eneta_mdio, etho1.mdio_o, etho1.mdio_oe, ethi1.mdio_i);
  etxc_pad : clkpad generic map (tech => padtech, arch => 2)
    port map (eneta_tx_clk, ethi1.tx_clk);
  erxc_pad : clkpad generic map (tech => padtech, arch => 2)
    port map (eneta_rx_clk, ethi1.rx_clk);
  erxd_pad : inpadv generic map (tech => padtech, width => 4)
    port map (eneta_rx_d, ethi1.rxd(3 downto 0));
  erxdv_pad : inpad generic map (tech => padtech)
    port map (eneta_rx_dv, ethi1.rx_dv);
  erxer_pad : inpad generic map (tech => padtech)
    port map (eneta_rx_er, ethi1.rx_er);
  erxco_pad : inpad generic map (tech => padtech)
    port map (eneta_rx_col, ethi1.rx_col);
  erxcr_pad : inpad generic map (tech => padtech)
    port map (eneta_rx_crs, ethi1.rx_crs);
  emdint_pad : inpad generic map (tech => padtech)
    port map (eneta_intn,   ethi1.mdint);

  etxd_pad : outpadv generic map (tech => padtech, width => 4)
    port map (eneta_tx_d, etho1.txd(3 downto 0));
  etxen_pad : outpad generic map (tech => padtech)
    port map (eneta_tx_en, etho1.tx_en);
  etxer_pad : outpad generic map (tech => padtech)
    port map (eneta_tx_er, etho1.tx_er);
  emdc_pad : outpad generic map (tech => padtech)
    port map (eneta_mdc, etho1.mdc);
  erst_pad : outpad generic map (tech => padtech)
    port map (eneta_resetn, rstn);

  ethi1.rxd(ethi1.rxd'high downto 4) <= (others => '0');
  ethi1.gtx_clk <= '0'; ethi1.rmii_clk <= '0';

  emdio_pad2 : iopad generic map (tech => padtech)
    port map (enetb_mdio, etho2.mdio_o, etho2.mdio_oe, ethi2.mdio_i);
  etxc_pad2 : clkpad generic map (tech => padtech, arch => 2)
    port map (enetb_tx_clk, ethi2.tx_clk);
  erxc_pad2 : clkpad generic map (tech => padtech, arch => 2)
    port map (enetb_rx_clk, ethi2.rx_clk);
  erxd_pad2 : inpadv generic map (tech => padtech, width => 4)
    port map (enetb_rx_d, ethi2.rxd(3 downto 0));
  erxdv_pad2 : inpad generic map (tech => padtech)
    port map (enetb_rx_dv, ethi2.rx_dv);
  erxer_pad2 : inpad generic map (tech => padtech)
    port map (enetb_rx_er, ethi2.rx_er);
  erxco_pad2 : inpad generic map (tech => padtech)
    port map (enetb_rx_col, ethi2.rx_col);
  erxcr_pad2 : inpad generic map (tech => padtech)
    port map (enetb_rx_crs, ethi2.rx_crs);
  emdint_pad2 : inpad generic map (tech => padtech)
    port map (enetb_intn,   ethi2.mdint);

  etxd_pad2 : outpadv generic map (tech => padtech, width => 4)
    port map (enetb_tx_d, etho2.txd(3 downto 0));
  etxen_pad2 : outpad generic map (tech => padtech)
    port map (enetb_tx_en, etho2.tx_en);
  etxer_pad2 : outpad generic map (tech => padtech)
    port map (enetb_tx_er, etho2.tx_er);
  emdc_pad2 : outpad generic map (tech => padtech)
    port map (enetb_mdc, etho2.mdc);
  erst_pad2 : outpad generic map (tech => padtech)
    port map (enetb_resetn, rstn);

  ethi2.rxd(ethi1.rxd'high downto 4) <= (others => '0');
  ethi2.gtx_clk <= '0'; ethi2.rmii_clk <= '0';

  eth1 : if CFG_GRETH = 1 generate -- Gaisler ethernet MAC
    e1 : grethm generic map(hindex => hmi_greth1,
	pindex => pi_greth1, paddr => 11, pirq => 12, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH_FIFO,
        nsync => 2, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 0,
	ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH1G)
      port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(hmi_greth1),
	apbi => apbi, apbo => apbo(pi_greth1), ethi => ethi1, etho => etho1);

    end generate;

  noeth1 : if CFG_GRETH = 0 generate
    etho1 <= eth_out_none;
  end generate;

  eth2 : if CFG_GRETH2 = 1 generate -- Secondary ethernet MAC
    e2 : grethm generic map(hindex => hmi_greth2,
	pindex => pi_greth2, paddr => 12, pirq => 13, memtech => memtech,
        mdcscaler => CPU_FREQ/1000, enable_mdio => 1, fifosize => CFG_ETH2_FIFO,
        nsync => 2, edcl => CFG_DSU_ETH, edclbufsz => CFG_ETH_BUF,
        macaddrh => CFG_ETH_ENM, macaddrl => CFG_ETH_ENL, phyrstadr => 1,
	ipaddrh => CFG_ETH_IPM, ipaddrl => CFG_ETH_IPL, giga => CFG_GRETH21G)
      port map( rst => rstn, clk => clkm, ahbmi => ahbmi,
        ahbmo => ahbmo(hmi_greth2),
	apbi => apbi, apbo => apbo(pi_greth2), ethi => ethi2, etho => etho2);

    end generate;

  noeth2 : if CFG_GRETH2 = 0 generate
    etho2 <= eth_out_none;
  end generate;

  -----------------------------------------------------------------------------
  -- GPIO
  -----------------------------------------------------------------------------

  -- TO DO

  -----------------------------------------------------------------------------
  -- Other
  -----------------------------------------------------------------------------
  max5_csn <= '1';

  sclpad: iopad generic map (tech => padtech) port map (eeprom_scl, i2co.scl, i2co.scloen, i2ci.scl);
  sdapad: iopad generic map (tech => padtech) port map (eeprom_sda, i2co.sda, i2co.sdaoen, i2ci.sda);

  i2c: if CFG_I2C_ENABLE=1 generate
    i2cmst0: i2cmst
      generic map (pindex => pi_i2cmst, paddr => 4, pmask => 16#FFF#, pirq => 4)
      port map (rstn,clkm,apbi,apbo(pi_i2cmst),i2ci,i2co);
  end generate;
  noi2c: if CFG_I2C_ENABLE=0 generate
    i2co <= (others => '1');
  end generate;

--  logan0: logan
--    generic map (pindex => napbs-1, paddr => 16#100#, memtech => memtech)
--    port map (rstn, clkm, clkm, apbi, apbo(napbs-1), logsig);
--
--  logsig(31 downto 6) <= (others => '0');
--  logsig(5 downto 0) <= i2co.scl & i2co.scloen & i2ci.scl & i2co.sda & i2co.sdaoen & i2ci.sda;

-- pragma translate_off
  rep: if USE_AHBREP/=0 generate
    ahbrep0: ahbrep
      generic map (hindex => hsi_ahbrep, haddr => 16#200#)
      port map (rstn,clkm,ahbsi,ahbso(hsi_ahbrep));
  end generate;

  x : report_version
  generic map (
   msg1 => "LEON3 Altera CycloneV E Demonstration design",
   msg2 => "GRLIB Version " & tost(LIBVHDL_VERSION/1000) & "." & tost((LIBVHDL_VERSION mod 1000)/100)
      & "." & tost(LIBVHDL_VERSION mod 100) & ", build " & tost(LIBVHDL_BUILD),
   msg3 => "Target technology: " & tech_table(fabtech) & ",  memory library: " & tech_table(memtech),
   mdel => 1
  );
-- pragma translate_on

end;

