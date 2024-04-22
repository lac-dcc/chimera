-----------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2013, Aeroflex Gaisler AB
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
use gaisler.jtag.all;
use work.config.all;

entity bschain is
  generic (tech: integer := CFG_FABTECH;
           enable: integer range 0 to 1 := CFG_BOUNDSCAN_EN;
           hzsup: integer range 0 to 1 := 1);
  port (
    -- Chain control signals
    chain_tck   : in std_ulogic;
    chain_tckn  : in std_ulogic;
    chain_tdi   : in std_ulogic;
    chain_tdo   : out std_ulogic;
    bsshft      : in std_ulogic;
    bscapt      : in std_ulogic;
    bsupdi      : in std_ulogic;
    bsupdo      : in std_ulogic;
    bsdrive     : in std_ulogic;
    bshighz     : in std_ulogic;
    
    -- Pad-side signals
    Presetn	: in  std_ulogic;
    Pclksel 	: in  std_logic_vector (1 downto 0);
    Pclk		: in  std_ulogic;
    Perrorn	: out std_ulogic;
    Paddress 	: out std_logic_vector(27 downto 0);
    Pdatain	: in std_logic_vector(31 downto 0);
    Pdataout	: out std_logic_vector(31 downto 0);
    Pdataen 	: out std_logic_vector(31 downto 0);
    Pcbin   	: in std_logic_vector(7 downto 0);
    Pcbout   	: out std_logic_vector(7 downto 0);
    Pcben   	: out std_logic_vector(7 downto 0);
    Psdclk  	: out std_ulogic;
    Psdcsn  	: out std_logic_vector (1 downto 0);    -- sdram chip select
    Psdwen  	: out std_ulogic;                       -- sdram write enable
    Psdrasn  	: out std_ulogic;                       -- sdram ras
    Psdcasn  	: out std_ulogic;                       -- sdram cas
    Psddqm   	: out std_logic_vector (3 downto 0);    -- sdram dqm
    Pdsutx  	: out std_ulogic; 			-- DSU tx data
    Pdsurx  	: in  std_ulogic;  			-- DSU rx data
    Pdsuen   	: in std_ulogic;
    Pdsubre  	: in std_ulogic;
    Pdsuact  	: out std_ulogic;
    Ptxd1   	: out std_ulogic; 			-- UART1 tx data
    Prxd1   	: in  std_ulogic;  			-- UART1 rx data
    Ptxd2   	: out std_ulogic; 			-- UART2 tx data
    Prxd2   	: in  std_ulogic;  			-- UART2 rx data
    Pramsn  	: out std_logic_vector (4 downto 0);
    Pramoen 	: out std_logic_vector (4 downto 0);
    Prwen   	: out std_logic_vector (3 downto 0);
    Poen    	: out std_ulogic;
    Pwriten 	: out std_ulogic;
    Pread   	: out std_ulogic;
    Piosn   	: out std_ulogic;
    Promsn  	: out std_logic_vector (1 downto 0);
    Pbrdyn  	: in  std_ulogic;
    Pbexcn  	: in  std_ulogic;
    Pwdogn  	: out std_ulogic;
    Pgpioin      : in std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    Pgpioout     : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    Pgpioen      : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    Pprom32	: in  std_ulogic;
    Ppromedac	: in  std_ulogic;

    Pspw_clksel 	: in  std_logic_vector (1 downto 0);
    Pspw_clk	: in  std_ulogic;
    Pspw_rxd     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    Pspw_rxs     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    Pspw_txd     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    Pspw_txs     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    Pspw_ten     : out std_logic_vector(0 to CFG_SPW_NUM-1);

    Plclk2x      : in  std_ulogic;
    Plclk4x      : in  std_ulogic;
    Plclkdis     : out std_ulogic;
    Plclklock    : in  std_ulogic;
    Plock        : out std_ulogic;

    Proen        : in  std_ulogic;
    Proout       : out std_ulogic;

    -- Core-side signals
    Cresetn	: out std_ulogic;
    Cclksel 	: out std_logic_vector (1 downto 0);
    Cclk		: out std_ulogic;
    Cerrorn	: in std_ulogic;
    Caddress 	: in std_logic_vector(27 downto 0);
    Cdatain	: out std_logic_vector(31 downto 0);
    Cdataout	: in std_logic_vector(31 downto 0);
    Cdataen 	: in std_logic_vector(31 downto 0);
    Ccbin   	: out std_logic_vector(7 downto 0);
    Ccbout   	: in  std_logic_vector(7 downto 0);
    Ccben   	: in  std_logic_vector(7 downto 0);
    Csdclk  	: in  std_ulogic;
    Csdcsn  	: in  std_logic_vector (1 downto 0);    -- sdram chip select
    Csdwen  	: in  std_ulogic;                       -- sdram write enable
    Csdrasn  	: in  std_ulogic;                       -- sdram ras
    Csdcasn  	: in  std_ulogic;                       -- sdram cas
    Csddqm   	: in  std_logic_vector (3 downto 0);    -- sdram dqm
    Cdsutx  	: in  std_ulogic; 			-- DSU tx data
    Cdsurx  	: out std_ulogic;  			-- DSU rx data
    Cdsuen   	: out std_ulogic;
    Cdsubre  	: out std_ulogic;
    Cdsuact  	: in std_ulogic;
    Ctxd1   	: in std_ulogic; 			-- UART1 tx data
    Crxd1   	: out std_ulogic;  			-- UART1 rx data
    Ctxd2   	: in  std_ulogic; 			-- UART2 tx data
    Crxd2   	: out std_ulogic;  			-- UART2 rx data
    Cramsn  	: in  std_logic_vector (4 downto 0);
    Cramoen 	: in  std_logic_vector (4 downto 0);
    Crwen   	: in  std_logic_vector (3 downto 0);
    Coen    	: in  std_ulogic;
    Cwriten 	: in  std_ulogic;
    Cread   	: in  std_ulogic;
    Ciosn   	: in  std_ulogic;
    Cromsn  	: in  std_logic_vector (1 downto 0);
    Cbrdyn  	: out std_ulogic;
    Cbexcn  	: out std_ulogic;
    Cwdogn  	: in  std_ulogic;
    Cgpioin      : out std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    Cgpioout     : in std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    Cgpioen      : in std_logic_vector(CFG_GRGPIO_WIDTH-1 downto 0); 	-- I/O port
    Cprom32	: out std_ulogic;
    Cpromedac	: out std_ulogic;

    Cspw_clksel 	: out std_logic_vector (1 downto 0);
    Cspw_clk	: out std_ulogic;
    Cspw_rxd     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    Cspw_rxs     : out std_logic_vector(0 to CFG_SPW_NUM-1);
    Cspw_txd     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    Cspw_txs     : in  std_logic_vector(0 to CFG_SPW_NUM-1);
    Cspw_ten     : in  std_logic_vector(0 to CFG_SPW_NUM-1);

    Clclk2x      : out std_ulogic;
    Clclk4x      : out std_ulogic;
    Clclkdis     : in  std_ulogic;
    Clclklock    : out std_ulogic;
    Clock        : in  std_ulogic;

    Croen        : out std_ulogic;
    Croout       : in  std_ulogic
    );

end;

architecture rtl of bschain is

  signal sr1_tdi, sr1a_tdi, sr2a_tdi, sr2_tdi, sr3a_tdi, sr3_tdi, sr4_tdi: std_ulogic;
  signal sr1i, sr1o: std_logic_vector(4 downto 0);
  signal sr3i, sr3o: std_logic_vector(41 downto 0);
  signal sr5i, sr5o: std_logic_vector(11+5*CFG_SPW_NUM downto 0);

begin


  -----------------------------------------------------------------------------
  -- Scan chain registers (note: adjust order to match pad ring)
  sr1a: bscanregs
    generic map (tech => tech, nsigs => sr1i'length, dirmask => 2#00001#, enable => enable)
    port map (sr1i, sr1o, chain_tck, chain_tckn, sr1a_tdi, chain_tdo,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);
    
  sr1i <= Presetn & Pclksel & Pclk & Cerrorn;
  Cresetn <= sr1o(4);      Cclksel <= sr1o(3 downto 2);
  Cclk <= sr1o(1);         Perrorn <= sr1o(0);

  sr1b: bscanregs
    generic map (tech => tech, nsigs => Paddress'length, dirmask => 16#3FFFFFFF#, enable => enable)
    port map (Caddress, Paddress, chain_tck, chain_tckn, sr1_tdi, sr1a_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);
    
  sr2a: bscanregsbd
    generic map (tech => tech, nsigs => Pdataout'length, enable => enable, hzsup => hzsup)
    port map (Pdataout, Pdataen, Pdatain, Cdataout, Cdataen, Cdatain,
              chain_tck, chain_tckn, sr2a_tdi, sr1_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);
  
  sr2b: bscanregsbd
    generic map (tech => tech, nsigs => Pcbout'length, enable => enable, hzsup => hzsup)
    port map (Pcbout, Pcben, Pcbin, Ccbout, Ccben, Ccbin,
              chain_tck, chain_tckn, sr2_tdi, sr2a_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);
  
  sr3a: bscanregs
    generic map (tech => tech, nsigs => sr3i'length-30, dirmask => 2#11_11111111_10#, enable => enable)
    port map (sr3i(sr3i'high downto 30), sr3o(sr3i'high downto 30), chain_tck, chain_tckn, sr3a_tdi, sr2_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);

  sr3b: bscanregs
    generic map (tech => tech, nsigs => 30, dirmask => 2#001101_01111111_11111111_11111001#, enable => enable)
    port map (sr3i(29 downto 0), sr3o(29 downto 0), chain_tck, chain_tckn, sr3_tdi, sr3a_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);
  
  sr3i(41 downto 30) <= Csdclk & Csdcsn & Csdwen & Csdrasn & Csdcasn &
                        Csddqm & Cdsutx & Pdsurx;
  sr3i(29 downto 23) <= Pdsuen & Pdsubre & Cdsuact & Ctxd1 & Prxd1 & Ctxd2 & Prxd2;
  sr3i(22 downto 9) <= Cramsn & Cramoen & Crwen;
  sr3i(8 downto 0) <= Coen & Cwriten & Cread & Ciosn & Cromsn(1 downto 0) & Pbrdyn & Pbexcn & Cwdogn;
  
  Psdclk <= sr3o(41);           Psdcsn <= sr3o(40 downto 39);  Psdwen <= sr3o(38);
  Psdrasn <= sr3o(37);          Psdcasn <= sr3o(36);           Psddqm <= sr3o(35 downto 32);
  Pdsutx <= sr3o(31);           Cdsurx <= sr3o(30);            Cdsuen <= sr3o(29);
  Cdsubre <= sr3o(28);          Pdsuact <= sr3o(27);           Ptxd1 <= sr3o(26);
  Crxd1 <= sr3o(25);            Ptxd2 <= sr3o(24);             Crxd2 <= sr3o(23);
  Pramsn <= sr3o(22 downto 18); Pramoen <= sr3o(17 downto 13); Prwen <= sr3o(12 downto 9);
  Poen <= sr3o(8);              Pwriten <= sr3o(7);            Pread <= sr3o(6);
  Piosn <= sr3o(5);             Promsn <= sr3o(4 downto 3);    Cbrdyn <= sr3o(2);
  Cbexcn <= sr3o(1);            Pwdogn <= sr3o(0);
  
  sr4: bscanregsbd
    generic map (tech => tech, nsigs => Pgpioin'length, enable => enable, hzsup => hzsup)
    port map (Pgpioout, Pgpioen, Pgpioin, Cgpioout, Cgpioen, Cgpioin,
              chain_tck, chain_tckn, sr4_tdi, sr3_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);

  sr5: bscanregs
    generic map (tech => tech, nsigs => sr5i'length, dirmask => 2#00000011_10010101#, enable => enable)
    port map (sr5i, sr5o, chain_tck, chain_tckn, chain_tdi, sr4_tdi,
              bsshft, bscapt, bsupdi, bsupdo, bsdrive, bshighz);

  sr5i <= Pprom32 & Ppromedac & Pspw_clksel & Pspw_clk & Pspw_rxd & Pspw_rxs &
          Cspw_txd & Cspw_txs & Cspw_ten & Plclk2x & Plclk4x &
          Clclkdis & Plclklock & Clock & Proen & Croout;

  Cprom32 <= sr5o(11+5*CFG_SPW_NUM);
  Cpromedac <= sr5o(10+5*CFG_SPW_NUM);
  Cspw_clksel <= sr5o(9+5*CFG_SPW_NUM downto 8+5*CFG_SPW_NUM);
  Cspw_clk <= sr5o(7+5*CFG_SPW_NUM);
  Cspw_rxd <= sr5o(6+5*CFG_SPW_NUM downto 7+4*CFG_SPW_NUM);
  Cspw_rxs <= sr5o(6+4*CFG_SPW_NUM downto 7+3*CFG_SPW_NUM);
  Pspw_txd <= sr5o(6+3*CFG_SPW_NUM downto 7+2*CFG_SPW_NUM);
  Pspw_txs <= sr5o(6+2*CFG_SPW_NUM downto 7+CFG_SPW_NUM);
  Pspw_ten <= sr5o(6+CFG_SPW_NUM downto 7);
  Clclk2x <= sr5o(6);
  Clclk4x <= sr5o(5);
  Plclkdis <= sr5o(4);
  Clclklock <= sr5o(3);
  Plock <= sr5o(2);
  Croen <= sr5o(1);
  Proout <= sr5o(0);
  
end;

