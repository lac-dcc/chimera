-----------------------------------------------------------------------------
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
use work.debug.all;

use work.config.all;	-- configuration

entity testbench is
  generic (
    pcie_target_simulation : integer := 0; -- set to 1 to test pci express, only if pcie_target is enabled
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW

  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal clk : std_logic := '0';
signal Rst : std_logic := '0';			-- Reset
constant ct : integer := 40;

signal address  : std_logic_vector(24 downto 0);
signal data     : std_logic_vector(15 downto 0);
signal button   : std_logic_vector(3 downto 0) := "0000";
signal genio   	: std_logic_vector(59 downto 0);
signal romsn  	: std_logic;
signal oen      : std_ulogic;
signal writen   : std_ulogic;
signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
    
signal txd1, rxd1 : std_logic;       
signal txd2, rxd2 : std_logic;       
signal ctsn1, rtsn1 : std_ulogic;       
signal ctsn2, rtsn2 : std_ulogic;       

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
signal phy_mii_int_n	: std_ulogic;

signal clk27       : std_ulogic := '0';
signal clk200p     : std_ulogic := '0';
signal clk200n     : std_ulogic := '1';
signal clk33      : std_ulogic := '0';

signal iic_scl       : std_ulogic;
signal iic_sda       : std_ulogic;
signal ddc_scl       : std_ulogic;
signal ddc_sda       : std_ulogic;
signal dvi_iic_scl   : std_logic;
signal dvi_iic_sda   : std_logic;

signal tft_lcd_data    : std_logic_vector(11 downto 0);
signal tft_lcd_clk_p   : std_ulogic;
signal tft_lcd_clk_n   : std_ulogic;
signal tft_lcd_hsync   : std_ulogic;
signal tft_lcd_vsync   : std_ulogic;
signal tft_lcd_de      : std_ulogic;
signal tft_lcd_reset_b : std_ulogic;

  -- DDR2 memory
  signal ddr_clk    : std_logic;
  signal ddr_clkb   : std_logic;
  signal ddr_clk_fb : std_logic;
  signal ddr_cke    : std_logic;
  signal ddr_csb    : std_logic := '0';
  signal ddr_we     : std_ulogic;                       -- write enable
  signal ddr_ras    : std_ulogic;                       -- ras
  signal ddr_cas    : std_ulogic;                       -- cas
  signal ddr_dm     : std_logic_vector(1 downto 0);     -- dm
  signal ddr_dqs    : std_logic_vector(1 downto 0);     -- dqs
  signal ddr_dqsn   : std_logic_vector(1 downto 0);     -- dqsn
  signal ddr3_tdqs_n   : std_logic_vector(1 downto 0);     -- dqsn
  signal ddr_ad     : std_logic_vector(12 downto 0);    -- address
  signal ddr_ba     : std_logic_vector(2 downto 0);     -- bank address
  signal ddr_dq     : std_logic_vector(15 downto 0);    -- data
  signal ddr_dq2    : std_logic_vector(15 downto 0);    -- data
  signal ddr_odt    : std_logic;
  signal ddr_reset_n: std_logic;
  signal ddr_rzq    : std_logic;
  signal ddr_zio    : std_logic;
  

    -- SPI flash
  signal spi_sel_n : std_ulogic;
  signal spi_clk   : std_ulogic;
  signal spi_mosi  : std_ulogic;

signal sysace_mpa     : std_logic_vector(6 downto 0);
signal sysace_mpce    : std_ulogic;
signal sysace_mpirq   : std_ulogic;
signal sysace_mpoe    : std_ulogic;
signal sysace_mpwe    : std_ulogic;
signal sysace_d       : std_logic_vector(7 downto 0);

  signal dsurst  : std_ulogic;
  signal errorn  : std_logic;

signal switch       : std_logic_vector(3 downto 0);    -- I/O port
signal led          : std_logic_vector(3 downto 0);    -- I/O port
constant lresp : boolean := false;


-----------------------------------------------------FOR PCIE---------------



  function REF_CLK_HALF_CYCLE(FREQ_SEL : integer) return integer is
  begin
    case FREQ_SEL is
      when 0 => return 5000; -- 100 MHz / 5000 ps half-cycle
      when 1 => return 4000; -- 125 MHz / 4000 ps half-cycle
      when others => return 1; -- invalid case
    end case;
  end REF_CLK_HALF_CYCLE;


component xilinx_pcie_2_0_rport_v6 is
    generic
    (
      REF_CLK_FREQ                      : integer := 0;
      ALLOW_X8_GEN2                     : boolean := FALSE;
      PL_FAST_TRAIN                     : boolean := FALSE;
      LINK_CAP_MAX_LINK_SPEED           : bit_vector := X"1";
      DEVICE_ID                         : bit_vector := X"0007";
      LINK_CAP_MAX_LINK_WIDTH           : bit_vector := X"08";
      LTSSM_MAX_LINK_WIDTH              : bit_vector := X"08";
      LINK_CAP_MAX_LINK_WIDTH_int       : integer := 8;
      LINK_CTRL2_TARGET_LINK_SPEED      : bit_vector := X"2";
      DEV_CAP_MAX_PAYLOAD_SUPPORTED     : integer := 2;
      USER_CLK_FREQ                     : integer := 3;
      VC0_TX_LASTPACKET                 : integer := 31;
      VC0_RX_RAM_LIMIT                  : bit_vector := X"03FF";
      VC0_TOTAL_CREDITS_CD              : integer := 154;
      VC0_TOTAL_CREDITS_PD              : integer := 154
    );
    port (
      sys_clk        : in  std_logic;
      sys_reset_n    : in  std_logic;

      pci_exp_rxn    : in  std_logic_vector((LINK_CAP_MAX_LINK_WIDTH_int - 1) downto 0);
      pci_exp_rxp    : in  std_logic_vector((LINK_CAP_MAX_LINK_WIDTH_int - 1) downto 0);
      pci_exp_txn    : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH_int - 1) downto 0);
      pci_exp_txp    : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH_int - 1) downto 0)
    );
  end component xilinx_pcie_2_0_rport_v6;

  component sys_clk_gen is
    generic
    (
      HALFCYCLE : integer := 500;
      OFFSET    : integer := 0
    );
    port
    (
      sys_clk   : out std_logic
    );
  end component sys_clk_gen;

  component sys_clk_gen_ds is
    generic
    (
      HALFCYCLE : integer := 500;
      OFFSET    : integer := 0
    );
    port
    (
      sys_clk_p : out std_logic;
      sys_clk_n : out std_logic
    );
  end component sys_clk_gen_ds;

  --
  -- System reset
  --
  signal  sys_reset_n    : std_logic;

  --
  -- System clocks
  --
  signal  rp_sys_clk     : std_logic;
  signal  ep_sys_clk_p   : std_logic;
  signal  ep_sys_clk_n   : std_logic;

  --
  -- PCI-Express Serial Interconnect
  --
  signal  ep_pci_exp_txn : std_logic_vector(0 downto 0);
  signal  ep_pci_exp_txp : std_logic_vector(0 downto 0);
  signal  rp_pci_exp_txn : std_logic_vector(0 downto 0);
  signal  rp_pci_exp_txp : std_logic_vector(0 downto 0);

  --
  -- Misc. signals
  --
  signal  led_0          : std_logic;
  signal  led_1          : std_logic;
  signal  led_2          : std_logic;

-----------------------------------------------pcie end--------------



begin

-- clock and reset

  clk27  <= not clk27 after ct * 1 ns;
  clk33  <= not clk33 after 15 ns;
  clk200p <= not clk200p after 2.5 ns;
  clk200n <= not clk200n after 2.5 ns;
  rst <= not dsurst; 
  rxd1 <= 'H'; ctsn1 <= '0';
  rxd2 <= 'H'; ctsn2 <= '0';
  button <= "0000";
  switch <= "0000";
---------------------pcie----------------------------------------------
pcie_sim: if pcie_target_simulation = 1 generate
  RP : xilinx_pcie_2_0_rport_v6
  generic map (
    REF_CLK_FREQ                  => 1,
    PL_FAST_TRAIN                 => TRUE,
    ALLOW_X8_GEN2                 => FALSE,
    LINK_CAP_MAX_LINK_SPEED       => X"1",
    DEVICE_ID                     => X"0007",
    LINK_CAP_MAX_LINK_WIDTH       => X"01",
    LTSSM_MAX_LINK_WIDTH          => X"01",
    LINK_CAP_MAX_LINK_WIDTH_int   => 1,
    LINK_CTRL2_TARGET_LINK_SPEED  => X"1",
    DEV_CAP_MAX_PAYLOAD_SUPPORTED => 2,
    USER_CLK_FREQ                 => 3,
    VC0_TX_LASTPACKET             => 31,
    VC0_RX_RAM_LIMIT              => X"03FF",
    VC0_TOTAL_CREDITS_CD          => 154,
    VC0_TOTAL_CREDITS_PD          => 154
  )
  port map (
    -- SYS Inteface
    sys_clk                  => rp_sys_clk,
    sys_reset_n              => sys_reset_n,

    -- PCI-Express Interface
    pci_exp_txn              => rp_pci_exp_txn,
    pci_exp_txp              => rp_pci_exp_txp,
    pci_exp_rxn              => ep_pci_exp_txn,
    pci_exp_rxp              => ep_pci_exp_txp
  );

  --
  -- Generate system clocks and reset
  --
  CLK_GEN_RP : sys_clk_gen
  generic map (
    HALFCYCLE => REF_CLK_HALF_CYCLE(1),
    OFFSET    => 0
  )
  port map (
    sys_clk => rp_sys_clk
  );

  CLK_GEN_EP : sys_clk_gen_ds
  generic map (
    HALFCYCLE => REF_CLK_HALF_CYCLE(1),
    OFFSET    => 0
  )
  port map (
    sys_clk_p => ep_sys_clk_p,
    sys_clk_n => ep_sys_clk_n
  );


  BOARD_INIT : process
  begin
    report("[" & time'image(now) & "] : System Reset Asserted...");
    sys_reset_n <= '0';

    for n in 0 to 499 loop
      wait until rising_edge(ep_sys_clk_p);
    end loop;

    report("[" & time'image(now) & "] : System Reset De-asserted...");
    sys_reset_n <= '1';

    wait until falling_edge(sys_reset_n); -- forever
  end process BOARD_INIT;
end generate;
--------------------------------------pcie---------------------------
  cpu : entity work.leon3mp
      generic map ( fabtech, memtech, padtech, clktech, 
	disas, dbguart, pclow )
      port map (rst, clk27, clk200p, clk200n, clk33, address(24 downto 1), 
	data, oen, writen, romsn,
	ddr_clk, ddr_clkb, ddr_cke, ddr_odt, ddr_reset_n, ddr_we, ddr_ras, ddr_cas, ddr_dm,
	ddr_dqs, ddr_dqsn, ddr_ad, ddr_ba, ddr_dq, ddr_rzq, ddr_zio,
	txd1, rxd1, ctsn1, rtsn1, button,
        switch, led, 
	phy_gtx_clk, phy_mii_data, phy_tx_clk, phy_rx_clk, 
	phy_rx_data, phy_dv, phy_rx_er,	phy_col, phy_crs, phy_tx_data,
	phy_tx_en, phy_tx_er, phy_mii_clk, phy_rst_n, phy_mii_int_n,
	iic_scl, iic_sda, ddc_scl, ddc_sda,
	dvi_iic_scl, dvi_iic_sda,
	tft_lcd_data, tft_lcd_clk_p, tft_lcd_clk_n, tft_lcd_hsync,
	tft_lcd_vsync, tft_lcd_de, tft_lcd_reset_b,
	spi_sel_n, spi_clk, spi_mosi, ep_pci_exp_txn(0), ep_pci_exp_txp(0), rp_pci_exp_txn(0),
        rp_pci_exp_txp(0), ep_sys_clk_p, ep_sys_clk_n, sys_reset_n,
        sysace_mpa, sysace_mpce, sysace_mpirq, sysace_mpoe,
        sysace_mpwe, sysace_d
      );

--  prom0 : sram generic map (index => 6, abits => romdepth, fname => promfile)
--	port map (address(romdepth-1 downto 0), data(31 downto 24), romsn,
--		  writen, oen);

  prom0 : for i in 0 to 1 generate
      sr0 : sram generic map (index => i+4, abits => 24, fname => promfile)
        port map (address(24 downto 1), data(15-i*8 downto 8-i*8), romsn,
                  writen, oen);
  end generate;
  address(0) <= '0';

  u1 : ddr3ram
    generic map (
      width => 16, abits => 13, fname => sdramfile,
      speedbin => 3,
      ldguard => 1
    )
    port map (
      ck => ddr_clk, ckn => ddr_clkb, cke => ddr_cke, csn => ddr_csb, odt => ddr_odt,
      rasn => ddr_ras, casn => ddr_cas, wen => ddr_we,
      dm => ddr_dm, ba => ddr_ba, a => ddr_ad, resetn => ddr_reset_n,
      dq => ddr_dq, dqs => ddr_dqs, dqsn => ddr_dqsn,
      doload => led(2)
    );

  errorn <= led(1);
  errorn <= 'H';			  -- ERROR pull-up

  phy0 : if (CFG_GRETH = 1) generate
    phy_mii_data <= 'H';
    p0: phy
      generic map (address => 7)
      port map(phy_rst_n, phy_mii_data, phy_tx_clk, phy_rx_clk, phy_rx_data,
               phy_dv, phy_rx_er, phy_col, phy_crs, phy_tx_data, phy_tx_en,
               phy_tx_er, phy_mii_clk, phy_gtx_clk);
  end generate;

  sysace_mpirq <= '0';
  sysace_d <= (others => 'Z');
  
   iuerr : process
   begin
     wait for 5000 ns;
     if to_x01(errorn) = '1' then wait on errorn; end if;
     assert (to_x01(errorn) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  data <= buskeep(data) after 5 ns;

  dsucom : process
    procedure dsucfg(signal dsurx : in std_ulogic; signal dsutx : out std_ulogic) is
    variable w32 : std_logic_vector(31 downto 0);
    variable c8  : std_logic_vector(7 downto 0);
    constant txp : time := 320 * 1 ns;
    begin
    dsutx <= '1';
    dsurst <= '0';
    wait for 2500 ns;
    dsurst <= '1';
    wait;
    wait for 5000 ns;
    txc(dsutx, 16#55#, txp);		-- sync uart

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#20#, 16#2e#, txp);

    wait for 25000 ns;
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#01#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#24#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0D#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#70#, 16#11#, 16#78#, txp);
    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#0D#, txp);

    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#44#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#20#, 16#00#, txp);

    txc(dsutx, 16#80#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#44#, txp);

    wait;
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#0a#, 16#aa#, txp);
    txa(dsutx, 16#00#, 16#55#, 16#00#, 16#55#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#0a#, 16#a0#, txp);
    txa(dsutx, 16#01#, 16#02#, 16#09#, 16#33#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2e#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#91#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2e#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0f#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#80#, 16#00#, 16#02#, 16#10#, txp);
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

    dsucfg(txd2, rxd2);

    wait;
  end process;
end ;

