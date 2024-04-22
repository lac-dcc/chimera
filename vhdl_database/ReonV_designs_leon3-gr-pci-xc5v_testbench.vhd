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
use gaisler.gr1553b_pkg.all;
use work.debug.all;
library techmap;
use techmap.gencomp.all;
library micron;
use micron.components.all;

use work.config.all;	-- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS;	-- Enable disassembly to console
    dbguart   : integer := CFG_DUART;	-- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 20;		-- system clock period
    romwidth  : integer := 32;		-- rom data width (8/32)
    romdepth  : integer := 16;		-- rom address depth
    sramwidth  : integer := 32;		-- ram data width (8/16/32)
    sramdepth  : integer := 21;		-- ram address depth
    srambanks  : integer := 2;		-- number of ram banks
    rsedac     : integer := CFG_MCTRLFT_EDAC/3		-- use RS encoding
  );
  port (
    pci_rst     : inout std_ulogic;	-- PCI bus
    pci_clk 	: in std_ulogic;
    pci_gnt     : in std_ulogic;
    pci_idsel   : in std_ulogic;  
    pci_lock    : inout std_ulogic;
    pci_ad 	: inout std_logic_vector(31 downto 0);
    pci_cbe 	: inout std_logic_vector(3 downto 0);
    pci_frame   : inout std_ulogic;
    pci_irdy 	: inout std_ulogic;
    pci_trdy 	: inout std_ulogic;
    pci_devsel  : inout std_ulogic;
    pci_stop 	: inout std_ulogic;
    pci_perr 	: inout std_ulogic;
    pci_par 	: inout std_ulogic;    
    pci_req 	: inout std_ulogic;
    pci_serr    : inout std_ulogic;
    pci_host   	: in std_ulogic := '1';
    pci_66	: in std_ulogic := '0'
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal clk : std_logic := '0';
signal Rst    : std_logic := '0';			-- Reset
constant ct : integer := clkperiod/2;

signal address  : std_logic_vector(27 downto 0);
signal data     : std_logic_vector(31 downto 0);

signal ramsn    : std_logic_vector(4 downto 0);
signal ramoen   : std_logic_vector(4 downto 0);
signal rwen     : std_logic_vector(3 downto 0);
signal rwenx    : std_logic_vector(3 downto 0);
signal romsn    : std_logic_vector(1 downto 0);
signal iosn     : std_ulogic;
signal oen      : std_ulogic;
signal read     : std_ulogic;
signal writen   : std_ulogic;
signal brdyn    : std_ulogic;
signal bexcn    : std_ulogic;
signal wdogn    : std_logic;
signal dsuen, dsutx, dsurx, dsubre, dsuact : std_ulogic;
signal dsurst   : std_ulogic;
signal test     : std_ulogic;
signal error    : std_logic;
signal gpio	: std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
signal clk2     : std_ulogic := '1';
    
signal sdcke    : std_logic_vector ( 1 downto 0);  -- clk en
signal sdcsn    : std_logic_vector ( 1 downto 0);  -- chip sel
signal sdwen    : std_ulogic;                       -- write en
signal sdrasn   : std_ulogic;                       -- row addr stb
signal sdcasn   : std_ulogic;                       -- col addr stb
signal sddqm    : std_logic_vector ( 7 downto 0);  -- data i/o mask
signal sdclk    : std_ulogic;       
signal plllock    : std_ulogic;       
signal txd1, rxd1 : std_ulogic;       
signal txd2, rxd2 : std_ulogic;       

signal etx_clk, erx_clk, erx_dv, erx_er, erx_col : std_logic := '0';
signal eth_gtxclk, erx_crs, etx_en, etx_er : std_logic :='0';
signal eth_macclk  : std_logic := '0';
signal erxd, etxd  : std_logic_vector(7 downto 0) := (others => '0');  
signal emdc, emdio : std_logic; --dummy signal for the mdc,mdio in the phy which is not used

signal emddis 	: std_logic;    
signal epwrdwn 	: std_logic;
signal ereset 	: std_logic;
signal esleep 	: std_logic;
signal epause 	: std_logic;
signal emdintn 	: std_logic;



constant lresp : boolean := false;

signal sa      	: std_logic_vector(14 downto 0);
signal sd   	: std_logic_vector(63 downto 0);

signal pci_arb_req, pci_arb_gnt : std_logic_vector(0 to 3);

signal can_txd	: std_logic_vector(0 to CFG_CAN_NUM-1);
signal can_rxd	: std_logic_vector(0 to CFG_CAN_NUM-1);

signal can_stb	: std_ulogic;

signal spw_clk	: std_ulogic := '0';
signal spw_rxdp : std_logic_vector(0 to CFG_SPW_NUM-1) := (others => '0');
signal spw_rxdn : std_logic_vector(0 to CFG_SPW_NUM-1) := (others => '0');
signal spw_rxsp : std_logic_vector(0 to CFG_SPW_NUM-1) := (others => '0');
signal spw_rxsn : std_logic_vector(0 to CFG_SPW_NUM-1) := (others => '0');
signal spw_txdp : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_txdn : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_txsp : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_txsn : std_logic_vector(0 to CFG_SPW_NUM-1);

signal usb_clkout  : std_ulogic := '0';
signal usb_d       : std_logic_vector(7 downto 0);
signal usb_resetn  : std_ulogic;
signal usb_nxt     : std_ulogic;
signal usb_stp     : std_ulogic;
signal usb_dir     : std_ulogic;
signal usb_id      : std_ulogic;
signal usb_fault   : std_ulogic;
signal usb_enablen : std_ulogic;
signal usb_csn     : std_ulogic;
signal usb_faultn  : std_ulogic;
signal usb_clock   : std_ulogic;
signal usb_vbus    : std_ulogic;
signal cb     : std_logic_vector(7 downto 0);

signal busainen    :  std_logic_vector(0 to 0); 
signal busainp     :  std_logic_vector(0 to 0);
signal busainn     :  std_logic_vector(0 to 0);
signal busaoutin   :  std_logic_vector(0 to 0); 
signal busaoutp    :  std_logic_vector(0 to 0); 
signal busaoutn    :  std_logic_vector(0 to 0); 
signal busbinen    :  std_logic_vector(0 to 0); 
signal busbinp     :  std_logic_vector(0 to 0);
signal busbinn     :  std_logic_vector(0 to 0);
signal busboutin   :  std_logic_vector(0 to 0); 
signal busboutp    :  std_logic_vector(0 to 0); 
signal busboutn    :  std_logic_vector(0 to 0);

signal milbusA,milbusB: wire1553;

begin

-- clock and reset

  clk <= not clk after ct * 1 ns;
  spw_clk <= not spw_clk after 10 ns;
  rst <= dsurst;
  dsuen <= '1'; dsubre <= '0'; rxd1 <= '1';
  can_rxd <= (others => 'H'); bexcn <= '1'; wdogn <= 'H';
  gpio(2 downto 0) <= "LHL"; 
  gpio(CFG_GRGPIO_WIDTH-1 downto 3) <= (others => 'H');
  pci_arb_req <= "HHHH";
  eth_macclk <= not eth_macclk after 4 ns;
  
  emdintn <= 'H';

  -- spacewire loop-back
  spw_rxdp <= spw_txdp; spw_rxdn <= spw_txdn;
  spw_rxsp <= spw_txsp; spw_rxsn <= spw_txsn;

  d3 : entity work.leon3mp
        generic map ( fabtech, memtech, padtech, clktech, disas, dbguart, pclow )
        port map (rst, clk, sdclk, error, wdogn, address(27 downto 0), data, cb, 
	sa, sd, sdclk, sdcke, sdcsn, sdwen, 
	sdrasn, sdcasn, sddqm, dsutx, dsurx, dsuen, dsubre, dsuact, txd1, rxd1,
	txd2, rxd2,
	ramsn, ramoen, rwen, oen, writen, read, iosn, romsn, brdyn, bexcn, gpio,
        emdio, eth_macclk, etx_clk, erx_clk, erxd, erx_dv, erx_er,
        erx_col, erx_crs, emdintn, etxd, etx_en, etx_er, emdc,
    	pci_rst, pci_clk, pci_gnt, pci_idsel, pci_lock, pci_ad, pci_cbe,
    	pci_frame, pci_irdy, pci_trdy, pci_devsel, pci_stop, pci_perr, pci_par,
    	pci_req, pci_serr, pci_host, pci_66, pci_arb_req, pci_arb_gnt, 
	can_txd, can_rxd,
	spw_clk, spw_rxdp, spw_rxdn, spw_rxsp, spw_rxsn, spw_txdp, 
	spw_txdn, spw_txsp, spw_txsn,
        usb_clkout, usb_d, usb_nxt, usb_stp, usb_dir,
--        usb_id, usb_fault, usb_enablen, usb_csn, usb_faultn, usb_clock, usb_vbus,
        usb_resetn,
                  busainen,busainp,busainn,busaoutin,busaoutp,busaoutn,
                  busbinen,busbinp,busbinn,busboutin,busboutp,busboutn
                  
	);

      cbbits : if CFG_MCTRLFT_EDAC /= 0 generate
        u0: mt48lc16m16a2 generic map (index => 0, fname => sdramfile)
          PORT MAP(
            Dq => sd(31 downto 16), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
        u1: mt48lc16m16a2 generic map (index => 16, fname => sdramfile)
          PORT MAP(
            Dq => sd(15 downto 0), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
        u2: mt48lc16m16a2 generic map (index => 0, fname => sdramfile)
          PORT MAP(
            Dq => sd(31 downto 16), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(1),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
        u3: mt48lc16m16a2 generic map (index => 16, fname => sdramfile)
          PORT MAP(
            Dq => sd(15 downto 0), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(1),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
        cb0: ftmt48lc16m16a2 generic map (index => 8+rsedac*7, fname => sdramfile)
	PORT MAP(
            Dq => sd(47 downto 32), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(5 downto 4));
        cb1: ftmt48lc16m16a2 generic map (index => 8+rsedac*7, fname => sdramfile)
	PORT MAP(
            Dq => sd(47 downto 32), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(1),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(5 downto 4));
      end generate;
      nocbbits : if CFG_MCTRLFT_EDAC = 0 generate
        u0: mt48lc16m16a2 generic map (index => 64, fname => sdramfile)
          PORT MAP(
            Dq => sd(31 downto 16), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
        u1: mt48lc16m16a2 generic map (index => 80, fname => sdramfile)
          PORT MAP(
            Dq => sd(15 downto 0), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
        u2: mt48lc16m16a2 generic map (index => 64, fname => sdramfile)
          PORT MAP(
            Dq => sd(31 downto 16), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(1),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
        u3: mt48lc16m16a2 generic map (index => 80, fname => sdramfile)
          PORT MAP(
            Dq => sd(15 downto 0), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(1),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
        u5: mt48lc16m16a2 generic map (index => 48, fname => sdramfile)
          PORT MAP(
            Dq => sd(47 downto 32), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(5 downto 4));
        u7: mt48lc16m16a2 generic map (index => 48, fname => sdramfile)
          PORT MAP(
            Dq => sd(47 downto 32), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(1),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(5 downto 4));
      end generate;
      u4: mt48lc16m16a2 generic map (index => 32, fname => sdramfile)
	PORT MAP(
            Dq => sd(63 downto 48), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(7 downto 6));
      u6: mt48lc16m16a2 generic map (index => 32, fname => sdramfile)
	PORT MAP(
            Dq => sd(63 downto 48), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(7 downto 6));

  prom0 : for i in 0 to (romwidth/8)-1 generate
      sr0 : sram generic map (index => i, abits => romdepth, fname => promfile)
	port map (address(romdepth+1 downto 2), data(31-i*8 downto 24-i*8), romsn(0),
		  rwen(i), oen);
  end generate;

  sram0 : for i in 0 to (sramwidth/8)-1 generate
      sr0 : sram generic map (index => i, abits => sramdepth, fname => sramfile)
	port map (address(sramdepth+1 downto 2), data(31-i*8 downto 24-i*8), ramsn(0),
		  rwen(0), ramoen(0));
  end generate;

  --sramcb0 : sramft generic map (index => 7, abits => sramdepth, fname => sramfile)
  --      port map (address(sramdepth+1 downto 2), cb(7 downto 0), ramsn(0), rwen(0), ramoen(0));
 
  phy0 : if (CFG_GRETH = 1) generate
    emdio <= 'H'; 
    p0: phy
      generic map(address => 1)
      port map(rst, emdio, etx_clk, erx_clk, erxd, erx_dv,
        erx_er, erx_col, erx_crs, etxd, etx_en, etx_er, emdc, eth_macclk);
  end generate;

  usbtr: if (CFG_GRUSBHC = 1) generate
    u0: ulpi
      port map (usb_clkout, usb_d, usb_nxt, usb_stp, usb_dir, usb_resetn);
  end generate usbtr;
  
  error <= 'H';			  -- ERROR pull-up

  miltr: if (CFG_GR1553B_ENABLE = 1) generate
    x: simtrans1553
      port map (milbusA,milbusB,
                busainen(0), busaoutin(0),
                busaoutp(0), busaoutn(0), busainp(0), busainn(0),
                busbinen(0), busboutin(0),
                busboutp(0), busboutn(0), busbinp(0), busbinn(0));
  end generate;
  
   iuerr : process
   begin
     wait for 2500 ns;
     if to_x01(error) = '1' then wait on error; end if;
     assert (to_x01(error) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  test0 :  grtestmod
    port map ( rst, clk, error, address(21 downto 2), data,
    	       iosn, oen, writen, brdyn);

--  data <= buskeep(data), (others => 'H') after 250 ns;
  data <= buskeep(data) after 5 ns;
--  sd <= buskeep(sd), (others => 'H') after 250 ns;
  sd <= buskeep(sd) after 5 ns;

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

