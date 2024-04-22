-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity CU_scheduler is --- {{{
port(
  clk, nrst           : in std_logic;
  -- output status signals 
  wf_active           : out std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');

  -- for Work-Group Dispatcher
  sch_rqst            : in std_logic;             -- high to begin scheduling a new WG
  sch_ack             : out std_logic := '0';     -- high while scheduling a new WG
  sch_rqst_n_wfs_m1   : in unsigned(N_WF_CU_W-1 downto 0); -- # WFs within a WG
  wg_info             : in unsigned(DATA_W-1 downto 0); 

  -- for instruction fetching
  cram_rdAddr         : out unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  cram_rdAddr_conf    : in unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  cram_rdData         : in std_logic_vector(DATA_W-1 downto 0);
  cram_rqst           : out std_logic := '0';
  start_addr          : in unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  
  -- branch handling
  wf_is_branching     : in std_logic_vector(N_WF_CU-1 downto 0); -- level 18.
  alu_branch          : in std_logic_vector(CV_SIZE-1 downto 0); -- level 18.
  alu_en              : in std_logic_vector(CV_SIZE-1 downto 0); -- level 18.

  -- for RunTime Memory
  rtm_wrAddr_cv       : out unsigned(N_WF_CU_W+2-1 downto 0) := (others => '0');
  rtm_wrData_cv       : out unsigned(DATA_W-1 downto 0) := (others => '0'); 
  rtm_we_cv           : out std_logic := '0';

  gmem_finish         : in std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  
  -- with the Compute Vector
  instr               : out std_logic_vector(DATA_W-1 downto 0) := (others => '0'); -- level -1.
  wf_indx_in_wg       : out natural range 0 to N_WF_CU-1; -- level -1.
  wf_indx_in_CU       : out natural range 0 to N_WF_CU-1; -- level -1.
  alu_en_divStack     : out std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); -- level 2.
  phase               : out unsigned(PHASE_W-1 downto 0) := (others=>'0') -- level -1.
);
  attribute max_fanout of wf_indx_in_CU : signal is 10;
end CU_scheduler; -- }}}
architecture Behavioral of CU_scheduler is
  -- signal definitions -----------------------------------------------------------------------------------{{{
  -- internal signals assignments --------------------------------------------------------------------------{{{
  signal wf_active_i                      : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal sch_ack_i                        : std_logic := '0';
  signal cram_rdAddr_i                    : unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  signal instr_i                          : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal phase_i                          : unsigned(PHASE_W-1 downto 0) := (others=>'0');
  signal wf_indx_in_CU_i                  : natural range 0 to N_WF_CU-1 := 0;
  attribute max_fanout of phase_i : signal is 10;
  ---------------------------------------------------------------------------------------------------------}}}
  -- types & functions {{{
  type wf_ctrl_state is ( idle, check_rdy, rdy, wait_for_selecting_PC, wait_pc_rdy, wait_gmem_finish,
                          jumping, branching, read_PC_stack, scratchpad_load);
  type wf_ctrl_state_vec is array (N_WF_CU-1 downto 0) of wf_ctrl_state;
  signal st_wf, st_wf_n : wf_ctrl_state_vec := (others => idle);
  type CV_state_type is (idle, start_exec, select_PC, check_wf_rdy, read_inst, dly1, dly2, dly3 , select_instr);
  signal st_CV, st_CV_n                   : CV_state_type := idle;
  signal new_instr_found_n                : std_logic := '0';
  signal new_instr_found                  : std_logic := '0';
  -- }}}
  -- workgroup indices {{{
  signal wg_next_id, wg_next_id_n         : unsigned(N_WF_CU_W-1 downto 0) := (others=>'0');
  signal wg_offset_d0, wg_offset_d0_n     : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal wg_offset_d1, wg_offset_d1_n     : unsigned(DATA_W-1 downto 0) := (others=>'0');
  signal wg_offset_d2, wg_offset_d2_n     : unsigned(DATA_W-1 downto 0) := (others=>'0');
  type dx_offset_type is (write_d0, write_d1, write_d2);
  signal dx_offset_state                  : dx_offset_type := write_d0;
  signal dx_offset_state_n                : dx_offset_type := write_d0;
  -- }}}
  -- global signals {{{
  constant WF_WAIT_LEN                    : integer := max(FLOAT_IMPLEMENT*MAX_FPU_DELAY+11, 16);
                -- 16 is the normal delay for instruction that use the ALU
                -- 22 for float delay of 11 (fmul)
                -- 39 for float delay of 28 (fdiv & fsqrt)
  type wf_wait_vec_type is array (natural range <>) of std_logic_vector(WF_WAIT_LEN-1 downto 0);
  signal wf_wait_vec                      : wf_wait_vec_type(N_WF_CU-1 downto 0) := (others=>(others=>'0'));
  signal wf_wait_vec_alu_n                : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal wf_wait_vec_fpu_n                : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal clear_wf_wait_vec                : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal wf_no_wait, wf_no_wait_n         : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal clear_wf_wait_vec_n              : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal sch_rqst_n_wfs_ltchd             : integer range 0 to N_WF_CU := 0;
  signal sch_rqst_n_wfs_ltchd_n           : integer range 0 to N_WF_CU := 0;
  type interface_fsm_stata_type is (free, reserve, write_wg_d0, write_wg_d1, write_wg_d2);
  signal st_WGD_intr, st_WGD_intr_n       : interface_fsm_stata_type := free;
  signal wf_on_gmem, wf_reads_gmem        : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');  
  signal wf_branches                      : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');  
  signal wf_scratchpad_ld                 : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');  
  signal instr_jump                       : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');  
  signal instr_fpu                        : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');  
  signal phase_n                          : unsigned(PHASE_W-1 downto 0) := (others=>'0');
  signal rd_priority, rd_priority_n       : std_logic := '0';

  signal wf_sel_indx, wf_sel_indx_n       : integer range 0 to N_WF_CU-1 := 0;
  signal pc_indx, pc_indx_n               : integer range 0 to N_WF_CU-1 := 0;
    
  signal instr_n, instr_buf_out           : std_logic_vector(DATA_W-1 downto 0) := (others => '0');
  signal PCs, PCs_n, PC_plus_branch_n     : CRAM_ADDR_ARRAY(N_WF_CU-1 downto 0) := (others =>(others=>'0'));
  signal PC_plus_1_n, PC_plus_1           : CRAM_ADDR_ARRAY(N_WF_CU-1 downto 0) := (others =>(others=>'0'));
  signal wf_finish, wf_finish_n           : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_alloc_indx                    : unsigned(N_WF_CU_W-1 downto 0) := (others => '0');
  signal wf_alloc_indx_n                  : unsigned(N_WF_CU_W-1 downto 0) := (others => '0');
  signal pc_rdy                           : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_rdy, wf_rdy_n                 : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_gmem_read_rdy                 : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_gmem_read_rdy_n               : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_gmem_write_rdy                : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_gmem_write_rdy_n              : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal wf_branch_rdy_n, wf_branch_rdy   : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal branch_in_executoin              : std_logic := '0';   
  signal branch_in_executoin_vec          : std_logic_vector(19 downto 0) := (others=>'0');
    -- this signals prevents scheduling two branches successively
  signal branch_in_executoin_n            : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal advance_pc, advance_pc_n         : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');
  signal execute_n, execute               : std_logic := '0';
  signal pc_updated, pc_updated_n         : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal wf_retired                       : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal wf_activate, wf_activate_n       : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');

  signal sch_ack_n                        : std_logic := '0';
  signal wf_active_n                      : std_logic_vector(N_WF_CU-1 downto 0) := (others => '0');

  
  -- }}}
  -- coordinates {{{
  type wf_indx_type is array (0 to N_WF_CU-1) of natural range 0 to N_WF_CU-1;
  signal wf_indx, wf_indx_n              : wf_indx_type := (others => 0);
  signal allocated_wfs, allocated_wfs_n        : natural range 0 to N_WF_CU := 0;
  -- }}}
  -- divergence fifos {{{
  constant N_RECORDS_WF_W                 : integer := 3;
  signal branch_distance                  : branch_distance_vec(0 to N_WF_CU-1) := (others=>(others=>'0'));
  signal divStacks                        : alu_en_vec_type(0 to 2**(PHASE_W+N_RECORDS_WF_W+N_WF_CU_W)-1) := (others=>(others=>'0'));
  signal alu_branch_vec                   : alu_en_vec_type(7 downto 0) := (others=>(others=>'0'));
  signal alu_en_vec                       : alu_en_vec_type(7 downto 0) := (others=>(others=>'0'));
  signal alu_branch_latch                 : alu_en_vec_type(7 downto 0) := (others=>(others=>'0'));
  signal alu_en_latch                     : alu_en_vec_type(7 downto 0) := (others=>(others=>'0'));
  signal divStack_addrb                   : unsigned(PHASE_W+N_RECORDS_WF_W+N_WF_CU_W-1 downto 0) := (others=>'0');
  signal divStack_addra                   : unsigned(PHASE_W+N_RECORDS_WF_W+N_WF_CU_W-1 downto 0) := (others=>'0');
  signal divStack_addra_p0                : unsigned(PHASE_W+N_RECORDS_WF_W+N_WF_CU_W-1 downto 0) := (others=>'0');
  signal divStack_addra_p0_n              : unsigned(PHASE_W+N_RECORDS_WF_W+N_WF_CU_W-1 downto 0) := (others=>'0');
  signal divStack_dia, divStack_dia_n     : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal divStack_wea, divStack_wea_n     : std_logic := '0';
  signal divStack_dob, divStack_dob_n     : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal phase_branch                     : unsigned(PHASE_W-1 downto 0) := (others=>'0');
  signal n_branching_wfs                  : integer range 0 to WF_SIZE := 0;
  signal n_branching_wfs_d0               : integer range 0 to WF_SIZE := 0;
  signal n_not_branching_wfs              : integer range 0 to WF_SIZE := 0;
  signal n_not_branching_wfs_d0           : integer range 0 to WF_SIZE := 0;
  signal branching_wf_index               : integer range 0 to N_WF_CU-1 := 0;
  signal evaluate_divergance              : std_logic := '0';
  signal evaluate_divergance_d0           : std_logic := '0';
  signal true_path, false_path            : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal true_path_n, false_path_n        : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  type active_record_indx_type is array (natural range <>) of unsigned(N_RECORDS_WF_W-1 downto 0);
  signal wf_active_record                 : active_record_indx_type(N_WF_CU-1 downto 0) := (others=>(others=>'0'));
  signal wf_active_record_inc_n           : std_logic := '0';
  signal wf_active_record_dec_n           : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal write_two_records                : std_logic := '0';
  signal write_two_records_n              : std_logic := '0';
  type st_branch_type is (idle, write_true_path_in_divStack, dly_to_false, write_false_path_in_divStack, dly_to_true);
  signal st_branch, st_branch_n           : st_branch_type := idle;
  signal go_true_and_false                : std_logic := '0';
  signal go_true_and_false_n              : std_logic := '0';
  signal wf_indx_in_CU_d0                 : natural range 0 to N_WF_CU-1 := 0;
  signal active_record_indx               : unsigned(N_RECORDS_WF_W-1 downto 0) := (others=>'0');
  signal phase_d0                         : unsigned(PHASE_W-1 downto 0) := (others=>'0');
  -- PC_stack
  constant N_RECORDS_PC_STACK_W           : integer := 4;
  type PC_stack_addr_type is array(natural range <>) of unsigned(N_RECORDS_PC_STACK_W-1 downto 0);
  signal PC_stack_addr                    : PC_stack_addr_type(N_WF_CU-1 downto 0) := (others=>(others=>'0'));
  signal PC_stack_pop                     : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack_pop_n                   : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack_pop_ack                 : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack_pop_ack_p0              : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack_pop_ack_p1              : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack_push_branch             : std_logic := '0';
  signal PC_stack_push_branch_n           : std_logic := '0';
  signal PC_stack_push_not_branch         : std_logic := '0';
  signal PC_stack_push_branch_ack         : std_logic := '0';
  signal PC_stack_push_not_branch_ack     : std_logic := '0';
  signal PC_stack_push_not_branch_n       : std_logic := '0';
  signal PC_stack_push, PC_stack_push_n   : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack_push_ack                : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal PC_stack                         : CRAM_ADDR_ARRAY(0 to 2**(N_RECORDS_PC_STACK_W+N_WF_CU_W)-1) := (others =>(others=>'0'));
  signal PC_stack_jump_entry              : std_logic_vector(0 to 2**(N_RECORDS_PC_STACK_W+N_WF_CU_W)-1) := (others=>'0');
  -- signal PC_stack_dummy_entry             : std_logic_vector(0 to 2**(N_RECORDS_PC_STACK_W+N_WF_CU_W)-1) := (others=>'0');
  -- signal PC_stack_dummy_entry_wrData      : std_logic := '0';
  -- signal PC_stack_dummy_entry_rdData_n    : std_logic := '0';
  -- signal PC_stack_dummy_entry_rdData      : std_logic := '0';
  signal PC_stack_jump_entry_wrData       : std_logic := '0';
  signal PC_stack_wrAddr                  : unsigned(N_RECORDS_PC_STACK_W+N_WF_CU_W-1 downto 0) := (others=>'0');
  signal PC_stack_rdAddr                  : unsigned(N_RECORDS_PC_STACK_W+N_WF_CU_W-1 downto 0) := (others=>'0');
  signal PC_stack_wrData                  : unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  signal PC_stack_rdData                  : unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  signal PC_stack_rdData_n                : unsigned(CRAM_ADDR_W-1 downto 0) := (others=>'0');
  signal PC_stack_jump_entry_rdData_n     : std_logic := '0';
  signal PC_stack_jump_entry_rdData       : std_logic := '0';
  signal PC_stack_we                      : std_logic := '0';
  -- }}}
  ---------------------------------------------------------------------------------------------------------}}}
begin
  -- internal signals assignments -------------------------------------------------------------------------------------------{{{
  ---------------------------------------------------------------------------------------------------------{{{
  wf_active <= wf_active_i;
  sch_ack <= sch_ack_i;
  cram_rdAddr <= cram_rdAddr_i;
  instr <= instr_i;
  phase <= phase_i;
  wf_indx_in_CU <= wf_indx_in_CU_i;
  assert(2**N_RECORDS_WF_W >= WF_SIZE_W) report "increase the number of records per WF" severity failure;
  ---------------------------------------------------------------------------------------------------------}}}
  ---------------------------------------------------------------------------------------------------------}}}
  -- instruction buffer -----------------------------------------------------------------------------------{{{
  CU_instruction_dispatcher_inst: entity CU_instruction_dispatcher  
  port map(
    clk               => clk,
    nrst              => nrst,
    cram_rdAddr       => cram_rdAddr_i,
    cram_rdData       => cram_rdData,
    cram_rqst         => cram_rqst,
    cram_rdAddr_conf  => cram_rdAddr_conf,
    PC_indx           => pc_indx,
    instr             => instr_buf_out,
    PCs               => PCs,
    pc_rdy            => pc_rdy,
    instr_gmem_op     => wf_on_gmem,
    instr_scratchpad_ld => wf_scratchpad_ld,
    instr_gmem_read   => wf_reads_gmem,
    instr_branch      => wf_branches,
    instr_jump        => instr_jump,
    instr_fpu         => instr_fpu,
    wf_active         => wf_active_i,
    pc_updated        => pc_updated,
    branch_distance   => branch_distance,

    wf_retired        => wf_retired
  ); 
  ---------------------------------------------------------------------------------------------------------}}}
  -- WG offset capture ----------------------------------------------------------------------------- {{{
  -- trans process ----------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      wg_offset_d0 <= wg_offset_d0_n;
      wg_offset_d1 <= wg_offset_d1_n;
      wg_offset_d2 <= wg_offset_d2_n;
      if nrst = '0' then
        dx_offset_state <= write_d0;
      else
        dx_offset_state <= dx_offset_state_n;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- comb process -----------------------------------------------------------------------------------------{{{
  process(dx_offset_state, wg_offset_d0, wg_offset_d1, wg_offset_d2, wg_info, sch_rqst) -- rtm_wrData_wg)
  begin
    -- when a sch_rqst for allocating a wg from the WGD; the WGD sends in the first 3 cycles the offsets of the 
    -- corresponding wg. These will be latched here
    dx_offset_state_n <= dx_offset_state;
    wg_offset_d0_n <= wg_offset_d0;
    wg_offset_d1_n <= wg_offset_d1;
    wg_offset_d2_n <= wg_offset_d2;
    case dx_offset_state is 
      when write_d0 =>
        if sch_rqst = '1' then
          -- wg_offset_d0_n <= rtm_wrData_wg(DATA_W-1 downto 0);
          wg_offset_d0_n <= wg_info;
          dx_offset_state_n <= write_d1;
        end if;
      when write_d1 =>
        -- wg_offset_d1_n <= rtm_wrData_wg(DATA_W-1 downto 0);
        wg_offset_d1_n <= wg_info;
        dx_offset_state_n <= write_d2;
      when write_d2 =>
        -- wg_offset_d2_n <= rtm_wrData_wg(DATA_W-1 downto 0);
        wg_offset_d2_n <= wg_info;
        dx_offset_state_n <= write_d0;
    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  ------------------------------------------------------------------------------------------------------}}}
  -- divergence fifos -------------------------------------------------------------------------------------{{{
  -- divStack -------------------------------------------------------------------------------------------{{{
  -- A side: WF Scheduler
  -- B side: CV
  process(clk)
  begin
    if rising_edge(clk) then
      divStack_dob_n <= divStacks(to_integer(divStack_addrb)); -- @ 1.
      divStack_dob <= divStack_dob_n; -- @ 2.
      if divStack_wea = '1' then
        divStacks(to_integer(divStack_addra)) <= divStack_dia;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- divStack CV side --------------------------------------------------------------------------------------{{{
  alu_en_divStack <= divStack_dob; -- level 2.
  divStack_addrb(PHASE_W-1 downto 0) <= phase_d0; -- level 0.
  divStack_addrb(PHASE_W+N_RECORDS_WF_W-1 downto PHASE_W) <= active_record_indx; -- level 0.
  divStack_addrb(PHASE_W+N_WF_CU_W+N_RECORDS_WF_W-1 downto PHASE_W+N_RECORDS_WF_W) <= to_unsigned(wf_indx_in_CU_d0, N_WF_CU_W); -- level 0.
  process(clk)
  begin
    if rising_edge(clk) then
      wf_indx_in_CU_d0 <= wf_indx_in_CU_i; -- @ 0
      -- if phase_i = (phase_i'reverse_range => '0') then
      if execute = '1' then
        active_record_indx <= wf_active_record(wf_indx_in_CU_i); -- @ 0
          -- the if check is necessary to avoid the case where the wf_adtive_record decrements while executing
      end if;
      phase_d0 <= phase_i; -- @ 0
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- divStack WF Scheduler side ----------------------------------------------------------------------------{{{
  -- divStack trnas process --------------------------------------------------------------------------------{{{
  process(clk)
    variable n_not_branching, n_branching : integer range 0 to WF_SIZE := 0;
  begin
    if rising_edge(clk) then
      n_branching := 0;
      n_not_branching := 0;
      if wf_is_branching /= (wf_is_branching'reverse_range => '0') then -- level 18.->24.
        for i in 0 to CV_SIZE-1 loop
          if alu_en(i) = '1' then -- level 18.->24.
            if alu_branch(i) = '1' then -- level 18.->24.
              n_branching := n_branching + 1;
            else
              n_not_branching := n_not_branching + 1;
            end if;
          end if;
        end loop;
      end if;
      if phase_branch = (phase_branch'reverse_range => '0') then -- true in levels 18. & 26.
        n_branching_wfs <= n_branching;
        n_not_branching_wfs <= n_not_branching;
      else
        n_branching_wfs <= n_branching_wfs + n_branching; -- @ 26 is ready
        n_not_branching_wfs <= n_not_branching_wfs + n_not_branching; -- @ 26 is ready
      end if;
      evaluate_divergance <= '0';
      if phase_branch = (phase_branch'reverse_range => '1') then -- level 25.
        evaluate_divergance <= '1'; -- @ 26.
        for i in 0 to N_WF_CU-1 loop
          if wf_is_branching(i) = '1' then -- level 25. (last clock cycle where wf_is_branching is set)
            branching_wf_index <= i; -- @ 26
          end if;
        end loop;
      end if;
      n_branching_wfs_d0 <= n_branching_wfs; -- @ 27.
      n_not_branching_wfs_d0 <= n_not_branching_wfs; -- @ 27.
      evaluate_divergance_d0 <= evaluate_divergance; -- @ 27.
      alu_branch_vec(alu_branch_vec'high-1 downto 0) <= alu_branch_vec(alu_branch_vec'high downto 1); -- @ 20.->26.
      alu_branch_vec(alu_branch_vec'high) <= alu_branch; -- @ 19.
      alu_en_vec(alu_en_vec'high-1 downto 0) <= alu_en_vec(alu_en_vec'high downto 1); -- @ 20.->26.
      alu_en_vec(alu_en_vec'high) <= alu_en; -- @ 19.
      if evaluate_divergance = '1' then -- level 26.
        for i in 0 to PHASE_LEN-1 loop
          alu_branch_latch(i) <= alu_branch_vec(i); -- @ 27.
          alu_en_latch(i) <= alu_en_vec(i); -- @ 27.
        end loop;
      end if;
      if nrst = '0' then
        phase_branch <= (others=>'0');
        branch_in_executoin <= '0';
      else 
        branch_in_executoin_vec(branch_in_executoin_vec'high) <= '0';
        if branch_in_executoin_n /= (branch_in_executoin_n'reverse_range=>'0') then
          branch_in_executoin <= '1';
          branch_in_executoin_vec(branch_in_executoin_vec'high) <= '1';
        end if;
        branch_in_executoin_vec(branch_in_executoin_vec'high-1 downto 0) <= branch_in_executoin_vec(branch_in_executoin_vec'high downto 1);

        if branch_in_executoin_vec(0) = '1' then -- level 26.
          branch_in_executoin <= '0'; -- @ 27.
        end if;
        
        if wf_is_branching /= (wf_is_branching'reverse_range => '0') then -- level 18.->25.
          phase_branch <= phase_branch + 1; -- @ 25. it will be all ones
        end if;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- divStack trans process --------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      go_true_and_false <= go_true_and_false_n;
      divStack_wea <= divStack_wea_n;
      divStack_addra_p0 <= divStack_addra_p0_n;
      divStack_addra <= divStack_addra_p0;
      divStack_dia <= divStack_dia_n;
      false_path <= false_path_n;
      true_path <= true_path_n;
      PC_stack_push_branch <= PC_stack_push_branch_n;
      PC_stack_push_not_branch <= PC_stack_push_not_branch_n;
      
      if nrst = '0' then
        st_branch <= idle;
        wf_active_record <= (others=>(others=>'0'));
        write_two_records <= '0';
      else
        st_branch <= st_branch_n;
        write_two_records <= write_two_records_n;
        if wf_active_record_inc_n = '1' then
          -- incrment commands come form the st_branch state machine when filling new requests
          wf_active_record(branching_wf_index) <= wf_active_record(branching_wf_index) + 1;
        end if;
        for i in 0 to N_WF_CU-1 loop
          if wf_active_record_dec_n(i) = '1' then
              -- decrment commands come from the st_wf state machines on RET instructions
            wf_active_record(i) <= wf_active_record(i) - 1;
          end if;
        end loop;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- divStack comb -----------------------------------------------------------------------------------------{{{
  state_branch: process(st_branch, evaluate_divergance_d0, n_branching_wfs_d0, n_not_branching_wfs_d0, go_true_and_false, 
                        divStack_addra_p0, branching_wf_index, wf_active_record, alu_branch_latch, alu_en_latch, 
                        PC_stack_push_branch, PC_stack_push_not_branch, PC_stack_push_branch_ack, n_branching_wfs, 
                        PC_stack_push_not_branch_ack, write_two_records, evaluate_divergance, n_not_branching_wfs)
  begin
    -- {{{
    st_branch_n <= st_branch;
    go_true_and_false_n <= go_true_and_false;
    divStack_wea_n <= '0';
    divStack_addra_p0_n(PHASE_W-1 downto 0) <= (others=>'0');
    divStack_addra_p0_n(PHASE_W+N_RECORDS_WF_W-1 downto PHASE_W) <= wf_active_record(branching_wf_index);
    divStack_addra_p0_n(PHASE_W+N_RECORDS_WF_W+N_WF_CU_W-1 downto PHASE_W+N_RECORDS_WF_W) <= to_unsigned(branching_wf_index, N_WF_CU_W);
    divStack_dia_n <= alu_branch_latch(to_integer(divStack_addra_p0(PHASE_W-1 downto 0))) or 
                     not alu_en_latch(to_integer(divStack_addra_p0(PHASE_W-1 downto 0)));
    true_path_n <= (others=>'0');
    false_path_n <= (others=>'0');
    PC_stack_push_branch_n <= PC_stack_push_branch;
    PC_stack_push_not_branch_n <= PC_stack_push_not_branch;
    write_two_records_n <= write_two_records;
    
    if PC_stack_push_branch_ack = '1' and write_two_records = '0' then
      PC_stack_push_branch_n <= '0';
    end if;
    if PC_stack_push_not_branch_ack = '1' and write_two_records = '0' then
      PC_stack_push_not_branch_n <= '0';
    end if;
    if PC_stack_push_branch_ack = '1' or PC_stack_push_not_branch_ack = '1' then
      write_two_records_n <= '0';
    end if;

    wf_active_record_inc_n <= '0';
    if evaluate_divergance = '1' and -- level 26.
          wf_active_record(branching_wf_index) = (0 to N_RECORDS_WF_W-1 => '0') and  -- CHANGE
          (n_not_branching_wfs /= 0 and n_branching_wfs /= 0) then
      wf_active_record_inc_n <= '1';
      -- increment the reocord if the current one is the first (all entries are zero) & a branch has been evaluated
      write_two_records_n <= '1';
    end if;
    -- }}}
    case st_branch is
      when idle => -- {{{
        go_true_and_false_n <= '0';
        if evaluate_divergance_d0 = '1' then
          if n_branching_wfs_d0 /= 0 then
            if n_not_branching_wfs_d0 /= 0 then
              go_true_and_false_n <= '1';
              if n_branching_wfs_d0 < n_not_branching_wfs_d0 then
                st_branch_n <= write_false_path_in_divStack;
              else
                st_branch_n <= write_true_path_in_divStack;
              end if;
            else
              true_path_n(branching_wf_index) <= '1';
            end if;
          else
            false_path_n(branching_wf_index) <= '1';
          end if;
        end if;
        -- }}}
      when write_true_path_in_divStack => -- {{{
        divStack_wea_n <= '1';
        divStack_addra_p0_n(PHASE_W-1 downto 0) <= divStack_addra_p0(PHASE_W-1 downto 0) + 1;
        divStack_dia_n <= not (alu_branch_latch(to_integer(divStack_addra_p0(PHASE_W-1 downto 0))) and
                         alu_en_latch(to_integer(divStack_addra_p0(PHASE_W-1 downto 0))));
        if divStack_addra_p0(PHASE_W-1 downto 0) = (0 to PHASE_W-1 => '1') then
          if go_true_and_false = '1' then
            wf_active_record_inc_n <= '1'; -- increments the record if another one has to be written
            st_branch_n <= dly_to_false;
            go_true_and_false_n <= '0';
            PC_stack_push_branch_n <= '1';
          else
            st_branch_n <= idle;
            true_path_n(branching_wf_index) <= '1';
          end if;
        end if;
        -- }}}
      when dly_to_false => -- {{{
        divStack_wea_n <= '0';
        st_branch_n <= write_false_path_in_divStack;
        -- }}}
      when write_false_path_in_divStack => -- {{{
        divStack_wea_n <= '1';
        divStack_addra_p0_n(PHASE_W-1 downto 0) <= divStack_addra_p0(PHASE_W-1 downto 0) + 1;
        divStack_dia_n <= alu_branch_latch(to_integer(divStack_addra_p0(PHASE_W-1 downto 0))) or
                         not alu_en_latch(to_integer(divStack_addra_p0(PHASE_W-1 downto 0)));
        -- control alu_en_latch
        if divStack_addra_p0(PHASE_W-1 downto 0) = (0 to PHASE_W-1 => '1') then
          if go_true_and_false = '1' then
            wf_active_record_inc_n <= '1'; -- increments the record if another one has to be written
            st_branch_n <= dly_to_true;
            go_true_and_false_n <= '0';
            PC_stack_push_not_branch_n <= '1';
          else
            st_branch_n <= idle;
            false_path_n(branching_wf_index) <= '1';
          end if;
        end if;
        -- }}}
      when dly_to_true => -- {{{
        st_branch_n <= write_true_path_in_divStack;
        divStack_wea_n <= '0';
        -- }}}
    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  ---------------------------------------------------------------------------------------------------------}}}
  -- PC STACK --------------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      -- read PC Stack
      -- stage 0
      PC_stack_pop_ack_p1 <= (others=>'0');
      for i in 0 to N_WF_CU-1 loop
        if PC_stack_pop(i) = '1' and PC_stack_pop_ack_p0(i) = '0' and PC_stack_pop_ack_p1(i) = '0' then
           -- pop commands are issued from the st_wf state machines on RET instructions
          PC_stack_rdAddr(N_RECORDS_PC_stack_W-1 downto 0) <= PC_stack_addr(i) - 1;
          PC_stack_addr(i) <= PC_stack_addr(i) - 1;
          PC_stack_rdAddr(N_RECORDS_PC_stack_W+N_WF_CU_W-1 downto N_RECORDS_PC_stack_W) <= to_unsigned(i, N_WF_CU_W);
          PC_stack_pop_ack_p1(i) <= '1';
          exit;
        end if;
      end loop;
      -- stage 1
      PC_stack_rdData_n <= PC_stack(to_integer(PC_stack_rdAddr));
      PC_stack_jump_entry_rdData_n <= PC_stack_jump_entry(to_integer(PC_stack_rdAddr));
      -- PC_stack_dummy_entry_rdData_n <= PC_stack_dummy_entry(to_integer(PC_stack_rdAddr));
      PC_stack_pop_ack_p0 <= PC_stack_pop_ack_p1;
      -- stage 2
      PC_stack_rdData <= PC_stack_rdData_n;
      PC_stack_jump_entry_rdData <= PC_stack_jump_entry_rdData_n;
      -- PC_stack_dummy_entry_rdData <= PC_stack_dummy_entry_rdData_n;
      PC_stack_pop_ack <= PC_stack_pop_ack_p0;

      -- select push command
      PC_stack_push_ack <= (others=>'0');
      PC_stack_push_branch_ack <= '0';
      PC_stack_push_not_branch_ack <= '0';
      if PC_stack_push_branch = '1' and PC_stack_push_branch_ack = '0' then 
        PC_stack_push_branch_ack <= '1';
      elsif PC_stack_push_not_branch = '1' and PC_stack_push_not_branch_ack = '0' then
        PC_stack_push_not_branch_ack <= '1';
      else
        for i in 0 to N_WF_CU-1 loop
          if PC_stack_push(i) = '1' and PC_stack_push_ack(i) = '0' then
            PC_stack_push_ack(i) <= '1';
            exit;
          end if;
        end loop;
      end if;

      -- write PC Stack
      -- push commands come from the st_branch state machine when two records have to be written into divStacks
      PC_stack_we <= '0';
      if PC_stack_push_branch_ack = '1' then
        PC_stack_we <= '1';
        PC_stack_addr(branching_wf_index) <= PC_stack_addr(branching_wf_index) + 1;
        PC_stack_wrAddr(N_RECORDS_PC_STACK_W-1 downto 0) <= PC_stack_addr(branching_wf_index);
        PC_stack_wrAddr(N_RECORDS_PC_STACK_W+N_WF_CU_W-1 downto N_RECORDS_PC_STACK_W) <= to_unsigned(branching_wf_index, N_WF_CU_W);
        PC_stack_wrData <= PC_plus_branch_n(branching_wf_index);
        PC_stack_jump_entry_wrData <= '0';
        -- PC_stack_dummy_entry_wrData <= write_two_records;
      elsif PC_stack_push_not_branch_ack = '1' then
        PC_stack_we <= '1';
        PC_stack_addr(branching_wf_index) <= PC_stack_addr(branching_wf_index) + 1;
        PC_stack_wrAddr(N_RECORDS_PC_STACK_W-1 downto 0) <= PC_stack_addr(branching_wf_index);
        PC_stack_wrAddr(N_RECORDS_PC_STACK_W+N_WF_CU_W-1 downto N_RECORDS_PC_STACK_W) <= to_unsigned(branching_wf_index, N_WF_CU_W);
        PC_stack_wrData <= PCs(branching_wf_index);
        PC_stack_jump_entry_wrData <= '0';
        -- PC_stack_dummy_entry_wrData <= write_two_records;
      else
        for i in 0 to N_WF_CU-1 loop
          if PC_stack_push_ack(i) = '1' then
            PC_stack_we <= '1';
            PC_stack_addr(i) <= PC_stack_addr(i) + 1;
            PC_stack_wrAddr(N_RECORDS_PC_STACK_W-1 downto 0) <= PC_stack_addr(i);
            PC_stack_wrAddr(N_RECORDS_PC_STACK_W+N_WF_CU_W-1 downto N_RECORDS_PC_STACK_W) <= to_unsigned(i, N_WF_CU_W);
            PC_stack_wrData <= PC_plus_1(i);
            PC_stack_jump_entry_wrData <= '1';
            -- PC_stack_dummy_entry_wrData <= '0';
            exit;
          end if;
        end loop;
      end if;

      if PC_stack_we = '1' then
        PC_stack(to_integer(PC_stack_wrAddr)) <= PC_stack_wrData;
        PC_stack_jump_entry(to_integer(PC_stack_wrAddr)) <= PC_stack_jump_entry_wrData;
        -- PC_stack_dummy_entry(to_integer(PC_stack_wrAddr)) <= PC_stack_dummy_entry_wrData;
      end if;
      
      if nrst = '0' then
        PC_stack_addr <= (others=>(others=>'0'));
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  ---------------------------------------------------------------------------------------------------------}}}
  -- Interface to WGD  ----------------------------------------------------------------------------- {{{
  -- trans process ----------------------------------------------------------------------------------------{{{
  interface_fsm_trans: process(clk)
  begin
    if rising_edge(clk) then
        wf_alloc_indx <= wf_alloc_indx_n;
        wf_finish <= wf_finish_n;
        allocated_wfs <= allocated_wfs_n;
        wf_indx <= wf_indx_n;  
        sch_rqst_n_wfs_ltchd <= sch_rqst_n_wfs_ltchd_n;
        wf_activate <= wf_activate_n;
      if nrst = '0' then
        st_WGD_intr <= free;
        wg_next_id <= (others=>'0');
        sch_ack_i <= '0';
      else
        st_WGD_intr <= st_WGD_intr_n;
        wg_next_id <= wg_next_id_n;
        sch_ack_i <= sch_ack_n;
      end if;
        
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- comb process -----------------------------------------------------------------------------------------{{{
  interface_fsm_comb: process(st_WGD_intr, sch_rqst, sch_rqst_n_wfs_ltchd, wf_alloc_indx, wf_active_i,
    sch_rqst_n_wfs_m1, allocated_wfs, wf_indx, wg_next_id, -- wg_next_id,
    wg_offset_d0, wg_offset_d1, wg_offset_d2)
  begin
    st_WGD_intr_n <= st_WGD_intr;
    wf_finish_n <= (others => '0');
    wf_alloc_indx_n <= wf_alloc_indx;
    sch_rqst_n_wfs_ltchd_n <= sch_rqst_n_wfs_ltchd;
    allocated_wfs_n <= allocated_wfs;
    wf_indx_n <= wf_indx;
    wg_next_id_n <= wg_next_id;
    rtm_we_cv <= '0';
    rtm_wrAddr_cv(N_WF_CU_W-1 downto 0) <= wf_alloc_indx;
    rtm_wrAddr_cv(N_WF_CU_W+1 downto N_WF_CU_W) <= "00";
    rtm_wrData_cv <= wg_offset_d0;
    wf_activate_n <= (others=>'0');
    sch_ack_n <= '0';
    case st_WGD_intr is
      when free => -- {{{
        if sch_rqst = '1' then 
          st_WGD_intr_n <= reserve;
          wf_alloc_indx_n <= (others => '0');
          sch_rqst_n_wfs_ltchd_n <= to_integer(sch_rqst_n_wfs_m1) + 1;
          allocated_wfs_n <= 0;
          wg_next_id_n <= wg_next_id + 1;
        end if;
        -- }}}
      when reserve => -- {{{
        if wf_active_i(to_integer(wf_alloc_indx)) = '0' then
          allocated_wfs_n <= allocated_wfs + 1;
          wf_activate_n(to_integer(wf_alloc_indx)) <= '1';
          wf_indx_n(to_integer(wf_alloc_indx)) <= allocated_wfs;
          -- wg_ids_n(to_integer(wf_alloc_indx)) <= wg_next_id;
          st_WGD_intr_n <= write_wg_d0;
        else
          wf_alloc_indx_n <= wf_alloc_indx + 1;
        end if;
      when write_wg_d0 =>
        rtm_we_cv <= '1';
        st_WGD_intr_n <= write_wg_d1;
        rtm_wrData_cv <= wg_offset_d0;
        rtm_wrAddr_cv(N_WF_CU_W+1 downto N_WF_CU_W) <= "00";
      when write_wg_d1 =>
        rtm_we_cv <= '1';
        st_WGD_intr_n <= write_wg_d2;
        rtm_wrData_cv <= wg_offset_d1;
        rtm_wrAddr_cv(N_WF_CU_W+1 downto N_WF_CU_W) <= "01";
      when write_wg_d2 =>
        rtm_we_cv <= '1';
        rtm_wrData_cv <= wg_offset_d2;
        rtm_wrAddr_cv(N_WF_CU_W+1 downto N_WF_CU_W) <= "10";
        wf_alloc_indx_n <= wf_alloc_indx + 1;
        if allocated_wfs = sch_rqst_n_wfs_ltchd then
          st_WGD_intr_n <= free;
          sch_ack_n <= '1';
        else
          st_WGD_intr_n <= reserve;
        end if;
        -- }}}
    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  --------------------------------------------------------------------------------------------}}}
  -- WFs FSMs  ----------------------------------------------------------------------------- {{{
  -- WFs trans process ------------------------------------------------------------------------------------{{{
  WFS_fsms_trans: process(clk)
  begin
    if rising_edge(clk) then
      PCs <= PCs_n;
      PC_stack_push <= PC_stack_push_n;
      PC_plus_1 <= PC_plus_1_n;
      for i in 0 to N_WF_CU-1 loop
        wf_wait_vec(i)(WF_WAIT_LEN-2 downto 0) <= wf_wait_vec(i)(WF_WAIT_LEN-1 downto 1);
        if wf_wait_vec_alu_n(i) = '1' then
          wf_wait_vec(i)(14) <= '1';
        end if;
        wf_wait_vec(i)(WF_WAIT_LEN-1) <= wf_wait_vec_fpu_n(i);
        if clear_wf_wait_vec(i) = '0' then
          if wf_wait_vec(i)(0) = '1' then
            wf_wait_vec(i)(0) <= '1';
          end if;
        else
          wf_wait_vec(i)(0) <= '0';
        end if;
      end loop;
      clear_wf_wait_vec <= clear_wf_wait_vec_n;
      wf_no_wait <= wf_no_wait_n;
      if nrst = '0' then
        st_wf <= (others=>idle);
        wf_active_i <= (others=>'0');
        wf_rdy <= (others=>'0');
        wf_gmem_read_rdy <= (others=>'0');
        wf_gmem_write_rdy <= (others=>'0');
        wf_branch_rdy <= (others=>'0');
        PC_stack_pop <= (others=>'0');
      else
        st_wf <= st_wf_n;
        wf_rdy <= wf_rdy_n;
        wf_gmem_read_rdy <= wf_gmem_read_rdy_n;
        wf_branch_rdy <= wf_branch_rdy_n;
        wf_gmem_write_rdy <= wf_gmem_write_rdy_n;
        wf_active_i <= wf_active_n;
        PC_stack_pop <= PC_stack_pop_n;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- WFs comb process -------------------------------------------------------------------------------------{{{
  WFS_fsms_comb:for i in 0 to N_WF_CU-1 generate
    -- {{{
    wf_rdy_n(i) <= '1' when st_wf_n(i)=rdy else '0';
    wf_gmem_read_rdy_n(i) <= '1' when st_wf_n(i) = rdy and wf_reads_gmem(i) = '1' else '0';
    wf_gmem_write_rdy_n(i) <= '1' when st_wf_n(i) = rdy and wf_reads_gmem(i) = '0' and wf_on_gmem(i) = '1' else '0';
    wf_branch_rdy_n(i) <= '1' when st_wf_n(i) = rdy and wf_branches(i) = '1' else '0';
    PC_plus_branch_n(i) <= PCs(i) + resize(branch_distance(i), CRAM_ADDR_W);
    PC_plus_1_n(i) <= PCs(i) + 1;
    -- }}}
    process(st_wf(i), PCs(i), start_addr, wf_active_i(i), advance_pc(i), pc_rdy(i), wf_on_gmem(i), gmem_finish(i),  -- {{{
            instr_jump(i), instr_fpu(i), true_path(i), false_path(i), PC_plus_branch_n(i), PC_stack_addr(i),
            wf_activate(i), wf_retired(i), wf_branches(i), PC_stack_pop(i), PC_stack_pop_ack(i), PC_stack_rdData, --PC_stack_dummy_entry_rdData,
            PC_stack_pop_ack_p1(i), pc_updated(i), PC_stack_push_ack(i), PC_plus_1_n(i), PC_stack_jump_entry_rdData, wf_active_record(i),
            wf_scratchpad_ld(i), branch_in_executoin, wf_wait_vec(i)(0), wf_no_wait(i)) -- }}}
    begin
      st_wf_n(i) <= st_wf(i); -- {{{
      PCs_n(i) <= PCs(i);
      pc_updated_n(i) <= '0';
      wf_active_n(i) <= wf_active_i(i);
      PC_stack_pop_n(i) <= PC_stack_pop(i);
      wf_active_record_dec_n(i) <= '0';
      PC_stack_push_n(i) <= '0';
      branch_in_executoin_n(i) <= '0';
      wf_wait_vec_alu_n(i) <= '0';
      wf_wait_vec_fpu_n(i) <= '0';
      clear_wf_wait_vec_n(i) <= '0';
      wf_no_wait_n(i) <= wf_no_wait(i);
       --}}}
      case st_wf(i) is
        when idle => -- {{{
          wf_no_wait_n(i) <= '1';
          if wf_activate(i) = '1' then
            st_wf_n(i) <= wait_pc_rdy;
            PCs_n(i) <= start_addr;
            pc_updated_n(i) <= '1';
            wf_active_n(i) <= '1';
          end if; -- }}}
        when check_rdy => -- {{{
          if pc_rdy(i) = '1' and (wf_wait_vec(i)(0) = '1' or wf_no_wait(i) = '1') then
            wf_no_wait_n(i) <= '0';
            if wf_retired(i) = '1' then
              if PC_stack_addr(i) > 0 then
                st_wf_n(i) <= read_PC_stack;
                PC_stack_pop_n(i) <= '1';
                clear_wf_wait_vec_n(i) <= '1';
              else
                st_wf_n(i) <= idle;
                wf_active_n(i) <= '0';
                clear_wf_wait_vec_n(i) <= '1';
              end if;
            elsif instr_jump(i) = '1' then
              st_wf_n(i) <= jumping;
            elsif wf_on_gmem(i) = '1' then
              st_wf_n(i) <= rdy;
              clear_wf_wait_vec_n(i) <= '1';
            elsif wf_branches(i) = '1' then
              if branch_in_executoin = '0' then
                st_wf_n(i) <= rdy;
                clear_wf_wait_vec_n(i) <= '1';
              else
                wf_no_wait_n(i) <= '1';
              end if;
            else
                st_wf_n(i) <= rdy;
                clear_wf_wait_vec_n(i) <= '1';
            end if;
          end if; -- }}}
        when read_PC_stack => -- {{{
          wf_no_wait_n(i) <= '1';
          if PC_stack_pop_ack_p1(i) = '1' then
            PC_stack_pop_n(i) <= '0';
          end if;
          if PC_stack_pop_ack(i) = '1' then
            PCs_n(i) <= PC_stack_rdData;
            if PC_stack_jump_entry_rdData = '0' and wf_active_record(i) = to_unsigned(1, N_RECORDS_WF_W) then
                -- 1. condition: '0' means it is not a jump entry, i.e. it is a branch entry
                -- 2. condition: it is the last record, i.e. all branches have been processed (there may be jumps)
              if PC_stack_addr(i) = to_unsigned(0, N_RECORDS_WF_W) then
                -- nothing to do further, the wavefront has to retire
                st_wf_n(i) <= idle;
                wf_active_n(i) <= '0';
                clear_wf_wait_vec_n(i) <= '1';
              else
                -- there are still entries to be processed
                PC_stack_pop_n(i) <= '1';
              end if;
            -- elsif PC_stack_dummy_entry_rdData = '1' then
            --   PC_stack_pop_n(i) <= '1';
            else
              pc_updated_n(i) <= '1';
            end if;
            if PC_stack_jump_entry_rdData = '0' then
              wf_active_record_dec_n(i) <= '1';
            end if;
          end if;
          if pc_updated(i) = '1' then
            st_wf_n(i) <= check_rdy;
          end if;
          -- }}}
        when rdy => --{{{
          -- the order is important
          if wf_branches(i) = '1' and branch_in_executoin = '1' then
            st_wf_n(i) <= check_rdy;
            wf_no_wait_n(i) <= '1';
          end if;
          -- assert wf_branches(i) = '0' or branch_in_executoin = '0' or advance_pc(i) = '0' severity failure;
          if advance_pc(i) = '1' then
            PCs_n(i) <= PC_plus_1_n(i);
            if instr_fpu(i) = '1' then
              wf_wait_vec_fpu_n(i) <= '1';
            else
              wf_wait_vec_alu_n(i) <= '1';
            end if;
            pc_updated_n(i) <= '1';
            if wf_on_gmem(i) = '1' then
              st_wf_n(i) <= wait_gmem_finish;
            elsif wf_branches(i) = '1' then
              st_wf_n(i) <= branching;
              pc_updated_n(i) <= '0';
              branch_in_executoin_n(i) <= '1';
            elsif wf_scratchpad_ld(i) = '1' then
              st_wf_n(i) <= scratchpad_load;
            else
              st_wf_n(i) <= wait_for_selecting_PC;
            end if;
          end if;
          -- }}}
        when wait_for_selecting_PC => -- {{{
          st_wf_n(i) <= wait_pc_rdy; -- }}}
        when wait_pc_rdy => -- {{{
          st_wf_n(i) <= check_rdy; 
        -- }}}
        when wait_gmem_finish => -- {{{
          if gmem_finish(i) = '1' then 
            st_wf_n(i) <= check_rdy;
          end if; -- }}}
        when jumping => -- {{{
          PC_stack_push_n(i) <= '1';
          if PC_stack_push_ack(i) = '1' then
            PC_stack_push_n(i) <= '0';
            pc_updated_n(i) <= '1';
            st_wf_n(i) <= wait_for_selecting_PC;
            PCs_n(i) <= PC_plus_branch_n(i);
          end if;
        -- }}}
        when branching => -- {{{
          if true_path(i) = '1' then
            PCs_n(i) <= PC_plus_branch_n(i);
            pc_updated_n(i) <= '1';
            st_wf_n(i) <= wait_for_selecting_PC;
          elsif false_path(i) = '1' then
            pc_updated_n(i) <= '1';
            st_wf_n(i) <= wait_for_selecting_PC;
          end if; -- }}}
        when scratchpad_load => -- {{{
          -- it should wait for extra 3 clock cycles
          if wf_wait_vec(i)(0) = '1' then
            wf_no_wait_n(i) <= '1';
            st_wf_n(i) <= wait_for_selecting_PC;
          end if;
          -- }}}
      end case;
    end process;
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}
  -----------------------------------------------------------------------------------------}}}
  -- CV-Side FSM  ----------------------------------------------------------------------------- {{{
  -- trans process ----------------------------------------------------------------------------------------{{{
  CV_side_trans: process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        st_CV <= idle;
        advance_pc <= (others=>'0');
        phase_i <= (others=>'0');
        new_instr_found <= '0';
        -- for timing
        wf_sel_indx <= 0;
        pc_indx <= 0;
        wf_indx_in_wg <= 0;
        wf_indx_in_CU_i <= 0;
        instr_i <= (others=>'0');
        pc_updated <= (others=>'0');
        rd_priority <= '0';
      else
        rd_priority <= rd_priority_n;
        st_CV <= st_CV_n;
        wf_sel_indx <= wf_sel_indx_n;
        advance_pc <= advance_pc_n;
        phase_i <= phase_n;
        pc_indx <= pc_indx_n;
        execute <= execute_n;
        if execute_n = '1' then
          wf_indx_in_wg <= wf_indx(wf_sel_indx_n);
          wf_indx_in_CU_i <= wf_sel_indx_n;
        end if;
        instr_i <= instr_n;
        pc_updated <= pc_updated_n;
        new_instr_found <= new_instr_found_n;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- comb process ----------------------------------------------------------------------------{{{
  CV_side_comb: process(st_CV, wf_sel_indx, wf_rdy, sch_rqst, instr_buf_out, phase_i,
              pc_indx, pc_indx_n, wf_branch_rdy,
              new_instr_found, instr_i, wf_gmem_read_rdy, wf_gmem_write_rdy, rd_priority)
  begin
    -- {{{
    st_CV_n <= st_CV;
    rd_priority_n <= rd_priority;
    advance_pc_n <= (others => '0');
    wf_sel_indx_n <= wf_sel_indx;
    execute_n <= '0';
    instr_n <= instr_i;
    phase_n <= phase_i + 1;
    pc_indx_n <= pc_indx;
    new_instr_found_n <= new_instr_found;
    if phase_i = (phase_i'reverse_range => '1') then
      instr_n <= (others=>'0');
    end if;
    -- }}}
    case st_CV is
      when idle => -- {{{
        phase_n <= (others=>'0');
        if sch_rqst = '1' then
          st_CV_n <= check_wf_rdy;
        end if; 
      -- }}}
      when check_wf_rdy =>  -- {{{
        new_instr_found_n <= '0';
        if phase_i(1 downto 0) = "00" then
          if wf_rdy /= (wf_rdy'reverse_range =>'0') then
            st_CV_n <= select_PC;
            pc_indx_n <= pri_enc(wf_rdy);
            if wf_branch_rdy /= (wf_branch_rdy'reverse_range => '0') then
              pc_indx_n <= pri_enc(wf_branch_rdy);
            end if;
            if rd_priority = '1' then
              if wf_gmem_read_rdy /= (wf_gmem_read_rdy'reverse_range => '0') then
                pc_indx_n <= pri_enc(wf_gmem_read_rdy);
              elsif wf_gmem_write_rdy /= (wf_gmem_write_rdy'reverse_range => '0') then
                pc_indx_n <= pri_enc(wf_gmem_write_rdy);
                -- rd_priority_n <= '0';
              end if;
            else
              if wf_gmem_write_rdy /= (wf_gmem_write_rdy'reverse_range => '0') then
                pc_indx_n <= pri_enc(wf_gmem_write_rdy);
              elsif wf_gmem_read_rdy /= (wf_gmem_read_rdy'reverse_range => '0') then
                pc_indx_n <= pri_enc(wf_gmem_read_rdy);
                rd_priority_n <= '1';
              end if;
            end if;
            advance_pc_n <= (others => '0');
            advance_pc_n(pc_indx_n) <= '1';
            new_instr_found_n <= '1';
          end if;
        end if;
        -- }}}
      when select_PC =>  -- {{{
        -- PC is incremented in this clock cycle, st_wf is moving to wait_for_selecting_PC, PC_slctd is being prepared in the buffuer module
        st_CV_n <= select_instr;
      when select_instr => -- st_wf is wait_pc_ready, pc_rdy is being calculated in the buffer module
        if new_instr_found = '1' then
          st_CV_n <= read_inst;
        else
          st_CV_n <= check_wf_rdy;
        end if;
        -- }}}
      when read_inst => -- {{{
        -- st_wf is check_rdy, the instruction is at the output of the buffer module, phase(0) = '1'
        execute_n <= '1';
        st_CV_n <= start_exec;
        wf_sel_indx_n <= pc_indx;
        phase_n <= (others=>'0');
        instr_n <= instr_buf_out;
        -- }}}
      when start_exec => -- {{{
        st_CV_n <= dly1;
      -- }}}
      when dly1 => -- {{{
        st_CV_n <= dly2;
      -- }}}
      when dly2 => -- {{{
        st_CV_n <= dly3;
      -- }}}
      when dly3 => -- {{{
        st_CV_n <= check_wf_rdy;
      -- }}}
    end case;
  
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  --------------------------------------------------------------------------------------------------- }}}
end Behavioral;

