-- libraries --------------------------------------------------------------------------------- {{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
------------------------------------------------------------------------------------------------- }}}
entity FGPU is
-- Generics & ports {{{
port(
  clk                 : in  std_logic;
  -- Contorl Interface - AXI LITE SLAVE {{{
  s0_awaddr           : in std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0);
  s0_awprot           : in std_logic_vector(2 downto 0);
  s0_awvalid          : in std_logic;
  s0_awready          : out std_logic := '0';

  s0_wdata            : in std_logic_vector(DATA_W-1 downto 0);
  s0_wstrb            : in std_logic_vector((DATA_W/8)-1 downto 0);
  s0_wvalid           : in std_logic;
  s0_wready           : out std_logic := '0';

  s0_bresp            : out std_logic_vector(1 downto 0) := (others=>'0');
  s0_bvalid           : out std_logic := '0';
  s0_bready           : in std_logic;

  s0_araddr           : in std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0);
  s0_arprot           : in std_logic_vector(2 downto 0);
  s0_arvalid          : in std_logic;
  s0_arready          : out std_logic := '0';

  s0_rdata            : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  s0_rresp            : out std_logic_vector(1 downto 0) := (others=>'0');
  s0_rvalid           : out std_logic := '0';
  s0_rready           : in std_logic;
  -- }}}
  -- AXI MASTER 0 {{{
  -- ar channel
  m0_araddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  m0_arlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m0_arsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m0_arburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m0_arvalid          : out std_logic := '0';
  m0_arready          : in std_logic;
  m0_arid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
-- r channel
  m0_rdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  m0_rresp            : in std_logic_vector(1 downto 0):= (others=>'0');
  m0_rlast            : in std_logic;
  m0_rvalid           : in std_logic;
  m0_rready           : out std_logic := '0';
  m0_rid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- aw channel
  m0_awaddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  m0_awvalid          : out std_logic := '0';
  m0_awready          : in std_logic;
  m0_awlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m0_awsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m0_awburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m0_awid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  m0_wdata            : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  m0_wstrb            : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  m0_wlast            : out std_logic := '0';
  m0_wvalid           : out std_logic := '0';
  m0_wready           : in std_logic;
  -- b channel
  m0_bvalid           : in std_logic;
  m0_bready           : out std_logic := '0';
  m0_bid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- }}}}
  -- AXI MASTER 1 {{{
  -- ar channel
  m1_araddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  m1_arlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m1_arsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m1_arburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m1_arvalid          : out std_logic := '0';
  m1_arready          : in std_logic;
  m1_arid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  m1_rdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  m1_rresp            : in std_logic_vector(1 downto 0):= (others=>'0');
  m1_rlast            : in std_logic;
  m1_rvalid           : in std_logic;
  m1_rready           : out std_logic := '0';
  m1_rid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- -- aw channel
  m1_awaddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  m1_awvalid          : out std_logic := '0';
  m1_awready          : in std_logic;
  m1_awlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m1_awsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m1_awburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m1_awid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  m1_wdata            : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  m1_wstrb            : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  m1_wlast            : out std_logic := '0';
  m1_wvalid           : out std_logic := '0';
  m1_wready           : in std_logic;
  -- b channel
  m1_bvalid           : in std_logic;
  m1_bready           : out std_logic := '0';
  m1_bid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- }}}}
  -- AXI MASTER 2 {{{
  -- ar channel
  m2_araddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  m2_arlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m2_arsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m2_arburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m2_arvalid          : out std_logic := '0';
  m2_arready          : in std_logic;
  m2_arid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  m2_rdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  m2_rresp            : in std_logic_vector(1 downto 0):= (others=>'0');
  m2_rlast            : in std_logic;
  m2_rvalid           : in std_logic;
  m2_rready           : out std_logic := '0';
  m2_rid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- -- aw channel
  m2_awaddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  m2_awvalid          : out std_logic := '0';
  m2_awready          : in std_logic;
  m2_awlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m2_awsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m2_awburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m2_awid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  m2_wdata            : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  m2_wstrb            : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  m2_wlast            : out std_logic := '0';
  m2_wvalid           : out std_logic := '0';
  m2_wready           : in std_logic;
  -- b channel
  m2_bvalid           : in std_logic;
  m2_bready           : out std_logic := '0';
  m2_bid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- }}}}
  -- AXI MASTER 3 {{{
  -- ar channel
  m3_araddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0):= (others=>'0');
  m3_arlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m3_arsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m3_arburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m3_arvalid          : out std_logic := '0';
  m3_arready          : in std_logic;
  m3_arid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- r channel
  m3_rdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0):= (others=>'0');
  m3_rresp            : in std_logic_vector(1 downto 0):= (others=>'0');
  m3_rlast            : in std_logic;
  m3_rvalid           : in std_logic;
  m3_rready           : out std_logic := '0';
  m3_rid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- -- aw channel
  m3_awaddr           : out std_logic_vector(GMEM_ADDR_W-1 downto 0) := (others=>'0');
  m3_awvalid          : out std_logic := '0';
  m3_awready          : in std_logic;
  m3_awlen            : out std_logic_vector(7 downto 0):= (others=>'0');
  m3_awsize           : out std_logic_vector(2 downto 0):= (others=>'0');
  m3_awburst          : out std_logic_vector(1 downto 0):= (others=>'0');
  m3_awid             : out std_logic_vector(ID_WIDTH-1 downto 0) := (others=>'0');
  -- w channel
  m3_wdata            : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0):= (others=>'0');
  m3_wstrb            : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0):= (others=>'0');
  m3_wlast            : out std_logic := '0';
  m3_wvalid           : out std_logic := '0';
  m3_wready           : in std_logic;
  -- b channel
  m3_bvalid           : in std_logic;
  m3_bready           : out std_logic := '0';
  m3_bid              : in std_logic_vector(ID_WIDTH-1 downto 0);
  -- }}}}
  nrst              : in  std_logic
);
-- ports }}}
end FGPU;
architecture Behavioral of FGPU is
  -- internal signals definitions {{{
  signal s0_awready_i, s0_bvalid_i            : std_logic := '0';
  signal s0_wready_i, s0_arready_i            : std_logic := '0';
  signal nrst_CUs                             : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal nrst_gmem_cntrl                      : std_logic := '0';
  signal nrst_wgDispatcher                    : std_logic := '0';
  -- }}}
  -- slave axi interface {{{
  signal mainProc_we                  : std_logic := '0';
  signal mainProc_wrAddr                : std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0) := (others=>'0');
  signal mainProc_rdAddr                : unsigned(INTERFCE_W_ADDR_W-1 downto 0) := (others=>'0');
  signal s0_rvalid_vec                  : std_logic_vector(3 downto 0) := (others=>'0');
  signal s0_wdata_d0                    : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  -- }}}
  -- general signals definitions {{{
  signal KRNL_SCHEDULER_RAM               : KRNL_SCHEDULER_RAM_type := init_krnl_ram("krnl_ram.mif");
  -- signal cram_b1                          : CRAM_type := init_CRAM("cram_LUdecomposition.mif", 930);
  signal cram_b1                          : CRAM_type := init_CRAM("cram.mif", 3000);

  signal KRNL_SCH_we                      : std_logic := '0';
  signal krnl_sch_rdData                  : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal krnl_sch_rdData_n                : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal krnl_sch_rdAddr                  : unsigned(KRNL_SCH_ADDR_W-1 downto 0) := (others => '0');
  signal krnl_sch_rdAddr_WGD              : std_logic_vector(KRNL_SCH_ADDR_W-1 downto 0) := (others => '0');

  signal CRAM_we                          : std_logic := '0';
  -- signal cram_rdData, cram_rdData_n       : SLV32_ARRAY(CRAM_BLOCKS-1 downto 0) := (others=>(others=>'0'));
  -- signal cram_rdAddr, cram_rdAddr_d0      : CRAM_ADDR_ARRAY(CRAM_BLOCKS-1 downto 0) := (others=>(others=>'0'));
  signal cram_rdData, cram_rdData_n       : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal cram_rdData_vec                  : slv32_array(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  signal cram_rdAddr, cram_rdAddr_d0      : unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  signal cram_rdAddr_d0_vec               : cram_addr_array(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));

  signal status_reg                       : std_logic_vector(DATA_W-1 downto 0) := (others => '0');

  signal regFile_we, regFile_we_d0        : std_logic := '0';
  signal Rstat                            : std_logic_vector(NEW_KRNL_MAX_INDX-1 downto 0) := (others => '0');
  signal Rstart                           : std_logic_vector(NEW_KRNL_MAX_INDX-1 downto 0) := (others => '0');
  signal RcleanCache                      : std_logic_vector(NEW_KRNL_MAX_INDX-1 downto 0) := (others=>'0');
  signal RInitiate                        : std_logic_vector(NEW_KRNL_MAX_INDX-1 downto 0) := (others=>'0');

  type WG_dispatcher_state_type is (idle, st1_dispatch);
  signal st_wg_disp, st_wg_disp_n         : WG_dispatcher_state_type := idle;


  signal new_krnl_indx                    : integer range 0 to NEW_KRNL_MAX_INDX-1 := 0;
  signal new_krnl_field                   : std_logic_vector(NEW_KRNL_DESC_W-1 downto 0) := (others =>'0');

  signal start_kernel, clean_cache        : std_logic := '0';
  signal start_CUs, initialize_d0         : std_logic := '0';   -- informs all CUs to start working after initialization phase of the WG_dispatcher is finished
  signal start_CUs_vec                    : std_logic_vector(max(N_CU-1, 0) downto 0) := (others=>'0'); -- to improve timing
  signal finish_exec                      : std_logic := '0';   -- high when execution of a kernel is done
  signal WGsDispatched                    : std_logic := '0';   -- high when WG_Dispatcher has schedules all WGs
  signal finish_exec_d0                   : std_logic := '0';
  signal finish_krnl_indx                 : integer range 0 to NEW_KRNL_MAX_INDX-1 := 0;
  signal wg_req                           : std_logic_vector(N_CU-1 downto 0) := (others => '0');
  signal wg_ack                           : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  type wg_req_vec_type is array(natural range <>) of std_logic_vector(N_CU-1 downto 0);
  signal wg_req_vec                       : wg_req_vec_type(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  signal wg_ack_vec                       : wg_req_vec_type(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  signal CU_cram_rqst                     : std_logic_vector(N_CU-1 downto 0) := (others => '0');
  signal sch_rqst_n_WFs_m1                : unsigned(N_WF_CU_W-1 downto 0) := (others=>'0');
  type sch_rqst_n_WFs_m1_vec_type is array (natural range <>) of unsigned(N_WF_CU_W-1 downto 0);
  signal sch_rqst_n_WFs_m1_vec            : sch_rqst_n_WFs_m1_vec_type(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  signal cram_served_CUs                  : std_logic := '0'; -- one-bit-toggle to serve different CUs when fetching instructions

  signal CU_cram_rdAddr                   : CRAM_ADDR_ARRay(N_CU-1 downto 0) := (others =>(others=>'0'));
  signal start_addr                       : unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');  -- the address of the first instruction to be fetched
  signal start_addr_vec                   : cram_addr_array(max(N_CU-1, 0) downto 0) := (others=>(others=>'0')); -- just to improve timing


  signal rdData_alu_en                    : alu_en_vec_type(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal rdAddr_alu_en                    : alu_en_rdAddr_type(N_CU-1 downto 0) := (others=>(others=>'0'));

  signal rtm_wrAddr_wg                    : unsigned(RTM_ADDR_W-1 downto 0) := (others => '0');
  type rtm_addr_vec_type is array (natural range<>) of unsigned(RTM_ADDR_W-1 downto 0);
  signal rtm_wrAddr_wg_vec                : rtm_addr_vec_type(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  signal rtm_wrData_wg                    : unsigned(RTM_DATA_W-1 downto 0) := (others => '0');
  signal rtm_wrData_wg_vec                : rtm_ram_type(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  signal rtm_we_wg                        : std_logic := '0';
  signal rtm_we_wg_vec                    : std_logic_vector(max(N_CU-1, 0) downto 0) := (others=>'0');
  signal wg_info                          : unsigned(DATA_W-1 downto 0) := (others=>'0'); 
  signal wg_info_vec                      : slv32_array(max(N_CU-1, 0) downto 0) := (others=>(others=>'0'));
  -- }}}
  -- global memory ---------------------------------------------------- {{{
  -- cache signals 
  function distribute_cache_rd_ports_on_CUs (n_cus: integer) return nat_array is -- {{{
    variable res: nat_array(n_cus-1 downto 0) := (others=>0);
    -- res(0) will have the maximum distance to the global memory controller
  begin
    for i in 0 to n_cus-1 loop
      res(i) := n_cus/2*(i mod 2) + (i/2);
    end loop;
    return res;
  end; -- }}}
  constant cache_rd_port_to_CU            : nat_array(N_CU-1 downto 0) := distribute_cache_rd_ports_on_CUs(N_CU);
  type cache_rdData_vec_type is array(natural range <>) of std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
  signal cache_rdData_vec                 : cache_rdData_vec_type(N_CU downto 0) := (others=>(others=>'0'));
  signal atomic_rdData_vec                : slv32_array(N_CU downto 0) := (others=>(others=>'0'));
  type rdData_v_vec_type is array(natural range <>) of std_logic_vector(N_CU-1 downto 0);
  signal atomic_rdData_v_vec              : rdData_v_vec_type(N_CU downto 0) := (others=>(others=>'0'));
  type atomic_sgntr_vec_type is array(natural range <>) of std_logic_vector(N_CU_STATIONS_W-1 downto 0);
  signal atomic_sgntr_vec                 : atomic_sgntr_vec_type(N_CU downto 0) := (others=>(others=>'0'));
  signal cache_rdAddr_vec                 : GMEM_ADDR_ARRAY_NO_BANK(N_CU downto 0) := (others=>(others=>'0'));
  signal cache_rdAck_vec                  : rdData_v_vec_type(N_CU downto 0) := (others=>(others=>'0'));
  signal cache_rdData_out                 : std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0) := (others=>'0');
  signal cache_rdAddr_out                 : unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0) := (others=>'0');
  signal cache_rdAck_out                  : std_logic_vector(N_CU-1 downto 0) := (others=>'0');

  signal atomic_rdData                    : std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  signal atomic_rdData_v                  : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal atomic_sgntr                     : std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');

  signal cu_gmem_valid, cu_gmem_ready     : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal cu_gmem_we                       : be_array(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal cu_gmem_rnw, cu_gmem_atomic      : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal cu_gmem_atomic_sgntr             : atomic_sgntr_array(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal cu_rqst_addr                     : GMEM_WORD_ADDR_ARRAY(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal cu_gmem_wrData                   : SLV32_ARRAY(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal wf_active                        : wf_active_array(N_CU-1 downto 0) := (others=>(others=>'0'));
  signal CU_gmem_idle                     : std_logic_vector(N_CU-1 downto 0) := (others=>'0');
  signal CUs_gmem_idle                    : std_logic := '0';
  signal axi_araddr                       : GMEM_ADDR_ARRAY(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_arvalid, axi_arready         : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_rdata                        : gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_rlast                        : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_rvalid, axi_rready           : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_awaddr                       : GMEM_ADDR_ARRAY(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_awvalid, axi_awready         : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_wdata                        : gmem_word_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_wstrb                        : gmem_be_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_wlast                        : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_wvalid, axi_wready           : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_bvalid, axi_bready           : std_logic_vector(N_AXI-1 downto 0) := (others=>'0');
  signal axi_arid, axi_rid                : id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  signal axi_awid, axi_bid                : id_array(N_AXI-1 downto 0) := (others=>(others=>'0'));
  --}}}
begin
  -- asserts -------------------------------------------------------------------------------------------{{{
  assert KRNL_SCH_ADDR_W <= CRAM_ADDR_W severity failure; --Code RAM is the biggest block
  assert CRAM_ADDR_W <= INTERFCE_W_ADDR_W-2 severity failure; --there should be two bits to choose among: HW_sch_RAM, CRAM and the register file
  assert DATA_W >= GMEM_ADDR_W report "the width bus between a gmem_ctrl_CV and gmem_ctrl is GMEM_DATA_W" severity failure;
  assert CV_SIZE = 8 or CV_SIZE = 4 severity failure;
  assert 2**N_CU_STATIONS_W >= N_STATIONS_ALU*CV_SIZE report "increase N_STATIONS_W" severity failure;
  assert N_TAG_MANAGERS_W > 0 report "There should be at least two tag managers" severity failure;
  assert DATA_W = 32;
  -- assert CRAM_BLOCKS = 1 or CRAM_BLOCKS = 2;
  -- assert N_AXI = 1 or N_AXI = 2;
  -- assert N_AXI = 1 or N_AXI = 2;
  ---------------------------------------------------------------------------------------------------------}}}
  -- interal signals assignments --------------------------------------------------------------------------{{{
  s0_awready <= s0_awready_i;
  s0_bvalid <= s0_bvalid_i;
  s0_wready <= s0_wready_i;
  s0_arready <= s0_arready_i;
  ---------------------------------------------------------------------------------------------------------}}}
  -- slave axi interface ----------------------------------------------------------------------------------{{{
  -- aw & w channels
  process(clk)
  begin
    if rising_edge(clk) then 
      if nrst = '0' then
        s0_awready_i <= '0';
        s0_wready_i <= '0';
        mainProc_we <= '0';
        mainProc_wrAddr <= (others=>'0');
      else
        if s0_awready_i = '0' and s0_awvalid = '1' and s0_wvalid = '1' then
          s0_awready_i <= '1';
          mainProc_wrAddr <= s0_awaddr;
          s0_wready_i <= '1';
          mainProc_we <= '1';
        else
          s0_awready_i <= '0';
          s0_wready_i <= '0';
          mainProc_we <= '0';
        end if;
      end if;
    end if;
  end process;
  -- b channel
  process(clk)
  begin
    if rising_edge(clk) then 
      if nrst = '0' then
        s0_bvalid_i  <= '0';
      else
        if s0_awready_i = '1' and s0_awvalid = '1' and s0_wready_i = '1' and s0_wvalid = '1' and s0_bvalid_i = '0' then
          s0_bvalid_i <= '1';
        elsif s0_bready = '1' and s0_bvalid_i = '1' then
          s0_bvalid_i <= '0';
        end if;
      end if;
    end if;                   
  end process; 
  -- ar channel
  process(clk)
  begin
    if rising_edge(clk) then 
      -- if nrst = '0' then
      --   s_arready_i <= '0';
      --   mainProc_rdAddr  <= (others=>'0'); 
      -- else
        if s0_arready_i = '0' and s0_arvalid = '1' then
          s0_arready_i <= '1';
          mainProc_rdAddr  <= unsigned(s0_araddr); 
        else
          s0_arready_i <= '0';
        end if;
      -- end if;
    end if;                   
  end process; 
  -- r channel
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        s0_rvalid_vec <= (others=>'0');
        s0_rvalid <= '0';
      else
        s0_rvalid_vec(s0_rvalid_vec'high-1 downto 0) <= s0_rvalid_vec(s0_rvalid_vec'high downto 1);
        if s0_arready_i = '1' and s0_arvalid = '1' and s0_rvalid_vec(s0_rvalid_vec'high) = '0' then
          s0_rvalid_vec(s0_rvalid_vec'high) <= '1';
        else 
          s0_rvalid_vec(s0_rvalid_vec'high) <= '0';
        end if;
        if s0_rvalid_vec(1) = '1' then
          s0_rvalid <= '1';
        end if;
        if s0_rvalid_vec(0) = '1' then
          if s0_rready = '1' then
            s0_rvalid <= '0';
          else
            s0_rvalid_vec(0) <= '1';
          end if;
        end if;            
      end if;
    end if;
  end process;
  process(clk)
  begin
    if rising_edge(clk) then
      if mainProc_rdAddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) = "00" then -- HW_scheduler_ram
        s0_rdata <= krnl_sch_rdData;
      elsif mainProc_rdAddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) = "01" then -- Code_ram
        s0_rdata <= cram_rdData;
        -- s0_rdata <= cram_rdData(0);
      else -- "10", register file
        case mainProc_rdAddr(1 downto 0) is
          when "00" =>
            s0_rdata(NEW_KRNL_MAX_INDX-1 downto 0)  <= Rstat(NEW_KRNL_MAX_INDX-1 downto 0);
          when "10" =>
            s0_rdata(NEW_KRNL_MAX_INDX-1 downto 0)  <= RcleanCache(NEW_KRNL_MAX_INDX-1 downto 0);
          when others =>
            s0_rdata(NEW_KRNL_MAX_INDX-1 downto 0)  <= RInitiate(NEW_KRNL_MAX_INDX-1 downto 0);
        end case;
        s0_rdata(DATA_W-1 downto NEW_KRNL_MAX_INDX) <= (others=>'0');
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- fixed signals --------------------------------------------------------------------------------- {{{
  s0_bresp   <= "00";
  s0_rresp  <= "00";
  ------------------------------------------------------------------------------------------------- }}}
  -- HW Scheduler RAM  ----------------------------------------------------------------------------- {{{
  Krnl_Scheduler: process (clk)
  begin
    if rising_edge(clk) then
      krnl_sch_rdData_n <= KRNL_SCHEDULER_RAM(to_integer(krnl_sch_rdAddr));
      krnl_sch_rdData <= krnl_sch_rdData_n;
      if KRNL_SCH_we = '1' then
        KRNL_SCHEDULER_RAM(to_integer(unsigned(mainProc_wrAddr(KRNL_SCH_ADDR_W-1 downto 0)))) <= s0_wdata_d0;
      end if;
    end if;
  end process;

  krnl_sch_rdAddr <= mainProc_rdAddr(KRNL_SCH_ADDR_W-1 downto 0)  when st_wg_disp = idle else unsigned(krnl_sch_rdAddr_WGD);

  KRNL_SCH_we  <= '1' when mainProc_wrAddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) = "00" and mainProc_we = '1' else '0';
  ------------------------------------------------------------------------------------------------- }}}
  -- Code RAM -------------------------------------------------------------------------------------- {{{
  CRAM_inst: process (clk)
  begin
    if rising_edge(clk) then
      nrst_wgDispatcher <= nrst;
      cram_rdData_n <= cram_b1(to_integer(cram_rdAddr));
      -- cram_rdData_n <= cram_b1(to_integer(cram_rdAddr(0)));
      -- cram_rdData_n(0) <= cram_b1(to_integer(cram_rdAddr(0)));
      if CRAM_we = '1' then
        cram_b1(to_integer(unsigned(mainProc_wrAddr(CRAM_ADDR_W-1 downto 0)))) <= s0_wdata_d0;
      end if;

      -- if CRAM_BLOCKS > 1 then
      --   cram_rdData_n(CRAM_BLOCKS-1) <= cram_b2(to_integer(cram_rdAddr(CRAM_BLOCKS-1)));
      --   if CRAM_we = '1' then
      --     cram_b2(to_integer(unsigned(mainProc_wrAddr(CRAM_ADDR_W-1 downto 0)))) <= s0_wdata_d0;
      --   end if;
      -- end if;
      
      cram_rdData <= cram_rdData_n;

    end if;
  end process;
  CRAM_we     <= '1' when mainProc_wrAddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) = "01" and mainProc_we = '1' else '0';
  process(clk)
  begin
    if rising_edge(clk) then
      cram_rdAddr_d0 <= cram_rdAddr;
      cram_rdAddr <= mainProc_rdAddr(CRAM_ADDR_W-1 downto 0);
      -- cram_rdAddr(0) <= mainProc_rdAddr(CRAM_ADDR_W-1 downto 0);
      cram_served_CUs <= not cram_served_CUs;
      if cram_served_CUs = '0' then
        for i in 0 to max(N_CU/2-1,0) loop
          if CU_cram_rqst(i) = '1' then
            cram_rdAddr <= CU_cram_rdAddr(i);
            -- cram_rdAddr(i mod CRAM_BLOCKS) <= CU_cram_rdAddr(i);
          end if;
        end loop;
      else
        for i in N_CU/2 to N_CU-1 loop
          if CU_cram_rqst(i) = '1' then
            cram_rdAddr <= CU_cram_rdAddr(i);
            -- cram_rdAddr(i mod CRAM_BLOCKS) <= CU_cram_rdAddr(i);
          end if;
        end loop;
      end if;
    end if;
  end process;



  ------------------------------------------------------------------------------------------------- }}}
  -- WG dispatcher -------------------------------------------------------------------------------------- {{{
  WG_dispatcher_inst: entity WG_dispatcher
    port map(
      krnl_indx             => new_krnl_indx,
      start                 => start_kernel,
      initialize_d0         => initialize_d0,
      krnl_sch_rdAddr       => krnl_sch_rdAddr_WGD,
      krnl_sch_rdData       => krnl_sch_rdData,
      finish_krnl_indx      => finish_krnl_indx,

      -- to CUs
      start_exec            => start_CUs,
      req                   => wg_req,
      ack                   => wg_ack,
      rtm_wrAddr            => rtm_wrAddr_wg,
      rtm_wrData            => rtm_wrData_wg,
      rtm_we                => rtm_we_wg,
      sch_rqst_n_WFs_m1     => sch_rqst_n_WFs_m1,
      finish                => WGsDispatched,
      start_addr            => start_addr,
      rdData_alu_en         => rdData_alu_en,
      wg_info               => wg_info,
      -- from CUs
      wf_active             => wf_active,
      rdAddr_alu_en         => rdAddr_alu_en,


      clk                   => clk,
      nrst                  => nrst_wgDispatcher
  );
  ------------------------------------------------------------------------------------------------- }}}
  -- compute units  -------------------------------------------------------------------------------------- {{{
  compute_units_i: for i in 0 to N_CU-1 generate 
  begin
    compute_unit_inst: entity compute_unit
    port map(
      clk                   => clk,
      wf_active             => wf_active(i),
      WGsDispatched         => WGsDispatched,
      nrst                  => nrst_CUs(i),
      cram_rdAddr           => CU_cram_rdAddr(i),      
      cram_rdData           => cram_rdData_vec(i),
      -- cram_rdData           => cram_rdData(i mod CRAM_BLOCKS),
      cram_rqst             => CU_cram_rqst(i),
      cram_rdAddr_conf      => cram_rdAddr_d0_vec(i),
      -- cram_rdAddr_conf      => cram_rdAddr_d0(i mod CRAM_BLOCKS),
      start_addr            => start_addr_vec(i),

      start_CUs             => start_CUs_vec(i),
      sch_rqst_n_wfs_m1     => sch_rqst_n_WFs_m1_vec(i),
      sch_rqst              => wg_req_vec(i)(i),
      sch_ack               => wg_ack(i),
      wg_info               => unsigned(wg_info_vec(i)),
      rtm_wrAddr_wg         => rtm_wrAddr_wg_vec(i),
      rtm_wrData_wg         => rtm_wrData_wg_vec(i),
      rtm_we_wg             => rtm_we_wg_vec(i),
      rdData_alu_en         => rdData_alu_en(i),
      rdAddr_alu_en         => rdAddr_alu_en(i),

      gmem_valid            => cu_gmem_valid(i),
      gmem_we               => cu_gmem_we(i),
      gmem_rnw              => cu_gmem_rnw(i),
      gmem_atomic           => cu_gmem_atomic(i),
      gmem_atomic_sgntr     => cu_gmem_atomic_sgntr(i),
      gmem_rqst_addr        => cu_rqst_addr(i),
      gmem_ready            => cu_gmem_ready(i),
      gmem_wrData           => cu_gmem_wrData(i),
      --cache read data
      cache_rdAddr          => cache_rdAddr_vec(cache_rd_port_to_CU(i)),
      cache_rdAck           => cache_rdAck_vec(cache_rd_port_to_CU(i))(i),
      cache_rdData          => cache_rdData_vec(cache_rd_port_to_CU(i)),
      atomic_rdData         => atomic_rdData_vec(cache_rd_port_to_CU(i)),
      atomic_rdData_v       => atomic_rdData_v_vec(cache_rd_port_to_CU(i))(i),
      atomic_sgntr          => atomic_sgntr_vec(cache_rd_port_to_CU(i)),

      gmem_cntrl_idle       => CU_gmem_idle(i)

      -- loc_mem_rdAddr_dummy => loc_mem_rdAddr_dummy(DATA_W*(i+1)-1 downto i*DATA_W)
      );
  end generate;
  process(clk)
  begin
    if rising_edge(clk) then
      cache_rdAck_vec(cache_rdAck_vec'high) <= cache_rdAck_out;
      cache_rdAck_vec(cache_rdAck_vec'high-1 downto 0) <= cache_rdAck_vec(cache_rdAck_vec'high downto 1);
      cache_rdAddr_vec(cache_rdAddr_vec'high) <= cache_rdAddr_out;
      cache_rdAddr_vec(cache_rdAddr_vec'high-1 downto 0) <= cache_rdAddr_vec(cache_rdAddr_vec'high downto 1);
      cache_rdData_vec(cache_rdData_vec'high) <= cache_rdData_out;
      cache_rdData_vec(cache_rdData_vec'high-1 downto 0) <= cache_rdData_vec(cache_rdData_vec'high downto 1);
      atomic_rdData_vec(atomic_rdData_vec'high) <= atomic_rdData;
      atomic_rdData_vec(atomic_rdData_vec'high-1 downto 0) <= atomic_rdData_vec(atomic_rdData_vec'high downto 1);
      atomic_rdData_v_vec(atomic_rdData_v_vec'high) <= atomic_rdData_v;
      atomic_rdData_v_vec(atomic_rdData_vec'high -1 downto 0) <= atomic_rdData_v_vec(atomic_rdData_v_vec'high downto 1);
      atomic_sgntr_vec(atomic_sgntr_vec'high) <= atomic_sgntr;
      atomic_sgntr_vec(atomic_sgntr_vec'high-1 downto 0) <= atomic_sgntr_vec(atomic_sgntr_vec'high downto 1);
      start_addr_vec(start_addr_vec'high) <= start_addr;
      start_addr_vec(start_addr_vec'high-1 downto 0) <= start_addr_vec(start_addr_vec'high downto 1);
      start_CUs_vec(start_CUs_vec'high) <= start_CUs;
      wg_req_vec(wg_req_vec'high) <= wg_req;
      wg_info_vec(wg_info_vec'high) <= std_logic_vector(wg_info);
      rtm_we_wg_vec(rtm_we_wg_vec'high) <= rtm_we_wg;
      sch_rqst_n_WFs_m1_vec(sch_rqst_n_WFs_m1_vec'high) <= sch_rqst_n_WFs_m1;
      rtm_wrData_wg_vec(rtm_wrData_wg_vec'high) <= rtm_wrData_wg;
      rtm_wrAddr_wg_vec(rtm_wrAddr_wg_vec'high) <= rtm_wrAddr_wg;
      cram_rdData_vec(cram_rdData_vec'high) <= cram_rdData;
      cram_rdAddr_d0_vec(cram_rdAddr_d0_vec'high) <= cram_rdAddr_d0;
      if N_CU > 1 then
        start_CUs_vec(start_CUs_vec'high-1 downto 0) <= start_CUs_vec(start_CUs_vec'high downto 1);
        wg_req_vec(wg_req_vec'high-1 downto 0) <= wg_req_vec(wg_req_vec'high downto 1);
        -- wg_ack_vec(wg_ack_vec'high-1 downto 0) <= wg_ack_vec(wg_ack_vec'high downto 1);
        wg_info_vec(wg_info_vec'high-1 downto 0) <= wg_info_vec(wg_info_vec'high downto 1);
        rtm_wrAddr_wg_vec(rtm_wrAddr_wg_vec'high-1 downto 0) <= rtm_wrAddr_wg_vec(rtm_wrAddr_wg_vec'high downto 1);
        rtm_wrData_wg_vec(rtm_wrData_wg_vec'high-1 downto 0) <= rtm_wrData_wg_vec(rtm_wrData_wg_vec'high downto 1);
        rtm_we_wg_vec(rtm_we_wg_vec'high-1 downto 0) <= rtm_we_wg_vec(rtm_we_wg_vec'high downto 1);
        sch_rqst_n_WFs_m1_vec(sch_rqst_n_WFs_m1_vec'high-1 downto 0) <= sch_rqst_n_WFs_m1_vec(sch_rqst_n_WFs_m1_vec'high downto 1);
        cram_rdData_vec(cram_rdData_vec'high-1 downto 0) <= cram_rdData_vec(cram_rdData_vec'high downto 1);
        cram_rdAddr_d0_vec(cram_rdAddr_d0_vec'high-1 downto 0) <= cram_rdAddr_d0_vec(cram_rdAddr_d0_vec'high downto 1);
      end if;
      for i in 0 to N_CU-1 loop
        nrst_CUs(i) <= nrst;
      end loop;
    end if;
  end process;
  process(clk)
  begin
    if rising_edge(clk) then
      if to_integer(unsigned(CU_gmem_idle)) = 2**N_CU-1 then
        CUs_gmem_idle <= '1';
      else
        CUs_gmem_idle <= '0';
      end if;
    end if;
  end process;
  ------------------------------------------------------------------------------------------------- }}}
  -- global memory controller----------------------------------------------------------------------------------- {{{
  gmem_controller_inst: entity gmem_cntrl 
  port map(
    clk               => clk,
    cu_valid          => cu_gmem_valid,
    cu_ready          => cu_gmem_ready,
    cu_we             => cu_gmem_we,
    cu_rnw            => cu_gmem_rnw,
    cu_atomic         => cu_gmem_atomic,
    cu_atomic_sgntr   => cu_gmem_atomic_sgntr,
    cu_rqst_addr      => cu_rqst_addr,
    cu_wrData         => cu_gmem_wrData,
    WGsDispatched     => WGsDispatched,
    finish_exec       => finish_exec,
    start_kernel      => start_kernel,
    clean_cache       => clean_cache,
    CUs_gmem_idle     => CUs_gmem_idle,

    -- read data from cache
    rdAck             => cache_rdAck_out,
    rdAddr            => cache_rdAddr_out,
    rdData            => cache_rdData_out,

    atomic_rdData     => atomic_rdData,
    atomic_rdData_v   => atomic_rdData_v,
    atomic_sgntr      => atomic_sgntr,
    -- read axi bus {{{
    --    ar channel
    axi_araddr        => axi_araddr,
    axi_arvalid       => axi_arvalid,
    axi_arready       => axi_arready,
    axi_arid          => axi_arid,
    --    r channel
    axi_rdata         => axi_rdata,
    axi_rlast         => axi_rlast,
    axi_rvalid        => axi_rvalid,
    axi_rready        => axi_rready,
    axi_rid           => axi_rid,
    --    aw channel
    axi_awaddr        => axi_awaddr,
    axi_awvalid       => axi_awvalid,
    axi_awready       => axi_awready,
    axi_awid          => axi_awid,
    --    w channel
    axi_wdata         => axi_wdata,
    axi_wstrb         => axi_wstrb,
    axi_wlast         => axi_wlast,
    axi_wvalid        => axi_wvalid,
    axi_wready        => axi_wready,
    -- b channel
    axi_bvalid        => axi_bvalid,
    axi_bready        => axi_bready,
    axi_bid           => axi_bid,
    --}}}
    nrst              => nrst_gmem_cntrl
  );
  -- fixed signals assignments {{{
  m0_arlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m0_arlen'length));
  m1_arlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m1_arlen'length));
  m2_arlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m2_arlen'length));
  m3_arlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m3_arlen'length));
  m0_arsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m1_arsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m2_arsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m3_arsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m0_arburst  <= "01"; --INCR burst type
  m1_arburst  <= "01"; --INCR burst type
  m2_arburst  <= "01"; --INCR burst type
  m3_arburst  <= "01"; --INCR burst type
  m0_awlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m0_awlen'length));
  m1_awlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m1_awlen'length));
  m2_awlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m2_awlen'length));
  m3_awlen <= std_logic_vector(to_unsigned((2**BURST_W)-1, m3_awlen'length));
  m0_awsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m1_awsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m2_awsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m3_awsize <= std_logic_vector(to_unsigned(2+GMEM_N_BANK_W, 3)); -- in 2^n bytes,
  m0_awburst  <= "01"; --INCR burst type
  m1_awburst  <= "01"; --INCR burst type
  m2_awburst  <= "01"; --INCR burst type
  m3_awburst  <= "01"; --INCR burst type
  --}}}
  -- ar & r assignments {{{
  m0_araddr <= std_logic_vector(axi_araddr(0));
  m0_arvalid <= axi_arvalid(0);
  axi_arready(0) <= m0_arready;
  axi_rdata(0) <= m0_rdata;
  axi_rlast(0) <= m0_rlast;
  axi_rvalid(0) <= m0_rvalid;
  axi_rid(0) <= m0_rid;
  axi_bid(0) <= m0_bid;
  m0_awid <= axi_awid(0);
  m0_rready <= axi_rready(0);
  m0_arid <= axi_arid(0);
  AXI_READ_1: if N_AXI > 1 generate
    m1_araddr <= std_logic_vector(axi_araddr(1));
    m1_arvalid <= axi_arvalid(1);
    axi_arready(1) <= m1_arready;
    axi_rdata(1) <= m1_rdata;
    axi_rlast(1) <= m1_rlast;
    axi_rvalid(1) <= m1_rvalid;
    axi_rid(1) <= m1_rid;
    axi_bid(1) <= m1_bid;
    m1_awid <= axi_awid(1);
    m1_rready <= axi_rready(1);
    m1_arid <= axi_arid(1);
  end generate;
  AXI_READ_2: if N_AXI > 2 generate
    m2_araddr <= std_logic_vector(axi_araddr(2));
    m2_arvalid <= axi_arvalid(2);
    axi_arready(2) <= m2_arready;
    axi_rdata(2) <= m2_rdata;
    axi_rlast(2) <= m2_rlast;
    axi_rvalid(2) <= m2_rvalid;
    axi_rid(2) <= m2_rid;
    axi_bid(2) <= m2_bid;
    m2_awid <= axi_awid(2);
    m2_rready <= axi_rready(2);
    m2_arid <= axi_arid(2);
  end generate;
  AXI_READ_3: if N_AXI > 3 generate
    m3_araddr <= std_logic_vector(axi_araddr(3));
    m3_arvalid <= axi_arvalid(3);
    axi_arready(3) <= m3_arready;
    axi_rdata(3) <= m3_rdata;
    axi_rlast(3) <= m3_rlast;
    axi_rvalid(3) <= m3_rvalid;
    axi_rid(3) <= m3_rid;
    axi_bid(3) <= m3_bid;
    m3_awid <= axi_awid(3);
    m3_rready <= axi_rready(3);
    m3_arid <= axi_arid(3);
  end generate;
  -- }}}
  -- aw, w & b assignments {{{
  m0_awaddr <= std_logic_vector(axi_awaddr(0));
  m0_awvalid <= axi_awvalid(0);
  axi_awready(0) <= m0_awready;
  m0_wdata <= axi_wdata(0);
  m0_wstrb <= axi_wstrb(0);
  m0_wlast <= axi_wlast(0);
  m0_wvalid <= axi_wvalid(0);
  axi_wready(0) <= m0_wready;
  axi_bvalid(0) <= m0_bvalid;
  m0_bready <= axi_bready(0);
  AXI_WRITE_1: if N_AXI > 1 generate
    m1_awaddr <= std_logic_vector(axi_awaddr(1));
    m1_awvalid <= axi_awvalid(1);
    axi_awready(1) <= m1_awready;
    m1_wdata <= axi_wdata(1);
    m1_wstrb <= axi_wstrb(1);
    m1_wlast <= axi_wlast(1);
    m1_wvalid <= axi_wvalid(1);
    axi_wready(1) <= m1_wready;
    axi_bvalid(1) <= m1_bvalid;
    m1_bready <= axi_bready(1);
  end generate;
  AXI_WRITE_2: if N_AXI > 2 generate
    m2_awaddr <= std_logic_vector(axi_awaddr(2));
    m2_awvalid <= axi_awvalid(2);
    axi_awready(2) <= m2_awready;
    m2_wdata <= axi_wdata(2);
    m2_wstrb <= axi_wstrb(2);
    m2_wlast <= axi_wlast(2);
    m2_wvalid <= axi_wvalid(2);
    axi_wready(2) <= m2_wready;
    axi_bvalid(2) <= m2_bvalid;
    m2_bready <= axi_bready(2);
  end generate;
  AXI_WRITE_3: if N_AXI > 3 generate
    m3_awaddr <= std_logic_vector(axi_awaddr(3));
    m3_awvalid <= axi_awvalid(3);
    axi_awready(3) <= m3_awready;
    m3_wdata <= axi_wdata(3);
    m3_wstrb <= axi_wstrb(3);
    m3_wlast <= axi_wlast(3);
    m3_wvalid <= axi_wvalid(3);
    axi_wready(3) <= m3_wready;
    axi_bvalid(3) <= m3_bvalid;
    m3_bready <= axi_bready(3);
  end generate;
  -- }}}
  ------------------------------------------------------------------------------------------------- }}}
  -- WG dispatcher FSM -------------------------------------------------------------------------------------- {{{
  regFile_we <= '1' when mainProc_wrAddr(INTERFCE_W_ADDR_W-1 downto INTERFCE_W_ADDR_W-2) = "10" and mainProc_we = '1' else '0';
  regs_trans: process(clk)
  begin
    if rising_edge(clk) then
      nrst_gmem_cntrl <= nrst;
      if start_kernel = '1' then
        clean_cache <= RcleanCache(new_krnl_indx);
        initialize_d0 <= RInitiate(new_krnl_indx);
      end if;
      s0_wdata_d0 <= s0_wdata;
      finish_exec_d0 <= finish_exec;
      
      if nrst = '0' then
        st_wg_disp <= idle;
        Rstat <= (others =>'0');
        RcleanCache <= (others=>'0');
        Rstart <= (others =>'0');
        RInitiate <= (others=>'0');
      else
        st_wg_disp <= st_wg_disp_n;
        -- regFile_we_d0 <= regFile_we;

        if start_kernel = '1' then
          Rstart(new_krnl_indx) <= '0';
        elsif regFile_we = '1' and to_integer(unsigned(mainProc_wrAddr(N_REG_W-1 downto 0))) = Rstart_regFile_addr then
          Rstart <= s0_wdata_d0(NEW_KRNL_MAX_INDX-1 downto 0);
        end if;

        if regFile_we = '1' and to_integer(unsigned(mainProc_wrAddr(N_REG_W-1 downto 0))) = RcleanCache_regFile_addr then
          RcleanCache <= s0_wdata_d0(NEW_KRNL_MAX_INDX-1 downto 0);
        end if;
        if regFile_we = '1' and to_integer(unsigned(mainProc_wrAddr(N_REG_W-1 downto 0))) = RInitiate_regFile_addr then
          RInitiate <= s0_wdata_d0(NEW_KRNL_MAX_INDX-1 downto 0);
        end if;

        if start_kernel = '1' then
          Rstat(new_krnl_indx) <= '0';
        elsif finish_exec = '1' and finish_exec_d0 = '0' then
          Rstat(finish_krnl_indx) <= '1';
        end if;
      end if;
    end if;
  end process;

  process(Rstart)
  begin
    new_krnl_indx <= 0;
    for i in NEW_KRNL_MAX_INDX-1 downto 0 loop
      if Rstart(i) = '1' then
        new_krnl_indx <= i;
      end if;
    end loop;
  end process;

  start_kernel <= '1' when st_wg_disp_n = st1_dispatch and st_wg_disp = idle else '0';

  process(st_wg_disp, finish_exec, Rstart)
  begin
    st_wg_disp_n <= st_wg_disp;
    case(st_wg_disp) is
      when idle   =>
        if to_integer(unsigned(Rstart)) /= 0 then --new kernel to start
          st_wg_disp_n <= st1_dispatch;
        end if;
      when st1_dispatch =>
        if finish_exec = '1' then -- kernel is dispatched
          st_wg_disp_n <= idle;
        end if;
    end case;
  end process;
  ------------------------------------------------------------------------------------------------- }}}
end Behavioral;

