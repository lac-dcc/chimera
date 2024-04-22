-----------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2004-2008 Jiri Gaisler, Gaisler Research
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
library cypress;
use cypress.components.all;
use work.debug.all;
use work.ml50x.all;

use work.config.all;	-- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 10;		-- system clock period
    romwidth  : integer := 32;		-- rom data width (8/32)
    romdepth  : integer := 16;		-- rom address depth
    sramwidth  : integer := 32;		-- ram data width (8/16/32)
    sramdepth  : integer := 18;		-- ram address depth
    srambanks  : integer := 2		-- number of ram banks
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal sys_clk : std_logic := '0';
signal sys_rst_in : std_logic := '0';			-- Reset
constant ct : integer := clkperiod/2;

signal bus_error 	: std_logic_vector (1 downto 0);
signal sram_flash_addr : std_logic_vector(23 downto 0);
signal address : std_logic_vector(24 downto 0);
signal sram_flash_data, data : std_logic_vector(31 downto 0);
signal sram_cen  	: std_logic;
signal sram_bw   	: std_logic_vector (3 downto 0);
signal sram_oen : std_ulogic;
signal flash_oen : std_ulogic;
signal sram_flash_we_n 	: std_ulogic;
signal flash_cen  	: std_logic;
signal flash_adv_n  	: std_logic;
signal sram_clk  	: std_ulogic;
signal sram_clk_fb	: std_ulogic; 
signal sram_mode 	: std_ulogic;
signal sram_adv_ld_n : std_ulogic;
signal iosn : std_ulogic;
signal ddr_clk  	: std_logic_vector(1 downto 0);
signal ddr_clkb  	: std_logic_vector(1 downto 0);
signal ddr_cke  	: std_logic_vector(1 downto 0);
signal ddr_csb  	: std_logic_vector(1 downto 0);
signal ddr_odt  	: std_logic_vector(1 downto 0);
signal ddr_web  	: std_ulogic;                       -- ddr write enable
signal ddr_rasb  	: std_ulogic;                       -- ddr ras
signal ddr_casb  	: std_ulogic;                       -- ddr cas
signal ddr_dm   	: std_logic_vector (7 downto 0);    -- ddr dm
signal ddr_dqsp  	: std_logic_vector (7 downto 0);    -- ddr dqs
signal ddr_dqsn  	: std_logic_vector (7 downto 0);    -- ddr dqs
signal ddr_rdqs  	: std_logic_vector (7 downto 0);    -- ddr dqs
signal ddr_ad      : std_logic_vector (13 downto 0);   -- ddr address
signal ddr_ba      : std_logic_vector (1+CFG_DDR2SP downto 0);    -- ddr bank address
signal ddr_dq  	: std_logic_vector (63 downto 0); -- ddr data
signal ddr_dq2 	: std_logic_vector (63 downto 0); -- ddr data


signal txd1   	: std_ulogic; 			-- UART1 tx data
signal rxd1   	: std_ulogic;  			-- UART1 rx data
signal gpio         : std_logic_vector(13 downto 0); 	-- I/O port
signal led          : std_logic_vector(12 downto 0); 	-- I/O port
signal phy_mii_data: std_logic;		-- ethernet PHY interface
signal phy_tx_clk 	: std_ulogic;
signal phy_rx_clk 	: std_ulogic;
signal phy_rx_data	: std_logic_vector(7 downto 0);   
signal phy_dv  	: std_ulogic; 
signal phy_rx_er	: std_ulogic; 
signal phy_col 	: std_ulogic;
signal phy_crs 	: std_ulogic;
signal phy_tx_data : std_logic_vector(7 downto 0);   
signal phy_tx_en 	: std_ulogic; 
signal phy_tx_er 	: std_ulogic; 
signal phy_mii_clk	: std_ulogic;
signal phy_rst_n	: std_ulogic;
signal phy_gtx_clk	: std_ulogic;
signal phy_int	: std_ulogic := '1';
signal ps2_keyb_clk: std_logic;
signal ps2_keyb_data: std_logic;
signal ps2_mouse_clk: std_logic;
signal ps2_mouse_data: std_logic;
signal usb_csn, usb_rstn : std_logic;
signal iic_scl_main, iic_sda_main : std_logic;
signal iic_scl_dvi, iic_sda_dvi : std_logic;
signal tft_lcd_data    : std_logic_vector(11 downto 0);
signal tft_lcd_clk_p   : std_logic;
signal tft_lcd_clk_n   : std_logic;
signal tft_lcd_hsync   : std_logic;
signal tft_lcd_vsync   : std_logic;
signal tft_lcd_de      : std_logic;
signal tft_lcd_reset_b : std_logic;
signal sace_usb_a      : std_logic_vector(6 downto 0);
signal sace_mpce       : std_ulogic;
signal sace_usb_d      : std_logic_vector(15 downto 0);
signal sace_usb_oen    : std_ulogic;
signal sace_usb_wen    : std_ulogic;
signal sysace_mpirq    : std_ulogic;

signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
signal clk_200_p      : std_ulogic := '0';
signal clk_200_n      : std_ulogic := '1';
signal sysace_clk_in  : std_ulogic := '0';

constant lresp : boolean := false;

begin

-- clock and reset

  sys_clk <= not sys_clk after ct * 1 ns;
  sys_rst_in <= '0', '1' after 200 ns; 
  clk_200_p <= not clk_200_p after 2.5 ns;
  clk_200_n <= not clk_200_n after 2.5 ns;
  sysace_clk_in <= not sysace_clk_in after 15 ns;
  rxd1 <= 'H'; gpio(11) <= 'L';
  sram_clk_fb <= sram_clk; 
  ps2_keyb_data <= 'H'; ps2_keyb_clk <= 'H';
  ps2_mouse_clk <= 'H'; ps2_mouse_data <= 'H';
  iic_scl_main <= 'H'; iic_sda_main <= 'H';
  iic_scl_dvi <= 'H'; iic_sda_dvi <= 'H';
  sace_usb_d <= (others => 'H'); sysace_mpirq <= 'L';
  
  cpu : entity work.leon3mp
      generic map ( fabtech, memtech, padtech, ncpu, disas, dbguart, pclow )
      port map (sys_rst_in, sys_clk, clk_200_p, clk_200_n, sysace_clk_in,
        sram_flash_addr, sram_flash_data, sram_cen, sram_bw, sram_oen,
        sram_flash_we_n, flash_cen, flash_oen, flash_adv_n,sram_clk,
        sram_clk_fb, sram_mode, sram_adv_ld_n, iosn,
	ddr_clk, ddr_clkb, ddr_cke, ddr_csb, ddr_odt, ddr_web,
	ddr_rasb, ddr_casb, ddr_dm, ddr_dqsp, ddr_dqsn, ddr_ad, ddr_ba, ddr_dq, 
	txd1, rxd1, gpio, led, bus_error,
	phy_gtx_clk, phy_mii_data, phy_tx_clk, phy_rx_clk, 
	phy_rx_data, phy_dv, phy_rx_er,	phy_col, phy_crs, 
	phy_tx_data, phy_tx_en, phy_tx_er, phy_mii_clk,	phy_rst_n, phy_int, 
	ps2_keyb_clk, ps2_keyb_data, ps2_mouse_clk, ps2_mouse_data,
	usb_csn, usb_rstn,
        iic_scl_main, iic_sda_main,
        iic_scl_dvi, iic_sda_dvi,
        tft_lcd_data, tft_lcd_clk_p, tft_lcd_clk_n, tft_lcd_hsync,
        tft_lcd_vsync, tft_lcd_de, tft_lcd_reset_b,
        sace_usb_a, sace_mpce, sace_usb_d, sace_usb_oen, sace_usb_wen,
        sysace_mpirq
	);

--   ddr2mem : for i in 0 to 3 generate
--     u1 : ddr2 
--     PORT MAP(
--       ck => ddr_clk(0), ck_n => ddr_clkb(0), cke => ddr_cke(0), cs_n => ddr_csb(0),
--       ras_n => ddr_rasb, cas_n => ddr_casb, we_n => ddr_web, 
--       dm_rdqs => ddr_dm(i*2+1 downto i*2), ba => ddr_ba,
--       addr => ddr_ad(12 downto 0), dq => ddr_dq(i*16+15 downto i*16),
--       dqs => ddr_dqsp(i*2+1 downto i*2), dqs_n => ddr_dqsn(i*2+1 downto i*2),
--       rdqs_n => ddr_rdqs(i*2+1 downto i*2), odt => ddr_odt(0));
--   end generate;

  ddr2ranks: for j in 0 to CS_NUM-1 generate
    -- ddr2chips: for i in 0 to 3 generate
    -- u1 : HY5PS121621F
    --   generic map (TimingCheckFlag => true, PUSCheckFlag => false,
    --                index => 3-i, fname => sdramfile, fdelay => 100*CFG_MIG_DDR2)
    --   port map (DQ => ddr_dq2(i*16+15 downto i*16), LDQS  => ddr_dqsp(i*2),
    --             LDQSB => ddr_dqsn(i*2), UDQS => ddr_dqsp(i*2+1),
    --             UDQSB => ddr_dqsn(i*2+1), LDM => ddr_dm(i*2),
    --             WEB => ddr_web, CASB => ddr_casb, RASB  => ddr_rasb, CSB => ddr_csb(j),
    --             BA => ddr_ba(1 downto 0), ADDR => ddr_ad(12 downto 0), CKE => ddr_cke(j),
    --             CLK => ddr_clk(j), CLKB => ddr_clkb(j), UDM => ddr_dm(i*2+1));
    -- end generate;
    ddr0 : ddr2ram
    generic map(width => 64, abits => 13, babits =>2, colbits => 10, rowbits => 13,
                implbanks => 1, fname => sdramfile, speedbin=>0, density => 2,
                lddelay => 100 us * CFG_MIG_DDR2)
    port map (ck => ddr_clk(j), ckn => ddr_clkb(j), cke => ddr_cke(j), csn => ddr_csb(j),
              odt => ddr_odt(j), rasn => ddr_rasb, casn => ddr_casb, wen => ddr_web,
              dm => ddr_dm, ba => ddr_ba(1 downto 0), a => ddr_ad(12 downto 0), dq => ddr_dq2,
              dqs => ddr_dqsp, dqsn =>ddr_dqsn);   
  end generate;

  nodqdel : if (CFG_MIG_DDR2 = 1) generate
    ddr2delay : delay_wire 
      generic map(data_width => ddr_dq'length, delay_atob => 0.0, delay_btoa => 0.0)
      port map(a => ddr_dq, b => ddr_dq2);
  end generate;
  
  dqdel : if (CFG_MIG_DDR2 = 0) generate
    ddr2delay : delay_wire 
      generic map(data_width => ddr_dq'length, delay_atob => 0.0, delay_btoa => 4.5)
      port map(a => ddr_dq, b => ddr_dq2);
  end generate;
  
  sram01 : for i in 0 to 1 generate
      sr0 : sram generic map (index => i, abits => sramdepth, fname => sramfile)
	port map (sram_flash_addr(sramdepth downto 1), sram_flash_data(15-i*8 downto 8-i*8),
		sram_cen, sram_bw(i+2), sram_oen);
  end generate;

  sram23 : for i in 2 to 3 generate
      sr0 : sram generic map (index => i, abits => sramdepth, fname => sramfile)
	port map (sram_flash_addr(sramdepth downto 1), sram_flash_data(47-i*8 downto 40-i*8),
		sram_cen, sram_bw(i-2), sram_oen);
  end generate;

  prom0 : sram16 generic map (index => 4, abits => romdepth, fname => promfile)
	port map (sram_flash_addr(romdepth-1 downto 0), sram_flash_data(15 downto 0),
		  gnd, gnd, flash_cen, sram_flash_we_n, flash_oen);

  phy0 : if (CFG_GRETH = 1) generate
    phy_mii_data <= 'H';
    p0: phy
      generic map (address => 7)
      port map(sys_rst_in, phy_mii_data, phy_tx_clk, phy_rx_clk, phy_rx_data,
               phy_dv, phy_rx_er, phy_col, phy_crs, phy_tx_data, phy_tx_en,
               phy_tx_er, phy_mii_clk, phy_gtx_clk);
  end generate;

--  p0: phy 
--      port map(rst, led_cfg, open, etx_clk, erx_clk, erxd, erx_dv,
--      erx_er, erx_col, erx_crs, etxd, etx_en, etx_er, emdc);

  i0: i2c_slave_model
    port map (iic_scl_main, iic_sda_main);
  
   iuerr : process
   begin
     wait for 5000 ns;
     if to_x01(bus_error(0)) = '0' then wait on bus_error; end if;
     assert (to_x01(bus_error(0)) = '0') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  data <=  sram_flash_data(15 downto 0) &  sram_flash_data(31 downto 16);
  address <= sram_flash_addr & '0';

  test0 :  grtestmod
    port map ( sys_rst_in, sys_clk, bus_error(0), sram_flash_addr(20 downto 1), data,
    	       iosn, flash_oen, sram_bw(0), open);


  sram_flash_data <= buskeep(sram_flash_data), (others => 'H') after 250 ns;
--  ddr_dq <= buskeep(ddr_dq), (others => 'H') after 250 ns;
  data <= buskeep(data), (others => 'H') after 250 ns;

end ;

