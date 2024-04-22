-----------------------------------------------------------------------------
--  LEON Demonstration design test bench
--  Copyright (C) 2004 - 2015 Cobham Gaisler AB
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
use grlib.config.all;
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

use work.config.all;    -- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    transtech : integer := CFG_TRANSTECH;
    clktech   : integer := CFG_CLKTECH;
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;   -- Enable disassembly to console
    dbguart   : integer := CFG_DUART;   -- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 10;          -- system clock period
    romwidth  : integer := 32;          -- rom data width (8/32)
    romdepth  : integer := 16;          -- rom address depth
    sramwidth  : integer := 32;         -- ram data width (8/16/32)
    sramdepth  : integer := 18;         -- ram address depth
    srambanks  : integer := 2           -- number of ram banks
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal sys_clk : std_logic := '0';
signal sys_rst_in : std_logic := '0';                   -- Reset
constant ct : integer := clkperiod/2;
constant slips : integer := 11;

signal bus_error        : std_logic_vector (1 downto 0);
signal sram_flash_addr : std_logic_vector(23 downto 0);
signal address : std_logic_vector(24 downto 0);
signal sram_flash_data, data : std_logic_vector(31 downto 0);
signal sram_cen         : std_logic;
signal sram_bw          : std_logic_vector (3 downto 0);
signal sram_oen : std_ulogic;
signal flash_oen : std_ulogic;
signal sram_flash_we_n  : std_ulogic;
signal flash_cen        : std_logic;
signal flash_adv_n      : std_logic;
signal sram_clk         : std_ulogic;
signal sram_clk_fb      : std_ulogic; 
signal sram_mode        : std_ulogic;
signal sram_adv_ld_n : std_ulogic;
signal iosn : std_ulogic;
signal ddr_clk          : std_logic_vector(1 downto 0);
signal ddr_clkb         : std_logic_vector(1 downto 0);
signal ddr_cke          : std_logic_vector(1 downto 0);
signal ddr_csb          : std_logic_vector(1 downto 0);
signal ddr_odt          : std_logic_vector(1 downto 0);
signal ddr_web          : std_ulogic;                       -- ddr write enable
signal ddr_rasb         : std_ulogic;                       -- ddr ras
signal ddr_casb         : std_ulogic;                       -- ddr cas
signal ddr_dm           : std_logic_vector (7 downto 0);    -- ddr dm
signal ddr_dqsp         : std_logic_vector (7 downto 0);    -- ddr dqs
signal ddr_dqsn         : std_logic_vector (7 downto 0);    -- ddr dqs
signal ddr_rdqs         : std_logic_vector (7 downto 0);    -- ddr dqs
signal ddr_ad      : std_logic_vector (13 downto 0);   -- ddr address
signal ddr_ba      : std_logic_vector (1+CFG_DDR2SP downto 0);    -- ddr bank address
signal ddr_dq   : std_logic_vector (63 downto 0); -- ddr data
signal ddr_dq2  : std_logic_vector (63 downto 0); -- ddr data


signal txd1     : std_ulogic;                   -- UART1 tx data
signal rxd1     : std_ulogic;                   -- UART1 rx data
signal txd2     : std_ulogic;                   -- UART2 tx data
signal rxd2     : std_ulogic;                   -- UART2 rx data
signal gpio         : std_logic_vector(12 downto 0);    -- I/O port
signal led          : std_logic_vector(12 downto 0);    -- I/O port
signal phy_mii_data: std_logic;         -- ethernet PHY interface
signal phy_tx_clk       : std_ulogic;
signal phy_rx_clk       : std_ulogic;
signal phy_rx_data      : std_logic_vector(7 downto 0);   
signal phy_dv   : std_ulogic; 
signal phy_rx_er        : std_ulogic; 
signal phy_col  : std_ulogic;
signal phy_crs  : std_ulogic;
signal phy_tx_data : std_logic_vector(7 downto 0);   
signal phy_tx_en        : std_ulogic; 
signal phy_tx_er        : std_ulogic; 
signal phy_mii_clk      : std_ulogic;
signal phy_rst_n        : std_ulogic;
signal phy_int          : std_ulogic := '0';
signal phy_gtx_clk      : std_ulogic;
signal sgmii_rx_n       : std_ulogic;
signal sgmii_rx_p       : std_ulogic;
signal sgmii_rx_n_d     : std_ulogic;
signal sgmii_rx_p_d     : std_ulogic;
signal sgmii_tx_n       : std_ulogic;
signal sgmii_tx_p       : std_ulogic;
signal ps2_keyb_clk: std_logic;
signal ps2_keyb_data: std_logic;
signal ps2_mouse_clk: std_logic;
signal ps2_mouse_data: std_logic;
signal usb_csn, usb_rstn : std_logic;
signal iic_scl_main, iic_sda_main : std_logic;
signal iic_scl_video, iic_sda_video : std_logic;
signal tft_lcd_data    : std_logic_vector(11 downto 0);
signal tft_lcd_clk_p   : std_logic;
signal tft_lcd_clk_n   : std_logic;
signal tft_lcd_hsync   : std_logic;
signal tft_lcd_vsync   : std_logic;
signal tft_lcd_de      : std_logic;
signal tft_lcd_reset_b : std_logic;
signal sysace_mpa      : std_logic_vector(6 downto 0);
signal sysace_mpce     : std_ulogic;
signal sysace_mpirq    : std_ulogic;
signal sysace_mpoe     : std_ulogic;
signal sysace_mpwe     : std_ulogic;
signal sysace_d        : std_logic_vector(15 downto 0);
--pcie--
signal cor_sys_reset_n : std_logic := '1';
signal ep_sys_clk_p : std_logic;
signal ep_sys_clk_n : std_logic;
signal rp_sys_clk : std_logic;

signal cor_pci_exp_txn : std_logic_vector(CFG_NO_OF_LANES-1 downto 0) := (others => '0');
signal cor_pci_exp_txp : std_logic_vector(CFG_NO_OF_LANES-1 downto 0) := (others => '0');
signal cor_pci_exp_rxn : std_logic_vector(CFG_NO_OF_LANES-1 downto 0) := (others => '0');
signal cor_pci_exp_rxp : std_logic_vector(CFG_NO_OF_LANES-1 downto 0) := (others => '0');
--pcie end--

signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
signal clk_200_p      : std_ulogic := '0';
signal clk_200_n      : std_ulogic := '1';
signal clk_33 : std_ulogic := '0';
signal clk_125_p  : std_ulogic := '0';
signal clk_125_n  : std_ulogic := '1';
signal rst_125    : std_ulogic;

constant lresp : boolean := false;

begin

-- clock and reset

  sys_clk <= not sys_clk after ct * 1 ns;
  sys_rst_in <= '0', '1' after 200 ns; 
  clk_200_p <= not clk_200_p after 2.5 ns;
  clk_200_n <= not clk_200_n after 2.5 ns;
  clk_125_p <= not clk_125_p after 4 ns;
  clk_125_n <= not clk_125_n after 4 ns;
  clk_33 <= not clk_33 after 15 ns;
  rxd1 <= 'H'; gpio(11) <= 'L';
  sram_clk_fb <= sram_clk; 
  ps2_keyb_data <= 'H'; ps2_keyb_clk <= 'H';
  ps2_mouse_clk <= 'H'; ps2_mouse_data <= 'H';
  iic_scl_main <= 'H'; iic_sda_main <= 'H';
  iic_scl_video <= 'H'; iic_sda_video <= 'H';
  sysace_d <= (others => 'H'); sysace_mpirq <= 'L';
  
  cpu : entity work.leon3mp
      generic map ( fabtech, memtech, padtech, transtech, ncpu, disas, dbguart, pclow )
      port map ( sys_rst_in, sys_clk, clk_200_p, clk_200_n, clk_33, sram_flash_addr,
        sram_flash_data, sram_cen, sram_bw, sram_oen, sram_flash_we_n, 
        flash_cen, flash_oen, flash_adv_n,sram_clk, sram_clk_fb, sram_mode, 
        sram_adv_ld_n, iosn,
        ddr_clk, ddr_clkb, ddr_cke, ddr_csb, ddr_odt, ddr_web,
        ddr_rasb, ddr_casb, ddr_dm, ddr_dqsp, ddr_dqsn, ddr_ad, ddr_ba, ddr_dq, 
        txd1, rxd1, txd2, rxd2, gpio, led, bus_error,
        phy_gtx_clk, phy_mii_data, phy_tx_clk, phy_rx_clk, 
        phy_rx_data, phy_dv, phy_rx_er, phy_col, phy_crs, 
        phy_tx_data, phy_tx_en, phy_tx_er, phy_mii_clk, phy_rst_n, phy_int,
        sgmii_rx_n, sgmii_rx_p, sgmii_tx_n, sgmii_tx_p, clk_125_n, clk_125_p,
        ps2_keyb_clk, ps2_keyb_data, ps2_mouse_clk, ps2_mouse_data,
        usb_csn, usb_rstn,
        iic_scl_main, iic_sda_main,
        iic_scl_video, iic_sda_video,
        tft_lcd_data, tft_lcd_clk_p, tft_lcd_clk_n, tft_lcd_hsync,
        tft_lcd_vsync, tft_lcd_de, tft_lcd_reset_b,
        sysace_mpa, sysace_mpce, sysace_mpirq, sysace_mpoe,
        sysace_mpwe, sysace_d, cor_pci_exp_txp, cor_pci_exp_txn, cor_pci_exp_rxp,
        cor_pci_exp_rxn, ep_sys_clk_p, ep_sys_clk_n, cor_sys_reset_n
        );

  ddr0 : ddr2ram
  generic map(width => 64, abits => 13, babits =>2, colbits => 10, rowbits => 13,
              implbanks => 1, fname => sdramfile, speedbin=>1, density => 2,
              lddelay => 100 us * CFG_MIG_DDR2)
  port map (ck => ddr_clk(0), ckn => ddr_clkb(0), cke => ddr_cke(0), csn => ddr_csb(0),
            odt => ddr_odt(0), rasn => ddr_rasb, casn => ddr_casb, wen => ddr_web,
            dm => ddr_dm, ba => ddr_ba(1 downto 0), a => ddr_ad(12 downto 0), dq => ddr_dq2,
            dqs => ddr_dqsp, dqsn =>ddr_dqsn);    

  nodqdel : if (CFG_MIG_DDR2 = 1) generate
    ddr2delay : delay_wire 
      generic map(data_width => ddr_dq'length, delay_atob => 0.0, delay_btoa => 0.0)
      port map(a => ddr_dq, b => ddr_dq2);
  end generate;
  
  dqdel : if (CFG_MIG_DDR2 = 0) generate
    ddr2delay : delay_wire 
      generic map(data_width => ddr_dq'length, delay_atob => 0.0, delay_btoa => 5.5)
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

  gmii_phy: if CFG_GRETH_SGMII = 0 generate

    phy_mii_data <= 'H';
    p0: phy
      generic map (address => 7)
      port map(phy_rst_n, phy_mii_data, phy_tx_clk, phy_rx_clk, phy_rx_data,
               phy_dv, phy_rx_er, phy_col, phy_crs, phy_tx_data, phy_tx_en,
               phy_tx_er, phy_mii_clk, phy_gtx_clk);

  end generate;

  sgmii_phy: if CFG_GRETH_SGMII /= 0 generate
    -- delaying rx line
    sgmii_rx_p <= transport sgmii_rx_p_d after 0.8 ns * slips;
    sgmii_rx_n <= transport sgmii_rx_n_d after 0.8 ns * slips;

    rst_125 <= not phy_rst_n;

    sp0: ser_phy
      generic map(
        address       => 7,
        extended_regs => 1,
        aneg          => 1,
        fd_10         => 1,
        hd_10         => 1,

        base100_t4    => 1,
        base100_x_fd  => 1,
        base100_x_hd  => 1,
        base100_t2_fd => 1,
        base100_t2_hd => 1,

        base1000_x_fd => 1,
        base1000_x_hd => 1,
        base1000_t_fd => 1,
        base1000_t_hd => 1,
        fabtech   => virtex5,
        memtech   => virtex5
      )
      port map(
        rstn      => phy_rst_n,
        clk_125   => clk_125_p,
        rst_125   => rst_125,
        eth_rx_p  => sgmii_rx_p_d,
        eth_rx_n  => sgmii_rx_n_d,
        eth_tx_p  => sgmii_tx_p,
        eth_tx_n  => sgmii_tx_n,
        mdio      => phy_mii_data,
        mdc       => phy_mii_clk
      );
  end generate;

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

