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
-- Entity: 	grspw2_gen
-- File:	grspw2_gen.vhd
-- Author:	Marko Isomaki - Aeroflex Gaisler
-- Description: Generic GRSPW2 core
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library spw;
use spw.spwcomp.all;

entity grspw2_gen is
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
    input_type      : integer range 0 to 3 := 0;
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
    --SpW PnP enable
    pnpen        : in   std_ulogic;
    pnpuvendid   : in   std_logic_vector(15 downto 0);
    pnpuprodid   : in   std_logic_vector(15 downto 0);
    pnpusn       : in   std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of grspw2_gen is
  constant fabits1      : integer := log2(fifosize1);
  constant fabits2      : integer := log2(fifosize2);
  constant rfifo        : integer := 5 + log2(rmapbufs);

  signal rxclki, nrxclki, rxclko : std_logic_vector(1 downto 0);

  --rx ahb fifo
  signal rxrenable    : std_ulogic;
  signal rxraddress   : std_logic_vector(5 downto 0);
  signal rxwrite      : std_ulogic;
  signal rxwdata      : std_logic_vector(31 downto 0);
  signal rxwaddress   : std_logic_vector(5 downto 0);
  signal rxrdata      : std_logic_vector(31 downto 0);
  --tx ahb fifo
  signal txrenable    : std_ulogic;
  signal txraddress   : std_logic_vector(5 downto 0);
  signal txwrite      : std_ulogic;
  signal txwdata      : std_logic_vector(31 downto 0);
  signal txwaddress   : std_logic_vector(5 downto 0);
  signal txrdata      : std_logic_vector(31 downto 0);
  --nchar fifo
  signal ncrenable    : std_ulogic;
  signal ncraddress   : std_logic_vector(5 downto 0);
  signal ncwrite      : std_ulogic;
  signal ncwdata      : std_logic_vector(9 downto 0);
  signal ncwaddress   : std_logic_vector(5 downto 0);
  signal ncrdata      : std_logic_vector(9 downto 0);
  --rmap buf
  signal rmrenable    : std_ulogic;
  signal rmrenablex   : std_ulogic;
  signal rmraddress   : std_logic_vector(7 downto 0);
  signal rmwrite      : std_ulogic;
  signal rmwdata      : std_logic_vector(7 downto 0);
  signal rmwaddress   : std_logic_vector(7 downto 0);
  signal rmrdata      : std_logic_vector(7 downto 0);
  --misc
  signal rxclk, nrxclk: std_logic_vector(ports-1 downto 0);
  signal testin       : std_logic_vector(3 downto 0);

  attribute syn_netlist_hierarchy : boolean;
  attribute syn_netlist_hierarchy of rtl : architecture is false;

begin

  testin <= testen & "000";

  grspwc0: grspwc2
    generic map(
      rmap            => rmap,
      rmapcrc         => rmapcrc,
      fifosize1       => fifosize1,
      fifosize2       => fifosize2,
      rxunaligned     => rxunaligned,
      rmapbufs        => rmapbufs,
      scantest        => scantest,
      ports           => ports,
      dmachan         => dmachan,
      tech            => tech,
      input_type      => input_type,
      output_type     => output_type,
      rxtx_sameclk    => rxtx_sameclk,
      nodeaddr        => nodeaddr,
      destkey         => destkey,
      interruptdist   => interruptdist,
      intscalerbits   => intscalerbits,
      intisrtimerbits => intisrtimerbits,
      intiatimerbits  => intiatimerbits,
      intctimerbits   => intctimerbits,
      tickinasync     => tickinasync,
      pnp             => pnp,
      pnpvendid       => pnpvendid,
      pnpprodid       => pnpprodid,
      pnpmajorver     => pnpmajorver,
      pnpminorver     => pnpminorver,
      pnppatch        => pnppatch,
      num_txdesc      => num_txdesc,
      num_rxdesc      => num_rxdesc,
      ccsdscrc        => ccsdscrc)    
    port map(
      rst          => rst,
      clk          => clk,
      rxclk0       => rxclk0,
      rxclk1       => rxclk1,
      txclk        => txclk,
      txclkn       => txclkn,
      --ahb mst in
      hgrant       => hgrant,
      hready       => hready,
      hresp        => hresp,
      hrdata       => hrdata,
      --ahb mst out
      hbusreq      => hbusreq,
      hlock        => hlock,
      htrans       => htrans,
      haddr        => haddr,
      hwrite       => hwrite,
      hsize        => hsize,
      hburst       => hburst,
      hprot        => hprot,
      hwdata       => hwdata,
      --apb slv in
      psel         => psel,
      penable      => penable,
      paddr        => paddr,
      pwrite	    => pwrite,
      pwdata	    => pwdata,
      --apb slv out
      prdata       => prdata,
      --spw in
      d            => d,
      dv           => dv,
      dconnect     => dconnect,
      --spw out
      do           => do,
      so           => so,
      --time iface
      tickin       => tickin,
      tickinraw    => tickinraw,
      timein       => timein,
      tickindone   => tickindone,
      tickout      => tickout,
      tickoutraw   => tickoutraw,
      timeout      => timeout,
      --irq
      irq          => irq,
      --misc
      clkdiv10     => clkdiv10,
      --rmapen
      rmapen       => rmapen,
      rmapnodeaddr => rmapnodeaddr,
      --rx ahb fifo
      rxrenable    => rxrenable,
      rxraddress   => rxraddress,
      rxwrite      => rxwrite,
      rxwdata      => rxwdata,
      rxwaddress   => rxwaddress,
      rxrdata      => rxrdata,
      --tx ahb fifo
      txrenable    => txrenable,
      txraddress   => txraddress,
      txwrite      => txwrite,
      txwdata      => txwdata,
      txwaddress   => txwaddress,
      txrdata      => txrdata,
      --nchar fifo
      ncrenable    => ncrenable,
      ncraddress   => ncraddress,
      ncwrite      => ncwrite,
      ncwdata      => ncwdata,
      ncwaddress   => ncwaddress,
      ncrdata      => ncrdata,
      --rmap buf
      rmrenable    => rmrenable,
      rmraddress   => rmraddress,
      rmwrite      => rmwrite,
      rmwdata      => rmwdata,
      rmwaddress   => rmwaddress,
      rmrdata      => rmrdata,
      linkdis      => linkdis,
      testrst      => testrst,
      testen       => testen,
      --parallel rx data out
      rxdav        => rxdav,
      rxdataout    => rxdataout,
      loopback     => loopback,
      -- interrupt dist. default values
      intpreload   => intpreload,
      inttreload   => inttreload,
      intiareload  => intiareload,
      intcreload   => intcreload,
      irqtxdefault => irqtxdefault,
      -- SpW PnP enable
      pnpen        => pnpen,
      pnpuvendid   => pnpuvendid,
      pnpuprodid   => pnpuprodid,
      pnpusn       => pnpusn
      );

  ------------------------------------------------------------------------------
  -- FIFOS ---------------------------------------------------------------------
  ------------------------------------------------------------------------------

  nft : if ft = 0 generate
    --receiver AHB FIFO
    rx_ram0 : syncram_2p generic map(memtech*techfifo, fabits1, 32)
    port map(clk, rxrenable, rxraddress(fabits1-1 downto 0),
      rxrdata, clk, rxwrite,
      rxwaddress(fabits1-1 downto 0), rxwdata, testin);

    --receiver nchar FIFO
    rx_ram1 : syncram_2p generic map(memtech*techfifo, fabits2, 10)
    port map(clk, ncrenable, ncraddress(fabits2-1 downto 0),
      ncrdata, clk, ncwrite,
      ncwaddress(fabits2-1 downto 0), ncwdata, testin);

    --transmitter FIFO
    tx_ram0 : syncram_2p generic map(memtech*techfifo, fabits1, 32)
    port map(clk, txrenable, txraddress(fabits1-1 downto 0),
      txrdata, clk, txwrite, txwaddress(fabits1-1 downto 0), txwdata, testin);

    --RMAP Buffer
    rmap_ram : if (rmap /= 0) generate
      ram0 : syncram_2p generic map(memtech, rfifo, 8)
      port map(clk, rmrenable, rmraddress(rfifo-1 downto 0),
        rmrdata, clk, rmwrite, rmwaddress(rfifo-1 downto 0),
        rmwdata, testin);
    end generate;
  end generate;

  ft1 : if ft /= 0 generate
    --receiver AHB FIFO
    rx_ram0 : syncram_2pft generic map(memtech*techfifo, fabits1, 32, 0, 0, ft*techfifo)
    port map(clk, rxrenable, rxraddress(fabits1-1 downto 0),
      rxrdata, clk, rxwrite,
      rxwaddress(fabits1-1 downto 0), rxwdata, open, testin);

    --receiver nchar FIFO
    rx_ram1 : syncram_2pft generic map(memtech*techfifo, fabits2, 10, 0, 0, 2*techfifo)
    port map(clk, ncrenable, ncraddress(fabits2-1 downto 0),
      ncrdata, clk, ncwrite,
      ncwaddress(fabits2-1 downto 0), ncwdata, open, testin);

    --transmitter FIFO
    tx_ram0 : syncram_2pft generic map(memtech*techfifo, fabits1, 32, 0, 0, ft*techfifo)
    port map(clk, txrenable, txraddress(fabits1-1 downto 0),
      txrdata, clk, txwrite, txwaddress(fabits1-1 downto 0), txwdata, open, testin);

    --RMAP Buffer
    rmap_ram : if (rmap /= 0) generate
      ram0 : syncram_2pft generic map(memtech, rfifo, 8, 0, 0, 2)
      port map(clk, rmrenable, rmraddress(rfifo-1 downto 0),
        rmrdata, clk, rmwrite, rmwaddress(rfifo-1 downto 0),
        rmwdata, open, testin);
    end generate;
  end generate;

end architecture;

