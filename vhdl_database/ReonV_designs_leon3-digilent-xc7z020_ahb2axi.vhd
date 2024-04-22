------------------------------------------------------------------------------
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
-- Entity:      ahb2axi
-- File:        ahb2axi.vhd
-- Author:      Jiri Gaisler
--
--  AHB/AXI bridge for Zynq S_AXI_GP0 AXI3 slave
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;

entity ahb2axi is
  generic(
    hindex     : integer := 0;
    haddr      : integer := 0;
    hmask      : integer := 16#f00#;
    pindex     : integer := 0;
    paddr      : integer := 0;
    pmask      : integer := 16#fff#;
    cidsz      : integer := 6;
    clensz     : integer := 4
  );
  port(
    rstn           : in  std_logic;
    clk            : in  std_logic;
    ahbsi	   : in  ahb_slv_in_type;
    ahbso          : out ahb_slv_out_type;  
    apbi           : in  apb_slv_in_type;
    apbo           : out apb_slv_out_type;
    m_axi_araddr   : out std_logic_vector ( 31 downto 0 );
    m_axi_arburst  : out std_logic_vector ( 1 downto 0 );
    m_axi_arcache  : out std_logic_vector ( 3 downto 0 );
    m_axi_arid     : out std_logic_vector ( cidsz-1 downto 0 );
    m_axi_arlen    : out std_logic_vector ( clensz-1 downto 0 );
    m_axi_arlock   : out std_logic_vector (1 downto 0);
    m_axi_arprot   : out std_logic_vector ( 2 downto 0 );
    m_axi_arqos    : out std_logic_vector ( 3 downto 0 );
    m_axi_arready  : in  std_logic;
    m_axi_arsize   : out std_logic_vector ( 2 downto 0 );
    m_axi_arvalid  : out std_logic;
    m_axi_awaddr   : out std_logic_vector ( 31 downto 0 );
    m_axi_awburst  : out std_logic_vector ( 1 downto 0 );
    m_axi_awcache  : out std_logic_vector ( 3 downto 0 );
    m_axi_awid     : out std_logic_vector ( cidsz-1 downto 0 );
    m_axi_awlen    : out std_logic_vector ( clensz-1 downto 0 );
    m_axi_awlock   : out std_logic_vector (1 downto 0);
    m_axi_awprot   : out std_logic_vector ( 2 downto 0 );
    m_axi_awqos    : out std_logic_vector ( 3 downto 0 );
    m_axi_awready  : in  std_logic;
    m_axi_awsize   : out std_logic_vector ( 2 downto 0 );
    m_axi_awvalid  : out std_logic;
    m_axi_bid      : in  std_logic_vector ( cidsz-1 downto 0 );
    m_axi_bready   : out std_logic;
    m_axi_bresp    : in  std_logic_vector ( 1 downto 0 );
    m_axi_bvalid   : in  std_logic;
    m_axi_rdata    : in  std_logic_vector ( 31 downto 0 );
    m_axi_rid      : in  std_logic_vector ( cidsz-1 downto 0 );
    m_axi_rlast    : in  std_logic;
    m_axi_rready   : out std_logic;
    m_axi_rresp    : in  std_logic_vector ( 1 downto 0 );
    m_axi_rvalid   : in  std_logic;
    m_axi_wdata    : out std_logic_vector ( 31 downto 0 );
    m_axi_wid      : out std_logic_vector ( cidsz-1 downto 0 );
    m_axi_wlast    : out std_logic;
    m_axi_wready   : in  std_logic;
    m_axi_wstrb    : out std_logic_vector ( 3 downto 0 );
    m_axi_wvalid   : out std_logic
   );
end ;

architecture rtl of ahb2axi is 

type bstate_type is (idle, read1, read2, read3, write1, write2, write3);

constant hconfig : ahb_config_type := (
   0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_MIGDDR2, 0, 0, 0),
   4 => ahb_membar(haddr, '1', '1', hmask),
--   5 => ahb_iobar(ioaddr, iomask),
   others => zero32);

constant pconfig : apb_config_type := (
  0 => ahb_device_reg ( VENDOR_GAISLER, GAISLER_MIGDDR2, 0, 0, 0),
  1 => apb_iobar(paddr, pmask));

type reg_type is record 
  bstate 	: bstate_type;
  hready         : std_logic; 
  hsel           : std_logic; 
  hwrite         : std_logic; 
  htrans         : std_logic_vector(1 downto 0); 
  hburst         : std_logic_vector(2 downto 0); 
  hsize          : std_logic_vector(2 downto 0); 
  hwdata         : std_logic_vector(31 downto 0); 
  haddr          : std_logic_vector(31 downto 0); 
  hmaster        : std_logic_vector(3 downto 0); 
  m_axi_arlen    : std_logic_vector (clensz-1 downto 0 );
  m_axi_rdata    : std_logic_vector (31 downto 0 );
  m_axi_arvalid  : std_logic;
  m_axi_awvalid  : std_logic;
  m_axi_rready   : std_logic;
  m_axi_wstrb    : std_logic_vector (3 downto 0 );
  m_axi_bready   : std_logic;
  m_axi_wvalid   : std_logic;
  m_axi_wlast    : std_logic;
  m_axi_bresp    : std_logic_vector (1 downto 0 );
  m_axi_awaddr   : std_logic_vector (31 downto 0 );
end record; 

signal r, rin    : reg_type; 

begin

  comb: process( rstn, r, ahbsi, m_axi_arready, m_axi_rlast, m_axi_rvalid,
	m_axi_awready, m_axi_wready, m_axi_bvalid, m_axi_bresp, m_axi_rdata )
  variable v : reg_type;
  variable hwdata     : std_logic_vector(31 downto 0);
  variable readdata   : std_logic_vector(31 downto 0);
  variable wstrb      : std_logic_vector (3 downto 0 );
  begin
    v := r; 
    if (ahbsi.hready = '1') then
      if (ahbsi.hsel(hindex) and ahbsi.htrans(1)) = '1' then
	v.hsel := '1'; v.hburst := ahbsi.hburst;
        v.hwrite := ahbsi.hwrite; v.hsize := ahbsi.hsize;
        v.hmaster := ahbsi.hmaster;
        v.hready := '0';
	v.haddr := ahbsi.haddr;
	if ahbsi.htrans = "10" then 
	  if v.hburst = "000" then v.m_axi_arlen := (others => '0');
          else 
	    v.m_axi_arlen := (others => '0');
            v.m_axi_arlen(2 downto 0) :=  not ahbsi.haddr(4 downto 2);
          end if;
	end if;
      else
	v.hsel := '0'; v.hready := '1';
      end if;
      v.htrans := ahbsi.htrans;
    end if;

    case r.hsize(1 downto 0) is
    when "00" => wstrb := decode(not r.haddr(1 downto 0));
    when "01" => 
      if r.haddr(1) = '1' then wstrb := "0011"; else  wstrb := "1100"; end if;
    when others => wstrb := "1111";
    end case;

    case r.bstate is
    when idle =>
      if v.hsel = '1' then 
	if v.hwrite = '1' then v.bstate := write3; v.hready := '1';
        else v.bstate := read1; v.m_axi_arvalid := '1';end if;
      end if;
    when read1 =>
      if m_axi_arready = '1' then
	 v.m_axi_arvalid := '0'; v.bstate := read2; v.m_axi_rready := '1';
      end if;
    when read2 =>
      v.hready := '0';
      if m_axi_rvalid = '1' then
	v.m_axi_rdata := m_axi_rdata; v.hready := '1';
      end if;
      if (r.hready = '1') and (ahbsi.htrans /= "11") then
	v.bstate := read3; 
        if v.hsel = '1' then v.hready := '0'; end if;
      end if;
      if (m_axi_rlast = '1') and (m_axi_rvalid = '1') then
	v.bstate := idle; v.m_axi_rready := '0';
      end if;
    when read3 =>
      if (m_axi_rlast = '1') and (m_axi_rvalid = '1') then
	v.bstate := idle; v.m_axi_rready := '0';
      end if;
    when write1 =>
      if m_axi_awready = '1' then
	 v.m_axi_awvalid := '0'; v.bstate := write2; v.m_axi_wvalid := '1';
	 v.m_axi_wlast := '1';
      end if;
    when write2 =>
      if m_axi_wready = '1' then
        v.m_axi_wlast := '0'; v.bstate := idle;
	v.m_axi_wvalid := '0'; v.m_axi_wlast := '0';
      end if;
    when write3 =>
      v.m_axi_awvalid := '1'; 
      v.m_axi_awaddr := "0001" & r.haddr(27 downto 2) & "00";
      v.m_axi_wstrb := wstrb; v.hwdata := ahbsi.hwdata;
       v.bstate := write1;
    end case;

    if (m_axi_bvalid = '1') and (r.m_axi_bresp = "00") then v.m_axi_bresp := m_axi_bresp; end if;
    readdata := (others => '0');
    readdata(1 downto 0) := r.m_axi_bresp;

    if rstn = '0' then
      v.bstate := idle; v.hready := '1';
      v.m_axi_arvalid := '0'; v.m_axi_rready := '0';
      v.m_axi_rready  := '0'; v.m_axi_wstrb := (others => '0');
      v.m_axi_bready  := '0'; v.m_axi_wvalid  := '0'; v.m_axi_wlast   := '0';
      v.m_axi_bresp := "00"; v.m_axi_awvalid := '0';
    end if;

    rin <= v;
    apbo.prdata <= readdata;

  end process;

  m_axi_araddr   <= "0001" & r.haddr(27 downto 2) & "00";
  m_axi_arburst  <= "01";
  m_axi_arcache  <= "0011";
  m_axi_arid     <= (others => '0');
  m_axi_arlen    <= r.m_axi_arlen;
  m_axi_arlock   <= (others => '0');
  m_axi_arprot   <= "001";
  m_axi_arsize   <= "010";
  m_axi_arvalid  <= r.m_axi_arvalid;
  m_axi_rready   <= r.m_axi_rready;
  m_axi_arqos    <= (others => '0'); 
  m_axi_awaddr   <= r.m_axi_awaddr;
  m_axi_awburst  <= "01";
  m_axi_awcache  <= "0011";
  m_axi_awid     <= (others => '0');
  m_axi_awlen    <= (others => '0');
  m_axi_awlock   <= (others => '0');
  m_axi_awprot   <= "001";
  m_axi_awsize   <= "010";
  m_axi_awvalid  <= r.m_axi_awvalid;
  m_axi_awqos    <= (others => '0'); 

  m_axi_rready   <= r.m_axi_rready;
  m_axi_wstrb    <= r.m_axi_wstrb;
  m_axi_bready   <= '1';
  m_axi_wvalid   <= r.m_axi_wvalid;
  m_axi_wlast    <= r.m_axi_wlast;
  m_axi_wdata    <= r.hwdata;
  m_axi_wid      <= (others => '0');

  ahbso.hready  <= r.hready;
  ahbso.hresp   <= "00"; --r.hresp;
  ahbso.hrdata  <= r.m_axi_rdata;

  ahbso.hconfig <= hconfig;
  ahbso.hirq    <= (others => '0');
  ahbso.hindex  <= hindex;
  ahbso.hsplit  <= (others => '0');

  apbo.pindex <= pindex;
  apbo.pconfig <= pconfig;
  apbo.pirq <= (others => '0');

  regs : process(clk)
  begin
    if rising_edge(clk) then 
      r <= rin;
    end if;
  end process;   

end;

