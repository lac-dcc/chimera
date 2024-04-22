library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library fgpu;
use fgpu.definitions.all;

package components is

  component fgpu_top
    port(
      clk  : in  std_logic;
      nrst : in  std_logic;

      s_awaddr  : in std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0);
      s_awprot  : in std_logic_vector(2 downto 0);
      s_awvalid : in std_logic;
      s_awready : out std_logic;
      s_wdata   : in std_logic_vector(DATA_W-1 downto 0);
      s_wstrb   : in std_logic_vector((DATA_W/8)-1 downto 0);
      s_wvalid  : in std_logic;
      s_wready  : out std_logic;
      s_bresp   : out std_logic_vector(1 downto 0);
      s_bvalid  : out std_logic;
      s_bready  : in std_logic;
      s_araddr  : in std_logic_vector(INTERFCE_W_ADDR_W-1 downto 0);
      s_arprot  : in std_logic_vector(2 downto 0);
      s_arvalid : in std_logic;
      s_arready : out std_logic;
      s_rdata   : out std_logic_vector(DATA_W-1 downto 0);
      s_rresp   : out std_logic_vector(1 downto 0);
      s_rvalid  : out std_logic;
      s_rready  : in std_logic;

      m0_araddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m0_arlen   : out std_logic_vector(7 downto 0);
      m0_arsize  : out std_logic_vector(2 downto 0);
      m0_arburst : out std_logic_vector(1 downto 0);
      m0_arvalid : out std_logic;
      m0_arready : in std_logic;
      m0_arid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m0_rdata   : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m0_rresp   : in std_logic_vector(1 downto 0);
      m0_rlast   : in std_logic;
      m0_rvalid  : in std_logic;
      m0_rready  : out std_logic;
      m0_rid     : in std_logic_vector(ID_WIDTH-1 downto 0);
      m0_awaddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m0_awvalid : out std_logic;
      m0_awready : in std_logic;
      m0_awlen   : out std_logic_vector(7 downto 0);
      m0_awsize  : out std_logic_vector(2 downto 0);
      m0_awburst : out std_logic_vector(1 downto 0);
      m0_awid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m0_wdata   : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0);
      m0_wstrb   : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0);
      m0_wlast   : out std_logic;
      m0_wvalid  : out std_logic;
      m0_wready  : in std_logic;
      m0_bvalid  : in std_logic;
      m0_bready  : out std_logic;
      m0_bid     : in std_logic_vector(ID_WIDTH-1 downto 0);

      m1_araddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m1_arlen   : out std_logic_vector(7 downto 0);
      m1_arsize  : out std_logic_vector(2 downto 0);
      m1_arburst : out std_logic_vector(1 downto 0);
      m1_arvalid : out std_logic;
      m1_arready : in std_logic;
      m1_arid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m1_rdata   : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m1_rresp   : in std_logic_vector(1 downto 0);
      m1_rlast   : in std_logic;
      m1_rvalid  : in std_logic;
      m1_rready  : out std_logic;
      m1_rid     : in std_logic_vector(ID_WIDTH-1 downto 0);
      m1_awaddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m1_awvalid : out std_logic;
      m1_awready : in std_logic;
      m1_awlen   : out std_logic_vector(7 downto 0);
      m1_awsize  : out std_logic_vector(2 downto 0);
      m1_awburst : out std_logic_vector(1 downto 0);
      m1_awid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m1_wdata   : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0);
      m1_wstrb   : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0);
      m1_wlast   : out std_logic;
      m1_wvalid  : out std_logic;
      m1_wready  : in std_logic;
      m1_bvalid  : in std_logic;
      m1_bready  : out std_logic;
      m1_bid     : in std_logic_vector(ID_WIDTH-1 downto 0);

      m2_araddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m2_arlen   : out std_logic_vector(7 downto 0);
      m2_arsize  : out std_logic_vector(2 downto 0);
      m2_arburst : out std_logic_vector(1 downto 0);
      m2_arvalid : out std_logic;
      m2_arready : in std_logic;
      m2_arid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m2_rdata   : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m2_rresp   : in std_logic_vector(1 downto 0);
      m2_rlast   : in std_logic;
      m2_rvalid  : in std_logic;
      m2_rready  : out std_logic;
      m2_rid     : in std_logic_vector(ID_WIDTH-1 downto 0);
      m2_awaddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m2_awvalid : out std_logic;
      m2_awready : in std_logic;
      m2_awlen   : out std_logic_vector(7 downto 0);
      m2_awsize  : out std_logic_vector(2 downto 0);
      m2_awburst : out std_logic_vector(1 downto 0);
      m2_awid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m2_wdata   : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0);
      m2_wstrb   : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0);
      m2_wlast   : out std_logic;
      m2_wvalid  : out std_logic;
      m2_wready  : in std_logic;
      m2_bvalid  : in std_logic;
      m2_bready  : out std_logic;
      m2_bid     : in std_logic_vector(ID_WIDTH-1 downto 0);

      m3_araddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m3_arlen   : out std_logic_vector(7 downto 0);
      m3_arsize  : out std_logic_vector(2 downto 0);
      m3_arburst : out std_logic_vector(1 downto 0);
      m3_arvalid : out std_logic;
      m3_arready : in std_logic;
      m3_arid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m3_rdata   : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m3_rresp   : in std_logic_vector(1 downto 0);
      m3_rlast   : in std_logic;
      m3_rvalid  : in std_logic;
      m3_rready  : out std_logic;
      m3_rid     : in std_logic_vector(ID_WIDTH-1 downto 0);
      m3_awaddr  : out std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m3_awvalid : out std_logic;
      m3_awready : in std_logic;
      m3_awlen   : out std_logic_vector(7 downto 0);
      m3_awsize  : out std_logic_vector(2 downto 0);
      m3_awburst : out std_logic_vector(1 downto 0);
      m3_awid    : out std_logic_vector(ID_WIDTH-1 downto 0);
      m3_wdata   : out std_logic_vector(DATA_W*GMEM_N_BANK-1 downto 0);
      m3_wstrb   : out std_logic_vector(DATA_W*GMEM_N_BANK/8-1 downto 0);
      m3_wlast   : out std_logic;
      m3_wvalid  : out std_logic;
      m3_wready  : in std_logic;
      m3_bvalid  : in std_logic;
      m3_bready  : out std_logic;
      m3_bid     : in std_logic_vector(ID_WIDTH-1 downto 0)
    );
  end component;

  component div_unit
    port(
      clk, nrst        : in std_logic;

      div_a, div_b     : in std_logic_vector(DATA_W-1 downto 0);
      div_valid        : in std_logic;
      code             : in std_logic_vector(CODE_W-1 downto 0);

      res_div          : out std_logic_vector(DATA_W-1 downto 0)
    );
  end component;

  component float_units
    port(
      clk, nrst        : in std_logic;

      float_a, float_b : in SLV32_ARRAY(CV_SIZE-1 downto 0);
      fsub             : in std_logic;
      res_float        : out SLV32_ARRAY(CV_SIZE-1 downto 0);
      code             : in std_logic_vector(CODE_W-1 downto 0)
    );
  end component;

  component gmem_atomics
    port(
      clk, nrst           : in std_logic;
      rcv_atomic_type     : in be_array(N_RECEIVERS-1 downto 0);
      rcv_atomic_rqst     : in std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_gmem_addr       : in gmem_word_addr_array(N_RECEIVERS-1 downto 0);
      rcv_gmem_data       : in SLV32_ARRAY(N_RECEIVERS-1 downto 0);
      rcv_must_read       : out std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_atomic_ack      : out std_logic_vector(N_RECEIVERS-1 downto 0);
      gmem_rdAddr_p0      : in unsigned(GMEM_WORD_ADDR_W-N-1 downto 0);
      gmem_rdData         : in std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
      gmem_rdData_v_p0    : in std_logic;
      atomic_rdData       : out std_logic_vector(DATA_W-1 downto 0);
      rcv_retire          : out std_logic_vector(N_RECEIVERS-1 downto 0);
      flush_v             : out std_logic;
      flush_gmem_addr     : out unsigned(GMEM_WORD_ADDR_W-1 downto 0);
      flush_data          : out std_logic_vector(DATA_W-1 downto 0);
      flush_ack           : in std_logic;
      flush_done          : in std_logic;
      finish              : in std_logic;
      atomic_can_finish   : out std_logic;
      WGsDispatched       : in std_logic
    );
  end component;

  component gmem_cntrl_tag
    port(
      clk, nrst                 : in std_logic;
      wr_fifo_free              : in std_logic_vector(N_WR_FIFOS-1 downto 0);
      wr_fifo_go                : out std_logic_vector(N_WR_FIFOS-1 downto 0);
      wr_fifo_cache_ack         : in std_logic_vector(N_WR_FIFOS-1 downto 0);
      axi_rdAddr                : out gmem_addr_array_no_bank(N_WR_FIFOS-1 downto 0);
      axi_writer_go             : out std_logic_vector(N_AXI-1 downto 0);
      axi_wrAddr                : out gmem_addr_array_no_bank(N_AXI-1 downto 0);
      axi_writer_free           : in std_logic_vector(N_AXI-1 downto 0);
      axi_rd_fifo_filled        : in std_logic_vector(N_AXI-1 downto 0);
      axi_wvalid                : in std_logic_vector(N_AXI-1 downto 0);
      axi_writer_ack            : in std_logic_vector(N_TAG_MANAGERS-1 downto 0);
      axi_writer_id             : out std_logic_vector(N_TAG_MANAGERS_W-1 downto 0);
      rcv_alloc_tag             : in std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_gmem_addr             : in gmem_word_addr_array(N_RECEIVERS-1 downto 0);
      rcv_rnw                   : in std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_tag_written           : out std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_tag_updated           : out std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_page_validated        : out std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_read_tag              : in std_logic_vector(N_RECEIVERS-1 downto 0);
      rcv_read_tag_ack          : out std_logic_vector(N_RECEIVERS-1 downto 0);
      rdData_page_v             : out std_logic_vector(N_RD_PORTS-1 downto 0);
      rdData_tag_v              : out std_logic_vector(N_RD_PORTS-1 downto 0);
      rdData_tag                : out tag_array(N_RD_PORTS-1 downto 0);
      cache_we                  : in std_logic;
      cache_addra               : in unsigned(M+L-1 downto 0);
      cache_wea                 : in std_logic_vector((2**N)*DATA_W/8-1 downto 0);
      WGsDispatched             : in std_logic;
      CUs_gmem_idle             : in std_logic;
      rcv_all_idle              : in std_logic;
      rcv_idle                  : in std_logic_vector(N_RECEIVERS-1 downto 0);
      finish_exec               : out std_logic;
      start_kernel              : in std_logic;
      clean_cache               : in std_logic;
      atomic_can_finish         : in std_logic;
      write_pipe_active         : in std_logic_vector(4 downto 0);
      write_pipe_wrTag          : in tag_addr_array(4 downto 0);
      debug_cache_miss_counter  : out unsigned(DATA_W-1 downto 0);
      debug_reset_all_counters  : in std_logic
    );
  end component;

  component gmem_cntrl
    port(
      clk                       : in std_logic;
      start_kernel              : in std_logic;
      clean_cache               : in std_logic;
      WGsDispatched             : in std_logic;
      CUs_gmem_idle             : in std_logic;
      finish_exec               : out std_logic;

      cu_valid                  : in std_logic_vector(N_CU-1 downto 0);
      cu_ready                  : out std_logic_vector(N_CU-1 downto 0);
      cu_we                     : in be_array(N_CU-1 downto 0);
      cu_rnw, cu_atomic         : in std_logic_vector(N_CU-1 downto 0);
      cu_atomic_sgntr           : in atomic_sgntr_array(N_CU-1 downto 0);
      cu_rqst_addr              : in GMEM_WORD_ADDR_ARRAY(N_CU-1 downto 0);
      cu_wrData                 : in SLV32_ARRAY(N_CU-1 downto 0);

      rdAck                     : out std_logic_vector(N_CU-1 downto 0);
      rdAddr                    : out unsigned(GMEM_WORD_ADDR_W-1-CACHE_N_BANKS_W downto 0);
      rdData                    : out std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
      atomic_rdData             : out std_logic_vector(DATA_W-1 downto 0);
      atomic_rdData_v           : out std_logic_vector(N_CU-1 downto 0);
      atomic_sgntr              : out std_logic_vector(N_CU_STATIONS_W-1 downto 0);


      axi_araddr                : out GMEM_ADDR_ARRAY(N_AXI-1 downto 0);
      axi_arvalid               : out std_logic_vector(N_AXI-1 downto 0);
      axi_arready               : in std_logic_vector(N_AXI-1 downto 0);
      axi_arid                  : out id_array(N_AXI-1 downto 0);

      axi_rdata                 : in gmem_word_array(N_AXI-1 downto 0);
      axi_rlast                 : in std_logic_vector(N_AXI-1 downto 0);
      axi_rvalid                : in std_logic_vector(N_AXI-1 downto 0);
      axi_rready                : out std_logic_vector(N_AXI-1 downto 0);
      axi_rid                   : in id_array(N_AXI-1 downto 0);

      axi_awaddr                : out GMEM_ADDR_ARRAY(N_AXI-1 downto 0);
      axi_awvalid               : out std_logic_vector(N_AXI-1 downto 0);
      axi_awready               : in std_logic_vector(N_AXI-1 downto 0);
      axi_awid                  : out id_array(N_AXI-1 downto 0);

      axi_wdata                 : out gmem_word_array(N_AXI-1 downto 0);
      axi_wstrb                 : out gmem_be_array(N_AXI-1 downto 0);
      axi_wlast                 : out std_logic_vector(N_AXI-1 downto 0);
      axi_wvalid                : out std_logic_vector(N_AXI-1 downto 0);
      axi_wready                : in std_logic_vector(N_AXI-1 downto 0);

      axi_bvalid                : in std_logic_vector(N_AXI-1 downto 0);
      axi_bready                : out std_logic_vector(N_AXI-1 downto 0);
      axi_bid                   : in id_array(N_AXI-1 downto 0);


      debug_cache_miss_counter  : out unsigned(DATA_W-1 downto 0);
      debug_reset_all_counters  : in std_logic;

      nrst                      : in std_logic
    );
  end component;

  component init_alu_en_ram
    generic(
      N_RD_PORTS          : natural
    );
    port(
      start               : in std_logic;
      finish              : out std_logic;
      clear_finish        : in std_logic;
      wg_size             : in unsigned(N_WF_CU_W+WF_SIZE_W downto 0);
      sch_rqst_n_WFs_m1   : in unsigned(N_WF_CU_W-1 downto 0);
      rdData_alu_en       : out alu_en_vec_type(N_RD_PORTS-1 downto 0);
      rdAddr_alu_en       : in alu_en_rdAddr_type(N_RD_PORTS-1 downto 0);
      clk, nrst           : in std_logic
    );
  end component;

  component lmem
    port (
      clk                 : in std_logic;
      rqst, we            : in std_logic;
      alu_en              : in std_logic_vector(CV_SIZE-1 downto 0);
      wrData              : in SLV32_ARRAY(CV_SIZE-1 downto 0);
      rdData              : out SLV32_ARRAY(CV_SIZE-1 downto 0);
      rdData_v            : out std_logic;
      rdData_rd_addr      : out unsigned(REG_FILE_W-1 downto 0);
      rdData_alu_en       : out std_logic_vector(CV_SIZE-1 downto 0);
      sp                  : in unsigned(LMEM_ADDR_W-N_WF_CU_W-PHASE_W-1 downto 0);
      rd_addr             : in unsigned(REG_FILE_W-1 downto 0);
      nrst                : in std_logic
    );
  end component;

  component loc_indcs_generator
    port(
      start        : in std_logic;
      finish       : out std_logic;
      clear_finish : in std_logic;
      n_wf_wg_m1   : in unsigned(N_WF_CU_W-1 downto 0);
      wg_size_d0   : in integer range 0 to WG_MAX_SIZE;
      wg_size_d1   : in integer range 0 to WG_MAX_SIZE;
      wg_size_d2   : in integer range 0 to WG_MAX_SIZE;
      wrAddr       : out unsigned(RTM_ADDR_W-2 downto 0);
      we           : out std_logic;
      wrData       : out unsigned(RTM_DATA_W-1 downto 0);
      clk, nrst    : in std_logic
    );
  end component;

  component mult_add_sub
    generic (DATA_W  : natural := 32);
    port (
      sub               : in std_logic;
      a, c              : in unsigned (DATA_W-1 downto 0);
      b                 : in unsigned (DATA_W downto 0);
      sra_sign_v        : in std_logic;
      sra_sign          : in unsigned (DATA_W downto 0);
      sltu_true_p0      : out std_logic;
      res_low_p0        : out std_logic_vector(DATA_W-1 downto 0);
      res_high          : out std_logic_vector(DATA_W-1 downto 0);
      clk, nrst, ce     : in std_logic
    );
  end component;

  component rd_cache_fifo

    generic(
      SIZEA       : integer;
      ADDRWIDTHA  : integer;
      SIZEB       : integer;
      ADDRWIDTHB  : integer
    );
    port(
      clk                     : in  std_logic;
      push                    : in  std_logic;
      cache_rdData            : in  std_logic_vector(DATA_W*CACHE_N_BANKS - 1 downto 0);
      cache_rdAddr            : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
      rdData                  : out std_logic_vector(DATA_W*RD_CACHE_N_WORDS - 1 downto 0);
      rdAddr                  : out unsigned(GMEM_WORD_ADDR_W-RD_CACHE_N_WORDS_W-1 downto 0);
      nempty                  : out std_logic;
      nrst                    : in std_logic
    );
  end component;

  component regFile
    port(
      rs_addr, rt_addr    : in unsigned(REG_FILE_BLOCK_W-1 downto 0);
      rd_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0);
      re                  : in std_logic;
      rs                  : out std_logic_vector(DATA_W-1 downto 0);
      rt                  : out std_logic_vector(DATA_W-1 downto 0);
      rd                  : out std_logic_vector(DATA_W-1 downto 0);
      we                  : in std_logic;
      wrAddr              : in unsigned(REG_FILE_BLOCK_W-1 downto 0);
      wrData              : in std_logic_vector(DATA_W-1 downto 0);
      clk, nrst           : in std_logic
    );
  end component;

  component rtm
    port(
      clk                 : in  std_logic;
      rtm_rdAddr          : in  unsigned(RTM_ADDR_W-1 downto 0);
      rtm_rdData          : out  unsigned(RTM_DATA_W-1 downto 0);
      rtm_wrData_cv       : in  unsigned(DATA_W-1 downto 0);
      rtm_wrAddr_cv       : in  unsigned(N_WF_CU_W+2-1 downto 0);
      rtm_we_cv           : in  std_logic;
      rtm_wrAddr_wg       : in  unsigned(RTM_ADDR_W-1 downto 0);
      rtm_wrData_wg       : in  unsigned(RTM_DATA_W-1 downto 0);
      rtm_we_wg           : in  std_logic;
      WGsDispatched       : in  std_logic;
      start_CUs           : in  std_logic;
      nrst                : in  std_logic
    );
  end component;

  component smem
    port(
      rqst                        : in std_logic; -- stage 0
      we                          : in std_logic; -- stage 0
      wrData                      : in SLV32_ARRAY(CV_SIZE - 1 downto 0);
      rdData                      : out SLV32_ARRAY(CV_SIZE - 1 downto 0);
      addr                        : in smem_addr_t(CV_SIZE-1 downto 0);
      rd_addr                     : in unsigned(REG_FILE_W - 1 downto 0);
      alu_en                      : in std_logic_vector(CV_SIZE - 1 downto 0);
      rdData_rd_addr              : out unsigned(REG_FILE_W - 1 downto 0);
      rdData_alu_en               : out std_logic_vector(CV_SIZE - 1 downto 0);
      rdData_v                    : out std_logic;
      num_wg_per_cu               : in unsigned(N_WF_CU_W downto 0);
      wf_distribution_on_wg       : in wf_distribution_on_wg_type(N_WF_CU-1 downto 0);
      smem_finish                 : out std_logic_vector(N_WF_CU-1 downto 0);
      reading_smem                : out std_logic;
      clk                         : in std_logic;
      nrst                        : in std_logic
    );
  end component;


  component wg_dispatcher
    port(
      clk, nrst           : in std_logic;
      start               : in std_logic;
      initialize_d0       : in std_logic;
      start_exec          : out std_logic;
      krnl_indx           : in integer range 0 to NEW_KRNL_MAX_INDX-1;
      krnl_sch_rdAddr     : out std_logic_vector(KRNL_SCH_ADDR_W-1 downto 0);
      krnl_sch_rdData     : in std_logic_vector(DATA_W-1 downto 0);
      finish              : out std_logic;
      finish_krnl_indx    : out integer range 0 to NEW_KRNL_MAX_INDX-1;
      start_addr          : out unsigned(CRAM_ADDR_W-1 downto 0);
      req                 : out std_logic_vector(N_CU-1 downto 0);
      ack                 : in std_logic_vector(N_CU-1 downto 0);
      sch_rqst_n_WFs_m1   : out unsigned(N_WF_CU_W-1 downto 0);
      wf_active           : in wf_active_array(N_CU-1 downto 0);
      wg_info             : out unsigned(DATA_W-1 downto 0);
      rdData_alu_en       : out alu_en_vec_type(N_CU-1 downto 0);
      rdAddr_alu_en       : in alu_en_rdAddr_type(N_CU-1 downto 0);
      rtm_wrAddr          : out unsigned(RTM_ADDR_W-1 downto 0);
      rtm_wrData          : out unsigned(RTM_DATA_W-1 downto 0);
      rtm_we              : out std_logic
    );
  end component;

  component alu
    port(
      rs_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0);
      rt_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0);
      rd_addr             : in unsigned(REG_FILE_BLOCK_W-1 downto 0);
      regBlock_re         : in std_logic_vector(N_REG_BLOCKS-1 downto 0);
      family              : in std_logic_vector(FAMILY_W-1 downto 0);
      op_arith_shift      : in op_arith_shift_type;
      code                : in std_logic_vector(CODE_W-1 downto 0);
      immediate           : in std_logic_vector(IMM_W-1 downto 0);
      rd_out              : out std_logic_vector(DATA_W-1 downto 0);
      reg_we_mov          : out std_logic;
      div_a               : out std_logic_vector(DATA_W-1 downto 0);
      div_b               : out std_logic_vector(DATA_W-1 downto 0);
      float_a             : out std_logic_vector(DATA_W-1 downto 0);
      float_b             : out std_logic_vector(DATA_W-1 downto 0);
      op_logical_v        : in std_logic;
      res_low             : out std_logic_vector(DATA_W-1 downto 0);
      res_high            : out std_logic_vector(DATA_W-1 downto 0);
      reg_wrData          : in slv32_array(N_REG_BLOCKS-1 downto 0);
      reg_wrAddr          : in reg_file_block_array(N_REG_BLOCKS-1 downto 0);
      reg_we              : in std_logic_vector(N_REG_BLOCKS-1 downto 0);
      clk                 : in std_logic;
      nrst                : in std_logic
    );
  end component;

  component axi_controllers
    port(
      axi_rdAddr          : in gmem_addr_array_no_bank(N_WR_FIFOS-1 downto 0);
      wr_fifo_go          : in std_logic_vector(N_WR_FIFOS-1 downto 0);
      wr_fifo_free        : out std_logic_vector(N_WR_FIFOS-1 downto 0);
      axi_wrAddr          : in gmem_addr_array_no_bank(N_AXI-1 downto 0);
      axi_writer_go       : in std_logic_vector(N_AXI-1 downto 0);
      axi_writer_free     : out std_logic_vector(N_AXI-1 downto 0);
      axi_writer_id       : in std_logic_vector(N_TAG_MANAGERS_W-1 downto 0);
      axi_writer_ack      : out std_logic_vector(N_TAG_MANAGERS-1 downto 0);
      wr_fifo_cache_rqst  : out std_logic_vector(N_WR_FIFOS-1 downto 0);
      rd_fifo_cache_rqst  : out std_logic_vector(N_AXI-1 downto 0);
      wr_fifo_cache_ack   : in std_logic_vector(N_WR_FIFOS-1 downto 0);
      rd_fifo_cache_ack   : in std_logic_vector(N_AXI-1 downto 0);
      wr_fifo_rqst_addr   : out cache_addr_array(N_WR_FIFOS-1 downto 0);
      rd_fifo_rqst_addr   : out cache_addr_array(N_AXI-1 downto 0);
      wr_fifo_dout        : out cache_word_array(N_WR_FIFOS-1 downto 0);
      cache_dob           : in std_logic_vector(DATA_W*2**N-1 downto 0);
      rd_fifo_din_v       : in std_logic_vector(N_AXI-1 downto 0);
      fifo_be_din         : in std_logic_vector(DATA_W/8*2**N-1 downto 0);
      axi_araddr          : out GMEM_ADDR_ARRAY(N_AXI-1 downto 0);
      axi_arvalid         : out std_logic_vector(N_AXI-1 downto 0);
      axi_arready         : in std_logic_vector(N_AXI-1 downto 0);
      axi_arid            : out id_array(N_AXI-1 downto 0);
      axi_rdata           : in gmem_word_array(N_AXI-1 downto 0);
      axi_rlast           : in std_logic_vector(N_AXI-1 downto 0);
      axi_rvalid          : in std_logic_vector(N_AXI-1 downto 0);
      axi_rready          : out std_logic_vector(N_AXI-1 downto 0);
      axi_rid             : in id_array(N_AXI-1 downto 0);
      axi_awaddr          : out GMEM_ADDR_ARRAY(N_AXI-1 downto 0);
      axi_awvalid         : out std_logic_vector(N_AXI-1 downto 0);
      axi_awready         : in std_logic_vector(N_AXI-1 downto 0);
      axi_awid            : out id_array(N_AXI-1 downto 0);
      axi_wdata           : out gmem_word_array(N_AXI-1 downto 0);
      axi_wstrb           : out gmem_be_array(N_AXI-1 downto 0);
      axi_wlast           : out std_logic_vector(N_AXI-1 downto 0);
      axi_wvalid          : out std_logic_vector(N_AXI-1 downto 0);
      axi_wready          : in std_logic_vector(N_AXI-1 downto 0);
      axi_bvalid          : in std_logic_vector(N_AXI-1 downto 0);
      axi_bready          : out std_logic_vector(N_AXI-1 downto 0);
      axi_bid             : in id_array(N_AXI-1 downto 0);
      clk, nrst           : std_logic
    );
  end component;

  component cache
    port(
      wea                 : in std_logic_vector(CACHE_N_BANKS*DATA_W/8-1 downto 0);
      ena                 : in std_logic;
      addra               : in unsigned(M+L-1 downto 0);
      dia                 : in std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
      doa                 : out std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
      enb, enb_be         : in std_logic;
      wr_fifo_rqst_addr   : in cache_addr_array(N_WR_FIFOS-1 downto 0);
      rd_fifo_rqst_addr   : in cache_addr_array(N_AXI-1 downto 0);
      wr_fifo_dout        : in cache_word_array(N_WR_FIFOS-1 downto 0);
      rd_fifo_din_v       : out std_logic_vector(N_AXI-1 downto 0);
      dob                 : out std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
      ticket_rqst_wr      : in std_logic_vector(N_WR_FIFOS-1 downto 0);
      ticket_ack_wr_fifo  : out std_logic_vector(N_WR_FIFOS-1 downto 0);
      ticket_rqst_rd      : in std_logic_vector(N_AXI-1 downto 0);
      ticket_ack_rd_fifo  : out std_logic_vector(N_AXI-1 downto 0);
      be_rdData           : out std_logic_vector (DATA_W/8*2**N-1 downto 0);
      clk, nrst           : in std_logic
    );
  end component;

  component cu_instruction_dispatcher is
    port(
      clk, nrst             : in std_logic;
      cram_rqst             : out std_logic;
      cram_rdAddr           : out unsigned(CRAM_ADDR_W-1 downto 0);
      cram_rdAddr_conf      : in unsigned(CRAM_ADDR_W-1 downto 0);
      cram_rdData           : in std_logic_vector(DATA_W-1 downto 0);
      PC_indx               : in integer range 0 to N_WF_CU-1;
      wf_active             : in std_logic_vector(N_WF_CU-1 downto 0);
      pc_updated            : in std_logic_vector(N_WF_CU-1 downto 0);
      PCs                   : in CRAM_ADDR_ARRAY(N_WF_CU-1 downto 0);
      pc_rdy                : out std_logic_vector(N_WF_CU-1 downto 0);
      instr                 : out std_logic_vector(DATA_W-1 downto 0);
      instr_gmem_op         : out std_logic_vector(N_WF_CU-1 downto 0);
	    instr_gmem_read       : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_scratchpad_ld   : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_smem_op         : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_smem_read       : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_branch          : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_jump            : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_fpu             : out std_logic_vector(N_WF_CU-1 downto 0);
      instr_sync            : out std_logic_vector(N_WF_CU-1 downto 0);
      branch_distance       : out branch_distance_vec(0 to N_WF_CU-1);
      wf_retired            : out std_logic_vector(N_WF_CU-1 downto 0)
    );
  end component;

  component cu_mem_cntrl
    port(
      clk                     : in std_logic;
      cv_wrData               : in SLV32_ARRAY(CV_SIZE-1 downto 0);
      cv_addr                 : in GMEM_ADDR_ARRAY;
      cv_gmem_we              : in std_logic;
      cv_gmem_re              : in std_logic;
      cv_gmem_atomic          : in std_logic;
      cv_lmem_rqst            : in std_logic;
      cv_lmem_we              : in std_logic;
      cv_smem_rqst            : in std_logic;
      cv_smem_we              : in std_logic;
      cv_op_type              : in std_logic_vector(2 downto 0);
      cv_alu_en               : in std_logic_vector(CV_SIZE-1 downto 0);
      cv_alu_en_pri_enc       : in integer range 0 to CV_SIZE-1;
      cv_rd_addr              : in unsigned(REG_FILE_W-1 downto 0);
      regFile_wrAddr          : out unsigned(REG_FILE_W-1 downto 0);
      regFile_we              : out std_logic_vector(CV_SIZE-1 downto 0);
      regFile_wrData          : out SLV32_ARRAY(CV_SIZE-1 downto 0);
      regFile_we_lmem_p0      : out std_logic;
      regFile_we_smem         : out std_logic_vector(CV_SIZE-1 downto 0);
      cache_rdAck             : in std_logic;
      cache_rdAddr            : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
      cache_rdData            : in std_logic_vector(DATA_W*CACHE_N_BANKS-1 downto 0);
      atomic_rdData           : in std_logic_vector(DATA_W-1 downto 0);
      atomic_rdData_v         : in std_logic;
      atomic_sgntr            : in std_logic_vector(N_CU_STATIONS_W-1 downto 0);
      gmem_wrData             : out std_logic_vector(DATA_W-1 downto 0);
      gmem_valid              : out std_logic;
      gmem_we                 : out std_logic_vector(DATA_W/8-1 downto 0);
      gmem_rnw                : out std_logic;
      gmem_atomic             : out std_logic;
      gmem_atomic_sgntr       : out std_logic_vector(N_CU_STATIONS_W-1 downto 0);
      gmem_ready              : in std_logic;
      gmem_rqst_addr          : out unsigned(GMEM_WORD_ADDR_W-1 downto 0);
      wf_finish               : out std_logic_vector(N_WF_CU-1 downto 0);
	    smem_finish             : out std_logic_vector(N_WF_CU-1 downto 0);
      cntrl_idle              : out std_logic;
      wf_distribution_on_wg   : in wf_distribution_on_wg_type(N_WF_CU-1 downto 0);
      num_wg_per_cu           : in unsigned(N_WF_CU_W downto 0);

      debug_gmem_read_counter_per_cu  : out unsigned(2*DATA_W-1 downto 0);
      debug_gmem_write_counter_per_cu : out unsigned(2*DATA_W-1 downto 0);
      debug_reset_all_counters        : in std_logic;

      nrst                    : in std_logic
    );
  end component;

  component cu_scheduler
    port(
      clk, nrst              : in std_logic;
      wf_active              : out std_logic_vector(N_WF_CU-1 downto 0);
      sch_rqst               : in std_logic;
      sch_ack                : out std_logic;
      sch_rqst_n_wfs_m1      : in unsigned(N_WF_CU_W-1 downto 0);
      wg_info                : in unsigned(DATA_W-1 downto 0);
      cram_rdAddr            : out unsigned(CRAM_ADDR_W-1 downto 0);
      cram_rdAddr_conf       : in unsigned(CRAM_ADDR_W-1 downto 0);
      cram_rdData            : in std_logic_vector(DATA_W-1 downto 0);
      cram_rqst              : out std_logic;
      start_addr             : in unsigned(CRAM_ADDR_W-1 downto 0);
      wf_is_branching        : in std_logic_vector(N_WF_CU-1 downto 0);
      alu_branch             : in std_logic_vector(CV_SIZE-1 downto 0);
      alu_en                 : in std_logic_vector(CV_SIZE-1 downto 0);
      rtm_wrAddr_cv          : out unsigned(N_WF_CU_W+2-1 downto 0);
      rtm_wrData_cv          : out unsigned(DATA_W-1 downto 0);
      rtm_we_cv              : out std_logic;
      gmem_finish            : in std_logic_vector(N_WF_CU-1 downto 0);
	    smem_finish            : in std_logic_vector(N_WF_CU-1 downto 0);
      instr                  : out std_logic_vector(DATA_W-1 downto 0);
      wf_indx_in_wg          : out natural range 0 to N_WF_CU-1;
      wf_indx_in_CU          : out natural range 0 to N_WF_CU-1;
      alu_en_divStack        : out std_logic_vector(CV_SIZE-1 downto 0);
      phase                  : out unsigned(PHASE_W-1 downto 0);
      finish_exec            : in std_logic;
      finish_exec_d0         : in std_logic;
      num_wg_per_cu          : out unsigned(N_WF_CU_W downto 0);
      wf_distribution_on_wg  : out wf_distribution_on_wg_type(N_WF_CU-1 downto 0);
      wf_sync_retired        : in std_logic_vector(N_WF_CU-1 downto 0);
      wi_barrier_reached     : in std_logic_vector(N_WF_CU-1 downto 0);
      cu_is_working          : out std_logic
    );
  end component;

  component cu
    port(
      clk                 : in std_logic;
      cram_rdAddr         : out unsigned(CRAM_ADDR_W-1 downto 0);
      cram_rdAddr_conf    : in unsigned(CRAM_ADDR_W-1 downto 0);
      cram_rdData         : in std_logic_vector(DATA_W-1 downto 0);
      cram_rqst           : out std_logic;
      start_addr          : in unsigned(CRAM_ADDR_W-1 downto 0);
      sch_rqst_n_wfs_m1   : in unsigned(N_WF_CU_W-1 downto 0);
      wg_info             : in unsigned(DATA_W-1 downto 0);
      sch_rqst            : in std_logic;
      wf_active           : out std_logic_vector(N_WF_CU-1 downto 0);
      sch_ack             : out std_logic;
      start_CUs           : in std_logic;
      WGsDispatched       : in std_logic;
      rtm_wrAddr_wg       : in unsigned(RTM_ADDR_W-1 downto 0);
      rtm_wrData_wg       : in unsigned(RTM_DATA_W-1 downto 0);
      rtm_we_wg           : in std_logic;
      rdData_alu_en       : in std_logic_vector(CV_SIZE-1 downto 0);
      rdAddr_alu_en       : out unsigned(N_WF_CU_W+PHASE_W-1 downto 0);
      cache_rdData        : in std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
      cache_rdAck         : in std_logic;
      cache_rdAddr        : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
      atomic_rdData       : in std_logic_vector(DATA_W-1 downto 0);
      atomic_rdData_v     : in std_logic;
      atomic_sgntr        : in std_logic_vector(N_CU_STATIONS_W-1 downto 0);
      gmem_wrData         : out std_logic_vector(DATA_W-1 downto 0);
      gmem_valid          : out std_logic;
      gmem_we             : out std_logic_vector(DATA_W/8-1 downto 0);
      gmem_rnw            : out std_logic;
      gmem_atomic         : out std_logic;
      gmem_atomic_sgntr   : out std_logic_vector(N_CU_STATIONS_W-1 downto 0);
      gmem_rqst_addr      : out unsigned(GMEM_WORD_ADDR_W-1 downto 0);
      gmem_ready          : in std_logic;
      gmem_cntrl_idle     : out std_logic;


      finish_exec         : in std_logic;
      finish_exec_d0      : in std_logic;

      debug_gmem_read_counter_per_cu  : out unsigned(2*DATA_W-1 downto 0);
      debug_gmem_write_counter_per_cu : out unsigned(2*DATA_W-1 downto 0);
      debug_op_counter_per_cu         : out unsigned(2*DATA_W-1 downto 0);
      debug_reset_all_counters        : in std_logic;

      nrst                : in std_logic
    );
  end component;

  component cu_vector
    port(
      instr                           : in std_logic_vector(DATA_W-1 downto 0);
      wf_indx, wf_indx_in_wg          : in natural range 0 to N_WF_CU-1;
      phase                           : in unsigned(PHASE_W-1 downto 0);
      alu_en_divStack                 : in std_logic_vector(CV_SIZE-1 downto 0);
      rdAddr_alu_en                   : out unsigned(N_WF_CU_W+PHASE_W-1 downto 0);
      rdData_alu_en                   : in std_logic_vector(CV_SIZE-1 downto 0);
      rtm_rdAddr                      : out unsigned(RTM_ADDR_W-1 downto 0);
      rtm_rdData                      : in unsigned(RTM_DATA_W-1 downto 0);
      gmem_re, gmem_we                : out std_logic;
      mem_op_type                     : out std_logic_vector(2 downto 0);
      mem_addr                        : out GMEM_ADDR_ARRAY(CV_SIZE-1 downto 0);
      mem_rd_addr                     : out unsigned(REG_FILE_W-1 downto 0);
      mem_wrData                      : out SLV32_ARRAY(CV_SIZE-1 downto 0);
      alu_en                          : out std_logic_vector(CV_SIZE-1 downto 0);
      alu_en_pri_enc                  : out integer range 0 to CV_SIZE-1;
      lmem_rqst, lmem_we              : out std_logic;
      smem_rqst, smem_we              : out std_logic;
      gmem_atomic                     : out std_logic;
      wf_is_branching                 : out std_logic_vector(N_WF_CU-1 downto 0);
      alu_branch                      : out std_logic_vector(CV_SIZE-1 downto 0);
      mem_regFile_wrAddr              : in unsigned(REG_FILE_W-1 downto 0);
      mem_regFile_we                  : in std_logic_vector(CV_SIZE-1 downto 0);
      mem_regFile_wrData              : in SLV32_ARRAY(CV_SIZE-1 downto 0);
      lmem_regFile_we_p0              : in std_logic;
      smem_regFile_we                 : in std_logic_vector(CV_SIZE-1 downto 0);
      wf_sync_retired                 : out std_logic_vector(N_WF_CU-1 downto 0);
      wi_barrier_reached              : out std_logic_vector(N_WF_CU-1 downto 0);
      debug_op_counter_per_cu         : out unsigned(2*DATA_W-1 downto 0);
      debug_reset_all_counters        : in std_logic;
      cu_is_working                   : in std_logic;
      clk                             : in std_logic;
      nrst                            : in std_logic
    );
  end component;

  -- FPGA

  component dsp
    generic (
      SIZE_A : natural;
      SIZE_B : natural;
      SUB    : boolean
    );
    port (
      clk, nrst, ce : in std_logic;
      ain           : in unsigned(SIZE_A-1 downto 0);
      bin           : in unsigned(SIZE_B-1 downto 0);
      cin           : in unsigned(SIZE_A+SIZE_B-1 downto 0);
      res           : out unsigned(SIZE_A+SIZE_B-1 downto 0)
    );
  end component;

  component fslt
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      s_axis_b_tvalid : in std_logic;
      s_axis_b_tdata : in std_logic_vector(31 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(7 downto 0)
    );
  end component;

  component fsqrt
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  component frsqrt
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  component fmul
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      s_axis_b_tvalid : in std_logic;
      s_axis_b_tdata : in std_logic_vector(31 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  component fdiv
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      s_axis_b_tvalid : in std_logic;
      s_axis_b_tdata : in std_logic_vector(31 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  component fadd_fsub
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      s_axis_b_tvalid : in std_logic;
      s_axis_b_tdata : in std_logic_vector(31 downto 0);
      s_axis_operation_tvalid : in std_logic;
      s_axis_operation_tdata : in std_logic_vector(7 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  component uitofp
    port (
      aclk : in std_logic;
      s_axis_a_tvalid : in std_logic;
      s_axis_a_tdata : in std_logic_vector(31 downto 0);
      m_axis_result_tvalid : out std_logic;
      m_axis_result_tdata : out std_logic_vector(31 downto 0)
    );
  end component;

  component sdiv is
    port (
      aclk : in std_logic;
      s_axis_divisor_tvalid : in std_logic;
      s_axis_divisor_tdata : in std_logic_vector ( 31 downto 0 );
      s_axis_dividend_tvalid : in std_logic;
      s_axis_dividend_tdata : in std_logic_vector ( 31 downto 0 );
      m_axis_dout_tvalid : out std_logic;
      m_axis_dout_tdata : out std_logic_vector ( 63 downto 0 )
    );
  end component;

  component udiv is
    port (
      aclk : in std_logic;
      s_axis_divisor_tvalid : in std_logic;
      s_axis_divisor_tdata : in std_logic_vector ( 31 downto 0 );
      s_axis_dividend_tvalid : in std_logic;
      s_axis_dividend_tdata : in std_logic_vector ( 31 downto 0 );
      m_axis_dout_tvalid : out std_logic;
      m_axis_dout_tdata : out std_logic_vector ( 63 downto 0 )
    );
  end component;

  -- Simulation

  component global_mem
    generic(
      MEM_PHY_ADDR_W   : natural := 17;
      ADDR_OFFSET      : unsigned := X"1000_0000";
      MAX_NDRANGE_SIZE : natural := 64*1024
    );
    port(
      new_kernel          : in std_logic;
      finished_kernel     : in std_logic;
      size_0              : in natural;
      size_1              : in natural;
      target_offset_addr  : in natural := 2**(N+L+M-1+2);
      problemSize         : in natural;
      -- AXI Slave Interfaces
      -- common signals
      mx_arlen_awlen      : in std_logic_vector(7 downto 0);
      -- interface 0 {{{
      -- ar channel
      m0_araddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m0_arvalid          : in std_logic;
      m0_arready          : buffer std_logic;
      m0_arid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- r channel
      m0_rdata            : out std_logic_vector(GMEM_DATA_W-1 downto 0);
      m0_rlast            : out std_logic;
      m0_rvalid           : buffer std_logic;
      m0_rready           : in std_logic;
      m0_rid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- aw channel
      m0_awaddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m0_awvalid          : in std_logic;
      m0_awready          : buffer std_logic;
      m0_awid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- w channel
      m0_wdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m0_wstrb            : in std_logic_vector(GMEM_DATA_W/8-1 downto 0);
      m0_wlast            : in std_logic;
      m0_wvalid           : in std_logic;
      m0_wready           : buffer std_logic;
      -- b channel
      m0_bvalid           : out std_logic;
      m0_bready           : in std_logic;
      m0_bid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- }}}
      -- interface 1 {{{
      -- ar channel
      m1_araddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m1_arvalid          : in std_logic;
      m1_arready          : buffer std_logic;
      m1_arid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- r channel
      m1_rdata            : out std_logic_vector(GMEM_DATA_W-1 downto 0);
      m1_rlast            : out std_logic;
      m1_rvalid           : buffer std_logic;
      m1_rready           : in std_logic;
      m1_rid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- aw channel
      m1_awaddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m1_awvalid          : in std_logic;
      m1_awready          : buffer std_logic;
      m1_awid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- w channel
      m1_wdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m1_wstrb            : in std_logic_vector(GMEM_DATA_W/8-1 downto 0);
      m1_wlast            : in std_logic;
      m1_wvalid           : in std_logic;
      m1_wready           : buffer std_logic;
      -- b channel
      m1_bvalid           : out std_logic;
      m1_bready           : in std_logic;
      m1_bid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- }}}
      -- interface 2 {{{
      -- ar channel
      m2_araddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m2_arvalid          : in std_logic;
      m2_arready          : buffer std_logic;
      m2_arid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- r channel
      m2_rdata            : out std_logic_vector(GMEM_DATA_W-1 downto 0);
      m2_rlast            : out std_logic;
      m2_rvalid           : buffer std_logic;
      m2_rready           : in std_logic;
      m2_rid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- aw channel
      m2_awaddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m2_awvalid          : in std_logic;
      m2_awready          : buffer std_logic;
      m2_awid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- w channel
      m2_wdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m2_wstrb            : in std_logic_vector(GMEM_DATA_W/8-1 downto 0);
      m2_wlast            : in std_logic;
      m2_wvalid           : in std_logic;
      m2_wready           : buffer std_logic;
      -- b channel
      m2_bvalid           : out std_logic;
      m2_bready           : in std_logic;
      m2_bid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- }}}
      -- interface 3 {{{
      -- ar channel
      m3_araddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m3_arvalid          : in std_logic;
      m3_arready          : buffer std_logic;
      m3_arid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- r channel
      m3_rdata            : out std_logic_vector(GMEM_DATA_W-1 downto 0);
      m3_rlast            : out std_logic;
      m3_rvalid           : buffer std_logic;
      m3_rready           : in std_logic;
      m3_rid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- aw channel
      m3_awaddr           : in std_logic_vector(GMEM_ADDR_W-1 downto 0);
      m3_awvalid          : in std_logic;
      m3_awready          : buffer std_logic;
      m3_awid             : in std_logic_vector(ID_WIDTH-1 downto 0);
      -- w channel
      m3_wdata            : in std_logic_vector(GMEM_DATA_W-1 downto 0);
      m3_wstrb            : in std_logic_vector(GMEM_DATA_W/8-1 downto 0);
      m3_wlast            : in std_logic;
      m3_wvalid           : in std_logic;
      m3_wready           : buffer std_logic;
      -- b channel
      m3_bvalid           : out std_logic;
      m3_bready           : in std_logic;
      m3_bid              : out std_logic_vector(ID_WIDTH-1 downto 0);
      -- }}}
      clk, nrst           : in  std_logic
    );
  end component;

end package;
