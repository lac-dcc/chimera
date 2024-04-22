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
-- Entity: 	grspw_codec_gen
-- File:	grspw_codec_gen.vhd
-- Author:	Marko Isomaki - Aeroflex Gaisler
-- Description: Generic wrapper for SpaceWire encoder-decoder 
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library spw;
use spw.spwcomp.all;

entity grspw_codec_gen is
  generic(
    ports        : integer range 1 to 2 := 1;
    input_type   : integer range 0 to 3 := 0;
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
end entity;

architecture rtl of grspw_codec_gen is
  constant fabits : integer := log2(fifosize/4)+2;

  signal rxrenable  : std_ulogic;
  signal rxraddress : std_logic_vector(10 downto 0);
  signal rxwrite    : std_ulogic;
  signal rxwdata    : std_logic_vector(9 downto 0);
  signal rxwaddress : std_logic_vector(10 downto 0);
  signal rxrdata    : std_logic_vector(9 downto 0);
  signal rxerror    : std_logic_vector(1 downto 0);
  signal rxaccess   : std_ulogic;
  
  signal txrenable  : std_ulogic;
  signal txraddress : std_logic_vector(10 downto 0);
  signal txwrite    : std_ulogic;
  signal txwdata    : std_logic_vector(8 downto 0);
  signal txwaddress : std_logic_vector(10 downto 0);
  signal txrdata    : std_logic_vector(8 downto 0);
  signal txerror    : std_logic_vector(1 downto 0);
  signal txaccess   : std_ulogic;

  signal testin     : std_logic_vector(3 downto 0);
  
begin
  testin <= testen & "000";
  
  core : grspw_codec_core 
    generic map(
      ports         => ports,
      input_type    => input_type,
      output_type   => output_type,
      rxtx_sameclk  => rxtx_sameclk,
      fifosize      => fifosize,
      tech          => tech, 
      scantest      => scantest
      )
    port map(
      rst           => rst,
      clk           => clk,
      rxclk0        => rxclk0,
      rxclk1        => rxclk1,
      txclk         => txclk,
      txclkn        => txclkn,
      testen        => testen,
      testrst       => testrst,
      --spw in 
      d             => d,
      dv            => dv,
      dconnect      => dconnect,
      --spw out
      do            => do,
      so            => so,
      --link fsm
      linkdisabled  => linkdisabled,
      linkstart     => linkstart,
      autostart     => autostart,
      portsel       => portsel,
      noportforce   => noportforce,
      rdivisor      => rdivisor,
      idivisor      => idivisor,
      state         => state,
      actport       => actport,
      dconnecterr   => dconnecterr,
      crederr       => crederr,
      escerr        => escerr,
      parerr        => parerr, 
      --rx fifo signals
      rxrenable     => rxrenable,
      rxraddress    => rxraddress,
      rxwrite       => rxwrite,
      rxwdata       => rxwdata,
      rxwaddress    => rxwaddress,
      rxrdata       => rxrdata,
      rxaccess      => rxaccess,
      --rx iface
      rxicharav     => rxicharav,
      rxicharcnt    => rxicharcnt,
      rxichar       => rxichar,
      rxiread       => rxiread,
      rxififorst    => rxififorst,
      --tx fifo signals
      txrenable     => txrenable,
      txraddress    => txraddress,
      txwrite       => txwrite,
      txwdata       => txwdata,
      txwaddress    => txwaddress,
      txrdata       => txrdata,
      txaccess      => txaccess,
      --tx iface
      txicharcnt    => txicharcnt,
      txifull       => txifull,
      txiempty      => txiempty,
      txiwrite      => txiwrite,
      txichar       => txichar,
      txififorst    => txififorst,
      txififorstact => txififorstact,
      --time iface
      tickin        => tickin,
      timein        => timein,
      tickin_done   => tickin_done,
      tickout       => tickout,
      timeout       => timeout
    );

  ft0 : if ft = 0 generate
    merror <= '0';
  end generate;

  ft1 : if ft /= 0 generate
    merror <= (orv(rxerror) and rxaccess) or (orv(txerror) and txaccess);
  end generate;

  --receiver nchar FIFO
  rx_ram : syncram_2pft generic map(tech*techfifo, fabits, 10, 0, 0, ft*techfifo)
  port map(clk, rxrenable, rxraddress(fabits-1 downto 0), rxrdata, clk, rxwrite,
    rxwaddress(fabits-1 downto 0), rxwdata, rxerror, testin);
    
  --transmitter nchar FIFO
  tx_ram : syncram_2pft generic map(tech*techfifo, fabits, 9, 0, 0, ft*techfifo)
  port map(clk, txrenable, txraddress(fabits-1 downto 0), txrdata, clk, txwrite,
    txwaddress(fabits-1 downto 0), txwdata, txerror, testin);
  
end architecture;

