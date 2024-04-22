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
-------------------------------------------------------------------------------
-- Entity:	ahb_mst_iface
-- File:        ahb_mst_iface.vhd
-- Author:      Marko Isomaki - Aeroflex Gaisler
-- Modified     Alen Bardizbanyan - Cobham Gaisler AB
--              ACDM support
-- Description: General AHB master interface for DMA
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;
use grlib.stdlib.all;
use grlib.amba.all;
library gaisler;
use gaisler.misc.all;

entity ahb_mst_iface is
  generic(
    hindex      : integer;
    vendor      : integer;
    device      : integer;
    revision    : integer;
    scantest    : integer := 0);
  port(
    rst         : in  std_ulogic;
    clk         : in  std_ulogic;
    ahbmi       : in  ahb_mst_in_type;
    ahbmo       : out ahb_mst_out_type;
    msti        : in  ahb_mst_iface_in_type;
    msto        : out ahb_mst_iface_out_type
  );
end entity;

architecture rtl of ahb_mst_iface is
  constant hconfig : ahb_config_type := (
    0 => ahb_device_reg ( vendor, device, 0, revision, 0),
    others => zero32);
  
  type reg_type is record
    bg     : std_ulogic; --bus granted
    ba     : std_ulogic; --bus active
    bb     : std_ulogic; --1kB burst boundary detected
    retry  : std_ulogic;
    error  : std_ulogic;
    addr   : std_logic_vector(2 downto 0);
  end record;

  constant RESET_ALL : boolean := GRLIB_CONFIG_ARRAY(grlib_sync_reset_enable_all) = 1;
  constant ASYNC_RESET : boolean := GRLIB_CONFIG_ARRAY(grlib_async_reset_enable) = 1;
  constant RRES : reg_type := (bg => '0', ba => '0', bb => '0', retry => '0', error => '0', addr => "000");
  
  signal r, rin : reg_type;
  signal arst : std_ulogic;
  
begin

  arst <= ahbmi.testrst when (ASYNC_RESET and scantest/=0 and ahbmi.testen/='0') else
          rst when ASYNC_RESET else
          '1';

  comb : process(rst, r, msti, ahbmi) is
  variable v       : reg_type;
  variable htrans  : std_logic_vector(1 downto 0);
  variable hbusreq : std_ulogic;
  variable hwrite  : std_ulogic; 
  variable haddr   : std_logic_vector(31 downto 0);
  variable hwdata  : std_logic_vector(31 downto 0);
  variable vretry  : std_ulogic;
  variable vready  : std_ulogic;
  variable verror  : std_ulogic;
  variable vgrant  : std_ulogic;
  variable hsize   : std_logic_vector(2 downto 0);
  begin
    v := r; htrans := HTRANS_IDLE; vready := '0'; vretry := '0';
    verror := '0'; vgrant := '0'; 
    hsize := HSIZE_WORD;
    
    hwdata := msti.data;
    
    hbusreq := msti.req;
    
    if hbusreq = '1' then htrans := HTRANS_NONSEQ; end if;

    haddr := msti.addr; hwrite := msti.write;
    if (msti.req and r.ba and not r.retry) = '1' then
      htrans := HTRANS_SEQ; 
    end if;
    if (msti.req and r.bg and ahbmi.hready and not r.retry) = '1' then
      vgrant := '1';
    end if; 
    
    --1 kB burst boundary
    if ahbmi.hready = '1' then
      v.addr := haddr(4 downto 2);
      if haddr(9 downto 2) = "11111111" then
        v.bb := '1';
      else
        v.bb := '0';
      end if;
    end if;

    if (r.bb = '1') and (htrans /= HTRANS_IDLE) then
      htrans := HTRANS_NONSEQ;
    end if;
        
    if r.ba = '1' then
      if ahbmi.hready = '1' then
        case ahbmi.hresp is
        when HRESP_OKAY => vready := '1';
        when HRESP_SPLIT | HRESP_RETRY => vretry := '1';
        when HRESP_ERROR => verror := '1';
        when others => null;
        end case; 
      end if;
    end if;
    
    if (r.ba = '1') and 
       ((ahbmi.hresp = HRESP_RETRY) or (ahbmi.hresp = HRESP_SPLIT))
    then v.retry := not ahbmi.hready; else v.retry := '0'; end if;

    if (r.ba = '1') and 
      (ahbmi.hresp = HRESP_ERROR) 
    then v.error := not ahbmi.hready; else v.error := '0'; end if;
      
    if (r.retry or r.error) = '1' then htrans := HTRANS_IDLE; end if;
    
    if ahbmi.hready = '1' then
      v.bg := ahbmi.hgrant(hindex);
      if (htrans = HTRANS_NONSEQ) or (htrans = HTRANS_SEQ) then
        v.ba := r.bg;
      else
        v.ba := '0';
      end if;
    end if;

    if (not ASYNC_RESET) and (not RESET_ALL) and (rst = '0') then
      v.bg := '0'; v.ba := '0'; v.bb := '0';
    end if;
    
    rin <= v;
    msto.data      <= ahbreadword(ahbmi.hrdata,r.addr);
    msto.error     <= verror;
    msto.retry     <= vretry;
    msto.ready     <= vready;
    msto.grant     <= vgrant;
    ahbmo.htrans   <= htrans;
    ahbmo.hsize	   <= hsize;
    ahbmo.hbusreq  <= hbusreq;
    ahbmo.haddr	   <= haddr;
    ahbmo.hwrite   <= hwrite;
    ahbmo.hwdata   <= ahbdrivedata(hwdata);
  end process;

  syncrregs : if not ASYNC_RESET generate
    regs : process(clk)
    begin
      if rising_edge(clk) then
        r <= rin;
        if RESET_ALL and rst = '0' then r <= RRES; end if;
      end if;
    end process;
  end generate;
  asyncrregs : if ASYNC_RESET generate
    regs : process(clk, arst)
    begin
      if arst = '0' then
        r <= RRES;
      elsif rising_edge(clk) then
        r <= rin;
      end if;
    end process;
  end generate;
 
  ahbmo.hlock	 <= '0';
  ahbmo.hburst   <= HBURST_INCR;
  ahbmo.hprot	 <= "0011";
  ahbmo.hconfig  <= hconfig;
  ahbmo.hindex   <= hindex;
  ahbmo.hirq     <= (others => '0');
end architecture; 

