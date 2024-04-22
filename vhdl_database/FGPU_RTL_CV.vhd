-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity CV is  -- {{{
port(
  -- CU Scheduler signals 
  instr                   : in std_logic_vector(DATA_W-1 downto 0); -- level 0.
  wf_indx, wf_indx_in_wg  : in natural range 0 to N_WF_CU-1; -- level 0.
  phase                   : in unsigned(PHASE_W-1 downto 0); -- level 0.
  alu_en_divStack         : in std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); -- level 2.

  -- RTM signals
  rdAddr_alu_en           : out unsigned(N_WF_CU_W+PHASE_W-1 downto 0) := (others=>'0'); -- level 2.
  rdData_alu_en           : in std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); -- level 4.
  rtm_rdAddr              : out unsigned(RTM_ADDR_W-1 downto 0) := (others => '0'); -- level 13.
  rtm_rdData              : in unsigned(RTM_DATA_W-1 downto 0); -- level 15.
  
  -- gmem signals
  gmem_re, gmem_we        : out std_logic := '0';     -- level 17.
  mem_op_type             : out std_logic_vector(2 downto 0) := (others=>'0'); --level 17.
  mem_addr                : out GMEM_ADDR_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));   -- level 17.
  mem_rd_addr             : out unsigned(REG_FILE_W-1 downto 0) := (others=>'0'); -- level 17.
  mem_wrData              : out SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); --level 17.
  alu_en                  : out std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); -- level 17.
  alu_en_pri_enc          : out integer range 0 to CV_SIZE-1 := 0; -- level 17.
  lmem_rqst, lmem_we      : out std_logic := '0';     -- level 17.
  gmem_atomic             : out std_logic := '0';     -- level 17.

  --branch
  wf_is_branching         : out std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0'); -- level 18.
  alu_branch              : out std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0'); -- level 18.
  
  mem_regFile_wrAddr      : in unsigned(REG_FILE_W-1 downto 0); -- stage -1 (stable for 3 clock cycles)
  mem_regFile_we          : in std_logic_vector(CV_SIZE-1 downto 0); -- stage 0 (stable for 2 clock cycles) (level 20. for loads from lmem)
  mem_regFile_wrData      : in SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- stage 0 (stabel for 2 clock cycles)
  lmem_regFile_we_p0      : in std_logic := '0'; -- level 19.

  clk                     : in std_logic
);
  attribute max_fanout of wf_indx : signal is 10;
end CV; -- }}}
architecture Behavioral of CV is
  -- signals definitions -------------------------------------------------------------------------------------- {{{
  -----------------  RTM & Initial ALU enable
  type rtm_rdAddr_vec_type is array (natural range <>) of unsigned(RTM_ADDR_W-1 downto 0);
  signal rtm_rdAddr_vec                   : rtm_rdAddr_vec_type(9 downto 0) := (others=>(others=>'0'));
  signal rdData_alu_en_vec                : alu_en_vec_type(MAX_FPU_DELAY+6 downto 0) := (others=>(others=>'0'));
  signal rtm_rdData_d0                    : unsigned(RTM_DATA_W-1 downto 0);
  signal alu_en_divStack_vec              : alu_en_vec_type(2 downto 0) := (others=>(others=>'0'));
  signal rdAddr_alu_en_p0                 : unsigned(N_WF_CU_W+PHASE_W-1 downto 0) := (others=>'0');

  -----------------  global use
  signal phase_d0, phase_d1               : unsigned( PHASE_W-1 downto 0) := (others=>'0');
  signal op_arith_shift, op_arith_shift_n : op_arith_shift_type := op_add;
  
  ------------------    decoding 
  signal family                           : std_logic_vector(FAMILY_W-1 downto 0) := (others=>'0');
  signal code                             : std_logic_vector(CODE_W-1 downto 0) := (others=>'0');
  signal inst_rd_addr, inst_rs_addr       : std_logic_vector(WI_REG_ADDR_W-1 downto 0) := (others=>'0');
  signal inst_rt_addr                     : std_logic_vector(WI_REG_ADDR_W-1 downto 0) := (others=>'0');
  type dim_vec_type is array (natural range <>) of std_logic_vector(1 downto 0);
  signal dim_vec                          : dim_vec_type(1 downto 0) := (others=>(others=>'0'));
  signal dim                              : std_logic_vector(1 downto 0) := (others=>'0');
  type params_vec_type is array (natural range <>) of std_logic_vector(N_PARAMS_W-1 downto 0);
  signal params_vec                       : params_vec_type(1 downto 0) := (others=>(others=>'0'));
  signal params                           : std_logic_vector(N_PARAMS_W-1 downto 0) := (others=>'0');
  type family_vec_type is array(natural range <>) of std_logic_vector(FAMILY_W-1 downto 0);
  signal family_vec                       : family_vec_type(MAX_FPU_DELAY+10 downto 0) := (others=>(others=>'0'));
  signal family_vec_at_16                 : std_logic_vector(FAMILY_W-1 downto 0) := (others=>'0'); -- this signal is extracted out of family_vec to dcrease the fanout @family_vec(..@16)
  attribute max_fanout of family_vec_at_16: signal is 40;
  signal branch_on_zero                   : std_logic := '0';
  signal branch_on_not_zero               : std_logic := '0';
  signal wf_is_branching_p0               : std_logic_vector(N_WF_CU-1 downto 0) := (others=>'0');
  signal code_vec                         : code_vec_type(15 downto 0) := (others=>(others=>'0'));
  type immediate_vec_type is array(natural range <>) of std_logic_vector(IMM_W-1 downto 0);
  signal immediate_vec                    : immediate_vec_type(5 downto 0) := (others=>(others=>'0'));
  type wf_indx_array is array (natural range <>) of natural range 0 to N_WF_CU-1;
  signal wf_indx_vec                      : wf_indx_array(15 downto 0) := (others=>0);
  signal wf_indx_in_wg_vec                : wf_indx_array(1 downto 0) := (others=>0); 
  ------------------   register file  
  signal rs_addr, rt_addr, rd_addr        : unsigned(REG_FILE_BLOCK_W-1 downto 0) := (others=>'0');
  type op_arith_shift_vec_type is array(natural range <>) of op_arith_shift_type;
  signal op_arith_shift_vec               : op_arith_shift_vec_type(4 downto 0) := (others => op_add);
  signal op_logical_v                     : std_logic := '0';
  signal regBlock_re                      : std_logic_vector(N_REG_BLOCKS-1 downto 0) := (others=>'0');
  -- attribute max_fanout of regBlock_re    : signal is 10;
  signal regBlocK_re_n                    : std_logic := '0';
  signal reg_we_alu, reg_we_alu_n         : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal reg_we_float                     : std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  signal res_alu                          : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  type rd_out_vec_type is array (natural range <>) of slv32_array(CV_SIZE-1 downto 0);
  signal rd_out_vec                       : rd_out_vec_type(6 downto 0) := (others=>(others=>(others=>'0')));

  ------------------    global memory
  signal gmem_re_p0, gmem_we_p0           : std_logic := '0';
  signal gmem_ato_p0                      : std_logic := '0'; 
  -------------------------------------------------------------------------------------}}}
  -- write back into regFiles  {{{
  type regBlock_we_vec_type is array(natural range <>) of std_logic_vector(N_REG_BLOCKS-1 downto 0);
  signal regBlock_we                      : regBlock_we_vec_type(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal regBlock_we_alu                  : std_logic_vector(N_REG_BLOCKS-1 downto 0) := (others=>'0');
  attribute max_fanout of regBlock_we_alu : signal is 50;
  signal regBlock_we_mem                  : std_logic_vector(N_REG_BLOCKS-1 downto 0) := (others=>'0');
  signal wrAddr_regFile_vec               : reg_addr_array(MAX_FPU_DELAY+12 downto 0) := (others=>(others=>'0'));
  signal regBlock_wrAddr                  : reg_file_block_array(N_REG_BLOCKS-1 downto 0) := (others=>(others=>'0'));
  signal wrData_alu                       : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  type regBlock_wrData_type is array(natural range <>) of slv32_array(N_REG_BLOCKS-1 downto 0);
  signal regBlock_wrData                  : regBlock_wrData_type(CV_SIZE-1 downto 0) := (others=>(others=>(others=>'0')));
  signal rtm_rdData_nlid_vec              : std_logic_vector(3 downto 0) := (others=>'0');
  signal res_low                          : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); 
  signal res_alu_clk2x_d0                 : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); 
  signal res_high                         : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); 
  signal reg_we_mov_vec                   : alu_en_vec_type(6 downto 0) := (others=>(others=>'0'));
  signal mem_regFile_wrAddr_d0            : unsigned(REG_FILE_W-1 downto 0); 
  signal lmem_regFile_we                  : std_logic := '0';
  -- }}}
  -- floating point {{{
  signal float_a, float_b                 : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal res_float                        : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal res_float_d0                     : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal res_float_d1                     : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal regBlock_we_float_vec            : regBlock_we_vec_type(MAX_FPU_DELAY-7 downto 0) := (others=>(others=>'0'));
  signal regBlock_we_float                : std_logic_vector(N_REG_BLOCKS-1 downto 0) := (others=>'0');
  attribute max_fanout of regBlock_we_float : signal is 50;
  -- }}}
begin
  -- internal signals and asserts -------------------------------------------------------------------------{{{
  ---------------------------------------------------------------------------------------------------------}}}
  -- RTM contorl & ALU enable -------------------------------------------------------------------- {{{
  process(clk)
  begin
    if rising_edge(clk) then
      -- rtm {{{
      rtm_rdData_d0 <= rtm_rdData; -- @ 16.
      if family_vec(family_vec'high-1) = RTM_FAMILY then -- level 2.
        case code_vec(code_vec'high-1) is -- level 2.
          when LID =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '0'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= unsigned(dim_vec(dim_vec'high-1)); --dimension
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= to_unsigned(wf_indx_in_wg_vec(wf_indx_in_wg_vec'high-1), N_WF_CU_W);
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1 downto 0) <= phase_d1;
          when WGOFF =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= unsigned(dim_vec(dim_vec'high-1)); --dimension  
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= to_unsigned(wf_indx_vec(wf_indx_vec'high-1), N_WF_CU_W);
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1 downto 0) <= (others=>'0');
          when SIZE =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= (others=>'1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2=>'0', others=>'1'); 
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1) <= '0';
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-2 downto 0) <= unsigned(dim_vec(dim_vec'high-1));
          when WGID =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= (others=>'1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1=>'1', others=>'0'); 
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1) <= '0';
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-2 downto 0) <= unsigned(dim_vec(dim_vec'high-1));
          when WGSIZE =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= (others=>'1');
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1=>'1', others=>'0'); 
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-1) <= '0';
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(PHASE_W-2 downto 0) <= unsigned(dim_vec(dim_vec'high-1));
          when LP =>
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-1) <= '1'; -- @ 3.
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11"; --dimension  
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_WF_CU_W+PHASE_W-1 downto N_PARAMS_W) <= (others=>'0'); -- wf_indx is zero, except its LSB, 
            rtm_rdAddr_vec(rtm_rdAddr_vec'high)(N_PARAMS_W-1 downto 0) <= unsigned(params_vec(params_vec'high-1)); -- @ 2.

          when others =>
        end case;
      end if;
      rtm_rdAddr_vec(rtm_rdAddr_vec'high-1 downto 0) <= rtm_rdAddr_vec(rtm_rdAddr_vec'high downto 1); -- @ 4.->12.
      rtm_rdAddr <= rtm_rdAddr_vec(0); -- @ 13.
      rtm_rdData_nlid_vec(rtm_rdData_nlid_vec'high-1 downto 0) <= rtm_rdData_nlid_vec(rtm_rdData_nlid_vec'high downto 1); -- @ 14.->16.
      rtm_rdData_nlid_vec(rtm_rdData_nlid_vec'high) <= rtm_rdAddr_vec(0)(RTM_ADDR_W-1); -- @ 13.
      -- }}}
      -- ALU enable {{{
      rdAddr_alu_en_p0(PHASE_W-1 downto 0) <= phase; --@ 1.
      rdAddr_alu_en_p0(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= to_unsigned(wf_indx_in_wg, N_WF_CU_W); --@ 1.
      rdAddr_alu_en <= rdAddr_alu_en_p0; -- @ 2.
      
      alu_en_divStack_vec(alu_en_divStack_vec'high) <= alu_en_divStack; -- @ 3.
      alu_en_divStack_vec(alu_en_divStack_vec'high-1 downto 0) <= alu_en_divStack_vec(alu_en_divStack_vec'high downto 1); -- @ 4.->5.

      rdData_alu_en_vec(rdData_alu_en_vec'high) <= rdData_alu_en; -- @ 5.
      rdData_alu_en_vec(rdData_alu_en_vec'high-1) <= rdData_alu_en_vec(rdData_alu_en_vec'high) and not alu_en_divStack_vec(0); -- @ 6.
      rdData_alu_en_vec(rdData_alu_en_vec'high-2 downto 0) <= rdData_alu_en_vec(rdData_alu_en_vec'high-1 downto 1); -- @ 7.->7+MAX_FPU_DELAY+4.

      -- for gmem operations
      alu_en <= rdData_alu_en_vec(rdData_alu_en_vec'high-11); -- @ 17.
      alu_en_pri_enc <= 0; -- @ 17.
      for i in CV_SIZE-1 downto 0 loop
        if rdData_alu_en_vec(rdData_alu_en_vec'high-11)(i) = '1' then -- level 16.
          alu_en_pri_enc <= i; -- @ 17.
        end if;
      end loop;
      -- }}}
    end if;
  end process;
  ----------------------------------------------------------------------------------------------}}}
  -- decoding logic --------------------------------------------------------------------{{{
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
      -- pipes {{{
      family_vec(family_vec'high-1 downto 0) <= family_vec(family_vec'high downto 1); -- @ 2.->2+MAX_FPU_DELAY+9.
      family_vec(family_vec'high) <= family; -- @ 1.
      family_vec_at_16 <= family_vec(family_vec'high-14); -- @ 16.
      dim_vec(dim_vec'high-1 downto 0) <= dim_vec(dim_vec'high downto 1); -- @ 2
      dim_vec(dim_vec'high) <= dim; -- @ 1.
      code_vec(code_vec'high-1 downto 0) <= code_vec(code_vec'high downto 1); -- @ 2.->16.
      code_vec(code_vec'high) <= code; -- @ 1.
      params_vec(params_vec'high-1 downto 0) <= params_vec(params_vec'high downto 1); -- @ 2.->2.
      params_vec(params_vec'high) <= params; -- @ 1.
      immediate_vec(immediate_vec'high-1 downto 0) <= immediate_vec(immediate_vec'high downto 1); -- @ 2.->6.
      immediate_vec(immediate_vec'high)(IMM_ARITH_W-1 downto 0) <= instr(IMM_POS+IMM_ARITH_W-1 downto IMM_POS); -- @ 1.
      immediate_vec(immediate_vec'high)(IMM_W-1 downto IMM_ARITH_W) <= instr(RS_POS+IMM_W-IMM_ARITH_W-1 downto RS_POS); -- @ 1.
      wf_indx_vec(wf_indx_vec'high-1 downto 0) <= wf_indx_vec(wf_indx_vec'high downto 1); -- @ 2.->16.
      wf_indx_vec(wf_indx_vec'high) <= wf_indx; -- @ 1.
      wf_indx_in_wg_vec(wf_indx_in_wg_vec'high-1 downto 0) <= wf_indx_in_wg_vec(wf_indx_in_wg_vec'high downto 1); -- @ 2.->2.
      wf_indx_in_wg_vec(wf_indx_in_wg_vec'high) <= wf_indx_in_wg; -- @ 1.
      regBlock_re(0) <= regBlock_re_n; -- @ 1.
      regBlock_re(regBlock_re'high downto 1) <= regBlock_re(regBlock_re'high-1 downto 0); -- @ 2.->4.
      op_arith_shift <= op_arith_shift_n;   -- @ 1.
      op_arith_shift_vec(op_arith_shift_vec'high-1 downto 0) <= op_arith_shift_vec(op_arith_shift_vec'high downto 1); -- @ 3.->6.
      op_arith_shift_vec(op_arith_shift_vec'high) <= op_arith_shift; -- @ 2.
      phase_d0 <= phase; -- @ 1.
      phase_d1 <= phase_d0; -- @ 2.
      -- }}}
      -- Rs, Rt & Rd addresses {{{
      rs_addr(REG_FILE_BLOCK_W-1) <= phase(PHASE_W-1); -- @1.
      rs_addr(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W) <= to_unsigned(wf_indx, N_WF_CU_W); -- @1.
      if family = ADD_FAMILY and code(3) = '1'then -- level 0.
        rs_addr(WI_REG_ADDR_W-1 downto 0) <= (others=>'0'); -- @1. -- for li & lui
      else
        rs_addr(WI_REG_ADDR_W-1 downto 0) <= unsigned(inst_rs_addr); -- @1.
      end if;

      rt_addr(REG_FILE_BLOCK_W-1) <= phase(PHASE_W-1); -- @1.
      rt_addr(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W) <= to_unsigned(wf_indx, N_WF_CU_W); -- @1.
      rt_addr(WI_REG_ADDR_W-1 downto 0) <= unsigned(inst_rt_addr); -- @1.

      rd_addr <= wrAddr_regFile_vec(wrAddr_regFile_vec'high)(REG_FILE_BLOCK_W-1 downto 0); -- @1.
      -- }}}
      -- set operation type {{{
      op_logical_v <= '0'; -- @ 14.
      if family_vec(family_vec'high-12) = LGK_FAMILY then -- level 13.
        op_logical_v <= '1'; -- @ 14.
      end if;
      -- }}}
    end if;
  end process;
  -- memory accesses {{{
  process(clk)
  begin
    if rising_edge(clk) then
      -- pipes {{{
      rd_out_vec(rd_out_vec'high-1 downto 0) <= rd_out_vec(rd_out_vec'high downto 1); -- @ 11.->16.
      -- }}}
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
        if family_vec(family_vec'high-15) = LSI_FAMILY then -- level 16.
          lmem_rqst <= '1'; -- @ 17.
          if code_vec(0)(3) =  '1' then -- level 16.
            lmem_we <= '1'; -- @ 17.
          else
            lmem_we <= '0'; -- @ 17.
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
  end process;
  -- }}}

  ------------------------------------------------------------------------------------------------}}}
  -- ALUs ----------------------------------------------------------------------------------------- {{{
  ALUs: for i in 0 to CV_SIZE-1 generate
  begin
    -- the calculation begins @ level 3 in the pipeline
    alu_inst: entity ALU port map(
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

      float_a => float_a(i), -- level 9.
      float_b => float_b(i), -- level 9.
      
      op_logical_v => op_logical_v, -- level 14.
      res_low => res_low(i), -- level 16.
      res_high => res_high(i), -- level 16.
      
      
      reg_wrData => regBlock_wrData(i), -- level 18. (level 21. for loads from lmem) (level 24. for float results)
      reg_wrAddr => regBlock_wrAddr, -- level 18. (level 21. for loads from lmem) (level 24. for float results)
      reg_we => regBlock_we(i), -- level 18. (level 21. for loads from lmem) (level 24. for float results)

      clk    => clk
      );
  end generate;
  -- set register files read enables {{{
  set_register_re:process(phase(0), family) -- this process executes in level 0. 
  begin
    regBlock_re_n <= '0'; -- level 0.
    case family is -- level 0.
      when ADD_FAMILY | MUL_FAMILY | BRA_FAMILY | SHF_FAMILY | LGK_FAMILY | CND_FAMILY | MOV_FAMILY | LSI_FAMILY | FLT_FAMILY | GLS_FAMILY | ATO_FAMILY=>
        if phase(PHASE_W-2 downto 0) = (0 to PHASE_W-2=>'0') then -- phase = 0 or 4
          regBlock_re_n <= '1';
        end if;
      when others =>
    end case; -- }}}
    -- set opertion type {{{
    op_arith_shift_n <= op_add; -- level 0.
    case family is -- level 0.
      when ADD_FAMILY =>
        op_arith_shift_n <= op_add;
      when MUL_FAMILY =>
        op_arith_shift_n <= op_mult;
      when GLS_FAMILY =>
        op_arith_shift_n <= op_lw;
      when LSI_FAMILY =>
        op_arith_shift_n <= op_lmem;
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
      when others =>
    end case;
  end process;
  -- }}}
  ---------------------------------------------------------------------------------------}}}
  -- floating point ---------------------------------------------------------------------------------------{{{
  float_units_inst: if FLOAT_IMPLEMENT /= 0 generate
    float_inst: entity float_units port map(
        float_a => float_a, -- level 9.
        float_b => float_b, -- level 9.
        fsub => code_vec(7)(CODE_W-1), -- level 9.
        code => code_vec(0),  -- level 16.

        res_float => res_float, -- level MAX_FPU_DELAY+10. (38 if fdiv, 21 if fadd)
        clk    => clk
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
  ---------------------------------------------------------------------------------------------------------}}}
  -- branch control ---------------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      -- @ 17 {{{
      res_alu <= res_low; -- @ 17.
      branch_on_zero <= '0'; -- @ 17.
      branch_on_not_zero <= '0'; -- @ 17.
      wf_is_branching_p0 <= (others=>'0');
      if family_vec(family_vec'high-15) = BRA_FAMILY then  -- level 16.
        wf_is_branching_p0(wf_indx_vec(0)) <= '1'; -- @ 17.
        case code_vec(0) is -- level 16.
          when BEQ =>
            branch_on_zero <= '1';   -- @ 17.
          when BNE =>
            branch_on_not_zero <= '1';  -- @ 17.
          when others=>
        end case;
      end if;
      -- }}}
      -- @ 18 {{{
      wf_is_branching <= wf_is_branching_p0;          -- @ 18.
      alu_branch <= (others=>'0'); -- @ 18.
      for i in 0 to CV_SIZE-1 loop
        if res_alu(i) = (res_alu(i)'reverse_range=>'0') then    -- level 17.
          if branch_on_zero = '1' then -- level 17.
            alu_branch(i) <= '1'; -- @ 18.
          end if;
        else
          if branch_on_not_zero = '1' then  -- level 17.
            alu_branch(i) <= '1'; -- @ 18.
          end if;
        end if;
      end loop;
      -- }}}
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- write back into regFiles ----------------------------------------------------------------------------------{{{
  -- register file -----------------------------------------------------------------------
  -- bits    10:9         8      7:5        4:0
  --      phase(1:0)  phase(2)  wf_indx    instr_rd_addr
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(REG_FILE_W-1 downto REG_FILE_W-2) <= phase(1 downto 0); -- level 0.
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(REG_FILE_W-3) <= phase(PHASE_W-1); -- level 0.
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W) <= to_unsigned(wf_indx, N_WF_CU_W); -- level 0.
  wrAddr_regFile_vec(wrAddr_regFile_vec'high)(WI_REG_ADDR_W-1 downto 0) <= unsigned(inst_rd_addr); -- level 0.
  write_alu_res_back: process(family_vec(family_vec'high-15), rdData_alu_en_vec(rdData_alu_en_vec'high-11), reg_we_mov_vec(0))
  begin

    reg_we_alu_n <= (others=>'0'); -- level 16.
    case family_vec(family_vec'high-15) is -- level 16.
      when RTM_FAMILY | ADD_FAMILY | MUL_FAMILY | SHF_FAMILY | LGK_FAMILY | CND_FAMILY =>
        reg_we_alu_n <= rdData_alu_en_vec(rdData_alu_en_vec'high-11); -- level 16.
      when MOV_FAMILY =>
        reg_we_alu_n <= rdData_alu_en_vec(rdData_alu_en_vec'high-11) and reg_we_mov_vec(0); -- level 16.
      when others=>
    end case;

  end process;
  process(clk)
  begin
    if rising_edge(clk) then
      wrAddr_regFile_vec(wrAddr_regFile_vec'high-1 downto 0) <= wrAddr_regFile_vec(wrAddr_regFile_vec'high downto 1); -- @ 1.->MAX_FPU_DELAY+12.
      reg_we_mov_vec(reg_we_mov_vec'high-1 downto 0) <= reg_we_mov_vec(reg_we_mov_vec'high downto 1); -- @ 11.->16.
      lmem_regFile_we <= lmem_regFile_we_p0;
      
      reg_we_alu <= reg_we_alu_n; -- @ 17.
      reg_we_float <= (others=>'0'); -- @ 23.
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
      wrData_alu <= (others=>(others=>'0')); -- @ 17.
      case family_vec_at_16 is -- level 16.
        when RTM_FAMILY =>
          if rtm_rdData_nlid_vec(0) = '0' then -- level 16.
            for i in 0 to CV_SIZE-1 loop
              wrData_alu(i)(WG_SIZE_W-1 downto 0) <=  std_logic_vector(rtm_rdData_d0((i+1)*WG_SIZE_W-1 downto i*WG_SIZE_W)); -- @ 17.
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

      regBlock_we_alu <= (others=>'0'); -- @ 17.
      regBlock_we_alu(to_integer(wrAddr_regFile_vec(wrAddr_regFile_vec'high-16)(REG_FILE_W-1 downto REG_FILE_BLOCK_W))) <= '1'; -- @ 17.+N_REG_BLOCKS*i
      -- regBlock_we_float {{{
      regBlock_we_float_vec(regBlock_we_float_vec'high) <= regBlock_we_alu; -- @ 18.+N_REG_BLOCKS*i
      regBlock_we_float_vec(regBlock_we_float_vec'high-1 downto 0) <= 
                    regBlock_we_float_vec(regBlock_we_float_vec'high downto 1); -- @ 19.->19+MAX_FPU_DELAY-7-1 (39. if fdiv, 22. if fadd)
      case MAX_FPU_DELAY is
        when FDIV_DELAY => -- fsqrt of fdiv has the maximum delay
          regBlock_we_float <= regBlock_we_float_vec(1); -- @ MAX_FPU_DELAY+11 (39. if fadd)
        when others => -- fadd has the maximum delay
          regBlock_we_float <= regBlock_we_float_vec(0); -- @ MAX_FPU_DELAY+12 (23. if fadd)
      end case;
      -- }}}
      -- the register block that will be written from global and local memory reads will be selected {{{
      if LMEM_IMPLEMENT = 0 or lmem_regFile_we_p0 = '0' then 
        -- if no read of lmem content is comming, prepare the we of the register block according to the current address sent from CU_mem_cntrl
        regBlock_we_mem <= (others=>'0'); -- stage 0
        regBlock_we_mem(to_integer(mem_regFile_wrAddr(REG_FILE_W-1 downto REG_FILE_BLOCK_W))) <= '1'; -- (@ 22. for lmem reads)
      elsif lmem_regFile_we = '0' or regBlock_we_mem(N_REG_BLOCKS-1) = '1' then 
        -- there will be a read from lmem or a half of the read data burst is over. Set the we of the first register block!
        regBlock_we_mem(N_REG_BLOCKS-1 downto 1) <= (others=>'0'); -- stage 0
        regBlock_we_mem(0) <= '1';
      else -- lmem is being read. Shift left for regBlock_we_mem!
        regBlock_we_mem(N_REG_BLOCKS-1 downto 1) <= regBlock_we_mem(N_REG_BLOCKS-2 downto 0);
        regBlock_we_mem(0) <= '0';
      end if;
      mem_regFile_wrAddr_d0 <= mem_regFile_wrAddr; -- stage 1
      -- }}}
      -- regBlock_wrAddr {{{
      for j in 0 to N_REG_BLOCKS-1 loop
        if regBlock_we_alu(j) = '1' then -- level 17.+j
          regBlock_wrAddr(j) <= wrAddr_regFile_vec(wrAddr_regFile_vec'high-17)(REG_FILE_BLOCK_W-1 downto 0); -- @ 18.+j
        elsif FLOAT_IMPLEMENT /= 0 and regBlock_we_float(j) = '1' then -- level 23.+j if add, 39.+j if fdiv
          case MAX_FPU_DELAY is
            when FDIV_DELAY => -- fsqrt of fdiv has the maximum delay
              regBlock_wrAddr(j) <= wrAddr_regFile_vec(1)(REG_FILE_BLOCK_W-1 downto 0); -- @ 40.+j if fdiv
            when others => -- fadd has the maximum delay
              regBlock_wrAddr(j) <= wrAddr_regFile_vec(0)(REG_FILE_BLOCK_W-1 downto 0); -- @ 24.+j if fadd
          end case;
        else
          regBlock_wrAddr(j) <= mem_regFile_wrAddr(REG_FILE_BLOCK_W-1 downto 0); -- stage 1. or 2.
        end if;
      end loop;
      -- }}}
      for i in 0 to CV_SIZE-1 loop
        for j in 0 to N_REG_BLOCKS-1 loop
          -- regBlock_wrData {{{
          if regBlock_we_alu(j) = '1' then -- level 17.
            -- write by alu operations
            regBlock_wrData(i)(j) <= wrData_alu(i); -- @ 18.
          elsif FLOAT_IMPLEMENT /= 0 and regBlock_we_float(j) = '1' then -- level 23. if fadd, 39. if fdiv
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
          if regBlock_we_alu(j) = '1' then -- level 17.+j
            regBlock_we(i)(j) <= reg_we_alu(i); -- @ 18.+j
          elsif FLOAT_IMPLEMENT /= 0 and regBlock_we_float(j) = '1' then -- level 23.+j if fadd, 39.+j uf fdiv
            regBlock_we(i)(j) <= reg_we_float(i); -- @ 24.+j if fadd, 40.+j if fdiv
          elsif regBlock_we_mem(j) = '1' then -- (level 22 for lmem reads; no conflict with 17+N_REG_BLOCKS*i)
            regBlock_we(i)(j) <= mem_regFile_we(i); -- @ 1. or 2. (@23. for loads from lmem)
          else
            regBlock_we(i)(j) <= '0';
          end if;
          -- }}}
        end loop;
      end loop;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
end Behavioral;

