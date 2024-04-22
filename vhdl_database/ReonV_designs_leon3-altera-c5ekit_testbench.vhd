------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
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
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library gaisler;
use gaisler.libdcom.all;
use gaisler.sim.all;
library techmap;
use techmap.gencomp.all;
library micron;
use micron.components.all;
use work.debug.all;

use work.config.all;	-- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 20;		-- system clock period
    romwidth  : integer := 8;		-- rom data width (8/32)
    romdepth  : integer := 23;		-- rom address depth
    sramwidth  : integer := 32;		-- ram data width (8/16/32)
    sramdepth  : integer := 20;		-- ram address depth
    srambanks  : integer := 1		-- number of ram banks
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

component leon3mp is
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
    flash_cen: out std_ulogic;
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
--    hsmc_clk_in0: in std_ulogic;
--    hsmc_clk_out0: out std_ulogic;
--    hsmc_clk_in_p: in std_logic_vector(2 downto 1);
--    hsmc_clk_out_p: out std_logic_vector(2 downto 1);
--    hsmc_d: in std_logic_vector(3 downto 0);  -- inout
--    hsmc_tx_d_p: out std_logic_vector(16 downto 0);
--    hsmc_rx_d_p: in std_logic_vector(16 downto 0);
--    hsmc_rx_led: out std_ulogic;
--    hsmc_tx_led: out std_ulogic;
--    hsmc_scl: out std_ulogic;
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
end component;

signal clk125, clk50, clkout: std_ulogic := '0';
signal rst: std_ulogic;
signal user_led: std_logic_vector(3 downto 0);

signal address  : std_logic_vector(26 downto 1);
signal data     : std_logic_vector(15 downto 0);

signal ramsn    : std_ulogic;
signal ramoen   : std_ulogic;
signal rwen     : std_ulogic;
signal mben     : std_logic_vector(3 downto 0);
--signal rwenx    : std_logic_vector(3 downto 0);
signal romsn    : std_logic;
signal iosn     : std_ulogic;
signal oen      : std_ulogic;
--signal read     : std_ulogic;
signal writen   : std_ulogic;
signal brdyn    : std_ulogic;
signal bexcn    : std_ulogic;
signal wdog     : std_ulogic;
signal dsuen, dsutx, dsurx, dsubren, dsuact : std_ulogic;
signal dsurst   : std_ulogic;
signal test     : std_ulogic;
signal error    : std_logic;
signal gpio	: std_logic_vector(7 downto 0);
signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
signal clk2     : std_ulogic := '1';
    
signal plllock    : std_ulogic;       
signal txd1, rxd1 : std_ulogic;       
--signal txd2, rxd2 : std_ulogic;       

constant lresp : boolean := false;

signal eneta_rx_clk, eneta_tx_clk, enetb_rx_clk, enetb_tx_clk: std_ulogic;
signal eneta_intn, eneta_resetn, enetb_intn, enetb_resetn: std_ulogic;
signal eneta_mdio, enetb_mdio: std_logic;
signal eneta_mdc, enetb_mdc: std_ulogic;
signal eneta_rx_er, eneta_rx_col, eneta_rx_crs, eneta_rx_dv: std_ulogic;
signal enetb_rx_er, enetb_rx_col, enetb_rx_crs, enetb_rx_dv: std_ulogic;
signal eneta_rx_d, enetb_rx_d: std_logic_vector(7 downto 0);
signal eneta_tx_d, enetb_tx_d: std_logic_vector(7 downto 0);
signal eneta_tx_en, eneta_tx_er, enetb_tx_en, enetb_tx_er: std_ulogic;

signal lpddr2_ck, lpddr2_ck_n, lpddr2_cke, lpddr2_cs_n: std_ulogic;
signal lpddr2_ca: std_logic_vector(9 downto 0);
signal lpddr2_dm, lpddr2_dqs, lpddr2_dqs_n: std_logic_vector(3 downto 0);
signal lpddr2_dq: std_logic_vector(31 downto 0);

begin

-- clock and reset

  clk125 <= not clk125 after 4 ns;
  clk50 <= not clk50 after 10 ns;

  rst <= dsurst;
  dsubren <= '1'; rxd1 <= '1';

  d3 : leon3mp
    generic map ( fabtech, memtech, padtech, disas, dbguart, pclow )
    port map (
      -- Clock and reset
      diff_clkin_top_125_p => clk125,
      diff_clkin_bot_125_p => clk125,
      clkin_50_fpga_right => clk50,
      clkin_50_fpga_top => clk50,
      clkout_sma => clkout,
      cpu_resetn => rst,

      -- DDR3
      ddr3_ck_p => open,
      ddr3_ck_n => open,
      ddr3_cke => open,
      ddr3_rstn => open,
      ddr3_csn => open,
      ddr3_rasn => open,
      ddr3_casn => open,
      ddr3_wen => open,
      ddr3_ba => open,
      ddr3_a => open,
      ddr3_dqs_p => open,
      ddr3_dqs_n => open,
      ddr3_dq => open,
      ddr3_dm => open,
      ddr3_odt => open,
      ddr3_oct_rzq => '0',

      -- LPDDR2
      lpddr2_ck_p => lpddr2_ck,
      lpddr2_ck_n => lpddr2_ck_n,
      lpddr2_cke => lpddr2_cke,
      lpddr2_a => lpddr2_ca,
      lpddr2_dqs_p => lpddr2_dqs(1 downto 0),
      lpddr2_dqs_n => lpddr2_dqs_n(1 downto 0),
      lpddr2_dq => lpddr2_dq(15 downto 0),
      lpddr2_dm => lpddr2_dm(1 downto 0),
      lpddr2_csn => lpddr2_cs_n,
      lpddr2_oct_rzq => '0',

      -- Flash and SSRAM interface
      fm_a => address(26 downto 1),
      fm_d => data,
      flash_clk => open,
      flash_resetn => open,
      flash_cen => romsn,
      flash_advn => open,
      flash_wen => rwen,
      flash_oen => oen,
      flash_rdybsyn => '1',
      ssram_clk => open,
      ssram_oen => open,
      sram_cen => open,
      ssram_bwen => open,
      ssram_bwan => open,
      ssram_bwbn => open,
      ssram_adscn => open,
      ssram_adspn => open,
      ssram_zzn => open,
      ssram_advn => open,
      
      -- EEPROM
      eeprom_scl => open,
      eeprom_sda => open,
      
      -- UART
      uart_rxd => rxd1,
      uart_rts => '1',
      uart_txd => txd1,
      uart_cts => open,
      
      -- USB UART Interface
      usb_uart_rstn => '1',
      usb_uart_ri => '0',
      usb_uart_dcd => '1',
      usb_uart_dtr => open,
      usb_uart_dsr => '1',
      usb_uart_txd => open,
      usb_uart_rxd => '1',
      usb_uart_rts => '1',
      usb_uart_cts => open,
      usb_uart_gpio2 => '0',
      usb_uart_suspend => '0',
      usb_uart_suspendn => '1',
      
      -- Ethernet port A
      eneta_rx_clk => eneta_rx_clk,
      eneta_tx_clk => eneta_tx_clk,
      eneta_intn => eneta_intn,
      eneta_resetn => eneta_resetn,
      eneta_mdio => eneta_mdio,
      eneta_mdc => eneta_mdc,
      eneta_rx_er => eneta_rx_er,
      eneta_tx_er => eneta_tx_er,
      eneta_rx_col => eneta_rx_col,
      eneta_rx_crs => eneta_rx_crs,
      eneta_tx_d => eneta_tx_d(3 downto 0),
      eneta_rx_d => eneta_rx_d(3 downto 0),
      eneta_gtx_clk => open,
      eneta_tx_en => eneta_tx_en,
      eneta_rx_dv => eneta_rx_dv,
      
      -- Ethernet port B
      enetb_rx_clk => enetb_rx_clk,
      enetb_tx_clk => enetb_tx_clk,
      enetb_intn => enetb_intn,
      enetb_resetn => enetb_resetn,
      enetb_mdio => enetb_mdio,
      enetb_mdc => enetb_mdc,
      enetb_rx_er => enetb_rx_er,
      enetb_tx_er => enetb_tx_er,
      enetb_rx_col => enetb_rx_col,
      enetb_rx_crs => enetb_rx_crs,
      enetb_tx_d => enetb_tx_d(3 downto 0),
      enetb_rx_d => enetb_rx_d(3 downto 0),
      enetb_gtx_clk => open,
      enetb_tx_en => enetb_tx_en,
      enetb_rx_dv => enetb_rx_dv,
      
      -- LEDs, switches, GPIO
      user_led => user_led,
      user_dipsw => "1111",
      dip_3p3V => '0',
      user_pb => "0000",
      overtemp_fpga => open,
      header_p => "000000",
      header_n => "000000",
      header_d => "00000000",
      
      -- LCD
      lcd_data => "00000000",
      lcd_wen => open,
      lcd_csn => open,
      lcd_d_cn => open,
      
      -- HIGH-SPEED-MEZZANINE-CARD Interface
--      hsmc_clk_in0 => '0',
--      hsmc_clk_out0 => open,
--      hsmc_clk_in_p => "00",
--      hsmc_clk_out_p => open,
--      hsmc_d => "0000",
--      hsmc_tx_d_p => open,
--      hsmc_rx_d_p => (others => '0'),
--      hsmc_rx_led => open,
--      hsmc_tx_led => open,
--      hsmc_scl => open,
--      hsmc_sda => '0',
--      hsmc_prsntn => '0',
      
      -- MAX V CPLD interface
      max5_csn => open,
      max5_wen => open,
      max5_oen => open,
      max5_ben => open,
      max5_clk => open,
      
      -- USB Blaster II
      usb_clk => '0',
      usb_data => (others => '0'),
      usb_addr => "00",
      usb_scl => '0',
      usb_sda => '0',
      usb_resetn => '0',
      usb_oen => '0',
      usb_rdn => '0',
      usb_wrn => '0',
      usb_full => open,
      usb_empty => open,
      fx2_resetn => '1'
    );

  -- 16 bit prom
  prom0 : sram16 generic map (index => 4, abits => romdepth, fname => promfile)
	port map (address(romdepth downto 1), data, 
		  romsn, romsn, romsn, rwen, oen);


  -- ROMSN is pulled down by the MAX V system controller after FPGA programming
  -- completed (bug?)
  romsn <= 'L';

  data <= buskeep(data), (others => 'H') after 250 ns;

  error <= user_led(3);

  eneta_mdio <= 'H';
  enetb_mdio <= 'H';
  eneta_tx_d(7 downto 4) <= "0000";
  enetb_tx_d(7 downto 4) <= "0000";

  p1: phy
    generic map(base1000_t_fd => 0, base1000_t_hd => 0, address => 0)
    port map(rst, eneta_mdio, eneta_tx_clk, eneta_rx_clk, eneta_rx_d, eneta_rx_dv,
             eneta_rx_er, eneta_rx_col, eneta_rx_crs, eneta_tx_d, eneta_tx_en, eneta_tx_er, eneta_mdc,
             '0');
  p2: phy
    generic map(base1000_t_fd => 0, base1000_t_hd => 0, address => 1)
    port map(rst, enetb_mdio, enetb_tx_clk, enetb_rx_clk, enetb_rx_d, enetb_rx_dv,
             enetb_rx_er, enetb_rx_col, enetb_rx_crs, enetb_tx_d, enetb_tx_en, enetb_tx_er, enetb_mdc,
             '0');

   iuerr : process
   begin
     wait for 2500 ns;
     if to_x01(error) = '1' then wait on error; end if;
     assert (to_x01(error) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  test0 :  grtestmod generic map (width => 16)
    port map ( rst, clk50, error, address(21 downto 2), data,
    	       iosn, oen, writen, brdyn);

  dsucom : process
    procedure dsucfg(signal dsurx : in std_ulogic; signal dsutx : out std_ulogic) is
    variable w32 : std_logic_vector(31 downto 0);
    variable c8  : std_logic_vector(7 downto 0);
    constant txp : time := 160 * 1 ns;
    begin
    dsutx <= '1';
    dsurst <= '0';
    wait for 500 ns;
    dsurst <= '1';
    wait;
    wait for 5000 ns;
    txc(dsutx, 16#55#, txp);		-- sync uart

--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#02#, 16#ae#, txp);
--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#00#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#06#, 16#ae#, txp);
--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#24#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#06#, 16#03#, txp);
--    txc(dsutx, 16#c0#, txp);
--    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
--    txa(dsutx, 16#00#, 16#00#, 16#06#, 16#fc#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2f#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#6f#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#11#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#04#, txp);
    txa(dsutx, 16#00#, 16#02#, 16#20#, 16#01#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#02#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#40#, 16#00#, 16#43#, 16#10#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#40#, 16#00#, 16#24#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#24#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#70#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#03#, txp);





    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#ff#, 16#ff#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#48#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#12#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#60#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#12#, 16#10#, txp);

    txc(dsutx, 16#80#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);

    txc(dsutx, 16#a0#, txp);
    txa(dsutx, 16#40#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);

    end;

  begin

    dsucfg(dsutx, dsurx);

    wait;
  end process;
end ;

