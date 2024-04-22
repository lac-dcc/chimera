-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity cu is
-- ports {{{
port(
  clk                 : in std_logic;

  cram_rdAddr         : out unsigned(CRAM_ADDR_W-1 downto 0);
    -- CRAM read address
  cram_rdAddr_conf    : in unsigned(CRAM_ADDR_W-1 downto 0);
    --                                                                                                                   ---------------------------------- Add comment
  cram_rdData         : in std_logic_vector(DATA_W-1 downto 0);
    -- CRAM read data
  cram_rqst           : out std_logic;
    -- request signal to read CRAM
  start_addr          : in unsigned(CRAM_ADDR_W-1 downto 0);
    -- address of the first instruction to be fetched

  sch_rqst_n_wfs_m1   : in unsigned(N_WF_CU_W-1 downto 0);
    -- number of WFs in the WG to be scheduled
  wg_info             : in unsigned(DATA_W-1 downto 0);
    -- offset of the dispatched WG along D0/D1/D2 direction
  sch_rqst            : in std_logic;
    -- request signal to allocate WGs on CU

  wf_active           : out std_logic_vector(N_WF_CU-1 downto 0); -- active WFs in the CU
    -- wf_active(i) is set to '1' if the i-th WF is active
  sch_ack             : out std_logic;
    -- signal from CUs to acknowledge the scheduling request
  start_CUs           : in std_logic;
    -- signal set to '1' when entering the WG dispatcher scheduling phase
  WGsDispatched       : in std_logic;
    -- signal high when WG Dispatcher has scheduled all WGs

  rtm_wrAddr_wg       : in unsigned(RTM_ADDR_W-1 downto 0); -- from wg_dispatcher
    -- RTM wg write address
  rtm_wrData_wg       : in unsigned(RTM_DATA_W-1 downto 0); -- from wg_dispatcher
    -- RTM wg write data
  rtm_we_wg           : in std_logic; -- from wg_dispatcher
    -- RTM wg write enable
  rdData_alu_en       : in std_logic_vector(CV_SIZE-1 downto 0);
    -- Read data from alu enable memory
  rdAddr_alu_en       : out unsigned(N_WF_CU_W+PHASE_W-1 downto 0);
    -- Read address from alu enable memory

  cache_rdData        : in std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0);
    -- Cache read data
  cache_rdAck         : in std_logic;
    -- Cache read acknowledge
  cache_rdAddr        : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0);
    -- Cache read address
  atomic_rdData       : in std_logic_vector(DATA_W-1 downto 0);
    -- atomic units read data
  atomic_rdData_v     : in std_logic;
    -- atomic units read data valid
  atomic_sgntr        : in std_logic_vector(N_CU_STATIONS_W-1 downto 0);
    -- signal used to identify the CU that requested the atomic operation                                                ---------------------------------- Check comment

  gmem_wrData         : out std_logic_vector(DATA_W-1 downto 0);
    -- data to be written in the global memory by the CUs
  gmem_valid          : out std_logic;
    -- CU valid signal to global memory
  gmem_we             : out std_logic_vector(DATA_W/8-1 downto 0);
    -- CU byte write-enable to global memory
  gmem_rnw            : out std_logic;
    -- bit coming from the fifo within the CU memory controller                                                          ---------------------------------- Add comment
  gmem_atomic         : out std_logic;
    -- bit coming from the fifo within the CU memory controller                                                          ---------------------------------- Add comment
  gmem_atomic_sgntr   : out std_logic_vector(N_CU_STATIONS_W-1 downto 0);
    -- atomic signatur coming from the fifo within the CU memory controller                                              ---------------------------------- Add comment
  gmem_rqst_addr      : out unsigned(GMEM_WORD_ADDR_W-1 downto 0);
    -- address of the global memory request performed by the CU
  gmem_ready          : in std_logic;
    -- CU ready signal to global memory
  gmem_cntrl_idle     : out std_logic;
    -- signal set to '1' when there is no operation towards the global memory to be served


  finish_exec         : in std_logic;
    -- signal high when execution of a kernel is done
  finish_exec_d0      : in std_logic;
    -- registered finish_exec

  -- debug
  debug_gmem_read_counter_per_cu  : out unsigned(2*DATA_W-1 downto 0);
  debug_gmem_write_counter_per_cu : out unsigned(2*DATA_W-1 downto 0);
  debug_op_counter_per_cu         : out unsigned(2*DATA_W-1 downto 0);
  debug_reset_all_counters        : in std_logic;

  nrst                : in std_logic
);
-- ports }}}
end cu;

architecture Behavioral of cu is

  -- signals definitions {{{
  signal rtm_wrAddr_cv                    : unsigned(N_WF_CU_W+2-1 downto 0);
    -- RTM cv write address
  signal rtm_wrData_cv                    : unsigned(DATA_W-1 downto 0);
    -- RTM cv write data
  signal rtm_we_cv                        : std_logic;
    -- RTM cv write-enable

  signal rtm_rdAddr                       : unsigned(RTM_ADDR_W-1 downto 0);
    -- RTM read address
  signal rtm_rdData                       : unsigned(RTM_DATA_W-1 downto 0);
    -- RTM read data

  signal instr, instr_out                 : std_logic_vector(DATA_W-1 downto 0);
    -- instruction word
  signal wf_indx_in_wg, wf_indx           : natural range 0 to N_WF_CU-1;
    -- WF indices delivered to the cu vector
  signal wf_indx_in_wg_out, wf_indx_out   : natural range 0 to N_WF_CU-1;
    -- WF indices provided by the cu_scheduler
  signal phase, phase_out                 : unsigned(PHASE_W-1 downto 0);
    -- signal used to count the clock cycles in which the PEs execute the same instruction                               ---------------------------------- Check comment

  signal alu_branch                       : std_logic_vector(CV_SIZE-1 downto 0);
    -- signal provided by the cu_vector                                                                                   ---------------------------------- Add comment
  signal wf_is_branching                  : std_logic_vector(N_WF_CU-1 downto 0);
    -- signal to indicate which WF is branching
  signal alu_en_divStack                  : std_logic_vector(CV_SIZE-1 downto 0);
    -- ..                                                                                                                ---------------------------------- Add comment

  signal cv_gmem_re                       : std_logic;
    -- global memory read-enable provided by the cu vector and delivered to the cu memory controller
  signal cv_gmem_we                       : std_logic;
    -- global memory write-enable provided by the cu vector and delivered to the cu memory controller
  signal cv_gmem_atomic                   : std_logic;
    -- ..                                                                                                                ---------------------------------- Add comment
  signal cv_mem_wrData                    : SLV32_ARRAY(CV_SIZE-1 downto 0);
    -- write data provided by the cu vector
  signal cv_op_type                       : std_logic_vector(2 downto 0);
    -- type of memory operation requested by the CU vector
  signal cv_lmem_rqst                     : std_logic;
    -- cu vector request to local memory (scratchpad)
  signal cv_lmem_we                       : std_logic;
	  -- cu vector write-enable for local memory (scratchpad)
  signal cv_smem_rqst                     : std_logic;
    -- cu vector request to shared memory
  signal cv_smem_we                       : std_logic;
	  -- cu vector write-enable for shared memory
  signal cv_mem_addr                      : GMEM_ADDR_ARRAY(CV_SIZE-1 downto 0);
    -- global memory address of the cu vector request
  signal cv_mem_rd_addr                   : unsigned(REG_FILE_W-1 downto 0);
    -- register file read address provided by the cu vector                                                              ---------------------------------- Check comment
  signal alu_en, alu_en_d0                : std_logic_vector(CV_SIZE-1 downto 0);
    -- signal provided by the cu vector and delivered to the cu memory controller and the WF scheduler                   ---------------------------------- Add comment
  signal alu_en_pri_enc                   : integer range 0 to CV_SIZE-1;
    -- ..                                                                                                                ---------------------------------- Add comment
  signal regFile_wrAddr                   : unsigned(REG_FILE_W-1 downto 0);
    -- register file write address delivered to the cu vector by the cu memory controller
  signal regFile_wrData                   : SLV32_ARRAY(CV_SIZE-1 downto 0);
    -- register file write data delivered to the cu vector by the cu memory controller
  signal regFile_we                       : std_logic_vector(CV_SIZE-1 downto 0);
    -- register file write-enable delivered to the cu vector by the cu memory controller
  signal regFile_we_lmem_p0               : std_logic;
    -- ..                                                                                                                ---------------------------------- Add comment
  signal regFile_we_smem                  : std_logic_vector(CV_SIZE-1 downto 0);
    -- ..                                                                                                                ---------------------------------- Add comment


  signal gmem_finish                      : std_logic_vector(N_WF_CU-1 downto 0);
    -- finish signal provided by the cu memory controller and delivered to the WF scheduler (N_WF_CU = # of WFs that can be simultaneously managed within a CU)
  signal smem_finish                      : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when the i-th wf can exit the WAIT_SMEM_FINISH state

  signal num_wg_per_cu                    : unsigned(N_WF_CU_W downto 0);
    -- number of WG within each CU
  signal wf_distribution_on_wg            : wf_distribution_on_wg_type(N_WF_CU-1 downto 0);
    -- wf_distribution_on_wg(i) = j if the i-th wf belongs to the j-th workgroup

  signal wf_sync_retired                  : std_logic_vector(N_WF_CU-1 downto 0);
    -- wf_sync_retired(i) = '1' if the wi of the currently active record within the i-th wf have reached the wi barrier
  signal wi_barrier_reached               : std_logic_vector(N_WF_CU-1 downto 0);
    -- wi_barrier_reached(i) = '1' if all the wi of the i-th wf have reached the wi barrier

  signal cu_is_working                    : std_logic;

  -- XDC: attribute max_fanout of phase : signal is 10;
  -- XDC: attribute max_fanout of wf_indx : signal is 10;

  -- }}}

begin
  -- RTM -------------------------------------------------------------------------------------- {{{
  rtm_inst: rtm
  port map(
    clk           => clk,
    nrst          => nrst,
    rtm_rdAddr    => rtm_rdAddr,
    rtm_rdData    => rtm_rdData,
    rtm_wrData_cv => rtm_wrData_cv,
    rtm_wrAddr_cv => rtm_wrAddr_cv,
    rtm_we_cv     => rtm_we_cv,
    rtm_wrAddr_wg => rtm_wrAddr_wg,
    rtm_wrData_wg => rtm_wrData_wg,
    rtm_we_wg     => rtm_we_wg,
    WGsDispatched => WGsDispatched,
    start_CUs     => start_CUs
  );
  ------------------------------------------------------------------------------------------------}}}

  -- CU WF Scheduler -----------------------------------------------------------------------------------{{{
  cu_sched_inst: cu_scheduler
  port map(
    clk                   => clk,
    nrst                  => nrst,
    wf_active             => wf_active,
    sch_ack               => sch_ack,
    sch_rqst              => sch_rqst,
    sch_rqst_n_wfs_m1     => sch_rqst_n_wfs_m1,
    cram_rdAddr           => cram_rdAddr,
    cram_rdData           => cram_rdData,
    cram_rqst             => cram_rqst,
    cram_rdAddr_conf      => cram_rdAddr_conf,
    start_addr            => start_addr,
    wg_info               => wg_info,
    rtm_wrAddr_cv         => rtm_wrAddr_cv,
    rtm_wrData_cv         => rtm_wrData_cv,
    rtm_we_cv             => rtm_we_cv,

    alu_branch            => alu_branch,  -- level 10
    wf_is_branching       => wf_is_branching, -- level 10
    alu_en                => alu_en_d0, -- level 10

    gmem_finish           => gmem_finish,
    smem_finish           => smem_finish,

    instr                 => instr_out,
    wf_indx_in_wg         => wf_indx_in_wg_out,
    wf_indx_in_CU         => wf_indx_out,
    alu_en_divStack       => alu_en_divStack,
    phase                 => phase_out,

    finish_exec           => finish_exec,
    finish_exec_d0        => finish_exec_d0,
    num_wg_per_cu         => num_wg_per_cu,
    wf_distribution_on_wg => wf_distribution_on_wg,

    wf_sync_retired       => wf_sync_retired,
    wi_barrier_reached    => wi_barrier_reached,
    cu_is_working         => cu_is_working
  );

  instr_slice_true: if INSTR_READ_SLICE generate
    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          instr <= (others => '0');
          wf_indx_in_wg <= 0;
          wf_indx <= 0;
          phase <= (others => '0');
          alu_en_d0 <= (others => '0');
        else
          instr <= instr_out;
          wf_indx_in_wg <= wf_indx_in_wg_out;
          wf_indx <= wf_indx_out;
          phase <= phase_out;
          alu_en_d0 <= alu_en;
        end if;
      end if;
    end process;
  end generate;
  instr_slice_false: if not INSTR_READ_SLICE generate
    instr <= instr_out;
    wf_indx_in_wg <= wf_indx_in_wg_out;
    wf_indx <= wf_indx_out;
    phase <= phase_out;
  end generate;
  ------------------------------------------------------------------------------------------------}}}

  -- CU Vector --------------------------------------------------------------------------------------{{{
  cu_vector_inst: cu_vector port map(
    clk               => clk,
    nrst              => nrst,
    instr             => instr,
    rdData_alu_en     => rdData_alu_en,
    rdAddr_alu_en     => rdAddr_alu_en,
    rtm_rdAddr        => rtm_rdAddr, -- level 13.
    rtm_rdData        => rtm_rdData, -- level 15.
    wf_indx           => wf_indx,
    wf_indx_in_wg     => wf_indx_in_wg,
    phase             => phase,
    alu_en            => alu_en,
    alu_en_pri_enc    => alu_en_pri_enc,
    alu_en_divStack   => alu_en_divStack,

    -- branch
    alu_branch        => alu_branch,
    wf_is_branching   => wf_is_branching,

    gmem_re           => cv_gmem_re,
    gmem_atomic       => cv_gmem_atomic,
    gmem_we           => cv_gmem_we,
    mem_op_type       => cv_op_type,
    mem_addr          => cv_mem_addr,
    mem_rd_addr       => cv_mem_rd_addr,
    mem_wrData        => cv_mem_wrData,
    lmem_rqst         => cv_lmem_rqst,
    lmem_we           => cv_lmem_we,
    smem_rqst         => cv_smem_rqst,
    smem_we           => cv_smem_we,

    mem_regFile_wrAddr => regFile_wrAddr,
    mem_regFile_wrData => regFile_wrData,
    lmem_regFile_we_p0 => regFile_we_lmem_p0,
    smem_regFile_we    => regFile_we_smem,
    mem_regFile_we     => regFile_we,

    wf_sync_retired       => wf_sync_retired,
    wi_barrier_reached    => wi_barrier_reached,

    debug_op_counter_per_cu   => debug_op_counter_per_cu,
    debug_reset_all_counters  => debug_reset_all_counters,
    cu_is_working             => cu_is_working
  );
  ------------------------------------------------------------------------------------------------}}}

  -- CU mem controller -----------------------------------------------------------------{{{
  cu_mem_cntrl_inst: cu_mem_cntrl
  port map(
    clk               => clk,
    nrst              => nrst,

    cache_rdData      => cache_rdData,
    cache_rdAddr      => cache_rdAddr,
    cache_rdAck       => cache_rdAck,
    atomic_rdData     => atomic_rdData,
    atomic_rdData_v   => atomic_rdData_v,
    atomic_sgntr      => atomic_sgntr,

    cv_wrData         => cv_mem_wrData,
    cv_addr           => cv_mem_addr,
    cv_gmem_we        => cv_gmem_we,
    cv_gmem_re        => cv_gmem_re,
    cv_gmem_atomic    => cv_gmem_atomic,
    cv_lmem_rqst      => cv_lmem_rqst,
    cv_lmem_we        => cv_lmem_we,
    cv_smem_rqst      => cv_smem_rqst,
    cv_smem_we        => cv_smem_we,
    cv_op_type        => cv_op_type,
    cv_alu_en         => alu_en,
    cv_alu_en_pri_enc => alu_en_pri_enc,
    cv_rd_addr        => cv_mem_rd_addr,
    gmem_wrData       => gmem_wrData,
    gmem_valid        => gmem_valid,
    gmem_ready        => gmem_ready,
    gmem_we           => gmem_we,
    gmem_atomic       => gmem_atomic,
    gmem_atomic_sgntr => gmem_atomic_sgntr,
    gmem_rnw          => gmem_rnw,
    gmem_rqst_addr    => gmem_rqst_addr,
    regFile_wrAddr    => regFile_wrAddr,
    regFile_wrData    => regFile_wrData,
    regFile_we        => regFile_we,
    regFile_we_lmem_p0 => regFile_we_lmem_p0,
    regFile_we_smem   => regFile_we_smem,
    wf_finish         => gmem_finish,
	  smem_finish       => smem_finish,
    cntrl_idle        => gmem_cntrl_idle,

    num_wg_per_cu         => num_wg_per_cu,
    wf_distribution_on_wg => wf_distribution_on_wg,

    debug_gmem_read_counter_per_cu   => debug_gmem_read_counter_per_cu,
    debug_gmem_write_counter_per_cu  => debug_gmem_write_counter_per_cu,
    debug_reset_all_counters         => debug_reset_all_counters
  );
  ------------------------------------------------------------------------------------------------}}}


end Behavioral;
