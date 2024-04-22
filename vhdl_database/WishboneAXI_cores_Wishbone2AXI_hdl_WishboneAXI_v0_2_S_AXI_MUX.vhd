library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axi_helpers_pkg.all;


entity WishboneAXI_v0_2_S_AXI_MUX is
  generic (
    -- Users to add parameters here
    C_SLAVE_MODE  : string := "AXI4LITE"; -- AXI4, AXI4LITE

    -- Do not modify the parameters beyond this line

    -- Parameters of Axi Slave Bus Interface S_AXI4_LITE
    C_S_AXI4_LITE_DATA_WIDTH : integer := 32;
    C_S_AXI4_LITE_ADDR_WIDTH : integer := 4;

    -- Parameters of Axi Slave Bus Interface S_AXI4
    C_S_AXI4_ID_WIDTH     : integer := 1;
    C_S_AXI4_DATA_WIDTH   : integer := 32;
    C_S_AXI4_ADDR_WIDTH   : integer := 6;
    C_S_AXI4_AWUSER_WIDTH : integer := 0;
    C_S_AXI4_ARUSER_WIDTH : integer := 0;
    C_S_AXI4_WUSER_WIDTH  : integer := 0;
    C_S_AXI4_RUSER_WIDTH  : integer := 0;
    C_S_AXI4_BUSER_WIDTH  : integer := 0

    );
  port (
    -- Do not modify the ports beyond this line


    -- Ports of Axi Slave Bus Interface S_AXI4_LITE
    s_axi4_lite_aclk    : in  std_logic;
    s_axi4_lite_aresetn : in  std_logic;
    s_axi4_lite_awaddr  : in  std_logic_vector(C_S_AXI4_LITE_ADDR_WIDTH-1 downto 0);
    s_axi4_lite_awprot  : in  std_logic_vector(2 downto 0);
    s_axi4_lite_awvalid : in  std_logic;
    s_axi4_lite_awready : out std_logic;
    s_axi4_lite_wdata   : in  std_logic_vector(C_S_AXI4_LITE_DATA_WIDTH-1 downto 0);
    s_axi4_lite_wstrb   : in  std_logic_vector((C_S_AXI4_LITE_DATA_WIDTH/8)-1 downto 0);
    s_axi4_lite_wvalid  : in  std_logic;
    s_axi4_lite_wready  : out std_logic;
    s_axi4_lite_bresp   : out std_logic_vector(1 downto 0);
    s_axi4_lite_bvalid  : out std_logic;
    s_axi4_lite_bready  : in  std_logic;
    s_axi4_lite_araddr  : in  std_logic_vector(C_S_AXI4_LITE_ADDR_WIDTH-1 downto 0);
    s_axi4_lite_arprot  : in  std_logic_vector(2 downto 0);
    s_axi4_lite_arvalid : in  std_logic;
    s_axi4_lite_arready : out std_logic;
    s_axi4_lite_rdata   : out std_logic_vector(C_S_AXI4_LITE_DATA_WIDTH-1 downto 0);
    s_axi4_lite_rresp   : out std_logic_vector(1 downto 0);
    s_axi4_lite_rvalid  : out std_logic;
    s_axi4_lite_rready  : in  std_logic;

    -- Ports of Axi Slave Bus Interface S_AXI4
    s_axi4_aclk     : in  std_logic;
    s_axi4_aresetn  : in  std_logic;
    s_axi4_awid     : in  std_logic_vector(C_S_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_awaddr   : in  std_logic_vector(C_S_AXI4_ADDR_WIDTH-1 downto 0);
    s_axi4_awlen    : in  std_logic_vector(7 downto 0);
    s_axi4_awsize   : in  std_logic_vector(2 downto 0);
    s_axi4_awburst  : in  std_logic_vector(1 downto 0);
    s_axi4_awlock   : in  std_logic;
    s_axi4_awcache  : in  std_logic_vector(3 downto 0);
    s_axi4_awprot   : in  std_logic_vector(2 downto 0);
    s_axi4_awqos    : in  std_logic_vector(3 downto 0);
    s_axi4_awregion : in  std_logic_vector(3 downto 0);
    s_axi4_awuser   : in  std_logic_vector(C_S_AXI4_AWUSER_WIDTH-1 downto 0);
    s_axi4_awvalid  : in  std_logic;
    s_axi4_awready  : out std_logic;
    s_axi4_wdata    : in  std_logic_vector(C_S_AXI4_DATA_WIDTH-1 downto 0);
    s_axi4_wstrb    : in  std_logic_vector((C_S_AXI4_DATA_WIDTH/8)-1 downto 0);
    s_axi4_wlast    : in  std_logic;
    s_axi4_wuser    : in  std_logic_vector(C_S_AXI4_WUSER_WIDTH-1 downto 0);
    s_axi4_wvalid   : in  std_logic;
    s_axi4_wready   : out std_logic;
    s_axi4_bid      : out std_logic_vector(C_S_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_bresp    : out std_logic_vector(1 downto 0);
    s_axi4_buser    : out std_logic_vector(C_S_AXI4_BUSER_WIDTH-1 downto 0);
    s_axi4_bvalid   : out std_logic;
    s_axi4_bready   : in  std_logic;
    s_axi4_arid     : in  std_logic_vector(C_S_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_araddr   : in  std_logic_vector(C_S_AXI4_ADDR_WIDTH-1 downto 0);
    s_axi4_arlen    : in  std_logic_vector(7 downto 0);
    s_axi4_arsize   : in  std_logic_vector(2 downto 0);
    s_axi4_arburst  : in  std_logic_vector(1 downto 0);
    s_axi4_arlock   : in  std_logic;
    s_axi4_arcache  : in  std_logic_vector(3 downto 0);
    s_axi4_arprot   : in  std_logic_vector(2 downto 0);
    s_axi4_arqos    : in  std_logic_vector(3 downto 0);
    s_axi4_arregion : in  std_logic_vector(3 downto 0);
    s_axi4_aruser   : in  std_logic_vector(C_S_AXI4_ARUSER_WIDTH-1 downto 0);
    s_axi4_arvalid  : in  std_logic;
    s_axi4_arready  : out std_logic;
    s_axi4_rid      : out std_logic_vector(C_S_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_rdata    : out std_logic_vector(C_S_AXI4_DATA_WIDTH-1 downto 0);
    s_axi4_rresp    : out std_logic_vector(1 downto 0);
    s_axi4_rlast    : out std_logic;
    s_axi4_ruser    : out std_logic_vector(C_S_AXI4_RUSER_WIDTH-1 downto 0);
    s_axi4_rvalid   : out std_logic;
    s_axi4_rready   : in  std_logic;

	m_axi_s2m : in t_axi4_s2m;
    m_axi_m2s : out t_axi4_m2s
    );
end WishboneAXI_v0_2_S_AXI_MUX;

architecture arch_imp of WishboneAXI_v0_2_S_AXI_MUX is

begin


GEN_AXI4LITE: if C_SLAVE_MODE = "AXI4LITE" generate

   m_axi_m2s.awaddr(C_S_AXI4_LITE_ADDR_WIDTH-1 downto 0) <= s_axi4_lite_awaddr(C_S_AXI4_LITE_ADDR_WIDTH-1 downto 0);
   m_axi_m2s.awaddr(m_axi_m2s.awaddr'left downto C_S_AXI4_LITE_ADDR_WIDTH) <= (others => '0');
   m_axi_m2s.awprot <= s_axi4_lite_awprot;
   m_axi_m2s.awvalid <= s_axi4_lite_awvalid;
   m_axi_m2s.wdata(C_S_AXI4_LITE_DATA_WIDTH-1 downto 0) <= s_axi4_lite_wdata(C_S_AXI4_LITE_DATA_WIDTH-1 downto 0);
   m_axi_m2s.wdata(m_axi_m2s.wdata'left downto C_S_AXI4_LITE_DATA_WIDTH) <= (others => '0');
   m_axi_m2s.wstrb((C_S_AXI4_LITE_DATA_WIDTH/8)-1 downto 0) <= s_axi4_lite_wstrb((C_S_AXI4_LITE_DATA_WIDTH/8)-1 downto 0);
   m_axi_m2s.wstrb(m_axi_m2s.wstrb'left downto (C_S_AXI4_LITE_DATA_WIDTH/8)) <= (others => '0');
   m_axi_m2s.wvalid <= s_axi4_lite_wvalid;
   m_axi_m2s.bready <= s_axi4_lite_bready;
   m_axi_m2s.araddr(C_S_AXI4_LITE_ADDR_WIDTH-1 downto 0) <= s_axi4_lite_araddr(C_S_AXI4_LITE_ADDR_WIDTH-1 downto 0);
   m_axi_m2s.araddr(m_axi_m2s.araddr'left downto C_S_AXI4_LITE_ADDR_WIDTH) <= (others => '0');
   m_axi_m2s.arprot <= s_axi4_lite_arprot;
   m_axi_m2s.arvalid <= s_axi4_lite_arvalid;
   m_axi_m2s.rready <= s_axi4_lite_rready;

   s_axi4_lite_awready <= m_axi_s2m.awready;
   s_axi4_lite_wready  <= m_axi_s2m.wready;
   s_axi4_lite_bresp   <= m_axi_s2m.bresp;
   s_axi4_lite_bvalid  <= m_axi_s2m.bvalid;
   s_axi4_lite_arready <= m_axi_s2m.arready;
   s_axi4_lite_rdata(C_S_AXI4_LITE_DATA_WIDTH-1 downto 0) <= m_axi_s2m.rdata(C_S_AXI4_LITE_DATA_WIDTH-1 downto 0);
   s_axi4_lite_rresp   <= m_axi_s2m.rresp;
   s_axi4_lite_rvalid  <= m_axi_s2m.rvalid;
   

end generate;

GEN_AXI4: if C_SLAVE_MODE = "AXI4" generate


    -- Ports of Axi Slave Bus Interface S_AXI4
    m_axi_m2s.awid(C_S_AXI4_ID_WIDTH-1 downto 0) <= s_axi4_awid(C_S_AXI4_ID_WIDTH-1 downto 0);
    m_axi_m2s.awid(m_axi_m2s.awid'left downto C_S_AXI4_ID_WIDTH) <= (others => '0');
    m_axi_m2s.awaddr(C_S_AXI4_ADDR_WIDTH-1 downto 0) <= s_axi4_awaddr(C_S_AXI4_ADDR_WIDTH-1 downto 0);
    m_axi_m2s.awaddr(m_axi_m2s.awaddr'left downto C_S_AXI4_ADDR_WIDTH) <= (others => '0');
    m_axi_m2s.awlen <= s_axi4_awlen;
    m_axi_m2s.awsize <= s_axi4_awsize;
    m_axi_m2s.awburst <= s_axi4_awburst;
    m_axi_m2s.awlock <= s_axi4_awlock;
    m_axi_m2s.awcache <= s_axi4_awcache;
    m_axi_m2s.awprot <= s_axi4_awprot;
    m_axi_m2s.awqos <= s_axi4_awqos;
    m_axi_m2s.awregion <= s_axi4_awregion;
    --m_axi_m2s.awuser <= s_axi4_awuser(C_S_AXI4_AWUSER_WIDTH-1 downto 0);
    m_axi_m2s.awvalid <= s_axi4_awvalid;
    m_axi_m2s.wdata(C_S_AXI4_DATA_WIDTH-1 downto 0) <= s_axi4_wdata(C_S_AXI4_DATA_WIDTH-1 downto 0);
    m_axi_m2s.wdata(m_axi_m2s.wdata'left downto C_S_AXI4_DATA_WIDTH) <= (others => '0');
    m_axi_m2s.wstrb((C_S_AXI4_DATA_WIDTH/8)-1 downto 0) <= s_axi4_wstrb((C_S_AXI4_DATA_WIDTH/8)-1 downto 0);
    m_axi_m2s.wstrb(m_axi_m2s.wstrb'left downto (C_S_AXI4_DATA_WIDTH/8)) <= (others => '0');
    m_axi_m2s.wlast <= s_axi4_wlast;
    --m_axi_m2s.wuser <= s_axi4_wuser(C_S_AXI4_WUSER_WIDTH-1 downto 0);
    m_axi_m2s.wvalid <= s_axi4_wvalid;
    m_axi_m2s.bready <= s_axi4_bready;
    m_axi_m2s.arid(C_S_AXI4_ID_WIDTH-1 downto 0) <= s_axi4_arid(C_S_AXI4_ID_WIDTH-1 downto 0);
    m_axi_m2s.arid(m_axi_m2s.arid'left downto C_S_AXI4_ID_WIDTH) <= (others => '0');
    m_axi_m2s.araddr(C_S_AXI4_ADDR_WIDTH-1 downto 0) <= s_axi4_araddr(C_S_AXI4_ADDR_WIDTH-1 downto 0);
    m_axi_m2s.araddr(m_axi_m2s.araddr'left downto C_S_AXI4_ADDR_WIDTH) <= (others => '0');
    m_axi_m2s.arlen <= s_axi4_arlen;
    m_axi_m2s.arsize <= s_axi4_arsize;
    m_axi_m2s.arburst <= s_axi4_arburst;
    m_axi_m2s.arlock <= s_axi4_arlock;
    m_axi_m2s.arcache <= s_axi4_arcache;
    m_axi_m2s.arprot <= s_axi4_arprot;
    m_axi_m2s.arqos <= s_axi4_arqos;
    m_axi_m2s.arregion <= s_axi4_arregion;
    --m_axi_m2s.aruser(C_S_AXI4_ARUSER_WIDTH-1 downto 0) <= s_axi4_aruser(C_S_AXI4_ARUSER_WIDTH-1 downto 0);
    m_axi_m2s.arvalid <= s_axi4_arvalid;
    m_axi_m2s.rready <= s_axi4_rready;

    s_axi4_awready <= m_axi_s2m.awready;
    s_axi4_wready  <= m_axi_s2m.wready;
    s_axi4_bid(C_S_AXI4_ID_WIDTH-1 downto 0)  <= m_axi_s2m.bid(C_S_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_bresp   <= m_axi_s2m.bresp;
    s_axi4_buser (C_S_AXI4_BUSER_WIDTH-1 downto 0)  <= (others => '0');
    s_axi4_bvalid  <= m_axi_s2m.bvalid;
    s_axi4_arready <= m_axi_s2m.arready;
    s_axi4_rid(C_S_AXI4_ID_WIDTH-1 downto 0)  <= m_axi_s2m.rid(C_S_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_rdata(C_S_AXI4_DATA_WIDTH-1 downto 0)  <= m_axi_s2m.rdata(C_S_AXI4_DATA_WIDTH-1 downto 0);
    s_axi4_rresp   <= m_axi_s2m.rresp;
    s_axi4_rlast   <= m_axi_s2m.rlast;
	s_axi4_ruser(C_S_AXI4_RUSER_WIDTH-1 downto 0) <= (others => '0');
    s_axi4_rvalid  <= m_axi_s2m.rvalid;

end generate;



  -- User logic ends

end arch_imp;
