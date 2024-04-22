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
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity demux_daemon is -- 
  generic (tag_length : integer); 
  port ( -- 
    in_data_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data_pipe_read_data : in   std_logic_vector(31 downto 0);
    out_data_0_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data_0_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data_0_pipe_write_data : out  std_logic_vector(31 downto 0);
    out_data_1_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data_1_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data_1_pipe_write_data : out  std_logic_vector(31 downto 0);
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
end entity demux_daemon;
architecture demux_daemon_arch of demux_daemon is -- 
    component InputPortRevisedCheck is
     port (
          	sample_req : in std_logic_vector(1 downto 0);
          	sample_ack : out std_logic_vector(1 downto 0);
          	update_req : in std_logic_vector(1 downto 0);
          	update_ack : out std_logic_vector(1 downto 0);
          	data : out std_logic_vector(63 downto 0); 
          	oreq : out std_logic;
          	oack  : in std_logic;
          	odata  : in std_logic_vector(31 downto 0);
          	clk, reset : in std_logic
          );
  end component InputPortRevisedCheck;
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
  signal demux_daemon_CP_0_start: Boolean;
  signal demux_daemon_CP_0_symbol: Boolean;
  -- volatile/operator module components. 
  -- links between control-path and data-path
  signal RPIPE_in_data_9_inst_req_0 : boolean;
  signal RPIPE_in_data_9_inst_ack_0 : boolean;
  signal RPIPE_in_data_9_inst_req_1 : boolean;
  signal RPIPE_in_data_9_inst_ack_1 : boolean;
  signal do_while_stmt_6_branch_req_0 : boolean;
  signal RPIPE_in_data_18_inst_req_0 : boolean;
  signal RPIPE_in_data_18_inst_ack_0 : boolean;
  signal BITSEL_u32_u1_14_inst_req_0 : boolean;
  signal BITSEL_u32_u1_14_inst_ack_0 : boolean;
  signal BITSEL_u32_u1_14_inst_req_1 : boolean;
  signal BITSEL_u32_u1_14_inst_ack_1 : boolean;
  signal RPIPE_in_data_18_inst_req_1 : boolean;
  signal RPIPE_in_data_18_inst_ack_1 : boolean;
  signal W_u_21_delayed_1_20_inst_req_0 : boolean;
  signal W_u_21_delayed_1_20_inst_ack_0 : boolean;
  signal W_u_21_delayed_1_20_inst_req_1 : boolean;
  signal W_u_21_delayed_1_20_inst_ack_1 : boolean;
  signal WPIPE_out_data_1_23_inst_req_0 : boolean;
  signal WPIPE_out_data_1_23_inst_ack_0 : boolean;
  signal WPIPE_out_data_1_23_inst_req_1 : boolean;
  signal WPIPE_out_data_1_23_inst_ack_1 : boolean;
  signal W_u_25_delayed_1_27_inst_req_0 : boolean;
  signal W_u_25_delayed_1_27_inst_ack_0 : boolean;
  signal W_u_25_delayed_1_27_inst_req_1 : boolean;
  signal W_u_25_delayed_1_27_inst_ack_1 : boolean;
  signal WPIPE_out_data_0_30_inst_req_0 : boolean;
  signal WPIPE_out_data_0_30_inst_ack_0 : boolean;
  signal WPIPE_out_data_0_30_inst_req_1 : boolean;
  signal WPIPE_out_data_0_30_inst_ack_1 : boolean;
  signal do_while_stmt_6_branch_ack_0 : boolean;
  signal do_while_stmt_6_branch_ack_1 : boolean;
  -- 
begin --  
  -- input handling ------------------------------------------------
  in_buffer: UnloadBuffer -- 
    generic map(name => "demux_daemon_input_buffer", -- 
      buffer_size => 1,
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
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => in_buffer_unload_req_symbol, clk => clk, reset => reset); --
  end block;
  -- join of all unload_ack_symbols.. used to trigger CP.
  demux_daemon_CP_0_start <= in_buffer_unload_ack_symbol;
  -- output handling  -------------------------------------------------------
  out_buffer: ReceiveBuffer -- 
    generic map(name => "demux_daemon_out_buffer", -- 
      buffer_size => 1,
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
    preds <= demux_daemon_CP_0_symbol & out_buffer_write_ack_symbol & tag_ilock_read_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
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
    preds <= demux_daemon_CP_0_start & tag_ilock_write_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_write_req_symbol, clk => clk, reset => reset); --
  end block;
  tag_ilock_read_req_symbol_join: block -- 
    constant place_capacities: IntegerArray(0 to 2) := (0 => 1,1 => 1,2 => 1);
    constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
    constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
    constant joinName: string(1 to 30) := "tag_ilock_read_req_symbol_join"; 
    signal preds: BooleanArray(1 to 3); -- 
  begin -- 
    preds <= demux_daemon_CP_0_start & tag_ilock_read_ack_symbol & out_buffer_write_ack_symbol;
    gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
      port map(preds => preds, symbol_out => tag_ilock_read_req_symbol, clk => clk, reset => reset); --
  end block;
  -- the control path --------------------------------------------------
  always_true_symbol <= true; 
  default_zero_sig <= '0';
  demux_daemon_CP_0: Block -- control-path 
    signal demux_daemon_CP_0_elements: BooleanArray(48 downto 0);
    -- 
  begin -- 
    demux_daemon_CP_0_elements(0) <= demux_daemon_CP_0_start;
    demux_daemon_CP_0_symbol <= demux_daemon_CP_0_elements(48);
    -- CP-element group 0:  transition  bypass 
    -- CP-element group 0: predecessors 
    -- CP-element group 0: successors 
    -- CP-element group 0: 	1 
    -- CP-element group 0:  members (2) 
      -- CP-element group 0: 	 $entry
      -- CP-element group 0: 	 branch_block_stmt_5/$entry
      -- 
    -- CP-element group 1:  place  bypass 
    -- CP-element group 1: predecessors 
    -- CP-element group 1: 	0 
    -- CP-element group 1: successors 
    -- CP-element group 1: 	3 
    -- CP-element group 1:  members (2) 
      -- CP-element group 1: 	 branch_block_stmt_5/branch_block_stmt_5__entry__
      -- CP-element group 1: 	 branch_block_stmt_5/do_while_stmt_6__entry__
      -- 
    demux_daemon_CP_0_elements(1) <= demux_daemon_CP_0_elements(0);
    -- CP-element group 2:  place  bypass 
    -- CP-element group 2: predecessors 
    -- CP-element group 2: 	47 
    -- CP-element group 2: successors 
    -- CP-element group 2: 	48 
    -- CP-element group 2:  members (2) 
      -- CP-element group 2: 	 branch_block_stmt_5/branch_block_stmt_5__exit__
      -- CP-element group 2: 	 branch_block_stmt_5/do_while_stmt_6__exit__
      -- 
    demux_daemon_CP_0_elements(2) <= demux_daemon_CP_0_elements(47);
    -- CP-element group 3:  transition  bypass  pipeline-parent 
    -- CP-element group 3: predecessors 
    -- CP-element group 3: 	1 
    -- CP-element group 3: successors 
    -- CP-element group 3: 	4 
    -- CP-element group 3:  members (1) 
      -- CP-element group 3: 	 branch_block_stmt_5/do_while_stmt_6/$entry
      -- 
    demux_daemon_CP_0_elements(3) <= demux_daemon_CP_0_elements(1);
    -- CP-element group 4:  place  bypass  pipeline-parent 
    -- CP-element group 4: predecessors 
    -- CP-element group 4: 	3 
    -- CP-element group 4: successors 
    -- CP-element group 4: 	10 
    -- CP-element group 4:  members (1) 
      -- CP-element group 4: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6__entry__
      -- 
    demux_daemon_CP_0_elements(4) <= demux_daemon_CP_0_elements(3);
    -- CP-element group 5:  merge  place  bypass  pipeline-parent 
    -- CP-element group 5: predecessors 
    -- CP-element group 5: successors 
    -- CP-element group 5: 	47 
    -- CP-element group 5:  members (1) 
      -- CP-element group 5: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6__exit__
      -- 
    -- Element group demux_daemon_CP_0_elements(5) is bound as output of CP function.
    -- CP-element group 6:  merge  place  bypass  pipeline-parent 
    -- CP-element group 6: predecessors 
    -- CP-element group 6: successors 
    -- CP-element group 6: 	9 
    -- CP-element group 6:  members (1) 
      -- CP-element group 6: 	 branch_block_stmt_5/do_while_stmt_6/loop_back
      -- 
    -- Element group demux_daemon_CP_0_elements(6) is bound as output of CP function.
    -- CP-element group 7:  branch  place  bypass  pipeline-parent 
    -- CP-element group 7: predecessors 
    -- CP-element group 7: 	11 
    -- CP-element group 7: successors 
    -- CP-element group 7: 	43 
    -- CP-element group 7: 	45 
    -- CP-element group 7:  members (1) 
      -- CP-element group 7: 	 branch_block_stmt_5/do_while_stmt_6/condition_done
      -- 
    demux_daemon_CP_0_elements(7) <= demux_daemon_CP_0_elements(11);
    -- CP-element group 8:  branch  place  bypass  pipeline-parent 
    -- CP-element group 8: predecessors 
    -- CP-element group 8: 	42 
    -- CP-element group 8: successors 
    -- CP-element group 8:  members (1) 
      -- CP-element group 8: 	 branch_block_stmt_5/do_while_stmt_6/loop_body_done
      -- 
    demux_daemon_CP_0_elements(8) <= demux_daemon_CP_0_elements(42);
    -- CP-element group 9:  transition  bypass  pipeline-parent 
    -- CP-element group 9: predecessors 
    -- CP-element group 9: 	6 
    -- CP-element group 9: successors 
    -- CP-element group 9:  members (1) 
      -- CP-element group 9: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/back_edge_to_loop_body
      -- 
    demux_daemon_CP_0_elements(9) <= demux_daemon_CP_0_elements(6);
    -- CP-element group 10:  transition  bypass  pipeline-parent 
    -- CP-element group 10: predecessors 
    -- CP-element group 10: 	4 
    -- CP-element group 10: successors 
    -- CP-element group 10:  members (1) 
      -- CP-element group 10: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/first_time_through_loop_body
      -- 
    demux_daemon_CP_0_elements(10) <= demux_daemon_CP_0_elements(4);
    -- CP-element group 11:  fork  transition  output  bypass  pipeline-parent 
    -- CP-element group 11: predecessors 
    -- CP-element group 11: successors 
    -- CP-element group 11: 	7 
    -- CP-element group 11: 	12 
    -- CP-element group 11: 	34 
    -- CP-element group 11: 	25 
    -- CP-element group 11: 	17 
    -- CP-element group 11:  members (3) 
      -- CP-element group 11: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/$entry
      -- CP-element group 11: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/loop_body_start
      -- CP-element group 11: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/condition_evaluated
      -- 
    condition_evaluated_24_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(11), ack => do_while_stmt_6_branch_req_0); -- 
    -- Element group demux_daemon_CP_0_elements(11) is bound as output of CP function.
    -- CP-element group 12:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 12: predecessors 
    -- CP-element group 12: 	11 
    -- CP-element group 12: marked-predecessors 
    -- CP-element group 12: 	14 
    -- CP-element group 12: successors 
    -- CP-element group 12: 	14 
    -- CP-element group 12:  members (3) 
      -- CP-element group 12: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_sample_start_
      -- CP-element group 12: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Sample/rr
      -- CP-element group 12: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Sample/$entry
      -- 
    rr_33_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(12), ack => RPIPE_in_data_9_inst_req_0); -- 
    demux_daemon_cp_element_group_12: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_12"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(11) & demux_daemon_CP_0_elements(14);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(12), clk => clk, reset => reset); --
    end block;
    -- CP-element group 13:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 13: predecessors 
    -- CP-element group 13: 	14 
    -- CP-element group 13: marked-predecessors 
    -- CP-element group 13: 	18 
    -- CP-element group 13: 	23 
    -- CP-element group 13: successors 
    -- CP-element group 13: 	15 
    -- CP-element group 13:  members (3) 
      -- CP-element group 13: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Update/$entry
      -- CP-element group 13: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Update/cr
      -- CP-element group 13: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_update_start_
      -- 
    cr_38_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(13), ack => RPIPE_in_data_9_inst_req_1); -- 
    demux_daemon_cp_element_group_13: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 16,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_13"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(14) & demux_daemon_CP_0_elements(18) & demux_daemon_CP_0_elements(23);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(13), clk => clk, reset => reset); --
    end block;
    -- CP-element group 14:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 14: predecessors 
    -- CP-element group 14: 	12 
    -- CP-element group 14: successors 
    -- CP-element group 14: 	13 
    -- CP-element group 14: marked-successors 
    -- CP-element group 14: 	12 
    -- CP-element group 14:  members (3) 
      -- CP-element group 14: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Sample/ra
      -- CP-element group 14: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_sample_completed_
      -- CP-element group 14: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Sample/$exit
      -- 
    ra_34_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_9_inst_ack_0, ack => demux_daemon_CP_0_elements(14)); -- 
    -- CP-element group 15:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 15: predecessors 
    -- CP-element group 15: 	13 
    -- CP-element group 15: successors 
    -- CP-element group 15: 	20 
    -- CP-element group 15: 	16 
    -- CP-element group 15:  members (7) 
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Update/$exit
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_Update/ca
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_9_update_completed_
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_CMD_12_sample_start_
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_CMD_12_sample_completed_
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_CMD_12_update_start_
      -- CP-element group 15: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_CMD_12_update_completed_
      -- 
    ca_39_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_9_inst_ack_1, ack => demux_daemon_CP_0_elements(15)); -- 
    -- CP-element group 16:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 16: predecessors 
    -- CP-element group 16: 	15 
    -- CP-element group 16: marked-predecessors 
    -- CP-element group 16: 	18 
    -- CP-element group 16: successors 
    -- CP-element group 16: 	18 
    -- CP-element group 16:  members (3) 
      -- CP-element group 16: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_sample_start_
      -- CP-element group 16: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Sample/$entry
      -- CP-element group 16: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Sample/rr
      -- 
    rr_51_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(16), ack => BITSEL_u32_u1_14_inst_req_0); -- 
    demux_daemon_cp_element_group_16: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_16"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(15) & demux_daemon_CP_0_elements(18);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(16), clk => clk, reset => reset); --
    end block;
    -- CP-element group 17:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 17: predecessors 
    -- CP-element group 17: 	11 
    -- CP-element group 17: marked-predecessors 
    -- CP-element group 17: 	40 
    -- CP-element group 17: 	31 
    -- CP-element group 17: successors 
    -- CP-element group 17: 	19 
    -- CP-element group 17:  members (3) 
      -- CP-element group 17: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_update_start_
      -- CP-element group 17: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Update/$entry
      -- CP-element group 17: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Update/cr
      -- 
    cr_56_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(17), ack => BITSEL_u32_u1_14_inst_req_1); -- 
    demux_daemon_cp_element_group_17: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 16,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_17"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(11) & demux_daemon_CP_0_elements(40) & demux_daemon_CP_0_elements(31);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(17), clk => clk, reset => reset); --
    end block;
    -- CP-element group 18:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 18: predecessors 
    -- CP-element group 18: 	16 
    -- CP-element group 18: successors 
    -- CP-element group 18: marked-successors 
    -- CP-element group 18: 	13 
    -- CP-element group 18: 	16 
    -- CP-element group 18:  members (3) 
      -- CP-element group 18: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_sample_completed_
      -- CP-element group 18: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Sample/$exit
      -- CP-element group 18: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Sample/ra
      -- 
    ra_52_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => BITSEL_u32_u1_14_inst_ack_0, ack => demux_daemon_CP_0_elements(18)); -- 
    -- CP-element group 19:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 19: predecessors 
    -- CP-element group 19: 	17 
    -- CP-element group 19: successors 
    -- CP-element group 19: 	28 
    -- CP-element group 19: 	37 
    -- CP-element group 19:  members (11) 
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_update_completed_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Update/$exit
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/BITSEL_u32_u1_14_Update/ca
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_26_sample_start_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_26_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_26_update_start_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_26_update_completed_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_33_sample_start_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_33_sample_completed_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_33_update_start_
      -- CP-element group 19: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_send_to_1_33_update_completed_
      -- 
    ca_57_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => BITSEL_u32_u1_14_inst_ack_1, ack => demux_daemon_CP_0_elements(19)); -- 
    -- CP-element group 20:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 20: predecessors 
    -- CP-element group 20: 	15 
    -- CP-element group 20: marked-predecessors 
    -- CP-element group 20: 	22 
    -- CP-element group 20: successors 
    -- CP-element group 20: 	22 
    -- CP-element group 20:  members (3) 
      -- CP-element group 20: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_sample_start_
      -- CP-element group 20: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Sample/$entry
      -- CP-element group 20: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Sample/rr
      -- 
    rr_65_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(20), ack => RPIPE_in_data_18_inst_req_0); -- 
    demux_daemon_cp_element_group_20: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_20"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(15) & demux_daemon_CP_0_elements(22);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(20), clk => clk, reset => reset); --
    end block;
    -- CP-element group 21:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 21: predecessors 
    -- CP-element group 21: 	22 
    -- CP-element group 21: marked-predecessors 
    -- CP-element group 21: 	26 
    -- CP-element group 21: 	35 
    -- CP-element group 21: successors 
    -- CP-element group 21: 	23 
    -- CP-element group 21:  members (3) 
      -- CP-element group 21: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_update_start_
      -- CP-element group 21: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Update/$entry
      -- CP-element group 21: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Update/cr
      -- 
    cr_70_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(21), ack => RPIPE_in_data_18_inst_req_1); -- 
    demux_daemon_cp_element_group_21: block -- 
      constant place_capacities: IntegerArray(0 to 2) := (0 => 16,1 => 1,2 => 1);
      constant place_markings: IntegerArray(0 to 2)  := (0 => 0,1 => 1,2 => 1);
      constant place_delays: IntegerArray(0 to 2) := (0 => 0,1 => 0,2 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_21"; 
      signal preds: BooleanArray(1 to 3); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(22) & demux_daemon_CP_0_elements(26) & demux_daemon_CP_0_elements(35);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(21), clk => clk, reset => reset); --
    end block;
    -- CP-element group 22:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 22: predecessors 
    -- CP-element group 22: 	20 
    -- CP-element group 22: successors 
    -- CP-element group 22: 	21 
    -- CP-element group 22: marked-successors 
    -- CP-element group 22: 	20 
    -- CP-element group 22:  members (3) 
      -- CP-element group 22: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_sample_completed_
      -- CP-element group 22: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Sample/$exit
      -- CP-element group 22: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Sample/ra
      -- 
    ra_66_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_18_inst_ack_0, ack => demux_daemon_CP_0_elements(22)); -- 
    -- CP-element group 23:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 23: predecessors 
    -- CP-element group 23: 	21 
    -- CP-element group 23: successors 
    -- CP-element group 23: 	33 
    -- CP-element group 23: 	24 
    -- CP-element group 23: marked-successors 
    -- CP-element group 23: 	13 
    -- CP-element group 23:  members (11) 
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Update/$exit
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/RPIPE_in_data_18_Update/ca
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_sample_start_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_sample_completed_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_update_start_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_update_completed_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_28_sample_start_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_28_sample_completed_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_28_update_start_
      -- CP-element group 23: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_28_update_completed_
      -- 
    ca_71_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => RPIPE_in_data_18_inst_ack_1, ack => demux_daemon_CP_0_elements(23)); -- 
    -- CP-element group 24:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 24: predecessors 
    -- CP-element group 24: 	23 
    -- CP-element group 24: marked-predecessors 
    -- CP-element group 24: 	26 
    -- CP-element group 24: successors 
    -- CP-element group 24: 	26 
    -- CP-element group 24:  members (3) 
      -- CP-element group 24: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_sample_start_
      -- CP-element group 24: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Sample/$entry
      -- CP-element group 24: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Sample/req
      -- 
    req_83_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(24), ack => W_u_21_delayed_1_20_inst_req_0); -- 
    demux_daemon_cp_element_group_24: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_24"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(23) & demux_daemon_CP_0_elements(26);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(24), clk => clk, reset => reset); --
    end block;
    -- CP-element group 25:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 25: predecessors 
    -- CP-element group 25: 	11 
    -- CP-element group 25: marked-predecessors 
    -- CP-element group 25: 	31 
    -- CP-element group 25: successors 
    -- CP-element group 25: 	27 
    -- CP-element group 25:  members (3) 
      -- CP-element group 25: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_update_start_
      -- CP-element group 25: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Update/$entry
      -- CP-element group 25: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Update/req
      -- 
    req_88_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(25), ack => W_u_21_delayed_1_20_inst_req_1); -- 
    demux_daemon_cp_element_group_25: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_25"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(11) & demux_daemon_CP_0_elements(31);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(25), clk => clk, reset => reset); --
    end block;
    -- CP-element group 26:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 26: predecessors 
    -- CP-element group 26: 	24 
    -- CP-element group 26: successors 
    -- CP-element group 26: marked-successors 
    -- CP-element group 26: 	24 
    -- CP-element group 26: 	21 
    -- CP-element group 26:  members (3) 
      -- CP-element group 26: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_sample_completed_
      -- CP-element group 26: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Sample/$exit
      -- CP-element group 26: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Sample/ack
      -- 
    ack_84_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => W_u_21_delayed_1_20_inst_ack_0, ack => demux_daemon_CP_0_elements(26)); -- 
    -- CP-element group 27:  transition  input  bypass  pipeline-parent 
    -- CP-element group 27: predecessors 
    -- CP-element group 27: 	25 
    -- CP-element group 27: successors 
    -- CP-element group 27: 	28 
    -- CP-element group 27:  members (3) 
      -- CP-element group 27: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_update_completed_
      -- CP-element group 27: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Update/$exit
      -- CP-element group 27: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_22_Update/ack
      -- 
    ack_89_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => W_u_21_delayed_1_20_inst_ack_1, ack => demux_daemon_CP_0_elements(27)); -- 
    -- CP-element group 28:  join  transition  bypass  pipeline-parent 
    -- CP-element group 28: predecessors 
    -- CP-element group 28: 	19 
    -- CP-element group 28: 	27 
    -- CP-element group 28: successors 
    -- CP-element group 28: 	29 
    -- CP-element group 28:  members (4) 
      -- CP-element group 28: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_delayed_1_24_sample_start_
      -- CP-element group 28: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_delayed_1_24_sample_completed_
      -- CP-element group 28: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_delayed_1_24_update_start_
      -- CP-element group 28: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_21_delayed_1_24_update_completed_
      -- 
    demux_daemon_cp_element_group_28: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 16);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_28"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(19) & demux_daemon_CP_0_elements(27);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(28), clk => clk, reset => reset); --
    end block;
    -- CP-element group 29:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 29: predecessors 
    -- CP-element group 29: 	28 
    -- CP-element group 29: marked-predecessors 
    -- CP-element group 29: 	31 
    -- CP-element group 29: successors 
    -- CP-element group 29: 	31 
    -- CP-element group 29:  members (3) 
      -- CP-element group 29: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_sample_start_
      -- CP-element group 29: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Sample/$entry
      -- CP-element group 29: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Sample/req
      -- 
    req_105_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(29), ack => WPIPE_out_data_1_23_inst_req_0); -- 
    demux_daemon_cp_element_group_29: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_29"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(28) & demux_daemon_CP_0_elements(31);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(29), clk => clk, reset => reset); --
    end block;
    -- CP-element group 30:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 30: predecessors 
    -- CP-element group 30: 	31 
    -- CP-element group 30: marked-predecessors 
    -- CP-element group 30: 	32 
    -- CP-element group 30: successors 
    -- CP-element group 30: 	32 
    -- CP-element group 30:  members (3) 
      -- CP-element group 30: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_update_start_
      -- CP-element group 30: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Update/$entry
      -- CP-element group 30: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Update/req
      -- 
    req_110_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(30), ack => WPIPE_out_data_1_23_inst_req_1); -- 
    demux_daemon_cp_element_group_30: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_30"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(31) & demux_daemon_CP_0_elements(32);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(30), clk => clk, reset => reset); --
    end block;
    -- CP-element group 31:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 31: predecessors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: successors 
    -- CP-element group 31: 	30 
    -- CP-element group 31: marked-successors 
    -- CP-element group 31: 	29 
    -- CP-element group 31: 	25 
    -- CP-element group 31: 	17 
    -- CP-element group 31:  members (3) 
      -- CP-element group 31: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_sample_completed_
      -- CP-element group 31: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Sample/$exit
      -- CP-element group 31: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Sample/ack
      -- 
    ack_106_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_1_23_inst_ack_0, ack => demux_daemon_CP_0_elements(31)); -- 
    -- CP-element group 32:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 32: predecessors 
    -- CP-element group 32: 	30 
    -- CP-element group 32: successors 
    -- CP-element group 32: 	42 
    -- CP-element group 32: marked-successors 
    -- CP-element group 32: 	30 
    -- CP-element group 32:  members (3) 
      -- CP-element group 32: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_update_completed_
      -- CP-element group 32: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Update/$exit
      -- CP-element group 32: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_1_23_Update/ack
      -- 
    ack_111_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_1_23_inst_ack_1, ack => demux_daemon_CP_0_elements(32)); -- 
    -- CP-element group 33:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 33: predecessors 
    -- CP-element group 33: 	23 
    -- CP-element group 33: marked-predecessors 
    -- CP-element group 33: 	35 
    -- CP-element group 33: successors 
    -- CP-element group 33: 	35 
    -- CP-element group 33:  members (3) 
      -- CP-element group 33: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_sample_start_
      -- CP-element group 33: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Sample/$entry
      -- CP-element group 33: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Sample/req
      -- 
    req_123_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(33), ack => W_u_25_delayed_1_27_inst_req_0); -- 
    demux_daemon_cp_element_group_33: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_33"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(23) & demux_daemon_CP_0_elements(35);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(33), clk => clk, reset => reset); --
    end block;
    -- CP-element group 34:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 34: predecessors 
    -- CP-element group 34: 	11 
    -- CP-element group 34: marked-predecessors 
    -- CP-element group 34: 	40 
    -- CP-element group 34: successors 
    -- CP-element group 34: 	36 
    -- CP-element group 34:  members (3) 
      -- CP-element group 34: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_update_start_
      -- CP-element group 34: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Update/$entry
      -- CP-element group 34: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Update/req
      -- 
    req_128_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(34), ack => W_u_25_delayed_1_27_inst_req_1); -- 
    demux_daemon_cp_element_group_34: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_34"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(11) & demux_daemon_CP_0_elements(40);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(34), clk => clk, reset => reset); --
    end block;
    -- CP-element group 35:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 35: predecessors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: successors 
    -- CP-element group 35: marked-successors 
    -- CP-element group 35: 	33 
    -- CP-element group 35: 	21 
    -- CP-element group 35:  members (3) 
      -- CP-element group 35: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_sample_completed_
      -- CP-element group 35: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Sample/$exit
      -- CP-element group 35: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Sample/ack
      -- 
    ack_124_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => W_u_25_delayed_1_27_inst_ack_0, ack => demux_daemon_CP_0_elements(35)); -- 
    -- CP-element group 36:  transition  input  bypass  pipeline-parent 
    -- CP-element group 36: predecessors 
    -- CP-element group 36: 	34 
    -- CP-element group 36: successors 
    -- CP-element group 36: 	37 
    -- CP-element group 36:  members (3) 
      -- CP-element group 36: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_update_completed_
      -- CP-element group 36: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Update/$exit
      -- CP-element group 36: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/assign_stmt_29_Update/ack
      -- 
    ack_129_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => W_u_25_delayed_1_27_inst_ack_1, ack => demux_daemon_CP_0_elements(36)); -- 
    -- CP-element group 37:  join  transition  bypass  pipeline-parent 
    -- CP-element group 37: predecessors 
    -- CP-element group 37: 	36 
    -- CP-element group 37: 	19 
    -- CP-element group 37: successors 
    -- CP-element group 37: 	38 
    -- CP-element group 37:  members (4) 
      -- CP-element group 37: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_25_delayed_1_31_sample_start_
      -- CP-element group 37: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_25_delayed_1_31_sample_completed_
      -- CP-element group 37: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_25_delayed_1_31_update_start_
      -- CP-element group 37: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/R_u_25_delayed_1_31_update_completed_
      -- 
    demux_daemon_cp_element_group_37: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 16);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_37"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(36) & demux_daemon_CP_0_elements(19);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(37), clk => clk, reset => reset); --
    end block;
    -- CP-element group 38:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 38: predecessors 
    -- CP-element group 38: 	37 
    -- CP-element group 38: marked-predecessors 
    -- CP-element group 38: 	40 
    -- CP-element group 38: successors 
    -- CP-element group 38: 	40 
    -- CP-element group 38:  members (3) 
      -- CP-element group 38: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_sample_start_
      -- CP-element group 38: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Sample/$entry
      -- CP-element group 38: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Sample/req
      -- 
    req_145_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(38), ack => WPIPE_out_data_0_30_inst_req_0); -- 
    demux_daemon_cp_element_group_38: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 1);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_38"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(37) & demux_daemon_CP_0_elements(40);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(38), clk => clk, reset => reset); --
    end block;
    -- CP-element group 39:  join  transition  output  bypass  pipeline-parent 
    -- CP-element group 39: predecessors 
    -- CP-element group 39: 	40 
    -- CP-element group 39: marked-predecessors 
    -- CP-element group 39: 	41 
    -- CP-element group 39: successors 
    -- CP-element group 39: 	41 
    -- CP-element group 39:  members (3) 
      -- CP-element group 39: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_update_start_
      -- CP-element group 39: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Update/$entry
      -- CP-element group 39: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Update/req
      -- 
    req_150_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => demux_daemon_CP_0_elements(39), ack => WPIPE_out_data_0_30_inst_req_1); -- 
    demux_daemon_cp_element_group_39: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 1);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 1);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_39"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(40) & demux_daemon_CP_0_elements(41);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(39), clk => clk, reset => reset); --
    end block;
    -- CP-element group 40:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 40: predecessors 
    -- CP-element group 40: 	38 
    -- CP-element group 40: successors 
    -- CP-element group 40: 	39 
    -- CP-element group 40: marked-successors 
    -- CP-element group 40: 	34 
    -- CP-element group 40: 	38 
    -- CP-element group 40: 	17 
    -- CP-element group 40:  members (3) 
      -- CP-element group 40: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_sample_completed_
      -- CP-element group 40: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Sample/$exit
      -- CP-element group 40: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Sample/ack
      -- 
    ack_146_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_0_30_inst_ack_0, ack => demux_daemon_CP_0_elements(40)); -- 
    -- CP-element group 41:  fork  transition  input  bypass  pipeline-parent 
    -- CP-element group 41: predecessors 
    -- CP-element group 41: 	39 
    -- CP-element group 41: successors 
    -- CP-element group 41: 	42 
    -- CP-element group 41: marked-successors 
    -- CP-element group 41: 	39 
    -- CP-element group 41:  members (3) 
      -- CP-element group 41: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_update_completed_
      -- CP-element group 41: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Update/$exit
      -- CP-element group 41: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/WPIPE_out_data_0_30_Update/ack
      -- 
    ack_151_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => WPIPE_out_data_0_30_inst_ack_1, ack => demux_daemon_CP_0_elements(41)); -- 
    -- CP-element group 42:  join  transition  bypass  pipeline-parent 
    -- CP-element group 42: predecessors 
    -- CP-element group 42: 	41 
    -- CP-element group 42: 	32 
    -- CP-element group 42: successors 
    -- CP-element group 42: 	8 
    -- CP-element group 42:  members (1) 
      -- CP-element group 42: 	 branch_block_stmt_5/do_while_stmt_6/do_while_stmt_6_loop_body/$exit
      -- 
    demux_daemon_cp_element_group_42: block -- 
      constant place_capacities: IntegerArray(0 to 1) := (0 => 16,1 => 16);
      constant place_markings: IntegerArray(0 to 1)  := (0 => 0,1 => 0);
      constant place_delays: IntegerArray(0 to 1) := (0 => 0,1 => 0);
      constant joinName: string(1 to 32) := "demux_daemon_cp_element_group_42"; 
      signal preds: BooleanArray(1 to 2); -- 
    begin -- 
      preds <= demux_daemon_CP_0_elements(41) & demux_daemon_CP_0_elements(32);
      gj : generic_join generic map(name => joinName, place_capacities => place_capacities, place_markings => place_markings, place_delays => place_delays) -- 
        port map(preds => preds, symbol_out => demux_daemon_CP_0_elements(42), clk => clk, reset => reset); --
    end block;
    -- CP-element group 43:  transition  bypass  pipeline-parent 
    -- CP-element group 43: predecessors 
    -- CP-element group 43: 	7 
    -- CP-element group 43: successors 
    -- CP-element group 43: 	44 
    -- CP-element group 43:  members (1) 
      -- CP-element group 43: 	 branch_block_stmt_5/do_while_stmt_6/loop_exit/$entry
      -- 
    demux_daemon_CP_0_elements(43) <= demux_daemon_CP_0_elements(7);
    -- CP-element group 44:  transition  input  bypass  pipeline-parent 
    -- CP-element group 44: predecessors 
    -- CP-element group 44: 	43 
    -- CP-element group 44: successors 
    -- CP-element group 44:  members (2) 
      -- CP-element group 44: 	 branch_block_stmt_5/do_while_stmt_6/loop_exit/$exit
      -- CP-element group 44: 	 branch_block_stmt_5/do_while_stmt_6/loop_exit/ack
      -- 
    ack_155_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_6_branch_ack_0, ack => demux_daemon_CP_0_elements(44)); -- 
    -- CP-element group 45:  transition  bypass  pipeline-parent 
    -- CP-element group 45: predecessors 
    -- CP-element group 45: 	7 
    -- CP-element group 45: successors 
    -- CP-element group 45: 	46 
    -- CP-element group 45:  members (1) 
      -- CP-element group 45: 	 branch_block_stmt_5/do_while_stmt_6/loop_taken/$entry
      -- 
    demux_daemon_CP_0_elements(45) <= demux_daemon_CP_0_elements(7);
    -- CP-element group 46:  transition  input  bypass  pipeline-parent 
    -- CP-element group 46: predecessors 
    -- CP-element group 46: 	45 
    -- CP-element group 46: successors 
    -- CP-element group 46:  members (2) 
      -- CP-element group 46: 	 branch_block_stmt_5/do_while_stmt_6/loop_taken/$exit
      -- CP-element group 46: 	 branch_block_stmt_5/do_while_stmt_6/loop_taken/ack
      -- 
    ack_159_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_6_branch_ack_1, ack => demux_daemon_CP_0_elements(46)); -- 
    -- CP-element group 47:  transition  bypass  pipeline-parent 
    -- CP-element group 47: predecessors 
    -- CP-element group 47: 	5 
    -- CP-element group 47: successors 
    -- CP-element group 47: 	2 
    -- CP-element group 47:  members (1) 
      -- CP-element group 47: 	 branch_block_stmt_5/do_while_stmt_6/$exit
      -- 
    demux_daemon_CP_0_elements(47) <= demux_daemon_CP_0_elements(5);
    -- CP-element group 48:  transition  bypass 
    -- CP-element group 48: predecessors 
    -- CP-element group 48: 	2 
    -- CP-element group 48: successors 
    -- CP-element group 48:  members (2) 
      -- CP-element group 48: 	 $exit
      -- CP-element group 48: 	 branch_block_stmt_5/$exit
      -- 
    demux_daemon_CP_0_elements(48) <= demux_daemon_CP_0_elements(2);
    do_while_stmt_6_terminator_160: loop_terminator -- 
      generic map (max_iterations_in_flight =>16) 
      port map(loop_body_exit => demux_daemon_CP_0_elements(8),loop_continue => demux_daemon_CP_0_elements(46),loop_terminate => demux_daemon_CP_0_elements(44),loop_back => demux_daemon_CP_0_elements(6),loop_exit => demux_daemon_CP_0_elements(5),clk => clk, reset => reset); -- 
    entry_tmerge_25_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= demux_daemon_CP_0_elements(9);
        preds(1)  <= demux_daemon_CP_0_elements(10);
        entry_tmerge_25 : transition_merge -- 
          port map (preds => preds, symbol_out => demux_daemon_CP_0_elements(11));
          -- 
    end block;
    --  hookup: inputs to control-path 
    -- hookup: output from control-path 
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal CMD_10 : std_logic_vector(31 downto 0);
    signal konst_13_wire_constant : std_logic_vector(31 downto 0);
    signal konst_35_wire_constant : std_logic_vector(0 downto 0);
    signal send_to_1_16 : std_logic_vector(0 downto 0);
    signal u_19 : std_logic_vector(31 downto 0);
    signal u_21_delayed_1_22 : std_logic_vector(31 downto 0);
    signal u_25_delayed_1_29 : std_logic_vector(31 downto 0);
    -- 
  begin -- 
    konst_13_wire_constant <= "00000000000000000000000000000000";
    konst_35_wire_constant <= "1";
    W_u_21_delayed_1_20_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_u_21_delayed_1_20_inst_req_0;
      W_u_21_delayed_1_20_inst_ack_0<= wack(0);
      rreq(0) <= W_u_21_delayed_1_20_inst_req_1;
      W_u_21_delayed_1_20_inst_ack_1<= rack(0);
      W_u_21_delayed_1_20_inst : InterlockBuffer generic map ( -- 
        name => "W_u_21_delayed_1_20_inst",
        buffer_size => 1,
        flow_through =>  false ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => u_19,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => u_21_delayed_1_22,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    W_u_25_delayed_1_27_inst_block: block -- 
      signal wreq, wack, rreq, rack: BooleanArray(0 downto 0); 
      -- 
    begin -- 
      wreq(0) <= W_u_25_delayed_1_27_inst_req_0;
      W_u_25_delayed_1_27_inst_ack_0<= wack(0);
      rreq(0) <= W_u_25_delayed_1_27_inst_req_1;
      W_u_25_delayed_1_27_inst_ack_1<= rack(0);
      W_u_25_delayed_1_27_inst : InterlockBuffer generic map ( -- 
        name => "W_u_25_delayed_1_27_inst",
        buffer_size => 1,
        flow_through =>  false ,
        in_data_width => 32,
        out_data_width => 32,
        bypass_flag => true 
        -- 
      )port map ( -- 
        write_req => wreq(0), 
        write_ack => wack(0), 
        write_data => u_19,
        read_req => rreq(0),  
        read_ack => rack(0), 
        read_data => u_25_delayed_1_29,
        clk => clk, reset => reset
        -- 
      );
      end block; -- 
    do_while_stmt_6_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= konst_35_wire_constant;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_6_branch_req_0,
          ack0 => do_while_stmt_6_branch_ack_0,
          ack1 => do_while_stmt_6_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    -- shared split operator group (0) : BITSEL_u32_u1_14_inst 
    ApBitsel_group_0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant outBUFs : IntegerArray(0 downto 0) := (0 => 1);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => false);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      data_in <= CMD_10;
      send_to_1_16 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= BITSEL_u32_u1_14_inst_req_0;
      BITSEL_u32_u1_14_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= BITSEL_u32_u1_14_inst_req_1;
      BITSEL_u32_u1_14_inst_ack_1 <= ackR_unguarded(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => false) -- 
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
      UnsharedOperator: UnsharedOperatorWithBuffering -- 
        generic map ( -- 
          operator_id => "ApBitsel",
          name => "ApBitsel_group_0",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 32,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "00000000000000000000000000000000",
          constant_width => 32,
          buffering  => 1,
          flow_through => false,
          use_constant  => true
          --
        ) 
        port map ( -- 
          reqL => reqL(0),
          ackL => ackL(0),
          reqR => reqR(0),
          ackR => ackR(0),
          dataL => data_in, 
          dataR => data_out,
          clk => clk,
          reset => reset); -- 
      -- 
    end Block; -- split operator group 0
    -- shared inport operator group (0) : RPIPE_in_data_9_inst RPIPE_in_data_18_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(63 downto 0);
      signal reqL, ackL, reqR, ackR : BooleanArray( 1 downto 0);
      signal sr, sa, ur, ua : std_logic_vector( 1 downto 0);
      signal reqL_unguarded, ackL_unguarded : BooleanArray( 1 downto 0);
      signal reqR_unguarded, ackR_unguarded : BooleanArray( 1 downto 0);
      signal guard_vector : std_logic_vector( 1 downto 0);
      constant outBUFs : IntegerArray(1 downto 0) := (1 => 2, 0 => 2);
      constant guardFlags : BooleanArray(1 downto 0) := (0 => false, 1 => false);
      constant guardBuffering: IntegerArray(1 downto 0)  := (0 => 1, 1 => 1);
      -- 
    begin -- 
      sr <= To_SLV(reqL);
      ur <= To_SLV(reqR);
      ackL <= To_BooleanArray(sa);
      ackR <= To_BooleanArray(ua);

      reqL_unguarded(1) <= RPIPE_in_data_9_inst_req_0;
      reqL_unguarded(0) <= RPIPE_in_data_18_inst_req_0;
      RPIPE_in_data_9_inst_ack_0 <= ackL_unguarded(1);
      RPIPE_in_data_18_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(1) <= RPIPE_in_data_9_inst_req_1;
      reqR_unguarded(0) <= RPIPE_in_data_18_inst_req_1;
      RPIPE_in_data_9_inst_ack_1 <= ackR_unguarded(1);
      RPIPE_in_data_18_inst_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      guard_vector(1)  <=  '1';
      gI: SplitGuardInterface generic map(nreqs => 2, buffering => guardBuffering, use_guards => guardFlags,  sample_only => false,  update_only => true) -- 
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
      CMD_10 <= data_out(63 downto 32);
      u_19 <= data_out(31 downto 0);
      in_data_read_0: InputPortRevisedCheck -- 
        port map (-- 
          sample_req => sr , 
          sample_ack => sa , 
          update_req => ur, 
          update_ack => ua, 
          data => data_out, 
          oreq => in_data_pipe_read_req(0),
          oack => in_data_pipe_read_ack(0),
          odata => in_data_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    -- shared outport operator group (0) : WPIPE_out_data_0_30_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data_0_30_inst_req_0;
      WPIPE_out_data_0_30_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data_0_30_inst_req_1;
      WPIPE_out_data_0_30_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <=  not send_to_1_16(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      data_in <= u_25_delayed_1_29;
      out_data_0_write_0: OutputPortRevised -- 
        generic map ( name => "out_data_0", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data_0_pipe_write_req(0),
          oack => out_data_0_pipe_write_ack(0),
          odata => out_data_0_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- shared outport operator group (1) : WPIPE_out_data_1_23_inst 
    OutportGroup1: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal sample_req, sample_ack : BooleanArray( 0 downto 0);
      signal update_req, update_ack : BooleanArray( 0 downto 0);
      signal sample_req_unguarded, sample_ack_unguarded : BooleanArray( 0 downto 0);
      signal update_req_unguarded, update_ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant inBUFs : IntegerArray(0 downto 0) := (0 => 0);
      constant guardFlags : BooleanArray(0 downto 0) := (0 => true);
      constant guardBuffering: IntegerArray(0 downto 0)  := (0 => 1);
      -- 
    begin -- 
      sample_req_unguarded(0) <= WPIPE_out_data_1_23_inst_req_0;
      WPIPE_out_data_1_23_inst_ack_0 <= sample_ack_unguarded(0);
      update_req_unguarded(0) <= WPIPE_out_data_1_23_inst_req_1;
      WPIPE_out_data_1_23_inst_ack_1 <= update_ack_unguarded(0);
      guard_vector(0)  <= send_to_1_16(0);
      gI: SplitGuardInterface generic map(nreqs => 1, buffering => guardBuffering, use_guards => guardFlags,  sample_only => true,  update_only => false) -- 
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
      data_in <= u_21_delayed_1_22;
      out_data_1_write_1: OutputPortRevised -- 
        generic map ( name => "out_data_1", data_width => 32, num_reqs => 1, input_buffering => inBUFs, no_arbitration => false)
        port map (--
          sample_req => sample_req , 
          sample_ack => sample_ack , 
          update_req => update_req , 
          update_ack => update_ack , 
          data => data_in, 
          oreq => out_data_1_pipe_write_req(0),
          oack => out_data_1_pipe_write_ack(0),
          odata => out_data_1_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 1
    -- 
  end Block; -- data_path
  -- 
end demux_daemon_arch;
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
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    in_data_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data_pipe_write_ack : out std_logic_vector(0 downto 0);
    out_data_0_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data_0_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data_0_pipe_read_ack : out std_logic_vector(0 downto 0);
    out_data_1_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data_1_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data_1_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture ahir_system_arch  of ahir_system is -- system-architecture 
  -- declarations related to module demux_daemon
  component demux_daemon is -- 
    generic (tag_length : integer); 
    port ( -- 
      in_data_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data_pipe_read_data : in   std_logic_vector(31 downto 0);
      out_data_0_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data_0_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data_0_pipe_write_data : out  std_logic_vector(31 downto 0);
      out_data_1_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data_1_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data_1_pipe_write_data : out  std_logic_vector(31 downto 0);
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
  -- argument signals for module demux_daemon
  signal demux_daemon_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal demux_daemon_tag_out   : std_logic_vector(1 downto 0);
  signal demux_daemon_start_req : std_logic;
  signal demux_daemon_start_ack : std_logic;
  signal demux_daemon_fin_req   : std_logic;
  signal demux_daemon_fin_ack : std_logic;
  -- aggregate signals for read from pipe in_data
  signal in_data_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data_0
  signal out_data_0_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data_0_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data_0_pipe_write_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data_1
  signal out_data_1_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data_1_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data_1_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module demux_daemon
  demux_daemon_instance:demux_daemon-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => demux_daemon_start_req,
      start_ack => demux_daemon_start_ack,
      fin_req => demux_daemon_fin_req,
      fin_ack => demux_daemon_fin_ack,
      clk => clk,
      reset => reset,
      in_data_pipe_read_req => in_data_pipe_read_req(0 downto 0),
      in_data_pipe_read_ack => in_data_pipe_read_ack(0 downto 0),
      in_data_pipe_read_data => in_data_pipe_read_data(31 downto 0),
      out_data_0_pipe_write_req => out_data_0_pipe_write_req(0 downto 0),
      out_data_0_pipe_write_ack => out_data_0_pipe_write_ack(0 downto 0),
      out_data_0_pipe_write_data => out_data_0_pipe_write_data(31 downto 0),
      out_data_1_pipe_write_req => out_data_1_pipe_write_req(0 downto 0),
      out_data_1_pipe_write_ack => out_data_1_pipe_write_ack(0 downto 0),
      out_data_1_pipe_write_data => out_data_1_pipe_write_data(31 downto 0),
      tag_in => demux_daemon_tag_in,
      tag_out => demux_daemon_tag_out-- 
    ); -- 
  -- module will be run forever 
  demux_daemon_tag_in <= (others => '0');
  demux_daemon_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => demux_daemon_start_req, start_ack => demux_daemon_start_ack,  fin_req => demux_daemon_fin_req,  fin_ack => demux_daemon_fin_ack);
  in_data_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      shift_register_mode => false,
      depth => 1 --
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
  out_data_0_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data_0",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      shift_register_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data_0_pipe_read_req,
      read_ack => out_data_0_pipe_read_ack,
      read_data => out_data_0_pipe_read_data,
      write_req => out_data_0_pipe_write_req,
      write_ack => out_data_0_pipe_write_ack,
      write_data => out_data_0_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data_1_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data_1",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      shift_register_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data_1_pipe_read_req,
      read_ack => out_data_1_pipe_read_ack,
      read_data => out_data_1_pipe_read_data,
      write_req => out_data_1_pipe_write_req,
      write_ack => out_data_1_pipe_write_ack,
      write_data => out_data_1_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  -- 
end ahir_system_arch;
