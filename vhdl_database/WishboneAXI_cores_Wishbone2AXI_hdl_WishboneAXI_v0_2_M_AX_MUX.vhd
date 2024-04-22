library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axi_helpers_pkg.all;

entity WishboneAXI_v0_2_M_AX_MUX is
  generic (
    -- Users to add parameters here
    C_MASTER_MODE : string := "AXI4LITE"; --AXI4, AXI4LITE

    -- Parameters of Axi Master Bus Interface M_AXI4_LITE
    C_M_AXI4_LITE_START_DATA_VALUE       : std_logic_vector := x"AA000000";
    C_M_AXI4_LITE_TARGET_SLAVE_BASE_ADDR : std_logic_vector := x"40000000";
    C_M_AXI4_LITE_ADDR_WIDTH             : integer          := 32;
    C_M_AXI4_LITE_DATA_WIDTH             : integer          := 32;
    C_M_AXI4_LITE_TRANSACTIONS_NUM       : integer          := 4;

    -- Parameters of Axi Master Bus Interface M_AXI4
    C_M_AXI4_TARGET_SLAVE_BASE_ADDR : std_logic_vector := x"40000000";
    C_M_AXI4_BURST_LEN              : integer          := 16;
    C_M_AXI4_ID_WIDTH               : integer          := 1;
    C_M_AXI4_ADDR_WIDTH             : integer          := 32;
    C_M_AXI4_DATA_WIDTH             : integer          := 32;
    C_M_AXI4_AWUSER_WIDTH           : integer          := 0;
    C_M_AXI4_ARUSER_WIDTH           : integer          := 0;
    C_M_AXI4_WUSER_WIDTH            : integer          := 0;
    C_M_AXI4_RUSER_WIDTH            : integer          := 0;
    C_M_AXI4_BUSER_WIDTH            : integer          := 0
    );
  port (
    s_axi4_m2s : in  t_axi4_m2s;
    s_axi4_s2m : out t_axi4_s2m;
	

    -- Ports of Axi Master Bus Interface M_AXI4_LITE
    m_axi4_lite_aclk    : in  std_logic;
    m_axi4_lite_aresetn : in  std_logic;
    m_axi4_lite_awaddr  : out std_logic_vector(C_M_AXI4_LITE_ADDR_WIDTH-1 downto 0);
    m_axi4_lite_awprot  : out std_logic_vector(2 downto 0);
    m_axi4_lite_awvalid : out std_logic;
    m_axi4_lite_awready : in  std_logic;
    m_axi4_lite_wdata   : out std_logic_vector(C_M_AXI4_LITE_DATA_WIDTH-1 downto 0);
    m_axi4_lite_wstrb   : out std_logic_vector(C_M_AXI4_LITE_DATA_WIDTH/8-1 downto 0);
    m_axi4_lite_wvalid  : out std_logic;
    m_axi4_lite_wready  : in  std_logic;
    m_axi4_lite_bresp   : in  std_logic_vector(1 downto 0);
    m_axi4_lite_bvalid  : in  std_logic;
    m_axi4_lite_bready  : out std_logic;
    m_axi4_lite_araddr  : out std_logic_vector(C_M_AXI4_LITE_ADDR_WIDTH-1 downto 0);
    m_axi4_lite_arprot  : out std_logic_vector(2 downto 0);
    m_axi4_lite_arvalid : out std_logic;
    m_axi4_lite_arready : in  std_logic;
    m_axi4_lite_rdata   : in  std_logic_vector(C_M_AXI4_LITE_DATA_WIDTH-1 downto 0);
    m_axi4_lite_rresp   : in  std_logic_vector(1 downto 0);
    m_axi4_lite_rvalid  : in  std_logic;
    m_axi4_lite_rready  : out std_logic;

    -- Ports of Axi Master Bus Interface M_AXI4
    m_axi4_aclk    : in  std_logic;
    m_axi4_aresetn : in  std_logic;
    m_axi4_awid    : out std_logic_vector(C_M_AXI4_ID_WIDTH-1 downto 0);
    m_axi4_awaddr  : out std_logic_vector(C_M_AXI4_ADDR_WIDTH-1 downto 0);
    m_axi4_awlen   : out std_logic_vector(7 downto 0);
    m_axi4_awsize  : out std_logic_vector(2 downto 0);
    m_axi4_awburst : out std_logic_vector(1 downto 0);
    m_axi4_awlock  : out std_logic;
    m_axi4_awcache : out std_logic_vector(3 downto 0);
    m_axi4_awprot  : out std_logic_vector(2 downto 0);
    m_axi4_awqos   : out std_logic_vector(3 downto 0);
    m_axi4_awuser  : out std_logic_vector(C_M_AXI4_AWUSER_WIDTH-1 downto 0);
    m_axi4_awvalid : out std_logic;
    m_axi4_awready : in  std_logic;
    m_axi4_wdata   : out std_logic_vector(C_M_AXI4_DATA_WIDTH-1 downto 0);
    m_axi4_wstrb   : out std_logic_vector(C_M_AXI4_DATA_WIDTH/8-1 downto 0);
    m_axi4_wlast   : out std_logic;
    m_axi4_wuser   : out std_logic_vector(C_M_AXI4_WUSER_WIDTH-1 downto 0);
    m_axi4_wvalid  : out std_logic;
    m_axi4_wready  : in  std_logic;
    m_axi4_bid     : in  std_logic_vector(C_M_AXI4_ID_WIDTH-1 downto 0);
    m_axi4_bresp   : in  std_logic_vector(1 downto 0);
    m_axi4_buser   : in  std_logic_vector(C_M_AXI4_BUSER_WIDTH-1 downto 0);
    m_axi4_bvalid  : in  std_logic;
    m_axi4_bready  : out std_logic;
    m_axi4_arid    : out std_logic_vector(C_M_AXI4_ID_WIDTH-1 downto 0);
    m_axi4_araddr  : out std_logic_vector(C_M_AXI4_ADDR_WIDTH-1 downto 0);
    m_axi4_arlen   : out std_logic_vector(7 downto 0);
    m_axi4_arsize  : out std_logic_vector(2 downto 0);
    m_axi4_arburst : out std_logic_vector(1 downto 0);
    m_axi4_arlock  : out std_logic;
    m_axi4_arcache : out std_logic_vector(3 downto 0);
    m_axi4_arprot  : out std_logic_vector(2 downto 0);
    m_axi4_arqos   : out std_logic_vector(3 downto 0);
    m_axi4_aruser  : out std_logic_vector(C_M_AXI4_ARUSER_WIDTH-1 downto 0);
    m_axi4_arvalid : out std_logic;
    m_axi4_arready : in  std_logic;
    m_axi4_rid     : in  std_logic_vector(C_M_AXI4_ID_WIDTH-1 downto 0);
    m_axi4_rdata   : in  std_logic_vector(C_M_AXI4_DATA_WIDTH-1 downto 0);
    m_axi4_rresp   : in  std_logic_vector(1 downto 0);
    m_axi4_rlast   : in  std_logic;
    m_axi4_ruser   : in  std_logic_vector(C_M_AXI4_RUSER_WIDTH-1 downto 0);
    m_axi4_rvalid  : in  std_logic;
    m_axi4_rready  : out std_logic
    );
end WishboneAXI_v0_2_M_AX_MUX;

architecture arch_imp of WishboneAXI_v0_2_M_AX_MUX is

begin

GEN_AXI4LITE: if C_MASTER_MODE = "AXI4LITE" generate

    -- Ports of Axi Master Bus Interface M_AXI4
    m_axi4_lite_awaddr(C_M_AXI4_LITE_ADDR_WIDTH-1 downto 0) <= s_axi4_m2s.awaddr(C_M_AXI4_LITE_ADDR_WIDTH-1 downto 0);
    m_axi4_lite_awprot   <= s_axi4_m2s.awprot;
    m_axi4_lite_awvalid  <= s_axi4_m2s.awvalid;
    m_axi4_lite_wdata(C_M_AXI4_LITE_DATA_WIDTH-1 downto 0) <= s_axi4_m2s.wdata(C_M_AXI4_LITE_DATA_WIDTH-1 downto 0);
    m_axi4_lite_wstrb(C_M_AXI4_LITE_DATA_WIDTH/8-1 downto 0) <= s_axi4_m2s.wstrb(C_M_AXI4_LITE_DATA_WIDTH/8-1 downto 0);
    m_axi4_lite_wvalid   <= s_axi4_m2s.wvalid;
    m_axi4_lite_bready   <= s_axi4_m2s.bready;
    m_axi4_lite_araddr(C_M_AXI4_LITE_ADDR_WIDTH-1 downto 0) <= s_axi4_m2s.araddr(C_M_AXI4_LITE_ADDR_WIDTH-1 downto 0);
    m_axi4_lite_arprot   <= s_axi4_m2s.arprot;
    m_axi4_lite_arvalid  <= s_axi4_m2s.arvalid;
    m_axi4_lite_rready   <= s_axi4_m2s.rready;

    s_axi4_s2m.awready <= m_axi4_lite_awready;
    s_axi4_s2m.wready  <= m_axi4_lite_wready;
    s_axi4_s2m.bid     <= (others => '0');
    s_axi4_s2m.bresp   <= m_axi4_lite_bresp;
    --s_wb_s2m.buser <= m_axi4_buser   : in  std_logic_vector(C_M_AXI4_BUSER_WIDTH-1 downto 0);
    s_axi4_s2m.bvalid  <= m_axi4_lite_bvalid;
    s_axi4_s2m.arready <= m_axi4_lite_arready;
    s_axi4_s2m.rid     <= (others => '0');
    s_axi4_s2m.rdata(C_M_AXI4_LITE_DATA_WIDTH-1 downto 0) <= m_axi4_lite_rdata(C_M_AXI4_LITE_DATA_WIDTH-1 downto 0);
    s_axi4_s2m.rdata(s_axi4_s2m.rdata'left downto C_M_AXI4_LITE_DATA_WIDTH) <= (others => '0');
    s_axi4_s2m.rresp   <= m_axi4_lite_rresp;
    s_axi4_s2m.rlast   <= '1';
    --s_wb_s2m.ruser <= m_axi4_lite_ruser   : in  std_logic_vector(C_M_AXI4_RUSER_WIDTH-1 downto 0);
    s_axi4_s2m.rvalid  <= m_axi4_lite_rvalid;	
	

end generate;

GEN_AXI4: if C_MASTER_MODE = "AXI4" generate

    -- Ports of Axi Master Bus Interface M_AXI4
    m_axi4_awid(C_M_AXI4_ID_WIDTH-1 downto 0) <= s_axi4_m2s.awid(C_M_AXI4_ID_WIDTH-1 downto 0);
    m_axi4_awaddr(C_M_AXI4_ADDR_WIDTH-1 downto 0) <= s_axi4_m2s.awaddr(C_M_AXI4_ADDR_WIDTH-1 downto 0);
    m_axi4_awlen    <= s_axi4_m2s.awlen;
    m_axi4_awsize   <= s_axi4_m2s.awsize;
    m_axi4_awburst  <= s_axi4_m2s.awburst;
    m_axi4_awlock   <= s_axi4_m2s.awlock;
    m_axi4_awcache  <= s_axi4_m2s.awcache;
    m_axi4_awprot   <= s_axi4_m2s.awprot;
    m_axi4_awqos    <= s_axi4_m2s.awqos;
    m_axi4_awuser(C_M_AXI4_AWUSER_WIDTH-1 downto 0) <= (others => '0');
    m_axi4_awvalid  <= s_axi4_m2s.awvalid;
    m_axi4_wdata(C_M_AXI4_DATA_WIDTH-1 downto 0) <= s_axi4_m2s.wdata(C_M_AXI4_DATA_WIDTH-1 downto 0);
    m_axi4_wstrb(C_M_AXI4_DATA_WIDTH/8-1 downto 0) <= s_axi4_m2s.wstrb(C_M_AXI4_DATA_WIDTH/8-1 downto 0);
    m_axi4_wlast    <= s_axi4_m2s.wlast;
    m_axi4_wuser(C_M_AXI4_WUSER_WIDTH-1 downto 0) <= (others => '0');
    m_axi4_wvalid   <= s_axi4_m2s.wvalid;
    m_axi4_bready   <= s_axi4_m2s.bready;
    m_axi4_arid(C_M_AXI4_ID_WIDTH-1 downto 0) <= s_axi4_m2s.arid(C_M_AXI4_ID_WIDTH-1 downto 0);
    m_axi4_araddr(C_M_AXI4_ADDR_WIDTH-1 downto 0) <= s_axi4_m2s.araddr(C_M_AXI4_ADDR_WIDTH-1 downto 0);
    m_axi4_arlen    <= s_axi4_m2s.arlen;
    m_axi4_arsize   <= s_axi4_m2s.arsize;
    m_axi4_arburst  <= s_axi4_m2s.arburst;
    m_axi4_arlock   <= s_axi4_m2s.arlock;
    m_axi4_arcache  <= s_axi4_m2s.arcache;
    m_axi4_arprot   <= s_axi4_m2s.arprot;
    m_axi4_arqos    <= s_axi4_m2s.arqos;
    m_axi4_aruser(C_M_AXI4_ARUSER_WIDTH-1 downto 0) <= (others => '0');
    m_axi4_arvalid  <= s_axi4_m2s.arvalid;
    m_axi4_rready   <= s_axi4_m2s.rready;

    s_axi4_s2m.awready <= m_axi4_awready;
    s_axi4_s2m.wready <= m_axi4_wready;
    s_axi4_s2m.bid(C_M_AXI4_ID_WIDTH-1 downto 0) <= m_axi4_bid(C_M_AXI4_ID_WIDTH-1 downto 0);
	s_axi4_s2m.bid(s_axi4_s2m.bid'left downto C_M_AXI4_ID_WIDTH) <= (others => '0');
    s_axi4_s2m.bresp <= m_axi4_bresp;
    --s_axi4_s2m.buser <= m_axi4_buser   : in  std_logic_vector(C_M_AXI4_BUSER_WIDTH-1 downto 0);
    s_axi4_s2m.bvalid <= m_axi4_bvalid;
    s_axi4_s2m.arready <= m_axi4_arready;
    s_axi4_s2m.rid(C_M_AXI4_ID_WIDTH-1 downto 0) <= m_axi4_rid(C_M_AXI4_ID_WIDTH-1 downto 0);
    s_axi4_s2m.rid(s_axi4_s2m.rid'left downto C_M_AXI4_ID_WIDTH) <= (others => '0');
    s_axi4_s2m.rdata(C_M_AXI4_DATA_WIDTH-1 downto 0) <= m_axi4_rdata(C_M_AXI4_DATA_WIDTH-1 downto 0);
    s_axi4_s2m.rdata(s_axi4_s2m.rdata'left downto C_M_AXI4_DATA_WIDTH) <= (others => '0');
    s_axi4_s2m.rresp <= m_axi4_rresp;
    s_axi4_s2m.rlast <= m_axi4_rlast;
    --s_axi4_s2m.ruser <= m_axi4_ruser   : in  std_logic_vector(C_M_AXI4_RUSER_WIDTH-1 downto 0);
    s_axi4_s2m.rvalid <= m_axi4_rvalid;


end generate;
  
end arch_imp;
