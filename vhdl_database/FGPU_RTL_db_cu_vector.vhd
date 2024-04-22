-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity cu_vector is  -- {{{
port(
  -- CU Scheduler signals
  instr                   : in std_logic_vector(DATA_W-1 downto 0); -- level 0.
  wf_indx, wf_indx_in_wg  : in natural range 0 to N_WF_CU-1; -- level 0.
  phase                   : in unsigned(PHASE_W-1 downto 0); -- level 0.
  alu_en_divStack         : in std_logic_vector(CV_SIZE-1 downto 0); -- level 2.

  -- RTM signals
  rdAddr_alu_en           : out unsigned(N_WF_CU_W+PHASE_W-1 downto 0); -- level 2.
  rdData_alu_en           : in std_logic_vector(CV_SIZE-1 downto 0); -- level 4.
  rtm_rdAddr              : out unsigned(RTM_ADDR_W-1 downto 0); -- level 13.
  rtm_rdData              : in unsigned(RTM_DATA_W-1 downto 0); -- level 15.

  -- gmem signals
  gmem_re, gmem_we        : out std_logic; -- level 17.
  mem_op_type             : out std_logic_vector(2 downto 0); -- level 17.
  mem_addr                : out GMEM_ADDR_ARRAY(CV_SIZE-1 downto 0); -- level 17.
  mem_rd_addr             : out unsigned(REG_FILE_W-1 downto 0); -- level 17.
  mem_wrData              : out SLV32_ARRAY(CV_SIZE-1 downto 0); -- level 17.
  alu_en                  : out std_logic_vector(CV_SIZE-1 downto 0); -- level 17.
  alu_en_pri_enc          : out integer range 0 to CV_SIZE-1; -- level 17.
  lmem_rqst, lmem_we      : out std_logic; -- level 17.
  smem_rqst, smem_we      : out std_logic; -- level 17.
  gmem_atomic             : out std_logic; -- level 17.

  --branch
  wf_is_branching         : out std_logic_vector(N_WF_CU-1 downto 0); -- level 18.
  alu_branch              : out std_logic_vector(CV_SIZE-1 downto 0); -- level 18.

  mem_regFile_wrAddr      : in unsigned(REG_FILE_W-1 downto 0); -- stage -1 (stable for 3 clock cycles)
  mem_regFile_we          : in std_logic_vector(CV_SIZE-1 downto 0); -- stage 0 (stable for 2 clock cycles) (level 20. for loads from lmem)
  mem_regFile_wrData      : in SLV32_ARRAY(CV_SIZE-1 downto 0); -- stage 0 (stabel for 2 clock cycles)

  lmem_regFile_we_p0      : in std_logic; -- level 19.

  smem_regFile_we         : in std_logic_vector(CV_SIZE-1 downto 0); -- level 19.

  wf_sync_retired         : out std_logic_vector(N_WF_CU-1 downto 0);
  -- wf_sync_retired(i) = '1' if the wi of the currently active record within the i-th wf have reached the wi barrier
  wi_barrier_reached      : out std_logic_vector(N_WF_CU-1 downto 0);
  -- wi_barrier_reached(i) = '1' if all the wi of the i-th wf have reached the wi barrier

  -- debug
  debug_op_counter_per_cu : out unsigned(2*DATA_W-1 downto 0);
  debug_reset_all_counters: in std_logic;

  cu_is_working           : in std_logic;

  clk, nrst               : in std_logic
);
  -- XDC: attribute max_fanout of wf_indx : signal is 10;
end cu_vector; -- }}}

architecture Behavioral of cu_vector is
  -- signals definitions -------------------------------------------------------------------------------------- {{{
  ----------------- RTM & Initial ALU enable
  type rtm_rdAddr_vec_type is array (natural range <>) of unsigned(RTM_ADDR_W-1 downto 0);
  signal rtm_rdAddr_vec                   : rtm_rdAddr_vec_type(9 downto 0);
  signal rdData_alu_en_vec                : alu_en_vec_type(MAX_FPU_DELAY+6 downto 0);
  signal rtm_rdData_d0                    : unsigned(RTM_DATA_W-1 downto 0);
  signal alu_en_divStack_vec              : alu_en_vec_type(2 downto 0);
  signal rdAddr_alu_en_p0                 : unsigned(N_WF_CU_W+PHASE_W-1 downto 0);
  signal alu_en_i                         : std_logic_vector(CV_SIZE-1 downto 0);

  ------------------ global use
  signal phase_d0, phase_d1               : unsigned( PHASE_W-1 downto 0);
  signal op_arith_shift, op_arith_shift_n : op_arith_shift_type;

  ------------------ decoding
  signal family                           : std_logic_vector(FAMILY_W-1 downto 0);
  signal code                             : std_logic_vector(CODE_W-1 downto 0);
  signal inst_rd_addr, inst_rs_addr       : std_logic_vector(WI_REG_ADDR_W-1 downto 0);
  signal inst_rt_addr                     : std_logic_vector(WI_REG_ADDR_W-1 downto 0);
  type dim_vec_type is array (natural range <>) of std_logic_vector(1 downto 0);
  signal dim_vec                          : dim_vec_type(1 downto 0);
  signal dim                              : std_logic_vector(1 downto 0);
  type params_vec_type is array (natural range <>) of std_logic_vector(N_PARAMS_W-1 downto 0);
  signal params_vec                       : params_vec_type(1 downto 0);
  signal params                           : std_logic_vector(N_PARAMS_W-1 downto 0);
  type family_vec_type is array(natural range <>) of std_logic_vector(FAMILY_W-1 downto 0);
  signal family_vec                       : family_vec_type(MAX_FPU_DELAY+10 downto 0);
  signal family_vec_at_16                 : std_logic_vector(FAMILY_W-1 downto 0); -- this signal is extracted out of family_vec to dcrease the fanout @family_vec(..@16)
  -- XDC: attribute max_fanout of family_vec_at_16: signal is 40;
  signal branch_on_zero                   : std_logic;
  signal branch_on_not_zero               : std_logic;
  signal wf_is_branching_p0               : std_logic_vector(N_WF_CU-1 downto 0);
  signal code_vec                         : code_vec_type(15 downto 0);
  type immediate_vec_type is array(natural range <>) of std_logic_vector(IMM_W-1 downto 0);
  signal immediate_vec                    : immediate_vec_type(5 downto 0);
  type wf_indx_array is array (natural range <>) of natural range 0 to N_WF_CU-1;
  signal wf_indx_vec                      : wf_indx_array(15 downto 0);
  signal wf_indx_in_wg_vec                : wf_indx_array(1 downto 0);
  ------------------ register file
  signal rs_addr, rt_addr, rd_addr        : unsigned(REG_FILE_BLOCK_W-1 downto 0);
  type op_arith_shift_vec_type is array(natural range <>) of op_arith_shift_type;
  signal op_arith_shift_vec               : op_arith_shift_vec_type(4 downto 0);
  signal op_logical_v                     : std_logic;
  signal regBlock_re                      : std_logic_vector(N_REG_BLOCKS-1 downto 0);
  -- attribute max_fanout of regBlock_re    : signal is 10;
  signal regBlocK_re_n                    : std_logic;
  signal reg_we_alu, reg_we_alu_n         : std_logic_vector(CV_SIZE-1 downto 0);
  signal reg_we_div                       : std_logic_vector(CV_SIZE-1 downto 0);
  signal reg_we_float                     : std_logic_vector(CV_SIZE-1 downto 0);
  signal res_alu                          : SLV32_ARRAY(CV_SIZE-1 downto 0);
  type rd_out_vec_type is array (natural range <>) of slv32_array(CV_SIZE-1 downto 0);
  signal rd_out_vec                       : rd_out_vec_type(6 downto 0);

  ------------------ global memory
  signal gmem_re_p0, gmem_we_p0           : std_logic;
  signal gmem_ato_p0                      : std_logic;
  -------------------------------------------------------------------------------------}}}

  -- write back into regFiles  {{{
  type regBlock_we_vec_type is array(natural range <>) of std_logic_vector(N_REG_BLOCKS-1 downto 0);
  signal regBlock_we                      : regBlock_we_vec_type(CV_SIZE-1 downto 0);
  signal regBlock_we_alu                  : std_logic_vector(N_REG_BLOCKS-1 downto 0);
  -- XDC: attribute max_fanout of regBlock_we_alu : signal is 50;
  signal regBlock_we_mem                  : std_logic_vector(N_REG_BLOCKS-1 downto 0);
  signal wrAddr_regFile_vec               : reg_addr_array(MAX_FPU_DELAY+12 downto 0);
  signal regBlock_wrAddr                  : reg_file_block_matrix(CV_SIZE-1 downto 0);
  signal wrData_alu                       : SLV32_ARRAY(CV_SIZE-1 downto 0);
  type regBlock_wrData_type is array(natural range <>) of slv32_array(N_REG_BLOCKS-1 downto 0);
  signal regBlock_wrData                  : regBlock_wrData_type(CV_SIZE-1 downto 0);
  signal rtm_rdData_nlid_vec              : std_logic_vector(3 downto 0);
  signal res_low                          : SLV32_ARRAY(CV_SIZE-1 downto 0);
  -- signal res_alu_clk2x_d0                 : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal res_high                         : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal reg_we_mov_vec                   : alu_en_vec_type(6 downto 0);
  signal mem_regFile_wrAddr_d0            : unsigned(REG_FILE_W-1 downto 0);
  signal lmem_regFile_we                  : std_logic;
  -- }}}

  -- divisor {{{
  signal div_a, div_b                     : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal div_valid                        : std_logic_vector(CV_SIZE-1 downto 0);
  signal res_div                          : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal res_div_d0                       : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal regBlock_we_div                  : std_logic_vector(N_REG_BLOCKS-1 downto 0);
  signal regBlock_we_div_vec              : regBlock_we_vec_type(DIV_DELAY-8 downto 0);
  -- }}}

  -- floating point {{{
  signal float_a, float_b                 : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal res_float                        : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal res_float_d0                     : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal res_float_d1                     : SLV32_ARRAY(CV_SIZE-1 downto 0);
  signal regBlock_we_float_vec            : regBlock_we_vec_type(MAX_FPU_DELAY-7 downto 0);
  signal regBlock_we_float                : std_logic_vector(N_REG_BLOCKS-1 downto 0);
  -- XDC: attribute max_fanout of regBlock_we_float : signal is 50;
  -- }}}


  -- sync {{{

  type st_sync_state is (idle, level_5, level_6, level_7, level_8, level_9, level_10, level_11, level_12, level_13, level_14);
  type st_sync_state_vec is array (N_WF_CU-1 downto 0) of st_sync_state;

  signal st_sync, st_sync_n                                   : st_sync_state_vec;
    -- state of the sync FSM
  signal wi_barrier, wi_barrier_n                             : wi_barrier_type(N_WF_CU-1 downto 0);
  signal wi_barrier_in_execution, wi_barrier_in_execution_n   : std_logic_vector(N_WF_CU-1 downto 0);
  signal start_sync_FSM                                       : std_logic_vector(N_WF_CU-1 downto 0);
  signal wi_barrier_reached_n, wi_barrier_reached_i           : std_logic_vector(N_WF_CU-1 downto 0);
  signal wf_sync_retired_n, wf_sync_retired_i                 : std_logic_vector(N_WF_CU-1 downto 0);
  -- }}}



  -- shared memory {{{
  signal   smem_regFile_we_d0             : std_logic_vector(CV_SIZE-1 downto 0);
  signal   regBlock_we_smem               : std_logic_vector(N_REG_BLOCKS-1 downto 0);
  -- }}}

  -- debug signals ----------------------------------------------------------------------------------------{{{
  signal debug_op_counter_per_cu_i        : unsigned(2*DATA_W-1 downto 0);
  signal debug_op_clk_cycles_counter      : debug_counter(14 downto 0);
  signal debug_op_clk_cycles_counter_n    : debug_counter(14 downto 0);
    -- debug_op_clk_cycles_counter(0) counts all operations #clk cycles in the cu
    -- each element of debug_op_clk_cycles_counter(14 downto 0) counts operations #clk cycles for a single family of operations:
    -- ADD: debug_op_clk_cycles_counter(1)
    -- SHF: debug_op_clk_cycles_counter(2)
    -- LGK: debug_op_clk_cycles_counter(3)
    -- MOV: debug_op_clk_cycles_counter(4)
    -- MUL: debug_op_clk_cycles_counter(5)
    -- BRA: debug_op_clk_cycles_counter(6)
    -- GLS: debug_op_clk_cycles_counter(7)
    -- ATO: debug_op_clk_cycles_counter(8)
    -- CTL: debug_op_clk_cycles_counter(9)
    -- RTM: debug_op_clk_cycles_counter(10)
    -- CND: debug_op_clk_cycles_counter(11)
    -- FLT: debug_op_clk_cycles_counter(12)
    -- LSI: debug_op_clk_cycles_counter(13)
    -- DIV: debug_op_clk_cycles_counter(14)

  signal debug_op_clk_cycles_counter_no_oh    : debug_counter(14 downto 0);
  signal debug_op_clk_cycles_counter_no_oh_n  : debug_counter(14 downto 0);
    -- debug_op_clk_cycles_counter_no_oh counts operations like debug_op_clk_cycles_counter, but without pipeline overheads

  signal last_instr, last_instr_n         : std_logic_vector(13 downto 0);
    -- keeps track of the last scheduled instruction
  ---------------------------------------------------------------------------------------------------------}}}

begin
  -- internal signals and asserts -------------------------------------------------------------------------{{{
  alu_en <= alu_en_i;
  wi_barrier_reached  <= wi_barrier_reached_i;
  wf_sync_retired     <= wf_sync_retired_i;
  debug_op_counter_per_cu <= debug_op_counter_per_cu_i;
  ---------------------------------------------------------------------------------------------------------}}}

  -- RTM control & ALU enable -----------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rtm_rdData_d0       <= (others => '0'); -- NOT NEEDED
        rtm_rdAddr          <= (others => '0'); -- NOT NEEDED
        rdAddr_alu_en_p0    <= (others => '0'); -- NOT NEEDED
        rdAddr_alu_en       <= (others => '0'); -- NOT NEEDED
        alu_en_i            <= (others => '0'); -- NOT NEEDED
        alu_en_pri_enc      <= 0; -- NOT NEEDED
      else
        -- rtm {{{
        rtm_rdData_d0 <= rtm_rdData; -- @ 16.
        rtm_rdAddr <= rtm_rdAddr_vec(0); -- @ 13.
        -- }}}

        -- ALU enable {{{
        rdAddr_alu_en_p0(PHASE_W-1 downto 0)                 <= phase; -- @ 1.
        rdAddr_alu_en_p0(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= to_unsigned(wf_indx_in_wg, N_WF_CU_W); -- @ 1.
        rdAddr_alu_en <= rdAddr_alu_en_p0; -- @ 2.

        -- for gmem operations
        alu_en_i <= rdData_alu_en_vec(rdData_alu_en_vec'high-11); -- @ 17.
        alu_en_pri_enc <= 0; -- @ 17.
        for i in CV_SIZE-1 downto 0 loop
          if rdData_alu_en_vec(rdData_alu_en_vec'high-11)(i) = '1' then -- level 16.
            alu_en_pri_enc <= i; -- @ 17.
          end if;
        end loop;
        -- }}}
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if family_vec(family_vec'high-1) = RTM_FAMILY then -- level 2.
        case code_vec(code_vec'high-1) is -- level 2.
          when CODE_LID =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '0'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= unsigned(dim_vec(dim_vec'high-1)); -- dimension
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= to_unsigned(wf_indx_in_wg_vec(wf_indx_in_wg_vec'high-1), N_WF_CU_W);
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1 downto 0) <= phase_d1;

          when CODE_WGOFF =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= unsigned(dim_vec(dim_vec'high-1)); -- dimension
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= to_unsigned(wf_indx_vec(wf_indx_vec'high-1), N_WF_CU_W);
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1 downto 0) <= (others => '0');

          when CODE_SIZE =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= (others => '1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '0', others => '1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1) <= '0';
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-2 downto 0) <= unsigned(dim_vec(dim_vec'high-1));

          when CODE_WGID =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= (others => '1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1 => '1', others => '0');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1) <= '0';
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-2 downto 0) <= unsigned(dim_vec(dim_vec'high-1));

          when CODE_WGSIZE =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= (others => '1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1 => '1', others => '0');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1) <= '0';
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-2 downto 0) <= unsigned(dim_vec(dim_vec'high-1));

          when CODE_LP =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11"; -- dimension
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto N_PARAMS_W) <= (others => '0'); -- wf_indx is zero, except its LSB,
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_PARAMS_W-1 downto 0) <= unsigned(params_vec(params_vec'high-1)); -- @ 3.

          when others =>
        end case;
      end if;

      rtm_rdAddr_vec(rtm_rdAddr_vec'high-1 downto 0) <= rtm_rdAddr_vec(rtm_rdAddr_vec'high downto 1); -- @ 4.->12.

      rtm_rdData_nlid_vec <= rtm_rdAddr_vec(0)(RTM_ADDR_W-1) & rtm_rdData_nlid_vec(rtm_rdData_nlid_vec'high downto 1); -- @ 13.->16.

      alu_en_divStack_vec <= alu_en_divStack & alu_en_divStack_vec(alu_en_divStack_vec'high downto 1); -- @ 3.->5.

      rdData_alu_en_vec(rdData_alu_en_vec'high)   <= rdData_alu_en; -- @ 5.
      rdData_alu_en_vec(rdData_alu_en_vec'high-1) <= rdData_alu_en_vec(rdData_alu_en_vec'high) and not alu_en_divStack_vec(0); -- @ 6.
      rdData_alu_en_vec(rdData_alu_en_vec'high-2 downto 0) <= rdData_alu_en_vec(rdData_alu_en_vec'high-1 downto 1); -- @ 7.->7+MAX_FPU_DELAY+4.
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- decoding logic ---------------------------------------------------------------------------------------{{{
  family <= instr(FAMILY_POS+FAMILY_W-1 downto FAMILY_POS);    -- alias
  code <= instr(CODE_POS+CODE_W-1 downto CODE_POS); -- alias
  inst_rd_addr <= instr(RD_POS+WI_REG_ADDR_W-1 downto RD_POS); -- alias
  inst_rs_addr <= instr(RS_POS+WI_REG_ADDR_W-1 downto RS_POS); -- alias
  inst_rt_addr <= instr(RT_POS+WI_REG_ADDR_W-1 downto RT_POS); -- alias
  dim <= instr(DIM_POS+1 downto DIM_POS);
  params <= instr(PARAM_POS+N_PARAMS_W-1 downto PARAM_POS);

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rs_addr            <= (others => '0'); -- NOT NEEDED
        rt_addr            <= (others => '0'); -- NOT NEEDED
        rd_addr            <= (others => '0'); -- NOT NEEDED
        op_logical_v       <= '0'; -- NOT NEEDED
      else
        -- Rs, Rt & Rd addresses {{{
        rs_addr(REG_FILE_BLOCK_W-1) <= phase(PHASE_W-1); -- @ 1.
        rs_addr(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W) <= to_unsigned(wf_indx, N_WF_CU_W); -- @ 1.
        if family = ADD_FAMILY and code(3) = '1' then -- level 0.
          rs_addr(WI_REG_ADDR_W-1 downto 0) <= (others => '0'); -- @ 1. -- for li & lui
        else
          rs_addr(WI_REG_ADDR_W-1 downto 0) <= unsigned(inst_rs_addr); -- @ 1.
        end if;

        rt_addr(REG_FILE_BLOCK_W-1) <= phase(PHASE_W-1); -- @ 1.
        rt_addr(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W) <= to_unsigned(wf_indx, N_WF_CU_W); -- @ 1.
        rt_addr(WI_REG_ADDR_W-1 downto 0) <= unsigned(inst_rt_addr); -- @ 1.

        rd_addr <= wrAddr_regFile_vec(wrAddr_regFile_vec'high)(REG_FILE_BLOCK_W-1 downto 0); -- @ 1.
        -- }}}

        -- set operation type {{{
        op_logical_v <= '0'; -- @ 14.
        if family_vec(family_vec'high-12) = LGK_FAMILY then -- level 13.
          op_logical_v <= '1'; -- @ 14.
        end if;
        -- }}}
      end if;
    end if;
  end process;

  -- pipes
  process(clk)
  begin
    if rising_edge(clk) then
      family_vec       <= family & family_vec(family_vec'high downto 1); -- @ 1.->2+MAX_FPU_DELAY+9.
      family_vec_at_16 <= family_vec(family_vec'high-14); -- @ 16.
      dim_vec          <= dim    & dim_vec(dim_vec'high downto 1); -- @ 1.->2.
      code_vec         <= code   & code_vec(code_vec'high downto 1); -- @ 1.->16.
      params_vec       <= params & params_vec(params_vec'high downto 1); -- @ 1.->2.

      immediate_vec(immediate_vec'high-1 downto 0) <= immediate_vec(immediate_vec'high downto 1); -- @ 2.->6.
      immediate_vec(immediate_vec'high)(IMM_ARITH_W-1 downto 0)     <= instr(IMM_POS+IMM_ARITH_W-1 downto IMM_POS); -- @ 1.
      immediate_vec(immediate_vec'high)(IMM_W-1 downto IMM_ARITH_W) <= instr(RS_POS+IMM_W-IMM_ARITH_W-1 downto RS_POS); -- @ 1.

      wf_indx_vec        <= wf_indx       & wf_indx_vec(wf_indx_vec'high downto 1); -- @ 1.->16.
      wf_indx_in_wg_vec  <= wf_indx_in_wg & wf_indx_in_wg_vec(wf_indx_in_wg_vec'high downto 1); -- @ 1.->2.
      regBlock_re        <= regBlock_re(regBlock_re'high-1 downto 0) & regBlock_re_n; -- @ 1.->4.
      op_arith_shift     <= op_arith_shift_n;   -- @ 1.
      op_arith_shift_vec <= op_arith_shift & op_arith_shift_vec(op_arith_shift_vec'high downto 1); -- @ 2.->6.
      phase_d0           <= phase; -- @ 1.
      phase_d1           <= phase_d0; -- @ 2.
    end if;
  end process;

  -- memory accesses {{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        gmem_re_p0  <= '0'; -- NOT NEEDED
        gmem_we_p0  <= '0'; -- NOT NEEDED
        gmem_ato_p0 <= '0'; -- NOT NEEDED
        gmem_we     <= '0'; -- NOT NEEDED
        gmem_re     <= '0'; -- NOT NEEDED
        gmem_atomic <= '0'; -- NOT NEEDED
        lmem_rqst   <= '0'; -- NOT NEEDED
        lmem_we     <= '0'; -- NOT NEEDED
        smem_rqst   <= '0'; -- NOT NEEDED
        smem_we     <= '0'; -- NOT NEEDED
        mem_wrData  <= (others => (others => '0')); -- NOT NEEDED
        mem_rd_addr <= (others => '0'); -- NOT NEEDED
        mem_addr    <= (others => (others => '0')); -- NOT NEEDED
        mem_op_type <= (others => '0'); -- NOT NEEDED
      else
        -- @ 16 {{{
        gmem_re_p0 <= '0'; -- @ 16.
        gmem_we_p0 <= '0'; -- @ 16.
        if family_vec(family_vec'high-14) = GLS_FAMILY then -- level 15.
          if code_vec(1)(3) = '1' then -- level 15.
            gmem_re_p0 <= '0'; -- store @ 16.
            gmem_we_p0 <= '1';
          else
            gmem_re_p0 <= '1'; -- load @ 16.
            gmem_we_p0 <= '0';
          end if;
        end if;

        if ATOMIC_IMPLEMENT /= 0 then
          gmem_ato_p0 <= '0';
          if family_vec(family_vec'high-14) = ATO_FAMILY then -- level 15.
            gmem_ato_p0 <= '1'; -- @ 16.
          end if;
        end if;
        -- }}}

        -- @ 17 {{{
        gmem_we <= gmem_we_p0; -- @ 17.
        gmem_re <= gmem_re_p0; -- @ 17.
        if ATOMIC_IMPLEMENT /= 0 then
          gmem_atomic <= gmem_ato_p0; -- @ 17.
        end if;

        if LMEM_IMPLEMENT /= 0 then
          lmem_rqst <= '0'; -- @ 17.
          lmem_we <= '0'; -- @ 17.
          if family_vec(family_vec'high-15) = LSI_FAMILY and code_vec(0)(0) /= '1' then -- level 16.
            lmem_rqst <= '1'; -- @ 17.
            if code_vec(0)(3) =  '1' then -- level 16.
              lmem_we <= '1'; -- @ 17.
            else
              lmem_we <= '0'; -- @ 17.
            end if;
          end if;
        end if;

        if SMEM_IMPLEMENT /= 0 then
          smem_rqst <= '0'; -- @ 17.
          smem_we <= '0'; -- @ 17.
          if family_vec(family_vec'high-15) = LSI_FAMILY and code_vec(0)(0) = '1' then -- level 16.
            smem_rqst <= '1'; -- @ 17.
            if code_vec(0)(3) =  '1' then -- level 16.
              smem_we <= '1'; -- @ 17.
            else
              smem_we <= '0'; -- @ 17.
            end if;
          end if;
        end if;

        mem_wrData <= rd_out_vec(0); -- @ 17.
        mem_rd_addr <= wrAddr_regFile_vec(wrAddr_regFile_vec'high-16); -- @ 17.
        for i in 0 to CV_SIZE-1 loop
          mem_addr(i) <= unsigned(res_low(i)(GMEM_ADDR_W-1 downto 0)); -- @ 17.
        end loop;
        mem_op_type <= code_vec(0)(2 downto 0); -- @ 17.
        -- }}}
      end if;
    end if;
  end process;

  -- pipes
  process(clk)
  begin
    if rising_edge(clk) then
      rd_out_vec(rd_out_vec'high-1 downto 0) <= rd_out_vec(rd_out_vec'high downto 1); -- @ 11.->16.
    end if;
  end process;
  -- }}}
  ---------------------------------------------------------------------------------------------------------}}}

  -- ALUs ------------------------------------------------------------------------------------------------ {{{
  ALUs: for i in 0 to CV_SIZE-1 generate
  begin
    -- the calculation begins @ level 3 in the pipeline
    alu_inst: alu port map(
      rs_addr => rs_addr, --level 1.
      rt_addr => rt_addr, -- level 1.
      rd_addr => rd_addr, -- level 1.
      family => family_vec(family_vec'high), -- level 1.
      regBlock_re => regBlock_re, -- level 1.

      op_arith_shift => op_arith_shift_vec(0), -- level 6.
      code => code_vec(code_vec'high-5),  -- level 6.
      immediate => immediate_vec(0), -- level 6.

      rd_out => rd_out_vec(rd_out_vec'high)(i), -- level 10.
      reg_we_mov => reg_we_mov_vec(reg_we_mov_vec'high)(i), -- level 10.

      div_a => div_a(i), -- level 8.
      div_b => div_b(i), -- level 8.

      float_a => float_a(i), -- level 9.
      float_b => float_b(i), -- level 9.

      op_logical_v => op_logical_v, -- level 14.
      res_low => res_low(i), -- level 16.
      res_high => res_high(i), -- level 16.

      reg_wrData => regBlock_wrData(i), -- level 18. (level 21. for loads from lmem) (level 24. for float results)
      reg_wrAddr => regBlock_wrAddr(i), -- level 18. (level 21. for loads from lmem) (level 24. for float results)
      reg_we     => regBlock_we(i), -- level 18. (level 21. for loads from lmem) (level 24. for float results)

      clk    => clk,
      nrst   => nrst
      );
  end generate;

  -- set register files read enables {{{
  set_register_re:
  process(phase(0), family, code(0)) -- this process executes in level 0.
  begin
    regBlock_re_n <= '0'; -- level 0.
    case family is -- level 0.
      when ADD_FAMILY | MUL_FAMILY | BRA_FAMILY | SHF_FAMILY | LGK_FAMILY | CND_FAMILY | MOV_FAMILY | LSI_FAMILY | FLT_FAMILY | GLS_FAMILY | ATO_FAMILY | DIV_FAMILY =>
        if phase(PHASE_W-2 downto 0) = (0 to PHASE_W-2 => '0') then -- phase = 0 or 4
          regBlock_re_n <= '1';
        end if;

      when others =>
    end case; -- }}}

    -- set operation type {{{
    op_arith_shift_n <= op_add; -- level 0.
    case family is -- level 0.
      when ADD_FAMILY =>
        op_arith_shift_n <= op_add;
      when MUL_FAMILY =>
        op_arith_shift_n <= op_mult;
      when GLS_FAMILY =>
        op_arith_shift_n <= op_lw;
      when LSI_FAMILY =>
        if code(0) = '0' then
          op_arith_shift_n <= op_lmem;
        else
          op_arith_shift_n <= op_smem;
        end if;
      when ATO_FAMILY =>
        op_arith_shift_n <= op_ato;
      when BRA_FAMILY =>
        op_arith_shift_n <= op_bra;
      when SHF_FAMILY =>
        op_arith_shift_n <= op_shift;
      when CND_FAMILY =>
        op_arith_shift_n <= op_slt;
      when MOV_FAMILY =>
        op_arith_shift_n <= op_mov;
      when others => -- LGK_FAMILY, CTL_FAMILY, RTM_FAMILY, FLT_FAMILY, DIV_FAMILY
    end case;
  end process;
  -- }}}
  ---------------------------------------------------------------------------------------------------------}}}

  -- divisor ----------------------------------------------------------------------------------------------{{{
  div_units_true: if DIV_IMPLEMENT /= 0 generate
    div_units: for i in 0 to CV_SIZE-1 generate
    begin
      divisor_unit_inst: div_unit port map (
        div_a     => div_a(i), -- level 8.
        div_b     => div_b(i), -- level 8.
        div_valid => div_valid(i), -- level 8.
        code      => code_vec(8),  -- level 8.

        res_div => res_div(i), -- level 8+DIV_DELAY+1.

        clk  => clk,
        nrst => nrst
      );
    end generate;

    process(clk)
    begin
      if rising_edge(clk) then
        res_div_d0 <= res_div; -- @ 8+DIV_DELAY+2
      end if;
    end process;
  end generate;
  div_units_false: if DIV_IMPLEMENT = 0 generate
    res_div    <= (others => (others => '0'));
    res_div_d0 <= (others => (others => '0'));
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}

  -- floating point ---------------------------------------------------------------------------------------{{{
  float_units_true: if FLOAT_IMPLEMENT /= 0 generate
    float_units_inst: float_units port map(
        float_a => float_a, -- level 9.
        float_b => float_b, -- level 9.
        fsub => code_vec(7)(CODE_W-1), -- level 9.
        code => code_vec(0),  -- level 16.

        res_float => res_float, -- level MAX_FPU_DELAY+10. (38 if fdiv, 21 if fadd)

        clk  => clk,
        nrst => nrst
    );

    process(clk)
    begin
      if rising_edge(clk) then
        res_float_d0 <= res_float; -- @ MAX_FPU_DELAY+11 (39 if fdiv, 22 if fadd)
        res_float_d1 <= res_float_d0; -- @ MAX_FPU_DELAY+12 (40 if fdiv, 23 if fadd)
        -- float_ce <= '0';
        -- for i in 0 to N_REG_BLOCKS-1 loop
        --   if regBlock_re_vec(1)(i) = '1' then
        --     float_ce <= '1';
        --   end if;
        -- end loop;
      end if;
    end process;
  end generate;

  float_units_false: if FLOAT_IMPLEMENT = 0 generate
    res_float    <= (others => (others => '0'));
    res_float_d0 <= (others => (others => '0'));
    res_float_d1 <= (others => (others => '0'));
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}

  -- branch control ---------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        res_alu            <= (others => (others => '0')); -- NOT NEEDED
        branch_on_zero     <= '0'; -- NOT NEEDED
        branch_on_not_zero <= '0'; -- NOT NEEDED
        wf_is_branching_p0 <= (others => '0'); -- NOT NEEDED
        wf_is_branching    <= (others => '0'); -- NOT NEEDED
        alu_branch         <= (others => '0'); -- NOT NEEDED
      else
        -- @ 17 {{{
        res_alu <= res_low; -- @ 17.
        branch_on_zero <= '0'; -- @ 17.
        branch_on_not_zero <= '0'; -- @ 17.
        wf_is_branching_p0 <= (others => '0');
        if family_vec(family_vec'high-15) = BRA_FAMILY then  -- level 16.
          wf_is_branching_p0(wf_indx_vec(0)) <= '1'; -- @ 17.
          case code_vec(0) is -- level 16.
            when CODE_BEQ =>
              branch_on_zero <= '1'; -- @ 17.
            when CODE_BNE =>
              branch_on_not_zero <= '1'; -- @ 17.
            when others =>
          end case;
        end if;
        -- }}}
        -- @ 18 {{{
        wf_is_branching <= wf_is_branching_p0; -- @ 18.
        alu_branch <= (others => '0'); -- @ 18.
        for i in 0 to CV_SIZE-1 loop
          if res_alu(i) = (res_alu(i)'reverse_range=>'0') then -- level 17.
            if branch_on_zero = '1' then -- level 17.
              alu_branch(i) <= '1'; -- @ 18.
            end if;
          else
            if branch_on_not_zero = '1' then -- level 17.
              alu_branch(i) <= '1'; -- @ 18.
            end if;
          end if;
        end loop;
        -- }}}
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- sync logic -------------------------------------------------------------------------------------------{{{

  sync_seq_logic: process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        wi_barrier                <= (others => (others => '0'));
        wi_barrier_in_execution   <= (others => '0');
        start_sync_FSM            <= (others => '0');
        wi_barrier_reached_i      <= (others => '0');
        wf_sync_retired_i         <= (others => '0');
      else
        start_sync_FSM <= (others => '0');
        wi_barrier <= wi_barrier_n;
        wi_barrier_in_execution <= wi_barrier_in_execution_n;
        wi_barrier_reached_i <= wi_barrier_reached_n;
        wf_sync_retired_i <= wf_sync_retired_n;
        st_sync <= st_sync_n;

        if (phase = "011") then
          -- @ 4
          if family_vec(36) = CTL_FAMILY and code_vec(13) = CODE_SYNC then
            start_sync_FSM(wf_indx_vec(13)) <= '1';
          end if;
        end if;

        if (phase = "100") then
          -- @ 5 start_sync_FSM is high for 1 clk cycle
          if family_vec(35) = CTL_FAMILY and code_vec(12) = CODE_SYNC then
            start_sync_FSM(wf_indx_vec(13)) <= '0';
          end if;
        end if;

      end if;

    end if;

  end process;

  sync_comb_logic: for i in 0 to N_WF_CU-1 generate

    process(st_sync(i), start_sync_FSM(i), rdData_alu_en, rdData_alu_en_vec(1), wi_barrier_reached_i(i), wf_sync_retired_i(i), wi_barrier(i), wi_barrier_in_execution(i))
    begin
      st_sync_n(i) <= st_sync(i);
      wi_barrier_n(i) <= wi_barrier(i);
      wi_barrier_in_execution_n(i) <= wi_barrier_in_execution(i);
      wf_sync_retired_n(i) <= wf_sync_retired_i(i);
      wi_barrier_reached_n(i) <= wi_barrier_reached_i(i);

      case st_sync(i) is

        when idle =>
          wi_barrier_reached_n(i) <= '0';
          wf_sync_retired_n(i) <= '0';
          if (start_sync_FSM(i) = '1') then
            st_sync_n(i) <= level_5;
          end if;

        when level_5 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(7 downto 0) <= not(rdData_alu_en_vec(34));
          end if;
          st_sync_n(i) <= level_6;

        when level_6 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(15 downto 8) <= not(rdData_alu_en_vec(34));
          end if;
          wi_barrier_n(i)(7 downto 0) <= wi_barrier(i)(7 downto 0) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_7;

        when level_7 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(23 downto 16) <= not(rdData_alu_en_vec(34));
          end if;
          wi_barrier_n(i)(15 downto 8) <= wi_barrier(i)(15 downto 8) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_8;

        when level_8 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(31 downto 24) <= not(rdData_alu_en_vec(34));
          end if;
          wi_barrier_n(i)(23 downto 16) <= wi_barrier(i)(23 downto 16) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_9;

        when level_9 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(39 downto 32) <= not(rdData_alu_en_vec(34));
          end if;
          wi_barrier_n(i)(31 downto 24) <= wi_barrier(i)(31 downto 24) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_10;

        when level_10 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(47 downto 40) <= not(rdData_alu_en_vec(34));
          end if;
          wi_barrier_n(i)(39 downto 32) <= wi_barrier(i)(39 downto 32) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_11;

        when level_11 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(55 downto 48) <= not(rdData_alu_en_vec(34));
          end if;
          wi_barrier_n(i)(47 downto 40) <= wi_barrier(i)(47 downto 40) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_12;

        when level_12 =>
          if wi_barrier_in_execution(i) = '0' then
            wi_barrier_n(i)(63 downto 56) <= not(rdData_alu_en_vec(34));
            wi_barrier_in_execution_n(i) <= '1';
          end if;
          wi_barrier_n(i)(55 downto 48) <= wi_barrier(i)(55 downto 48) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_13;

        when level_13 =>
          wi_barrier_n(i)(63 downto 56) <= wi_barrier(i)(63 downto 56) or rdData_alu_en_vec(33);
          st_sync_n(i) <= level_14;

        when level_14 =>
          if (wi_barrier(i) = X"FFFFFFFFFFFFFFFF") then
            wi_barrier_reached_n(i) <= '1';
            wi_barrier_in_execution_n(i) <= '0';

            -- Clean barrier
            wi_barrier_n(i) <= (others => '0');

          else
            wf_sync_retired_n(i) <= '1';
          end if;

          st_sync_n(i) <= idle;

      end case;

    end process;

  end generate;

  ---------------------------------------------------------------------------------------------------------}}}


  -- write back into regFiles -----------------------------------------------------------------------------{{{
  -- register file -----------------------------------------------------------------------
  -- bits    10:9         8      7:5        4:0
  --      phase(1:0)  phase(2)  wf_indx    instr_rd_addr
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(REG_FILE_W-1 downto REG_FILE_W-2)               <= phase(1 downto 0); -- level 0.
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(REG_FILE_W-3)                                   <= phase(PHASE_W-1); -- level 0.
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W) <= to_unsigned(wf_indx, N_WF_CU_W); -- level 0.
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(WI_REG_ADDR_W-1 downto 0)                       <= unsigned(inst_rd_addr); -- level 0.

  write_alu_res_back:
  process(family_vec(family_vec'high-15), rdData_alu_en_vec(rdData_alu_en_vec'high-11), reg_we_mov_vec(0))
  begin
    reg_we_alu_n <= (others => '0'); -- level 16.

    case family_vec(family_vec'high-15) is -- level 16.
      when RTM_FAMILY | ADD_FAMILY | MUL_FAMILY | SHF_FAMILY | LGK_FAMILY | CND_FAMILY =>
        reg_we_alu_n <= rdData_alu_en_vec(rdData_alu_en_vec'high-11); -- level 16.
      when MOV_FAMILY =>
        reg_we_alu_n <= rdData_alu_en_vec(rdData_alu_en_vec'high-11) and reg_we_mov_vec(0); -- level 16.
      when others =>
    end case;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        reg_we_alu            <= (others => '0'); -- NOT NEEDED
        reg_we_float          <= (others => '0'); -- NOT NEEDED
        reg_we_div            <= (others => '0');
        wrData_alu            <= (others => (others => '0')); -- NOT NEEDED
        regBlock_we_alu       <= (others => '0'); -- NOT NEEDED
        regBlock_we_float     <= (others => '0'); -- NOT NEEDED
        regBlock_we_div       <= (others => '0');
        regBlock_we_mem       <= (others => '0'); -- NOT NEEDED
        mem_regFile_wrAddr_d0 <= (others => '0'); -- NOT NEEDED
        regBlock_wrAddr       <= (others => (others => (others => '0'))); -- NOT NEEDED
        regBlock_wrData       <= (others => (others => (others => '0'))); -- NOT NEEDED
        regBlock_we           <= (others => (others => '0')); -- NOT NEEDED
      else
        reg_we_alu <= reg_we_alu_n; -- @ 17.

        reg_we_div <= (others => '0');
        div_valid <= (others => '0');
        if family_vec(family_vec'high-8-DIV_DELAY) = DIV_FAMILY then -- level 8+DIV_DELAY+1
          reg_we_div <= rdData_alu_en_vec(family_vec'high-8-DIV_DELAY); -- @ 8+DIV_DELAY+2
        end if;
        if family_vec(family_vec'high-6) = DIV_FAMILY then -- level 7
          div_valid <= rdData_alu_en_vec(family_vec'high-6); -- @ 8.
        end if;

        reg_we_float <= (others => '0'); -- @ 23.
        case MAX_FPU_DELAY is
          when FDIV_DELAY => -- fsqrt of fdiv has the maximum delay
            if family_vec(1) = FLT_FAMILY then -- level 38. if fdiv
              reg_we_float <= rdData_alu_en_vec(1); -- @ 39. if fdiv
            end if;
          when others => -- fadd has the maximum delay
            if family_vec(0) = FLT_FAMILY then -- level 22. if fadd
              reg_we_float <= rdData_alu_en_vec(0); -- @ 23. if fadd
            end if;
        end case;

        wrData_alu <= (others => (others => '0')); -- @ 17.
        case family_vec_at_16 is -- level 16.
          when RTM_FAMILY =>
            if rtm_rdData_nlid_vec(0) = '0' then -- level 16.
              for i in 0 to CV_SIZE-1 loop
                wrData_alu(i)(WG_SIZE_W-1 downto 0) <= std_logic_vector(rtm_rdData_d0((i+1)*WG_SIZE_W-1 downto i*WG_SIZE_W)); -- @ 17.
              end loop;
            else
              for i in 0 to CV_SIZE-1 loop
                wrData_alu(i) <= std_logic_vector(rtm_rdData_d0(DATA_W-1 downto 0)); -- @ 17.
              end loop;
            end if;

          when ADD_FAMILY | MUL_FAMILY | CND_FAMILY | MOV_FAMILY =>
            wrData_alu <= res_low; -- @ 17.

          when SHF_FAMILY =>
            if code_vec(0)(CODE_W-1) = '0' then  -- level 16.
              wrData_alu <= res_low; -- @ 17.
            else
              wrData_alu <= res_high;
            end if;

          when LGK_FAMILY =>
            wrData_alu <= res_low; -- @ 17.

          when GLS_FAMILY =>

          when others =>
        end case;

        regBlock_we_alu <= (others => '0'); -- @ 17.
        regBlock_we_alu(to_integer(wrAddr_regFile_vec(wrAddr_regFile_vec'high-16)(REG_FILE_W-1 downto REG_FILE_BLOCK_W))) <= '1'; -- @ 17. + i (it follows the phase, which is hidden behind wrAddr_regFile_vec)

        -- regBlock_we_div {{{
          regBlock_we_div <= regBlock_we_div_vec(1); -- @ 8+DIV_DELAY+2 -- commento da rivedere
        -- }}}

        -- regBlock_we_float {{{
        case MAX_FPU_DELAY is
          when FDIV_DELAY => -- fsqrt of fdiv has the maximum delay
            regBlock_we_float <= regBlock_we_float_vec(1); -- @ MAX_FPU_DELAY+11 (39. if fadd)
          when others => -- fadd has the maximum delay
            regBlock_we_float <= regBlock_we_float_vec(0); -- @ MAX_FPU_DELAY+12 (23. if fadd)
        end case;
        -- }}}

        if LMEM_IMPLEMENT = 0 or lmem_regFile_we_p0 = '0' then
          -- if no read of lmem content is coming, prepare the we of the register block according to the current address sent from cu_mem_cntrl
          regBlock_we_mem <= (others => '0'); -- stage 0
          regBlock_we_mem(to_integer(mem_regFile_wrAddr(REG_FILE_W-1 downto REG_FILE_BLOCK_W))) <= '1'; -- (@ 22. for lmem reads)
        elsif lmem_regFile_we = '0' or regBlock_we_mem(N_REG_BLOCKS-1) = '1' then
          -- there will be a read from lmem or a half of the read data burst is over. Set the we of the first register block!
          regBlock_we_mem(N_REG_BLOCKS-1 downto 1) <= (others => '0'); -- stage 0
          regBlock_we_mem(0) <= '1';
        else -- lmem is being read. Shift left for regBlock_we_mem!
          regBlock_we_mem(N_REG_BLOCKS-1 downto 1) <= regBlock_we_mem(N_REG_BLOCKS-2 downto 0);
          regBlock_we_mem(0) <= '0';
        end if;
        mem_regFile_wrAddr_d0 <= mem_regFile_wrAddr; -- stage 1
        -- }}}

        if SMEM_IMPLEMENT /= 0 and smem_regFile_we /= (CV_SIZE-1 downto 0 => '0') then
          regBlock_we_smem <= (others => '0');
          regBlock_we_smem(to_integer(mem_regFile_wrAddr(REG_FILE_W-1 downto REG_FILE_BLOCK_W))) <= '1'; -- (@ 22. for smem reads)
        else
          regBlock_we_smem <= (others => '0');
        end if;

        -- the register block that will be written from shared reads will be selected {{{
        -- if mem_regFile_we(CV_SIZE-1 downto 0) = (CV_SIZE-1 downto 0 => '0') then
          -- regBlock_we_mem <= (others => '0');
        -- elsif SMEM_IMPLEMENT /= 0 and smem_regFile_we = '1' then
          -- regBlock_we_mem <= (others => '0');
          -- regBlock_we_mem(to_integer(mem_regFile_wrAddr(REG_FILE_W-1 downto REG_FILE_BLOCK_W))) <= '1'; -- (@ 22. for smem reads)
        -- end if;
        -- }}}

        -- regBlock_wrAddr (commenti da rivedere!!!) {{{
        for i in 0 to CV_SIZE-1 loop
          for j in 0 to N_REG_BLOCKS-1 loop
            if regBlock_we_alu(j) = '1' and reg_we_alu(i) = '1' then -- level 17.+j
              regBlock_wrAddr(i)(j) <= wrAddr_regFile_vec(wrAddr_regFile_vec'high-17)(REG_FILE_BLOCK_W-1 downto 0); -- @ 18.+j
            elsif DIV_IMPLEMENT /= 0 and regBlock_we_div(j) = '1' and reg_we_div(i) = '1' then -- level XX.+j
              regBlock_wrAddr(i)(j) <= wrAddr_regFile_vec(wrAddr_regFile_vec'high-DIV_DELAY-9)(REG_FILE_BLOCK_W-1 downto 0); -- @ DIV_DELAY+9.+j
            elsif FLOAT_IMPLEMENT /= 0 and regBlock_we_float(j) = '1' and reg_we_float(i) = '1' then -- level 23.+j if add, 39.+j if fdiv
              case MAX_FPU_DELAY is
                when FDIV_DELAY => -- fsqrt of fdiv has the maximum delay
                  regBlock_wrAddr(i)(j) <= wrAddr_regFile_vec(1)(REG_FILE_BLOCK_W-1 downto 0); -- @ 40.+j if fdiv
                when others => -- fadd has the maximum delay
                  regBlock_wrAddr(i)(j) <= wrAddr_regFile_vec(0)(REG_FILE_BLOCK_W-1 downto 0); -- @ 24.+j if fadd
              end case;
            elsif SMEM_IMPLEMENT /= 0 and smem_regFile_we_d0(i) = '1' then -- ATTENZIONE: FONTE DI POSSIBILI BUG
              regBlock_wrAddr(i)(j) <= mem_regFile_wrAddr_d0(REG_FILE_BLOCK_W-1 downto 0);
            else
              regBlock_wrAddr(i)(j) <= mem_regFile_wrAddr(REG_FILE_BLOCK_W-1 downto 0); -- stage 1. or 2.
            end if;
          end loop;
        end loop;
        -- }}}

        for i in 0 to CV_SIZE-1 loop
          for j in 0 to N_REG_BLOCKS-1 loop
            -- regBlock_wrData {{{
            if regBlock_we_alu(j) = '1' and reg_we_alu(i) = '1' then -- level 17.
              -- write by alu operations
              regBlock_wrData(i)(j) <= wrData_alu(i); -- @ 18.
            elsif DIV_IMPLEMENT /= 0 and regBlock_we_div(j) = '1' and reg_we_div(i) = '1' then -- level 8+DIV_DELAY+2.+j-- write by alu operations
              regBlock_wrData(i)(j) <= res_div_d0(i); -- @ 8+DIV_DELAY+3.
            elsif FLOAT_IMPLEMENT /= 0 and regBlock_we_float(j) = '1' and reg_we_float(i) = '1' then -- level 23. if fadd, 39. if fdiv
              -- write by floating point units
              case MAX_FPU_DELAY is
                when FDIV_DELAY => -- fsqrt of fdiv has the maximum delay
                  regBlock_wrData(i)(j) <= res_float_d0(i); -- @ 40.+j
                when others => -- fadd has the maximum delay
                  regBlock_wrData(i)(j) <= res_float_d1(i); -- @ 24.+j
              end case;
            else
              -- write by memory reads
              regBlock_wrData(i)(j) <= mem_regFile_wrData(i); -- @ 1. or 2.
            end if;
            -- }}}

            -- regBlock_we {{{
            regBlock_we(i)(j) <= '0';
            if (regBlock_we_alu(j) = '1' and reg_we_alu(i) = '1') or
               (DIV_IMPLEMENT /= 0 and regBlock_we_div(j) = '1' and reg_we_div(i) = '1') or
               (FLOAT_IMPLEMENT /= 0 and regBlock_we_float(j) = '1' and reg_we_float(i) = '1') or
               (smem_regFile_we_d0(i) = '1' and regBlock_we_smem(j) = '1') or
               (regBlock_we_mem(j) = '1' and mem_regFile_we(i) = '1') then
              regBlock_we(i)(j) <= '1';
            end if;
            -- }}}
          end loop;
        end loop;
      end if;
    end if;
  end process;

  -- pipes
  process(clk)
  begin
    if rising_edge(clk) then
      wrAddr_regFile_vec(wrAddr_regFile_vec'high-1 downto 0) <= wrAddr_regFile_vec(wrAddr_regFile_vec'high downto 1); -- @ 1.->MAX_FPU_DELAY+12.
      reg_we_mov_vec(reg_we_mov_vec'high-1 downto 0)         <= reg_we_mov_vec(reg_we_mov_vec'high downto 1); -- @ 11.->16.
      lmem_regFile_we <= lmem_regFile_we_p0; -- @ 20.
      smem_regFile_we_d0 <= smem_regFile_we; -- @ 20.

      regBlock_we_div_vec <= regBlock_we_alu & regBlock_we_div_vec(regBlock_we_div_vec'high downto 1); -- @ 18.->19+DIV_DELAY-8-1

      regBlock_we_float_vec <= regBlock_we_alu & regBlock_we_float_vec(regBlock_we_float_vec'high downto 1); -- @ 18.->19+MAX_FPU_DELAY-7-1 (39. if fdiv, 22. if fadd)
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- debug ------------------------------------------------------------------------------------------------{{{
  DEBUG_GEN_FALSE: if DEBUG_IMPLEMENT = 0 generate
    debug_op_counter_per_cu_i   <= (others => '0');
  end generate;

  DEBUG_GEN_TRUE: if DEBUG_IMPLEMENT /= 0 generate
    -- sequential process that counts how many operations are executed by all WIs scheduled on this CU
    process(clk)
      variable op_acc  : unsigned(2*DATA_W-1 downto 0) := (others => '0');
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          debug_op_counter_per_cu_i <= (others => '0');
          op_acc := (others => '0');
        else
          if (debug_reset_all_counters = '1') then
            debug_op_counter_per_cu_i <= (others => '0');
            op_acc := (others => '0');
          else
            for i in 0 to CV_SIZE-1 loop
              if (family_vec(22) /= (0 to 3 => '0') and alu_en_i(i) = '1') then
                op_acc := op_acc + 1;
              end if;
            end loop;
            debug_op_counter_per_cu_i <= op_acc;
          end if;
        end if;
      end if;
    end process;


    -- Counting operations #clk cycles (sequential)
    process(clk)
    begin
      if rising_edge(clk) then
        if nrst = '0' then
          debug_op_clk_cycles_counter <= (others => (others => '0'));
          debug_op_clk_cycles_counter_no_oh <= (others => (others => '0'));
          last_instr <= (others => '0');
        else
          debug_op_clk_cycles_counter <= debug_op_clk_cycles_counter_n;
          debug_op_clk_cycles_counter_no_oh <= debug_op_clk_cycles_counter_no_oh_n;
          last_instr <= last_instr_n;
        end if;
      end if;
    end process;

    -- Counting operations #clk cycles (comb)
    process(debug_op_clk_cycles_counter, last_instr, family, cu_is_working)
    begin
      debug_op_clk_cycles_counter_n <= debug_op_clk_cycles_counter;
      debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
      last_instr_n <= last_instr;

      -- managing the latency of operations filled with zeros
      if family = x"0" and cu_is_working = '1' then
        if last_instr(0) = '1' then -- ADD
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(1) <= debug_op_clk_cycles_counter(1) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(1) = '1' then -- SHF
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(2) <= debug_op_clk_cycles_counter(2) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(2) = '1' then -- LGK
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(3) <= debug_op_clk_cycles_counter(3) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(3) = '1' then -- MOV
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(4) <= debug_op_clk_cycles_counter(4) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(4) = '1' then -- MUL
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(5) <= debug_op_clk_cycles_counter(5) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(5) = '1' then -- BRA
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(6) <= debug_op_clk_cycles_counter(6) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(6) = '1' then -- GLS
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(7) <= debug_op_clk_cycles_counter(7) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(7) = '1' then -- ATO
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(8) <= debug_op_clk_cycles_counter(8) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(8) = '1' then -- CTL
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(9) <= debug_op_clk_cycles_counter(9) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(9) = '1' then -- RTM
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(10) <= debug_op_clk_cycles_counter(10) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(10) = '1' then -- CND
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(11) <= debug_op_clk_cycles_counter(11) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(11) = '1' then -- FLT
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(12) <= debug_op_clk_cycles_counter(12) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(12) = '1' then -- LSI
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(13) <= debug_op_clk_cycles_counter(13) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        elsif last_instr(13) = '1' then -- DIV
          debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
          debug_op_clk_cycles_counter_n(14) <= debug_op_clk_cycles_counter(14) + 1;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        else -- still waiting for the first instruction
          debug_op_clk_cycles_counter_n <= debug_op_clk_cycles_counter;
          debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
          last_instr_n <= last_instr;
        end if;

        -- managing operation families
      elsif family = x"1"  and cu_is_working = '1' then -- ADD
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(1) <= debug_op_clk_cycles_counter(1) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(1) <= debug_op_clk_cycles_counter_no_oh(1) + 1;
        last_instr_n <= "00000000000001";
      elsif family = x"2"  and cu_is_working = '1' then -- SHF
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(2) <= debug_op_clk_cycles_counter(2) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(2) <= debug_op_clk_cycles_counter_no_oh(2) + 1;
        last_instr_n <= "00000000000010";
      elsif family = x"3"  and cu_is_working = '1' then -- LGK
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(3) <= debug_op_clk_cycles_counter(3) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(3) <= debug_op_clk_cycles_counter_no_oh(3) + 1;
        last_instr_n <= "00000000000100";
      elsif family = x"4"  and cu_is_working = '1' then -- MOV
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(4) <= debug_op_clk_cycles_counter(4) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(4) <= debug_op_clk_cycles_counter_no_oh(4) + 1;
        last_instr_n <= "00000000001000";
      elsif family = x"5"  and cu_is_working = '1' then -- MUL
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(5) <= debug_op_clk_cycles_counter(5) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(5) <= debug_op_clk_cycles_counter_no_oh(5) + 1;
        last_instr_n <= "00000000010000";
      elsif family = x"6"  and cu_is_working = '1' then -- BRA
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(6) <= debug_op_clk_cycles_counter(6) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(6) <= debug_op_clk_cycles_counter_no_oh(6) + 1;
        last_instr_n <= "00000000100000";
      elsif family = x"7"  and cu_is_working = '1' then -- GLS
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(7) <= debug_op_clk_cycles_counter(7) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(7) <= debug_op_clk_cycles_counter_no_oh(7) + 1;
        last_instr_n <= "00000001000000";
      elsif family = x"8"  and cu_is_working = '1' then -- ATO
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(8) <= debug_op_clk_cycles_counter(8) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(8) <= debug_op_clk_cycles_counter_no_oh(8) + 1;
        last_instr_n <= "00000010000000";
      elsif family = x"9"  and cu_is_working = '1' then -- CTL
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(9) <= debug_op_clk_cycles_counter(9) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(9) <= debug_op_clk_cycles_counter_no_oh(9) + 1;
        last_instr_n <= "00000100000000";
      elsif family = x"A"  and cu_is_working = '1' then -- RTM
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(10) <= debug_op_clk_cycles_counter(10) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(10) <= debug_op_clk_cycles_counter_no_oh(10) + 1;
        last_instr_n <= "00001000000000";
      elsif family = x"B"  and cu_is_working = '1' then -- CND
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(11) <= debug_op_clk_cycles_counter(11) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(11) <= debug_op_clk_cycles_counter_no_oh(11) + 1;
        last_instr_n <= "00010000000000";
      elsif family = x"C"  and cu_is_working = '1' then -- FLT
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(12) <= debug_op_clk_cycles_counter(12) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(12) <= debug_op_clk_cycles_counter_no_oh(12) + 1;
        last_instr_n <= "00100000000000";
      elsif family = x"D"  and cu_is_working = '1' then -- LSI
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(13) <= debug_op_clk_cycles_counter(13) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(13) <= debug_op_clk_cycles_counter_no_oh(13) + 1;
        last_instr_n <= "01000000000000";
      elsif family = x"E"  and cu_is_working = '1' then -- DIV
        debug_op_clk_cycles_counter_n(0) <= debug_op_clk_cycles_counter(0) + 1;
        debug_op_clk_cycles_counter_n(14) <= debug_op_clk_cycles_counter(14) + 1;
        debug_op_clk_cycles_counter_no_oh_n(0) <= debug_op_clk_cycles_counter_no_oh(0) + 1;
        debug_op_clk_cycles_counter_no_oh_n(14) <= debug_op_clk_cycles_counter_no_oh(14) + 1;
        last_instr_n <= "10000000000000";

      -- if cu is not working counting must stop
      elsif cu_is_working = '0' then
        debug_op_clk_cycles_counter_n <= debug_op_clk_cycles_counter;
        debug_op_clk_cycles_counter_no_oh_n <= debug_op_clk_cycles_counter_no_oh;
        last_instr_n <= (others => '0');
      end if;

    end process;


  end generate;
-----------------------------------------------------------------------------------------------------------}}}

end Behavioral;
