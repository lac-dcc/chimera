-----------------------------------------------------------------------------
--  LEON Demonstration design test bench
--  Copyright (C) 2008 - 2015 Cobham Gaisler AB
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
library cypress;
use cypress.components.all;
use work.debug.all;

use work.config.all;	-- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    transtech : integer := CFG_TRANSTECH;
    clktech   : integer := CFG_CLKTECH;
    ncpu      : integer := CFG_NCPU;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 10;		-- system clock period
    romwidth  : integer := 32;		-- rom data width (8/32)
    romdepth  : integer := 16 		-- rom address depth
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal sys_clk : std_logic := '0';
signal sys_rst_in : std_logic := '0';			-- Reset
constant ct : integer := clkperiod/2;
signal clk_125_p  : std_ulogic := '0';
signal clk_125_n  : std_ulogic := '1';
constant slips : integer := 11;
signal rst_125    : std_ulogic;

signal sysace_fpga_clk  : std_ulogic := '0';
signal flash_we_b       : std_ulogic;
signal flash_wait       : std_ulogic;
signal flash_reset_b    : std_ulogic;
signal flash_oe_b       : std_ulogic;
signal flash_d          : std_logic_vector(15 downto 0);
signal flash_clk        : std_ulogic;
signal flash_ce_b       : std_ulogic;
signal flash_adv_b      : std_logic;
signal flash_a          : std_logic_vector(21 downto 0);
signal sram_bw          : std_ulogic;
signal sim_d            : std_logic_vector(15 downto 0);
signal iosn             : std_ulogic;
signal dimm1_ddr2_we_b  : std_ulogic;
signal dimm1_ddr2_s_b   : std_logic_vector(1 downto 0);
signal dimm1_ddr2_ras_b : std_ulogic;
signal dimm1_ddr2_pll_clkin_p : std_ulogic;
signal dimm1_ddr2_pll_clkin_n : std_ulogic;
signal dimm1_ddr2_odt   : std_logic_vector(1 downto 0);
signal dimm1_ddr2_dqs_p : std_logic_vector(8 downto 0);
signal dimm1_ddr2_dqs_n : std_logic_vector(8 downto 0);
signal dimm1_ddr2_dqm   : std_logic_vector(8 downto 0);
signal dimm1_ddr2_dq    : std_logic_vector(71 downto 0);
signal dimm1_ddr2_dq2   : std_logic_vector(71 downto 0);
signal dimm1_ddr2_cke   : std_logic_vector(1 downto 0);
signal dimm1_ddr2_cas_b : std_ulogic;
signal dimm1_ddr2_ba    : std_logic_vector(2 downto 0);
signal dimm1_ddr2_a     : std_logic_vector(13 downto 0);
signal dimm0_ddr2_we_b  : std_ulogic;
signal dimm0_ddr2_s_b   : std_logic_vector(1 downto 0);
signal dimm0_ddr2_ras_b : std_ulogic;
signal dimm0_ddr2_pll_clkin_p : std_ulogic;
signal dimm0_ddr2_pll_clkin_n : std_ulogic;
signal dimm0_ddr2_odt   : std_logic_vector(1 downto 0);
signal dimm0_ddr2_dqs_p : std_logic_vector(8 downto 0);
signal dimm0_ddr2_dqs_n : std_logic_vector(8 downto 0);
signal dimm0_ddr2_dqm   : std_logic_vector(8 downto 0);
signal dimm0_ddr2_dq    : std_logic_vector(71 downto 0);
signal dimm0_ddr2_dq2   : std_logic_vector(71 downto 0);
signal dimm0_ddr2_cke   : std_logic_vector(1 downto 0);
signal dimm0_ddr2_cas_b : std_ulogic;
signal dimm0_ddr2_ba    : std_logic_vector(2 downto 0);
signal dimm0_ddr2_a     : std_logic_vector(13 downto 0);
signal phy0_txer        : std_ulogic;
signal phy0_txd         : std_logic_vector(3 downto 0);
signal phy0_txctl_txen  : std_ulogic;
signal phy0_txclk       : std_ulogic;
signal phy0_rxer        : std_ulogic;
signal phy0_rxd         : std_logic_vector(3 downto 0);
signal phy0_rxctl_rxdv  : std_ulogic;
signal phy0_rxclk       : std_ulogic;
signal phy0_reset       : std_ulogic;
signal phy0_mdio        : std_logic;
signal phy0_mdc         : std_ulogic;
signal phy1_reset         : std_logic;
signal phy1_mdio          : std_logic;
signal phy1_mdc           : std_logic;
signal phy1_sgmii_tx_p    : std_logic;
signal phy1_sgmii_tx_n    : std_logic;
signal phy1_sgmii_rx_p    : std_logic;
signal phy1_sgmii_rx_n    : std_logic;
signal phy1_sgmii_rx_p_d  : std_logic;
signal phy1_sgmii_rx_n_d  : std_logic;
signal sysace_mpa       : std_logic_vector(6 downto 0);
signal sysace_mpce      : std_ulogic;
signal sysace_mpirq     : std_ulogic;
signal sysace_mpoe      : std_ulogic;
signal sysace_mpwe      : std_ulogic;
signal sysace_mpd       : std_logic_vector(15 downto 0);
signal dbg_led          : std_logic_vector(3 downto 0);
signal opb_bus_error    : std_ulogic;
signal plb_bus_error    : std_ulogic;
signal dvi_xclk_p       : std_ulogic;
signal dvi_xclk_n       : std_ulogic;
signal dvi_v            : std_ulogic;
signal dvi_reset_b      : std_ulogic;
signal dvi_h            : std_ulogic;
signal dvi_gpio1        : std_logic;
signal dvi_de           : std_ulogic;
signal dvi_d            : std_logic_vector(11 downto 0);
signal pci_p_trdy_b     : std_logic;
signal pci_p_stop_b     : std_logic;
signal pci_p_serr_b     : std_logic;
signal pci_p_rst_b      : std_logic;
signal pci_p_req_b      : std_logic_vector(0 to 4);
signal pci_p_perr_b     : std_logic;
signal pci_p_par        : std_logic;
signal pci_p_lock_b     : std_logic;
signal pci_p_irdy_b     : std_logic;
signal pci_p_intd_b     : std_logic;
signal pci_p_intc_b     : std_logic;
signal pci_p_intb_b     : std_logic;
signal pci_p_inta_b     : std_logic;
signal pci_p_gnt_b      : std_logic_vector(0 to 4);
signal pci_p_frame_b    : std_logic;
signal pci_p_devsel_b   : std_logic;
signal pci_p_clk5_r     : std_ulogic;
signal pci_p_clk5       : std_ulogic;
signal pci_p_clk4_r     : std_ulogic;
signal pci_p_clk3_r     : std_ulogic;
signal pci_p_clk1_r     : std_ulogic;
signal pci_p_clk0_r     : std_ulogic;
signal pci_p_cbe_b      : std_logic_vector(3 downto 0);
signal pci_p_ad         : std_logic_vector(31 downto 0);
--signal pci_fpga_idsel   : std_ulogic;
signal sbr_pwg_rsm_rstj : std_logic;
signal sbr_nmi_r        : std_ulogic;
signal sbr_intr_r       : std_ulogic;
signal sbr_ide_rst_b    : std_logic;
signal iic_sda_dvi      : std_logic;
signal iic_scl_dvi      : std_logic;
signal fpga_sda         : std_logic;
signal fpga_scl         : std_logic;
signal iic_therm_b      : std_ulogic;
signal iic_reset_b      : std_ulogic;
signal iic_irq_b        : std_ulogic;
signal iic_alert_b      : std_ulogic;
signal spi_data_out     : std_logic;
signal spi_data_in      : std_logic;
signal spi_data_cs_b    : std_ulogic;
signal spi_clk          : std_ulogic;
signal uart1_txd        : std_ulogic;
signal uart1_rxd        : std_ulogic;
signal uart1_rts_b      : std_ulogic;
signal uart1_cts_b      : std_ulogic;
signal uart0_txd        : std_ulogic;
signal uart0_rxd        : std_ulogic;
signal uart0_rts_b      : std_ulogic;
--signal uart0_cts_b      : std_ulogic;
--signal test_mon_vrefp   : std_ulogic;
signal test_mon_vp0_p   : std_ulogic;
signal test_mon_vn0_n   : std_ulogic;
--signal test_mon_avdd    : std_ulogic;

signal data             : std_logic_vector(31 downto 0);
signal phy0_rxdl        : std_logic_vector(7 downto 0);
signal phy0_txdl        : std_logic_vector(7 downto 0);

signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';

constant lresp : boolean := false;

begin

-- clock and reset

  sys_clk <= not sys_clk after ct * 1 ns;
  sys_rst_in <= '0', '1' after 200 ns; 
  sysace_fpga_clk <= not sysace_fpga_clk after 15 ns;
  pci_p_clk5 <= pci_p_clk5_r;
  clk_125_p <= not clk_125_p after 4 ns;
  clk_125_n <= not clk_125_n after 4 ns;

  flash_wait <= 'L';

  phy0_txdl <= "0000" &  phy0_txd; phy0_rxd <= phy0_rxdl(3 downto 0);
  
  sysace_mpd <= (others => 'H'); sysace_mpirq <= 'L';

  dbg_led <= (others => 'H');

  dvi_gpio1 <= 'H';
  
  pci_p_trdy_b <= 'H'; pci_p_stop_b <= 'H';
  pci_p_serr_b <= 'H'; pci_p_rst_b <= 'H';
  pci_p_req_b <= (others => 'H'); pci_p_perr_b <= 'H';
  pci_p_par <= 'H'; pci_p_lock_b <= 'H';
  pci_p_irdy_b <= 'H'; pci_p_intd_b <= 'H';
  pci_p_intc_b <= 'H'; pci_p_intb_b <= 'H';
  pci_p_inta_b <= 'H'; pci_p_gnt_b <= (others => 'H');
  pci_p_frame_b <= 'H'; pci_p_devsel_b <= 'H';
  pci_p_cbe_b <= (others => 'H'); pci_p_ad <= (others => 'H');
--  pci_fpga_idsel <= 'H';
  sbr_pwg_rsm_rstj <= 'H'; sbr_nmi_r <= 'H';
  sbr_intr_r <= 'L'; sbr_ide_rst_b <= 'H';
  
  iic_sda_dvi <= 'H'; iic_scl_dvi <= 'H';
  fpga_sda <= 'H'; fpga_scl <= 'H';
  iic_therm_b <= 'L'; iic_irq_b <= 'L'; iic_alert_b <= 'L';

  spi_data_out <= 'H';

  uart1_rxd <= 'H'; uart1_cts_b <= uart1_rts_b;
  uart0_rxd <= 'H'; --uart0_cts_b <= uart0_rts_b;

  test_mon_vp0_p <= 'H'; test_mon_vn0_n <= 'H';
    
  cpu : entity work.leon3mp
      generic map ( fabtech, memtech, padtech, transtech, ncpu, disas, dbguart, pclow )
      port map (sys_rst_in, sys_clk, sysace_fpga_clk,
                -- Flash
                flash_we_b, flash_wait, flash_reset_b, flash_oe_b,
                flash_d, flash_clk, flash_ce_b, flash_adv_b, flash_a,
                sram_bw, sim_d, iosn,
                -- DDR2 slot 1
                dimm1_ddr2_we_b, dimm1_ddr2_s_b, dimm1_ddr2_ras_b,
                dimm1_ddr2_pll_clkin_p, dimm1_ddr2_pll_clkin_n,
                dimm1_ddr2_odt, dimm1_ddr2_dqs_p, dimm1_ddr2_dqs_n,
                dimm1_ddr2_dqm, dimm1_ddr2_dq, dimm1_ddr2_cke,
                dimm1_ddr2_cas_b, dimm1_ddr2_ba, dimm1_ddr2_a,
                -- DDR2 slot 0
                dimm0_ddr2_we_b, dimm0_ddr2_s_b, dimm0_ddr2_ras_b,
                dimm0_ddr2_pll_clkin_p, dimm0_ddr2_pll_clkin_n,
                dimm0_ddr2_odt, dimm0_ddr2_dqs_p, dimm0_ddr2_dqs_n,
                dimm0_ddr2_dqm, dimm0_ddr2_dq, dimm0_ddr2_cke,
                dimm0_ddr2_cas_b, dimm0_ddr2_ba, dimm0_ddr2_a,
		open, 
                -- Ethernet PHY0
                phy0_txer, phy0_txd, phy0_txctl_txen, phy0_txclk,
                phy0_rxer, phy0_rxd, phy0_rxctl_rxdv, phy0_rxclk,
                phy0_reset, phy0_mdio, phy0_mdc,
                
                -- Ethernet PHY1
                clk_125_p, clk_125_n,
                phy1_reset, phy1_mdio, phy1_mdc, open,
                phy1_sgmii_tx_p, phy1_sgmii_tx_n, phy1_sgmii_rx_p, phy1_sgmii_rx_n,
                -- System ACE MPU
                sysace_mpa, sysace_mpce, sysace_mpirq, sysace_mpoe,
                sysace_mpwe, sysace_mpd,
                -- GPIO/Green LEDs
                dbg_led,
                -- Red/Green LEDs
                opb_bus_error, plb_bus_error,
                -- LCD
--                fpga_lcd_rw, fpga_lcd_rs, fpga_lcd_e, fpga_lcd_db,
                -- DVI
                dvi_xclk_p, dvi_xclk_n, dvi_v, dvi_reset_b, dvi_h,
                dvi_gpio1, dvi_de, dvi_d,
                -- PCI
                pci_p_trdy_b, pci_p_stop_b, pci_p_serr_b, pci_p_rst_b,
                pci_p_req_b, pci_p_perr_b, pci_p_par, pci_p_lock_b,
                pci_p_irdy_b, pci_p_intd_b, pci_p_intc_b, pci_p_intb_b,
                pci_p_inta_b, pci_p_gnt_b, pci_p_frame_b, pci_p_devsel_b,
                pci_p_clk5_r, pci_p_clk5, pci_p_clk4_r, pci_p_clk3_r,
                pci_p_clk1_r, pci_p_clk0_r, pci_p_cbe_b, pci_p_ad,
--                pci_fpga_idsel,
                sbr_pwg_rsm_rstj, sbr_nmi_r, sbr_intr_r, sbr_ide_rst_b, 
                -- IIC/SMBus and sideband signals
                iic_sda_dvi, iic_scl_dvi, fpga_sda, fpga_scl, iic_therm_b,
                iic_reset_b, iic_irq_b, iic_alert_b,
                -- SPI
                spi_data_out, spi_data_in, spi_data_cs_b, spi_clk,
                -- UARTs
                uart1_txd, uart1_rxd, uart1_rts_b, uart1_cts_b,
                uart0_txd, uart0_rxd, uart0_rts_b--, --uart0_cts_b
                -- System monitor
--                test_mon_vp0_p, test_mon_vn0_n
	);

  
  -- ddr2mem0: for i in 0 to (1 + 2*(CFG_DDR2SP_DATAWIDTH/64)) generate
  --   u1 : HY5PS121621F
  --     generic map (TimingCheckFlag => true, PUSCheckFlag => false,
  --                  index => (1 + 2*(CFG_DDR2SP_DATAWIDTH/64))-i, bbits => CFG_DDR2SP_DATAWIDTH,
  --                  fname => sdramfile, fdelay => 0)
  --     port map (DQ => dimm0_ddr2_dq2(i*16+15+32*(32/CFG_DDR2SP_DATAWIDTH) downto i*16+32*(32/CFG_DDR2SP_DATAWIDTH)),
  --               LDQS  => dimm0_ddr2_dqs_p(i*2+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               LDQSB => dimm0_ddr2_dqs_n(i*2+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               UDQS => dimm0_ddr2_dqs_p(i*2+1+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               UDQSB => dimm0_ddr2_dqs_n(i*2+1+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               LDM => dimm0_ddr2_dqm(i*2+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               WEB => dimm0_ddr2_we_b, CASB => dimm0_ddr2_cas_b,
  --               RASB => dimm0_ddr2_ras_b, CSB => dimm0_ddr2_s_b(0),
  --               BA => dimm0_ddr2_ba(1 downto 0), ADDR => dimm0_ddr2_a(12 downto 0),
  --               CKE => dimm0_ddr2_cke(0), CLK => dimm0_ddr2_pll_clkin_p,
  --               CLKB => dimm0_ddr2_pll_clkin_n,
  --               UDM => dimm0_ddr2_dqm(i*2+1+4*(32/CFG_DDR2SP_DATAWIDTH)));
  -- end generate;
  
  ddr2mem0 : ddr2ram
  generic map(width => CFG_DDR2SP_DATAWIDTH, abits => 14, babits => 3, colbits => 10, rowbits => 13,
              implbanks => 1, fname => sdramfile, speedbin=>1, density => 2)
  port map (ck => dimm0_ddr2_pll_clkin_p, ckn => dimm0_ddr2_pll_clkin_n,
            cke => dimm0_ddr2_cke(0), csn => dimm0_ddr2_s_b(0),
            odt => gnd, rasn => dimm0_ddr2_ras_b,
            casn => dimm0_ddr2_cas_b, wen => dimm0_ddr2_we_b,
            dm => dimm0_ddr2_dqm(7 downto 8-CFG_DDR2SP_DATAWIDTH/8), ba => dimm0_ddr2_ba,
            a => dimm0_ddr2_a, dq => dimm0_ddr2_dq2(63 downto 64-CFG_DDR2SP_DATAWIDTH),
            dqs => dimm0_ddr2_dqs_p(7 downto 8-CFG_DDR2SP_DATAWIDTH/8),
            dqsn =>dimm0_ddr2_dqs_n(7 downto 8-CFG_DDR2SP_DATAWIDTH/8));

  -- ddr2mem1: for i in 0 to (1 + 2*(CFG_DDR2SP_DATAWIDTH/64)) generate
  --   u1 : HY5PS121621F
  --     generic map (TimingCheckFlag => true, PUSCheckFlag => false,
  --                  index => (1 + 2*(CFG_DDR2SP_DATAWIDTH/64))-i, bbits => CFG_DDR2SP_DATAWIDTH,
  --                  fname => sdramfile, fdelay => 0)
  --     port map (DQ => dimm1_ddr2_dq2(i*16+15+32*(32/CFG_DDR2SP_DATAWIDTH) downto i*16+32*(32/CFG_DDR2SP_DATAWIDTH)),
  --               LDQS  => dimm1_ddr2_dqs_p(i*2+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               LDQSB => dimm1_ddr2_dqs_n(i*2+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               UDQS => dimm1_ddr2_dqs_p(i*2+1+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               UDQSB => dimm1_ddr2_dqs_n(i*2+1+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               LDM => dimm1_ddr2_dqm(i*2+4*(32/CFG_DDR2SP_DATAWIDTH)),
  --               WEB => dimm1_ddr2_we_b, CASB => dimm1_ddr2_cas_b,
  --               RASB => dimm1_ddr2_ras_b, CSB => dimm1_ddr2_s_b(0),
  --               BA => dimm1_ddr2_ba(1 downto 0), ADDR => dimm1_ddr2_a(12 downto 0),
  --               CKE => dimm1_ddr2_cke(0), CLK => dimm1_ddr2_pll_clkin_p,
  --               CLKB => dimm1_ddr2_pll_clkin_n,
  --               UDM => dimm1_ddr2_dqm(i*2+1+4*(32/CFG_DDR2SP_DATAWIDTH)));
  -- end generate;

  ddr2mem1 : ddr2ram
  generic map(width => CFG_DDR2SP_DATAWIDTH, abits => 13, babits =>2, colbits => 10, rowbits => 13,
              implbanks => 1, fname => sdramfile, speedbin=>1, density => 2)
  port map (ck => dimm1_ddr2_pll_clkin_p, ckn => dimm1_ddr2_pll_clkin_n,
            cke => dimm1_ddr2_cke(0), csn => dimm1_ddr2_s_b(0),
            odt => gnd, rasn => dimm1_ddr2_ras_b,
            casn => dimm1_ddr2_cas_b, wen => dimm1_ddr2_we_b,
            dm => dimm1_ddr2_dqm(CFG_DDR2SP_DATAWIDTH/8-1 downto 0), ba => dimm1_ddr2_ba(1 downto 0),
            a => dimm1_ddr2_a(12 downto 0), dq => dimm1_ddr2_dq2(CFG_DDR2SP_DATAWIDTH-1 downto 0),
            dqs => dimm1_ddr2_dqs_p(CFG_DDR2SP_DATAWIDTH/8-1 downto 0),
            dqsn =>dimm1_ddr2_dqs_n(CFG_DDR2SP_DATAWIDTH/8-1 downto 0));   


  ddr2delay0 : delay_wire 
    generic map(data_width => dimm0_ddr2_dq'length, delay_atob => 0.0, delay_btoa => 5.5)
    port map(a => dimm0_ddr2_dq, b => dimm0_ddr2_dq2);
  ddr2delay1 : delay_wire 
    generic map(data_width => dimm1_ddr2_dq'length, delay_atob => 0.0, delay_btoa => 5.5)
    port map(a => dimm1_ddr2_dq, b => dimm1_ddr2_dq2);

  prom0 : sram16 generic map (index => 4, abits => romdepth, fname => promfile)
	port map (flash_a(romdepth-1 downto 0), flash_d(15 downto 0),
		  gnd, gnd, flash_ce_b, flash_we_b, flash_oe_b);        

  phy0_mdio <= 'H';
  p0: phy
    generic map (address => 7)
    port map(phy0_reset, phy0_mdio, phy0_txclk, phy0_rxclk, phy0_rxdl,
             phy0_rxctl_rxdv, phy0_rxer, open, open, phy0_txdl,
             phy0_txctl_txen, phy0_txer, phy0_mdc, '0');

  rst_125 <= not phy1_reset;
  phy1_sgmii_rx_p <= transport phy1_sgmii_rx_p_d after 0.8 ns * slips;
  phy1_sgmii_rx_n <= transport phy1_sgmii_rx_n_d after 0.8 ns * slips;

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
      fabtech   => CFG_FABTECH,
      memtech   => CFG_MEMTECH,
      transtech => CFG_TRANSTECH
    )
    port map(
      rstn      => phy1_reset,
      clk_125   => clk_125_p,
      rst_125   => rst_125,
      eth_rx_p  => phy1_sgmii_rx_p_d,
      eth_rx_n  => phy1_sgmii_rx_n_d,
      eth_tx_p  => phy1_sgmii_tx_p,
      eth_tx_n  => phy1_sgmii_tx_n,
      mdio      => phy1_mdio,
      mdc       => phy1_mdc
    );
  i0: i2c_slave_model
      port map (iic_scl_dvi, iic_sda_dvi);

  i1: i2c_slave_model
      port map (fpga_scl, fpga_sda);
  
  iuerr : process
   begin
     wait for 5000 ns;
     if to_x01(opb_bus_error) = '0' then wait on opb_bus_error; end if;
     assert (to_x01(opb_bus_error) = '0') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  data <=  flash_d & sim_d;

  test0 :  grtestmod
    port map ( sys_rst_in, sys_clk, opb_bus_error, flash_a(20 downto 1), data,
    	       iosn, flash_oe_b, sram_bw, open);


  flash_d <= buskeep(flash_d), (others => 'H') after 250 ns;
  data <= buskeep(data), (others => 'H') after 250 ns;

end ;

