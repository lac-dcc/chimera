-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity compute_unit is
-- ports {{{
port(
  clk                 : in std_logic;

  cram_rdAddr         : out unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  cram_rdAddr_conf    : in unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  cram_rdData         : in std_logic_vector(DATA_W-1 downto 0);
  cram_rqst           : out std_logic := '0';
  start_addr          : in unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');

  sch_rqst_n_wfs_m1   : in unsigned(N_WF_CU_W-1 downto 0);
  wg_info             : in unsigned(DATA_W-1 downto 0); 
  sch_rqst            : in std_logic;
  
  wf_active           : out std_logic_vector(N_WF_CU-1 downto 0) := (others => '0'); -- active WFs in the CU
  sch_ack             : out std_logic := '0';
  start_CUs           : in std_logic := '0';
  WGsDispatched       : in std_logic := '0';
  rtm_wrAddr_wg       : in unsigned(RTM_ADDR_W-1 downto 0) := (others => '0');
  rtm_wrData_wg       : in unsigned(RTM_DATA_W-1 downto 0) := (others => '0');
  rtm_we_wg           : in std_logic := '0';
  rdData_alu_en       : in std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  rdAddr_alu_en       : out unsigned(N_WF_CU_W+PHASE_W-1 downto 0) := (others=>'0');

  cache_rdData        : in std_logic_vector(CACHE_N_BANKS*DATA_W-1 downto 0) := (others=>'0');
  cache_rdAck         : in std_logic := '0';
  cache_rdAddr        : in unsigned(GMEM_WORD_ADDR_W-CACHE_N_BANKS_W-1 downto 0) := (others=>'0');
  atomic_rdData       : in std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  atomic_rdData_v     : in std_logic := '0';
  atomic_sgntr        : in std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');

  gmem_wrData         : out std_logic_vector(DATA_W-1 downto 0) := (others=>'0');
  gmem_valid          : out std_logic := '0';  
  gmem_we             : out std_logic_vector(DATA_W/8-1 downto 0) := (others=>'0');
  gmem_rnw            : out std_logic := '0';
  gmem_atomic         : out std_logic := '0';
  gmem_atomic_sgntr   : out std_logic_vector(N_CU_STATIONS_W-1 downto 0) := (others=>'0');
  gmem_rqst_addr      : out unsigned(GMEM_WORD_ADDR_W-1 downto 0) := (others=>'0');
  gmem_ready          : in std_logic := '0';

  gmem_cntrl_idle     : out std_logic := '0';

  nrst                : in std_logic
);
-- ports }}}
end compute_unit;
architecture Behavioral of compute_unit is
  -- signals definitions {{{
  signal nrst_scheduler                   : std_logic := '0';
  signal nrst_mem_cntrl                   : std_logic := '0';
  signal nrst_rtm                         : std_logic := '0';
  signal rtm_wrAddr_cv                    : unsigned(N_WF_CU_W+2-1 downto 0) := (others => '0');
  signal rtm_wrData_cv                    : unsigned(DATA_W-1 downto 0) := (others => '0'); 
  signal rtm_we_cv                        : std_logic := '0';
  
  signal rtm_rdAddr                       : unsigned(RTM_ADDR_W-1 downto 0) := (others => '0');
  signal rtm_rdData                       : unsigned(RTM_DATA_W-1 downto 0) := (others => '0');

  signal instr, instr_out                 : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal wf_indx_in_wg, wf_indx           : natural range 0 to N_WF_CU-1;
  signal wf_indx_in_wg_out, wf_indx_out   : natural range 0 to N_WF_CU-1;
  signal phase, phase_out                 : unsigned(PHASE_W-1 downto 0) := (others=>'0');

  signal alu_branch                       : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); 
  signal wf_is_branching                  : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal alu_en_divStack                  : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  
  signal cv_gmem_re, cv_gmem_we           : std_logic := '0';
  signal cv_gmem_atomic                   : std_logic := '0';
  signal cv_mem_wrData                    : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal cv_op_type                       : std_logic_vector(2 downto 0) := (others=>'0');
  signal cv_lmem_rqst, cv_lmem_we         : std_logic := '0';

  signal cv_mem_addr                      : GMEM_ADDR_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal alu_en, alu_en_d0                : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal alu_en_pri_enc                   : integer range 0 to CV_SIZE-1 := 0;
  signal cv_mem_rd_addr                   : unsigned(REG_FILE_W-1 downto 0) := (others=>'0');
  signal regFile_wrAddr                   : unsigned(REG_FILE_W-1 downto 0) := (others=>'0');  
  signal regFile_wrData                   : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal regFile_we                       : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal regFile_we_lmem_p0               : std_logic := '0';


  signal gmem_finish                      : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  attribute max_fanout of phase : signal is 10;
  attribute max_fanout of wf_indx : signal is 10;
  -- }}}  
begin
  -- RTM -------------------------------------------------------------------------------------- {{{
  RTM_inst: entity RTM port map(
    clk => clk,
    rtm_rdAddr => rtm_rdAddr,
    rtm_rdData => rtm_rdData,
    rtm_wrData_cv => rtm_wrData_cv,
    rtm_wrAddr_cv => rtm_wrAddr_cv,
    rtm_we_cv => rtm_we_cv,
    rtm_wrAddr_wg => rtm_wrAddr_wg,
    rtm_wrData_wg => rtm_wrData_wg,
    rtm_we_wg => rtm_we_wg,
    WGsDispatched => WGsDispatched,
    start_CUs => start_CUs,
    nrst => nrst_rtm
  );
  ------------------------------------------------------------------------------------------------}}}
  -- CU WF Scheduler -----------------------------------------------------------------------------------{{{
  CUS_inst: entity CU_scheduler
  port map(
    clk               => clk,
    wf_active         => wf_active,
    sch_ack           => sch_ack,
    sch_rqst          => sch_rqst,
    sch_rqst_n_wfs_m1 => sch_rqst_n_wfs_m1,
    nrst              => nrst_scheduler,
    cram_rdAddr       => cram_rdAddr,      
    cram_rdData       => cram_rdData,
    cram_rqst         => cram_rqst,
    cram_rdAddr_conf  => cram_rdAddr_conf,
    start_addr        => start_addr,
    wg_info           => wg_info,
    rtm_wrAddr_cv     => rtm_wrAddr_cv,
    rtm_wrData_cv     => rtm_wrData_cv,
    rtm_we_cv         => rtm_we_cv,

    alu_branch        => alu_branch,  -- level 10
    wf_is_branching   => wf_is_branching, -- level 10
    alu_en            => alu_en_d0, -- level 10
    
    gmem_finish       => gmem_finish,

    instr             => instr_out,
    wf_indx_in_wg     => wf_indx_in_wg_out,
    wf_indx_in_CU     => wf_indx_out,
    alu_en_divStack   => alu_en_divStack,
    phase             => phase_out
  );
  instr_slice_true: if INSTR_READ_SLICE generate
    process(clk)
    begin
      if rising_edge(clk) then
        nrst_scheduler <= nrst;
        nrst_mem_cntrl <= nrst;
        nrst_rtm <= nrst;
        instr <= instr_out;
        wf_indx_in_wg <= wf_indx_in_wg_out;
        wf_indx <= wf_indx_out;
        phase <= phase_out;
        alu_en_d0 <= alu_en;
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
  -- CV --------------------------------------------------------------------------------------{{{
  CV_inst: entity CV port map(
    clk               => clk,
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

    mem_regFile_wrAddr => regFile_wrAddr,
    mem_regFile_wrData => regFile_wrData,
    lmem_regFile_we_p0 => regFile_we_lmem_p0,
    mem_regFile_we    => regFile_we
  );
  ------------------------------------------------------------------------------------------------}}}
  -- CU mem controller -----------------------------------------------------------------{{{
  CU_mem_cntrl_inst: entity CU_mem_cntrl 
  port map(
    clk               => clk,
    
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
    wf_finish         => gmem_finish,
    cntrl_idle        => gmem_cntrl_idle,
    nrst              => nrst_mem_cntrl
  );
  ------------------------------------------------------------------------------------------------}}}
end Behavioral;

