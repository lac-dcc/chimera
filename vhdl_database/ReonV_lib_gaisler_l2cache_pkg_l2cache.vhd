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
-- Package:     l2cache
-- File:        libcache.vhd
-- Author:      Nils-Johan Wessman - Gaisler Research
-- Description:	L2-Cache component declaration
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
library gaisler;

package l2cache is


component l2c is
  generic (
    hslvidx     : integer := 0;
    hmstidx     : integer := 0;
    haddr       : integer := 16#F00#;
    hmask       : integer := 16#F00#;
    ioaddr      : integer := 16#000#;
    cached      : integer := 16#0000#;
    hirq        : integer := 0;
    cen         : integer range 0 to 1 := 0;
    hproten     : integer range 0 to 1 := 0;
    wp          : integer range 0 to 1 := 0;
    repl        : integer range 0 to 1 := 0;
    ways        : integer range 1 to 4 := 1;
    linesize    : integer range 16 to 64 := 32;
    waysize     : integer range 1 to 512 := 1;
    memtech     : integer range 0 to NTECH := 0;
    bbuswidth   : integer := 128;
    bioaddr     : integer := 16#000#;
    biomask     : integer := 16#000#;
    sbus        : integer := 0;
    mbus        : integer := 1;
    stat        : integer range 0 to 2 := 0;
    scantest    : integer := 0;
    arch        : integer := 0;
    mtrr        : integer := 0;
    edacen      : integer range 0 to 1 := 0;
    rmw         : integer range 0 to 1 := 0;
    ft          : integer range 0 to 1 := 0;
    fttiming    : integer range 0 to 1 := 0;
    wbmask      : integer range 0 to 16#FFFF# := 16#FFFF#;
    debug       : integer range 0 to 1 := 0);
  port (
    rst   : in  std_ulogic;
    clk   : in  std_ulogic;
    ahbsi : in  ahb_slv_in_type;
    ahbso : out ahb_slv_out_type;
    ahbmi : in  ahb_mst_in_type;
    ahbmo : out ahb_mst_out_type;
    ahbsov: in  ahb_slv_out_vector;
    sto   : out std_logic_vector(10 downto 0);
    debugo: out std_logic_vector(255*debug downto 0)
    );
end component;

component l2c_axi_be is
  generic (
    hslvidx     : integer := 0;
    axiid       : integer := 0;
    haddr       : integer := 16#F00#;
    hmask       : integer := 16#F00#;
    ioaddr      : integer := 16#000#;
    cached      : integer := 16#0000#;
    hirq        : integer := 0;
    cen         : integer range 0 to 1 := 0;
    hproten     : integer range 0 to 1 := 0;
    wp          : integer range 0 to 1 := 0;
    repl        : integer range 0 to 1 := 0;
    ways        : integer range 1 to 4 := 1;
    linesize    : integer range 16 to 64 := 32;
    waysize     : integer range 1 to 512 := 1;
    memtech     : integer range 0 to NTECH := 0;
    sbus        : integer := 0;
    mbus        : integer := 1;
    stat        : integer range 0 to 2 := 0;
    scantest    : integer := 0;
    arch        : integer := 0;
    mtrr        : integer := 0;
    edacen      : integer range 0 to 1 := 0;
    rmw         : integer range 0 to 1 := 0;
    ft          : integer range 0 to 1 := 0;
    fttiming    : integer range 0 to 1 := 0;
    debug       : integer range 0 to 1 := 0);
  port (
    rst   : in  std_ulogic;
    clk   : in  std_ulogic;
    ahbsi : in  ahb_slv_in_type;
    ahbso : out ahb_slv_out_type;
    aximi : in  axi_somi_type;
    aximo : out axi_mosi_type;
    sto   : out std_logic_vector(10 downto 0);
    debugo: out std_logic_vector(255*debug downto 0)
    );
end component;

end;

package body l2cache is

end;

