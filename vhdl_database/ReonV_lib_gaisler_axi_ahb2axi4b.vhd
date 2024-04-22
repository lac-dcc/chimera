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
-- Entity:      ahb2axi3b
-- File:        ahb2axi3b.vhd
-- Author:      Alen Bardizbanyan - Cobham Gaisler AB
-- Description: AMBA AHB to AXI4 bridge
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


entity ahb2axi4b is
  generic (
    memtech         : integer                              := 0;
    hindex          : integer                              := 0;
    aximid          : integer range 0 to 15                := 0;  --AXI master transaction ID
    wbuffer_num     : integer range 1 to axi4_max_n(AXIDW) := 8;
    rprefetch_num   : integer range 1 to axi4_max_n(AXIDW) := 8;
    always_secure   : integer range 0 to 1                 := 1;  --0->not secure; 1->secure
    endianness_mode : integer range 0 to 1                 := 0;  --0->BE(AHB)-to-BE(AXI)
                                                                  --1->BE(AHB)-to-LE(AXI)
    narrow_acc_mode : integer range 0 to 1                 := 0;  --0->each beat in narrow burst
                                                                  --treated as single access
                                                                  --1->narrow burst directly
                                                                  --transalted to AXI
                                                                  --supported only in BE-to-BE
    -- scantest
    scantest        : integer                              := 0;
    -- GRLIB plug&play configuration
    vendor          : integer                              := VENDOR_GAISLER;
    device          : integer                              := GAISLER_AHB2AXI;
    bar0            : integer range 0 to 1073741823        := 0;
    bar1            : integer range 0 to 1073741823        := 0;
    bar2            : integer range 0 to 1073741823        := 0;
    bar3            : integer range 0 to 1073741823        := 0
    );
  port (
    rstn  : in  std_logic;
    clk   : in  std_logic;
    ahbsi : in  ahb_slv_in_type;
    ahbso : out ahb_slv_out_type;
    aximi : in  axi_somi_type;
    aximo : out axi4_mosi_type
    );
end ahb2axi4b;



architecture rtl of ahb2axi4b is


  signal aximox : axix_mosi_type;

begin  -- rtl

  ahb2axibx : ahb2axib
    generic map(
      memtech         => memtech,
      hindex          => hindex,
      aximid          => aximid,
      wbuffer_num     => wbuffer_num,
      rprefetch_num   => rprefetch_num,
      always_secure   => always_secure,
      axi4            => 1,
      endianness_mode => endianness_mode,
      narrow_acc_mode => narrow_acc_mode,
      scantest        => scantest,
      vendor          => vendor,
      device          => device,
      bar0            => bar0,
      bar1            => bar1,
      bar2            => bar2,
      bar3            => bar3)
    port map (
      rst   => rstn,
      clk   => clk,
      ahbsi => ahbsi,
      ahbso => ahbso,
      aximi => aximi,
      aximo => aximox);

 
  aximo.b <= aximox.b;
  aximo.r <= aximox.r;

  aximo.w.data  <= aximox.w.data;
  aximo.w.strb  <= aximox.w.strb;
  aximo.w.last  <= aximox.w.last;
  aximo.w.valid <= aximox.w.valid;

  aximo.aw.id    <= aximox.aw.id;
  aximo.aw.addr  <= aximox.aw.addr;
  aximo.aw.len   <= aximox.aw.len;
  aximo.aw.size  <= aximox.aw.size;
  aximo.aw.burst <= aximox.aw.burst;
  aximo.aw.lock  <= aximox.aw.lock(0);
  aximo.aw.cache <= aximox.aw.cache;
  aximo.aw.prot  <= aximox.aw.prot;
  aximo.aw.valid <= aximox.aw.valid;
  aximo.aw.qos   <= (others => '0');

  aximo.ar.id    <= aximox.ar.id;
  aximo.ar.addr  <= aximox.ar.addr;
  aximo.ar.len   <= aximox.ar.len;
  aximo.ar.size  <= aximox.ar.size;
  aximo.ar.burst <= aximox.ar.burst;
  aximo.ar.lock  <= aximox.ar.lock(0);
  aximo.ar.cache <= aximox.ar.cache;
  aximo.ar.prot  <= aximox.ar.prot;
  aximo.ar.valid <= aximox.ar.valid;
  aximo.ar.qos   <= (others => '0');    

  

end rtl;
