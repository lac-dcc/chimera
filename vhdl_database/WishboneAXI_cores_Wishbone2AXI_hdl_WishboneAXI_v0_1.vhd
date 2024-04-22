library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WishboneAXI_v0_1 is
  generic (
    -- Users to add parameters here
    C_MASTER_MODE : string := "AXI4LITE"; --AXI4, AXI4LITE
    C_SLAVE_MODE  : string := "CLASSIC"; --CLASSIC, PIPELINED

    C_S_WB_ADR_WIDTH : integer := 32;
    C_S_WB_DAT_WIDTH : integer := 32;
	C_S_WB_ADR_GRANULARITY : string := "BYTE"; -- BYTE, WORD

    C_M_WB_ADR_WIDTH : integer := 32;
    C_M_WB_DAT_WIDTH : integer := 32;
	C_M_WB_ADR_GRANULARITY : string := "BYTE"; -- BYTE, WORD
    -- User parameters ends
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
    C_S_AXI4_BUSER_WIDTH  : integer := 0;

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
    -- Users to add ports here
    s_wb_aclk   : in  std_logic;
    s_wb_areset : in  std_logic;
    s_wb_adr    : in  std_logic_vector(C_S_WB_ADR_WIDTH-1 downto 0);
    s_wb_dat_w  : in  std_logic_vector(C_S_WB_DAT_WIDTH-1 downto 0);
    s_wb_cyc    : in  std_logic;
    s_wb_stb    : in  std_logic;
    s_wb_lock   : in  std_logic;
    s_wb_sel    : in  std_logic_vector(C_S_WB_DAT_WIDTH/8-1 downto 0);
    s_wb_we     : in  std_logic;
    s_wb_dat_r  : out std_logic_vector(C_S_WB_DAT_WIDTH-1 downto 0);
    s_wb_stall  : out std_logic;
    s_wb_err    : out std_logic;
    s_wb_rty    : out std_logic;
    s_wb_ack    : out std_logic;

    m_wb_aclk   : in  std_logic;
    m_wb_areset : in  std_logic;
    m_wb_adr    : out std_logic_vector(C_M_WB_ADR_WIDTH-1 downto 0);
    m_wb_dat_w  : out std_logic_vector(C_M_WB_DAT_WIDTH-1 downto 0);
    m_wb_cyc    : out std_logic;
    m_wb_stb    : out std_logic;
    m_wb_lock   : out std_logic;
    m_wb_sel    : out std_logic_vector(C_M_WB_DAT_WIDTH/8-1 downto 0);
    m_wb_we     : out std_logic;
    m_wb_dat_r  : in  std_logic_vector(C_M_WB_DAT_WIDTH-1 downto 0);
    m_wb_stall  : in  std_logic;
    m_wb_err    : in  std_logic;
    m_wb_rty    : in  std_logic;
    m_wb_ack    : in  std_logic;
    -- User ports ends
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
end WishboneAXI_v0_1;

architecture arch_imp of WishboneAXI_v0_1 is


-- copy of axi_helpers for vivado ip cores compatibility
constant c_axi4_address_width : integer := 32;
constant c_axi4_data_width : integer := 128;
constant c_axi4_id_width : integer := 4;

  type t_axi4_m2s is record
     awid : std_logic_vector(c_axi4_id_width - 1 downto 0);
     awaddr :  STD_LOGIC_VECTOR(c_axi4_address_width-1 DOWNTO 0);
     awlen : STD_LOGIC_VECTOR(7 DOWNTO 0);
     awsize : STD_LOGIC_VECTOR(2 DOWNTO 0);
     awburst : STD_LOGIC_VECTOR(1 DOWNTO 0);
     awlock : STD_LOGIC;
     awcache : STD_LOGIC_VECTOR(3 DOWNTO 0);
     awregion: std_logic_vector(3 downto 0);
     awprot : STD_LOGIC_VECTOR(2 DOWNTO 0);
     awqos : STD_LOGIC_VECTOR(3 DOWNTO 0);
     awvalid : STD_LOGIC;     
     wdata : STD_LOGIC_VECTOR(c_axi4_data_width-1 DOWNTO 0);
     wstrb : STD_LOGIC_VECTOR(c_axi4_data_width/8 - 1 DOWNTO 0);
     wlast : STD_LOGIC;
     wvalid : STD_LOGIC;
     bready : STD_LOGIC;
     arid :  STD_LOGIC_VECTOR(c_axi4_id_width - 1 DOWNTO 0);
     araddr : STD_LOGIC_VECTOR(c_axi4_address_width-1 DOWNTO 0);
     arlen :  STD_LOGIC_VECTOR(7 DOWNTO 0);
     arsize :  STD_LOGIC_VECTOR(2 DOWNTO 0);
     arburst : STD_LOGIC_VECTOR(1 DOWNTO 0);
     arlock :  STD_LOGIC;
     arcache : STD_LOGIC_VECTOR(3 DOWNTO 0);
     arregion: std_logic_vector(3 downto 0);
     arprot :  STD_LOGIC_VECTOR(2 DOWNTO 0);
     arqos : STD_LOGIC_VECTOR(3 DOWNTO 0);
     arvalid : STD_LOGIC;
     rready : STD_LOGIC;
  end record t_axi4_m2s;

  type t_axi4_s2m is record
     awready : STD_LOGIC;
     wready : STD_LOGIC;
     bid : STD_LOGIC_VECTOR(c_axi4_id_width - 1 DOWNTO 0);
     bresp : STD_LOGIC_VECTOR(1 DOWNTO 0);
     bvalid : STD_LOGIC;
     arready : STD_LOGIC;
     rid : STD_LOGIC_VECTOR(c_axi4_id_width - 1 DOWNTO 0);
     rdata : STD_LOGIC_VECTOR(c_axi4_data_width-1 DOWNTO 0);
     rresp : STD_LOGIC_VECTOR(1 DOWNTO 0);
     rlast : STD_LOGIC;
     rvalid :  STD_LOGIC;
  end record t_axi4_s2m;  
-- copy of wishbone pkg for vivado ip cores compatibility  
  constant c_wishbone_address_width : integer := 32;
  constant c_wishbone_data_width    : integer := 32;

  subtype t_wishbone_address is
    std_logic_vector(c_wishbone_address_width-1 downto 0);
  subtype t_wishbone_data is
    std_logic_vector(c_wishbone_data_width-1 downto 0);
  subtype t_wishbone_byte_select is
    std_logic_vector((c_wishbone_address_width/8)-1 downto 0);
  subtype t_wishbone_cycle_type is
    std_logic_vector(2 downto 0);
  subtype t_wishbone_burst_type is
    std_logic_vector(1 downto 0);

  type t_wishbone_interface_mode is (CLASSIC, PIPELINED);
  type t_wishbone_address_granularity is (BYTE, WORD);

  type t_wishbone_master_out is record
    cyc : std_logic;
    stb : std_logic;
    adr : t_wishbone_address;
    sel : t_wishbone_byte_select;
    we  : std_logic;
    dat : t_wishbone_data;
  end record t_wishbone_master_out;

  subtype t_wishbone_slave_in is t_wishbone_master_out;

  type t_wishbone_slave_out is record
    ack   : std_logic;
    err   : std_logic;
    rty   : std_logic;
    stall : std_logic;
    int   : std_logic;
    dat   : t_wishbone_data;
  end record t_wishbone_slave_out;
  subtype t_wishbone_master_in is t_wishbone_slave_out;

component WishboneAXI_v0_2_S_AXI_MUX is
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
end component;


component WishboneAXI_v0_2_M_AX_MUX is
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
end component;

  component XwbXaxi is
  generic (
    -- Users to add parameters here
    C_MASTER_MODE : string := "AXI4"; --AXI4, AXI4LITE, CLASSIC, PIPELINED
    C_SLAVE_MODE  : string := "AXI4LITE"; --AXI4, AXI4LITE, CLASSIC, PIPELINED
    
    C_S_WB_ADR_WIDTH : integer := 32;
    C_S_WB_DAT_WIDTH : integer := 32;

    C_M_WB_ADR_WIDTH : integer := 32;
    C_M_WB_DAT_WIDTH : integer := 32;
    C_WB_ADDRESS_GRANULARITY : string := "BYTE"; -- BYTE, WORD
    -- User parameters ends
    -- Do not modify the parameters beyond this line

    -- Parameters of Axi Slave Bus Interface S_AXI4_LITE
    C_S_AXI4_LITE_DATA_WIDTH : integer := 32;
    C_S_AXI4_LITE_ADDR_WIDTH : integer := 32;

    -- Parameters of Axi Slave Bus Interface S_AXI4
    C_S_AXI4_ID_WIDTH     : integer := 1;
    C_S_AXI4_DATA_WIDTH   : integer := 32;
    C_S_AXI4_ADDR_WIDTH   : integer := 6;
    C_S_AXI4_AWUSER_WIDTH : integer := 0;
    C_S_AXI4_ARUSER_WIDTH : integer := 0;
    C_S_AXI4_WUSER_WIDTH  : integer := 0;
    C_S_AXI4_RUSER_WIDTH  : integer := 0;
    C_S_AXI4_BUSER_WIDTH  : integer := 0;

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
  
    aclk : in std_logic;
    aresetn : in std_logic;
    
    s_wb_m2s : in  t_wishbone_master_out;
	s_wb_s2m : out t_wishbone_slave_out;
	
	m_wb_m2s : out t_wishbone_master_out;
	m_wb_s2m : in  t_wishbone_slave_out;
	
    -- slave axi-lite/axi4 port
    s_axi4_m2s : in  t_axi4_m2s;
    s_axi4_s2m : out t_axi4_s2m;

    -- master axi-lite/axi4 port
    m_axi4_m2s : out t_axi4_m2s;
    m_axi4_s2m : in  t_axi4_s2m

    );
  end component;

  
  signal s_wb_m2s : t_wishbone_master_out;
  signal s_wb_s2m : t_wishbone_slave_out;
  
  signal m_wb_m2s : t_wishbone_master_out;
  signal m_wb_s2m : t_wishbone_slave_out;
  
  -- slave axi-lite/axi4 ports
  signal s_axi4_m2s : t_axi4_m2s;
  signal s_axi4_s2m : t_axi4_s2m;

  -- master axi-lite/axi4 port
  signal m_axi4_m2s : t_axi4_m2s;
  signal m_axi4_s2m : t_axi4_s2m;

  
  signal aresetn : std_logic;
  signal aclk : std_logic;
begin

  aresetn <= not s_wb_areset  when C_SLAVE_MODE = "PIPELINED" else
			 not s_wb_areset  when C_SLAVE_MODE = "CLASSIC" else
			 s_axi4_lite_aresetn  when C_SLAVE_MODE = "AXI4LITE" else
			 s_axi4_aresetn  when C_SLAVE_MODE = "AXI4" else
			 '0';
  aclk    <= s_wb_aclk  when C_SLAVE_MODE = "PIPELINED" else
			 s_wb_aclk  when C_SLAVE_MODE = "CLASSIC" else
			 s_axi4_lite_aclk  when C_SLAVE_MODE = "AXI4LITE" else
			 s_axi4_aclk  when C_SLAVE_MODE = "AXI4" else
			 '0';

			 
  --- Wishbone slave interface
  s_wb_m2s.adr <= s_wb_adr;
  s_wb_m2s.dat <= s_wb_dat_w;
  s_wb_m2s.cyc <= s_wb_cyc;
  s_wb_m2s.stb <= s_wb_stb;
  --  s_wb_lock   : in  std_logic;
  s_wb_m2s.sel <= s_wb_sel;
  s_wb_m2s.we  <= s_wb_we;
  
  s_wb_dat_r   <= s_wb_s2m.dat;
  s_wb_stall   <= s_wb_s2m.stall;
  s_wb_err     <= s_wb_s2m.err;
  s_wb_rty     <= s_wb_s2m.rty;
  s_wb_ack     <= s_wb_s2m.ack;
  
  --- Wishbone master interface
  m_wb_adr <= m_wb_m2s.adr;
  m_wb_dat_w <= m_wb_m2s.dat;
  m_wb_cyc <= m_wb_m2s.cyc;
  m_wb_stb <= m_wb_m2s.stb;
  m_wb_lock    <= '0';
  m_wb_sel <= m_wb_m2s.sel;
  m_wb_we  <= m_wb_m2s.we;
  
  m_wb_s2m.dat   <= m_wb_dat_r;
  m_wb_s2m.stall <= m_wb_stall;
  m_wb_s2m.err   <= m_wb_err;
  m_wb_s2m.rty   <= m_wb_rty;
  m_wb_s2m.ack   <= m_wb_ack;
    
  
U_AXI_IN_MUX : WishboneAXI_v0_2_S_AXI_MUX 
  generic map (
    C_SLAVE_MODE => C_SLAVE_MODE,
    C_S_AXI4_LITE_DATA_WIDTH => C_S_AXI4_LITE_DATA_WIDTH,
    C_S_AXI4_LITE_ADDR_WIDTH => C_S_AXI4_LITE_ADDR_WIDTH,

    -- Parameters of Axi Slave Bus Interface S_AXI4
    C_S_AXI4_ID_WIDTH      => C_S_AXI4_ID_WIDTH,
    C_S_AXI4_DATA_WIDTH    => C_S_AXI4_DATA_WIDTH,
    C_S_AXI4_ADDR_WIDTH    => C_S_AXI4_ADDR_WIDTH,
    C_S_AXI4_AWUSER_WIDTH  => C_S_AXI4_AWUSER_WIDTH,
    C_S_AXI4_ARUSER_WIDTH  => C_S_AXI4_ARUSER_WIDTH,
    C_S_AXI4_WUSER_WIDTH   => C_S_AXI4_WUSER_WIDTH,
    C_S_AXI4_RUSER_WIDTH   => C_S_AXI4_RUSER_WIDTH,
    C_S_AXI4_BUSER_WIDTH   => C_S_AXI4_BUSER_WIDTH

    )
  port map (
    -- Do not modify the ports beyond this line


    -- Ports of Axi Slave Bus Interface S_AXI4_LITE
    s_axi4_lite_aclk    => s_axi4_lite_aclk,
    s_axi4_lite_aresetn => s_axi4_lite_aresetn,
    s_axi4_lite_awaddr  => s_axi4_lite_awaddr,
    s_axi4_lite_awprot  => s_axi4_lite_awprot,
    s_axi4_lite_awvalid => s_axi4_lite_awvalid,
    s_axi4_lite_awready => s_axi4_lite_awready,
    s_axi4_lite_wdata   => s_axi4_lite_wdata,
    s_axi4_lite_wstrb   => s_axi4_lite_wstrb,
    s_axi4_lite_wvalid  => s_axi4_lite_wvalid,
    s_axi4_lite_wready  => s_axi4_lite_wready,
    s_axi4_lite_bresp   => s_axi4_lite_bresp,
    s_axi4_lite_bvalid  => s_axi4_lite_bvalid,
    s_axi4_lite_bready  => s_axi4_lite_bready,
    s_axi4_lite_araddr  => s_axi4_lite_araddr,
    s_axi4_lite_arprot  => s_axi4_lite_arprot,
    s_axi4_lite_arvalid => s_axi4_lite_arvalid,
    s_axi4_lite_arready => s_axi4_lite_arready,
    s_axi4_lite_rdata   => s_axi4_lite_rdata,
    s_axi4_lite_rresp   => s_axi4_lite_rresp,
    s_axi4_lite_rvalid  => s_axi4_lite_rvalid,
    s_axi4_lite_rready  => s_axi4_lite_rready,

    -- Ports of Axi Slave Bus Interface S_AXI4
    s_axi4_aclk     => s_axi4_aclk,
    s_axi4_aresetn  => s_axi4_aresetn,
    s_axi4_awid     => s_axi4_awid,
    s_axi4_awaddr   => s_axi4_awaddr,
    s_axi4_awlen    => s_axi4_awlen,
    s_axi4_awsize   => s_axi4_awsize,
    s_axi4_awburst  => s_axi4_awburst,
    s_axi4_awlock   => s_axi4_awlock,
    s_axi4_awcache  => s_axi4_awcache,
    s_axi4_awprot   => s_axi4_awprot,
    s_axi4_awqos    => s_axi4_awqos,
    s_axi4_awregion => s_axi4_awregion,
    s_axi4_awuser   => s_axi4_awuser,
    s_axi4_awvalid  => s_axi4_awvalid,
    s_axi4_awready  => s_axi4_awready,
    s_axi4_wdata    => s_axi4_wdata,
    s_axi4_wstrb    => s_axi4_wstrb,
    s_axi4_wlast    => s_axi4_wlast,
    s_axi4_wuser    => s_axi4_wuser,
    s_axi4_wvalid   => s_axi4_wvalid,
    s_axi4_wready   => s_axi4_wready,
    s_axi4_bid      => s_axi4_bid,
    s_axi4_bresp    => s_axi4_bresp,
    s_axi4_buser    => s_axi4_buser,
    s_axi4_bvalid   => s_axi4_bvalid,
    s_axi4_bready   => s_axi4_bready,
    s_axi4_arid     => s_axi4_arid,
    s_axi4_araddr   => s_axi4_araddr,
    s_axi4_arlen    => s_axi4_arlen,
    s_axi4_arsize   => s_axi4_arsize,
    s_axi4_arburst  => s_axi4_arburst,
    s_axi4_arlock   => s_axi4_arlock,
    s_axi4_arcache  => s_axi4_arcache,
    s_axi4_arprot   => s_axi4_arprot,
    s_axi4_arqos    => s_axi4_arqos,
    s_axi4_arregion => s_axi4_arregion,
    s_axi4_aruser   => s_axi4_aruser,
    s_axi4_arvalid  => s_axi4_arvalid,
    s_axi4_arready  => s_axi4_arready,
    s_axi4_rid      => s_axi4_rid,
    s_axi4_rdata    => s_axi4_rdata,
    s_axi4_rresp    => s_axi4_rresp,
    s_axi4_rlast    => s_axi4_rlast,
    s_axi4_ruser    => s_axi4_ruser,
    s_axi4_rvalid   => s_axi4_rvalid,
    s_axi4_rready   => s_axi4_rready,

	m_axi_s2m => s_axi4_s2m,
    m_axi_m2s => s_axi4_m2s
    );


U_AXI_OUT_MUX : WishboneAXI_v0_2_M_AX_MUX
  generic map(
    -- Users to add parameters here
    C_MASTER_MODE => C_MASTER_MODE,

    -- Parameters of Axi Master Bus Interface M_AXI4_LITE
    C_M_AXI4_LITE_START_DATA_VALUE        => C_M_AXI4_LITE_START_DATA_VALUE,
    C_M_AXI4_LITE_TARGET_SLAVE_BASE_ADDR  => C_M_AXI4_LITE_TARGET_SLAVE_BASE_ADDR,
    C_M_AXI4_LITE_ADDR_WIDTH              => C_M_AXI4_LITE_ADDR_WIDTH,
    C_M_AXI4_LITE_DATA_WIDTH              => C_M_AXI4_LITE_DATA_WIDTH,
    C_M_AXI4_LITE_TRANSACTIONS_NUM        => C_M_AXI4_LITE_TRANSACTIONS_NUM,

    -- Parameters of Axi Master Bus Interface M_AXI4
    C_M_AXI4_TARGET_SLAVE_BASE_ADDR  => C_M_AXI4_TARGET_SLAVE_BASE_ADDR,
    C_M_AXI4_BURST_LEN               => C_M_AXI4_BURST_LEN,
    C_M_AXI4_ID_WIDTH                => C_M_AXI4_ID_WIDTH,
    C_M_AXI4_ADDR_WIDTH              => C_M_AXI4_ADDR_WIDTH,
    C_M_AXI4_DATA_WIDTH              => C_M_AXI4_DATA_WIDTH,
    C_M_AXI4_AWUSER_WIDTH            => C_M_AXI4_AWUSER_WIDTH,
    C_M_AXI4_ARUSER_WIDTH            => C_M_AXI4_ARUSER_WIDTH,
    C_M_AXI4_WUSER_WIDTH             => C_M_AXI4_WUSER_WIDTH,
    C_M_AXI4_RUSER_WIDTH             => C_M_AXI4_RUSER_WIDTH,
    C_M_AXI4_BUSER_WIDTH             => C_M_AXI4_BUSER_WIDTH
    )
  port map(
    s_axi4_m2s => m_axi4_m2s,
    s_axi4_s2m => m_axi4_s2m,

    -- Ports of Axi Master Bus Interface M_AXI4_LITE
    m_axi4_lite_aclk    => m_axi4_lite_aclk,
    m_axi4_lite_aresetn => m_axi4_lite_aresetn,
    m_axi4_lite_awaddr  => m_axi4_lite_awaddr,
    m_axi4_lite_awprot  => m_axi4_lite_awprot,
    m_axi4_lite_awvalid => m_axi4_lite_awvalid,
    m_axi4_lite_awready => m_axi4_lite_awready,
    m_axi4_lite_wdata   => m_axi4_lite_wdata,
    m_axi4_lite_wstrb   => m_axi4_lite_wstrb,
    m_axi4_lite_wvalid  => m_axi4_lite_wvalid,
    m_axi4_lite_wready  => m_axi4_lite_wready,
    m_axi4_lite_bresp   => m_axi4_lite_bresp,
    m_axi4_lite_bvalid  => m_axi4_lite_bvalid,
    m_axi4_lite_bready  => m_axi4_lite_bready,
    m_axi4_lite_araddr  => m_axi4_lite_araddr,
    m_axi4_lite_arprot  => m_axi4_lite_arprot,
    m_axi4_lite_arvalid => m_axi4_lite_arvalid,
    m_axi4_lite_arready => m_axi4_lite_arready,
    m_axi4_lite_rdata   => m_axi4_lite_rdata,
    m_axi4_lite_rresp   => m_axi4_lite_rresp,
    m_axi4_lite_rvalid  => m_axi4_lite_rvalid,
    m_axi4_lite_rready  => m_axi4_lite_rready,

    -- Ports of Axi Master Bus Interface M_AXI4
    m_axi4_aclk    => m_axi4_aclk,
    m_axi4_aresetn => m_axi4_aresetn,
    m_axi4_awid    => m_axi4_awid,
    m_axi4_awaddr  => m_axi4_awaddr,
    m_axi4_awlen   => m_axi4_awlen,
    m_axi4_awsize  => m_axi4_awsize,
    m_axi4_awburst => m_axi4_awburst,
    m_axi4_awlock  => m_axi4_awlock,
    m_axi4_awcache => m_axi4_awcache,
    m_axi4_awprot  => m_axi4_awprot,
    m_axi4_awqos   => m_axi4_awqos,
    m_axi4_awuser  => m_axi4_awuser,
    m_axi4_awvalid => m_axi4_awvalid,
    m_axi4_awready => m_axi4_awready,
    m_axi4_wdata   => m_axi4_wdata,
    m_axi4_wstrb   => m_axi4_wstrb,
    m_axi4_wlast   => m_axi4_wlast,
    m_axi4_wuser   => m_axi4_wuser,
    m_axi4_wvalid  => m_axi4_wvalid,
    m_axi4_wready  => m_axi4_wready,
    m_axi4_bid     => m_axi4_bid,
    m_axi4_bresp   => m_axi4_bresp,
    m_axi4_buser   => m_axi4_buser,
    m_axi4_bvalid  => m_axi4_bvalid,
    m_axi4_bready  => m_axi4_bready,
    m_axi4_arid    => m_axi4_arid,
    m_axi4_araddr  => m_axi4_araddr,
    m_axi4_arlen   => m_axi4_arlen,
    m_axi4_arsize  => m_axi4_arsize,
    m_axi4_arburst => m_axi4_arburst,
    m_axi4_arlock  => m_axi4_arlock,
    m_axi4_arcache => m_axi4_arcache,
    m_axi4_arprot  => m_axi4_arprot,
    m_axi4_arqos   => m_axi4_arqos,
    m_axi4_aruser  => m_axi4_aruser,
    m_axi4_arvalid => m_axi4_arvalid,
    m_axi4_arready => m_axi4_arready,
    m_axi4_rid     => m_axi4_rid,
    m_axi4_rdata   => m_axi4_rdata,
    m_axi4_rresp   => m_axi4_rresp,
    m_axi4_rlast   => m_axi4_rlast,
    m_axi4_ruser   => m_axi4_ruser,
    m_axi4_rvalid  => m_axi4_rvalid,
    m_axi4_rready  => m_axi4_rready
    );
	

U_XwbXaxi_root2wb : XwbXaxi
 generic map (
   C_MASTER_MODE => C_MASTER_MODE,
   C_SLAVE_MODE  => C_SLAVE_MODE
   )
port map (
   aclk  => aclk,
   aresetn => aresetn,
   
   s_axi4_m2s => s_axi4_m2s,
   s_axi4_s2m => s_axi4_s2m,
   m_axi4_m2s => m_axi4_m2s,
   m_axi4_s2m => m_axi4_s2m,
   
   s_wb_m2s => s_wb_m2s,
   s_wb_s2m => s_wb_s2m,
   m_wb_m2s => m_wb_m2s,
   m_wb_s2m => m_wb_s2m
   
);



  -- User logic ends

end arch_imp;
