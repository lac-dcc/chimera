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
library grlib;
use grlib.amba.all;
library techmap;
use techmap.gencomp.all;

package spacewire is
  type grspw_in_type is record
    d            : std_logic_vector(3 downto 0);
    dv           : std_logic_vector(3 downto 0);
    s            : std_logic_vector(1 downto 0);
    dconnect     : std_logic_vector(3 downto 0);
    tickin       : std_ulogic;
    tickinraw    : std_ulogic;
    timein       : std_logic_vector(7 downto 0);
    clkdiv10     : std_logic_vector(7 downto 0);
    rmapen       : std_ulogic;
    rmapnodeaddr : std_logic_vector(7 downto 0);
    dcrstval     : std_logic_vector(9 downto 0);
    timerrstval  : std_logic_vector(11 downto 0);
    nd           : std_logic_vector(9 downto 0);
    intpreload   : std_logic_vector(30 downto 0);
    inttreload   : std_logic_vector(30 downto 0);
    intiareload  : std_logic_vector(30 downto 0);
    intcreload   : std_logic_vector(30 downto 0);
    irqtxdefault : std_logic_vector(5 downto 0);
    pnpen        : std_ulogic;
    pnpuvendid   : std_logic_vector(15 downto 0);
    pnpuprodid   : std_logic_vector(15 downto 0);
    pnpusn       : std_logic_vector(31 downto 0);
  end record;

  type grspw_out_type is record
    d           : std_logic_vector(3 downto 0);
    s           : std_logic_vector(3 downto 0);
    tickout     : std_ulogic;
    tickoutraw  : std_ulogic;
    tickindone  : std_ulogic;
    timeout     : std_logic_vector(7 downto 0);
    linkdis     : std_ulogic;
    rmapact     : std_ulogic;
    rxdataout   : std_logic_vector(8 downto 0);
    rxdav       : std_ulogic;
    loopback    : std_ulogic;
    rxrst       : std_ulogic;
  end record;

  constant grspw_in_none : grspw_in_type :=
    ((others => '0'), (others => '0'), (others => '0'),
     (others => '0'), '0', '0', (others => '0'), (others => '0'), '0',
     (others => '0'), (others => '0'), (others => '0'), (others => '0'),
     (others => '0'), (others => '0'), (others => '0'), (others => '0'),
     (others => '0'), '0', (others => '0'), (others => '0'),
     (others => '0'));

  constant grspw_out_none : grspw_out_type :=
    ((others => '0'), (others => '0'), '0', '0', '0', (others => '0'),
     '0', '0', (others => '0'), '0', '0', '0');

  type grspw_codec_in_type is record
    --spw
    d            : std_logic_vector(3 downto 0);
    dv           : std_logic_vector(3 downto 0);
    dconnect     : std_logic_vector(3 downto 0);
    --link fsm
    linkdisabled : std_ulogic;
    linkstart    : std_ulogic;
    autostart    : std_ulogic;
    portsel      : std_ulogic;
    noportforce  : std_ulogic;
    rdivisor     : std_logic_vector(7 downto 0);
    idivisor     : std_logic_vector(7 downto 0);
    --rx iface
    rxiread      : std_ulogic;
    rxififorst   : std_ulogic;
    --tx iface
    txiwrite     : std_ulogic;
    txichar      : std_logic_vector(8 downto 0);
    txififorst   : std_ulogic;
    --time iface
    tickin       : std_ulogic;
    timein       : std_logic_vector(7 downto 0);
    -- input timing testing
    testd        : std_logic_vector(1 downto 0);
    tests        : std_logic_vector(1 downto 0);
    testinput    : std_ulogic;
  end record;

  type grspw_codec_out_type is record
    --spw
    do           : std_logic_vector(3 downto 0);
    so           : std_logic_vector(3 downto 0);
    --link fsm
    state        : std_logic_vector(2 downto 0);
    actport      : std_ulogic;
    dconnecterr  : std_ulogic;
    crederr      : std_ulogic;
    escerr       : std_ulogic;
    parerr       : std_ulogic;
    --rx iface
    rxicharav    : std_ulogic;
    rxicharcnt   : std_logic_vector(11 downto 0);
    rxichar      : std_logic_vector(8 downto 0);
    --tx iface
    txicharcnt   : std_logic_vector(11 downto 0);
    txifull      : std_ulogic;
    txiempty     : std_ulogic;
    txififorst   : std_ulogic;
    --time iface
    tickin_done  : std_ulogic;
    tickin_busy  : std_ulogic;
    tickout      : std_ulogic;
    timeout      : std_logic_vector(7 downto 0);
    --memory error
    merror       : std_ulogic;
    --credit counters
    ocredcnt     : std_logic_vector(5 downto 0);
    credcnt      : std_logic_vector(5 downto 0);
    --misc
    powerdown    : std_ulogic;
    powerdownrx  : std_ulogic;
    --memory error, separate signals
    rxmerror     : std_ulogic;
    txmerror     : std_ulogic;
  end record;

  type grspw_dma_in_type is record
    --rx iface
    rxiread          : std_ulogic;
    --tx iface
    txiwrite         : std_ulogic;
    txichar          : std_logic_vector(8 downto 0);
    txififorst       : std_ulogic;
    --internal time iface
    itickin          : std_ulogic;
    itimein          : std_logic_vector(7 downto 0);    
    --time iface
    tickin           : std_ulogic;
    timein           : std_logic_vector(7 downto 0);
    --rmap iface
    rmapen           : std_ulogic;
    rmapnodeaddr     : std_logic_vector(7 downto 0);
    --internal interrupt iface
    intdisc          : std_ulogic;
    inttimeout       : std_logic_vector(63 downto 0);
    -- configuration signals
    tcflagmode       : std_ulogic;
    en64int          : std_ulogic;
    inten            : std_ulogic;
  end record;

  type grspw_dma_out_type is record
    --rx iface
    rxicharav    : std_ulogic;
    rxichar      : std_logic_vector(8 downto 0);
    --tx iface
    txicharcnt   : std_logic_vector(11 downto 0);
    txifull      : std_ulogic;
    txififorst   : std_ulogic;
    --internal time iface
    itickout     : std_ulogic;
    itimeout     : std_logic_vector(7 downto 0);
    --time iface
    tickout      : std_ulogic;
    timeout      : std_logic_vector(7 downto 0);
    --memory error
    merror       : std_ulogic;
    --memory error, separate signals
    rxmerror     : std_ulogic;
    txmerror     : std_ulogic;
  end record;

  type grspw_fifo_in_type is record
    enbridge     : std_ulogic;
    --rx iface
    rxiread      : std_ulogic;
    --tx iface
    txiwrite     : std_ulogic;
    txichar      : std_logic_vector(8 downto 0);
    txififorst   : std_ulogic;
    --internal time iface
    itickin      : std_ulogic;
    itimein      : std_logic_vector(7 downto 0);
    --time iface
    tickin       : std_ulogic;
    timein       : std_logic_vector(7 downto 0);
    rmapen       : std_ulogic;
    --external interface
    etxwrite     : std_ulogic;
    etxchar      : std_logic_vector(8 downto 0);
    erxread      : std_ulogic;
  end record;

  type grspw_fifo_out_type is record
    --rx iface
    rxicharcnt   : std_logic_vector(11 downto 0);
    rxicharav    : std_ulogic;
    rxichar      : std_logic_vector(8 downto 0);
    --tx iface
    txicharcnt   : std_logic_vector(11 downto 0);
    txifull      : std_ulogic;
    txififorst   : std_ulogic;
    --internal time iface
    itickout     : std_ulogic;
    itimeout     : std_logic_vector(7 downto 0);
    --time iface
    tickout      : std_ulogic;
    timeout      : std_logic_vector(7 downto 0);
    --external interface
    erxcharav    : std_ulogic;
    erxaempty    : std_ulogic;
    etxfull      : std_ulogic;
    etxafull     : std_ulogic;
    erxchar      : std_logic_vector(8 downto 0);
    --memory errors
    merror       : std_ulogic;
    --memory error, separate signals
    rxmerror     : std_ulogic;
    txmerror     : std_ulogic;
  end record;

  type grspw_router_fifo_char_type is array (0 to 30) of std_logic_vector(8 downto 0);
  type grspw_router_time_type is array (0 to 30) of std_logic_vector(7 downto 0);

  type grspw_router_in_type is record
    rmapen              : std_logic_vector(30 downto 0);
    idivisor            : std_logic_vector(7 downto 0);
    txwrite             : std_logic_vector(30 downto 0);
    txchar              : grspw_router_fifo_char_type;
    rxread              : std_logic_vector(30 downto 0);
    tickin              : std_logic_vector(30 downto 0);
    timein              : grspw_router_time_type;
    reload              : std_logic_vector(31 downto 0);
    reloadn             : std_logic_vector(31 downto 0);
    timeren             : std_ulogic;
    timecodeen          : std_ulogic;
    cfglock             : std_ulogic;
    selfaddren          : std_ulogic;
    linkstartreq        : std_logic_vector(31 downto 1);
    autodconnect        : std_logic_vector(31 downto 1);
    instanceid          : std_logic_vector(7 downto 0);
    enbridge            : std_logic_vector(30 downto 0);
    enexttime           : std_logic_vector(30 downto 0);
    auxtickin           : std_ulogic;
    auxtimeinen         : std_ulogic;
    auxtimein           : std_logic_vector(7 downto 0);
    irqtimeoutreload    : std_logic_vector(31 downto 0);
    ahbso               : ahb_slv_out_type;
    interruptcodeen     : std_ulogic;
    pnpen               : std_ulogic;
    timecodefilt        : std_ulogic;
    interruptfwd        : std_ulogic;
    spillifnrdy         : std_logic_vector(31 downto 1);
    timecoderegen       : std_ulogic;
    gpi                 : std_logic_vector(127 downto 0);
    staticrouteen       : std_ulogic;
    spwclklock          : std_ulogic;
    irqgenreload        : std_logic_vector(31 downto 0);
    interruptmode       : std_ulogic;
    -- input timing testing
    testd               : std_logic_vector(61 downto 0);
    tests               : std_logic_vector(61 downto 0);
    testinput           : std_ulogic;
  end record;

  type grspw_router_out_type is record
    rxcharav      : std_logic_vector(30 downto 0);
    rxaempty      : std_logic_vector(30 downto 0);
    txfull        : std_logic_vector(30 downto 0);
    txafull       : std_logic_vector(30 downto 0);
    rxchar        : grspw_router_fifo_char_type;
    auxtickout    : std_ulogic;
    auxtimeout    : std_logic_vector(7 downto 0);
    auxtickindone : std_ulogic;
    tickout       : std_logic_vector(30 downto 0);
    timeout       : grspw_router_time_type;
    gerror        : std_ulogic;
    lerror        : std_ulogic;
    merror        : std_ulogic;
    linkrun       : std_logic_vector(30 downto 0);
    porterr       : std_logic_vector(31 downto 0);
    spwen         : std_logic_vector(30 downto 0);
    ahbsi         : ahb_slv_in_type;
    powerdown     : std_logic_vector(30 downto 0);
    powerdownrx   : std_logic_vector(30 downto 0);
    gpo           : std_logic_vector(127 downto 0);
  end record;

  constant grspw_router_in_none : grspw_router_in_type :=
    ((others => '0'), (others => '0'), (others => '0'), (others => (others => '0')),
     (others => '0'), (others => '0'), (others => (others => '0')), (others => '0'),
     (others => '0'), '0', '0', '0', '0', (others => '0') , (others => '0'), (others => '0'), (others => '0'),
     (others => '0'), '0', '0', (others => '0'), (others => '0'), ahbs_none, '0', '0', '0', '0',
     (others => '0'), '0', (others => '0'), '0', '1', (others => '0'), '0', (others => '0'), (others => '0'), '0');

  constant grspw_router_out_none : grspw_router_out_type :=
    ((others => '0'), (others => '0'), (others => '0'), (others => '0'),
     (others => (others => '0')), '0', (others => '0'), '0', (others => '0'), (others => (others => '0')), '0',
     '0', '0', (others => '0'), (others => '0'), (others => '0'), ahbs_in_none,
     (others => '0'), (others => '0'), (others => '0'));

  type spw_ahb_mst_out_vector is array (natural range <>) of
    ahb_mst_out_type;
  type spw_ahb_mst_in_vector is array (natural range <>) of
    ahb_mst_in_type;
  type spw_apb_slv_out_vector is array (natural range <>) of
    apb_slv_out_type;


  component grspw_phy is
    generic(
      tech          : integer              := 0;
      rxclkbuftype  : integer range 0 to 2 := 0;
      scantest      : integer range 0 to 1 := 0
      );
    port(
      rxrst    : in  std_ulogic;
      di       : in  std_ulogic;
      si       : in  std_ulogic;
      rxclko   : out std_ulogic;
      do       : out std_ulogic;
      ndo      : out std_logic_vector(4 downto 0);
      dconnect : out std_logic_vector(1 downto 0);
      testen   : in  std_ulogic := '0';
      testclk  : in  std_ulogic := '0'
      );
  end component;

  component grspw2_phy is
    generic(
      scantest      : integer;
      tech          : integer;
      input_type    : integer;
      input_level   : integer := 0;
      input_voltage : integer := x33v;
      rxclkbuftype  : integer range 0 to 2 := 0
      );
    port(
      rstn     : in std_ulogic;
      rxclki   : in std_ulogic;
      rxclkin  : in std_ulogic;
      nrxclki  : in std_ulogic;
      di       : in std_ulogic;
      si       : in std_ulogic;  --used as df when input_type=3
      do       : out std_logic_vector(1 downto 0);
      dov      : out std_logic_vector(1 downto 0);
      dconnect : out std_logic_vector(1 downto 0);
      rxclko   : out std_ulogic;
      testrst  : in  std_ulogic := '0';
      testen   : in  std_ulogic := '0';
      -- input timing testing
      testdo   : out std_logic_vector(1 downto 0);
      testso   : out std_logic_vector(1 downto 0)
      );
  end component;

  component grspw2 is
    generic(
      tech            : integer range 0 to NTECH     := inferred;
      hindex          : integer range 0 to NAHBMST-1 := 0;
      pindex          : integer range 0 to NAPBSLV-1 := 0;
      paddr           : integer range 0 to 16#FFF#   := 0;
      pmask           : integer range 0 to 16#FFF#   := 16#FFF#;
      pirq            : integer range 0 to NAHBIRQ-1 := 0;
      rmap            : integer range 0 to 2  := 0;
      rmapcrc         : integer range 0 to 1  := 0;
      fifosize1       : integer range 4 to 64 := 32;
      fifosize2       : integer range 16 to 64 := 64;
      rxunaligned     : integer range 0 to 1 := 0;
      rmapbufs        : integer range 2 to 8 := 4;
      ft              : integer range 0 to 2 := 0;
      scantest        : integer range 0 to 1 := 0;
      techfifo        : integer range 0 to 1 := 1;
      ports           : integer range 1 to 2 := 1;
      dmachan         : integer range 1 to 4 := 1;
      memtech         : integer range 0 to NTECH := DEFMEMTECH;
      input_type      : integer range 0 to 4 := 0;
      output_type     : integer range 0 to 2 := 0;
      rxtx_sameclk    : integer range 0 to 1 := 0;
      netlist         : integer range 0 to 1 := 0;
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
      rst        : in  std_ulogic;
      clk        : in  std_ulogic;
      rxclk0     : in  std_ulogic;
      rxclk1     : in  std_ulogic;
      txclk      : in  std_ulogic;
      txclkn     : in  std_ulogic;
      ahbmi      : in  ahb_mst_in_type;
      ahbmo      : out ahb_mst_out_type;
      apbi       : in  apb_slv_in_type;
      apbo       : out apb_slv_out_type;
      swni       : in  grspw_in_type;
      swno       : out grspw_out_type
      );
  end component;

  component grspw is
    generic(
      tech         : integer range 0 to NTECH := DEFFABTECH;
      hindex       : integer range 0 to NAHBMST-1 := 0;
      pindex       : integer range 0 to NAPBSLV-1 := 0;
      paddr        : integer range 0 to 16#FFF#   := 0;
      pmask        : integer range 0 to 16#FFF#   := 16#FFF#;
      pirq         : integer range 0 to NAHBIRQ-1 := 0;
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
      netlist      : integer range 0 to 1 := 0;
      ports        : integer range 1 to 2 := 1;
      memtech      : integer range 0 to NTECH := DEFMEMTECH;
      nodeaddr     : integer range 0 to 255 := 254;
      destkey      : integer range 0 to 255 := 0
    );
    port(
      rst        : in  std_ulogic;
      clk        : in  std_ulogic;
      rxclk      : in  std_logic_vector(1 downto 0);
      txclk      : in  std_ulogic;
      ahbmi      : in  ahb_mst_in_type;
      ahbmo      : out ahb_mst_out_type;
      apbi       : in  apb_slv_in_type;
      apbo       : out apb_slv_out_type;
      swni       : in  grspw_in_type;
      swno       : out grspw_out_type);
  end component;

  type grspw_in_type_vector is array (natural range <>) of grspw_in_type;
  type grspw_out_type_vector is array (natural range <>) of grspw_out_type;

  component grspwm is
    generic(
      tech            : integer range 0 to NTECH := DEFFABTECH;
      hindex          : integer range 0 to NAHBMST-1 := 0;
      pindex          : integer range 0 to NAPBSLV-1 := 0;
      paddr           : integer range 0 to 16#FFF#   := 0;
      pmask           : integer range 0 to 16#FFF#   := 16#FFF#;
      pirq            : integer range 0 to NAHBIRQ-1 := 0;
      sysfreq         : integer := 10000;                          -- spw1
      usegen          : integer range 0 to 1  := 1;                -- spw1
      nsync           : integer range 1 to 2  := 1;
      rmap            : integer range 0 to 2  := 0;
      rmapcrc         : integer range 0 to 1  := 0;
      fifosize1       : integer range 4 to 64 := 32;
      fifosize2       : integer range 16 to 64 := 64;
      rxclkbuftype    : integer range 0 to 2 := 0;
      rxunaligned     : integer range 0 to 1 := 0;
      rmapbufs        : integer range 2 to 8 := 4;
      ft              : integer range 0 to 2 := 0;
      scantest        : integer range 0 to 1 := 0;
      techfifo        : integer range 0 to 1 := 1;
      netlist         : integer range 0 to 1 := 0;                 -- spw1
      ports           : integer range 1 to 2 := 1;
      dmachan         : integer range 1 to 4 := 1;                 -- spw2
      memtech         : integer range 0 to NTECH := DEFMEMTECH;
      spwcore         : integer range 1 to 2 := 2;
      input_type      : integer range 0 to 4 := 0;
      output_type     : integer range 0 to 2 := 0;
      rxtx_sameclk    : integer range 0 to 1 := 0;
      nodeaddr        : integer range 0 to 255 := 254;
      destkey         : integer range 0 to 255 := 0;
      interruptdist   : integer range 0 to 32 := 0;  -- spw2
      intscalerbits   : integer range 0 to 31 := 0;  -- spw2
      intisrtimerbits : integer range 0 to 31 := 0;  -- spw2
      intiatimerbits  : integer range 0 to 31 := 0;  -- spw2
      intctimerbits   : integer range 0 to 31 := 0;  -- spw2
      tickinasync     : integer range 0 to 2 := 0;  -- spw2
      pnp             : integer range 0 to 2 := 0;  -- spw2
      pnpvendid       : integer range 0 to 16#FFF# := 0;  -- spw2
      pnpprodid       : integer range 0 to 16#FFF# := 0;  -- spw2
      pnpmajorver     : integer range 0 to 16#FF# := 0;  -- spw2
      pnpminorver     : integer range 0 to 16#FF# := 0;  -- spw2
      pnppatch        : integer range 0 to 16#FF# := 0;  -- spw2
      num_txdesc      : integer range 64 to 512 := 64;  -- spw2
      num_rxdesc      : integer range 128 to 1024 := 128;  -- spw2
      ccsdscrc        : integer range 0 to 1 := 0 -- spw2
    );
    port(
      rst        : in  std_ulogic;
      clk        : in  std_ulogic;
      rxclk0     : in  std_ulogic;
      rxclk1     : in  std_ulogic;
      txclk      : in  std_ulogic;
      txclkn     : in  std_ulogic;
      ahbmi      : in  ahb_mst_in_type;
      ahbmo      : out ahb_mst_out_type;
      apbi       : in  apb_slv_in_type;
      apbo       : out apb_slv_out_type;
      swni       : in  grspw_in_type;
      swno       : out grspw_out_type
    );
  end component;

  component grspw_codec is
  generic(
    ports        : integer range 1 to 2 := 1;
    input_type   : integer range 0 to 4 := 0;
    output_type  : integer range 0 to 2 := 0;
    rxtx_sameclk : integer range 0 to 1 := 0;
    fifosize     : integer range 16 to 2048 := 64;
    tech         : integer;
    scantest     : integer range 0 to 1 := 0;
    techfifo     : integer range 0 to 1 := 0;
    ft           : integer range 0 to 2 := 0;
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
    lii          : in  grspw_codec_in_type;
    lio          : out grspw_codec_out_type;
    testin       : in  std_logic_vector(testin_width-1 downto 0) := testin_none
  );
  end component;

  component grspw_codec_clockgate is
  generic(
    tech         : integer;
    scantest     : integer range 0 to 1 := 0;
    ports        : integer range 1 to 2 := 1;
    output_type  : integer range 0 to 2 := 0;
    clkgate      : integer range 0 to 1 := 0
    );
  port(
    rst           : in  std_ulogic;
    clk           : in  std_ulogic;
    rxclk0        : in  std_ulogic;
    rxclk1        : in  std_ulogic;
    txclk         : in  std_ulogic;
    txclkn        : in  std_ulogic;
    testen        : in  std_ulogic;
    testrst       : in  std_ulogic;
    disableclk    : in  std_ulogic;
    disablerxclk0 : in  std_ulogic;
    disablerxclk1 : in  std_ulogic;
    disabletxclk  : in  std_ulogic;
    disabletxclkn : in  std_ulogic;
    gclk          : out std_ulogic;
    grxclk0       : out std_ulogic;
    grxclk1       : out std_ulogic;
    gtxclk        : out std_ulogic;
    gtxclkn       : out std_ulogic;
    grst          : out std_ulogic
  );
  end component;


  component grspwrouter is
    generic(
      input_type      : integer range 0 to 4 := 0;
      output_type     : integer range 0 to 2 := 0;
      rxtx_sameclk    : integer range 0 to 1 := 0;
      fifosize        : integer range 16 to 2048 := 64;
      tech            : integer;
      scantest        : integer range 0 to 1 := 0;
      techfifo        : integer range 0 to 255 := 0;
      ft              : integer range 0 to 2 := 0;
      spwen           : integer range 0 to 1 := 1;
      ambaen          : integer range 0 to 1 := 0;
      fifoen          : integer range 0 to 1 := 0;
      spwports        : integer range 0 to 31 := 2;
      ambaports       : integer range 0 to 16 := 0;
      fifoports       : integer range 0 to 31 := 0;
      arbitration     : integer range 0 to 1 := 0; --0=rrobin, 1=priority
      rmap            : integer range 0 to 16#FFFF# := 0;
      rmapcrc         : integer range 0 to 16#FFFF# := 0;
      fifosize2       : integer range 4 to 32 := 32;
      almostsize      : integer range 1 to 32 := 8;
      rxunaligned     : integer range 0 to 16#FFFF# := 0;
      rmapbufs        : integer range 2 to 8 := 4;
      dmachan         : integer range 1 to 4 := 1;
      hindex          : integer range 0 to NAHBMST-1 := 0;
      pindex          : integer range 0 to NAPBSLV-1 := 0;
      paddr           : integer range 0 to 16#FFF#   := 0;
      pmask           : integer range 0 to 16#FFF#   := 16#FFF#;
      pirq            : integer range 0 to NAHBIRQ-1 := 0;
      cfghindex       : integer range 0 to NAHBSLV-1 := 0;
      cfghaddr        : integer range 0 to 16#FFF#   := 0;
      cfghmask        : integer range 0 to 16#FFF#   := 16#FF0#;
      ahbslven        : integer range 0 to 1 := 0;
      timerbits       : integer range 0 to 31 := 0;
      pnp             : integer range 0 to 2 := 0;
      autoscrub       : integer range 0 to 1 := 0;
      sim             : integer range 0 to 1 := 0;
      dualport        : integer range 0 to 1 := 0;
      charcntbits     : integer range 0 to 32 := 0;
      pktcntbits      : integer range 0 to 32 := 0;
      prescalermin    : integer := 250;
      spacewired      : integer range 0 to 1 := 0;
      interruptdist   : integer range 0 to 2 := 0;
      apbctrl         : integer range 0 to 1 := 0;
      rmapmaxsize     : integer range 4 to 512 := 4;
      gpolbits        : integer range 0 to 128 := 0;
      gpopbits        : integer range 0 to 128 := 0;
      gpibits         : integer range 0 to 128 := 0;
      customport      : integer range 0 to 1 := 0;
      codecclkgate    : integer range 0 to 1 := 0;
      inputtest       : integer range 0 to 1 := 0;
      spwpnpvendid    : integer range 0 to 16#FFFF# := 0;
      spwpnpprodid    : integer range 0 to 16#FFFF# := 0;
      porttimerbits   : integer range 1 to 32 := 10;
      irqtimerbits    : integer range 1 to 32 := 10;
      auxtimeen       : integer range 0 to 1 := 1;
      num_txdesc      : integer range 64 to 512 := 64;
      num_rxdesc      : integer range 128 to 1024 := 128;
      auxasync        : integer range 0 to 1 := 0;
      hirq            : integer range 0 to NAHBIRQ-1 := 0
      );
    port(
      rst          : in  std_ulogic;
      clk          : in  std_ulogic;
      rxclk        : in  std_logic_vector(spwports*(1+dualport)-spwen downto 0);
      txclk        : in  std_ulogic;
      txclkn       : in  std_ulogic;
      testen       : in  std_ulogic;
      testrst      : in  std_ulogic;
      scanen       : in  std_ulogic;
      testoen      : in  std_ulogic;
      di           : in  std_logic_vector(spwports*(2+2*dualport)-spwen downto 0);
      dvi          : in  std_logic_vector(spwports*(2+2*dualport)-spwen downto 0);
      dconnect     : in  std_logic_vector(spwports*(2+2*dualport)-spwen downto 0);
      do           : out std_logic_vector(spwports*(2+2*dualport)-spwen downto 0);
      so           : out std_logic_vector(spwports*(2+2*dualport)-spwen downto 0);
      ahbmi        : in  spw_ahb_mst_in_vector(0 to ambaports*ambaen-ambaen);
      ahbmo        : out spw_ahb_mst_out_vector(0 to ambaports*ambaen-ambaen);
      apbi         : in  apb_slv_in_type;
      apbo         : out spw_apb_slv_out_vector(0 to ambaports*ambaen-ambaen);
      ahbsi        : in  ahb_slv_in_type;
      ahbso        : out ahb_slv_out_type;
      ri           : in  grspw_router_in_type;
      ro           : out grspw_router_out_type
      );
  end component grspwrouter;

  component grspw2_dma is
    generic(
      hindex        : integer range 0 to NAHBMST-1 := 0;
      pindex        : integer range 0 to NAPBSLV-1:= 0;
      pirq          : integer range 0 to NAHBIRQ-1 := 0;
      paddr         : integer range 0 to 16#FFF# := 0;
      pmask         : integer range 0 to 16#FFF# := 16#FFF#;
      rmap          : integer range 0 to 2  := 0;
      rmapcrc       : integer range 0 to 1  := 0;
      fifosize1     : integer range 4 to 32 := 32;
      fifosize2     : integer range 16 to 2048 := 64;
      rxunaligned   : integer range 0 to 1 := 0;
      rmapbufs      : integer range 2 to 8 := 4;
      scantest      : integer range 0 to 1 := 0;
      dmachan       : integer range 1 to 4 := 1;
      tech          : integer range 0 to NTECH := inferred;
      techfifo      : integer range 0 to 7 := 1;
      ft            : integer range 0 to 2 := 0;
      nodeaddr      : integer range 0 to 255 := 254;
      num_txdesc    : integer range 64 to 512 := 64;
      num_rxdesc    : integer range 128 to 1024 := 128;
      interruptdist : integer range 0 to 2 := 0
    );
    port(
      rst          : in   std_ulogic;
      clk          : in   std_ulogic;
      --ahb mst
      ahbmi        : in   ahb_mst_in_type;
      ahbmo        : out  ahb_mst_out_type;
      --apb
      apbi         : in   apb_slv_in_type;
      apbo	   : out  apb_slv_out_type;
      --link
      lii          : in   grspw_dma_in_type;
      lio          : out  grspw_dma_out_type;
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0';
      testin       : in   std_logic_vector(TESTIN_WIDTH-1 downto 0) := testin_none
    );
  end component;

  component grspw2_fifo is
    generic(
      fifosize     : integer range 16 to 2048 := 64;
      almostsize   : integer range 1 to 32 := 8;
      scantest     : integer range 0 to 1 := 0;
      tech         : integer range 0 to NTECH := inferred;
      techfifo     : integer range 0 to 1 := 1;
      ft           : integer range 0 to 2 := 0
    );
    port(
      rst          : in   std_ulogic;
      clk          : in   std_ulogic;
      --link
      lii          : in   grspw_fifo_in_type;
      lio          : out  grspw_fifo_out_type;
      testrst      : in   std_ulogic := '0';
      testen       : in   std_ulogic := '0';
      testin       : in   std_logic_vector(testin_width-1 downto 0) := testin_none
    );
  end component;

  type grspw_router_fifo_in_type is record
    txwrite      : std_ulogic;
    txchar       : std_logic_vector(8 downto 0);
    rxread       : std_ulogic;
    tickin       : std_ulogic;
    timein       : std_logic_vector(7 downto 0);
    enbridge     : std_ulogic;
    enexttime    : std_ulogic;
  end record;

  type grspw_router_fifo_out_type is record
    rxcharav     : std_ulogic;
    rxaempty     : std_ulogic;
    txfull       : std_ulogic;
    txafull      : std_ulogic;
    rxchar       : std_logic_vector(8 downto 0);
    tickout      : std_ulogic;
    timeout      : std_logic_vector(7 downto 0);
  end record;

  component grspw2_sist is
    generic(
      pindex       : integer range 0 to NAPBSLV-1:= 0;
      pirq         : integer range 0 to NAHBIRQ-1 := 0;
      paddr        : integer range 0 to 16#FFF# := 0;
      pmask        : integer range 0 to 16#FFF# := 16#FFF#);
    port(
      rstn         : in   std_ulogic;
      clk          : in   std_ulogic;
      enable       : in   std_ulogic;
      -- amba apb
      apbi         : in   apb_slv_in_type;
      apbo         : out  apb_slv_out_type;
      -- fifo i/f
      fifoi        : in   grspw_router_fifo_out_type;
      fifoo        : out  grspw_router_fifo_in_type);
  end component;

end package;

