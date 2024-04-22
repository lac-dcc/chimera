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
-- Entity: 	gr1553b_nlw
-- File:	gr1553b_nlw.vhd
-- Author:	Magnus Hjorth - Aeroflex Gaisler
-- Description:	Netlist wrapper for GR1553B
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.devices.all;
use grlib.stdlib.all;
library techmap;
use techmap.netcomp.all;
library gaisler;
use gaisler.gr1553b_pkg.all;

entity gr1553b_nlw is
  generic(
    tech: integer := 0;
    hindex: integer := 0;
    pindex : integer := 0;
    paddr: integer := 0;
    pmask : integer := 16#fff#;
    pirq : integer := 0;
    bc_enable: integer range 0 to 1 := 1;
    rt_enable: integer range 0 to 1 := 1;
    bm_enable: integer range 0 to 1 := 1;
    bc_timer: integer range 0 to 2 := 1;
    bc_rtbusmask: integer range 0 to 1 := 1;
    extra_regkeys: integer range 0 to 1 := 0;
    syncrst: integer range 0 to 2 := 0;
    ahbendian: integer := 0;
    bm_filters: integer range 0 to 1 := 1;
    codecfreq: integer := 20;
    sameclk: integer range 0 to 1 := 0;
    codecver: integer range 0 to 2 := 0
    );
  port(
    clk: in std_logic;
    rst: in std_logic;
    ahbmi: in ahb_mst_in_type;
    ahbmo: out ahb_mst_out_type;
    apbsi: in apb_slv_in_type;
    apbso: out apb_slv_out_type;
    auxin: in gr1553b_auxin_type;
    auxout: out gr1553b_auxout_type;
    codec_clk: in std_logic;
    codec_rst: in std_logic;
    txout: out gr1553b_txout_type;
    txout_fb: in gr1553b_txout_type;
    rxin: in gr1553b_rxin_type
    );


end;
    
architecture rtl of gr1553b_nlw is

  signal mi_hgrant,mi_hready,mo_hbusreq,mo_hwrite,si_psel,si_penable,si_pwrite,so_pirq: std_logic;
  signal mi_hresp,mo_htrans: std_logic_vector(1 downto 0);
  signal mo_hsize,mo_hburst: std_logic_vector(2 downto 0);
  signal mi_hrdata,mo_haddr,mo_hwdata,si_pwdata,so_prdata: std_logic_vector(31 downto 0);
  signal si_paddr: std_logic_vector(7 downto 0);
  signal bcsync,rtsync,busreset,rtaddrp: std_logic;
  signal rtaddr: std_logic_vector(4 downto 0);
  signal busainen,busainp,busainn,busaouten,busaoutp,busaoutn: std_logic;
  signal busbinen,busbinp,busbinn,busbouten,busboutp,busboutn: std_logic;  
  
begin

  geninf: if tech=0 generate
    x: gr1553b_stdlogic
      generic map (bc_enable,rt_enable,bm_enable,bc_timer,bc_rtbusmask,extra_regkeys,syncrst,
                   ahbendian,bm_filters,codecfreq,sameclk,codecver)
      port map (clk,rst,codec_clk,codec_rst,
                mi_hgrant,mi_hready,mi_hresp,mi_hrdata,
                mo_hbusreq,mo_htrans,mo_haddr,mo_hwrite,mo_hsize,mo_hburst,mo_hwdata,
                si_psel,si_penable,si_paddr,si_pwrite,si_pwdata,
                so_prdata,so_pirq,
                bcsync,rtsync,busreset,rtaddr,rtaddrp,
                busainen,busainp,busainn,busaouten,busaoutp,busaoutn,
                busbinen,busbinp,busbinn,busbouten,busboutp,busboutn);
  end generate;
  gennetl : if tech /= 0 generate
    x: gr1553b_net
      generic map (tech,
                   bc_enable,rt_enable,bm_enable,bc_timer,bc_rtbusmask,extra_regkeys,syncrst,
                   ahbendian,bm_filters,codecfreq,sameclk,codecver)
      port map (clk,rst,codec_clk,codec_rst,
                mi_hgrant,mi_hready,mi_hresp,mi_hrdata,
                mo_hbusreq,mo_htrans,mo_haddr,mo_hwrite,mo_hsize,mo_hburst,mo_hwdata,
                si_psel,si_penable,si_paddr,si_pwrite,si_pwdata,
                so_prdata,so_pirq,
                bcsync,rtsync,busreset,rtaddr,rtaddrp,
                busainen,busainp,busainn,busaouten,busaoutp,busaoutn,
                busbinen,busbinp,busbinn,busbouten,busboutp,busboutn);
  end generate;

  mi_hgrant <= ahbmi.hgrant(hindex);
  mi_hready <= ahbmi.hready;
  mi_hresp <= ahbmi.hresp;
  mi_hrdata <= ahbreadword(ahbmi.hrdata);
  ahbmo.hbusreq <= mo_hbusreq;
  ahbmo.hlock <= '0';
  ahbmo.htrans <= mo_htrans;
  ahbmo.haddr <= mo_haddr;
  ahbmo.hwrite <= mo_hwrite;
  ahbmo.hsize <= mo_hsize;
  ahbmo.hburst <= mo_hburst;
  ahbmo.hwdata <= ahbdrivedata(mo_hwdata);
  ahbmo.hprot <= "0011";
  ahbmo.hirq <= (others => '0');
  si_psel <= apbsi.psel(pindex);
  si_penable <= apbsi.penable;
  si_paddr <= apbsi.paddr(7 downto 0);
  si_pwrite <= apbsi.pwrite;
  si_pwdata <= apbsi.pwdata;
  apbso.prdata <= so_prdata;
  p : process(so_pirq)
    variable irqv : std_logic_vector(NAHBIRQ-1 downto 0);
  begin
    irqv := (others => '0');
    irqv(pirq) := so_pirq;
    apbso.pirq <= irqv;
  end process p;
  bcsync <= auxin.extsync;
  auxout.rtsync <= rtsync;
  auxout.busreset <= busreset;
  rtaddr <= auxin.rtaddr;
  rtaddrp <= auxin.rtpar;  
  txout.busA_txP <= busaoutp;
  txout.busA_txN <= busaoutn;
  txout.busA_txen <= busaouten;
  txout.busA_txin <= not busaouten;
  txout.busA_rxen <= busainen;
  txout.busB_txP <= busboutp;
  txout.busB_txN <= busboutn;
  txout.busB_txen <= busbouten;
  txout.busB_txin <= not busbouten;
  txout.busB_rxen <= busbinen;
  busainp <= rxin.busA_rxP;
  busainn <= rxin.busA_rxN;
  busbinp <= rxin.busB_rxP;
  busbinn <= rxin.busB_rxN;

  ahbmo.hindex <= hindex;
  ahbmo.hconfig <= (0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_GR1553B, gr1553b_version, gr1553b_cfgver, 0 ),
                    others => zero32);

  apbso.pindex <= pindex;
  apbso.pconfig <= (0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_GR1553B, gr1553b_version, gr1553b_cfgver, pirq),
                    1 => apb_iobar(paddr,pmask));
  
end;

