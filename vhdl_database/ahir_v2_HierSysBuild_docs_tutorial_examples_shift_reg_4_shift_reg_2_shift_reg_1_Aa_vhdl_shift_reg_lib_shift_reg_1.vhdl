-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library shift_reg_lib;
use shift_reg_lib.shift_reg_1_global_package.all;
entity shift_reg_1_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    in_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data_pipe_read_data : in   std_logic_vector(31 downto 0);
    out_data_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data_pipe_write_data : out  std_logic_vector(31 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) ;
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic-- 
  );
  -- 
end entity shift_reg_1_daemon;
architecture shift_reg_1_daemon_arch of shift_reg_1_daemon is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal in_buffer_data_in, in_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal default_zero_sig: std_logic;
  signal in_buffer_write_req: std_logic;
  signal in_buffer_write_ack: std_logic;
  signal in_buffer_unload_req_symbol: Boolean;
  signal in_buffer_unload_ack_symbol: Boolean;
  signal out_buffer_data_in, out_buffer_data_out: std_logic_vector((tag_length + 0)-1 downto 0);
  signal out_buffer_read_req: std_logic;
  signal out_buffer_read_ack: std_logic;
  signal out_buffer_write_req_symbol: Boolean;
  signal out_buffer_write_ack_symbol: Boolean;
  signal tag_ub_out, tag_ilock_out: std_logic_vector(tag_length-1 downto 0);
  signal tag_push_req, tag_push_ack, tag_pop_req, tag_pop_ack: std_logic;
  signal tag_unload_req_symbol, tag_unload_ack_symbol, tag_write_req_symbol, tag_write_ack_symbol: Boolean;
  signal tag_ilock_write_req_symbol, tag_ilock_write_ack_symbol, tag_ilock_read_req_symbol, tag_ilock_read_ack_symbol: Boolean;
  signal start_req_sig, fin_req_sig, start_ack_sig, fin_ack_sig: std_logic; 
  signal input_sample_reenable_symbol: Boolean;
  -- input port buffer signals
  -- output port buffer signals
  signal shift_reg_1_daemon_CP_3_start: Boolean;
  signal shift_reg_1_daemon_CP_3_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal RPIPE_in_data_10_inst_req_0 : boolean;
  signal RPIPE_in_data_10_inst_ack_0 : boolean;
  signal RPIPE_in_data_10_inst_req_1 : boolean;
  signal RPIPE_in_data_10_inst_ack_1 : boolean;
  signal WPIPE_out_data_12_inst_req_0 : boolean;
  signal WPIPE_out_data_12_inst_ack_0 : boolean;
  signal WPIPE_out_data_12_inst_req_1 : boolean;
  signal WPIPE_out_data_12_inst_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "shift_reg_1_daemon_input_buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      data_width => tag_length + 0) -- 
    port map(write_req => in_buffer_write_req, -- 
      write_ack => in_buffer_write_ack, 
      write_data => in_buffer_data_in,
      unload_req => in_buffer_unload_req_symbol, 
      unload_ack => in_buffer_unload_ack_symbol, 
      read_data => in_buffer_data_out,
      clk => clk, reset => reset); -- 
  in_buffer_data_in(tag_length-1 downto 0) <= tag_in;
  tag_ub_out <= in_buffer_data_out(tag_length-1 downto 0);
  in_buffer_write_req <= start_req;
  start_ack <= in_buffer_write_ack;
  in_buffer_unload_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 1,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 32) := "in_buffer_unload_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= in_buffer_unload_ack_symbol & input_sample_reenable_symbol;
    gj_in_buffer_unload_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  shift_reg_1_daemon_CP_3_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "shift_reg_1_daemon_out_buffer", -- 
      buffer_size => 1,
      full_rate => false,
      data_width => tag_length + 0) --
    port map(write_req => out_buffer_write_req_symbol, -- 
      write_ack => out_buffer_write_ack_symbol, 
      write_data => out_buffer_data_in,
      read_req => out_buffer_read_req, 
      read_ack => out_buffer_read_ack, 
      read_data => out_buffer_data_out,
      clk => clk, reset => reset); -- 
  out_buffer_data_in(tag_length-1 downto 0) <= tag_ilock_out;
  tag_out <= out_buffer_data_out(tag_length-1 downto 0);
  out_buffer_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 0);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 1,2 => 0);
    constant joinName: string(1 to 32) := "out_buffer_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= shift_reg_1_daemon_CP_3_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj_out_buffer_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => out_buffer_write_req_symbol, clk => clk, reset => reset); --
  end block;
  -- write-to output-buffer produces  reenable input sampling
  input_sample_reenable_symbol <= out_buffer_write_ack_symbol;
  -- fin-req/ack level protocol..
  out_buffer_read_req <= fin_req;
  fin_ack <= out_buffer_read_ack;
  ----- tag-queue --------------------------------------------------
  -- interlock buffer for TAG.. to provide required buffering.
  tagIlock: InterlockBuffer -- 
    generic map(name => "tag-interlock-buffer", -- 
      buffer_size => 1,
      bypass_flag => false,
      in_data_width => tag_length,
      out_data_width => tag_length) -- 
    port map(write_req => tag_ilock_write_req_symbol, -- 
      write_ack => tag_ilock_write_ack_symbol, 
      write_data => tag_ub_out,
      read_req => tag_ilock_read_req_symbol, 
      read_ack => tag_ilock_read_ack_symbol, 
      read_data => tag_ilock_out, 
      clk => clk, reset => reset); -- 
  -- tag ilock-buffer control logic. 
  tag_ilock_write_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 1) := (0 => 1,1 => 1);
    constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
    constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
    constant joinName: string(1 to 31) := "tag_ilock_write_req_symbol_join"; 
    signal preds: BooleanArray(1 to 2); -- 
  begin -- 
    preds <= shift_reg_1_daemon_CP_3_start & tag_ilock_write_ack_symbol;
    gj_tag_ilock_write_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 2, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= shift_reg_1_daemon_CP_3_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj_tag_ilock_read_req_symbol_join : generic_join generic map(name => joinName, number_of_predecessors => 3, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  shift_reg_1_daemon_CP_3: Block -- control-path 
    signal shift_reg_1_daemon_CP_3_elements: BooleanArray(6 downto 0);
    -- 
  begin -- 
    shift_reg_1_daemon_CP_3_elements(0) <= shift_reg_1_daemon_CP_3_start;
    shift_reg_1_daemon_CP_3_symbol <= shift_reg_1_daemon_CP_3_elements(1);
    -- CP-element group 0:  branch  transition  place  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	6 
    -- CP-element group 0:  members (7) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_7/$entry
      -- CP-element group 0: 	 branch_block_stmt_7/branch_block_stmt_7__entry__
      -- CP-element group 0: 	 branch_block_stmt_7/merge_stmt_8__entry__
      -- CP-element group 0: 	 branch_block_stmt_7/merge_stmt_8_dead_link/$entry
      -- CP-element group 0: 	 branch_block_stmt_7/merge_stmt_8__entry___PhiReq/$entry
      -- CP-element group 0: 	 branch_block_stmt_7/merge_stmt_8__entry___PhiReq/$exit
      -- 
    -- CP-element group 1:  transition  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: successors 
    -- CP-element group 1:  members (3) 
      -- CP-element group 1: 	 $exit
      -- CP-element group 1: 	 branch_block_stmt_7/$exit
      -- CP-element group 1: 	 branch_block_stmt_7/branch_block_stmt_7__exit__
      -- 
    shift_reg_1_daemon_CP_3_elements(1) <= false; 
    -- CP-element group 2:  transition  input  output  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	6 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	3 
    -- CP-element group 2:  members (6) 
      -- CP-element group 2: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Sample/$exit
      -- CP-element group 2: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Sample/ra
      -- CP-element group 2: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Update/$entry
      -- CP-element group 2: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Update/cr
      -- CP-element group 2: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_sample_completed_
      -- CP-element group 2: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_update_start_
      -- 
    ra_27_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 2_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_10_inst_ack_0, ack => shift_reg_1_daemon_CP_3_elements(2)); -- 
    cr_31_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " cr_31_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => shift_reg_1_daemon_CP_3_elements(2), ack => RPIPE_in_data_10_inst_req_1); -- 
    -- CP-element group 3:  transition  input  output  bypass 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	2 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (6) 
      -- CP-element group 3: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Update/$exit
      -- CP-element group 3: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Update/ca
      -- CP-element group 3: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_update_completed_
      -- CP-element group 3: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_sample_start_
      -- CP-element group 3: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Sample/$entry
      -- CP-element group 3: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Sample/req
      -- 
    ca_32_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 3_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_10_inst_ack_1, ack => shift_reg_1_daemon_CP_3_elements(3)); -- 
    req_40_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_40_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => shift_reg_1_daemon_CP_3_elements(3), ack => WPIPE_out_data_12_inst_req_0); -- 
    -- CP-element group 4:  transition  input  output  bypass 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	5 
    -- CP-element group 4:  members (6) 
      -- CP-element group 4: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_sample_completed_
      -- CP-element group 4: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_update_start_
      -- CP-element group 4: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Sample/$exit
      -- CP-element group 4: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Sample/ack
      -- CP-element group 4: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Update/$entry
      -- CP-element group 4: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Update/req
      -- 
    ack_41_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 4_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_12_inst_ack_0, ack => shift_reg_1_daemon_CP_3_elements(4)); -- 
    req_45_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " req_45_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => shift_reg_1_daemon_CP_3_elements(4), ack => WPIPE_out_data_12_inst_req_1); -- 
    -- CP-element group 5:  transition  place  input  bypass 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: 	4 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	6 
    -- CP-element group 5:  members (8) 
      -- CP-element group 5: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14__exit__
      -- CP-element group 5: 	 branch_block_stmt_7/loopback
      -- CP-element group 5: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/$exit
      -- CP-element group 5: 	 branch_block_stmt_7/loopback_PhiReq/$entry
      -- CP-element group 5: 	 branch_block_stmt_7/loopback_PhiReq/$exit
      -- CP-element group 5: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_update_completed_
      -- CP-element group 5: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Update/$exit
      -- CP-element group 5: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/WPIPE_out_data_12_Update/ack
      -- 
    ack_46_symbol_link_from_dp: control_delay_element -- 
      generic map(name => " 5_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_12_inst_ack_1, ack => shift_reg_1_daemon_CP_3_elements(5)); -- 
    -- CP-element group 6:  merge  transition  place  output  bypass 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: 	5 
    -- CP-element group 6: 	0 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	2 
    -- CP-element group 6:  members (10) 
      -- CP-element group 6: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Sample/$entry
      -- CP-element group 6: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_Sample/rr
      -- CP-element group 6: 	 branch_block_stmt_7/merge_stmt_8__exit__
      -- CP-element group 6: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14__entry__
      -- CP-element group 6: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/$entry
      -- CP-element group 6: 	 branch_block_stmt_7/assign_stmt_11_to_assign_stmt_14/RPIPE_in_data_10_sample_start_
      -- CP-element group 6: 	 branch_block_stmt_7/merge_stmt_8_PhiReqMerge
      -- CP-element group 6: 	 branch_block_stmt_7/merge_stmt_8_PhiAck/$entry
      -- CP-element group 6: 	 branch_block_stmt_7/merge_stmt_8_PhiAck/$exit
      -- CP-element group 6: 	 branch_block_stmt_7/merge_stmt_8_PhiAck/dummy
      -- 
    rr_26_symbol_link_to_dp: control_delay_element -- 
      generic map(name => " rr_26_symbol_delay",delay_value => 0)
      port map(clk => clk, reset => reset, req => shift_reg_1_daemon_CP_3_elements(6), ack => RPIPE_in_data_10_inst_req_0); -- 
    shift_reg_1_daemon_CP_3_elements(6) <= OrReduce(shift_reg_1_daemon_CP_3_elements(5) & shift_reg_1_daemon_CP_3_elements(0));
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal X_11 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    -- shared inport operator group (0) : RPIPE_in_data_10_inst 
    InportGroup_0: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 0 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      reqL_unguarded(0) <= RPIPE_in_data_10_inst_req_0;
      RPIPE_in_data_10_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= RPIPE_in_data_10_inst_req_1;
      RPIPE_in_data_10_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      X_11 <= data_out(31 downto 0);
      in_data_read_0_gI: SplitGuardInterface generic map(name => "in_data_read_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
        port map(clk => clk, reset => reset,
        sr_in => reqL_unguarded,
        sr_out => reqL,
        sa_in => ackL,
        sa_out => ackL_unguarded,
        cr_in => reqR_unguarded,
        cr_out => reqR,
        ca_in => ackR,
        ca_out => ackR_unguarded,
        guards => guard_vector); -- 
      in_data_read_0: InputPortRevised -- 
        generic map ( name => "in_data_read_0", data_width => 32,  num_reqs => 1,  output_buffering => outBUFs,   nonblocking_read_flag => False,  no_arbitration => false)
        port map (-- 
          sample_req => reqL , 
          sample_ack => ackL, 
          update_req => reqR, 
          update_ack => ackR, 
          data => data_out, 
          oreq => in_data_pipe_read_req(0),
          oack => in_data_pipe_read_ack(0),
          odata => in_data_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_out_data_12_inst 
    OutportGroup_0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 2);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data_12_inst_req_0;
      WPIPE_out_data_12_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data_12_inst_req_1;
      WPIPE_out_data_12_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  '1';
      data_in <= X_11;
      out_data_write_0_gI: SplitGuardInterface generic map(name => "out_data_write_0_gI", nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
        port map(clk => clk, reset => reset,
        sr_in => sample_req_unguarded,
        sr_out => sample_req,
        sa_in => sample_ack,
        sa_out => sample_ack_unguarded,
        cr_in => update_req_unguarded,
        cr_out => update_req,
        ca_in => update_ack,
        ca_out => update_ack_unguarded,
        guards => guard_vector); -- 
      out_data_write_0: OutputPortRevised -- 
        generic map ( name => "out_data", data_width => 32, num_reqs => 1, input_buffering => inBUFs, full_rate => false,
        no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data_pipe_write_req(0),
          oack => out_data_pipe_write_ack(0),
          odata => out_data_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end shift_reg_1_daemon_arch;
library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all;
library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.fixed_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.floatoperatorpackage.all;
use ahir.utilities.all;
library shift_reg_lib;
use shift_reg_lib.shift_reg_1_global_package.all;
entity shift_reg_1 is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    in_data_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    out_data_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture shift_reg_1_arch  of shift_reg_1 is -- system-architecture 
  -- declarations related to module shift_reg_1_daemon
  component shift_reg_1_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      in_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data_pipe_read_data : in   std_logic_vector(31 downto 0);
      out_data_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data_pipe_write_data : out  std_logic_vector(31 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) ;
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic-- 
    );
    -- 
  end component;
  -- argument signals for module shift_reg_1_daemon
  signal shift_reg_1_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal shift_reg_1_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal shift_reg_1_daemon_start_req : std_logic;
  signal shift_reg_1_daemon_start_ack : std_logic;
  signal shift_reg_1_daemon_fin_req   : std_logic;
  signal shift_reg_1_daemon_fin_ack : std_logic;
  -- aggregate signals for read from pipe in_data
  signal in_data_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data
  signal out_data_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data_pipe_write_ack: std_logic_vector(0 downto 0);
  -- gated clock signal declarations.
  -- 
begin -- 
  -- module shift_reg_1_daemon
  shift_reg_1_daemon_instance:shift_reg_1_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => shift_reg_1_daemon_start_req,
      start_ack => shift_reg_1_daemon_start_ack,
      fin_req => shift_reg_1_daemon_fin_req,
      fin_ack => shift_reg_1_daemon_fin_ack,
      clk => clk,
      reset => reset,
      in_data_pipe_read_req => in_data_pipe_read_req(0 downto 0),
      in_data_pipe_read_ack => in_data_pipe_read_ack(0 downto 0),
      in_data_pipe_read_data => in_data_pipe_read_data(31 downto 0),
      out_data_pipe_write_req => out_data_pipe_write_req(0 downto 0),
      out_data_pipe_write_ack => out_data_pipe_write_ack(0 downto 0),
      out_data_pipe_write_data => out_data_pipe_write_data(31 downto 0),
      tag_in => shift_reg_1_daemon_tag_in,
      tag_out => shift_reg_1_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  shift_reg_1_daemon_tag_in <= (others => '0');
  shift_reg_1_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => shift_reg_1_daemon_start_req, start_ack => shift_reg_1_daemon_start_ack,  fin_req => shift_reg_1_daemon_fin_req,  fin_ack => shift_reg_1_daemon_fin_ack);
  in_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => in_data_pipe_read_req,
      read_ack => in_data_pipe_read_ack,
      read_data => in_data_pipe_read_data,
      write_req => in_data_pipe_write_req,
      write_ack => in_data_pipe_write_ack,
      write_data => in_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      full_rate => false,
      shift_register_mode => false,
      bypass => false,
      depth => 0 --
    )
    port map( -- 
      read_req => out_data_pipe_read_req,
      read_ack => out_data_pipe_read_ack,
      read_data => out_data_pipe_read_data,
      write_req => out_data_pipe_write_req,
      write_ack => out_data_pipe_write_ack,
      write_data => out_data_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- gated clock generators 
  -- 
end shift_reg_1_arch;
