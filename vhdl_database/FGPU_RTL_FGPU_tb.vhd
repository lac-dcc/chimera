-- libraries --------------------------------------------------------------------------------- {{{
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.all;
library work;
use work.all;
use work.FGPU_definitions.all;
use work.FGPU_simulation_pkg.all;
------------------------------------------------------------------------------------------------- }}}
ENTITY FGPU_tb IS
END FGPU_tb;
ARCHITECTURE behavior OF FGPU_tb IS 
  signal target_offset_addr               : natural := 0; --2**(N+L+M-1+2);
  constant MAX_NDRANGE_SIZE               : natural := 64*1024;
  -- constants and functions {{{
  CONSTANT clk_period                     : time := 5000 ps;
  CONSTANT C_MAXI_ID_WIDTH                : natural := 6;
  CONSTANT S_DATA_W                       : integer := 32;
  CONSTANT N_WF_WG_ADDR                   : natural := 0;
  CONSTANT WG_SIZE_DX_ADDR                : integer := 7;
  CONSTANT N_WG_D0_ADDR                   : integer := 8;
  CONSTANT N_WG_D1_ADDR                   : integer := 9;
  CONSTANT SIZE_D0_ADDR                   : natural := 1;
  CONSTANT SIZE_D1_ADDR                   : natural := 2;
  CONSTANT SIZE_D2_ADDR                   : natural := 3;
  CONSTANT WG_SIZE_ADDR                   : natural := 11;
  CONSTANT PARAM_ADDR                     : natural := 16;
  CONSTANT N_WF_WG_POS                    : natural := 28;
  CONSTANT WG_SIZE_D0_POS                 : natural := 0;
  CONSTANT WG_SIZE_D1_POS                 : natural := 10;
  CONSTANT WG_SIZE_D2_POS                 : natural := 20;
  CONSTANT N_DIM_POS                      : natural := 30;
  CONSTANT N_WF_WG_W                      : natural := 4;
  CONSTANT WG_SIZE_POS                    : natural := 0;
  --}}}
  -- general signals {{{
  signal start_debug                      : std_logic := '0';
  signal clk                              : std_logic := '0';
  signal nrst                             : std_logic := '0';
  signal gmem_addr                        : unsigned(GMEM_ADDR_W-1 downto 0) := (others => '0');
  signal gmem_wrData                      : std_logic_vector(GMEM_DATA_W-1 downto 0) := (others => '0');
  signal gmem_we                          : std_logic := '0';
  signal gmem_re                          : std_logic := '0';
  signal new_kernel, finished_kernel      : std_logic := '0';
  signal written_count                    : integer := 0;
  signal gmem_rdData                      : std_logic_vector(GMEM_DATA_W-1 downto 0);
  signal gmem_wr_ack, gmem_rd_ack         : std_logic := '0';
  signal size                             : natural := 1024;
  signal size_0, size_1, size_2           : integer := MAX_NDRANGE_SIZE;
  signal problemSize_sig                  : natural := 16; 
  -- }}}
  -- axi slave signals {{{
  signal s0_awaddr                        : std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0) := (others=>'0');
  signal s0_awprot                        : std_logic_vector(2 downto 0) := (others=>'0');
  signal s0_awvalid                       : std_logic := '0';
  signal s0_awready                       : std_logic := '0';

  signal s0_wdata                         : std_logic_vector(S_DATA_W-1 downto 0) := (others=>'0');
  signal s0_wstrb                         : std_logic_vector((S_DATA_W/8)-1 downto 0) := (others=>'0');
  signal s0_wvalid                        : std_logic := '0';
  signal s0_wready                        : std_logic := '0';

  signal s0_bresp                         : std_logic_vector(1 downto 0) := (others=>'0');
  signal s0_bvalid                        : std_logic := '0';
  signal s0_bready                        : std_logic := '0';

  signal s0_araddr                        : std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0) := (others=>'0');
  signal s0_arprot                        : std_logic_vector(2 downto 0) := (others=>'0');
  signal s0_arvalid                       : std_logic := '0';
  signal s0_arready                       : std_logic := '0';

  signal s0_rdata                         : std_logic_vector(S_DATA_W-1 downto 0) := (others=>'0');
  signal s0_rresp                         : std_logic_vector(1 downto 0) := (others=>'0');
  signal s0_rvalid                        : std_logic := '0';
  signal s0_rready                        : std_logic := '0';
  -- }}}
  -- axi master signals {{{
  -- interface 0 {{{
  -- ar channel
  signal m0_araddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  signal m0_arlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m0_arsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m0_arburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m0_arvalid                       : std_logic := '0';
  signal m0_arready                       : std_logic := '0';
  signal m0_arid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  signal m0_rdata                         : std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  signal m0_rresp                         : std_logic_vector(1 downto 0):= (others=>'0');
  signal m0_rlast                         : std_logic := '0';
  signal m0_rvalid                        : std_logic := '0';
  signal m0_rready                        : std_logic := '0';
  signal m0_rid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- aw channel
  signal m0_awaddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal m0_awvalid                       : std_logic := '0';
  signal m0_awready                       : std_logic := '0';
  signal m0_awlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m0_awsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m0_awburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m0_awid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  signal m0_wdata                         : std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  signal m0_wstrb                         : std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  signal m0_wlast                         : std_logic := '0';
  signal m0_wvalid                        : std_logic := '0';
  signal m0_wready                        : std_logic := '0';
  -- b channel
  signal m0_bvalid                        : std_logic := '0';
  signal m0_bready                        : std_logic := '0';
  signal m0_bid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  --}}}
  -- interface 1 {{{
  -- ar channel
  signal m1_araddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  signal m1_arlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m1_arsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m1_arburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m1_arvalid                       : std_logic := '0';
  signal m1_arready                       : std_logic := '0';
  signal m1_arid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  signal m1_rdata                         : std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  signal m1_rresp                         : std_logic_vector(1 downto 0):= (others=>'0');
  signal m1_rlast                         : std_logic := '0';
  signal m1_rvalid                        : std_logic := '0';
  signal m1_rready                        : std_logic := '0';
  signal m1_rid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- aw channel
  signal m1_awaddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal m1_awvalid                       : std_logic := '0';
  signal m1_awready                       : std_logic := '0';
  signal m1_awlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m1_awsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m1_awburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m1_awid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  signal m1_wdata                         : std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  signal m1_wstrb                         : std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  signal m1_wlast                         : std_logic := '0';
  signal m1_wvalid                        : std_logic := '0';
  signal m1_wready                        : std_logic := '0';
  -- b channel
  signal m1_bvalid                        : std_logic := '0';
  signal m1_bready                        : std_logic := '0';
  signal m1_bid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  --}}}
  -- interface 2 {{{
  -- ar channel
  signal m2_araddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  signal m2_arlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m2_arsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m2_arburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m2_arvalid                       : std_logic := '0';
  signal m2_arready                       : std_logic := '0';
  signal m2_arid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  signal m2_rdata                         : std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  signal m2_rresp                         : std_logic_vector(1 downto 0):= (others=>'0');
  signal m2_rlast                         : std_logic := '0';
  signal m2_rvalid                        : std_logic := '0';
  signal m2_rready                        : std_logic := '0';
  signal m2_rid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- aw channel
  signal m2_awaddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal m2_awvalid                       : std_logic := '0';
  signal m2_awready                       : std_logic := '0';
  signal m2_awlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m2_awsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m2_awburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m2_awid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  signal m2_wdata                         : std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  signal m2_wstrb                         : std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  signal m2_wlast                         : std_logic := '0';
  signal m2_wvalid                        : std_logic := '0';
  signal m2_wready                        : std_logic := '0';
  -- b channel
  signal m2_bvalid                        : std_logic := '0';
  signal m2_bready                        : std_logic := '0';
  signal m2_bid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  --}}}
  -- interface 3 {{{
  -- ar channel
  signal m3_araddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  signal m3_arlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m3_arsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m3_arburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m3_arvalid                       : std_logic := '0';
  signal m3_arready                       : std_logic := '0';
  signal m3_arid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  signal m3_rdata                         : std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  signal m3_rresp                         : std_logic_vector(1 downto 0):= (others=>'0');
  signal m3_rlast                         : std_logic := '0';
  signal m3_rvalid                        : std_logic := '0';
  signal m3_rready                        : std_logic := '0';
  signal m3_rid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- aw channel
  signal m3_awaddr                        : std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal m3_awvalid                       : std_logic := '0';
  signal m3_awready                       : std_logic := '0';
  signal m3_awlen                         : std_logic_vector(7 downto 0):= (others=>'0');
  signal m3_awsize                        : std_logic_vector(2 downto 0):= (others=>'0');
  signal m3_awburst                       : std_logic_vector(1 downto 0):= (others=>'0');
  signal m3_awid                          : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  signal m3_wdata                         : std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  signal m3_wstrb                         : std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  signal m3_wlast                         : std_logic := '0';
  signal m3_wvalid                        : std_logic := '0';
  signal m3_wready                        : std_logic := '0';
  -- b channel
  signal m3_bvalid                        : std_logic := '0';
  signal m3_bready                        : std_logic := '0';
  signal m3_bid                           : std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  --}}}
  --}}}
  -- observation signals ----------------------------------------------------------------------------------{{{
  signal cycles_total   : nat_array(N_CU-1 downto 0) := (others=>0);
  signal cycles_busy    : nat_array(N_CU-1 downto 0) := (others=>0); 
  signal executing      : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  ---------------------------------------------------------------------------------------------------------}}}
BEGIN
  -- instantiate the Unit Under Test (UUT) {{{
  uut: entity FGPU
  port map (
    clk => clk,
    -- slave axi {{{
    s0_awaddr => s0_awaddr,
    s0_awprot => s0_awprot,
    s0_awvalid => s0_awvalid,
    s0_awready => s0_awready,
  
    s0_wdata => s0_wdata,
    s0_wstrb => s0_wstrb,
    s0_wvalid => s0_wvalid,
    s0_wready => s0_wready,
  
    s0_bresp => s0_bresp,
    s0_bvalid => s0_bvalid,
    s0_bready => s0_bready,
  
    s0_araddr => s0_araddr,
    s0_arprot => s0_arprot,
    s0_arvalid => s0_arvalid,
    s0_arready => s0_arready,
  
    s0_rdata => s0_rdata,
    s0_rresp => s0_rresp,
    s0_rvalid => s0_rvalid,
    s0_rready => s0_rready,
    -- }}}
    -- axi master 0 {{{
    -- ar channel
    m0_araddr => m0_araddr,
    m0_arlen => m0_arlen,
    m0_arsize => m0_arsize,
    m0_arburst => m0_arburst,
    m0_arvalid => m0_arvalid,
    m0_arready => m0_arready,
    m0_arid => m0_arid,
    -- r channel
    m0_rdata => m0_rdata,
    m0_rresp => m0_rresp,
    m0_rlast => m0_rlast,
    m0_rvalid => m0_rvalid,
    m0_rready => m0_rready,
    m0_rid => m0_rid,
    -- aw channel
    m0_awvalid => m0_awvalid,
    m0_awaddr => m0_awaddr,
    m0_awready => m0_awready,
    m0_awlen => m0_awlen,
    m0_awsize => m0_awsize,
    m0_awburst => m0_awburst,
    m0_awid => m0_awid,
    --    w channel
    m0_wdata => m0_wdata,
    m0_wstrb => m0_wstrb,
    m0_wlast => m0_wlast,
    m0_wvalid => m0_wvalid,
    m0_wready => m0_wready,
    -- bchannel
    m0_bvalid => m0_bvalid,
    m0_bready => m0_bready,
    m0_bid => m0_bid,
    -- }}}
    -- axi master 1 {{{
    -- ar channel
    m1_araddr => m1_araddr,
    m1_arlen => m1_arlen,
    m1_arsize => m1_arsize,
    m1_arburst => m1_arburst,
    m1_arvalid => m1_arvalid,
    m1_arready => m1_arready,
    m1_arid => m1_arid,
    -- r channel
    m1_rdata => m1_rdata,
    m1_rresp => m1_rresp,
    m1_rlast => m1_rlast,
    m1_rvalid => m1_rvalid,
    m1_rready => m1_rready,
    m1_rid => m1_rid,
    -- aw channel
    m1_awvalid => m1_awvalid,
    m1_awaddr => m1_awaddr,
    m1_awready => m1_awready,
    m1_awlen => m1_awlen,
    m1_awsize => m1_awsize,
    m1_awburst => m1_awburst,
    m1_awid => m1_awid,
    --    w channel
    m1_wdata => m1_wdata,
    m1_wstrb => m1_wstrb,
    m1_wlast => m1_wlast,
    m1_wvalid => m1_wvalid,
    m1_wready => m1_wready,
    -- bchannel
    m1_bvalid => m1_bvalid,
    m1_bready => m1_bready,
    m1_bid => m1_bid,
    -- }}}
    -- axi master 2 {{{
    -- ar channel
    m2_araddr => m2_araddr,
    m2_arlen => m2_arlen,
    m2_arsize => m2_arsize,
    m2_arburst => m2_arburst,
    m2_arvalid => m2_arvalid,
    m2_arready => m2_arready,
    m2_arid => m2_arid,
    -- r channel
    m2_rdata => m2_rdata,
    m2_rresp => m2_rresp,
    m2_rlast => m2_rlast,
    m2_rvalid => m2_rvalid,
    m2_rready => m2_rready,
    m2_rid => m2_rid,
    -- aw channel
    m2_awvalid => m2_awvalid,
    m2_awaddr => m2_awaddr,
    m2_awready => m2_awready,
    m2_awlen => m2_awlen,
    m2_awsize => m2_awsize,
    m2_awburst => m2_awburst,
    m2_awid => m2_awid,
    --    w channel
    m2_wdata => m2_wdata,
    m2_wstrb => m2_wstrb,
    m2_wlast => m2_wlast,
    m2_wvalid => m2_wvalid,
    m2_wready => m2_wready,
    -- bchannel
    m2_bvalid => m2_bvalid,
    m2_bready => m2_bready,
    m2_bid => m2_bid,
    -- }}}
    -- axi master 3 {{{
    -- ar channel
    m3_araddr => m3_araddr,
    m3_arlen => m3_arlen,
    m3_arsize => m3_arsize,
    m3_arburst => m3_arburst,
    m3_arvalid => m3_arvalid,
    m3_arready => m3_arready,
    m3_arid => m3_arid,
    -- r channel
    m3_rdata => m3_rdata,
    m3_rresp => m3_rresp,
    m3_rlast => m3_rlast,
    m3_rvalid => m3_rvalid,
    m3_rready => m3_rready,
    m3_rid => m3_rid,
    -- aw channel
    m3_awvalid => m3_awvalid,
    m3_awaddr => m3_awaddr,
    m3_awready => m3_awready,
    m3_awlen => m3_awlen,
    m3_awsize => m3_awsize,
    m3_awburst => m3_awburst,
    m3_awid => m3_awid,
    --    w channel
    m3_wdata => m3_wdata,
    m3_wstrb => m3_wstrb,
    m3_wlast => m3_wlast,
    m3_wvalid => m3_wvalid,
    m3_wready => m3_wready,
    -- bchannel
    m3_bvalid => m3_bvalid,
    m3_bready => m3_bready,
    m3_bid => m3_bid,
    -- }}}

    nrst => nrst
    -- loc_mem_rdAddr_dummy => loc_mem_rdAddr_dummy
  );
  --}}}
  -- instantiate globel memory & cram{{{
  gmem_inst: entity global_mem
  generic map(
    MAX_NDRANGE_SIZE => MAX_NDRANGE_SIZE
  ) port map (
    new_kernel => new_kernel,
    finished_kernel => finished_kernel,
    size_0 => size_0,
    size_1 => size_1,
    problemSize => problemSize_sig,
    target_offset_addr => target_offset_addr,
    -- AXI Slave Interface
    mx_arlen_awlen => m0_arlen,
    -- interface 0{{{
    -- ar channel
    m0_araddr => m0_araddr,
    m0_arvalid => m0_arvalid,
    m0_arready => m0_arready,
    m0_arid => m0_arid,
    -- r channel
    m0_rdata => m0_rdata,
    m0_rlast => m0_rlast,
    m0_rvalid => m0_rvalid,
    m0_rready => m0_rready,
    m0_rid => m0_rid,
    -- aw channel
    m0_awvalid => m0_awvalid,
    m0_awaddr => m0_awaddr,
    m0_awready => m0_awready,
    m0_awid => m0_awid,
    -- w channel
    m0_wdata => m0_wdata,
    m0_wstrb => m0_wstrb,
    m0_wlast => m0_wlast,
    m0_wvalid => m0_wvalid,
    m0_wready => m0_wready,
    -- b channel
    m0_bready => m0_bready,
    m0_bvalid => m0_bvalid,
    m0_bid => m0_bid,
    --}}}
    -- interface 1 {{{
    -- ar channel
    m1_araddr => m1_araddr,
    m1_arvalid => m1_arvalid,
    m1_arready => m1_arready,
    m1_arid => m1_arid,
    -- r channel
    m1_rdata => m1_rdata,
    m1_rlast => m1_rlast,
    m1_rvalid => m1_rvalid,
    m1_rready => m1_rready,
    m1_rid => m1_rid,
    -- aw channel
    m1_awvalid => m1_awvalid,
    m1_awaddr => m1_awaddr,
    m1_awready => m1_awready,
    m1_awid => m1_awid,
    -- w channel
    m1_wdata => m1_wdata,
    m1_wstrb => m1_wstrb,
    m1_wlast => m1_wlast,
    m1_wvalid => m1_wvalid,
    m1_wready => m1_wready,
    -- b channel
    m1_bready => m1_bready,
    m1_bvalid => m1_bvalid,
    m1_bid => m1_bid,
    --}}}
    -- interface 2 {{{
    -- ar channel
    m2_araddr => m2_araddr,
    m2_arvalid => m2_arvalid,
    m2_arready => m2_arready,
    m2_arid => m2_arid,
    -- r channel
    m2_rdata => m2_rdata,
    m2_rlast => m2_rlast,
    m2_rvalid => m2_rvalid,
    m2_rready => m2_rready,
    m2_rid => m2_rid,
    -- aw channel
    m2_awvalid => m2_awvalid,
    m2_awaddr => m2_awaddr,
    m2_awready => m2_awready,
    m2_awid => m2_awid,
    -- w channel
    m2_wdata => m2_wdata,
    m2_wstrb => m2_wstrb,
    m2_wlast => m2_wlast,
    m2_wvalid => m2_wvalid,
    m2_wready => m2_wready,
    -- b channel
    m2_bready => m2_bready,
    m2_bvalid => m2_bvalid,
    m2_bid => m2_bid,
    --}}}
    -- interface 3 {{{
    -- ar channel
    m3_araddr => m3_araddr,
    m3_arvalid => m3_arvalid,
    m3_arready => m3_arready,
    m3_arid => m3_arid,
    -- r channel
    m3_rdata => m3_rdata,
    m3_rlast => m3_rlast,
    m3_rvalid => m3_rvalid,
    m3_rready => m3_rready,
    m3_rid => m3_rid,
    -- aw channel
    m3_awvalid => m3_awvalid,
    m3_awaddr => m3_awaddr,
    m3_awready => m3_awready,
    m3_awid => m3_awid,
    -- w channel
    m3_wdata => m3_wdata,
    m3_wstrb => m3_wstrb,
    m3_wlast => m3_wlast,
    m3_wvalid => m3_wvalid,
    m3_wready => m3_wready,
    -- b channel
    m3_bready => m3_bready,
    m3_bvalid => m3_bvalid,
    m3_bid => m3_bid,
    --}}}
    clk => clk,
    nrst => nrst
  );
  --}}}
   -- clock process definitions {{{
     clk_process :process
  begin
    clk <= '0';
    wait for clk_period;
    clk <= not clk;
    wait for clk_period;
  end process;
  --}}}
  -- stimuls process {{{
  process 
    -- variables {{{
    variable tmp_integer : integer := 0;
    variable nStages, stageIndx, passIndx : integer := 0;
    variable wg_size : integer := 100;
    variable size_d0, size_d1, size_d2 : integer := MAX_NDRANGE_SIZE;
    variable wg_size_d0, wg_size_d1, wg_size_d2 : natural := 1;
    variable nDim : natural := 1;
    variable reduce_factor_sum                : natural := 4;
    variable minReduceSize                : natural := 8; 
    variable problemSize                  : natural := 16; 
    variable swap_base_target             : boolean := false;
    --}}} 
    -- procedures {{{
    procedure swap_base_target_params is --{{{
      variable tmp1, tmp2 : std_logic_vector(DATA_W-1 downto 0);
    begin
      s0_araddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_araddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_araddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+0,5));
      s0_araddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_arvalid <= '1';
      wait until s0_arready = '1';
      wait until rising_edge(clk);
      s0_arvalid <= '0';
      wait until s0_rvalid = '1';
      tmp1 := s0_rdata;
      s0_araddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_araddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_araddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+1,5));
      s0_araddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_arvalid <= '1';
      wait until s0_arready = '1';
      wait until rising_edge(clk);
      s0_arvalid <= '0';
      wait until s0_rvalid = '1';
      tmp2 := s0_rdata;
      s0_wdata <= tmp2;
      wait until rising_edge(clk);
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+0,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      s0_awvalid <= '0';
      s0_wvalid <= '0';
      wait until rising_edge(clk);
      s0_wdata <= tmp1;
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+1,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure write_param(factor: in integer; paramIndx: in integer) is --{{{
    begin
      s0_wdata <= std_logic_vector(to_unsigned(factor, DATA_W));
      wait until rising_edge(clk);
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+paramIndx,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure replace_target_addr is --{{{
      variable target_param : natural := 0;
    begin
      case kernel_name is
        when floydwarshall =>
          target_param := 0;
        when copy | bitonic | add_float | parallelSelection | sum_atomic | fft_hard | sobel |
             median | max_half_atomic  =>
          target_param := 1;
        when fadd | mat_mul | fir | xcorr | mul_float | fir_char4 =>
          target_param := 2;
        when others =>
          report "undefined kernel index" severity failure;
      end case;
      s0_araddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_araddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_araddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+target_param,5));
      s0_araddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_arvalid <= '1';
      wait until s0_arready = '1';
      wait until rising_edge(clk);
      s0_arvalid <= '0';
      wait until s0_rvalid = '1';
      s0_wdata <= std_logic_vector(unsigned(s0_rdata) + to_unsigned(target_offset_addr, DATA_W));
      wait until rising_edge(clk);
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(PARAM_ADDR+target_param,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure write_WG_size_dx_sch_ram(nDim, wg_size_d0, wg_size_d1, wg_size_d2: in natural) is --{{{
    begin
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 5) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(WG_SIZE_DX_ADDR,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_wdata(WG_SIZE_D0_POS+WG_SIZE_W downto WG_SIZE_D0_POS) <= std_logic_vector(to_unsigned(wg_size_d0, WG_SIZE_W+1));
      s0_wdata(WG_SIZE_D1_POS+WG_SIZE_W downto WG_SIZE_D1_POS) <= std_logic_vector(to_unsigned(wg_size_d1, WG_SIZE_W+1));
      s0_wdata(WG_SIZE_D2_POS+WG_SIZE_W downto WG_SIZE_D2_POS) <= std_logic_vector(to_unsigned(wg_size_d2, WG_SIZE_W+1));
      s0_wdata(N_DIM_POS+1 downto N_DIM_POS) <= std_logic_vector(to_unsigned(nDim-1, 2));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure update_WG_size_sch_ram (val: in integer) is --{{{
    begin
      s0_araddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_araddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_araddr(4 downto 0) <= std_logic_vector(to_unsigned(WG_SIZE_ADDR,5));
      s0_araddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_arvalid <= '1';
      wait until s0_arready = '1';
      wait until rising_edge(clk);
      s0_arvalid <= '0';
      wait until s0_rvalid = '1';
      s0_wdata <= s0_rdata;
      wait until rising_edge(clk);
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(WG_SIZE_ADDR,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_wdata(WG_SIZE_POS+WG_SIZE_W downto WG_SIZE_POS) <= std_logic_vector(to_unsigned(val, WG_SIZE_W+1));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure update_nWF_WG_sch_ram (val: in integer) is --{{{
    begin
      s0_araddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_araddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_araddr(4 downto 0) <= std_logic_vector(to_unsigned(N_WF_WG_ADDR,5));
      s0_araddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_arvalid <= '1';
      wait until s0_arready = '1';
      wait until rising_edge(clk);
      s0_arvalid <= '0';
      wait until s0_rvalid = '1';
      s0_wdata <= s0_rdata;
      wait until rising_edge(clk);
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 9) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(N_WF_WG_ADDR,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_wdata(N_WF_WG_POS+N_WF_WG_W-1 downto N_WF_WG_POS) <= std_logic_vector(to_unsigned(val, N_WF_WG_W));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure write_cram ( addr: in integer; val: in integer) is -- {{{
    begin
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "01";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 0) <= std_logic_vector(to_unsigned(addr,INTERFCE_W_ADDR_W-2));
      s0_wdata <= std_logic_vector(to_unsigned(val, DATA_W));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure write_sch_ram ( addr: in integer; val: in integer) is -- {{{
    begin
      s0_awaddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) <= "00";
      s0_awaddr(INTERFCE_W_ADDR_W-3 downto 5) <= (others=>'0');
      s0_awaddr(4 downto 0) <= std_logic_vector(to_unsigned(addr,5));
      s0_awaddr(8 downto 5) <= std_logic_vector(to_unsigned(get_kernel_index(kernel_name),4));
      s0_wdata <= std_logic_vector(to_unsigned(val, DATA_W));
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure clear_write_cache is --{{{
    begin
      s0_awaddr <= std_logic_vector(to_unsigned(RcleanCache_addr, INTERFCE_W_ADDR_W));
      s0_wdata <= X"0000_0000";
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure set_write_cache is --{{{
    begin
      s0_awaddr <= std_logic_vector(to_unsigned(RcleanCache_addr, INTERFCE_W_ADDR_W));
      s0_wdata <= X"0000_0000";
      s0_wdata(get_kernel_index(kernel_name)) <= '1';
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure set_initialize is --{{{
    begin
      s0_awaddr <= std_logic_vector(to_unsigned(RInitiate_addr, INTERFCE_W_ADDR_W));
      s0_wdata <= X"0000_0000";
      s0_wdata(get_kernel_index(kernel_name)) <= '1';
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure clear_initialize is --{{{
    begin
      s0_awaddr <= std_logic_vector(to_unsigned(RInitiate_addr, INTERFCE_W_ADDR_W));
      s0_wdata <= X"0000_0000";
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
    end procedure; --}}}
    procedure start_kernel(initialize_gmem : in integer)  is --{{{
    begin
      s0_awaddr <= std_logic_vector(to_unsigned(Rstart_addr, INTERFCE_W_ADDR_W));
      s0_wdata <= X"0000_0000";
      s0_wdata(get_kernel_index(kernel_name)) <= '1';
      s0_awvalid <= '1';
      s0_wvalid <= '1';
      if initialize_gmem /= 0 then
        new_kernel <= '1';
      end if;
      size <= size_d0*size_d1*size_d2;
      wait until s0_awready = '1' and s0_wready = '1';
      wait until rising_edge(clk);
      s0_awvalid <= '0';
      s0_wvalid <= '0';
      new_kernel <= '0';
    end procedure; --}}}
    procedure read_status0_reg( res: out std_logic_vector(DATA_W-1 downto 0)) is --{{{
    begin
      s0_araddr <= std_logic_vector(to_unsigned(Rstat_addr, INTERFCE_W_ADDR_W));
      s0_arvalid <= '1';
      wait until s0_arready = '1';
      wait until rising_edge(clk);
      s0_arvalid <= '0';
      wait until s0_rvalid = '1';
      res := s0_rdata;
      wait until rising_edge(clk);
    end procedure; --}}}
    procedure wait_to_finish is --{{{
      variable tmp : std_logic_vector(DATA_W-1 downto 0);
    begin
      read_status0_reg(tmp);
      while to_integer(unsigned(tmp)) = 0 loop
        read_status0_reg(tmp);
      end loop;
      finished_kernel <= '1';
      wait until rising_edge(clk);
      finished_kernel <= '0';
      -- wait for 20*clk_period; -- the finish flag is set when the last axi_write is issued. Some extra cycles are still needed
    end procedure; --}}}
    procedure download_code is --{{{
    begin
      case kernel_name is
        when copy => --copy
          case COMP_TYPE is
            when 0 => -- byte
              write_cram(9, 16#71000462#);
              write_cram(10, 16#21000C64#);
              write_cram(11, 16#28001042#);
              write_cram(13, 16#79001062#);
            when 1 => --half
              write_cram(9, 16#72000462#);
              write_cram(10, 16#21001064#);
              write_cram(11, 16#28001042#);
              write_cram(13, 16#7A001062#);
            when others => -- word
              write_cram(9, 16#74000462#);
              write_cram(10, 16#00000000#);
              write_cram(11, 16#00000000#);
              write_cram(13, 16#7C001062#);
          end case;
        when others =>
      end case;
    end procedure; --}}}
    -- }}}
  begin    
    report "Kernel Nr. "& integer'image(get_kernel_index(kernel_name));
    wait for clk_period;
    nrst <= '1';
    wait for 2*clk_period;
    s0_rready <= '1';
    case kernel_name is
      when mat_mul | median | floydwarshall | sobel =>
        nDim := 2;
      when others =>
        nDim := 1;
    end case;
    replace_target_addr;
    download_code;
    set_initialize;
    
    size_d2 := 1;
    for i in 1 to 64 loop
      -- wait for 2*clk_period;
      case kernel_name is
        when mat_mul | floydwarshall | median=>
          wg_size_d0 := 8;
          wg_size_d1 := 8;
          wg_size := wg_size_d0 * wg_size_d1;
          size_d0 := wg_size_d0*i;
          size_d1 := wg_size_d1*i;
        when sobel =>
          wg_size_d0 := 4;
          wg_size_d1 := 4;
          problemSize := 16;
          size_d0 := 4;
          size_d1 := 4;
          wg_size := wg_size_d0 * wg_size_d1;
        when bitonic | fft_hard =>
          wg_size_d0 := 64;
          size_d0 := 1024*i;
          -- size_d0 := wg_size_d0*2**(i-1);
          problemSize := size_d0*2;
          wg_size := wg_size_d0;
        when others =>
          wg_size_d0 := 64;
          -- size_d0 := (i+8)*1024;
          size_d0 := 64*i;
          -- size_d0 := 128*2**(i-1);
          -- size_d0 := wg_size_d0*i;
          size_d1 := 1;
          wg_size_d1 := 1;
          wg_size := wg_size_d0;
          problemSize := REDUCE_FACTOR*size_d0;
      end case;
      problemSize_sig <= problemSize;
      assert wg_size <= WF_SIZE*8 severity failure;

      case kernel_name is
        when fft_hard => -- {{{
          -- clear_write_cache;
          set_write_cache;
          set_initialize;
          nStages := 0;
          tmp_integer := 1;
          while tmp_integer < problemSize loop
            tmp_integer := tmp_integer * 2;
            nStages := nStages + 1;
          end loop;
          stageIndx := 0;
          report "problemSize = " & integer'image(problemSize) & ", nStages = " & integer'image(nStages);
          while stageIndx /= nStages loop
            report "stageIndx = " & integer'image(stageIndx);
            if (wg_size mod WF_SIZE ) = 0 then
              update_nWF_WG_sch_ram(wg_size/WF_SIZE-1);
            else
              update_nWF_WG_sch_ram(wg_size/WF_SIZE);
            end if;
            write_sch_ram(SIZE_D0_ADDR, size_d0);
            write_WG_size_dx_sch_ram(nDim, wg_size_d0, wg_size_d1, wg_size_d2);
            update_WG_size_sch_ram(wg_size);
            write_sch_ram(N_WG_D0_ADDR, max(size_d0/wg_size_d0-1, 0));
            write_param(stageIndx, 1);
            size_0 <= size_d0;

            if stageIndx = 0 then
              start_kernel(1);
            else
              start_kernel(0);
            end if;
            
            stageIndx := stageIndx + 1;
            if stageIndx = nStages then
              set_write_cache;
              -- report "cache write set";
            end if;
            wait_to_finish;
            clear_initialize;
            -- if stageIndx = 1 then
            --   start_debug <= '1';
            -- end if;
          end loop;
        -- }}}
        when bitonic => -- {{{
          -- clear_write_cache;
          set_write_cache;
          set_initialize;
          nStages := 0;
          tmp_integer := 1;
          while tmp_integer < problemSize loop
            tmp_integer := tmp_integer * 2;
            nStages := nStages + 1;
          end loop;
          stageIndx := 0;
          passIndx := 0;
          report "problemSize = " & integer'image(problemSize) & ", nStages = " & integer'image(nStages);
          write_param(0, 3); -- direction is decreasing
          while stageIndx /= nStages loop
            -- report "stageIndx = " & integer'image(stageIndx) & ", passIndx = " & integer'image(passIndx);
            if (wg_size mod WF_SIZE ) = 0 then
              update_nWF_WG_sch_ram(wg_size/WF_SIZE-1);
            else
              update_nWF_WG_sch_ram(wg_size/WF_SIZE);
            end if;
            write_sch_ram(SIZE_D0_ADDR, size_d0);
            write_WG_size_dx_sch_ram(nDim, wg_size_d0, wg_size_d1, wg_size_d2);
            update_WG_size_sch_ram(wg_size);
            write_sch_ram(N_WG_D0_ADDR, max(size_d0/wg_size_d0-1, 0));
            write_param(stageIndx, 1);
            write_param(passIndx, 2);
            size_0 <= size_d0;

            if passIndx = 0 and stageIndx = 0 then
              start_kernel(1);
            else
              start_kernel(0);
            end if;

            if passIndx < stageIndx then
              passIndx := passIndx + 1;
            else
              passIndx := 0;
              stageIndx := stageIndx + 1;
              if stageIndx = nStages then
                set_write_cache;
                -- report "cache write set";
              end if;
            end if;
            wait_to_finish;
            clear_initialize;
            if stageIndx = 1 and passIndx = 1 then
              start_debug <= '1';
            end if;
            wait for 50*clk_period;
          end loop;
          -- wait for 100*clk_period;
          -- assert false severity failure;
          if kernel_name = bitonic then
            report "bitonic_kernel finished";
          else
            report "bitonic_kernel_float finished";
          end if;
          -- }}}
        when others => -- {{{
          if (wg_size mod WF_SIZE ) = 0 then
            update_nWF_WG_sch_ram(wg_size/WF_SIZE-1);
          else
            update_nWF_WG_sch_ram(wg_size/WF_SIZE);
          end if;
          -- write_sch_ram(WG_SIZE_DX_ADDR, wg_size);
          write_sch_ram(SIZE_D0_ADDR, size_d0);
          write_sch_ram(SIZE_D1_ADDR, size_d1);
          write_sch_ram(SIZE_D2_ADDR, size_d2);
          write_WG_size_dx_sch_ram(nDim, wg_size_d0, wg_size_d1, wg_size_d2);
          update_WG_size_sch_ram(wg_size);
          write_sch_ram(N_WG_D0_ADDR, max(size_d0/wg_size_d0-1, 0));
          write_sch_ram(N_WG_D1_ADDR, max(size_d1/wg_size_d1-1, 0));
          if kernel_name = max_half_atomic or kernel_name = sum_atomic then
            write_param(REDUCE_FACTOR, 3);
          end if;
          size_0 <= size_d0;
          size_1 <= size_d1;
          set_write_cache;
          start_kernel(1);
          -- clear_initialize;
          wait_to_finish; -- }}}
      end case;
    end loop;
    report "END of simulation" severity failure;
    wait;
  end process; -- }}}
  -- observing the CVs load  ------------------------------------------------------------------------------{{{
  CV_load: if STAT_LOAD = 1 generate
  begin
    busy_calculation: for i in 0 to N_CU-1 generate
    begin
      process(clk)
        alias start_CUs is <<signal .FGPU_tb.uut.start_CUs : std_logic >>;
        alias wf_active is <<signal .FGPU_tb.uut.wf_active : wf_active_array >>;
      begin
        if rising_edge(clk) then
          if  <<signal .FGPU_tb.uut.compute_units_i(i).compute_unit_inst.instr: std_logic_vector >> /= (0 to DATA_W-1 => '0') then
            cycles_busy(i) <= cycles_busy(i) + 1;
          end if;
          if start_CUs = '1' then
            cycles_busy(i) <= 0;
          end if;
        
          if wf_active(i) /= (0 to N_WF_CU-1=>'0') then
            executing(i) <= '1';
          end if;
          if wf_active(i) = (0 to N_WF_CU-1=>'0') then
            executing(i) <= '0';
          end if;
          
          if start_CUs = '1' then
            cycles_total(i) <= 0;
          end if;
          if executing(i) = '1' then
            cycles_total(i) <= cycles_total(i) + 1;
          end if;
        end if;
      end process;
    end  generate;

    process(clk)
      alias start_CUs is <<signal .FGPU_tb.uut.start_CUs : std_logic >>;
      alias finish_exec is << signal .FGPU_tb.uut.finish_exec : std_logic >>;
      variable load_ratio : real_array(N_CU-1 downto 0);
      variable statistics_printed : std_logic := '0';
      variable load_average : real;
      variable std : real;
      variable n_active_CUs: natural;
    begin
      if rising_edge(clk) then
        if start_CUs = '1' then
          statistics_printed := '0';
        end if;


        if finish_exec = '1' and statistics_printed = '0' then
          statistics_printed := '1';
          load_average := 0.0;
          std := 0.0;
          n_active_CUs := 0;
          for i in 0 to N_CU-1 loop
            if cycles_total(i) /= 0 then
              n_active_CUs := n_active_CUs + 1;
              load_ratio(i) := real((cycles_busy(i) * 100)) / real(cycles_total(i));
              load_average := load_average + load_ratio(i);
              std := std + real(load_ratio(i)*load_ratio(i));
              -- report "Average load on CU " & integer'image(i) & " is " & integer'image(integer(round(load_ratio(i)))) & "%";
            end if;
          end loop;
          load_average := load_average / real(n_active_CUs);
          std := sqrt(std/real(n_active_CUs) - load_average*load_average);
          report "Average CU load is " & integer'image(integer(round(load_average))) & "% width stnadard deviation of " & integer'image(integer(round(std))) & "%";
        end if;
      end if;
    end process;

  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -- }}}
END;
