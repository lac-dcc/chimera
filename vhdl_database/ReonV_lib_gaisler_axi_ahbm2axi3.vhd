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
-- Entity:      ahbm2axi3
-- File:        ahbm2axi3.vhd
-- Author:      Alen Bardizbanyan - Cobham Gaisler AB
-- Description: AMBA AHB master to AXI3 slave adapter
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.axi.all;


entity ahbm2axi3 is
  generic (
    memtech         : integer               := 0;
    aximid          : integer range 0 to 15 := 0;
    wbuffer_num     : integer range 1 to 16 := 8;
    rprefetch_num   : integer range 1 to 16 := 8;
    always_secure   : integer range 0 to 1  := 1;
    endianness_mode : integer range 0 to 1  := 0;
    --scantest
    scantest        : integer               := 0
    );
  port (
    rstn  : in  std_logic;
    clk   : in  std_logic;
    ahbsi : in  ahb_slv_in_type;
    ahbso : out ahb_slv_out_type;
    aximi : in  axi_somi_type;
    aximo : out axi3_mosi_type
    );
end ahbm2axi3;



architecture rtl of ahbm2axi3 is


  signal aximox : axix_mosi_type;

begin  -- rtl

  ahbm2axix : ahbm2axi
    generic map(
      memtech         => memtech,
      aximid          => aximid,
      wbuffer_num     => wbuffer_num,
      rprefetch_num   => rprefetch_num,
      always_secure   => always_secure,
      axi4            => 0,
      endianness_mode => endianness_mode,
      scantest        => scantest)
    port map (
      rst   => rstn,
      clk   => clk,
      ahbsi => ahbsi,
      ahbso => ahbso,
      aximi => aximi,
      aximo => aximox);

  aximo.w <= aximox.w;
  aximo.b <= aximox.b;
  aximo.r <= aximox.r;

  aximo.aw.id    <= aximox.aw.id;
  aximo.aw.addr  <= aximox.aw.addr;
  aximo.aw.len   <= aximox.aw.len(3 downto 0);
  aximo.aw.size  <= aximox.aw.size;
  aximo.aw.burst <= aximox.aw.burst;
  aximo.aw.lock  <= aximox.aw.lock;
  aximo.aw.cache <= aximox.aw.cache;
  aximo.aw.prot  <= aximox.aw.prot;
  aximo.aw.valid <= aximox.aw.valid;

  aximo.ar.id    <= aximox.ar.id;
  aximo.ar.addr  <= aximox.ar.addr;
  aximo.ar.len   <= aximox.ar.len(3 downto 0);
  aximo.ar.size  <= aximox.ar.size;
  aximo.ar.burst <= aximox.ar.burst;
  aximo.ar.lock  <= aximox.ar.lock;
  aximo.ar.cache <= aximox.ar.cache;
  aximo.ar.prot  <= aximox.ar.prot;
  aximo.ar.valid <= aximox.ar.valid;

  

end rtl;
