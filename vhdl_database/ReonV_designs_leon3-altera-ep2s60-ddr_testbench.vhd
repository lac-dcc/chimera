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
library cypress;
use cypress.components.all;

use work.debug.all;

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

signal clk : std_logic := '0';
signal clkout, pllref : std_ulogic;
signal Rst    : std_logic := '0';			-- Reset
constant ct : integer := clkperiod/2;

signal address  : std_logic_vector(23 downto 0);
signal data     : std_logic_vector(31 downto 0);
signal romsn    : std_ulogic;
signal iosn     : std_ulogic;
signal oen      : std_ulogic;
signal writen   : std_ulogic;
signal dsuen, dsutx, dsurx, dsubren, dsuact : std_ulogic;
signal dsurst   : std_ulogic;
signal test     : std_ulogic;
signal error    : std_logic;
signal gpio	: std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal GND      : std_ulogic := '0';
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
signal clk2     : std_ulogic := '1';
    
  signal ssram_ce1n   : std_logic;
  signal ssram_ce2    : std_logic;
  signal ssram_ce3n   : std_logic;
  signal ssram_wen    : std_logic;
  signal ssram_bw     : std_logic_vector (0 to 3);
  signal ssram_oen    : std_ulogic;
  signal ssaddr       : std_logic_vector(20 downto 2);
  signal ssdata       : std_logic_vector(31 downto 0);
  signal ssram_clk    : std_ulogic;
  signal ssram_adscn  : std_ulogic;
  signal ssram_adsp_n : std_ulogic;
  signal ssram_adv_n  : std_ulogic;
  signal datazz       : std_logic_vector(3 downto 0);

  -- ddr memory  
  signal ddr_clk  	: std_logic;
  signal ddr_clkb  	: std_logic;
  signal ddr_clkin      : std_logic;
  signal ddr_cke  	: std_logic;
  signal ddr_csb  	: std_logic;
  signal ddr_web  	: std_ulogic;                       -- ddr write enable
  signal ddr_rasb  	: std_ulogic;                       -- ddr ras
  signal ddr_casb  	: std_ulogic;                       -- ddr cas
  signal ddr_dm   	: std_logic_vector (1 downto 0);    -- ddr dm
  signal ddr_dqs  	: std_logic_vector (1 downto 0);    -- ddr dqs
  signal ddr_dqs2  	: std_logic_vector (1 downto 0);    -- ddr dqs
  signal ddr_ad      : std_logic_vector (12 downto 0);   -- ddr address
  signal ddr_ba      : std_logic_vector (1 downto 0);    -- ddr bank address
  signal ddr_dq, ddr_dq2 : std_logic_vector (15 downto 0); -- ddr data

signal plllock    : std_ulogic;       
signal txd1, rxd1 : std_ulogic;       
--signal txd2, rxd2 : std_ulogic;       

-- for smc lan chip
signal eth_aen    : std_ulogic; -- for smsc eth
signal eth_readn  : std_ulogic; -- for smsc eth
signal eth_writen : std_ulogic; -- for smsc eth
signal eth_nbe    : std_logic_vector(3 downto 0); -- for smsc eth
signal eth_datacsn : std_ulogic;

constant lresp : boolean := false;

signal sa      	: std_logic_vector(14 downto 0);
signal sd   	: std_logic_vector(31 downto 0);

begin

-- clock and reset

  clk <= not clk after ct * 1 ns;
  ddr_clkin <= not clk after ct * 1 ns;
  rst <= dsurst;
  dsubren <= '1'; rxd1 <= '1';

  dqs2delay : delay_wire 
    generic map(data_width => ddr_dqs'length, delay_atob => 3.0, delay_btoa => 1.0)
    port map(a => ddr_dqs, b => ddr_dqs2);

  ddr2delay : delay_wire 
    generic map(data_width => ddr_dq'length, delay_atob => 3.0, delay_btoa => 1.0)
    port map(a => ddr_dq, b => ddr_dq2);

--  ddr_dqs <= (others => 'L');
  d3 : entity work.leon3mp generic map (fabtech, memtech, padtech, clktech, 
	ncpu, disas, dbguart, pclow )
    port map (rst, clk, error, 
	address, data, romsn, oen, writen, open, open, 
	ssram_ce1n, ssram_ce2, ssram_ce3n, ssram_wen, ssram_bw, ssram_oen, ssaddr, ssdata,
	ssram_clk, ssram_adscn, ssram_adsp_n, ssram_adv_n,  iosn,
	ddr_clkin, ddr_clk, ddr_clkb, ddr_cke, ddr_csb, ddr_web, ddr_rasb, 
	ddr_casb, ddr_dm, ddr_dqs2, ddr_ad, ddr_ba, ddr_dq2, 
	dsubren, dsuact, rxd1, txd1,
	eth_aen, eth_readn, eth_writen, eth_nbe); 

  ddr2: ddrram
    generic map (width => 16, abits => 13,
                 colbits => 9, rowbits => 12, implbanks => 1,
                 fname => sdramfile, igndqs => 1)
    port map (
      ck => ddr_clk, cke => ddr_cke, csn => ddr_csb,
      rasn => ddr_rasb, casn => ddr_casb, wen => ddr_web,
      dm => ddr_dm, ba => ddr_ba, a => ddr_ad, dq => ddr_dq, dqs => ddr_dqs);

  datazz <= "HHHH";

  ssram0 : cy7c1380d generic map (fname => sramfile)
   port map(
      ioDq(35 downto 32) => datazz, ioDq(31 downto 0) => ssdata,
      iAddr => ssaddr(20 downto 2), iMode =>  gnd, 
      inGW => vcc, inBWE => ssram_wen, inADV => ssram_adv_n,
      inADSP => ssram_adsp_n, inADSC => ssram_adscn,
      iClk => ssram_clk, 
      inBwa => ssram_bw(3), inBwb => ssram_bw(2), 
      inBwc => ssram_bw(1), inBwd => ssram_bw(0),
      inOE => ssram_oen, inCE1 => ssram_ce1n, 
      iCE2 => ssram_ce2, inCE3 => ssram_ce3n, iZz => gnd);

  -- 8 bit prom
  prom0 : sram generic map (index => 6, abits => romdepth, fname => promfile)
	port map (address(romdepth-1 downto 0), data(31 downto 24), 
		  romsn, writen, oen);

  error <= 'H';			  -- ERROR pull-up

   iuerr : process
   begin
     wait for 2500 ns;
     if to_x01(error) = '1' then wait on error; end if;
     assert (to_x01(error) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  data <= buskeep(data), (others => 'H') after 250 ns;
  sd <= buskeep(sd), (others => 'H') after 250 ns;

  test0 :  grtestmod
    port map ( rst, clk, error, address(21 downto 2), data,
    	       iosn, oen, writen, open);


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

