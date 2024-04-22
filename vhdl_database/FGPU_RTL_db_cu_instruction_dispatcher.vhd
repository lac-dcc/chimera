-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity cu_instruction_dispatcher is --{{{
port(
  clk, nrst           : in std_logic;

  cram_rqst           : out std_logic;
    -- request to the CRAM
  cram_rdAddr         : out unsigned(CRAM_ADDR_W-1 downto 0);
    -- read address to the CRAM
  cram_rdAddr_conf    : in unsigned(CRAM_ADDR_W-1 downto 0);
    -- address of the read data from the CRAM
  cram_rdData         : in std_logic_vector(DATA_W-1 downto 0); -- cram_rdData is delayed by 1 clock cycle to cram_rdAddr_conf
    -- read data from the CRAM

  PC_indx             : in integer range 0 to N_WF_CU-1; --response in two clk cycles
    -- index of the program counter of the wf that is being executed
  wf_active           : in std_logic_vector(N_WF_CU-1 downto 0);
    -- wf_active(i) = '1' if the i-th wf is active
  pc_updated          : in std_logic_vector(N_WF_CU-1 downto 0);
    -- signal set high after updating the program counter
  PCs                 : in CRAM_ADDR_ARRAY(N_WF_CU-1 downto 0);
    -- program counters
  pc_rdy              : out std_logic_vector(N_WF_CU-1 downto 0);
    -- pc_rdy(i) = '1' if the program counter of the i-th wf is ready
  instr               : out std_logic_vector(DATA_W-1 downto 0); -- 1 clock cycle delayed after pc_rdy
    -- dispatched instruction
  instr_gmem_op       : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when executing a gmem operation
  instr_gmem_read     : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when reading the gmem
  instr_scratchpad_ld : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when loading the scratchpad
  instr_smem_op       : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when executing a smem operation
  instr_smem_read     : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when reading the smem
  instr_branch        : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when branching
  instr_jump          : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when jumping
  instr_fpu           : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when performing a floating-point operation
  instr_sync          : out std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when performing a lsync operation
  branch_distance     : out branch_distance_vec(0 to N_WF_CU-1);
    -- equal to the branch jump

  wf_retired          : out std_logic_vector(N_WF_CU-1 downto 0)
);
end cu_instruction_dispatcher; -- }}}

architecture Behavioral of cu_instruction_dispatcher is

  type st_cram_type is (request, wait_resp, check);
  type instr_vec_type is array (N_WF_CU-1 downto 0) of std_logic_vector(DATA_W-1 downto 0);

  -- internal signals definitions {{{
  signal cram_rdAddr_i                    : unsigned(CRAM_ADDR_W-1 downto 0);
  signal pc_rdy_i                         : std_logic_vector(N_WF_CU-1 downto 0);
  signal wf_retired_i                     : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_gmem_op_i                  : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_scratchpad_ld_i            : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_smem_op_i                  : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_smem_read_i                : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_branch_i                   : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_jump_i                     : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_fpu_i                      : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_gmem_read_i                : std_logic_vector(N_WF_CU-1 downto 0);
  signal instr_sync_i                     : std_logic_vector(N_WF_CU-1 downto 0);
  signal branch_distance_i                : branch_distance_vec(0 to N_WF_CU-1);
  -- }}}

  -- signals definitions {{{

  signal instr_vec, instr_vec_n           : instr_vec_type;
    -- vector containing the dispatched instructions of the different WFs
  signal st_cram, st_cram_n               : st_cram_type;
    -- state of the CRAM memory
  signal cram_ack                         : std_logic_vector(N_WF_CU-1 downto 0);
    -- cram_ack(i) = '1' when receving the read data for the i-th wf

  -- next signals
  signal cram_rdAddr_n                    : unsigned(CRAM_ADDR_W-1 downto 0);
    -- read address to the CRAM
  signal pc_rdy_n                         : std_logic_vector(N_WF_CU-1 downto 0);
    -- pc_rdy(i) = '1' if the program counter of the i-th wf is ready
  signal instr_gmem_op_n                  : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when writing the gmem
  signal instr_scratchpad_ld_n            : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when loading the scratchpad
  signal instr_smem_op_n                  : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when executing a smem operation
  signal instr_smem_read_n                : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when reading the smem
  signal instr_branch_n                   : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when branching
  signal instr_jump_n                     : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when jumping
  signal instr_fpu_n                      : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when performing a floating-point operation
  signal instr_gmem_read_n                : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when reading the gmem
  signal instr_sync_n                     : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when performing a lsync operation
  signal wf_retired_n                     : std_logic_vector(N_WF_CU-1 downto 0);
    -- set high when performing a ret instruction
  signal branch_distance_n                : branch_distance_vec(0 to N_WF_CU-1);
    -- equal to the branch jump

  -- }}}
begin
  -- internal signals -------------------------------------------------------------------------------------{{{
  cram_rdAddr <= cram_rdAddr_i;
  pc_rdy <= pc_rdy_i;
  wf_retired <= wf_retired_i;
  instr_gmem_op <= instr_gmem_op_i;
  instr_scratchpad_ld <= instr_scratchpad_ld_i;
  instr_smem_op <= instr_smem_op_i;
  instr_smem_read <= instr_smem_read_i;
  instr_gmem_read <= instr_gmem_read_i;
  instr_branch <= instr_branch_i;
  instr_jump <= instr_jump_i;
  instr_fpu <= instr_fpu_i;
  instr_sync <= instr_sync_i;
  branch_distance <= branch_distance_i;
  ---------------------------------------------------------------------------------------------------------}}}

  -- cram FSM -----------------------------------------------------------------------------------  {{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        st_cram <= check;
        instr_gmem_op_i <= (others => '0');
        instr_scratchpad_ld_i <= (others => '0');
        instr_smem_op_i <= (others=> '0');
		    instr_smem_read_i <= (others=> '0');
        instr_branch_i <= (others => '0');
        instr_jump_i <= (others => '0');
        instr_fpu_i <= (others => '0');
        instr_sync_i <= (others=>'0');
        branch_distance_i <= (others => (others => '0'));
        instr_gmem_read_i <= (others => '0');
        wf_retired_i <= (others => '0');
        pc_rdy_i <= (others => '0');
        cram_rdAddr_i <= (others => '0');
        instr_vec <= (others => (others => '0'));
        instr <= (others => '0');

        cram_ack <= (others => '0'); -- NOT NEEDED
      else
        st_cram <= st_cram_n;
        pc_rdy_i <= pc_rdy_n;
        cram_rdAddr_i <= cram_rdAddr_n;
        instr_vec <= instr_vec_n;
        instr <= instr_vec(PC_indx);
        instr_gmem_op_i <= instr_gmem_op_n;
        instr_scratchpad_ld_i <= instr_scratchpad_ld_n;
        instr_smem_op_i <= instr_smem_op_n;
		    instr_smem_read_i <= instr_smem_read_n;
        branch_distance_i <= branch_distance_n;
        instr_branch_i <= instr_branch_n;
        instr_jump_i <= instr_jump_n;
        instr_fpu_i <= instr_fpu_n;
        instr_gmem_read_i <= instr_gmem_read_n;
        instr_sync_i <= instr_sync_n;
        wf_retired_i <= wf_retired_n;
        cram_ack <= (others => '0');
        for i in 0 to N_WF_CU-1 loop
          if pc_rdy_i(i) = '0' and pc_updated(i) = '0' and PCs(i) = cram_rdAddr_conf and wf_active(i) = '1' then
            cram_ack(i) <= '1';
          end if;
        end loop;

        -- for i in 0 to N_WF_CU-1 loop
        --   if wf_activate(i) = '1' then
        --     wf_active(i) <= '1';
        --   elsif wf_retired_i(i) = '1' then
        --     wf_active(i) <= '0';
        --   end if;
        -- end loop;
      end if;
    end if;
  end process;

  WFs_bufs: for i in 0 to N_WF_CU-1 generate
  begin
    WF_buf: process(pc_updated(i), pc_rdy_i(i), cram_rdData, instr_vec(i), wf_retired_i(i), instr_gmem_op_i(i), instr_branch_i(i),
                    instr_gmem_read_i(i), instr_sync_i(i), branch_distance_i(i), cram_ack(i), instr_jump_i(i), instr_fpu_i(i), instr_scratchpad_ld_i(i),
                    instr_smem_op_i(i), instr_smem_read_i(i))
    begin
      pc_rdy_n(i) <= pc_rdy_i(i);
      instr_vec_n(i) <= instr_vec(i);
      wf_retired_n(i) <= wf_retired_i(i);
      instr_gmem_op_n(i) <= instr_gmem_op_i(i);
      instr_scratchpad_ld_n(i) <= instr_scratchpad_ld_i(i);
      instr_smem_op_n(i) <= instr_smem_op_i(i);
	    instr_smem_read_n(i) <= instr_smem_read_i(i);
      branch_distance_n(i) <= branch_distance_i(i);
      instr_branch_n(i) <= instr_branch_i(i);
      instr_jump_n(i) <= instr_jump_i(i);
      instr_fpu_n(i) <= instr_fpu_i(i);
      instr_gmem_read_n(i) <= instr_gmem_read_i(i);
      instr_sync_n(i) <= instr_sync_i(i);
      -- if wf_active(i) = '0' then
      --   wf_retired_n(i) <= '0';
      -- end if;
      if pc_updated(i) = '1' then
        pc_rdy_n(i) <= '0';
      elsif cram_ack(i) = '1' then
        instr_vec_n(i) <= cram_rdData;
        instr_gmem_op_n(i) <= '0';
        instr_gmem_read_n(i) <= '0';
        instr_branch_n(i) <= '0';
        instr_jump_n(i) <= '0';
        instr_fpu_n(i) <= '0';
        instr_sync_n(i) <= '0';
        pc_rdy_n(i) <= '1';
        wf_retired_n(i) <= '0';
        instr_scratchpad_ld_n(i) <= '0';
        instr_smem_op_n(i) <= '0';
		    instr_smem_read_n(i) <= '0';
        case cram_rdData(FAMILY_POS+FAMILY_W-1 downto FAMILY_POS) is
          when GLS_FAMILY =>
            instr_gmem_op_n(i) <= '1';
            instr_gmem_read_n(i) <= not cram_rdData(CODE_POS+CODE_W-1); -- set to 1 if load, set to 0 if store
          when ATO_FAMILY =>
            instr_gmem_op_n(i) <= '1';
            instr_gmem_read_n(i) <= '1';
          when BRA_FAMILY =>
            if cram_rdData(CODE_POS+CODE_W-1 downto CODE_POS) = CODE_JSUB then
              instr_jump_n(i) <= '1';
            else
              instr_branch_n(i) <= '1';
            end if;
            branch_distance_n(i) <= unsigned(cram_rdData(BRANCH_ADDR_POS+BRANCH_ADDR_W-1 downto BRANCH_ADDR_POS));
          when CTL_FAMILY =>
            if cram_rdData(CODE_POS+CODE_W-1 downto CODE_POS) = CODE_RET then
              wf_retired_n(i) <= '1';
            elsif cram_rdData(CODE_POS+CODE_W-1 downto CODE_POS) = CODE_SYNC then
              instr_sync_n(i) <= '1';
            end if;
          when LSI_FAMILY =>
          if cram_rdData(CODE_POS) = '1' then
			      instr_smem_op_n(i) <= '1';
            instr_smem_read_n(i) <= not cram_rdData(CODE_POS+CODE_W-1); -- set to 1 if load, set to 0 if store
          else
            instr_scratchpad_ld_n(i) <= not cram_rdData(CODE_POS+CODE_W-1); -- set to 1 if load, set to 0 if store
          end if;
          when FLT_FAMILY =>
            instr_fpu_n(i) <= '1';
          when others =>
        end case;
      end if;
    end process;
  end generate;

  process(st_cram, cram_rdAddr_i, cram_rdAddr_conf, pc_rdy_i, wf_active, PCs)
  begin
    cram_rdAddr_n <= cram_rdAddr_i;
    cram_rqst <= '0';
    st_cram_n <= st_cram;
    case st_cram is
      when check =>
        for i in 0 to N_WF_CU-1 loop
          if wf_active(i)='1' and pc_rdy_i(i)='0' then
            st_cram_n <= request;
            cram_rdAddr_n <= PCs(i);
          end if;
        end loop;
      when request =>
        cram_rqst <= '1';
        st_cram_n <= wait_resp;
      when wait_resp =>
        cram_rqst <= '1';
        if cram_rdAddr_conf = cram_rdAddr_i then
          st_cram_n <= check;
          cram_rqst <= '0';
        end if;
    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

end Behavioral;
