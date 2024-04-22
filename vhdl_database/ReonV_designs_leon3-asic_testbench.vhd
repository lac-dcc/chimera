------------------------------------------------------------------------------
--  LEON3 Demonstration design test bench
--  Copyright (C) 2013 Aeroflex Gaisler AB
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
use gaisler.jtagtst.all;

use work.config.all;  -- configuration

entity testbench is
  generic (
    fabtech   : integer := CFG_FABTECH;
    memtech   : integer := CFG_MEMTECH;
    padtech   : integer := CFG_PADTECH;
    clktech   : integer := CFG_CLKTECH;
    disas     : integer := CFG_DISAS; -- Enable disassembly to console
    dbguart   : integer := CFG_DUART; -- Print UART on console
    pclow     : integer := CFG_PCLOW;

    clkperiod : integer := 20;    -- system clock period
    romwidth  : integer := 32;    -- rom data width (8/32)
    romdepth  : integer := 20;    -- rom address depth
    sramwidth  : integer := 32;   -- ram data width (8/16/32)
    sramdepth  : integer := 20;   -- ram address depth
    srambanks  : integer := 2;    -- number of ram banks
    testen  : integer := 0;
    scanen  : integer := 0;
    testrst : integer := 0;
    testoen : integer := 0
  );
end; 

architecture behav of testbench is

constant promfile  : string := "prom.srec";  -- rom contents
constant sramfile  : string := "ram.srec";  -- ram contents
constant sdramfile : string := "ram.srec"; -- sdram contents
signal clk : std_logic := '0';
signal Rst    : std_logic := '0';     -- Reset
constant ct : integer := clkperiod/2;

signal address  : std_logic_vector(27 downto 0);
signal data     : std_logic_vector(31 downto 0);
signal cb  : std_logic_vector(15 downto 0);

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
signal gpio : std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0);
signal VCC      : std_ulogic := '1';
signal NC       : std_ulogic := 'Z';
signal clk2     : std_ulogic := '1';
    
signal sdcke    : std_logic_vector ( 1 downto 0);  -- clk en
signal sdcsn    : std_logic_vector ( 1 downto 0);  -- chip sel
signal sdwen    : std_ulogic;                       -- write en
signal sdrasn   : std_ulogic;                       -- row addr stb
signal sdcasn   : std_ulogic;                       -- col addr stb
signal sddqm    : std_logic_vector ( 3 downto 0);  -- data i/o mask
signal sdclk    : std_ulogic := '0';
signal lock    : std_ulogic;       
signal txd1, rxd1 : std_ulogic;       
signal txd2, rxd2 : std_ulogic;       
signal roen, roout, nandout, promedac : std_ulogic;       

constant lresp : boolean := false;

signal gnd    : std_logic_vector(3 downto 0);
signal clksel   : std_logic_vector(1 downto 0);
signal prom32   : std_ulogic;
signal spw_clksel : std_logic_vector(1 downto 0);

signal spw_clk  : std_ulogic := '0';
signal spw_rxd : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_rxs : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_txd : std_logic_vector(0 to CFG_SPW_NUM-1);
signal spw_txs : std_logic_vector(0 to CFG_SPW_NUM-1);

signal i2c_scl     : std_ulogic;
signal i2c_sda     : std_ulogic;
signal spi_miso    : std_logic;
signal spi_mosi    : std_logic;
signal spi_sck     : std_logic;
signal spi_slvsel  : std_logic_vector(CFG_SPICTRL_SLVS-1 downto 0);

signal trst,tck,tms,tdi,tdo: std_ulogic;

signal gtx_clk : std_ulogic := '0';
signal erx_clk : std_ulogic;
signal erxd    : std_logic_vector(7 downto 0);
signal erx_dv  : std_ulogic;
signal etx_clk : std_ulogic;
signal etxd    : std_logic_vector(7 downto 0);
signal etx_en  : std_ulogic;
signal etx_er  : std_ulogic;
signal erx_er  : std_ulogic;
signal erx_col : std_ulogic;
signal erx_crs : std_ulogic;
signal emdint  : std_ulogic;
signal emdio   : std_logic;
signal emdc    : std_ulogic;

begin

-- clock and reset

  test <= '0' when testen  = 0 else '1';
  rxd1 <= '1' when (testen = 1) and (testoen = 1) else
          '0' when (testen = 1) and (testoen = 0) else txd1;
  dsuen <= '1' when (testen = 1) and (testrst = 1) else
          '0' when (testen = 1) and (testrst = 0) else '1', '0' after 1500 ns;
  dsubre <= '1' when (testen = 1) and (scanen = 1) else
--          '0' when (testen = 1) and (scanen = 0) else '1';
          '0' when (testen = 1) and (scanen = 0) else '0';

  clksel <= "00";
  spw_clksel <= "00";
  error <= 'H';
  gnd <= "0000";
  clk <= not clk after ct * 1 ns;
  spw_clk <= not spw_clk after ct * 1 ns;
  gtx_clk <= not gtx_clk after 8 ns;
  rst <= dsurst;
  bexcn <= '1'; wdogn <= 'H';
--  gpio(2 downto 0) <= "HHL"; 
  gpio(CFG_GRGPIO_WIDTH-1 downto 0) <= (others => 'Z');
--  gpio(15 downto 11) <= "HLLHH"; --19
--  gpio(10 downto 8) <= "HLL"; --4
--  gpio(7 downto 0) <= (others => 'L');
  cb(15 downto 8) <= "HHHHHHHH";
  spw_rxd <= spw_txd; spw_rxs <= spw_txs;
  roen <= '0';
  promedac <= '0';
  prom32 <= '1';
  rxd2 <= txd2;
  
  d3 : entity work.leon3mp
        generic map ( 
           fabtech, memtech, padtech, clktech, disas, dbguart, pclow )
        port map (
           rst, clksel, clk, lock, error, wdogn, address, data, 
           cb(7 downto 0), sdclk, sdcsn, sdwen, 
           sdrasn, sdcasn, sddqm, dsutx, dsurx, dsuen, dsubre, dsuact, 
           txd1, rxd1, txd2, rxd2,
           ramsn, ramoen, rwen, oen, writen, read, iosn, romsn, brdyn, bexcn, gpio, 
           i2c_scl, i2c_sda,
           spi_miso, spi_mosi, spi_sck, spi_slvsel,
           prom32,
           spw_clksel, spw_clk, spw_rxd, spw_rxs, spw_txd, spw_txs,
           gtx_clk, erx_clk, erxd, erx_dv, etx_clk, etxd, etx_en, etx_er, erx_er, erx_col, erx_crs, emdint, emdio, emdc ,
           test, trst, tck, tms, tdi, tdo);

-- optional sdram


  sdcke <= "11";
  sd0 : if (CFG_MCTRL_SDEN = 1) and (CFG_MCTRL_SEPBUS = 0) generate
    u0: mt48lc16m16a2 generic map (index => 0, fname => sdramfile)
  PORT MAP(
            Dq => data(31 downto 16), Addr => address(14 downto 2),
            Ba => address(16 downto 15), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
    u1: mt48lc16m16a2 generic map (index => 16, fname => sdramfile)
  PORT MAP(
            Dq => data(15 downto 0), Addr => address(14 downto 2),
            Ba => address(16 downto 15), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(0), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
    u2: mt48lc16m16a2 generic map (index => 0, fname => sdramfile)
  PORT MAP(
            Dq => data(31 downto 16), Addr => address(14 downto 2),
            Ba => address(16 downto 15), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(3 downto 2));
    u3: mt48lc16m16a2 generic map (index => 16, fname => sdramfile)
  PORT MAP(
            Dq => data(15 downto 0), Addr => address(14 downto 2),
            Ba => address(16 downto 15), Clk => sdclk, Cke => sdcke(0),
            Cs_n => sdcsn(1), Ras_n => sdrasn, Cas_n => sdcasn, We_n => sdwen,
            Dqm => sddqm(1 downto 0));
  end generate;

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

  phy0 : if (CFG_GRETH = 1) generate
   emdio <= 'H';
   emdint <= '0';
   p0: phy
    generic map (
             address       => 7,
             extended_regs => 1,
             aneg          => 1,
             base100_t4    => 1,
             base100_x_fd  => 1,
             base100_x_hd  => 1,
             fd_10         => 1,
             hd_10         => 1,
             base100_t2_fd => 1,
             base100_t2_hd => 1,
             base1000_x_fd => 0,
             base1000_x_hd => 0,
             base1000_t_fd => 0,
             base1000_t_hd => 0,
             rmii          => 0,
             rgmii         => 0
    )
    port map(rst, emdio, etx_clk, erx_clk, erxd,
             erx_dv, erx_er, erx_col, erx_crs, etxd,
             etx_en, etx_er, emdc, gtx_clk);
  
  end generate;

  spimem0: if (CFG_SPICTRL_ENABLE = 1) generate
    s0 : spi_flash generic map (ftype => 4, debug => 0, fname => promfile,
                                readcmd => CFG_SPIMCTRL_READCMD,
                                dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                                dualoutput => 0) 
      port map (spi_sck, spi_mosi, spi_miso, spi_slvsel(0));
  end generate spimem0;

   iuerr : process
   begin
     wait for 2500 ns;
     if to_x01(error) = '1' then wait on error; end if;
     assert (to_x01(error) = '1') 
       report "*** IU in error mode, simulation halted ***"
         severity failure ;
   end process;

  bst0: process
  begin
    trst <= '0';
    tck <= '0';
    tms <= '1';
    tdi <= '0';
    wait for 2500 ns;
    trst <= '1';
    if to_x01(error) = '1' then wait on error; end if;
    if CFG_BOUNDSCAN_EN /= 0 then bscantest(tdo,tck,tms,tdi,10); end if;
    assert false
       report "*** IU in error mode, simulation halted ***"
       severity failure ;
    wait;
  end process;

  
  test0 :  grtestmod
    port map ( rst, clk, error, address(21 downto 2), data,
             iosn, oen, writen, brdyn);

  data <= buskeep(data) after 5 ns;
  cb <= buskeep(cb) after 5 ns;

  dsucom : process
    procedure dsucfg(signal dsurx : in std_ulogic; signal dsutx : out std_ulogic) is
    variable w32 : std_logic_vector(31 downto 0);
    variable c8  : std_logic_vector(7 downto 0);
    constant txp : time := clkperiod*16 * 1 ns;
    begin
    dsutx <= '1';
    dsurst <= '0';
    wait for 500 ns;
    dsurst <= '1';
    wait; -- remove to run the DSU UART
    wait for 5010 ns;
    txc(dsutx, 16#55#, txp);    -- sync uart
    txc(dsutx, 16#55#, txp);    -- sync uart

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

    txc(dsutx, 16#80#, txp);
    txa(dsutx, 16#40#, 16#00#, 16#00#, 16#00#, txp);
    rxi(dsurx, w32, txp, lresp);

    wait;

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#2f#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#00#, 16#00#, 16#20#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#01#, txp);

    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#40#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#0e#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#30#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#40#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#06#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#30#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#40#, 16#00#, 16#40#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#02#, txp);
    txc(dsutx, 16#c0#, txp);
    txa(dsutx, 16#90#, 16#30#, 16#00#, 16#00#, txp);
    txa(dsutx, 16#00#, 16#00#, 16#00#, 16#00#, txp);

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

