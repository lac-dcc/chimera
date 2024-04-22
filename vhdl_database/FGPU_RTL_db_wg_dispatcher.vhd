-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity wg_dispatcher is
  -- ports {{{
port(
  clk, nrst : in std_logic;

  start               : in std_logic;
    -- start signal used to begin the initialization phase
  initialize_d0       : in std_logic;
    -- signal used to initialize RTM (bit of the Rinitiate control register for the new kernel to be executed)
  start_exec          : out std_logic;
    -- signal set to '1' to enter the scheduling phase
  krnl_indx           : in integer range 0 to NEW_KRNL_MAX_INDX-1;
    -- index of the new kernel to be executed (extracted from the Rstart control register)
  krnl_sch_rdAddr     : out std_logic_vector(KRNL_SCH_ADDR_W-1 downto 0);
    -- read address for the Link RAM memory
  krnl_sch_rdData     : in std_logic_vector(DATA_W-1 downto 0);
    -- data read from the Link RAM memory
  finish              : out std_logic;
    -- signal set to '1' when there is no WF active
  finish_krnl_indx    : out integer range 0 to NEW_KRNL_MAX_INDX-1;
    -- index of kernel whose execution just finished
  start_addr          : out unsigned(CRAM_ADDR_W-1 downto 0);
    -- address of the kernel first instruction in the CRAM

  -- cds interface
  req                 : out std_logic_vector(N_CU-1 downto 0);
    -- request signal to allocate WGs on CUs
  ack                 : in std_logic_vector(N_CU-1 downto 0);
    -- signal from CUs to acknowledge the scheduling request
  sch_rqst_n_WFs_m1   : out unsigned(N_WF_CU_W-1 downto 0);
    -- number of WFs in the WG to be scheduled
  wf_active           : in wf_active_array(N_CU-1 downto 0);
    -- wf_active(i)(j) is set to '1' if the j-th WF of the i-th CU is active
  wg_info             : out unsigned(DATA_W-1 downto 0);
    -- offset of the dispatched WG along D0/D1/D2 direction

  rdData_alu_en       : out alu_en_vec_type(N_CU-1 downto 0);
    -- read data alu enable
  rdAddr_alu_en       : in alu_en_rdAddr_type(N_CU-1 downto 0);
    -- write address alu enable
  rtm_wrAddr          : out unsigned(RTM_ADDR_W-1 downto 0);
    -- RTM write address
  rtm_wrData          : out unsigned(RTM_DATA_W-1 downto 0);
    -- RTM write data
  rtm_we              : out std_logic := '0'
    -- RTM write enable

);
-- }}}
end wg_dispatcher;

architecture Behavioral of wg_dispatcher is

  -- internal signals {{{
  signal start_exec_i                     :  std_logic;
    -- signal set to '1' to start the scheduling of #WG when the local index are ready and the alu is enabled or when the parameters have been stored in RTMs
  signal finish_i                         :  std_logic;
    -- signal set to '1' when the WG scheduler enters the "wait_finish" state
  signal sch_rqst_n_WFs_m1_i              :  unsigned(N_WF_CU_W-1 downto 0);
    -- number of WFs in the WG to be scheduled
  -- }}}

  -- signals definitions {{{
  signal schedulingInProgress             : std_logic_vector(N_CU-1 downto 0);
    -- registered version of schedulingInProgress_n
  signal schedulingInProgress_n           : std_logic_vector(N_CU-1 downto 0);
    -- the i-th of this array is set to '1' if a scheduling request to the i-th CU was transmitted
  signal nDim                             :  integer range 0 to 2;
    -- number of kernel dimensions

  type WG_st_sch_type is (idle, read_delay, prepare, seekCV, allocateWFs, checkAgain, wait_wf_active, wait_finish);
    -- states of the WG scheduler FSM

  signal st_sch_n : WG_st_sch_type;
    -- WG scheduler FSM state (combinatorial)
  signal st_sch : WG_st_sch_type;
    -- st_sch_n registered

  signal st_prepare_n                     : unsigned(NEW_KRNL_DESC_W-1 downto 0);
    -- Prepare FSM state (combinatorial). This signal is also the counter used to generate the parameters write addresses in RTM
  signal st_prepare                       : unsigned(NEW_KRNL_DESC_W-1 downto 0);
    -- st_prepare_n registered
  signal st_prepare_d0                    : unsigned(NEW_KRNL_DESC_W-1 downto 0);
    -- st_prepare registered

  signal params                           : unsigned(DATA_W-1 downto 0);
    -- signal used to transfer parameters from the LRAM to the RTM
  signal params_wrAddr                    : unsigned(N_PARAMS_W-1 downto 0);
    -- RTM write address when storing parameters
  signal params_written_n                 : std_logic;
    -- signal set to '1' when parameters have been stored in RTMs
  signal params_written                   : std_logic;
    -- params_written_n registered

  signal krnl_infos_we                    : std_logic;
    -- RTM write enable

  -- Signal used for kernel descriptor words
  signal id0_size                         : unsigned(DATA_W-1 downto 0);
    -- Global size in D0
  signal id1_size                         : unsigned(DATA_W-1 downto 0);
    -- Global size in D1
  signal id2_size                         : unsigned(DATA_W-1 downto 0);
    -- Global size in D2
  signal id0_offset                       : unsigned(DATA_W-1 downto 0);
    -- Global offset in D0
  signal id1_offset                       : unsigned(DATA_W-1 downto 0);
    -- Global offset in D1
  signal id2_offset                       : unsigned(DATA_W-1 downto 0);
    -- Global offset in D2
  signal wg_size_d0                       : integer range 0 to WG_MAX_SIZE;
    -- WG size in D0
  signal wg_size_d1                       : integer range 0 to WG_MAX_SIZE;
    -- WG size in D1
  signal wg_size_d2                       : integer range 0 to WG_MAX_SIZE;
    -- WG size in D2
  signal n_wg_d0_m1                       : unsigned(DATA_W-1 downto 0);
    -- #WG in D0
  signal n_wg_d1_m1                       : unsigned(DATA_W-1 downto 0);
    -- #WG in D1
  signal n_wg_d2_m1                       : unsigned(DATA_W-1 downto 0);
    -- #WG in D2
  signal wg_size                          : unsigned(WG_SIZE_W downto 0);
    -- WG size
  signal nParams                          : integer range 0 to N_PARAMS;
	-- #Paramters

  signal start_prepare                    : std_logic;
    -- registered start_prepare_n
  signal prepare_params_n                 : std_logic;
    -- signal set to '1' for one cycle during the "read_delay" state of the WG scheduler FSM if the parameters must be transfered from LRAM to RTM
  signal prepare_params                   : std_logic;
    -- registered prepare_params_n
  signal krnl_indx_ltchd                  : integer range 0 to NEW_KRNL_MAX_INDX-1;
    -- krnl_indx registered when receiving a start signal with the WF scheduler FSM in "idle" state
  signal addr_first_inst                  : unsigned(CRAM_ADDR_W-1 downto 0);
    -- address of the kernel first instruction in the CRAM

  signal prepare_fin                      : std_logic;
    -- registered prepare_fin_n
  signal nDisp_wg_d0                      : unsigned(DATA_W-1 downto 0);
    -- registered nDisp_wg_d0_n
  signal nDisp_wg_d1                      : unsigned(DATA_W-1 downto 0);
    -- registered nDisp_wg_d1_n
  signal nDisp_wg_d2                      : unsigned(DATA_W-1 downto 0);
    -- registered nDisp_wg_d2_n
  signal nDisp_wg_d1_ov                   : std_logic;
    -- signal set to '1' if all the #WG in D1 have been dispatched
  signal nDisp_wg_d0_ov                   : std_logic;
    -- signal set to '1' if all the #WG in D0 have been dispatched
  signal id0                              : unsigned(DATA_W-1 downto 0);
    -- registered id0_n
  signal id1                              : unsigned(DATA_W-1 downto 0);
    -- registered id1_n
  signal id2                              : unsigned(DATA_W-1 downto 0);
    -- registered id2_n

  -- next signals
  signal prepare_fin_n                    : std_logic;
    -- signal set to '1' for one cycle when parameters have been transfered from LRAM to RTM
  signal prepare_fin_d0                   : std_logic;
    -- registered prepare_fin
  signal start_loc_indcs                  : std_logic;
    -- start signal for the local indices generator, set to '1' after the parameters transfer phase if the initialize flag is high
  signal start_prepare_n                  : std_logic;
    -- signal set to '1' for one cycle during the "read_delay" state of the WG scheduler FSM
  signal nDisp_wg_d0_n                    : unsigned(DATA_W-1 downto 0);
    -- #WG dispatched in D0
  signal nDisp_wg_d1_n                    : unsigned(DATA_W-1 downto 0);
    -- #WG dispatched in D1
  signal nDisp_wg_d2_n                    : unsigned(DATA_W-1 downto 0);
    -- #WG dispatched in D2
  signal id0_n                            : unsigned(DATA_W-1 downto 0);
    -- counter increased by wg_size_d0 every time a #WG in D0 is dispatched
  signal id1_n                            : unsigned(DATA_W-1 downto 0);
    -- counter increased by wg_size_d1 every time a #WG in D1 is dispatched
  signal id2_n                            : unsigned(DATA_W-1 downto 0);
    -- counter increased by wg_size_d2 every time a #WG in D2 is dispatched
  signal nDisp_wg_d0_ov_n                 : std_logic;
    -- signal set to '1' if all the #WG in D0 have been dispatched
  signal nDisp_wg_d1_ov_n                 : std_logic;
    -- signal set to '1' if all the #WG in D0 have been dispatched
  signal req_n                            : std_logic_vector(N_CU-1 downto 0);
    -- request signals to the CUs
  signal wg_info_n                        : unsigned(DATA_W-1 downto 0);
    -- offset of the dispatched WG along D0/D1/D2 direction
  signal alu_en_rdy                       : std_logic;
    -- init alu enable finish flag
  signal start_d0                         : std_logic;
    -- registered start
  -- }}}

  -- RTM signals{{{
  signal rtm_we_n                         : std_logic;
    -- RTM write enable
  signal rtm_wrAddr_n                     : unsigned(RTM_ADDR_W-1 downto 0);
    -- RTM write address
  signal rtm_wrData_n                     : unsigned(RTM_DATA_W-1 downto 0);
    -- RTM write data
  --}}}

  -- scheduling signals {{{
  signal alloc_CV_indx                    : integer range 0 to N_CU;
    -- index of the CU chosen for the request
  signal cd_indx                          : unsigned(max(N_CU_W, 1)-1 downto 0);
    -- signal that indicates the CU on which the control must be performed
  signal cd_indx_d0                       : unsigned(max(N_CU_W, 1)-1 downto 0);
    -- registered cd_indx
  signal cd_indx_d1                       : unsigned(max(N_CU_W, 1)-1 downto 0);
    -- registered cd_indx_d0
  signal indx_running_n                   : std_logic;
    -- signal high when cd_indx must be increased
  signal indx_running                     : std_logic;
    -- registered version of indx_running_n
  signal wf_active_slctd                  : std_logic_vector(N_WF_CU-1 downto 0);
    -- wg_active(cd_index) row
  signal n_inactive_wfs                   : integer range 0 to N_WF_CU;
    -- number of inactive WF within wg_active(cd_index)
  --}}}

  -- loc indices signals {{{
  signal loc_indcs_fin                    : std_logic;
    -- local indices generator finish flag
  signal loc_indcs_wrAddr                 : unsigned(RTM_ADDR_W-2 downto 0);
    -- RTM write address for local indices
  signal loc_indcs_wrData                 : unsigned(RTM_DATA_W-1 downto 0);
    -- local indices to be written in RTM
  signal loc_indcs_we                     : std_logic;
    -- RTM write enable for local indices
  type loc_indcs_wr_state_type is ( write_size0, write_size1, write_size2, write_wg_size_d0, write_wg_size_d1, write_wg_size_d2, write_n_wgs_d0, write_n_wgs_d1,
                                    write_n_wgs_d2, write_params, write_loc_indcs, write_d0, write_d1, write_d2);
  signal loc_indcs_wr_state               : loc_indcs_wr_state_type;
    -- registered loc_indcs_wr_state_n
  signal loc_indcs_wr_state_n             : loc_indcs_wr_state_type;
    -- RTM write FSM state
  -- }}}

begin

  -- internal signals assignments --------------------------------------------------------------------{{{
  assert(RTM_DATA_W >= DATA_W) severity failure;
  start_exec <= start_exec_i;
  sch_rqst_n_WFs_m1 <= sch_rqst_n_WFs_m1_i;
  ---------------------------------------------------------------------------------------------------------}}}

  -- others {{{
  finish_krnl_indx <= krnl_indx_ltchd;
  start_addr <= addr_first_inst;
  --}}}

  -- local indices generator ------------------------------------------------------------------------------------ {{{
  loc_indcs_gen: loc_indcs_generator port map(
    clk => clk,
    start => start_loc_indcs,
    finish => loc_indcs_fin,
    clear_finish => start_exec_i,
    n_wf_wg_m1 => sch_rqst_n_WFs_m1_i,
    wg_size_d0 => wg_size_d0,
    wg_size_d1 => wg_size_d1,
    wg_size_d2 => wg_size_d2,
    wrAddr => loc_indcs_wrAddr,
    we => loc_indcs_we,
    wrData => loc_indcs_wrData,
    nrst => nrst
  );

  start_exec_i <= (loc_indcs_fin and alu_en_rdy) or params_written;

  -- RTM FSM
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then -- NOT NEEDED
        finish         <= '0';
        rtm_we         <= '0';
        rtm_wrAddr     <= (others => '0');
        rtm_wrData     <= (others => '0');
        wg_info        <= (others => '0');
        start_d0       <= '0';
        params_written <= '0';
      else
        finish <= finish_i;
        rtm_we <= rtm_we_n;
        rtm_wrAddr <= rtm_wrAddr_n;
        rtm_wrData <= rtm_wrData_n;
        wg_info <= wg_info_n;
        start_d0 <= start;
        params_written <= params_written_n;
        if nrst = '0' then
          loc_indcs_wr_state <= write_size0;
        else
          loc_indcs_wr_state <= loc_indcs_wr_state_n;
        end if;
      end if;
    end if;
  end process;

  process(loc_indcs_wr_state, req_n, id0, id1, id2, start_exec_i, loc_indcs_we, loc_indcs_wrAddr, loc_indcs_wrData, krnl_infos_we, params_wrAddr,
      params, prepare_fin_d0, finish_i, wg_size_d0, wg_size_d1, wg_size_d2, id0_size, id1_size, id2_size, n_wg_d0_m1, n_wg_d1_m1, n_wg_d2_m1,
      initialize_d0, start_d0)
  begin
    loc_indcs_wr_state_n <= loc_indcs_wr_state;
    rtm_we_n <= loc_indcs_we;
    rtm_wrAddr_n(RTM_ADDR_W-2 downto 0) <= loc_indcs_wrAddr;
    rtm_wrAddr_n(RTM_ADDR_W-1) <= '0';
    rtm_wrData_n <= loc_indcs_wrData;
    wg_info_n <= id0;
    params_written_n <= '0';

    case loc_indcs_wr_state is

      when write_size0 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '0', others => '1');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (others => '0');
        rtm_wrData_n(DATA_W-1 downto 0) <= id0_size;
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_size1;
        end if;
        if start_d0 = '1' and initialize_d0 = '0' then
          loc_indcs_wr_state_n <= write_params;
        end if;

      when write_size1 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '0', others => '1');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (0 => '1', others => '0');
        rtm_wrData_n(DATA_W-1 downto 0) <= id1_size;
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_size2;
        end if;

      when write_size2 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '0', others => '1');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (1 => '1', others => '0');
        rtm_wrData_n(DATA_W-1 downto 0) <= id2_size;
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_wg_size_d0;
        end if;

      when write_wg_size_d0 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1 => '1', others => '0');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (others => '0');
        rtm_wrData_n(DATA_W-1 downto WG_SIZE_W+1) <= (others => '0');
        rtm_wrData_n(WG_SIZE_W downto 0) <= to_unsigned(wg_size_d0, WG_SIZE_W+1);
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_n_wgs_d0;
        end if;

      when write_n_wgs_d0 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '1', others => '0');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (others => '0');
        rtm_wrData_n(DATA_W-1 downto 0) <= n_wg_d0_m1;
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_n_wgs_d1;
        end if;

      when write_n_wgs_d1 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '1', others => '0');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (0 => '1', others => '0');
        rtm_wrData_n(DATA_W-1 downto 0) <= n_wg_d1_m1;
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_n_wgs_d2;
        end if;

      when write_n_wgs_d2 =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+2 => '1', others => '0');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (1 => '1', others => '0');
        rtm_wrData_n(DATA_W-1 downto 0) <= n_wg_d2_m1;
        if krnl_infos_we = '1' then
          loc_indcs_wr_state_n <= write_wg_size_d1;
        end if;

      when write_wg_size_d1 =>
        rtm_we_n <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1 => '1', others => '0');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (0 => '1', others => '0');
        rtm_wrData_n(DATA_W-1 downto WG_SIZE_W+1) <= (others => '0');
        rtm_wrData_n(WG_SIZE_W downto 0) <= to_unsigned(wg_size_d1, WG_SIZE_W+1);
        loc_indcs_wr_state_n <= write_wg_size_d2;

      when write_wg_size_d2 =>
        rtm_we_n <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(N_WF_CU_W+PHASE_W-1 downto PHASE_W) <= (PHASE_W+1 => '1', others => '0');
        rtm_wrAddr_n(PHASE_W-1 downto 0) <= (1 => '1', others => '0');
        rtm_wrData_n(DATA_W-1 downto WG_SIZE_W+1) <= (others => '0');
        rtm_wrData_n(WG_SIZE_W downto 0) <= to_unsigned(wg_size_d2, WG_SIZE_W+1);
        loc_indcs_wr_state_n <= write_params;

      when write_params =>
        rtm_we_n <= krnl_infos_we;
        rtm_wrAddr_n(RTM_ADDR_W-1) <= '1';
        rtm_wrAddr_n(RTM_ADDR_W-2 downto RTM_ADDR_W-3) <= "11";
        rtm_wrAddr_n(RTM_ADDR_W-4 downto N_PARAMS_W) <= (others => '0');
        rtm_wrAddr_n(N_PARAMS_W-1 downto 0) <= params_wrAddr;
        rtm_wrData_n(DATA_W-1 downto 0) <= params;
        if prepare_fin_d0 = '1' then
          if initialize_d0 = '0' then
            loc_indcs_wr_state_n <= write_d0;
            params_written_n <= '1';
          else
            loc_indcs_wr_state_n <= write_loc_indcs;
          end if;
        end if;

      when write_loc_indcs =>
        if start_exec_i = '1' then
          loc_indcs_wr_state_n <= write_d0;
        end if;
        rtm_wrData_n <= loc_indcs_wrData;

      when write_d0 =>  -- rtm_we has not to be set during write_dx because it is done in the CU_schceduler.
                -- in case that a WG consists of multiple WFs, the WG's offsets need to written multiple times.
        wg_info_n <= id0;
        if to_integer(unsigned(req_n)) /= 0 then
          loc_indcs_wr_state_n <= write_d1;
        end if;
        if finish_i = '1' then
          loc_indcs_wr_state_n <= write_size0;
        end if;

      when write_d1 =>
        wg_info_n <= id1;
        loc_indcs_wr_state_n <= write_d2;

      when write_d2 =>
        wg_info_n <= id2;
        loc_indcs_wr_state_n <= write_d0;

    end case;
  end process;
  ---------------------------------------------------------------------------------------------------------------}}}

  -- WG scheduler FSM ------------------------------------------------------------------------------------{{{
  process(st_sch, start, alloc_CV_indx, start_exec_i, nDisp_wg_d0_ov, nDisp_wg_d1_ov, nDisp_wg_d0, nDisp_wg_d1, nDisp_wg_d2, id0, id1, id2,
        id0_offset, id1_offset, id2_offset, n_wg_d0_m1, n_wg_d1_m1, n_wg_d2_m1, wg_size_d0, wg_size_d1, wg_size_d2, wf_active, schedulingInProgress,
        initialize_d0, indx_running) --, alloc_CV_indx_ltchd)
  begin
    st_sch_n <= st_sch;
    start_prepare_n <= '0';
    id0_n <= id0;
    id1_n <= id1;
    id2_n <= id2;
    nDisp_wg_d0_n <= nDisp_wg_d0;
    nDisp_wg_d1_n <= nDisp_wg_d1;
    nDisp_wg_d2_n <= nDisp_wg_d2;
    nDisp_wg_d0_ov_n <= nDisp_wg_d0_ov;
    nDisp_wg_d1_ov_n <= nDisp_wg_d1_ov;
    req_n <= (others => '0');
    finish_i <= '0';
    prepare_params_n <= '0';
    schedulingInProgress_n <= schedulingInProgress;
	  indx_running_n <= indx_running;
    -- rtm_we_dx <= (others => '0');

    case st_sch is
      when idle =>
	    indx_running_n <= '0';
        if start = '1' then
          st_sch_n <= read_delay;
        end if;

      when read_delay =>
        st_sch_n <= prepare;
        start_prepare_n <= '1';
        if initialize_d0 = '0' then
          prepare_params_n <= '1';
        end if;

      when prepare =>
        if start_exec_i = '1' then
		      indx_running_n <= '1';
          st_sch_n <= seekCV;
          id0_n <= id0_offset;
          id1_n <= id1_offset;
          id2_n <= id2_offset;
        end if;

      when seekCV =>
        if alloc_CV_indx /= N_CU then
          st_sch_n <= allocateWFs;
          req_n(alloc_CV_indx) <= '1';
          schedulingInProgress_n(alloc_CV_indx) <= '1';
          -- rtm_we_dx(alloc_CV_indx) <= '1';
          if nDisp_wg_d0 = n_wg_d0_m1 then
            nDisp_wg_d0_ov_n <= '1';
          else
            nDisp_wg_d0_ov_n <= '0';
          end if;
        end if;

      when allocateWFs =>
        st_sch_n <= checkAgain;
        -- rtm_we_dx(alloc_CV_indx_ltchd) <= '1';
        nDisp_wg_d1_ov_n <= '0';
        if nDisp_wg_d0_ov = '1' and nDisp_wg_d1 = n_wg_d1_m1 then
          nDisp_wg_d1_ov_n <= '1';
        end if;

      when checkAgain =>
        st_sch_n <= seekCV;
        -- rtm_we_dx(alloc_CV_indx_ltchd) <= '1';
        if nDisp_wg_d0_ov = '1' then
          nDisp_wg_d0_n  <= (others => '0');
          id0_n <= id0_offset;
          nDisp_wg_d1_n <= nDisp_wg_d1 + 1;
          id1_n <= id1 + WG_size_d1;
        else
          nDisp_wg_d0_n <= nDisp_wg_d0 + 1;
          id0_n <= id0 + wg_size_d0;
        end if;
        if nDisp_wg_d1_ov = '1' then
          nDisp_wg_d1_n  <= (others => '0');
          id1_n <= id1_offset;
          nDisp_wg_d2_n <= nDisp_wg_d2 + 1;
          id2_n <= id2 + WG_size_d2;
          if nDisp_wg_d2 = n_wg_d2_m1 then
            st_sch_n <= wait_wf_active;
          end if;
        end if;

      when wait_wf_active =>
        if schedulingInProgress = (schedulingInProgress'reverse_range => '0') then
          st_sch_n <= wait_finish;
        end if;

      when wait_finish =>
        finish_i <= '1';
        st_sch_n <= idle;
        for i in 0 to N_CU-1 loop
          if to_integer(unsigned(wf_active(i))) /= 0 then
            st_sch_n <= wait_finish;
            finish_i <= '0';
          end if;
        end loop;
    end case;

  end process;

  process(clk)
    variable tmp : integer range 0 to N_WF_CU := 0;
  begin
    if rising_edge(clk) then
      if nrst = '0' or finish_i = '1' then
        nDisp_wg_d0     <= (others => '0');
        nDisp_wg_d1     <= (others => '0');
        nDisp_wg_d2     <= (others => '0');
        nDisp_wg_d0_ov  <= '0';
        nDisp_wg_d1_ov  <= '0';
        req             <= (others => '0');
        cd_indx         <= (others => '0');
        wf_active_slctd <= (others => '0');
        cd_indx_d0      <= (others => '0');
        n_inactive_wfs  <= 0;
        cd_indx_d1      <= (others => '0');
        alloc_CV_indx   <= 0;
        schedulingInProgress <= (others => '0');
		    indx_running <= '0';
      else
        nDisp_wg_d0 <= nDisp_wg_d0_n;
        nDisp_wg_d1 <= nDisp_wg_d1_n;
        nDisp_wg_d2 <= nDisp_wg_d2_n;
        nDisp_wg_d0_ov <= nDisp_wg_d0_ov_n;
        nDisp_wg_d1_ov <= nDisp_wg_d1_ov_n;
        req <= req_n;
        schedulingInProgress <= schedulingInProgress_n;
		    indx_running <= indx_running_n;

        for i in 0 to N_CU-1 loop
          if ack(i) = '1' then
            schedulingInProgress(i) <= '0';
          end if;
        end loop;

        -- stage 0: update cd_indx
		--the WG index is running only when it's necessary
        if indx_running = '1' then
          if N_CU_W > 0 then
            cd_indx <= cd_indx+1;
          end if;
		end if;

        -- stage 1: extract the WF utilization mask of the (cd_index)-th CU
        wf_active_slctd <= wf_active(to_integer(cd_indx));
        cd_indx_d0 <= cd_indx;

        -- stage 2: compute the number of inactive WFs in the selected CU
        tmp := 0;
        for i in 0 to N_WF_CU-1 loop
          if wf_active_slctd(i) = '0' then
            tmp := tmp + 1;
          end if;
        end loop;
        n_inactive_wfs <= tmp;
        cd_indx_d1 <= cd_indx_d0;

        -- stage 3: update the alloc_CV_indx only if there are enough empty WFs and there is not a scheduling request already
        alloc_CV_indx <= N_CU;
        if n_inactive_wfs > to_integer(sch_rqst_n_WFs_m1_i) and schedulingInProgress(to_integer(cd_indx_d1)) = '0' then
          alloc_CV_indx <= to_integer(cd_indx_d1);
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        st_sch          <= idle;
        start_prepare   <= '0';
        id0             <= (others => '0'); -- NOT NEEDED
        id1             <= (others => '0'); -- NOT NEEDED
        id2             <= (others => '0'); -- NOT NEEDED
        prepare_params  <= '0'; -- NOT NEEDED
        krnl_indx_ltchd <= 0; -- NOT NEEDED
      else
        st_sch         <= st_sch_n;
        start_prepare  <= start_prepare_n;
        id0            <= id0_n;
        id1            <= id1_n;
        id2            <= id2_n;
        prepare_params <= prepare_params_n;

        if start = '1' and st_sch = idle then
          krnl_indx_ltchd <= krnl_indx;
        end if;
      end if;
    end if;
  end process;
  ------------------------------------------------------------------------------------------------}}}

  -- prepare FSM -------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      prepare_fin     <= prepare_fin_n;
      prepare_fin_d0  <= prepare_fin;
      start_loc_indcs <= prepare_fin and initialize_d0; -- start local index generation, after parameters loading, if the RTM memories must be initialized
      krnl_infos_we   <= '0';

      if nrst = '0' then
        st_prepare      <= (others => '0');
        st_prepare_d0   <= (others => '0');
        addr_first_inst <= (others => '0'); -- NOT NEEDED
        id0_size        <= (others => '0'); -- NOT NEEDED
        id1_size        <= (others => '0'); -- NOT NEEDED
        id2_size        <= (others => '0'); -- NOT NEEDED
        id0_offset      <= (others => '0'); -- NOT NEEDED
        id1_offset      <= (others => '0'); -- NOT NEEDED
        id2_offset      <= (others => '0'); -- NOT NEEDED
        wg_size_d0      <= 0; -- NOT NEEDED
        wg_size_d1      <= 0; -- NOT NEEDED
        wg_size_d2      <= 0; -- NOT NEEDED
        nDim            <= 0; -- NOT NEEDED
        n_wg_d0_m1      <= (others => '0'); -- NOT NEEDED
        n_wg_d1_m1      <= (others => '0'); -- NOT NEEDED
        n_wg_d2_m1      <= (others => '0'); -- NOT NEEDED
        wg_size         <= (others => '0'); -- NOT NEEDED
        params          <= (others => '0'); -- NOT NEEDED
        params_wrAddr   <= (others => '0'); -- NOT NEEDED
      else
        st_prepare    <= st_prepare_n;
        st_prepare_d0 <= st_prepare;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_N_WF then
          addr_first_inst <= unsigned(krnl_sch_rdData(ADDR_FIRST_INST_OFFSET+CRAM_ADDR_W-1 downto ADDR_FIRST_INST_OFFSET));
          -- addr_last_inst <= to_integer(unsigned(krnl_sch_rdData(ADDR_LAST_INST_OFFSET+CRAM_ADDR_W-1 downto ADDR_LAST_INST_OFFSET)));
          sch_rqst_n_WFs_m1_i <= unsigned(krnl_sch_rdData(N_WF_OFFSET+N_WF_CU_W-1 downto N_WF_OFFSET));
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_ID0_SIZE then
          id0_size   <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          krnl_infos_we <= '1';
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_ID1_SIZE then
          id1_size   <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          krnl_infos_we <= '1';
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_ID2_SIZE then
          id2_size   <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          krnl_infos_we <= '1';
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_ID0_OFFSET then
          id0_offset   <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_ID1_OFFSET then
          id1_offset   <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_ID2_OFFSET then
          id2_offset   <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_WG_SIZE then
          krnl_infos_we <= '1';
          wg_size_d0 <= to_integer(unsigned(krnl_sch_rdData(WG_SIZE_0_OFFSET+WG_SIZE_W downto WG_SIZE_0_OFFSET))); --WG_SIZE_W+1 bits are assigned
          if to_integer(unsigned(krnl_sch_rdData(N_DIM_OFFSET+1 downto N_DIM_OFFSET)))  /=0 then -- compare with nDim
            wg_size_d1 <= to_integer(unsigned(krnl_sch_rdData(WG_SIZE_1_OFFSET+WG_SIZE_W downto WG_SIZE_1_OFFSET)));
          else
            wg_size_d1 <= 1;
          end if;
          if to_integer(unsigned(krnl_sch_rdData(N_DIM_OFFSET+1 downto N_DIM_OFFSET))) = 2 then -- compare with nDim
            wg_size_d2 <= to_integer(unsigned(krnl_sch_rdData(WG_SIZE_2_OFFSET+WG_SIZE_W downto WG_SIZE_2_OFFSET)));
          else
            wg_size_d2 <= 1;
          end if;
          nDim <= to_integer(unsigned(krnl_sch_rdData(N_DIM_OFFSET+1 downto N_DIM_OFFSET)));
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_N_WG_0 then
          n_wg_d0_m1 <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          krnl_infos_we <= '1';
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_N_WG_1 then
          krnl_infos_we <= '1';
          if nDim /= 0 then
            n_wg_d1_m1 <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          else
            n_wg_d1_m1 <= (others => '0');
          end if;
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_N_WG_2 then
          krnl_infos_we <= '1';
          if nDim = 2 then
            n_wg_d2_m1 <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          else
            n_wg_d2_m1 <= (others => '0');
          end if;
        end if;

        if to_integer(st_prepare_d0) = NEW_KRNL_DESC_N_PARAMS then
          nParams <= to_integer(unsigned(krnl_sch_rdData(N_PARAMS_OFFSET+N_PARAMS_W-1 downto N_PARAMS_OFFSET)));
          wg_size <= unsigned(krnl_sch_rdData(WG_SIZE_OFFSET+WG_SIZE_W downto WG_SIZE_OFFSET));
        end if;

        if to_integer(st_prepare_d0) >= PARAMS_OFFSET then
          params <= unsigned(krnl_sch_rdData(DATA_W-1 downto 0));
          krnl_infos_we <= '1';
          params_wrAddr <= st_prepare_d0(N_PARAMS_W-1 downto 0);
        end if;
      end if;
    end if;
  end process;

  process(st_prepare, start_prepare, nParams, prepare_params)
  begin
    st_prepare_n <= st_prepare;
    prepare_fin_n <= '0';
    case to_integer(st_prepare) is
      when 0 =>
        if start_prepare = '1' then
          if prepare_params = '0' then
            st_prepare_n <= st_prepare + 1;
          else
            st_prepare_n <= (st_prepare_n'high => '1', others => '0');
          end if;
        end if;
      when others =>
        st_prepare_n <= st_prepare + 1;
        if st_prepare = (2**(NEW_KRNL_DESC_W-1))+nParams-1 then
          prepare_fin_n <= '1';
          st_prepare_n <= (others => '0');
        else
        end if;
    end case;
  end process;

  krnl_sch_rdAddr(KRNL_SCH_ADDR_W-1 downto NEW_KRNL_DESC_W) <= std_logic_vector(to_unsigned(krnl_indx_ltchd, NEW_KRNL_INDX_W));

  krnl_sch_rdAddr(NEW_KRNL_DESC_W-1 downto 0) <= std_logic_vector(st_prepare_n);
  --------------------------------------------------------------------------------------------------}}}

  -- init alu enable -------------------------------------------------------------------------------------------{{{
  init_alu_enable: init_alu_en_ram generic map(
    N_RD_PORTS => N_CU
  ) port map (
    start             => start_loc_indcs,
    finish            => alu_en_rdy,
    clear_finish      => start_exec_i,
    wg_size           => wg_size,
    sch_rqst_n_WFs_m1 => sch_rqst_n_WFs_m1_i,
    rdData_alu_en     => rdData_alu_en,
    rdAddr_alu_en     => rdAddr_alu_en,
    clk               => clk,
    nrst              => nrst
  );
  ---------------------------------------------------------------------------------------------------------}}}

end Behavioral;
