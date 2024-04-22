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
use work.debug.all;
library techmap;
use techmap.gencomp.all;
library micron;
use micron.components.all;
library grlib;
use grlib.stdlib.all;

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
    romdepth  : integer := 20;		-- rom address depth
    sramwidth  : integer := 32;		-- ram data width (8/16/32)
    sramdepth  : integer := 20;		-- ram address depth
    srambanks  : integer := 2		-- number of ram banks
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents

signal clk : std_logic := '0';
signal Rst    : std_logic := '0';			-- Reset
constant ct : integer := clkperiod/2;

signal sma_clkout : std_ulogic;

signal address  : std_logic_vector(22 downto 0);
signal data     : std_logic_vector(31 downto 24);

signal ramsn    : std_logic_vector(4 downto 0);
signal ramoen   : std_logic_vector(4 downto 0);
signal rwen     : std_logic_vector(3 downto 0);
signal rwenx    : std_logic_vector(3 downto 0);
signal romsn    : std_logic;
signal iosn     : std_logic;
signal oen      : std_logic;
signal read     : std_logic;
signal writen   : std_logic;
signal brdyn    : std_logic;
signal bexcn    : std_logic;
signal dsuen, dsutx, dsurx, dsubre, dsuact : std_logic;
signal dsurst   : std_logic;
signal test     : std_logic;
signal error    : std_logic;
signal gpio	: std_logic_vector(35 downto 0);
signal GND      : std_logic := '0';
signal VCC      : std_logic := '1';
signal NC       : std_logic := 'Z';
signal clk2     : std_logic := '1';
    
signal sdcke    : std_logic;
signal sdcsn    : std_logic;
signal sdwen    : std_logic;                       -- write en
signal sdrasn   : std_logic;                       -- row addr stb
signal sdcasn   : std_logic;                       -- col addr stb
signal sddqm    : std_logic_vector ( 3 downto 0);  -- data i/o mask
signal sdclk    : std_logic;       
signal plllock    : std_logic;       
signal txd1, rxd1 : std_logic;       

signal etx_clk, erx_clk, erx_dv, erx_er, erx_col : std_logic := '0';
signal eth_gtxclk, erx_crs, etx_en, etx_er : std_logic :='0';
signal eth_macclk  : std_logic := '0';
signal erxd, etxd  : std_logic_vector(7 downto 0) := (others => '0');  
signal emdc, emdio : std_logic; --dummy signal for the mdc,mdio in the phy which is not used
signal emdintn     : std_logic := '1';

signal emddis 	: std_logic;    
signal epwrdwn 	: std_logic;
signal ereset 	: std_logic;
signal esleep 	: std_logic;
signal epause 	: std_logic;




constant lresp : boolean := false;

signal sa      	: std_logic_vector(14 downto 0);
signal sd   	: std_logic_vector(31 downto 0);

signal can_txd	: std_logic_vector(0 to CFG_CAN_NUM-1);
signal can_rxd	: std_logic_vector(0 to CFG_CAN_NUM-1);
signal can_stb	: std_logic_vector(0 to CFG_CAN_NUM-1);

signal clk_1553   : std_logic;
signal busainen   : std_logic;
signal busainp    : std_logic;
signal busainn    : std_logic;
signal busaoutin  : std_logic;
signal busaoutp   : std_logic;
signal busaoutn   : std_logic;
signal busbinen   : std_logic;
signal busbinp    : std_logic;
signal busbinn    : std_logic;
signal busboutin  : std_logic;
signal busboutp   : std_logic;
signal busboutn   : std_logic;


begin

-- clock and reset

  clk <= not clk after ct * 1 ns;
  rst <= dsurst;
  dsuen <= '1';
  dsubre <= '1'; -- inverted on the board
  rxd1 <= '1';
  can_rxd <= (others => 'H'); bexcn <= '1';
  gpio(2 downto 0) <= "LHL"; 
  gpio(CFG_GRGPIO_WIDTH-1 downto 3) <= (others => 'H');
  eth_macclk <= not eth_macclk after 4 ns;
  
  ereset <= 'H';
  
  d3 : entity work.leon3mp
        generic map ( fabtech, memtech, padtech, clktech, disas, dbguart, pclow )
        port map (rst, clk, sma_clkout, error, address(22 downto 0), data, 
	sa(12 downto 0), sa(14 downto 13), sd, sdclk, sdcke, sdcsn, sdwen, 
	sdrasn, sdcasn, sddqm, dsutx, dsurx, dsubre, dsuact,
	oen, writen, open, open, romsn, gpio,
        emdio, eth_macclk, etx_clk, erx_clk, erxd(3 downto 0), erx_dv, erx_er,
        erx_col, erx_crs, emdintn, ereset, etxd(3 downto 0), etx_en, etx_er, emdc, 
	can_txd, can_rxd, can_stb,
        clk_1553, busainen, busainp, busainn, busaoutin, busaoutp, busaoutn,
        busbinen, busbinp, busbinn, busboutin, busboutp, busboutn
	);

  sd1 : if ((CFG_MCTRL_SDEN = 1) and (CFG_MCTRL_SEPBUS = 1)) generate
    u0: mt48lc16m16a2 generic map (index => 0, fname => sdramfile)
	PORT MAP(
            Dq => sd(31 downto 16), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke,
            Cs_n => sdcsn, Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
    u1: mt48lc16m16a2 generic map (index => 16, fname => sdramfile)
	PORT MAP(
            Dq => sd(15 downto 0), Addr => sa(12 downto 0),
            Ba => sa(14 downto 13), Clk => sdclk, Cke => sdcke,
            Cs_n => sdcsn, Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
  end generate;

  prom0 : sram generic map (index => 6, abits => romdepth, fname => promfile)
	port map (address(romdepth-1 downto 0), data(31 downto 24), romsn,
		  writen, oen);

--  sram0 : for i in 0 to (sramwidth/8)-1 generate
--      sr0 : sram generic map (index => i, abits => sramdepth, fname => sramfile)
--	port map (address(sramdepth+1 downto 2), data(31-i*8 downto 24-i*8), ramsn(0),
--		  rwen(0), ramoen(0));
--  end generate;

 
  phy0 : if (CFG_GRETH = 1) generate
    emdio <= 'H'; 
    p0: phy
      generic map(address => 16)
      port map(ereset, emdio, etx_clk, erx_clk, erxd, erx_dv,
        erx_er, erx_col, erx_crs, etxd, etx_en, etx_er, emdc, eth_macclk);
  end generate;

  error <= 'H';			  -- ERROR pull-up

   iuerr : process
   begin
     wait for 2500 ns;
     if to_x01(error) = '1' then wait on error; end if;
     assert (to_x01(error) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

--  test0 :  grtestmod
--    port map ( rst, clk, error, address(21 downto 2), data,
--    	       iosn, oen, writen, brdyn);

--  data <= buskeep(data), (others => 'H') after 250 ns;
  data <= buskeep(data) after 5 ns;
--  sd <= buskeep(sd), (others => 'H') after 250 ns;
  sd <= buskeep(sd) after 5 ns;

  dsucom : process
    procedure dsucfg(signal dsurx : in std_logic; signal dsutx : out std_logic) is
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

