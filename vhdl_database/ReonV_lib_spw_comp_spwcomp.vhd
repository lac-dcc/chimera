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
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package spwcomp is
  component grspwc2 is
    generic(
      rmap            : integer range 0 to 2  := 0;
      rmapcrc         : integer range 0 to 1  := 0;
      fifosize1       : integer range 4 to 64 := 32;
      fifosize2       : integer range 16 to 64 := 64;
      rxunaligned     : integer range 0 to 1 := 0;
      rmapbufs        : integer range 2 to 8 := 4;
      scantest        : integer range 0 to 1 := 0;
      ports           : integer range 1 to 2 := 1;
      dmachan         : integer range 1 to 4 := 1;
      tech            : integer;
      input_type      : integer range 0 to 4 := 0;
      output_type     : integer range 0 to 2 := 0;
      rxtx_sameclk    : integer range 0 to 1 := 0;
      nodeaddr        : integer range 0 to 255 := 254;
      destkey         : integer range 0 to 255 := 0;
      interruptdist   : integer range 0 to 32 := 0;
      intscalerbits   : integer range 0 to 31 := 0;
      intisrtimerbits : integer range 0 to 31 := 0;
      intiatimerbits  : integer range 0 to 31 := 0;
      intctimerbits   : integer range 0 to 31 := 0;
      tickinasync     : integer range 0 to 1 := 0;
      pnp             : integer range 0 to 2 := 0;
      pnpvendid       : integer range 0 to 16#FFFF# := 0;
      pnpprodid       : integer range 0 to 16#FFFF# := 0;
      pnpmajorver     : integer range 0 to 16#FF# := 0;
      pnpminorver     : integer range 0 to 16#FF# := 0;
      pnppatch        : integer range 0 to 16#FF# := 0;
      num_txdesc      : integer range 64 to 512 := 64;
      num_rxdesc      : integer range 128 to 1024 := 128;
      ccsdscrc        : integer range 0 to 1 := 0
      );
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      rxclk0       : in  std_ulogic;
      rxclk1       : in  std_ulogic;
      txclk        : in  std_ulogic;
      txclkn       : in  std_ulogic;
      --ahb mst in
      hgrant       : in  std_ulogic;
      hready       : in  std_ulogic;
      hresp        : in  std_logic_vector(1 downto 0);
      hrdata       : in  std_logic_vector(31 downto 0);
      --ahb mst out
      hbusreq      : out  std_ulogic;
      hlock        : out  std_ulogic;
      htrans       : out  std_logic_vector(1 downto 0);
      haddr        : out  std_logic_vector(31 downto 0);
      hwrite       : out  std_ulogic;
      hsize        : out  std_logic_vector(2 downto 0);
      hburst       : out  std_logic_vector(2 downto 0);
      hprot        : out  std_logic_vector(3 downto 0);
      hwdata       : out  std_logic_vector(31 downto 0);
      --apb slv in
      psel         : in   std_ulogic;
      penable      : in   std_ulogic;
      paddr        : in   std_logic_vector(31 downto 0);
      pwrite       : in   std_ulogic;
      pwdata       : in   std_logic_vector(31 downto 0);
      --apb slv out
      prdata       : out  std_logic_vector(31 downto 0);
      --spw in
      d            : in   std_logic_vector(3 downto 0);
      dv           : in   std_logic_vector(3 downto 0);
      dconnect     : in   std_logic_vector(3 downto 0);
      --spw out
      do           : out  std_logic_vector(3 downto 0);
      so           : out  std_logic_vector(3 downto 0);
      --time iface
      tickin       : in   std_ulogic;
      tickinraw    : in   std_ulogic;
      timein       : in   std_logic_vector(7 downto 0);
      tickindone   : out  std_ulogic;
      tickout      : out  std_ulogic;
      tickoutraw   : out  std_ulogic;
      timeout      : out  std_logic_vector(7 downto 0);
      --irq
      irq          : out  std_logic;
      --misc
      clkdiv10     : in   std_logic_vector(7 downto 0);
      --rmapen
      rmapen       : in   std_ulogic;
      rmapnodeaddr : in   std_logic_vector(7 downto 0);
      --rx ahb fifo
      rxrenable    : out  std_ulogic;
      rxraddress   : out  std_logic_vector(5 downto 0);
      rxwrite      : out  std_ulogic;
      rxwdata      : out  std_logic_vector(31 downto 0);
      rxwaddress   : out  std_logic_vector(5 downto 0);
      rxrdata      : in   std_logic_vector(31 downto 0);
      --tx ahb fifo
      txrenable    : out  std_ulogic;
      txraddress   : out  std_logic_vector(5 downto 0);
      txwrite      : out  std_ulogic;
      txwdata      : out  std_logic_vector(31 downto 0);
      txwaddress   : out  std_logic_vector(5 downto 0);
      txrdata      : in   std_logic_vector(31 downto 0);
      --nchar fifo
      ncrenable    : out  std_ulogic;
      ncraddress   : out  std_logic_vector(5 downto 0);
      ncwrite      : out  std_ulogic;
      ncwdata      : out  std_logic_vector(9 downto 0);
      ncwaddress   : out  std_logic_vector(5 downto 0);
      ncrdata      : in   std_logic_vector(9 downto 0);
      --rmap buf
      rmrenable    : out  std_ulogic;
      rmraddress   : out  std_logic_vector(7 downto 0);
      rmwrite      : out  std_ulogic;
      rmwdata      : out  std_logic_vector(7 downto 0);
      rmwaddress   : out  std_logic_vector(7 downto 0);
      rmrdata      : in   std_logic_vector(7 downto 0);
      linkdis      : out  std_ulogic;
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0';
      --parallel rx data out
      rxdav        : out  std_ulogic;
      rxdataout    : out  std_logic_vector(8 downto 0);
      loopback     : out  std_ulogic;
      -- interrupt dist. default values
      intpreload   : in   std_logic_vector(30 downto 0);
      inttreload   : in   std_logic_vector(30 downto 0);
      intiareload  : in   std_logic_vector(30 downto 0);
      intcreload   : in   std_logic_vector(30 downto 0);      
      irqtxdefault : in   std_logic_vector(5 downto 0);
      -- SpW PnP enable
      pnpen        : in   std_ulogic;
      pnpuvendid   : in   std_logic_vector(15 downto 0);
      pnpuprodid   : in   std_logic_vector(15 downto 0);
      pnpusn       : in   std_logic_vector(31 downto 0)
    );
  end component;

  component grspwc is
    generic(
      sysfreq      : integer := 40000;
      usegen       : integer range 0 to 1  := 1;
      nsync        : integer range 1 to 2  := 1;
      rmap         : integer range 0 to 2  := 0;
      rmapcrc      : integer range 0 to 1  := 0;
      fifosize1    : integer range 4 to 32 := 32;
      fifosize2    : integer range 16 to 64 := 64;
      rxunaligned  : integer range 0 to 1 := 0;
      rmapbufs     : integer range 2 to 8 := 4;
      scantest     : integer range 0 to 1 := 0;
      ports        : integer range 1 to 2 := 1;
      tech         : integer;
      nodeaddr     : integer range 0 to 255 := 254;
      destkey      : integer range 0 to 255 := 0
    );
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      txclk        : in  std_ulogic;
      --ahb mst in
      hgrant       : in  std_ulogic;
      hready       : in  std_ulogic;
      hresp        : in  std_logic_vector(1 downto 0);
      hrdata       : in  std_logic_vector(31 downto 0);
      --ahb mst out
      hbusreq      : out  std_ulogic;
      hlock        : out  std_ulogic;
      htrans       : out  std_logic_vector(1 downto 0);
      haddr        : out  std_logic_vector(31 downto 0);
      hwrite       : out  std_ulogic;
      hsize        : out  std_logic_vector(2 downto 0);
      hburst       : out  std_logic_vector(2 downto 0);
      hprot        : out  std_logic_vector(3 downto 0);
      hwdata       : out  std_logic_vector(31 downto 0);
      --apb slv in
      psel	 : in   std_ulogic;
      penable	 : in   std_ulogic;
      paddr	 : in   std_logic_vector(31 downto 0);
      pwrite	 : in   std_ulogic;
      pwdata	 : in   std_logic_vector(31 downto 0);
      --apb slv out
      prdata	 : out  std_logic_vector(31 downto 0);
      --spw in
      d            : in   std_logic_vector(1 downto 0);
      nd           : in   std_logic_vector(9 downto 0);
      dconnect     : in   std_logic_vector(3 downto 0);
      --spw out
      do           : out  std_logic_vector(1 downto 0);
      so           : out  std_logic_vector(1 downto 0);
      rxrsto       : out  std_ulogic;
      --time iface
      tickin       : in   std_ulogic;
      tickout      : out  std_ulogic;
      --irq
      irq          : out  std_logic;
      --misc
      clkdiv10     : in   std_logic_vector(7 downto 0);
      dcrstval     : in   std_logic_vector(9 downto 0);
      timerrstval  : in   std_logic_vector(11 downto 0);
      --rmapen
      rmapen       : in   std_ulogic;
      rmapnodeaddr : in   std_logic_vector(7 downto 0);
      --clk bufs
      rxclki       : in   std_logic_vector(1 downto 0);
      --rx ahb fifo
      rxrenable    : out  std_ulogic;
      rxraddress   : out  std_logic_vector(4 downto 0);
      rxwrite      : out  std_ulogic;
      rxwdata      : out  std_logic_vector(31 downto 0);
      rxwaddress   : out  std_logic_vector(4 downto 0);
      rxrdata      : in   std_logic_vector(31 downto 0);
      --tx ahb fifo
      txrenable    : out  std_ulogic;
      txraddress   : out  std_logic_vector(4 downto 0);
      txwrite      : out  std_ulogic;
      txwdata      : out  std_logic_vector(31 downto 0);
      txwaddress   : out  std_logic_vector(4 downto 0);
      txrdata      : in   std_logic_vector(31 downto 0);
      --nchar fifo
      ncrenable    : out  std_ulogic;
      ncraddress   : out  std_logic_vector(5 downto 0);
      ncwrite      : out  std_ulogic;
      ncwdata      : out  std_logic_vector(8 downto 0);
      ncwaddress   : out  std_logic_vector(5 downto 0);
      ncrdata      : in   std_logic_vector(8 downto 0);
      --rmap buf
      rmrenable    : out  std_ulogic;
      rmraddress   : out  std_logic_vector(7 downto 0);
      rmwrite      : out  std_ulogic;
      rmwdata      : out  std_logic_vector(7 downto 0);
      rmwaddress   : out  std_logic_vector(7 downto 0);
      rmrdata      : in   std_logic_vector(7 downto 0);
      linkdis      : out  std_ulogic;
      testclk      : in   std_ulogic := '0';
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0';
      rmapact      : out  std_ulogic
    );
  end component;

  component grspwc_axcelerator is
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      txclk        : in  std_ulogic;
      --ahb mst in
      hgrant       : in  std_ulogic;
      hready       : in  std_ulogic;
      hresp        : in  std_logic_vector(1 downto 0);
      hrdata       : in  std_logic_vector(31 downto 0);
      --ahb mst out
      hbusreq      : out  std_ulogic;
      hlock        : out  std_ulogic;
      htrans       : out  std_logic_vector(1 downto 0);
      haddr        : out  std_logic_vector(31 downto 0);
      hwrite       : out  std_ulogic;
      hsize        : out  std_logic_vector(2 downto 0);
      hburst       : out  std_logic_vector(2 downto 0);
      hprot        : out  std_logic_vector(3 downto 0);
      hwdata       : out  std_logic_vector(31 downto 0);
      --apb slv in
      psel	   : in   std_ulogic;
      penable	   : in   std_ulogic;
      paddr	   : in   std_logic_vector(31 downto 0);
      pwrite	   : in   std_ulogic;
      pwdata	   : in   std_logic_vector(31 downto 0);
      --apb slv out
      prdata	   : out  std_logic_vector(31 downto 0);
      --spw in
      d            : in   std_logic_vector(1 downto 0);
      nd           : in   std_logic_vector(1 downto 0);
      --spw out
      do           : out  std_logic_vector(1 downto 0);
      so           : out  std_logic_vector(1 downto 0);
      rxrsto       : out  std_ulogic;
      --time iface
      tickin       : in   std_ulogic;
      tickout      : out  std_ulogic;
      --irq
      irq          : out  std_logic;
      --misc
      clkdiv10     : in   std_logic_vector(7 downto 0);
      dcrstval     : in   std_logic_vector(9 downto 0);
      timerrstval  : in   std_logic_vector(11 downto 0);
      --rmapen
      rmapen       : in   std_ulogic;
      rmapnodeaddr : in   std_logic_vector(7 downto 0);
      --clk bufs
      rxclki       : in   std_logic_vector(1 downto 0);
      --rx ahb fifo
      rxrenable    : out  std_ulogic;
      rxraddress   : out  std_logic_vector(4 downto 0);
      rxwrite      : out  std_ulogic;
      rxwdata      : out  std_logic_vector(31 downto 0);
      rxwaddress   : out  std_logic_vector(4 downto 0);
      rxrdata      : in   std_logic_vector(31 downto 0);
      --tx ahb fifo
      txrenable    : out  std_ulogic;
      txraddress   : out  std_logic_vector(4 downto 0);
      txwrite      : out  std_ulogic;
      txwdata      : out  std_logic_vector(31 downto 0);
      txwaddress   : out  std_logic_vector(4 downto 0);
      txrdata      : in   std_logic_vector(31 downto 0);
      --nchar fifo
      ncrenable    : out  std_ulogic;
      ncraddress   : out  std_logic_vector(5 downto 0);
      ncwrite      : out  std_ulogic;
      ncwdata      : out  std_logic_vector(8 downto 0);
      ncwaddress   : out  std_logic_vector(5 downto 0);
      ncrdata      : in   std_logic_vector(8 downto 0);
      --rmap buf
      rmrenable    : out  std_ulogic;
      rmraddress   : out  std_logic_vector(7 downto 0);
      rmwrite      : out  std_ulogic;
      rmwdata      : out  std_logic_vector(7 downto 0);
      rmwaddress   : out  std_logic_vector(7 downto 0);
      rmrdata      : in   std_logic_vector(7 downto 0);
      linkdis      : out  std_ulogic;
      testclk      : in   std_ulogic := '0';
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0'
    );
  end component;

  component grspwc_unisim is
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      txclk        : in  std_ulogic;
      --ahb mst in
      hgrant       : in  std_ulogic;
      hready       : in  std_ulogic;
      hresp        : in  std_logic_vector(1 downto 0);
      hrdata       : in  std_logic_vector(31 downto 0);
      --ahb mst out
      hbusreq      : out  std_ulogic;
      hlock        : out  std_ulogic;
      htrans       : out  std_logic_vector(1 downto 0);
      haddr        : out  std_logic_vector(31 downto 0);
      hwrite       : out  std_ulogic;
      hsize        : out  std_logic_vector(2 downto 0);
      hburst       : out  std_logic_vector(2 downto 0);
      hprot        : out  std_logic_vector(3 downto 0);
      hwdata       : out  std_logic_vector(31 downto 0);
      --apb slv in
      psel	   : in   std_ulogic;
      penable	   : in   std_ulogic;
      paddr	   : in   std_logic_vector(31 downto 0);
      pwrite	   : in   std_ulogic;
      pwdata	   : in   std_logic_vector(31 downto 0);
      --apb slv out
      prdata	   : out  std_logic_vector(31 downto 0);
      --spw in
      d            : in   std_logic_vector(1 downto 0);
      nd           : in   std_logic_vector(1 downto 0);
      --spw out
      do           : out  std_logic_vector(1 downto 0);
      so           : out  std_logic_vector(1 downto 0);
      rxrsto       : out  std_ulogic;
      --time iface
      tickin       : in   std_ulogic;
      tickout      : out  std_ulogic;
      --irq
      irq          : out  std_logic;
      --misc
      clkdiv10     : in   std_logic_vector(7 downto 0);
      dcrstval     : in   std_logic_vector(9 downto 0);
      timerrstval  : in   std_logic_vector(11 downto 0);
      --rmapen
      rmapen       : in   std_ulogic;
      rmapnodeaddr : in   std_logic_vector(7 downto 0);
      --clk bufs
      rxclki       : in   std_logic_vector(1 downto 0);
      --rx ahb fifo
      rxrenable    : out  std_ulogic;
      rxraddress   : out  std_logic_vector(4 downto 0);
      rxwrite      : out  std_ulogic;
      rxwdata      : out  std_logic_vector(31 downto 0);
      rxwaddress   : out  std_logic_vector(4 downto 0);
      rxrdata      : in   std_logic_vector(31 downto 0);
      --tx ahb fifo
      txrenable    : out  std_ulogic;
      txraddress   : out  std_logic_vector(4 downto 0);
      txwrite      : out  std_ulogic;
      txwdata      : out  std_logic_vector(31 downto 0);
      txwaddress   : out  std_logic_vector(4 downto 0);
      txrdata      : in   std_logic_vector(31 downto 0);
      --nchar fifo
      ncrenable    : out  std_ulogic;
      ncraddress   : out  std_logic_vector(5 downto 0);
      ncwrite      : out  std_ulogic;
      ncwdata      : out  std_logic_vector(8 downto 0);
      ncwaddress   : out  std_logic_vector(5 downto 0);
      ncrdata      : in   std_logic_vector(8 downto 0);
      --rmap buf
      rmrenable    : out  std_ulogic;
      rmraddress   : out  std_logic_vector(7 downto 0);
      rmwrite      : out  std_ulogic;
      rmwdata      : out  std_logic_vector(7 downto 0);
      rmwaddress   : out  std_logic_vector(7 downto 0);
      rmrdata      : in   std_logic_vector(7 downto 0);
      linkdis      : out  std_ulogic;
      testclk      : in   std_ulogic := '0';
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0'
    );
  end component;

  component grspw_gen is
    generic(
      tech         : integer := 0;
      sysfreq      : integer := 10000;
      usegen       : integer range 0 to 1  := 1;
      nsync        : integer range 1 to 2  := 1;
      rmap         : integer range 0 to 2  := 0;
      rmapcrc      : integer range 0 to 1  := 0;
      fifosize1    : integer range 4 to 32 := 32;
      fifosize2    : integer range 16 to 64 := 64;
      rxclkbuftype : integer range 0 to 2 := 0;
      rxunaligned  : integer range 0 to 1 := 0;
      rmapbufs     : integer range 2 to 8 := 4;
      ft           : integer range 0 to 2 := 0;
      scantest     : integer range 0 to 1 := 0;
      techfifo     : integer range 0 to 1 := 1;
      ports        : integer range 1 to 2 := 1;
      memtech      : integer := 0;
      nodeaddr     : integer range 0 to 255 := 254;
      destkey      : integer range 0 to 255 := 0
    );
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      txclk        : in  std_ulogic;
      rxclk        : in  std_logic_vector(1 downto 0);
      --ahb mst in
      hgrant       : in  std_ulogic;
      hready       : in  std_ulogic;
      hresp        : in  std_logic_vector(1 downto 0);
      hrdata       : in  std_logic_vector(31 downto 0);
      --ahb mst out
      hbusreq      : out  std_ulogic;
      hlock        : out  std_ulogic;
      htrans       : out  std_logic_vector(1 downto 0);
      haddr        : out  std_logic_vector(31 downto 0);
      hwrite       : out  std_ulogic;
      hsize        : out  std_logic_vector(2 downto 0);
      hburst       : out  std_logic_vector(2 downto 0);
      hprot        : out  std_logic_vector(3 downto 0);
      hwdata       : out  std_logic_vector(31 downto 0);
      --apb slv in
      psel	   : in   std_ulogic;
      penable	   : in   std_ulogic;
      paddr	   : in   std_logic_vector(31 downto 0);
      pwrite	   : in   std_ulogic;
      pwdata	   : in   std_logic_vector(31 downto 0);
      --apb slv out
      prdata	   : out  std_logic_vector(31 downto 0);
      --spw in
      d            : in   std_logic_vector(1 downto 0);
      nd           : in   std_logic_vector(9 downto 0);
      dconnect     : in   std_logic_vector(3 downto 0);
      --spw out
      do           : out  std_logic_vector(1 downto 0);
      so           : out  std_logic_vector(1 downto 0);
      rxrsto       : out  std_ulogic;
      --time iface
      tickin       : in   std_ulogic;
      tickout      : out  std_ulogic;
      --irq
      irq          : out  std_logic;
      --misc
      clkdiv10     : in   std_logic_vector(7 downto 0);
      dcrstval     : in   std_logic_vector(9 downto 0);
      timerrstval  : in   std_logic_vector(11 downto 0);
      --rmapen
      rmapen       : in   std_ulogic;
      rmapnodeaddr : in   std_logic_vector(7 downto 0);
      linkdis      : out  std_ulogic;
      testclk      : in   std_ulogic := '0';
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0'
      );
  end component;

  component grspw_codec_core is
  generic(
    ports        : integer range 1 to 2 := 1;
    input_type   : integer range 0 to 4 := 0;
    output_type  : integer range 0 to 2 := 0;
    rxtx_sameclk : integer range 0 to 1 := 0;
    fifosize     : integer range 16 to 2048 := 64;
    tech         : integer;
    scantest     : integer range 0 to 1 := 0;
    inputtest    : integer range 0 to 1 := 0
    );
  port(
    rst          : in  std_ulogic;
    clk          : in  std_ulogic;
    rxclk0       : in  std_ulogic;
    rxclk1       : in  std_ulogic;
    txclk        : in  std_ulogic;
    txclkn       : in  std_ulogic;
    testen       : in  std_ulogic;
    testrst      : in  std_ulogic;
    --spw in
    d            : in  std_logic_vector(3 downto 0);
    dv           : in  std_logic_vector(3 downto 0);
    dconnect     : in  std_logic_vector(3 downto 0);
    --spw out
    do           : out std_logic_vector(3 downto 0);
    so           : out std_logic_vector(3 downto 0);
    --link fsm
    linkdisabled : in  std_ulogic;
    linkstart    : in  std_ulogic;
    autostart    : in  std_ulogic;
    portsel      : in  std_ulogic;
    noportforce  : in  std_ulogic;
    rdivisor     : in  std_logic_vector(7 downto 0);
    idivisor     : in  std_logic_vector(7 downto 0);
    state        : out std_logic_vector(2 downto 0);
    actport      : out std_ulogic;
    dconnecterr  : out std_ulogic;
    crederr      : out std_ulogic;
    escerr       : out std_ulogic;
    parerr       : out std_ulogic;
    --rx fifo signals
    rxrenable    : out std_ulogic;
    rxraddress   : out std_logic_vector(10 downto 0);
    rxwrite      : out std_ulogic;
    rxwdata      : out std_logic_vector(9 downto 0);
    rxwaddress   : out std_logic_vector(10 downto 0);
    rxrdata      : in  std_logic_vector(9 downto 0);
    rxaccess     : out std_ulogic;
    --rx iface
    rxicharav    : out std_ulogic;
    rxicharcnt   : out std_logic_vector(11 downto 0);
    rxichar      : out std_logic_vector(8 downto 0);
    rxiread      : in  std_ulogic;
    rxififorst   : in  std_ulogic;
    --tx fifo signals
    txrenable    : out std_ulogic;
    txraddress   : out std_logic_vector(10 downto 0);
    txwrite      : out std_ulogic;
    txwdata      : out std_logic_vector(8 downto 0);
    txwaddress   : out std_logic_vector(10 downto 0);
    txrdata      : in  std_logic_vector(8 downto 0);
    txaccess     : out std_ulogic;
    --tx iface
    txicharcnt   : out std_logic_vector(11 downto 0);
    txifull      : out std_ulogic;
    txiempty     : out std_ulogic;
    txiwrite     : in  std_ulogic;
    txichar      : in  std_logic_vector(8 downto 0);
    txififorst   : in  std_ulogic;
    txififorstact: out std_ulogic;
    --time iface
    tickin       : in  std_ulogic;
    timein       : in  std_logic_vector(7 downto 0);
    tickin_done  : out std_ulogic;
    tickin_busy  : out std_ulogic;
    tickout      : out std_ulogic;
    timeout      : out std_logic_vector(7 downto 0);
    credcnt      : out std_logic_vector(5 downto 0);
    ocredcnt     : out std_logic_vector(5 downto 0);
    --misc
    powerdown    : out std_ulogic;
    powerdownrx  : out std_ulogic;
    -- input timing testing
    testdi       : in  std_logic_vector(1 downto 0) := "00";
    testsi       : in  std_logic_vector(1 downto 0) := "00";
    testinput    : in  std_ulogic := '0'
  );
  end component;

  component grspw2_gen is
    generic(
      rmap            : integer range 0 to 2  := 0;
      rmapcrc         : integer range 0 to 1  := 0;
      fifosize1       : integer range 4 to 64 := 32;
      fifosize2       : integer range 16 to 64 := 64;
      rxunaligned     : integer range 0 to 1 := 0;
      rmapbufs        : integer range 2 to 8 := 4;
      scantest        : integer range 0 to 1 := 0;
      ports           : integer range 1 to 2 := 1;
      dmachan         : integer range 1 to 4 := 1;
      tech            : integer;
      input_type      : integer range 0 to 4 := 0;
      output_type     : integer range 0 to 2 := 0;
      rxtx_sameclk    : integer range 0 to 1 := 0;
      ft              : integer range 0 to 2 := 0;
      techfifo        : integer range 0 to 1 := 1;
      memtech         : integer := 0;
      nodeaddr        : integer range 0 to 255 := 254;
      destkey         : integer range 0 to 255 := 0;
      interruptdist   : integer range 0 to 32 := 0;
      intscalerbits   : integer range 0 to 31 := 0;
      intisrtimerbits : integer range 0 to 31 := 0;
      intiatimerbits  : integer range 0 to 31 := 0;
      intctimerbits   : integer range 0 to 31 := 0;
      tickinasync     : integer range 0 to 1 := 0;
      pnp             : integer range 0 to 2 := 0;
      pnpvendid       : integer range 0 to 16#FFFF# := 0;
      pnpprodid       : integer range 0 to 16#FFFF# := 0;
      pnpmajorver     : integer range 0 to 16#FF# := 0;
      pnpminorver     : integer range 0 to 16#FF# := 0;
      pnppatch        : integer range 0 to 16#FF# := 0;
      num_txdesc      : integer range 64 to 512 := 64;
      num_rxdesc      : integer range 128 to 1024 := 128;
      ccsdscrc        : integer range 0 to 1 := 0
      );
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      rxclk0       : in  std_ulogic;
      rxclk1       : in  std_ulogic;
      txclk        : in  std_ulogic;
      txclkn       : in  std_ulogic;
      --ahb mst in
      hgrant       : in  std_ulogic;
      hready       : in  std_ulogic;
      hresp        : in  std_logic_vector(1 downto 0);
      hrdata       : in  std_logic_vector(31 downto 0);
      --ahb mst out
      hbusreq      : out  std_ulogic;
      hlock        : out  std_ulogic;
      htrans       : out  std_logic_vector(1 downto 0);
      haddr        : out  std_logic_vector(31 downto 0);
      hwrite       : out  std_ulogic;
      hsize        : out  std_logic_vector(2 downto 0);
      hburst       : out  std_logic_vector(2 downto 0);
      hprot        : out  std_logic_vector(3 downto 0);
      hwdata       : out  std_logic_vector(31 downto 0);
      --apb slv in
      psel	 : in   std_ulogic;
      penable	 : in   std_ulogic;
      paddr	 : in   std_logic_vector(31 downto 0);
      pwrite	 : in   std_ulogic;
      pwdata	 : in   std_logic_vector(31 downto 0);
      --apb slv out
      prdata	 : out  std_logic_vector(31 downto 0);
      --spw in
      d            : in   std_logic_vector(3 downto 0);
      dv           : in   std_logic_vector(3 downto 0);
      dconnect     : in   std_logic_vector(3 downto 0);
      --spw out
      do           : out  std_logic_vector(3 downto 0);
      so           : out  std_logic_vector(3 downto 0);
      --time iface
      tickin       : in   std_ulogic;
      tickinraw    : in   std_ulogic;
      timein       : in   std_logic_vector(7 downto 0);
      tickindone   : out  std_ulogic;
      tickout      : out  std_ulogic;
      tickoutraw   : out  std_ulogic;
      timeout      : out  std_logic_vector(7 downto 0);
      --irq
      irq          : out  std_logic;
      --misc
      clkdiv10     : in   std_logic_vector(7 downto 0);
      linkdis      : out  std_ulogic;
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0';
      --rmapen
      rmapen       : in   std_ulogic;
      rmapnodeaddr : in   std_logic_vector(7 downto 0);
      --parallel rx data out
      rxdav        : out  std_ulogic;
      rxdataout    : out  std_logic_vector(8 downto 0);
      loopback     : out  std_ulogic;
      -- interrupt dist. default values
      intpreload   : in   std_logic_vector(30 downto 0);
      inttreload   : in   std_logic_vector(30 downto 0);
      intiareload  : in   std_logic_vector(30 downto 0);
      intcreload   : in   std_logic_vector(30 downto 0);      
      irqtxdefault : in   std_logic_vector(5 downto 0);
      -- SpW PnP enable
      pnpen        : in   std_ulogic;
      pnpuvendid   : in   std_logic_vector(15 downto 0);
      pnpuprodid   : in   std_logic_vector(15 downto 0);
      pnpusn       : in   std_logic_vector(31 downto 0)
    );
  end component;


  component grspw_codec_gen is
    generic(
      ports        : integer range 1 to 2 := 1;
      input_type   : integer range 0 to 4 := 0;
      output_type  : integer range 0 to 2 := 0;
      rxtx_sameclk : integer range 0 to 1 := 0;
      fifosize     : integer range 16 to 2048 := 64;
      tech         : integer;
      scantest     : integer range 0 to 1 := 0;
      techfifo     : integer range 0 to 1 := 0;
      ft           : integer range 0 to 2 := 0
      );
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      rxclk0       : in  std_ulogic;
      rxclk1       : in  std_ulogic;
      txclk        : in  std_ulogic;
      txclkn       : in  std_ulogic;
      testen       : in  std_ulogic;
      testrst      : in  std_ulogic;
      --spw in
      d            : in  std_logic_vector(3 downto 0);
      dv           : in  std_logic_vector(3 downto 0);
      dconnect     : in  std_logic_vector(3 downto 0);
      --spw out
      do           : out std_logic_vector(3 downto 0);
      so           : out std_logic_vector(3 downto 0);
      --link fsm
      linkdisabled : in  std_ulogic;
      linkstart    : in  std_ulogic;
      autostart    : in  std_ulogic;
      portsel      : in  std_ulogic;
      noportforce  : in  std_ulogic;
      rdivisor     : in  std_logic_vector(7 downto 0);
      idivisor     : in  std_logic_vector(7 downto 0);
      state        : out std_logic_vector(2 downto 0);
      actport      : out std_ulogic;
      dconnecterr  : out std_ulogic;
      crederr      : out std_ulogic;
      escerr       : out std_ulogic;
      parerr       : out std_ulogic;
      --rx iface
      rxicharav    : out std_ulogic;
      rxicharcnt   : out std_logic_vector(11 downto 0);
      rxichar      : out std_logic_vector(8 downto 0);
      rxiread      : in  std_ulogic;
      rxififorst   : in  std_ulogic;
      --tx iface
      txicharcnt   : out std_logic_vector(11 downto 0);
      txifull      : out std_ulogic;
      txiempty     : out std_ulogic;
      txiwrite     : in  std_ulogic;
      txichar      : in  std_logic_vector(8 downto 0);
      txififorst   : in  std_ulogic;
      txififorstact: out std_ulogic;
      --time iface
      tickin       : in  std_ulogic;
      timein       : in  std_logic_vector(7 downto 0);
      tickin_done  : out std_ulogic;
      tickout      : out std_ulogic;
      timeout      : out std_logic_vector(7 downto 0);
      --misc
      merror       : out std_ulogic
    );
  end component;



end package;

