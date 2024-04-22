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
-- Package: 	gr1553b_pkg
-- File:	gr1553b_pkg.vhd
-- Author:	Magnus Hjorth - Aeroflex Gaisler
-- Description:	Package for GR1553B top-level component and user-visible types
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.ahb_mst_in_type;
use grlib.amba.ahb_mst_out_type;
use grlib.amba.apb_slv_in_type;
use grlib.amba.apb_slv_out_type;
library techmap;
use techmap.gencomp.all;

package gr1553b_pkg is

  constant gr1553b_version: integer := 0;
  constant gr1553b_cfgver: integer := 0;

  -----------------------------------------------------------------------------
  -- Types and top level component

  type gr1553b_txout_type is record
    busA_txP: std_logic;
    busA_txN: std_logic;
    busA_txen: std_logic;
    busA_rxen: std_logic;
    busB_txP: std_logic;
    busB_txN: std_logic;
    busB_txen: std_logic;
    busB_rxen: std_logic;
    -- For convenience, inverted versions of txen
    busA_txin: std_logic;
    busB_txin: std_logic;
  end record;

  type gr1553b_rxin_type is record
    busA_rxP: std_logic;
    busA_rxN: std_logic;
    busB_rxP: std_logic;
    busB_rxN: std_logic;
  end record;

  type gr1553b_auxin_type is record
    extsync: std_logic;
    rtaddr: std_logic_vector(4 downto 0);
    rtpar: std_logic;
  end record;

  type gr1553b_auxout_type is record
    rtsync: std_logic;
    busreset: std_logic;
    validcmdA: std_logic;
    validcmdB: std_logic;
    timedoutA: std_logic;
    timedoutB: std_logic;
    badreg: std_logic;
    irqvec: std_logic_vector(7 downto 0);
  end record;
  
  constant gr1553b_rxin_zero: gr1553b_rxin_type :=
    (busA_rxP=>'0', busA_rxN=>'0', busB_rxP=>'0', busB_rxN=>'0');

  constant gr1553b_txout_zero: gr1553b_txout_type :=
    ('0','0','0','0','0','0','0','0','1','1');

  constant gr1553b_auxin_zero: gr1553b_auxin_type :=
    (extsync => '0', rtaddr => "11111", rtpar => '1');

  constant gr1553b_auxout_zero: gr1553b_auxout_type :=
    ('0','0','0','0','0','0','0',x"00");
    

  constant gr1553b_rxin_none: gr1553b_rxin_type := gr1553b_rxin_zero;
  constant gr1553b_txout_none: gr1553b_txout_type := gr1553b_txout_zero;  
  constant gr1553b_auxin_none: gr1553b_auxin_type := gr1553b_auxin_zero;
  constant gr1553b_auxout_none: gr1553b_auxout_type := gr1553b_auxout_zero;
  
  component gr1553b is
    generic(
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
      syncrst: integer range 0 to 2 := 1;
      ahbendian: integer range 0 to 1 := 0;
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
  end component;

  -----------------------------------------------------------------------------
  -- Pads convenience component

  component gr1553b_pads is
    generic (
      padtech: integer;
      outen_pol: integer range 0 to 1;
      level: integer := ttl;
      slew: integer := 0;
      voltage: integer := x33v;
      strength: integer := 12;
      filter: integer := 0
      );
    port (
      txout: in gr1553b_txout_type;
      rxin: out gr1553b_rxin_type;
      busainen    : out std_logic;
      busainp     : in  std_logic;
      busainn     : in  std_logic;
      busaoutenin : out std_logic;
      busaoutp    : out std_logic;
      busaoutn    : out std_logic;
      busbinen    : out std_logic;
      busbinp     : in  std_logic;
      busbinn     : in  std_logic;
      busboutenin : out std_logic;
      busboutp    : out std_logic;
      busboutn    : out std_logic
      );
  end component;  
  
  -----------------------------------------------------------------------------
  -- Wrappers for netlists etc.
  
  component gr1553b_stdlogic is
    generic (
      bc_enable: integer range 0 to 1 := 1;
      rt_enable: integer range 0 to 1 := 1;
      bm_enable: integer range 0 to 1 := 1;
      bc_timer: integer range 0 to 2 := 1;
      bc_rtbusmask: integer range 0 to 1 := 1;
      extra_regkeys: integer range 0 to 1 := 0;
      syncrst: integer range 0 to 2 := 1;
      ahbendian: integer range 0 to 1 := 0;
      bm_filters: integer range 0 to 1 := 1;
      codecfreq: integer := 20;
      sameclk: integer range 0 to 1 := 0;
      codecver: integer range 0 to 2 := 0
      );  
    port (
      clk: in std_logic;
      rst: in std_logic;
      codec_clk: in std_logic;
      codec_rst: in std_logic;      
      -- AHB interface      
      mi_hgrant	: in std_logic;                         -- bus grant
      mi_hready	: in std_ulogic;                        -- transfer done
      mi_hresp	: in std_logic_vector(1 downto 0); 	-- response type
      mi_hrdata	: in std_logic_vector(31 downto 0); 	-- read data bus      
      mo_hbusreq: out std_ulogic;                       -- bus request
      mo_htrans	: out std_logic_vector(1 downto 0); 	-- transfer type
      mo_haddr	: out std_logic_vector(31 downto 0); 	-- address bus (byte)
      mo_hwrite	: out std_ulogic;                       -- read/write
      mo_hsize	: out std_logic_vector(2 downto 0); 	-- transfer size
      mo_hburst	: out std_logic_vector(2 downto 0); 	-- burst type
      mo_hwdata	: out std_logic_vector(31 downto 0); 	-- write data bus
      -- APB interface    
      si_psel	: in std_logic;                         -- slave select
      si_penable: in std_ulogic;                        -- strobe
      si_paddr	: in std_logic_vector(7 downto 0); 	-- address bus (byte addr)
      si_pwrite	: in std_ulogic;                        -- write
      si_pwdata	: in std_logic_vector(31 downto 0); 	-- write data bus
      so_prdata	: out std_logic_vector(31 downto 0); 	-- read data bus
      so_pirq 	: out std_logic;                        -- interrupt bus    
      -- Aux signals
      bcsync    : in std_logic;
      rtsync    : out std_logic;
      busreset  : out std_logic;
      rtaddr    : in std_logic_vector(4 downto 0);
      rtaddrp   : in std_logic;
      -- 1553 transceiver interface
      busainen   : out std_logic;
      busainp    : in  std_logic;
      busainn    : in  std_logic;
      busaouten  : out std_logic;  
      busaoutp   : out std_logic;
      busaoutn   : out std_logic;
      busbinen   : out std_logic;
      busbinp    : in  std_logic;
      busbinn    : in  std_logic;
      busbouten  : out std_logic;
      busboutp   : out std_logic;
      busboutn   : out std_logic
    );  
  end component;
  
  component gr1553b_nlw is
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
      syncrst: integer range 0 to 2 := 1;
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
  end component;
  
  -----------------------------------------------------------------------------
  -- APB Register definitions
  
  constant REG_IRQSTATUS:    std_logic_vector := x"00";
  constant REG_IRQENABLE:    std_logic_vector := x"04";
  
  constant REG_BCSTATUS:     std_logic_vector := x"40";
  constant REG_BCACTION:     std_logic_vector := x"44";
  constant REG_BCSCHEMADDR:  std_logic_vector := x"48";
  constant REG_BCASYNCADDR:  std_logic_vector := x"4C";
  constant REG_BCTIME:       std_logic_vector := x"50";
  constant REG_BCWAKEUP:     std_logic_vector := x"54";
  constant REG_BCIRQSRC:     std_logic_vector := x"58";
  constant REG_BCRTBUSMASK:  std_logic_vector := x"5C";
  constant REG_BCSCHEMSLOT:  std_logic_vector := x"68";
  constant REG_BCASYNCSLOT:  std_logic_vector := x"6C";                                                 
  
  constant REG_RTSTATUS:     std_logic_vector := x"80";  
  constant REG_RTCONFIG:     std_logic_vector := x"84";
  constant REG_RTBUSSTAT:    std_logic_vector := x"88";
  constant REG_RTBUSWORDS:   std_logic_vector := x"8C";
  constant REG_RTSYNC:       std_logic_vector := x"90";
  constant REG_RTTABLEADDR:  std_logic_vector := x"94";
  constant REG_RTMODECONFIG: std_logic_vector := x"98";
  constant REG_RTTIMETAG:    std_logic_vector := x"A4";
  constant REG_RTLOGMASK:    std_logic_vector := x"AC";
  constant REG_RTLOGPOS:     std_logic_vector := x"B0";
  constant REG_RTIRQSRC:     std_logic_vector := x"B4";

  constant REG_BMSTATUS:     std_logic_vector := x"C0";
  constant REG_BMCONFIG:     std_logic_vector := x"C4";
  constant REG_BMADDRFILT:   std_logic_vector := x"C8";
  constant REG_BMSAFILT:     std_logic_vector := x"CC";
  constant REG_BMMCFILT:     std_logic_vector := x"D0";
  constant REG_BMBUFSTART:   std_logic_vector := x"D4";
  constant REG_BMBUFEND:     std_logic_vector := x"D8";
  constant REG_BMBUFPOS:     std_logic_vector := x"DC";
  constant REG_BMTIMETAG:    std_logic_vector := x"E0";

  -----------------------------------------------------------------------------
  -- Embedded RT core
  component grrt is
    generic (
      codecfreq: integer := 20;
      sameclk  : integer := 1;
      syncrst  : integer range 0 to 1 := 1
      );
    port (
      -- Clock and reset
      clk      : in  std_ulogic;
      rst      : in  std_ulogic;
      clk1553  : in  std_ulogic;
      rst1553  : in  std_ulogic;
      -- Control signals
      rtaddr   : in  std_logic_vector(4 downto 0);
      rtaddrp  : in  std_ulogic;
      rtstat   : in  std_logic_vector(3 downto 0);    -- 3=SR, 2=busy 1=SSF 0=TF
      ad31en   : in  std_ulogic;  -- 1=RT31 is normal addr, 0=RT31 is broadcast
      rtsync   : out std_ulogic;
      rtreset  : out std_ulogic;
      stamp    : out std_ulogic;
      -- Front-end interface
      phase    : out std_logic_vector(1 downto 0);
      transfer : out std_logic_vector(11 downto 0);
      resp     : in  std_logic_vector(1 downto 0);
      tfrerror : out std_ulogic;
      txdata   : in  std_logic_vector(15 downto 0);
      rxdata   : out std_logic_vector(15 downto 0);
      datardy  : in  std_ulogic;
      datarw   : out std_ulogic;
      -- 1553 transceiver interface
      aoutin   : out std_ulogic;
      aoutp    : out std_ulogic;
      aoutn    : out std_ulogic;
      ainen    : out std_ulogic;
      ainp     : in std_ulogic;
      ainn     : in std_ulogic;
      boutin   : out std_ulogic;
      boutp    : out std_ulogic;
      boutn    : out std_ulogic;
      binen    : out std_ulogic;
      binp     : in std_ulogic;
      binn     : in std_ulogic;
      -- Fail-safe timer feedback
      aoutp_fb : in std_logic;
      aoutn_fb : in std_logic;
      boutp_fb : in std_logic;
      boutn_fb : in std_logic
      );
  end component;

  -----------------------------------------------------------------------------
  -- Test signal generators

  component gr1553b_tgapb is
    generic(
      pindex : integer := 0;
      paddr: integer := 0;
      pmask : integer := 16#fff#;
      codecfreq: integer := 20;
      extmodeen: integer range 0 to 1 := 0;
      rawmodeen: integer range 0 to 1 := 0;
      rawmemtech: integer := 0
      );
    port(
      clk: in std_logic;
      rst: in std_logic;      
      codec_clk: in std_logic;
      codec_rst: in std_logic;      
      apbsi: in apb_slv_in_type;
      apbso: out apb_slv_out_type;      
      txout_core: in gr1553b_txout_type;
      rxin_core: out gr1553b_rxin_type;     
      txout_bus: out gr1553b_txout_type;
      rxin_bus: in gr1553b_rxin_type;      
      testing: out std_logic
      );
  end component;
  
  -----------------------------------------------------------------------------
  -- Simulation types and components for test bench

  -- U=Undefined, X=Unknown, 0=Zero, +=High, -=Low 
  type uwire1553 is ('U','X','0','+','-');
  type uwire1553_array is array(natural range <>) of uwire1553;
  function resolved (a: uwire1553_array) return uwire1553;
  subtype wire1553 is resolved uwire1553;

  component simtrans1553_single is
    generic (
      txdelay: time := 200 ns;
      rxdelay: time := 450 ns
      );
    port (
      buswire: inout wire1553;
      rxen: in std_logic;
      txin: in std_logic;
      txP: in std_logic;
      txN: in std_logic;
      rxP: out std_logic;
      rxN: out std_logic
      );
  end component;
      
  component simtrans1553 is
    generic (
      txdelay: time := 200 ns;
      rxdelay: time := 450 ns
      );
    port (
      busA: inout wire1553;
      busB: inout wire1553;
      rxenA: in std_logic;
      txinA: in std_logic;
      txAP: in std_logic;
      txAN: in std_logic;
      rxAP: out std_logic;
      rxAN: out std_logic;
      rxenB: in std_logic;
      txinB: in std_logic;
      txBP: in std_logic;
      txBN: in std_logic;
      rxBP: out std_logic;
      rxBN: out std_logic
      );
  end component;        

  component combine1553 is
    port (
      clk: in std_ulogic;
      txin1,rxen1: in std_ulogic;      
      tx1P,tx1N: in std_ulogic;
      rx1P,rx1N: out std_ulogic;
      txin2,rxen2: in std_ulogic;      
      tx2P,tx2N: in std_ulogic;
      rx2P,rx2N: out std_ulogic;
      txin,rxen: out std_ulogic;      
      txP,txN: out std_ulogic;
      rxP,rxN: in std_ulogic
      );
  end component;  
  
end package;

package body gr1553b_pkg is

  function resolved (a: uwire1553_array) return uwire1553 is
    variable w,w2: uwire1553;
  begin
    w := a(a'left);
    for q in a'range loop
      w2 := a(q);
      if w /= w2 then
        case w is
          when 'U' => w := 'X';
          when 'X' => null;
          when '0' => w := w2;
          when '+' | '-' => if w2 /= '0' then w:='X'; end if;
        end case;
      end if;
    end loop;
    return w;
  end;
  
end package body;

