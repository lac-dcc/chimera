-- VHDL produced by vc2vhdl from virtual circuit (vc) description 
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity vectorSum is -- 
  generic (tag_length : integer); 
  port ( -- 
    clk : in std_logic;
    reset : in std_logic;
    start_req : in std_logic;
    start_ack : out std_logic;
    fin_req : in std_logic;
    fin_ack   : out std_logic;
    memory_space_1_lr_req : out  std_logic_vector(0 downto 0);
    memory_space_1_lr_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_lr_addr : out  std_logic_vector(6 downto 0);
    memory_space_1_lr_tag :  out  std_logic_vector(3 downto 0);
    memory_space_1_lc_req : out  std_logic_vector(0 downto 0);
    memory_space_1_lc_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_lc_data : in   std_logic_vector(31 downto 0);
    memory_space_1_lc_tag :  in  std_logic_vector(0 downto 0);
    memory_space_2_lr_req : out  std_logic_vector(0 downto 0);
    memory_space_2_lr_ack : in   std_logic_vector(0 downto 0);
    memory_space_2_lr_addr : out  std_logic_vector(6 downto 0);
    memory_space_2_lr_tag :  out  std_logic_vector(3 downto 0);
    memory_space_2_lc_req : out  std_logic_vector(0 downto 0);
    memory_space_2_lc_ack : in   std_logic_vector(0 downto 0);
    memory_space_2_lc_data : in   std_logic_vector(31 downto 0);
    memory_space_2_lc_tag :  in  std_logic_vector(0 downto 0);
    memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
    memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_lr_addr : out  std_logic_vector(6 downto 0);
    memory_space_0_lr_tag :  out  std_logic_vector(3 downto 0);
    memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
    memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_lc_data : in   std_logic_vector(31 downto 0);
    memory_space_0_lc_tag :  in  std_logic_vector(0 downto 0);
    memory_space_1_sr_req : out  std_logic_vector(0 downto 0);
    memory_space_1_sr_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_sr_addr : out  std_logic_vector(6 downto 0);
    memory_space_1_sr_data : out  std_logic_vector(31 downto 0);
    memory_space_1_sr_tag :  out  std_logic_vector(3 downto 0);
    memory_space_1_sc_req : out  std_logic_vector(0 downto 0);
    memory_space_1_sc_ack : in   std_logic_vector(0 downto 0);
    memory_space_1_sc_tag :  in  std_logic_vector(0 downto 0);
    memory_space_2_sr_req : out  std_logic_vector(0 downto 0);
    memory_space_2_sr_ack : in   std_logic_vector(0 downto 0);
    memory_space_2_sr_addr : out  std_logic_vector(6 downto 0);
    memory_space_2_sr_data : out  std_logic_vector(31 downto 0);
    memory_space_2_sr_tag :  out  std_logic_vector(3 downto 0);
    memory_space_2_sc_req : out  std_logic_vector(0 downto 0);
    memory_space_2_sc_ack : in   std_logic_vector(0 downto 0);
    memory_space_2_sc_tag :  in  std_logic_vector(0 downto 0);
    memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
    memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_sr_addr : out  std_logic_vector(6 downto 0);
    memory_space_0_sr_data : out  std_logic_vector(31 downto 0);
    memory_space_0_sr_tag :  out  std_logic_vector(3 downto 0);
    memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
    memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
    memory_space_0_sc_tag :  in  std_logic_vector(0 downto 0);
    in_data_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
    in_data_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
    in_data_pipe_pipe_read_data : in   std_logic_vector(31 downto 0);
    out_data_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
    out_data_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
    out_data_pipe_pipe_write_data : out  std_logic_vector(31 downto 0);
    tag_in: in std_logic_vector(tag_length-1 downto 0);
    tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
  );
  -- 
end entity vectorSum;
architecture Default of vectorSum is -- 
  -- always true...
  signal always_true_symbol: Boolean;
  signal start_req_symbol: Boolean;
  signal start_ack_symbol: Boolean;
  signal fin_req_symbol: Boolean;
  signal fin_ack_symbol: Boolean;
  signal tag_push, tag_pop: std_logic; 
  signal start_ack_sig, fin_ack_sig: std_logic; 
  -- output port buffer signals
  signal vectorSum_CP_1292_start: Boolean;
  -- links between control-path and data-path
  signal phi_stmt_412_req_1 : boolean;
  signal array_obj_ref_363_offset_inst_req_0 : boolean;
  signal phi_stmt_355_req_0 : boolean;
  signal array_obj_ref_363_offset_inst_ack_0 : boolean;
  signal phi_stmt_355_req_1 : boolean;
  signal phi_stmt_335_req_1 : boolean;
  signal array_obj_ref_373_index_0_rename_ack_0 : boolean;
  signal ptr_deref_378_root_address_inst_req_0 : boolean;
  signal array_obj_ref_368_root_address_inst_ack_0 : boolean;
  signal phi_stmt_335_req_0 : boolean;
  signal phi_stmt_355_ack_0 : boolean;
  signal if_stmt_328_branch_ack_1 : boolean;
  signal ptr_deref_378_load_0_req_1 : boolean;
  signal addr_of_369_final_reg_ack_0 : boolean;
  signal array_obj_ref_368_index_0_resize_req_0 : boolean;
  signal ptr_deref_378_load_0_req_0 : boolean;
  signal array_obj_ref_363_index_0_rename_req_0 : boolean;
  signal type_cast_338_inst_req_0 : boolean;
  signal ptr_deref_378_base_resize_ack_0 : boolean;
  signal ptr_deref_378_root_address_inst_ack_0 : boolean;
  signal addr_of_374_final_reg_ack_0 : boolean;
  signal addr_of_369_final_reg_req_0 : boolean;
  signal array_obj_ref_373_root_address_inst_req_0 : boolean;
  signal ptr_deref_378_load_0_ack_1 : boolean;
  signal array_obj_ref_368_index_0_resize_ack_0 : boolean;
  signal ptr_deref_378_base_resize_req_0 : boolean;
  signal binary_326_inst_req_0 : boolean;
  signal array_obj_ref_363_index_0_rename_ack_0 : boolean;
  signal array_obj_ref_368_offset_inst_req_0 : boolean;
  signal array_obj_ref_363_root_address_inst_req_0 : boolean;
  signal array_obj_ref_363_root_address_inst_ack_0 : boolean;
  signal array_obj_ref_368_offset_inst_ack_0 : boolean;
  signal binary_326_inst_ack_0 : boolean;
  signal array_obj_ref_373_root_address_inst_ack_0 : boolean;
  signal if_stmt_328_branch_ack_0 : boolean;
  signal array_obj_ref_368_root_address_inst_req_0 : boolean;
  signal array_obj_ref_373_offset_inst_req_0 : boolean;
  signal array_obj_ref_373_offset_inst_ack_0 : boolean;
  signal binary_326_inst_req_1 : boolean;
  signal type_cast_358_inst_req_0 : boolean;
  signal binary_326_inst_ack_1 : boolean;
  signal type_cast_358_inst_ack_0 : boolean;
  signal addr_of_364_final_reg_req_0 : boolean;
  signal addr_of_364_final_reg_ack_0 : boolean;
  signal if_stmt_328_branch_req_0 : boolean;
  signal array_obj_ref_373_index_0_resize_req_0 : boolean;
  signal array_obj_ref_373_index_0_resize_ack_0 : boolean;
  signal ptr_deref_378_addr_0_req_0 : boolean;
  signal ptr_deref_378_addr_0_ack_0 : boolean;
  signal ptr_deref_378_load_0_ack_0 : boolean;
  signal ptr_deref_378_gather_scatter_req_0 : boolean;
  signal type_cast_338_inst_ack_0 : boolean;
  signal array_obj_ref_368_index_0_rename_req_0 : boolean;
  signal array_obj_ref_373_index_0_rename_req_0 : boolean;
  signal ptr_deref_378_gather_scatter_ack_0 : boolean;
  signal array_obj_ref_368_index_0_rename_ack_0 : boolean;
  signal array_obj_ref_363_index_0_resize_ack_0 : boolean;
  signal array_obj_ref_363_index_0_resize_req_0 : boolean;
  signal phi_stmt_347_ack_0 : boolean;
  signal phi_stmt_412_ack_0 : boolean;
  signal phi_stmt_335_ack_0 : boolean;
  signal phi_stmt_347_req_0 : boolean;
  signal array_obj_ref_297_index_0_resize_req_0 : boolean;
  signal array_obj_ref_297_index_0_resize_ack_0 : boolean;
  signal array_obj_ref_297_index_0_rename_req_0 : boolean;
  signal array_obj_ref_297_index_0_rename_ack_0 : boolean;
  signal array_obj_ref_297_offset_inst_req_0 : boolean;
  signal array_obj_ref_297_offset_inst_ack_0 : boolean;
  signal array_obj_ref_297_root_address_inst_req_0 : boolean;
  signal array_obj_ref_297_root_address_inst_ack_0 : boolean;
  signal addr_of_298_final_reg_req_0 : boolean;
  signal addr_of_298_final_reg_ack_0 : boolean;
  signal array_obj_ref_302_index_0_resize_req_0 : boolean;
  signal array_obj_ref_302_index_0_resize_ack_0 : boolean;
  signal array_obj_ref_302_index_0_rename_req_0 : boolean;
  signal array_obj_ref_302_index_0_rename_ack_0 : boolean;
  signal array_obj_ref_302_offset_inst_req_0 : boolean;
  signal array_obj_ref_302_offset_inst_ack_0 : boolean;
  signal array_obj_ref_302_root_address_inst_req_0 : boolean;
  signal array_obj_ref_302_root_address_inst_ack_0 : boolean;
  signal addr_of_303_final_reg_req_0 : boolean;
  signal addr_of_303_final_reg_ack_0 : boolean;
  signal simple_obj_ref_306_inst_req_0 : boolean;
  signal simple_obj_ref_306_inst_ack_0 : boolean;
  signal ptr_deref_309_base_resize_req_0 : boolean;
  signal ptr_deref_309_base_resize_ack_0 : boolean;
  signal ptr_deref_309_root_address_inst_req_0 : boolean;
  signal ptr_deref_309_root_address_inst_ack_0 : boolean;
  signal ptr_deref_309_addr_0_req_0 : boolean;
  signal ptr_deref_309_addr_0_ack_0 : boolean;
  signal ptr_deref_309_gather_scatter_req_0 : boolean;
  signal ptr_deref_309_gather_scatter_ack_0 : boolean;
  signal ptr_deref_309_store_0_req_0 : boolean;
  signal ptr_deref_309_store_0_ack_0 : boolean;
  signal ptr_deref_309_store_0_req_1 : boolean;
  signal ptr_deref_309_store_0_ack_1 : boolean;
  signal addr_of_374_final_reg_req_0 : boolean;
  signal ptr_deref_313_base_resize_req_0 : boolean;
  signal ptr_deref_313_base_resize_ack_0 : boolean;
  signal ptr_deref_313_root_address_inst_req_0 : boolean;
  signal ptr_deref_313_root_address_inst_ack_0 : boolean;
  signal ptr_deref_313_addr_0_req_0 : boolean;
  signal ptr_deref_313_addr_0_ack_0 : boolean;
  signal ptr_deref_313_gather_scatter_req_0 : boolean;
  signal ptr_deref_313_gather_scatter_ack_0 : boolean;
  signal ptr_deref_313_store_0_req_0 : boolean;
  signal ptr_deref_313_store_0_ack_0 : boolean;
  signal ptr_deref_313_store_0_req_1 : boolean;
  signal ptr_deref_313_store_0_ack_1 : boolean;
  signal binary_320_inst_req_0 : boolean;
  signal binary_320_inst_ack_0 : boolean;
  signal binary_320_inst_req_1 : boolean;
  signal binary_320_inst_ack_1 : boolean;
  signal phi_stmt_412_req_0 : boolean;
  signal type_cast_415_inst_ack_0 : boolean;
  signal ptr_deref_382_base_resize_req_0 : boolean;
  signal ptr_deref_382_base_resize_ack_0 : boolean;
  signal ptr_deref_382_root_address_inst_req_0 : boolean;
  signal ptr_deref_382_root_address_inst_ack_0 : boolean;
  signal ptr_deref_382_addr_0_req_0 : boolean;
  signal ptr_deref_382_addr_0_ack_0 : boolean;
  signal phi_stmt_287_ack_0 : boolean;
  signal ptr_deref_382_load_0_req_0 : boolean;
  signal ptr_deref_382_load_0_ack_0 : boolean;
  signal ptr_deref_382_load_0_req_1 : boolean;
  signal ptr_deref_382_load_0_ack_1 : boolean;
  signal ptr_deref_382_gather_scatter_req_0 : boolean;
  signal ptr_deref_382_gather_scatter_ack_0 : boolean;
  signal type_cast_415_inst_req_0 : boolean;
  signal phi_stmt_287_req_1 : boolean;
  signal type_cast_293_inst_ack_0 : boolean;
  signal type_cast_293_inst_req_0 : boolean;
  signal phi_stmt_287_req_0 : boolean;
  signal binary_387_inst_req_0 : boolean;
  signal binary_387_inst_ack_0 : boolean;
  signal binary_387_inst_req_1 : boolean;
  signal binary_387_inst_ack_1 : boolean;
  signal ptr_deref_390_base_resize_req_0 : boolean;
  signal ptr_deref_390_base_resize_ack_0 : boolean;
  signal ptr_deref_390_root_address_inst_req_0 : boolean;
  signal ptr_deref_390_root_address_inst_ack_0 : boolean;
  signal ptr_deref_390_addr_0_req_0 : boolean;
  signal ptr_deref_390_addr_0_ack_0 : boolean;
  signal ptr_deref_390_gather_scatter_req_0 : boolean;
  signal ptr_deref_390_gather_scatter_ack_0 : boolean;
  signal ptr_deref_390_store_0_req_0 : boolean;
  signal ptr_deref_390_store_0_ack_0 : boolean;
  signal ptr_deref_390_store_0_req_1 : boolean;
  signal ptr_deref_390_store_0_ack_1 : boolean;
  signal binary_397_inst_req_0 : boolean;
  signal binary_397_inst_ack_0 : boolean;
  signal binary_397_inst_req_1 : boolean;
  signal binary_397_inst_ack_1 : boolean;
  signal binary_403_inst_req_0 : boolean;
  signal binary_403_inst_ack_0 : boolean;
  signal binary_403_inst_req_1 : boolean;
  signal binary_403_inst_ack_1 : boolean;
  signal do_while_stmt_353_branch_req_0 : boolean;
  signal unary_407_inst_req_0 : boolean;
  signal unary_407_inst_ack_0 : boolean;
  signal unary_407_inst_req_1 : boolean;
  signal unary_407_inst_ack_1 : boolean;
  signal do_while_stmt_353_branch_ack_0 : boolean;
  signal do_while_stmt_353_branch_ack_1 : boolean;
  signal array_obj_ref_422_index_0_resize_req_0 : boolean;
  signal array_obj_ref_422_index_0_resize_ack_0 : boolean;
  signal array_obj_ref_422_index_0_rename_req_0 : boolean;
  signal array_obj_ref_422_index_0_rename_ack_0 : boolean;
  signal array_obj_ref_422_offset_inst_req_0 : boolean;
  signal array_obj_ref_422_offset_inst_ack_0 : boolean;
  signal array_obj_ref_422_root_address_inst_req_0 : boolean;
  signal array_obj_ref_422_root_address_inst_ack_0 : boolean;
  signal addr_of_423_final_reg_req_0 : boolean;
  signal addr_of_423_final_reg_ack_0 : boolean;
  signal ptr_deref_427_base_resize_req_0 : boolean;
  signal ptr_deref_427_base_resize_ack_0 : boolean;
  signal ptr_deref_427_root_address_inst_req_0 : boolean;
  signal ptr_deref_427_root_address_inst_ack_0 : boolean;
  signal ptr_deref_427_addr_0_req_0 : boolean;
  signal ptr_deref_427_addr_0_ack_0 : boolean;
  signal ptr_deref_427_load_0_req_0 : boolean;
  signal ptr_deref_427_load_0_ack_0 : boolean;
  signal ptr_deref_427_load_0_req_1 : boolean;
  signal ptr_deref_427_load_0_ack_1 : boolean;
  signal ptr_deref_427_gather_scatter_req_0 : boolean;
  signal ptr_deref_427_gather_scatter_ack_0 : boolean;
  signal simple_obj_ref_429_inst_req_0 : boolean;
  signal simple_obj_ref_429_inst_ack_0 : boolean;
  signal binary_436_inst_req_0 : boolean;
  signal binary_436_inst_ack_0 : boolean;
  signal binary_436_inst_req_1 : boolean;
  signal binary_436_inst_ack_1 : boolean;
  signal binary_442_inst_req_0 : boolean;
  signal binary_442_inst_ack_0 : boolean;
  signal binary_442_inst_req_1 : boolean;
  signal binary_442_inst_ack_1 : boolean;
  signal if_stmt_444_branch_req_0 : boolean;
  signal if_stmt_444_branch_ack_1 : boolean;
  signal if_stmt_444_branch_ack_0 : boolean;
  signal global_clock_cycle_count: integer := 0;
  -- 
begin --  
  ---------------------------------------------------------- 
  process(clk)  
  begin -- 
    if(clk'event and clk = '1') then -- 
      if(reset = '1') then -- 
        global_clock_cycle_count <= 0; --
      else -- 
        global_clock_cycle_count <= global_clock_cycle_count + 1; -- 
      end if; --
    end if; --
  end process;
  ---------------------------------------------------------- 
  -- output port buffering assignments
  -- level-to-pulse translation..
  l2pStart: level_to_pulse -- 
    generic map (forward_delay => 1, backward_delay => 1) 
    port map(clk => clk, reset =>reset, lreq => start_req, lack => start_ack_sig, preq => start_req_symbol, pack => start_ack_symbol); -- 
  start_ack <= start_ack_sig; 
  l2pFin: level_to_pulse -- 
    generic map (forward_delay => 1, backward_delay => 1) 
    port map(clk => clk, reset =>reset, lreq => fin_req, lack => fin_ack_sig, preq => fin_req_symbol, pack => fin_ack_symbol); -- 
  fin_ack <= fin_ack_sig; 
  tag_push <= '1' when start_req_symbol else '0'; 
  tag_pop  <= fin_req and fin_ack_sig ; 
  LogCPEvent(clk,reset,global_clock_cycle_count, start_req_symbol,"vectorSum start_req symbol");
  LogCPEvent(clk,reset,global_clock_cycle_count,  start_ack_symbol,"vectorSum start_ack symbol");
  LogCPEvent(clk,reset,global_clock_cycle_count,  fin_req_symbol,"vectorSum fin_req symbol");
  LogCPEvent(clk,reset,global_clock_cycle_count,  fin_ack_symbol,"vectorSum fin_ack symbol");
  tagQueue: QueueBase generic map(data_width => 2, queue_depth => 2 ) -- 
    port map(pop_req => tag_pop, pop_ack => open, 
    push_req => tag_push, push_ack => open, 
    data_out => tag_out, data_in => tag_in, 
    clk => clk, reset => reset); -- 
  -- the control path
  always_true_symbol <= true; 
  vectorSum_CP_1292: Block -- control-path 
    signal cp_elements: BooleanArray(295 downto 0);
    -- 
  begin -- 
    cp_elements(0) <= start_req_symbol;
    start_ack_symbol <= cp_elements(274);
    finAckJoin: join2 
    port map(pred0 => fin_req_symbol, pred1 =>cp_elements(274), symbol_out => fin_ack_symbol, clk => clk, reset => reset);
    -- CP-element group 0 transition  place  output  bypass 
    -- predecessors 
    -- successors 282 
    -- members (15) 
      -- 	$entry
      -- 	branch_block_stmt_282/$entry
      -- 	branch_block_stmt_282/branch_block_stmt_282__entry__
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_req
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/ack
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/req
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/$exit
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/$entry
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/$entry
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/$exit
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/$entry
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/$exit
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/$entry
      -- 	branch_block_stmt_282/bb_0_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/$exit
      -- 
    phi_stmt_287_req_2228_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(0), ack => phi_stmt_287_req_0); -- 
    -- CP-element group 1 transition  place  output  bypass 
    -- predecessors 22 
    -- successors 23 
    -- members (7) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304__exit__
      -- 	branch_block_stmt_282/assign_stmt_307__entry__
      -- 	branch_block_stmt_282/assign_stmt_307/$entry
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_trigger_
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_active_
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_complete/req
      -- 
    cp_elements(1) <= cp_elements(22);
    req_1425_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(1), ack => simple_obj_ref_306_inst_req_0); -- 
    -- CP-element group 2 branch  place  bypass 
    -- predecessors 56 
    -- successors 57 60 
    -- members (2) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327__exit__
      -- 	branch_block_stmt_282/if_stmt_328__entry__
      -- 
    cp_elements(2) <= cp_elements(56);
    -- CP-element group 3 merge  transition  place  output  bypass 
    -- predecessors 286 290 
    -- successors 281 
    -- members (7) 
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/$entry
      -- 	branch_block_stmt_282/merge_stmt_334__exit__
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/req
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/$entry
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/$entry
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/$entry
      -- 
    cp_elements(3) <= OrReduce(cp_elements(286) & cp_elements(290));
    req_2241_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(3), ack => type_cast_293_inst_req_0); -- 
    -- CP-element group 4 branch  place  bypass 
    -- predecessors 271 
    -- successors 272 275 
    -- members (2) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443__exit__
      -- 	branch_block_stmt_282/if_stmt_444__entry__
      -- 
    cp_elements(4) <= cp_elements(271);
    -- CP-element group 5 fork  transition  bypass 
    -- predecessors 284 
    -- successors 6 8 14 16 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/$entry
      -- 
    cp_elements(5) <= cp_elements(284);
    -- CP-element group 6 transition  bypass 
    -- predecessors 5 
    -- successors 7 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_trigger_
      -- 
    cp_elements(6) <= cp_elements(5);
    -- CP-element group 7 join  transition  output  bypass 
    -- predecessors 6 12 
    -- successors 13 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_active_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_complete/final_reg_req
      -- 
    cpelement_group_7 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(6);
      predecessors(1) <= cp_elements(12);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(7)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(7),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    final_reg_req_1372_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(7), ack => addr_of_298_final_reg_req_0); -- 
    -- CP-element group 8 transition  output  bypass 
    -- predecessors 5 
    -- successors 9 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_computed_0
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/simple_obj_ref_296_trigger_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/simple_obj_ref_296_active_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/simple_obj_ref_296_completed_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_resize_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_resize_0/index_resize_req
      -- 
    cp_elements(8) <= cp_elements(5);
    index_resize_req_1352_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(8), ack => array_obj_ref_297_index_0_resize_req_0); -- 
    -- CP-element group 9 transition  input  output  no-bypass 
    -- predecessors 8 
    -- successors 10 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_resized_0
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_resize_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_resize_0/index_resize_ack
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_scale_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_scale_0/scale_rename_req
      -- 
    index_resize_ack_1353_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_297_index_0_resize_ack_0, ack => cp_elements(9)); -- 
    scale_rename_req_1357_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(9), ack => array_obj_ref_297_index_0_rename_req_0); -- 
    -- CP-element group 10 transition  input  output  no-bypass 
    -- predecessors 9 
    -- successors 11 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_indices_scaled
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_scale_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_index_scale_0/scale_rename_ack
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_add_indices/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_add_indices/final_index_req
      -- 
    scale_rename_ack_1358_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_297_index_0_rename_ack_0, ack => cp_elements(10)); -- 
    final_index_req_1362_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(10), ack => array_obj_ref_297_offset_inst_req_0); -- 
    -- CP-element group 11 transition  input  output  no-bypass 
    -- predecessors 10 
    -- successors 12 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_offset_calculated
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_add_indices/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_add_indices/final_index_ack
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_base_plus_offset/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_base_plus_offset/sum_rename_req
      -- 
    final_index_ack_1363_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_297_offset_inst_ack_0, ack => cp_elements(11)); -- 
    sum_rename_req_1367_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(11), ack => array_obj_ref_297_root_address_inst_req_0); -- 
    -- CP-element group 12 transition  input  no-bypass 
    -- predecessors 11 
    -- successors 7 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_root_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_base_plus_offset/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_297_base_plus_offset/sum_rename_ack
      -- 
    sum_rename_ack_1368_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_297_root_address_inst_ack_0, ack => cp_elements(12)); -- 
    -- CP-element group 13 transition  input  no-bypass 
    -- predecessors 7 
    -- successors 22 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/assign_stmt_299_trigger_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/assign_stmt_299_active_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/assign_stmt_299_completed_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_completed_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_298_complete/final_reg_ack
      -- 
    final_reg_ack_1373_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => addr_of_298_final_reg_ack_0, ack => cp_elements(13)); -- 
    -- CP-element group 14 transition  bypass 
    -- predecessors 5 
    -- successors 15 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_trigger_
      -- 
    cp_elements(14) <= cp_elements(5);
    -- CP-element group 15 join  transition  output  bypass 
    -- predecessors 14 20 
    -- successors 21 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_active_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_complete/final_reg_req
      -- 
    cpelement_group_15 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(14);
      predecessors(1) <= cp_elements(20);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(15)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(15),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    final_reg_req_1411_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(15), ack => addr_of_303_final_reg_req_0); -- 
    -- CP-element group 16 transition  output  bypass 
    -- predecessors 5 
    -- successors 17 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_computed_0
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/simple_obj_ref_301_trigger_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/simple_obj_ref_301_active_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/simple_obj_ref_301_completed_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_resize_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_resize_0/index_resize_req
      -- 
    cp_elements(16) <= cp_elements(5);
    index_resize_req_1391_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(16), ack => array_obj_ref_302_index_0_resize_req_0); -- 
    -- CP-element group 17 transition  input  output  no-bypass 
    -- predecessors 16 
    -- successors 18 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_resized_0
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_resize_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_resize_0/index_resize_ack
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_scale_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_scale_0/scale_rename_req
      -- 
    index_resize_ack_1392_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_302_index_0_resize_ack_0, ack => cp_elements(17)); -- 
    scale_rename_req_1396_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(17), ack => array_obj_ref_302_index_0_rename_req_0); -- 
    -- CP-element group 18 transition  input  output  no-bypass 
    -- predecessors 17 
    -- successors 19 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_indices_scaled
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_scale_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_index_scale_0/scale_rename_ack
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_add_indices/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_add_indices/final_index_req
      -- 
    scale_rename_ack_1397_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_302_index_0_rename_ack_0, ack => cp_elements(18)); -- 
    final_index_req_1401_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(18), ack => array_obj_ref_302_offset_inst_req_0); -- 
    -- CP-element group 19 transition  input  output  no-bypass 
    -- predecessors 18 
    -- successors 20 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_offset_calculated
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_add_indices/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_add_indices/final_index_ack
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_base_plus_offset/$entry
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_base_plus_offset/sum_rename_req
      -- 
    final_index_ack_1402_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_302_offset_inst_ack_0, ack => cp_elements(19)); -- 
    sum_rename_req_1406_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(19), ack => array_obj_ref_302_root_address_inst_req_0); -- 
    -- CP-element group 20 transition  input  no-bypass 
    -- predecessors 19 
    -- successors 15 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_root_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_base_plus_offset/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/array_obj_ref_302_base_plus_offset/sum_rename_ack
      -- 
    sum_rename_ack_1407_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_302_root_address_inst_ack_0, ack => cp_elements(20)); -- 
    -- CP-element group 21 transition  input  no-bypass 
    -- predecessors 15 
    -- successors 22 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/assign_stmt_304_trigger_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/assign_stmt_304_active_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/assign_stmt_304_completed_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_completed_
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/addr_of_303_complete/final_reg_ack
      -- 
    final_reg_ack_1412_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => addr_of_303_final_reg_ack_0, ack => cp_elements(21)); -- 
    -- CP-element group 22 join  transition  bypass 
    -- predecessors 13 21 
    -- successors 1 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304/$exit
      -- 
    cpelement_group_22 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(13);
      predecessors(1) <= cp_elements(21);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(22)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(22),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 23 transition  place  input  no-bypass 
    -- predecessors 1 
    -- successors 24 
    -- members (9) 
      -- 	branch_block_stmt_282/assign_stmt_307__exit__
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327__entry__
      -- 	branch_block_stmt_282/assign_stmt_307/$exit
      -- 	branch_block_stmt_282/assign_stmt_307/assign_stmt_307_trigger_
      -- 	branch_block_stmt_282/assign_stmt_307/assign_stmt_307_active_
      -- 	branch_block_stmt_282/assign_stmt_307/assign_stmt_307_completed_
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_completed_
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_307/simple_obj_ref_306_complete/ack
      -- 
    ack_1426_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => simple_obj_ref_306_inst_ack_0, ack => cp_elements(23)); -- 
    -- CP-element group 24 fork  transition  bypass 
    -- predecessors 23 
    -- successors 27 25 34 43 50 47 36 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/$entry
      -- 
    cp_elements(24) <= cp_elements(23);
    -- CP-element group 25 transition  bypass 
    -- predecessors 24 
    -- successors 26 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_311_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_311_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_310_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_310_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_310_completed_
      -- 
    cp_elements(25) <= cp_elements(24);
    -- CP-element group 26 join  transition  output  bypass 
    -- predecessors 25 30 
    -- successors 31 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/split_req
      -- 
    cpelement_group_26 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(25);
      predecessors(1) <= cp_elements(30);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(26)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(26),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    split_req_1464_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(26), ack => ptr_deref_309_gather_scatter_req_0); -- 
    -- CP-element group 27 transition  output  bypass 
    -- predecessors 24 
    -- successors 28 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_308_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_308_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_308_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_addr_resize/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_addr_resize/base_resize_req
      -- 
    cp_elements(27) <= cp_elements(24);
    base_resize_req_1449_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(27), ack => ptr_deref_309_base_resize_req_0); -- 
    -- CP-element group 28 transition  input  output  no-bypass 
    -- predecessors 27 
    -- successors 29 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_address_resized
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_addr_resize/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_addr_resize/base_resize_ack
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_plus_offset/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_plus_offset/sum_rename_req
      -- 
    base_resize_ack_1450_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_309_base_resize_ack_0, ack => cp_elements(28)); -- 
    sum_rename_req_1454_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(28), ack => ptr_deref_309_root_address_inst_req_0); -- 
    -- CP-element group 29 transition  input  output  no-bypass 
    -- predecessors 28 
    -- successors 30 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_root_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_plus_offset/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_base_plus_offset/sum_rename_ack
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_word_addrgen/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_word_addrgen/root_register_req
      -- 
    sum_rename_ack_1455_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_309_root_address_inst_ack_0, ack => cp_elements(29)); -- 
    root_register_req_1459_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(29), ack => ptr_deref_309_addr_0_req_0); -- 
    -- CP-element group 30 transition  input  no-bypass 
    -- predecessors 29 
    -- successors 26 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_word_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_word_addrgen/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_word_addrgen/root_register_ack
      -- 
    root_register_ack_1460_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_309_addr_0_ack_0, ack => cp_elements(30)); -- 
    -- CP-element group 31 transition  input  output  no-bypass 
    -- predecessors 26 
    -- successors 32 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/split_ack
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/word_access/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/word_access/word_access_0/rr
      -- 
    split_ack_1465_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_309_gather_scatter_ack_0, ack => cp_elements(31)); -- 
    rr_1472_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(31), ack => ptr_deref_309_store_0_req_0); -- 
    -- CP-element group 32 transition  input  output  no-bypass 
    -- predecessors 31 
    -- successors 33 
    -- members (9) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/word_access/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_request/word_access/word_access_0/ra
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/word_access/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/word_access/word_access_0/cr
      -- 
    ra_1473_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_309_store_0_ack_0, ack => cp_elements(32)); -- 
    cr_1483_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(32), ack => ptr_deref_309_store_0_req_1); -- 
    -- CP-element group 33 transition  input  no-bypass 
    -- predecessors 32 
    -- successors 56 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_311_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/word_access/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_309_complete/word_access/word_access_0/ca
      -- 
    ca_1484_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_309_store_0_ack_1, ack => cp_elements(33)); -- 
    -- CP-element group 34 transition  bypass 
    -- predecessors 24 
    -- successors 35 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_315_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_315_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_314_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_314_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_314_completed_
      -- 
    cp_elements(34) <= cp_elements(24);
    -- CP-element group 35 join  transition  output  bypass 
    -- predecessors 39 34 
    -- successors 40 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/split_req
      -- 
    cpelement_group_35 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(39);
      predecessors(1) <= cp_elements(34);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(35)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(35),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    split_req_1519_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(35), ack => ptr_deref_313_gather_scatter_req_0); -- 
    -- CP-element group 36 transition  output  bypass 
    -- predecessors 24 
    -- successors 37 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_312_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_312_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_312_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_addr_resize/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_addr_resize/base_resize_req
      -- 
    cp_elements(36) <= cp_elements(24);
    base_resize_req_1504_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(36), ack => ptr_deref_313_base_resize_req_0); -- 
    -- CP-element group 37 transition  input  output  no-bypass 
    -- predecessors 36 
    -- successors 38 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_address_resized
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_addr_resize/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_addr_resize/base_resize_ack
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_plus_offset/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_plus_offset/sum_rename_req
      -- 
    base_resize_ack_1505_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_313_base_resize_ack_0, ack => cp_elements(37)); -- 
    sum_rename_req_1509_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(37), ack => ptr_deref_313_root_address_inst_req_0); -- 
    -- CP-element group 38 transition  input  output  no-bypass 
    -- predecessors 37 
    -- successors 39 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_root_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_plus_offset/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_base_plus_offset/sum_rename_ack
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_word_addrgen/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_word_addrgen/root_register_req
      -- 
    sum_rename_ack_1510_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_313_root_address_inst_ack_0, ack => cp_elements(38)); -- 
    root_register_req_1514_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(38), ack => ptr_deref_313_addr_0_req_0); -- 
    -- CP-element group 39 transition  input  no-bypass 
    -- predecessors 38 
    -- successors 35 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_word_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_word_addrgen/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_word_addrgen/root_register_ack
      -- 
    root_register_ack_1515_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_313_addr_0_ack_0, ack => cp_elements(39)); -- 
    -- CP-element group 40 transition  input  output  no-bypass 
    -- predecessors 35 
    -- successors 41 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/split_ack
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/word_access/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/word_access/word_access_0/rr
      -- 
    split_ack_1520_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_313_gather_scatter_ack_0, ack => cp_elements(40)); -- 
    rr_1527_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(40), ack => ptr_deref_313_store_0_req_0); -- 
    -- CP-element group 41 transition  input  output  no-bypass 
    -- predecessors 40 
    -- successors 42 
    -- members (9) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/word_access/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_request/word_access/word_access_0/ra
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/word_access/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/word_access/word_access_0/cr
      -- 
    ra_1528_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_313_store_0_ack_0, ack => cp_elements(41)); -- 
    cr_1538_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(41), ack => ptr_deref_313_store_0_req_1); -- 
    -- CP-element group 42 transition  input  no-bypass 
    -- predecessors 41 
    -- successors 56 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_315_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/word_access/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/ptr_deref_313_complete/word_access/word_access_0/ca
      -- 
    ca_1539_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_313_store_0_ack_1, ack => cp_elements(42)); -- 
    -- CP-element group 43 transition  bypass 
    -- predecessors 24 
    -- successors 56 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_active_
      -- 
    cp_elements(43) <= cp_elements(24);
    -- CP-element group 44 join  fork  transition  bypass 
    -- predecessors 48 49 
    -- successors 53 52 
    -- members (8) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_323_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_323_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_323_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_321_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_321_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_321_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_trigger_
      -- 
    cpelement_group_44 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(48);
      predecessors(1) <= cp_elements(49);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(44)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(44),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 45 transition  output  bypass 
    -- predecessors 47 
    -- successors 48 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_sample_start_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Sample/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Sample/rr
      -- 
    cp_elements(45) <= cp_elements(47);
    rr_1556_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(45), ack => binary_320_inst_req_0); -- 
    -- CP-element group 46 transition  output  bypass 
    -- predecessors 47 
    -- successors 49 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_update_start_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Update/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Update/cr
      -- 
    cp_elements(46) <= cp_elements(47);
    cr_1561_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(46), ack => binary_320_inst_req_1); -- 
    -- CP-element group 47 fork  transition  bypass 
    -- predecessors 24 
    -- successors 46 45 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_317_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_317_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/simple_obj_ref_317_completed_
      -- 
    cp_elements(47) <= cp_elements(24);
    -- CP-element group 48 transition  input  no-bypass 
    -- predecessors 45 
    -- successors 44 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_sample_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Sample/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Sample/ra
      -- 
    ra_1557_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_320_inst_ack_0, ack => cp_elements(48)); -- 
    -- CP-element group 49 transition  input  no-bypass 
    -- predecessors 46 
    -- successors 44 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_update_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Update/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_320_Update/ca
      -- 
    ca_1562_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_320_inst_ack_1, ack => cp_elements(49)); -- 
    -- CP-element group 50 transition  bypass 
    -- predecessors 24 
    -- successors 56 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_active_
      -- 
    cp_elements(50) <= cp_elements(24);
    -- CP-element group 51 join  transition  bypass 
    -- predecessors 55 54 
    -- successors 56 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_327_trigger_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_327_active_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/assign_stmt_327_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_completed_
      -- 
    cpelement_group_51 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(55);
      predecessors(1) <= cp_elements(54);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(51)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(51),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 52 transition  output  bypass 
    -- predecessors 44 
    -- successors 54 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Sample/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Sample/rr
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_sample_start_
      -- 
    cp_elements(52) <= cp_elements(44);
    rr_1579_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(52), ack => binary_326_inst_req_0); -- 
    -- CP-element group 53 transition  output  bypass 
    -- predecessors 44 
    -- successors 55 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_update_start_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Update/$entry
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Update/cr
      -- 
    cp_elements(53) <= cp_elements(44);
    cr_1584_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(53), ack => binary_326_inst_req_1); -- 
    -- CP-element group 54 transition  input  no-bypass 
    -- predecessors 52 
    -- successors 51 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Sample/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Sample/ra
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_sample_completed_
      -- 
    ra_1580_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_326_inst_ack_0, ack => cp_elements(54)); -- 
    -- CP-element group 55 transition  input  no-bypass 
    -- predecessors 53 
    -- successors 51 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_update_completed_
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Update/$exit
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/binary_326_Update/ca
      -- 
    ca_1585_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_326_inst_ack_1, ack => cp_elements(55)); -- 
    -- CP-element group 56 join  transition  bypass 
    -- predecessors 33 43 50 51 42 
    -- successors 2 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_311_to_assign_stmt_327/$exit
      -- 
    cpelement_group_56 : Block -- 
      signal predecessors: BooleanArray(4 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(33);
      predecessors(1) <= cp_elements(43);
      predecessors(2) <= cp_elements(50);
      predecessors(3) <= cp_elements(51);
      predecessors(4) <= cp_elements(42);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(56)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(56),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 57 transition  bypass 
    -- predecessors 2 
    -- successors 58 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_328_dead_link/$entry
      -- 
    cp_elements(57) <= cp_elements(2);
    -- CP-element group 58 transition  dead  bypass 
    -- predecessors 57 
    -- successors 59 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_328_dead_link/dead_transition
      -- 
    cp_elements(58) <= false;
    -- CP-element group 59 transition  place  bypass 
    -- predecessors 58 
    -- successors 285 
    -- members (4) 
      -- 	branch_block_stmt_282/if_stmt_328_dead_link/$exit
      -- 	branch_block_stmt_282/if_stmt_328__exit__
      -- 	branch_block_stmt_282/merge_stmt_334__entry__
      -- 	branch_block_stmt_282/merge_stmt_334_dead_link/$entry
      -- 
    cp_elements(59) <= cp_elements(58);
    -- CP-element group 60 transition  output  bypass 
    -- predecessors 2 
    -- successors 61 
    -- members (3) 
      -- 	branch_block_stmt_282/if_stmt_328_eval_test/$entry
      -- 	branch_block_stmt_282/if_stmt_328_eval_test/$exit
      -- 	branch_block_stmt_282/if_stmt_328_eval_test/branch_req
      -- 
    cp_elements(60) <= cp_elements(2);
    branch_req_1593_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(60), ack => if_stmt_328_branch_req_0); -- 
    -- CP-element group 61 branch  place  bypass 
    -- predecessors 60 
    -- successors 64 62 
    -- members (1) 
      -- 	branch_block_stmt_282/simple_obj_ref_329_place
      -- 
    cp_elements(61) <= cp_elements(60);
    -- CP-element group 62 transition  bypass 
    -- predecessors 61 
    -- successors 63 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_328_if_link/$entry
      -- 
    cp_elements(62) <= cp_elements(61);
    -- CP-element group 63 transition  place  input  output  no-bypass 
    -- predecessors 62 
    -- successors 291 
    -- members (20) 
      -- 	branch_block_stmt_282/merge_stmt_346_PhiReqMerge
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/phi_stmt_347/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_getDatax_xexitx_xpreheader
      -- 	branch_block_stmt_282/if_stmt_328_if_link/if_choice_transition
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/phi_stmt_347/phi_stmt_347_sources/$entry
      -- 	branch_block_stmt_282/merge_stmt_344_PhiReqMerge
      -- 	branch_block_stmt_282/if_stmt_328_if_link/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_getDatax_xexitx_xpreheader_PhiReq/$entry
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/phi_stmt_347/phi_stmt_347_sources/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_getDatax_xexitx_xpreheader_PhiReq/$exit
      -- 	branch_block_stmt_282/merge_stmt_344_PhiAck/$entry
      -- 	branch_block_stmt_282/merge_stmt_344_PhiAck/$exit
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/phi_stmt_347/phi_stmt_347_req
      -- 	branch_block_stmt_282/merge_stmt_344_PhiAck/dummy
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/$entry
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/$exit
      -- 	branch_block_stmt_282/merge_stmt_346_PhiAck/$entry
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit_PhiReq/phi_stmt_347/$entry
      -- 	branch_block_stmt_282/merge_stmt_344__exit__
      -- 	branch_block_stmt_282/getDatax_xexitx_xpreheader_getDatax_xexit
      -- 
    if_choice_transition_1598_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_328_branch_ack_1, ack => cp_elements(63)); -- 
    phi_stmt_347_req_2305_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(63), ack => phi_stmt_347_req_0); -- 
    -- CP-element group 64 transition  bypass 
    -- predecessors 61 
    -- successors 65 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_328_else_link/$entry
      -- 
    cp_elements(64) <= cp_elements(61);
    -- CP-element group 65 transition  place  input  output  no-bypass 
    -- predecessors 64 
    -- successors 287 
    -- members (8) 
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge
      -- 	branch_block_stmt_282/if_stmt_328_else_link/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/req
      -- 	branch_block_stmt_282/if_stmt_328_else_link/else_choice_transition
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/$entry
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/$entry
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/$entry
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/$entry
      -- 
    else_choice_transition_1602_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_328_branch_ack_0, ack => cp_elements(65)); -- 
    req_2265_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(65), ack => type_cast_338_inst_req_0); -- 
    -- CP-element group 66 merge  place  bypass 
    -- predecessors 
    -- successors 238 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353__exit__
      -- 
    -- Element group cp_elements(66) is bound as output of CP function.
    -- CP-element group 67 merge  place  bypass 
    -- predecessors 
    -- successors 70 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_back
      -- 
    -- Element group cp_elements(67) is bound as output of CP function.
    -- CP-element group 68 branch  place  bypass 
    -- predecessors 224 
    -- successors 234 236 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/condition_done
      -- 
    cp_elements(68) <= cp_elements(224);
    -- CP-element group 69 branch  place  bypass 
    -- predecessors 233 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_body_done
      -- 
    cp_elements(69) <= cp_elements(233);
    -- CP-element group 70 fork  transition  bypass 
    -- predecessors 67 
    -- successors 75 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/back_edge_to_loop_body
      -- 
    cp_elements(70) <= cp_elements(67);
    -- CP-element group 71 fork  transition  bypass 
    -- predecessors 291 
    -- successors 78 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/first_time_through_loop_body
      -- 
    cp_elements(71) <= cp_elements(291);
    -- CP-element group 72 join  fork  transition  bypass 
    -- predecessors 
    -- successors 175 106 88 87 84 124 213 223 202 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/loop_body_start
      -- 
    -- Element group cp_elements(72) is bound as output of CP function.
    -- CP-element group 73 join  transition  bypass 
    -- predecessors 
    -- successors 74 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_req_0_raw
      -- 
    -- Element group cp_elements(73) is bound as output of CP function.
    -- CP-element group 74 transition  output  bypass 
    -- predecessors 73 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_req_0
      -- 
    cp_elements(74) <= cp_elements(73);
    phi_stmt_355_req_0_1621_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(74), ack => phi_stmt_355_req_0); -- 
    -- CP-element group 75 fork  transition  bypass 
    -- predecessors 70 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_trigger_from_back_edge_to_loop_body
      -- 
    cp_elements(75) <= cp_elements(70);
    -- CP-element group 76 join  transition  bypass 
    -- predecessors 
    -- successors 77 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_req_1_raw
      -- 
    -- Element group cp_elements(76) is bound as output of CP function.
    -- CP-element group 77 transition  output  bypass 
    -- predecessors 76 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_req_1
      -- 
    cp_elements(77) <= cp_elements(76);
    phi_stmt_355_req_1_1624_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(77), ack => phi_stmt_355_req_1); -- 
    -- CP-element group 78 fork  transition  bypass 
    -- predecessors 71 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_trigger_from_first_time_through_loop_body
      -- 
    cp_elements(78) <= cp_elements(71);
    -- CP-element group 79 join  transition  bypass 
    -- predecessors 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_phi_sequencer_reqs_merged
      -- 
    -- Element group cp_elements(79) is bound as output of CP function.
    -- CP-element group 80 join  fork  transition  bypass 
    -- predecessors 
    -- successors 113 95 131 208 
    -- marked successors 87 83 
    -- members (3) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_phi_sequencer_done
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_completed_
      -- 
    -- Element group cp_elements(80) is bound as output of CP function.
    -- CP-element group 81 transition  input  no-bypass 
    -- predecessors 
    -- successors 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_ack
      -- 
    phi_stmt_355_ack_1628_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_355_ack_0, ack => cp_elements(81)); -- 
    -- CP-element group 82 join  fork  transition  bypass 
    -- predecessors 87 83 
    -- marked predecessors 126 90 108 205 
    -- successors 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_enable_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/phi_stmt_355_trigger_
      -- 
    cpelement_group_82 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      signal marked_predecessors: BooleanArray(3 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(87);
      predecessors(1) <= cp_elements(83);
      marked_predecessors(0) <= cp_elements(126);
      marked_predecessors(1) <= cp_elements(90);
      marked_predecessors(2) <= cp_elements(108);
      marked_predecessors(3) <= cp_elements(205);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(82)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(82),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 83 join  transition  bypass 
    -- predecessors 86 
    -- marked predecessors 80 
    -- successors 82 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_completed_
      -- 
    cpelement_group_83 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(86);
      marked_predecessors(0) <= cp_elements(80);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(83)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(83),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 84 join  transition  no-bypass 
    -- predecessors 72 
    -- marked predecessors 203 
    -- successors 85 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_357_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_357_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_357_completed_
      -- 
    cpelement_group_84 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(72);
      marked_predecessors(0) <= cp_elements(203);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(84)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(84),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 85 transition  output  bypass 
    -- predecessors 84 
    -- successors 86 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_complete/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_complete/req
      -- 
    cp_elements(85) <= cp_elements(84);
    req_1644_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(85), ack => type_cast_358_inst_req_0); -- 
    -- CP-element group 86 transition  input  no-bypass 
    -- predecessors 85 
    -- successors 83 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_complete/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/type_cast_358_complete/ack
      -- 
    ack_1645_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_358_inst_ack_0, ack => cp_elements(86)); -- 
    -- CP-element group 87 join  transition  no-bypass 
    -- predecessors 72 
    -- marked predecessors 80 
    -- successors 82 
    -- members (3) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_359_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_359_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_359_completed_
      -- 
    cpelement_group_87 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(72);
      marked_predecessors(0) <= cp_elements(80);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(87)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(87),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 88 transition  bypass 
    -- predecessors 72 
    -- successors 89 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_trigger_
      -- 
    cp_elements(88) <= cp_elements(72);
    -- CP-element group 89 join  transition  no-bypass 
    -- predecessors 91 88 
    -- marked predecessors 142 
    -- successors 104 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_active_
      -- 
    cpelement_group_89 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(91);
      predecessors(1) <= cp_elements(88);
      marked_predecessors(0) <= cp_elements(142);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(89)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(89),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 90 fork  transition  bypass 
    -- predecessors 105 
    -- successors 147 
    -- marked successors 82 
    -- members (8) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_377_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_address_calculated
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_365_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_377_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_365_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_365_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_377_completed_
      -- 
    cp_elements(90) <= cp_elements(105);
    -- CP-element group 91 transition  bypass 
    -- predecessors 103 
    -- successors 89 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_root_address_calculated
      -- 
    cp_elements(91) <= cp_elements(103);
    -- CP-element group 92 transition  bypass 
    -- predecessors 99 
    -- successors 100 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_indices_scaled
      -- 
    cp_elements(92) <= cp_elements(99);
    -- CP-element group 93 transition  bypass 
    -- predecessors 101 
    -- successors 102 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_offset_calculated
      -- 
    cp_elements(93) <= cp_elements(101);
    -- CP-element group 94 transition  bypass 
    -- predecessors 97 
    -- successors 98 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_resized_0
      -- 
    cp_elements(94) <= cp_elements(97);
    -- CP-element group 95 transition  bypass 
    -- predecessors 80 
    -- successors 96 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_computed_0
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_362_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_362_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_362_completed_
      -- 
    cp_elements(95) <= cp_elements(80);
    -- CP-element group 96 transition  output  bypass 
    -- predecessors 95 
    -- successors 97 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_resize_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_resize_0/index_resize_req
      -- 
    cp_elements(96) <= cp_elements(95);
    index_resize_req_1666_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(96), ack => array_obj_ref_363_index_0_resize_req_0); -- 
    -- CP-element group 97 transition  input  no-bypass 
    -- predecessors 96 
    -- successors 94 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_resize_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_resize_0/index_resize_ack
      -- 
    index_resize_ack_1667_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_363_index_0_resize_ack_0, ack => cp_elements(97)); -- 
    -- CP-element group 98 transition  output  bypass 
    -- predecessors 94 
    -- successors 99 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_scale_0/scale_rename_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_scale_0/$entry
      -- 
    cp_elements(98) <= cp_elements(94);
    scale_rename_req_1671_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(98), ack => array_obj_ref_363_index_0_rename_req_0); -- 
    -- CP-element group 99 transition  input  no-bypass 
    -- predecessors 98 
    -- successors 92 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_scale_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_index_scale_0/scale_rename_ack
      -- 
    scale_rename_ack_1672_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_363_index_0_rename_ack_0, ack => cp_elements(99)); -- 
    -- CP-element group 100 transition  output  bypass 
    -- predecessors 92 
    -- successors 101 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_add_indices/final_index_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_add_indices/$entry
      -- 
    cp_elements(100) <= cp_elements(92);
    final_index_req_1676_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(100), ack => array_obj_ref_363_offset_inst_req_0); -- 
    -- CP-element group 101 transition  input  no-bypass 
    -- predecessors 100 
    -- successors 93 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_add_indices/final_index_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_add_indices/$exit
      -- 
    final_index_ack_1677_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_363_offset_inst_ack_0, ack => cp_elements(101)); -- 
    -- CP-element group 102 transition  output  bypass 
    -- predecessors 93 
    -- successors 103 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_base_plus_offset/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_base_plus_offset/sum_rename_req
      -- 
    cp_elements(102) <= cp_elements(93);
    sum_rename_req_1681_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(102), ack => array_obj_ref_363_root_address_inst_req_0); -- 
    -- CP-element group 103 transition  input  no-bypass 
    -- predecessors 102 
    -- successors 91 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_base_plus_offset/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_363_base_plus_offset/sum_rename_ack
      -- 
    sum_rename_ack_1682_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_363_root_address_inst_ack_0, ack => cp_elements(103)); -- 
    -- CP-element group 104 transition  output  bypass 
    -- predecessors 89 
    -- successors 105 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_complete/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_complete/final_reg_req
      -- 
    cp_elements(104) <= cp_elements(89);
    final_reg_req_1686_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(104), ack => addr_of_364_final_reg_req_0); -- 
    -- CP-element group 105 transition  input  no-bypass 
    -- predecessors 104 
    -- successors 90 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_complete/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_364_complete/final_reg_ack
      -- 
    final_reg_ack_1687_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => addr_of_364_final_reg_ack_0, ack => cp_elements(105)); -- 
    -- CP-element group 106 transition  bypass 
    -- predecessors 72 
    -- successors 107 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_trigger_
      -- 
    cp_elements(106) <= cp_elements(72);
    -- CP-element group 107 join  transition  no-bypass 
    -- predecessors 106 109 
    -- marked predecessors 158 
    -- successors 122 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_active_
      -- 
    cpelement_group_107 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(106);
      predecessors(1) <= cp_elements(109);
      marked_predecessors(0) <= cp_elements(158);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(107)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(107),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 108 fork  transition  bypass 
    -- predecessors 123 
    -- successors 163 
    -- marked successors 82 
    -- members (8) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_370_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_370_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_370_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_address_calculated
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_381_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_381_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_381_completed_
      -- 
    cp_elements(108) <= cp_elements(123);
    -- CP-element group 109 transition  bypass 
    -- predecessors 121 
    -- successors 107 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_root_address_calculated
      -- 
    cp_elements(109) <= cp_elements(121);
    -- CP-element group 110 transition  bypass 
    -- predecessors 117 
    -- successors 118 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_indices_scaled
      -- 
    cp_elements(110) <= cp_elements(117);
    -- CP-element group 111 transition  bypass 
    -- predecessors 119 
    -- successors 120 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_offset_calculated
      -- 
    cp_elements(111) <= cp_elements(119);
    -- CP-element group 112 transition  bypass 
    -- predecessors 115 
    -- successors 116 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_resized_0
      -- 
    cp_elements(112) <= cp_elements(115);
    -- CP-element group 113 transition  bypass 
    -- predecessors 80 
    -- successors 114 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_367_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_computed_0
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_367_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_367_completed_
      -- 
    cp_elements(113) <= cp_elements(80);
    -- CP-element group 114 transition  output  bypass 
    -- predecessors 113 
    -- successors 115 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_resize_0/index_resize_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_resize_0/$entry
      -- 
    cp_elements(114) <= cp_elements(113);
    index_resize_req_1705_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(114), ack => array_obj_ref_368_index_0_resize_req_0); -- 
    -- CP-element group 115 transition  input  no-bypass 
    -- predecessors 114 
    -- successors 112 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_resize_0/index_resize_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_resize_0/$exit
      -- 
    index_resize_ack_1706_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_368_index_0_resize_ack_0, ack => cp_elements(115)); -- 
    -- CP-element group 116 transition  output  bypass 
    -- predecessors 112 
    -- successors 117 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_scale_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_scale_0/scale_rename_req
      -- 
    cp_elements(116) <= cp_elements(112);
    scale_rename_req_1710_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(116), ack => array_obj_ref_368_index_0_rename_req_0); -- 
    -- CP-element group 117 transition  input  no-bypass 
    -- predecessors 116 
    -- successors 110 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_scale_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_index_scale_0/scale_rename_ack
      -- 
    scale_rename_ack_1711_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_368_index_0_rename_ack_0, ack => cp_elements(117)); -- 
    -- CP-element group 118 transition  output  bypass 
    -- predecessors 110 
    -- successors 119 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_add_indices/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_add_indices/final_index_req
      -- 
    cp_elements(118) <= cp_elements(110);
    final_index_req_1715_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(118), ack => array_obj_ref_368_offset_inst_req_0); -- 
    -- CP-element group 119 transition  input  no-bypass 
    -- predecessors 118 
    -- successors 111 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_add_indices/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_add_indices/final_index_ack
      -- 
    final_index_ack_1716_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_368_offset_inst_ack_0, ack => cp_elements(119)); -- 
    -- CP-element group 120 transition  output  bypass 
    -- predecessors 111 
    -- successors 121 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_base_plus_offset/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_base_plus_offset/sum_rename_req
      -- 
    cp_elements(120) <= cp_elements(111);
    sum_rename_req_1720_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(120), ack => array_obj_ref_368_root_address_inst_req_0); -- 
    -- CP-element group 121 transition  input  no-bypass 
    -- predecessors 120 
    -- successors 109 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_base_plus_offset/sum_rename_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_368_base_plus_offset/$exit
      -- 
    sum_rename_ack_1721_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_368_root_address_inst_ack_0, ack => cp_elements(121)); -- 
    -- CP-element group 122 transition  output  bypass 
    -- predecessors 107 
    -- successors 123 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_complete/final_reg_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_complete/$entry
      -- 
    cp_elements(122) <= cp_elements(107);
    final_reg_req_1725_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(122), ack => addr_of_369_final_reg_req_0); -- 
    -- CP-element group 123 transition  input  no-bypass 
    -- predecessors 122 
    -- successors 108 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_complete/final_reg_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_369_complete/$exit
      -- 
    final_reg_ack_1726_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => addr_of_369_final_reg_ack_0, ack => cp_elements(123)); -- 
    -- CP-element group 124 transition  bypass 
    -- predecessors 72 
    -- successors 125 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_trigger_
      -- 
    cp_elements(124) <= cp_elements(72);
    -- CP-element group 125 join  transition  no-bypass 
    -- predecessors 127 124 
    -- marked predecessors 186 
    -- successors 140 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_active_
      -- 
    cpelement_group_125 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(127);
      predecessors(1) <= cp_elements(124);
      marked_predecessors(0) <= cp_elements(186);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(125)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(125),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 126 fork  transition  bypass 
    -- predecessors 141 
    -- successors 191 
    -- marked successors 82 
    -- members (8) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_375_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_375_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_375_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_address_calculated
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_389_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_389_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_389_completed_
      -- 
    cp_elements(126) <= cp_elements(141);
    -- CP-element group 127 transition  bypass 
    -- predecessors 139 
    -- successors 125 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_root_address_calculated
      -- 
    cp_elements(127) <= cp_elements(139);
    -- CP-element group 128 transition  bypass 
    -- predecessors 135 
    -- successors 136 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_indices_scaled
      -- 
    cp_elements(128) <= cp_elements(135);
    -- CP-element group 129 transition  bypass 
    -- predecessors 137 
    -- successors 138 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_offset_calculated
      -- 
    cp_elements(129) <= cp_elements(137);
    -- CP-element group 130 transition  bypass 
    -- predecessors 133 
    -- successors 134 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_resized_0
      -- 
    cp_elements(130) <= cp_elements(133);
    -- CP-element group 131 transition  bypass 
    -- predecessors 80 
    -- successors 132 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_372_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_372_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_computed_0
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_372_trigger_
      -- 
    cp_elements(131) <= cp_elements(80);
    -- CP-element group 132 transition  output  bypass 
    -- predecessors 131 
    -- successors 133 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_resize_0/index_resize_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_resize_0/$entry
      -- 
    cp_elements(132) <= cp_elements(131);
    index_resize_req_1744_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(132), ack => array_obj_ref_373_index_0_resize_req_0); -- 
    -- CP-element group 133 transition  input  no-bypass 
    -- predecessors 132 
    -- successors 130 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_resize_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_resize_0/index_resize_ack
      -- 
    index_resize_ack_1745_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_373_index_0_resize_ack_0, ack => cp_elements(133)); -- 
    -- CP-element group 134 transition  output  bypass 
    -- predecessors 130 
    -- successors 135 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_scale_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_scale_0/scale_rename_req
      -- 
    cp_elements(134) <= cp_elements(130);
    scale_rename_req_1749_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(134), ack => array_obj_ref_373_index_0_rename_req_0); -- 
    -- CP-element group 135 transition  input  no-bypass 
    -- predecessors 134 
    -- successors 128 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_scale_0/scale_rename_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_index_scale_0/$exit
      -- 
    scale_rename_ack_1750_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_373_index_0_rename_ack_0, ack => cp_elements(135)); -- 
    -- CP-element group 136 transition  output  bypass 
    -- predecessors 128 
    -- successors 137 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_add_indices/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_add_indices/final_index_req
      -- 
    cp_elements(136) <= cp_elements(128);
    final_index_req_1754_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(136), ack => array_obj_ref_373_offset_inst_req_0); -- 
    -- CP-element group 137 transition  input  no-bypass 
    -- predecessors 136 
    -- successors 129 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_add_indices/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_add_indices/final_index_ack
      -- 
    final_index_ack_1755_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_373_offset_inst_ack_0, ack => cp_elements(137)); -- 
    -- CP-element group 138 transition  output  bypass 
    -- predecessors 129 
    -- successors 139 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_base_plus_offset/sum_rename_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_base_plus_offset/$entry
      -- 
    cp_elements(138) <= cp_elements(129);
    sum_rename_req_1759_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(138), ack => array_obj_ref_373_root_address_inst_req_0); -- 
    -- CP-element group 139 transition  input  no-bypass 
    -- predecessors 138 
    -- successors 127 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_base_plus_offset/sum_rename_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/array_obj_ref_373_base_plus_offset/$exit
      -- 
    sum_rename_ack_1760_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_373_root_address_inst_ack_0, ack => cp_elements(139)); -- 
    -- CP-element group 140 transition  output  bypass 
    -- predecessors 125 
    -- successors 141 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_complete/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_complete/final_reg_req
      -- 
    cp_elements(140) <= cp_elements(125);
    final_reg_req_1764_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(140), ack => addr_of_374_final_reg_req_0); -- 
    -- CP-element group 141 transition  input  no-bypass 
    -- predecessors 140 
    -- successors 126 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_complete/final_reg_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/addr_of_374_complete/$exit
      -- 
    final_reg_ack_1765_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => addr_of_374_final_reg_ack_0, ack => cp_elements(141)); -- 
    -- CP-element group 142 join  fork  transition  bypass 
    -- predecessors 154 
    -- marked predecessors 178 
    -- successors 155 
    -- marked successors 145 89 144 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_active_
      -- 
    cpelement_group_142 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(154);
      marked_predecessors(0) <= cp_elements(178);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(142)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(142),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 143 transition  bypass 
    -- predecessors 157 
    -- successors 174 
    -- members (7) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_379_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_379_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_379_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_385_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_385_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_385_completed_
      -- 
    cp_elements(143) <= cp_elements(157);
    -- CP-element group 144 join  transition  bypass 
    -- predecessors 152 
    -- marked predecessors 142 
    -- successors 153 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_word_address_calculated
      -- 
    cpelement_group_144 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(152);
      marked_predecessors(0) <= cp_elements(142);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(144)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(144),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 145 join  transition  bypass 
    -- predecessors 150 
    -- marked predecessors 142 
    -- successors 151 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_root_address_calculated
      -- 
    cpelement_group_145 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(150);
      marked_predecessors(0) <= cp_elements(142);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(145)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(145),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 146 transition  bypass 
    -- predecessors 148 
    -- successors 149 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_address_resized
      -- 
    cp_elements(146) <= cp_elements(148);
    -- CP-element group 147 transition  output  bypass 
    -- predecessors 90 
    -- successors 148 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_addr_resize/base_resize_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_addr_resize/$entry
      -- 
    cp_elements(147) <= cp_elements(90);
    base_resize_req_1782_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(147), ack => ptr_deref_378_base_resize_req_0); -- 
    -- CP-element group 148 transition  input  no-bypass 
    -- predecessors 147 
    -- successors 146 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_addr_resize/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_addr_resize/base_resize_ack
      -- 
    base_resize_ack_1783_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_378_base_resize_ack_0, ack => cp_elements(148)); -- 
    -- CP-element group 149 transition  output  bypass 
    -- predecessors 146 
    -- successors 150 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_plus_offset/sum_rename_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_plus_offset/$entry
      -- 
    cp_elements(149) <= cp_elements(146);
    sum_rename_req_1787_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(149), ack => ptr_deref_378_root_address_inst_req_0); -- 
    -- CP-element group 150 transition  input  no-bypass 
    -- predecessors 149 
    -- successors 145 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_plus_offset/sum_rename_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_base_plus_offset/$exit
      -- 
    sum_rename_ack_1788_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_378_root_address_inst_ack_0, ack => cp_elements(150)); -- 
    -- CP-element group 151 transition  output  bypass 
    -- predecessors 145 
    -- successors 152 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_word_addrgen/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_word_addrgen/root_register_req
      -- 
    cp_elements(151) <= cp_elements(145);
    root_register_req_1792_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(151), ack => ptr_deref_378_addr_0_req_0); -- 
    -- CP-element group 152 transition  input  no-bypass 
    -- predecessors 151 
    -- successors 144 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_word_addrgen/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_word_addrgen/root_register_ack
      -- 
    root_register_ack_1793_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_378_addr_0_ack_0, ack => cp_elements(152)); -- 
    -- CP-element group 153 transition  output  bypass 
    -- predecessors 144 
    -- successors 154 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/word_access/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/word_access/word_access_0/rr
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/$entry
      -- 
    cp_elements(153) <= cp_elements(144);
    rr_1803_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(153), ack => ptr_deref_378_load_0_req_0); -- 
    -- CP-element group 154 transition  input  no-bypass 
    -- predecessors 153 
    -- successors 142 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/word_access/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_request/word_access/word_access_0/ra
      -- 
    ra_1804_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_378_load_0_ack_0, ack => cp_elements(154)); -- 
    -- CP-element group 155 transition  output  bypass 
    -- predecessors 142 
    -- successors 156 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/word_access/word_access_0/cr
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/word_access/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/$entry
      -- 
    cp_elements(155) <= cp_elements(142);
    cr_1814_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(155), ack => ptr_deref_378_load_0_req_1); -- 
    -- CP-element group 156 transition  input  output  no-bypass 
    -- predecessors 155 
    -- successors 157 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/word_access/word_access_0/ca
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/merge_req
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/word_access/$exit
      -- 
    ca_1815_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_378_load_0_ack_1, ack => cp_elements(156)); -- 
    merge_req_1816_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(156), ack => ptr_deref_378_gather_scatter_req_0); -- 
    -- CP-element group 157 transition  input  no-bypass 
    -- predecessors 156 
    -- successors 143 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_378_complete/merge_ack
      -- 
    merge_ack_1817_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_378_gather_scatter_ack_0, ack => cp_elements(157)); -- 
    -- CP-element group 158 join  fork  transition  bypass 
    -- predecessors 170 
    -- marked predecessors 178 
    -- successors 171 
    -- marked successors 107 160 161 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_active_
      -- 
    cpelement_group_158 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(170);
      marked_predecessors(0) <= cp_elements(178);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(158)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(158),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 159 transition  bypass 
    -- predecessors 173 
    -- successors 174 
    -- members (7) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_383_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_383_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_383_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_386_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_386_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_386_completed_
      -- 
    cp_elements(159) <= cp_elements(173);
    -- CP-element group 160 join  transition  bypass 
    -- predecessors 168 
    -- marked predecessors 158 
    -- successors 169 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_word_address_calculated
      -- 
    cpelement_group_160 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(168);
      marked_predecessors(0) <= cp_elements(158);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(160)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(160),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 161 join  transition  bypass 
    -- predecessors 166 
    -- marked predecessors 158 
    -- successors 167 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_root_address_calculated
      -- 
    cpelement_group_161 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(166);
      marked_predecessors(0) <= cp_elements(158);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(161)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(161),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 162 transition  bypass 
    -- predecessors 164 
    -- successors 165 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_address_resized
      -- 
    cp_elements(162) <= cp_elements(164);
    -- CP-element group 163 transition  output  bypass 
    -- predecessors 108 
    -- successors 164 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_addr_resize/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_addr_resize/base_resize_req
      -- 
    cp_elements(163) <= cp_elements(108);
    base_resize_req_1834_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(163), ack => ptr_deref_382_base_resize_req_0); -- 
    -- CP-element group 164 transition  input  no-bypass 
    -- predecessors 163 
    -- successors 162 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_addr_resize/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_addr_resize/base_resize_ack
      -- 
    base_resize_ack_1835_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_382_base_resize_ack_0, ack => cp_elements(164)); -- 
    -- CP-element group 165 transition  output  bypass 
    -- predecessors 162 
    -- successors 166 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_plus_offset/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_plus_offset/sum_rename_req
      -- 
    cp_elements(165) <= cp_elements(162);
    sum_rename_req_1839_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(165), ack => ptr_deref_382_root_address_inst_req_0); -- 
    -- CP-element group 166 transition  input  no-bypass 
    -- predecessors 165 
    -- successors 161 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_plus_offset/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_base_plus_offset/sum_rename_ack
      -- 
    sum_rename_ack_1840_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_382_root_address_inst_ack_0, ack => cp_elements(166)); -- 
    -- CP-element group 167 transition  output  bypass 
    -- predecessors 161 
    -- successors 168 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_word_addrgen/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_word_addrgen/root_register_req
      -- 
    cp_elements(167) <= cp_elements(161);
    root_register_req_1844_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(167), ack => ptr_deref_382_addr_0_req_0); -- 
    -- CP-element group 168 transition  input  no-bypass 
    -- predecessors 167 
    -- successors 160 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_word_addrgen/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_word_addrgen/root_register_ack
      -- 
    root_register_ack_1845_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_382_addr_0_ack_0, ack => cp_elements(168)); -- 
    -- CP-element group 169 transition  output  bypass 
    -- predecessors 160 
    -- successors 170 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/word_access/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/word_access/word_access_0/rr
      -- 
    cp_elements(169) <= cp_elements(160);
    rr_1855_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(169), ack => ptr_deref_382_load_0_req_0); -- 
    -- CP-element group 170 transition  input  no-bypass 
    -- predecessors 169 
    -- successors 158 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/word_access/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_request/word_access/word_access_0/ra
      -- 
    ra_1856_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_382_load_0_ack_0, ack => cp_elements(170)); -- 
    -- CP-element group 171 transition  output  bypass 
    -- predecessors 158 
    -- successors 172 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/word_access/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/word_access/word_access_0/cr
      -- 
    cp_elements(171) <= cp_elements(158);
    cr_1866_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(171), ack => ptr_deref_382_load_0_req_1); -- 
    -- CP-element group 172 transition  input  output  no-bypass 
    -- predecessors 171 
    -- successors 173 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/word_access/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/word_access/word_access_0/ca
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/merge_req
      -- 
    ca_1867_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_382_load_0_ack_1, ack => cp_elements(172)); -- 
    merge_req_1868_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(172), ack => ptr_deref_382_gather_scatter_req_0); -- 
    -- CP-element group 173 transition  input  no-bypass 
    -- predecessors 172 
    -- successors 159 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_382_complete/merge_ack
      -- 
    merge_ack_1869_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_382_gather_scatter_ack_0, ack => cp_elements(173)); -- 
    -- CP-element group 174 join  fork  transition  bypass 
    -- predecessors 159 143 
    -- successors 177 179 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_trigger_
      -- 
    cpelement_group_174 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(159);
      predecessors(1) <= cp_elements(143);
      jNoI: join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(174)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(174),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 175 transition  bypass 
    -- predecessors 72 
    -- successors 233 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_active_
      -- 
    cp_elements(175) <= cp_elements(72);
    -- CP-element group 176 join  transition  bypass 
    -- predecessors 178 180 
    -- successors 185 
    -- members (9) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_388_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_388_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_388_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_392_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_392_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_391_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_391_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_391_completed_
      -- 
    cpelement_group_176 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(178);
      predecessors(1) <= cp_elements(180);
      jNoI: join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(176)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(176),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 177 join  transition  bypass 
    -- predecessors 174 
    -- marked predecessors 178 
    -- successors 181 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_sample_start_
      -- 
    cpelement_group_177 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(174);
      marked_predecessors(0) <= cp_elements(178);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(177)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(177),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 178 fork  transition  bypass 
    -- predecessors 182 
    -- successors 176 
    -- marked successors 158 142 177 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_sample_completed_
      -- 
    cp_elements(178) <= cp_elements(182);
    -- CP-element group 179 join  transition  bypass 
    -- predecessors 174 
    -- marked predecessors 187 
    -- successors 183 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_update_start_
      -- 
    cpelement_group_179 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(174);
      marked_predecessors(0) <= cp_elements(187);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(179)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(179),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 180 transition  bypass 
    -- predecessors 184 
    -- successors 176 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_update_completed_
      -- 
    cp_elements(180) <= cp_elements(184);
    -- CP-element group 181 transition  output  bypass 
    -- predecessors 177 
    -- successors 182 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Sample/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Sample/rr
      -- 
    cp_elements(181) <= cp_elements(177);
    rr_1889_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(181), ack => binary_387_inst_req_0); -- 
    -- CP-element group 182 transition  input  no-bypass 
    -- predecessors 181 
    -- successors 178 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Sample/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Sample/ra
      -- 
    ra_1890_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_387_inst_ack_0, ack => cp_elements(182)); -- 
    -- CP-element group 183 transition  output  bypass 
    -- predecessors 179 
    -- successors 184 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Update/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Update/cr
      -- 
    cp_elements(183) <= cp_elements(179);
    cr_1894_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(183), ack => binary_387_inst_req_1); -- 
    -- CP-element group 184 transition  input  no-bypass 
    -- predecessors 183 
    -- successors 180 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Update/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_387_Update/ca
      -- 
    ca_1895_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_387_inst_ack_1, ack => cp_elements(184)); -- 
    -- CP-element group 185 join  transition  bypass 
    -- predecessors 176 188 
    -- marked predecessors 186 
    -- successors 197 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_trigger_
      -- 
    cpelement_group_185 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(176);
      predecessors(1) <= cp_elements(188);
      marked_predecessors(0) <= cp_elements(186);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(185)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(185),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 186 join  fork  transition  bypass 
    -- predecessors 199 
    -- marked predecessors 187 
    -- successors 200 
    -- marked successors 185 125 189 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_active_
      -- 
    cpelement_group_186 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(199);
      marked_predecessors(0) <= cp_elements(187);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(186)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(186),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 187 fork  transition  bypass 
    -- predecessors 201 
    -- successors 233 
    -- marked successors 179 186 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_392_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_completed_
      -- 
    cp_elements(187) <= cp_elements(201);
    -- CP-element group 188 transition  bypass 
    -- predecessors 196 
    -- successors 185 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_word_address_calculated
      -- 
    cp_elements(188) <= cp_elements(196);
    -- CP-element group 189 join  transition  bypass 
    -- predecessors 194 
    -- marked predecessors 186 
    -- successors 195 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_root_address_calculated
      -- 
    cpelement_group_189 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(194);
      marked_predecessors(0) <= cp_elements(186);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(189)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(189),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 190 transition  bypass 
    -- predecessors 192 
    -- successors 193 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_address_resized
      -- 
    cp_elements(190) <= cp_elements(192);
    -- CP-element group 191 transition  output  bypass 
    -- predecessors 126 
    -- successors 192 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_addr_resize/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_addr_resize/base_resize_req
      -- 
    cp_elements(191) <= cp_elements(126);
    base_resize_req_1915_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(191), ack => ptr_deref_390_base_resize_req_0); -- 
    -- CP-element group 192 transition  input  no-bypass 
    -- predecessors 191 
    -- successors 190 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_addr_resize/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_addr_resize/base_resize_ack
      -- 
    base_resize_ack_1916_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_390_base_resize_ack_0, ack => cp_elements(192)); -- 
    -- CP-element group 193 transition  output  bypass 
    -- predecessors 190 
    -- successors 194 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_plus_offset/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_plus_offset/sum_rename_req
      -- 
    cp_elements(193) <= cp_elements(190);
    sum_rename_req_1920_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(193), ack => ptr_deref_390_root_address_inst_req_0); -- 
    -- CP-element group 194 transition  input  no-bypass 
    -- predecessors 193 
    -- successors 189 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_plus_offset/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_base_plus_offset/sum_rename_ack
      -- 
    sum_rename_ack_1921_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_390_root_address_inst_ack_0, ack => cp_elements(194)); -- 
    -- CP-element group 195 transition  output  bypass 
    -- predecessors 189 
    -- successors 196 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_word_addrgen/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_word_addrgen/root_register_req
      -- 
    cp_elements(195) <= cp_elements(189);
    root_register_req_1925_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(195), ack => ptr_deref_390_addr_0_req_0); -- 
    -- CP-element group 196 transition  input  no-bypass 
    -- predecessors 195 
    -- successors 188 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_word_addrgen/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_word_addrgen/root_register_ack
      -- 
    root_register_ack_1926_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_390_addr_0_ack_0, ack => cp_elements(196)); -- 
    -- CP-element group 197 transition  output  bypass 
    -- predecessors 185 
    -- successors 198 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/split_req
      -- 
    cp_elements(197) <= cp_elements(185);
    split_req_1930_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(197), ack => ptr_deref_390_gather_scatter_req_0); -- 
    -- CP-element group 198 transition  input  output  no-bypass 
    -- predecessors 197 
    -- successors 199 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/split_ack
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/word_access/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/word_access/word_access_0/rr
      -- 
    split_ack_1931_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_390_gather_scatter_ack_0, ack => cp_elements(198)); -- 
    rr_1938_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(198), ack => ptr_deref_390_store_0_req_0); -- 
    -- CP-element group 199 transition  input  no-bypass 
    -- predecessors 198 
    -- successors 186 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/word_access/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_request/word_access/word_access_0/ra
      -- 
    ra_1939_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_390_store_0_ack_0, ack => cp_elements(199)); -- 
    -- CP-element group 200 transition  output  bypass 
    -- predecessors 186 
    -- successors 201 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/word_access/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/word_access/word_access_0/cr
      -- 
    cp_elements(200) <= cp_elements(186);
    cr_1949_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(200), ack => ptr_deref_390_store_0_req_1); -- 
    -- CP-element group 201 transition  input  no-bypass 
    -- predecessors 200 
    -- successors 187 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/word_access/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/ptr_deref_390_complete/word_access/word_access_0/ca
      -- 
    ca_1950_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_390_store_0_ack_1, ack => cp_elements(201)); -- 
    -- CP-element group 202 transition  bypass 
    -- predecessors 72 
    -- successors 233 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_active_
      -- 
    cp_elements(202) <= cp_elements(72);
    -- CP-element group 203 join  fork  transition  bypass 
    -- predecessors 205 207 
    -- successors 215 217 
    -- marked successors 84 
    -- members (8) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_398_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_398_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_398_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_400_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_400_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_400_completed_
      -- 
    cpelement_group_203 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(205);
      predecessors(1) <= cp_elements(207);
      jNoI: join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(203)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(203),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 204 join  transition  no-bypass 
    -- predecessors 208 
    -- marked predecessors 205 
    -- successors 209 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_sample_start_
      -- 
    cpelement_group_204 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(208);
      marked_predecessors(0) <= cp_elements(205);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(204)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(204),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 205 fork  transition  bypass 
    -- predecessors 210 
    -- successors 203 
    -- marked successors 82 204 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_sample_completed_
      -- 
    cp_elements(205) <= cp_elements(210);
    -- CP-element group 206 join  transition  no-bypass 
    -- predecessors 208 
    -- marked predecessors 216 
    -- successors 211 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_update_start_
      -- 
    cpelement_group_206 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(208);
      marked_predecessors(0) <= cp_elements(216);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(206)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(206),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 207 transition  bypass 
    -- predecessors 212 
    -- successors 203 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_update_completed_
      -- 
    cp_elements(207) <= cp_elements(212);
    -- CP-element group 208 fork  transition  bypass 
    -- predecessors 80 
    -- successors 204 206 
    -- members (4) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_394_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_394_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_394_completed_
      -- 
    cp_elements(208) <= cp_elements(80);
    -- CP-element group 209 transition  output  bypass 
    -- predecessors 204 
    -- successors 210 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Sample/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Sample/rr
      -- 
    cp_elements(209) <= cp_elements(204);
    rr_1967_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(209), ack => binary_397_inst_req_0); -- 
    -- CP-element group 210 transition  input  no-bypass 
    -- predecessors 209 
    -- successors 205 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Sample/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Sample/ra
      -- 
    ra_1968_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_397_inst_ack_0, ack => cp_elements(210)); -- 
    -- CP-element group 211 transition  output  bypass 
    -- predecessors 206 
    -- successors 212 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Update/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Update/cr
      -- 
    cp_elements(211) <= cp_elements(206);
    cr_1972_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(211), ack => binary_397_inst_req_1); -- 
    -- CP-element group 212 transition  input  no-bypass 
    -- predecessors 211 
    -- successors 207 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Update/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_397_Update/ca
      -- 
    ca_1973_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_397_inst_ack_1, ack => cp_elements(212)); -- 
    -- CP-element group 213 transition  bypass 
    -- predecessors 72 
    -- successors 233 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_active_
      -- 
    cp_elements(213) <= cp_elements(72);
    -- CP-element group 214 join  fork  transition  bypass 
    -- predecessors 216 218 
    -- successors 225 227 
    -- marked successors 217 
    -- members (8) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_404_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_404_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/assign_stmt_404_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_completed_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_406_trigger_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_406_active_
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/simple_obj_ref_406_completed_
      -- 
    cpelement_group_214 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(216);
      predecessors(1) <= cp_elements(218);
      jNoI: join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(214)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(214),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 215 join  transition  bypass 
    -- predecessors 203 
    -- marked predecessors 216 
    -- successors 219 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_sample_start_
      -- 
    cpelement_group_215 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(203);
      marked_predecessors(0) <= cp_elements(216);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(215)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(215),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 216 fork  transition  bypass 
    -- predecessors 220 
    -- successors 214 
    -- marked successors 215 206 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_sample_completed_
      -- 
    cp_elements(216) <= cp_elements(220);
    -- CP-element group 217 join  transition  bypass 
    -- predecessors 203 
    -- marked predecessors 214 223 
    -- successors 221 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_update_start_
      -- 
    cpelement_group_217 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(203);
      marked_predecessors(0) <= cp_elements(214);
      marked_predecessors(1) <= cp_elements(223);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(217)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(217),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 218 transition  bypass 
    -- predecessors 222 
    -- successors 214 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_update_completed_
      -- 
    cp_elements(218) <= cp_elements(222);
    -- CP-element group 219 transition  output  bypass 
    -- predecessors 215 
    -- successors 220 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Sample/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Sample/rr
      -- 
    cp_elements(219) <= cp_elements(215);
    rr_1990_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(219), ack => binary_403_inst_req_0); -- 
    -- CP-element group 220 transition  input  no-bypass 
    -- predecessors 219 
    -- successors 216 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Sample/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Sample/ra
      -- 
    ra_1991_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_403_inst_ack_0, ack => cp_elements(220)); -- 
    -- CP-element group 221 transition  output  bypass 
    -- predecessors 217 
    -- successors 222 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Update/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Update/cr
      -- 
    cp_elements(221) <= cp_elements(217);
    cr_1995_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(221), ack => binary_403_inst_req_1); -- 
    -- CP-element group 222 transition  input  no-bypass 
    -- predecessors 221 
    -- successors 218 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Update/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/binary_403_Update/ca
      -- 
    ca_1996_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_403_inst_ack_1, ack => cp_elements(222)); -- 
    -- CP-element group 223 fork  transition  bypass 
    -- predecessors 72 
    -- successors 233 
    -- marked successors 217 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_active_
      -- 
    cp_elements(223) <= cp_elements(72);
    -- CP-element group 224 join  transition  output  bypass 
    -- predecessors 226 228 
    -- successors 68 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/condition_evaluated
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_completed_
      -- 
    cpelement_group_224 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(226);
      predecessors(1) <= cp_elements(228);
      jNoI: join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(224)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(224),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    condition_evaluated_1997_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(224), ack => do_while_stmt_353_branch_req_0); -- 
    -- CP-element group 225 join  transition  bypass 
    -- predecessors 214 
    -- marked predecessors 226 
    -- successors 229 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_sample_start_
      -- 
    cpelement_group_225 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(214);
      marked_predecessors(0) <= cp_elements(226);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(225)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(225),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 226 fork  transition  bypass 
    -- predecessors 230 
    -- successors 224 
    -- marked successors 225 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_sample_completed_
      -- 
    cp_elements(226) <= cp_elements(230);
    -- CP-element group 227 join  transition  bypass 
    -- predecessors 214 
    -- marked predecessors 228 
    -- successors 231 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_update_start_
      -- 
    cpelement_group_227 : Block -- 
      signal predecessors: BooleanArray(0 downto 0);
      signal marked_predecessors: BooleanArray(0 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(214);
      marked_predecessors(0) <= cp_elements(228);
      jNoI: marked_join -- 
        generic map(place_capacity => 16,
        bypass => true,
        name => " cp_elements(227)_join")
        port map( -- 
          preds => predecessors,
          marked_preds => marked_predecessors,
          symbol_out => cp_elements(227),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 228 fork  transition  bypass 
    -- predecessors 232 
    -- successors 224 
    -- marked successors 227 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_update_completed_
      -- 
    cp_elements(228) <= cp_elements(232);
    -- CP-element group 229 transition  output  bypass 
    -- predecessors 225 
    -- successors 230 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Sample/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Sample/rr
      -- 
    cp_elements(229) <= cp_elements(225);
    rr_2011_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(229), ack => unary_407_inst_req_0); -- 
    -- CP-element group 230 transition  input  no-bypass 
    -- predecessors 229 
    -- successors 226 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Sample/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Sample/ra
      -- 
    ra_2012_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => unary_407_inst_ack_0, ack => cp_elements(230)); -- 
    -- CP-element group 231 transition  output  bypass 
    -- predecessors 227 
    -- successors 232 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Update/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Update/cr
      -- 
    cp_elements(231) <= cp_elements(227);
    cr_2016_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(231), ack => unary_407_inst_req_1); -- 
    -- CP-element group 232 transition  input  no-bypass 
    -- predecessors 231 
    -- successors 228 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Update/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/unary_407_Update/ca
      -- 
    ca_2017_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => unary_407_inst_ack_1, ack => cp_elements(232)); -- 
    -- CP-element group 233 join  transition  no-bypass 
    -- predecessors 175 187 213 223 202 
    -- successors 69 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353_loop_body/$exit
      -- 
    cpelement_group_233 : Block -- 
      signal predecessors: BooleanArray(4 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(175);
      predecessors(1) <= cp_elements(187);
      predecessors(2) <= cp_elements(213);
      predecessors(3) <= cp_elements(223);
      predecessors(4) <= cp_elements(202);
      jNoI: join -- 
        generic map(place_capacity => 16,
        bypass => false,
        name => " cp_elements(233)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(233),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 234 transition  bypass 
    -- predecessors 68 
    -- successors 235 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_exit/$entry
      -- 
    cp_elements(234) <= cp_elements(68);
    -- CP-element group 235 transition  input  no-bypass 
    -- predecessors 234 
    -- successors 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_exit/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_exit/ack
      -- 
    ack_2021_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_353_branch_ack_0, ack => cp_elements(235)); -- 
    -- CP-element group 236 transition  bypass 
    -- predecessors 68 
    -- successors 237 
    -- members (1) 
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_taken/$entry
      -- 
    cp_elements(236) <= cp_elements(68);
    -- CP-element group 237 transition  input  no-bypass 
    -- predecessors 236 
    -- successors 
    -- members (2) 
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_taken/$exit
      -- 	branch_block_stmt_282/do_while_stmt_353/loop_taken/ack
      -- 
    ack_2025_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => do_while_stmt_353_branch_ack_1, ack => cp_elements(237)); -- 
    -- CP-element group 238 transition  place  output  bypass 
    -- predecessors 66 
    -- successors 293 
    -- members (22) 
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_req
      -- 	branch_block_stmt_282/merge_stmt_409_PhiAck/$entry
      -- 	branch_block_stmt_282/getDatax_xexit_x_vectorSum_x_xexitx_xloopexit_PhiReq/$exit
      -- 	branch_block_stmt_282/merge_stmt_409_PhiAck/$exit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/$exit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/req
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/$exit
      -- 	branch_block_stmt_282/merge_stmt_409_PhiAck/dummy
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/$exit
      -- 	branch_block_stmt_282/getDatax_xexit_x_vectorSum_x_xexitx_xloopexit_PhiReq/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/ack
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/$exit
      -- 	branch_block_stmt_282/merge_stmt_409_PhiReqMerge
      -- 	branch_block_stmt_282/do_while_stmt_353/$exit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit_PhiReq/$entry
      -- 	branch_block_stmt_282/do_while_stmt_353__exit__
      -- 	branch_block_stmt_282/getDatax_xexit_x_vectorSum_x_xexitx_xloopexit
      -- 	branch_block_stmt_282/merge_stmt_409__exit__
      -- 	branch_block_stmt_282/x_vectorSum_x_xexitx_xloopexit_x_vectorSum_x_xexit
      -- 
    cp_elements(238) <= cp_elements(66);
    phi_stmt_412_req_2348_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(238), ack => phi_stmt_412_req_1); -- 
    -- CP-element group 239 fork  transition  bypass 
    -- predecessors 295 
    -- successors 240 242 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/$entry
      -- 
    cp_elements(239) <= cp_elements(295);
    -- CP-element group 240 transition  bypass 
    -- predecessors 239 
    -- successors 241 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_trigger_
      -- 
    cp_elements(240) <= cp_elements(239);
    -- CP-element group 241 join  transition  output  bypass 
    -- predecessors 240 246 
    -- successors 247 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_active_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_complete/final_reg_req
      -- 
    cpelement_group_241 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(240);
      predecessors(1) <= cp_elements(246);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(241)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(241),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    final_reg_req_2067_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(241), ack => addr_of_423_final_reg_req_0); -- 
    -- CP-element group 242 transition  output  bypass 
    -- predecessors 239 
    -- successors 243 
    -- members (6) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_computed_0
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/simple_obj_ref_421_trigger_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/simple_obj_ref_421_active_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/simple_obj_ref_421_completed_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_resize_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_resize_0/index_resize_req
      -- 
    cp_elements(242) <= cp_elements(239);
    index_resize_req_2047_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(242), ack => array_obj_ref_422_index_0_resize_req_0); -- 
    -- CP-element group 243 transition  input  output  no-bypass 
    -- predecessors 242 
    -- successors 244 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_resized_0
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_resize_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_resize_0/index_resize_ack
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_scale_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_scale_0/scale_rename_req
      -- 
    index_resize_ack_2048_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_422_index_0_resize_ack_0, ack => cp_elements(243)); -- 
    scale_rename_req_2052_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(243), ack => array_obj_ref_422_index_0_rename_req_0); -- 
    -- CP-element group 244 transition  input  output  no-bypass 
    -- predecessors 243 
    -- successors 245 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_indices_scaled
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_scale_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_index_scale_0/scale_rename_ack
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_add_indices/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_add_indices/final_index_req
      -- 
    scale_rename_ack_2053_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_422_index_0_rename_ack_0, ack => cp_elements(244)); -- 
    final_index_req_2057_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(244), ack => array_obj_ref_422_offset_inst_req_0); -- 
    -- CP-element group 245 transition  input  output  no-bypass 
    -- predecessors 244 
    -- successors 246 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_offset_calculated
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_add_indices/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_add_indices/final_index_ack
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_base_plus_offset/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_base_plus_offset/sum_rename_req
      -- 
    final_index_ack_2058_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_422_offset_inst_ack_0, ack => cp_elements(245)); -- 
    sum_rename_req_2062_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(245), ack => array_obj_ref_422_root_address_inst_req_0); -- 
    -- CP-element group 246 transition  input  no-bypass 
    -- predecessors 245 
    -- successors 241 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_root_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_base_plus_offset/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/array_obj_ref_422_base_plus_offset/sum_rename_ack
      -- 
    sum_rename_ack_2063_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => array_obj_ref_422_root_address_inst_ack_0, ack => cp_elements(246)); -- 
    -- CP-element group 247 fork  transition  input  no-bypass 
    -- predecessors 241 
    -- successors 248 249 
    -- members (10) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/assign_stmt_424_trigger_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/assign_stmt_424_active_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/assign_stmt_424_completed_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_completed_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/addr_of_423_complete/final_reg_ack
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/simple_obj_ref_426_trigger_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/simple_obj_ref_426_active_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/simple_obj_ref_426_completed_
      -- 
    final_reg_ack_2068_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => addr_of_423_final_reg_ack_0, ack => cp_elements(247)); -- 
    -- CP-element group 248 join  transition  output  bypass 
    -- predecessors 247 252 
    -- successors 253 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_trigger_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/word_access/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/word_access/word_access_0/rr
      -- 
    cpelement_group_248 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(247);
      predecessors(1) <= cp_elements(252);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(248)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(248),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    rr_2106_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(248), ack => ptr_deref_427_load_0_req_0); -- 
    -- CP-element group 249 transition  output  bypass 
    -- predecessors 247 
    -- successors 250 
    -- members (2) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_addr_resize/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_addr_resize/base_resize_req
      -- 
    cp_elements(249) <= cp_elements(247);
    base_resize_req_2085_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(249), ack => ptr_deref_427_base_resize_req_0); -- 
    -- CP-element group 250 transition  input  output  no-bypass 
    -- predecessors 249 
    -- successors 251 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_address_resized
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_addr_resize/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_addr_resize/base_resize_ack
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_plus_offset/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_plus_offset/sum_rename_req
      -- 
    base_resize_ack_2086_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_427_base_resize_ack_0, ack => cp_elements(250)); -- 
    sum_rename_req_2090_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(250), ack => ptr_deref_427_root_address_inst_req_0); -- 
    -- CP-element group 251 transition  input  output  no-bypass 
    -- predecessors 250 
    -- successors 252 
    -- members (5) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_root_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_plus_offset/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_base_plus_offset/sum_rename_ack
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_word_addrgen/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_word_addrgen/root_register_req
      -- 
    sum_rename_ack_2091_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_427_root_address_inst_ack_0, ack => cp_elements(251)); -- 
    root_register_req_2095_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(251), ack => ptr_deref_427_addr_0_req_0); -- 
    -- CP-element group 252 transition  input  no-bypass 
    -- predecessors 251 
    -- successors 248 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_word_address_calculated
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_word_addrgen/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_word_addrgen/root_register_ack
      -- 
    root_register_ack_2096_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_427_addr_0_ack_0, ack => cp_elements(252)); -- 
    -- CP-element group 253 transition  input  output  no-bypass 
    -- predecessors 248 
    -- successors 254 
    -- members (9) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_active_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/word_access/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_request/word_access/word_access_0/ra
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/word_access/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/word_access/word_access_0/$entry
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/word_access/word_access_0/cr
      -- 
    ra_2107_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_427_load_0_ack_0, ack => cp_elements(253)); -- 
    cr_2117_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(253), ack => ptr_deref_427_load_0_req_1); -- 
    -- CP-element group 254 transition  input  output  no-bypass 
    -- predecessors 253 
    -- successors 255 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/word_access/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/word_access/word_access_0/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/word_access/word_access_0/ca
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/merge_req
      -- 
    ca_2118_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_427_load_0_ack_1, ack => cp_elements(254)); -- 
    merge_req_2119_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(254), ack => ptr_deref_427_gather_scatter_req_0); -- 
    -- CP-element group 255 transition  place  input  output  no-bypass 
    -- predecessors 254 
    -- successors 256 
    -- members (18) 
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428__exit__
      -- 	branch_block_stmt_282/assign_stmt_431__entry__
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/assign_stmt_428_trigger_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/assign_stmt_428_active_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/assign_stmt_428_completed_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_completed_
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428/ptr_deref_427_complete/merge_ack
      -- 	branch_block_stmt_282/assign_stmt_431/$entry
      -- 	branch_block_stmt_282/assign_stmt_431/assign_stmt_431_trigger_
      -- 	branch_block_stmt_282/assign_stmt_431/assign_stmt_431_active_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_430_trigger_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_430_active_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_430_completed_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_trigger_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_complete/$entry
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_complete/pipe_wreq
      -- 
    merge_ack_2120_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => ptr_deref_427_gather_scatter_ack_0, ack => cp_elements(255)); -- 
    pipe_wreq_2136_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(255), ack => simple_obj_ref_429_inst_req_0); -- 
    -- CP-element group 256 transition  place  input  no-bypass 
    -- predecessors 255 
    -- successors 257 
    -- members (8) 
      -- 	branch_block_stmt_282/assign_stmt_431__exit__
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443__entry__
      -- 	branch_block_stmt_282/assign_stmt_431/$exit
      -- 	branch_block_stmt_282/assign_stmt_431/assign_stmt_431_completed_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_active_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_completed_
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_complete/$exit
      -- 	branch_block_stmt_282/assign_stmt_431/simple_obj_ref_429_complete/pipe_wack
      -- 
    pipe_wack_2137_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => simple_obj_ref_429_inst_ack_0, ack => cp_elements(256)); -- 
    -- CP-element group 257 fork  transition  bypass 
    -- predecessors 256 
    -- successors 258 262 265 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/$entry
      -- 
    cp_elements(257) <= cp_elements(256);
    -- CP-element group 258 transition  bypass 
    -- predecessors 257 
    -- successors 271 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_active_
      -- 
    cp_elements(258) <= cp_elements(257);
    -- CP-element group 259 join  fork  transition  bypass 
    -- predecessors 263 264 
    -- successors 267 268 
    -- members (8) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/assign_stmt_437_trigger_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/assign_stmt_437_active_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/assign_stmt_437_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_trigger_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/simple_obj_ref_439_trigger_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/simple_obj_ref_439_active_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/simple_obj_ref_439_completed_
      -- 
    cpelement_group_259 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(263);
      predecessors(1) <= cp_elements(264);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(259)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(259),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 260 transition  output  bypass 
    -- predecessors 262 
    -- successors 263 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_sample_start_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Sample/$entry
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Sample/rr
      -- 
    cp_elements(260) <= cp_elements(262);
    rr_2157_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(260), ack => binary_436_inst_req_0); -- 
    -- CP-element group 261 transition  output  bypass 
    -- predecessors 262 
    -- successors 264 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_update_start_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Update/$entry
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Update/cr
      -- 
    cp_elements(261) <= cp_elements(262);
    cr_2162_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(261), ack => binary_436_inst_req_1); -- 
    -- CP-element group 262 fork  transition  bypass 
    -- predecessors 257 
    -- successors 260 261 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_trigger_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/simple_obj_ref_433_trigger_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/simple_obj_ref_433_active_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/simple_obj_ref_433_completed_
      -- 
    cp_elements(262) <= cp_elements(257);
    -- CP-element group 263 transition  input  no-bypass 
    -- predecessors 260 
    -- successors 259 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_sample_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Sample/$exit
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Sample/ra
      -- 
    ra_2158_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_436_inst_ack_0, ack => cp_elements(263)); -- 
    -- CP-element group 264 transition  input  no-bypass 
    -- predecessors 261 
    -- successors 259 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_update_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Update/$exit
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_436_Update/ca
      -- 
    ca_2163_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_436_inst_ack_1, ack => cp_elements(264)); -- 
    -- CP-element group 265 transition  bypass 
    -- predecessors 257 
    -- successors 271 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_active_
      -- 
    cp_elements(265) <= cp_elements(257);
    -- CP-element group 266 join  transition  bypass 
    -- predecessors 269 270 
    -- successors 271 
    -- members (4) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/assign_stmt_443_trigger_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/assign_stmt_443_active_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/assign_stmt_443_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_completed_
      -- 
    cpelement_group_266 : Block -- 
      signal predecessors: BooleanArray(1 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(269);
      predecessors(1) <= cp_elements(270);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(266)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(266),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 267 transition  output  bypass 
    -- predecessors 259 
    -- successors 269 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_sample_start_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Sample/$entry
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Sample/rr
      -- 
    cp_elements(267) <= cp_elements(259);
    rr_2180_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(267), ack => binary_442_inst_req_0); -- 
    -- CP-element group 268 transition  output  bypass 
    -- predecessors 259 
    -- successors 270 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_update_start_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Update/$entry
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Update/cr
      -- 
    cp_elements(268) <= cp_elements(259);
    cr_2185_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(268), ack => binary_442_inst_req_1); -- 
    -- CP-element group 269 transition  input  no-bypass 
    -- predecessors 267 
    -- successors 266 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_sample_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Sample/$exit
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Sample/ra
      -- 
    ra_2181_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_442_inst_ack_0, ack => cp_elements(269)); -- 
    -- CP-element group 270 transition  input  no-bypass 
    -- predecessors 268 
    -- successors 266 
    -- members (3) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_update_completed_
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Update/$exit
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/binary_442_Update/ca
      -- 
    ca_2186_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => binary_442_inst_ack_1, ack => cp_elements(270)); -- 
    -- CP-element group 271 join  transition  bypass 
    -- predecessors 258 265 266 
    -- successors 4 
    -- members (1) 
      -- 	branch_block_stmt_282/assign_stmt_437_to_assign_stmt_443/$exit
      -- 
    cpelement_group_271 : Block -- 
      signal predecessors: BooleanArray(2 downto 0);
      -- 
    begin -- 
      predecessors(0) <= cp_elements(258);
      predecessors(1) <= cp_elements(265);
      predecessors(2) <= cp_elements(266);
      jNoI: join -- 
        generic map(place_capacity => 1,
        bypass => true,
        name => " cp_elements(271)_join")
        port map( -- 
          preds => predecessors,
          symbol_out => cp_elements(271),
          clk => clk,
          reset => reset); -- 
      -- 
    end Block;
    -- CP-element group 272 transition  bypass 
    -- predecessors 4 
    -- successors 273 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_444_dead_link/$entry
      -- 
    cp_elements(272) <= cp_elements(4);
    -- CP-element group 273 transition  dead  bypass 
    -- predecessors 272 
    -- successors 274 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_444_dead_link/dead_transition
      -- 
    cp_elements(273) <= false;
    -- CP-element group 274 transition  place  bypass 
    -- predecessors 273 
    -- successors 
    -- members (5) 
      -- 	$exit
      -- 	branch_block_stmt_282/$exit
      -- 	branch_block_stmt_282/branch_block_stmt_282__exit__
      -- 	branch_block_stmt_282/if_stmt_444__exit__
      -- 	branch_block_stmt_282/if_stmt_444_dead_link/$exit
      -- 
    cp_elements(274) <= cp_elements(273);
    -- CP-element group 275 transition  output  bypass 
    -- predecessors 4 
    -- successors 276 
    -- members (3) 
      -- 	branch_block_stmt_282/if_stmt_444_eval_test/$entry
      -- 	branch_block_stmt_282/if_stmt_444_eval_test/$exit
      -- 	branch_block_stmt_282/if_stmt_444_eval_test/branch_req
      -- 
    cp_elements(275) <= cp_elements(4);
    branch_req_2194_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(275), ack => if_stmt_444_branch_req_0); -- 
    -- CP-element group 276 branch  place  bypass 
    -- predecessors 275 
    -- successors 277 279 
    -- members (1) 
      -- 	branch_block_stmt_282/simple_obj_ref_445_place
      -- 
    cp_elements(276) <= cp_elements(275);
    -- CP-element group 277 transition  bypass 
    -- predecessors 276 
    -- successors 278 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_444_if_link/$entry
      -- 
    cp_elements(277) <= cp_elements(276);
    -- CP-element group 278 transition  place  input  output  no-bypass 
    -- predecessors 277 
    -- successors 288 
    -- members (22) 
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/$entry
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/$entry
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/$entry
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/ack
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_req
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/$entry
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/req
      -- 	branch_block_stmt_282/merge_stmt_284__exit__
      -- 	branch_block_stmt_282/sendResultx_xexitx_xloopexit_sendResultx_xexitx_xbackedge
      -- 	branch_block_stmt_282/if_stmt_444_if_link/$exit
      -- 	branch_block_stmt_282/if_stmt_444_if_link/if_choice_transition
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_sendResultx_xexitx_xloopexit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_sendResultx_xexitx_xloopexit_PhiReq/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_sendResultx_xexitx_xloopexit_PhiReq/$exit
      -- 	branch_block_stmt_282/merge_stmt_284_PhiReqMerge
      -- 	branch_block_stmt_282/merge_stmt_284_PhiAck/$entry
      -- 	branch_block_stmt_282/merge_stmt_284_PhiAck/$exit
      -- 	branch_block_stmt_282/merge_stmt_284_PhiAck/dummy
      -- 
    if_choice_transition_2199_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_444_branch_ack_1, ack => cp_elements(278)); -- 
    phi_stmt_335_req_2282_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(278), ack => phi_stmt_335_req_1); -- 
    -- CP-element group 279 transition  bypass 
    -- predecessors 276 
    -- successors 280 
    -- members (1) 
      -- 	branch_block_stmt_282/if_stmt_444_else_link/$entry
      -- 
    cp_elements(279) <= cp_elements(276);
    -- CP-element group 280 transition  place  input  output  no-bypass 
    -- predecessors 279 
    -- successors 292 
    -- members (8) 
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/req
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/$entry
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/$entry
      -- 	branch_block_stmt_282/if_stmt_444_else_link/$exit
      -- 	branch_block_stmt_282/if_stmt_444_else_link/else_choice_transition
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit
      -- 
    else_choice_transition_2203_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => if_stmt_444_branch_ack_0, ack => cp_elements(280)); -- 
    req_2331_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(280), ack => type_cast_415_inst_req_0); -- 
    -- CP-element group 281 transition  input  output  no-bypass 
    -- predecessors 3 
    -- successors 282 
    -- members (6) 
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_req
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/ack
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/type_cast_293/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/phi_stmt_287_sources/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/phi_stmt_287/$exit
      -- 	branch_block_stmt_282/sendResultx_xexitx_xbackedge_sendResultx_xexit_PhiReq/$exit
      -- 
    ack_2242_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_293_inst_ack_0, ack => cp_elements(281)); -- 
    phi_stmt_287_req_2243_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(281), ack => phi_stmt_287_req_1); -- 
    -- CP-element group 282 merge  place  bypass 
    -- predecessors 281 0 
    -- successors 283 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_286_PhiReqMerge
      -- 
    cp_elements(282) <= OrReduce(cp_elements(281) & cp_elements(0));
    -- CP-element group 283 transition  bypass 
    -- predecessors 282 
    -- successors 284 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_286_PhiAck/$entry
      -- 
    cp_elements(283) <= cp_elements(282);
    -- CP-element group 284 transition  place  input  no-bypass 
    -- predecessors 283 
    -- successors 5 
    -- members (4) 
      -- 	branch_block_stmt_282/merge_stmt_286__exit__
      -- 	branch_block_stmt_282/assign_stmt_299_to_assign_stmt_304__entry__
      -- 	branch_block_stmt_282/merge_stmt_286_PhiAck/phi_stmt_287_ack
      -- 	branch_block_stmt_282/merge_stmt_286_PhiAck/$exit
      -- 
    phi_stmt_287_ack_2248_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_287_ack_0, ack => cp_elements(284)); -- 
    -- CP-element group 285 transition  dead  bypass 
    -- predecessors 59 
    -- successors 286 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_334_dead_link/dead_transition
      -- 
    cp_elements(285) <= false;
    -- CP-element group 286 transition  bypass 
    -- predecessors 285 
    -- successors 3 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_334_dead_link/$exit
      -- 
    cp_elements(286) <= cp_elements(285);
    -- CP-element group 287 transition  input  output  no-bypass 
    -- predecessors 65 
    -- successors 288 
    -- members (6) 
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_req
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/type_cast_338/ack
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/phi_stmt_335_sources/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/phi_stmt_335/$exit
      -- 	branch_block_stmt_282/sendResultx_xexit_sendResultx_xexitx_xbackedge_PhiReq/$exit
      -- 
    ack_2266_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_338_inst_ack_0, ack => cp_elements(287)); -- 
    phi_stmt_335_req_2267_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(287), ack => phi_stmt_335_req_0); -- 
    -- CP-element group 288 merge  place  bypass 
    -- predecessors 287 278 
    -- successors 289 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_334_PhiReqMerge
      -- 
    cp_elements(288) <= OrReduce(cp_elements(287) & cp_elements(278));
    -- CP-element group 289 transition  bypass 
    -- predecessors 288 
    -- successors 290 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_334_PhiAck/$entry
      -- 
    cp_elements(289) <= cp_elements(288);
    -- CP-element group 290 transition  input  no-bypass 
    -- predecessors 289 
    -- successors 3 
    -- members (2) 
      -- 	branch_block_stmt_282/merge_stmt_334_PhiAck/$exit
      -- 	branch_block_stmt_282/merge_stmt_334_PhiAck/phi_stmt_335_ack
      -- 
    phi_stmt_335_ack_2287_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_335_ack_0, ack => cp_elements(290)); -- 
    -- CP-element group 291 transition  place  input  no-bypass 
    -- predecessors 63 
    -- successors 71 
    -- members (6) 
      -- 	branch_block_stmt_282/do_while_stmt_353/do_while_stmt_353__entry__
      -- 	branch_block_stmt_282/do_while_stmt_353/$entry
      -- 	branch_block_stmt_282/merge_stmt_346_PhiAck/phi_stmt_347_ack
      -- 	branch_block_stmt_282/merge_stmt_346_PhiAck/$exit
      -- 	branch_block_stmt_282/merge_stmt_346__exit__
      -- 	branch_block_stmt_282/do_while_stmt_353__entry__
      -- 
    phi_stmt_347_ack_2310_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_347_ack_0, ack => cp_elements(291)); -- 
    -- CP-element group 292 transition  input  output  no-bypass 
    -- predecessors 280 
    -- successors 293 
    -- members (6) 
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_req
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/ack
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/type_cast_415/$exit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/phi_stmt_412_sources/$exit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/phi_stmt_412/$exit
      -- 	branch_block_stmt_282/x_vectorSum_x_xexit_x_vectorSum_x_xexit_PhiReq/$exit
      -- 
    ack_2332_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => type_cast_415_inst_ack_0, ack => cp_elements(292)); -- 
    phi_stmt_412_req_2333_symbol_link_to_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => cp_elements(292), ack => phi_stmt_412_req_0); -- 
    -- CP-element group 293 merge  place  bypass 
    -- predecessors 238 292 
    -- successors 294 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_411_PhiReqMerge
      -- 
    cp_elements(293) <= OrReduce(cp_elements(238) & cp_elements(292));
    -- CP-element group 294 transition  bypass 
    -- predecessors 293 
    -- successors 295 
    -- members (1) 
      -- 	branch_block_stmt_282/merge_stmt_411_PhiAck/$entry
      -- 
    cp_elements(294) <= cp_elements(293);
    -- CP-element group 295 transition  place  input  no-bypass 
    -- predecessors 294 
    -- successors 239 
    -- members (4) 
      -- 	branch_block_stmt_282/merge_stmt_411_PhiAck/$exit
      -- 	branch_block_stmt_282/merge_stmt_411_PhiAck/phi_stmt_412_ack
      -- 	branch_block_stmt_282/merge_stmt_411__exit__
      -- 	branch_block_stmt_282/assign_stmt_424_to_assign_stmt_428__entry__
      -- 
    phi_stmt_412_ack_2353_symbol_link_from_dp: control_delay_element -- 
      generic map (delay_value => 0)
      port map(clk => clk, reset => reset, req => phi_stmt_412_ack_0, ack => cp_elements(295)); -- 
    do_while_stmt_353_terminator_2026: loop_terminator -- 
      generic map (max_iterations_in_flight =>16) 
      port map(loop_body_exit => cp_elements(69),loop_continue => cp_elements(237),loop_terminate => cp_elements(235),loop_back => cp_elements(67),loop_exit => cp_elements(66),clk => clk, reset => reset); -- 
    phi_stmt_355_phi_seq_1633_block : block -- 
      signal reqs, selects : BooleanArray(0 to 1);
      signal enables : BooleanArray(0 to 0); -- 
    begin -- 
      selects(0)  <= cp_elements(75);
      cp_elements(73) <= reqs(0);
      selects(1)  <= cp_elements(78);
      cp_elements(76) <= reqs(1);
      enables(0)  <= cp_elements(82);
      phi_stmt_355_phi_seq_1633 : phi_sequencer -- 
        generic map (place_capacity => 16, nreqs => 2, nenables => 1, name => "phi_stmt_355_phi_seq_1633") 
        port map (selects => selects, reqs => reqs, enables => enables, ack => cp_elements(81), done => cp_elements(80), clk => clk, reset => reset);
        -- 
    end block;
    entry_tmerge_1619_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= cp_elements(70);
        preds(1)  <= cp_elements(71);
        entry_tmerge_1619 : transition_merge -- 
          port map (preds => preds, symbol_out => cp_elements(72));
          -- 
    end block;
    phi_stmt_355_req_merger_1634_block : block -- 
      signal preds : BooleanArray(0 to 1);
      begin -- 
        preds(0)  <= cp_elements(74);
        preds(1)  <= cp_elements(77);
        phi_stmt_355_req_merger_1634 : transition_merge -- 
          port map (preds => preds, symbol_out => cp_elements(79));
          -- 
    end block;
    -- 
  end Block; -- control-path
  -- the data path
  data_path: Block -- 
    signal array_obj_ref_297_final_offset : std_logic_vector(6 downto 0);
    signal array_obj_ref_297_offset_scale_factor_0 : std_logic_vector(6 downto 0);
    signal array_obj_ref_297_resized_base_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_297_root_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_302_final_offset : std_logic_vector(6 downto 0);
    signal array_obj_ref_302_offset_scale_factor_0 : std_logic_vector(6 downto 0);
    signal array_obj_ref_302_resized_base_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_302_root_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_363_final_offset : std_logic_vector(6 downto 0);
    signal array_obj_ref_363_offset_scale_factor_0 : std_logic_vector(6 downto 0);
    signal array_obj_ref_363_resized_base_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_363_root_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_368_final_offset : std_logic_vector(6 downto 0);
    signal array_obj_ref_368_offset_scale_factor_0 : std_logic_vector(6 downto 0);
    signal array_obj_ref_368_resized_base_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_368_root_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_373_final_offset : std_logic_vector(6 downto 0);
    signal array_obj_ref_373_offset_scale_factor_0 : std_logic_vector(6 downto 0);
    signal array_obj_ref_373_resized_base_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_373_root_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_422_final_offset : std_logic_vector(6 downto 0);
    signal array_obj_ref_422_offset_scale_factor_0 : std_logic_vector(6 downto 0);
    signal array_obj_ref_422_resized_base_address : std_logic_vector(6 downto 0);
    signal array_obj_ref_422_root_address : std_logic_vector(6 downto 0);
    signal exitcond1_404 : std_logic_vector(0 downto 0);
    signal exitcond_443 : std_logic_vector(0 downto 0);
    signal exitcondx_xi_327 : std_logic_vector(0 downto 0);
    signal iNsTr_10_379 : std_logic_vector(31 downto 0);
    signal iNsTr_11_383 : std_logic_vector(31 downto 0);
    signal iNsTr_12_388 : std_logic_vector(31 downto 0);
    signal iNsTr_16_428 : std_logic_vector(31 downto 0);
    signal iNsTr_19_437 : std_logic_vector(31 downto 0);
    signal iNsTr_2_307 : std_logic_vector(31 downto 0);
    signal iNsTr_5_321 : std_logic_vector(31 downto 0);
    signal idxx_x01x_xi4_412 : std_logic_vector(31 downto 0);
    signal idxx_x01x_xi_287 : std_logic_vector(31 downto 0);
    signal idxx_x01x_xix_xbe_335 : std_logic_vector(31 downto 0);
    signal indvarx_xi_355 : std_logic_vector(31 downto 0);
    signal indvarx_xi_at_entry_347 : std_logic_vector(31 downto 0);
    signal indvarx_xnextx_xi_398 : std_logic_vector(31 downto 0);
    signal ptr_deref_309_data_0 : std_logic_vector(31 downto 0);
    signal ptr_deref_309_resized_base_address : std_logic_vector(6 downto 0);
    signal ptr_deref_309_root_address : std_logic_vector(6 downto 0);
    signal ptr_deref_309_wire : std_logic_vector(31 downto 0);
    signal ptr_deref_309_word_address_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_309_word_offset_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_313_data_0 : std_logic_vector(31 downto 0);
    signal ptr_deref_313_resized_base_address : std_logic_vector(6 downto 0);
    signal ptr_deref_313_root_address : std_logic_vector(6 downto 0);
    signal ptr_deref_313_wire : std_logic_vector(31 downto 0);
    signal ptr_deref_313_word_address_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_313_word_offset_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_378_data_0 : std_logic_vector(31 downto 0);
    signal ptr_deref_378_resized_base_address : std_logic_vector(6 downto 0);
    signal ptr_deref_378_root_address : std_logic_vector(6 downto 0);
    signal ptr_deref_378_word_address_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_378_word_offset_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_382_data_0 : std_logic_vector(31 downto 0);
    signal ptr_deref_382_resized_base_address : std_logic_vector(6 downto 0);
    signal ptr_deref_382_root_address : std_logic_vector(6 downto 0);
    signal ptr_deref_382_word_address_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_382_word_offset_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_390_data_0 : std_logic_vector(31 downto 0);
    signal ptr_deref_390_resized_base_address : std_logic_vector(6 downto 0);
    signal ptr_deref_390_root_address : std_logic_vector(6 downto 0);
    signal ptr_deref_390_wire : std_logic_vector(31 downto 0);
    signal ptr_deref_390_word_address_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_390_word_offset_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_427_data_0 : std_logic_vector(31 downto 0);
    signal ptr_deref_427_resized_base_address : std_logic_vector(6 downto 0);
    signal ptr_deref_427_root_address : std_logic_vector(6 downto 0);
    signal ptr_deref_427_word_address_0 : std_logic_vector(6 downto 0);
    signal ptr_deref_427_word_offset_0 : std_logic_vector(6 downto 0);
    signal scevgep2x_xi2_370 : std_logic_vector(31 downto 0);
    signal scevgep2x_xi_304 : std_logic_vector(31 downto 0);
    signal scevgep3x_xi_375 : std_logic_vector(31 downto 0);
    signal scevgepx_xi1_365 : std_logic_vector(31 downto 0);
    signal scevgepx_xi5_424 : std_logic_vector(31 downto 0);
    signal scevgepx_xi_299 : std_logic_vector(31 downto 0);
    signal simple_obj_ref_296_resized : std_logic_vector(6 downto 0);
    signal simple_obj_ref_296_scaled : std_logic_vector(6 downto 0);
    signal simple_obj_ref_301_resized : std_logic_vector(6 downto 0);
    signal simple_obj_ref_301_scaled : std_logic_vector(6 downto 0);
    signal simple_obj_ref_362_resized : std_logic_vector(6 downto 0);
    signal simple_obj_ref_362_scaled : std_logic_vector(6 downto 0);
    signal simple_obj_ref_367_resized : std_logic_vector(6 downto 0);
    signal simple_obj_ref_367_scaled : std_logic_vector(6 downto 0);
    signal simple_obj_ref_372_resized : std_logic_vector(6 downto 0);
    signal simple_obj_ref_372_scaled : std_logic_vector(6 downto 0);
    signal simple_obj_ref_421_resized : std_logic_vector(6 downto 0);
    signal simple_obj_ref_421_scaled : std_logic_vector(6 downto 0);
    signal type_cast_291_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_293_wire : std_logic_vector(31 downto 0);
    signal type_cast_319_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_325_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_338_wire : std_logic_vector(31 downto 0);
    signal type_cast_341_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_351_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_358_wire : std_logic_vector(31 downto 0);
    signal type_cast_396_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_402_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_415_wire : std_logic_vector(31 downto 0);
    signal type_cast_418_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_435_wire_constant : std_logic_vector(31 downto 0);
    signal type_cast_441_wire_constant : std_logic_vector(31 downto 0);
    signal unary_407_wire : std_logic_vector(0 downto 0);
    -- 
  begin -- 
    array_obj_ref_297_offset_scale_factor_0 <= "0000001";
    array_obj_ref_297_resized_base_address <= "0000000";
    array_obj_ref_302_offset_scale_factor_0 <= "0000001";
    array_obj_ref_302_resized_base_address <= "0000000";
    array_obj_ref_363_offset_scale_factor_0 <= "0000001";
    array_obj_ref_363_resized_base_address <= "0000000";
    array_obj_ref_368_offset_scale_factor_0 <= "0000001";
    array_obj_ref_368_resized_base_address <= "0000000";
    array_obj_ref_373_offset_scale_factor_0 <= "0000001";
    array_obj_ref_373_resized_base_address <= "0000000";
    array_obj_ref_422_offset_scale_factor_0 <= "0000001";
    array_obj_ref_422_resized_base_address <= "0000000";
    ptr_deref_309_word_offset_0 <= "0000000";
    ptr_deref_313_word_offset_0 <= "0000000";
    ptr_deref_378_word_offset_0 <= "0000000";
    ptr_deref_382_word_offset_0 <= "0000000";
    ptr_deref_390_word_offset_0 <= "0000000";
    ptr_deref_427_word_offset_0 <= "0000000";
    type_cast_291_wire_constant <= "00000000000000000000000000000000";
    type_cast_319_wire_constant <= "00000000000000000000000000000001";
    type_cast_325_wire_constant <= "00000000000000000000000001000000";
    type_cast_341_wire_constant <= "00000000000000000000000000000000";
    type_cast_351_wire_constant <= "00000000000000000000000000000000";
    type_cast_396_wire_constant <= "00000000000000000000000000000001";
    type_cast_402_wire_constant <= "00000000000000000000000001000000";
    type_cast_418_wire_constant <= "00000000000000000000000000000000";
    type_cast_435_wire_constant <= "00000000000000000000000000000001";
    type_cast_441_wire_constant <= "00000000000000000000000001000000";
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_287_req_0," req0 phi_stmt_287");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_287_req_1," req1 phi_stmt_287");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_287_ack_0," ack0 phi_stmt_287");
    phi_stmt_287: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_291_wire_constant & type_cast_293_wire;
      req <= phi_stmt_287_req_0 & phi_stmt_287_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_287_ack_0,
          idata => idata,
          odata => idxx_x01x_xi_287,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_287
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_335_req_0," req0 phi_stmt_335");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_335_req_1," req1 phi_stmt_335");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_335_ack_0," ack0 phi_stmt_335");
    phi_stmt_335: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_338_wire & type_cast_341_wire_constant;
      req <= phi_stmt_335_req_0 & phi_stmt_335_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_335_ack_0,
          idata => idata,
          odata => idxx_x01x_xix_xbe_335,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_335
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_347_req_0," req0 phi_stmt_347");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_347_ack_0," ack0 phi_stmt_347");
    phi_stmt_347: Block -- phi operator 
      signal idata: std_logic_vector(31 downto 0);
      signal req: BooleanArray(0 downto 0);
      --
    begin -- 
      idata <= type_cast_351_wire_constant;
      req(0) <= phi_stmt_347_req_0;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 1,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_347_ack_0,
          idata => idata,
          odata => indvarx_xi_at_entry_347,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_347
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_355_req_0," req0 phi_stmt_355");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_355_req_1," req1 phi_stmt_355");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_355_ack_0," ack0 phi_stmt_355");
    phi_stmt_355: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_358_wire & indvarx_xi_at_entry_347;
      req <= phi_stmt_355_req_0 & phi_stmt_355_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_355_ack_0,
          idata => idata,
          odata => indvarx_xi_355,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_355
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_412_req_0," req0 phi_stmt_412");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_412_req_1," req1 phi_stmt_412");
    LogCPEvent(clk, reset, global_clock_cycle_count,phi_stmt_412_ack_0," ack0 phi_stmt_412");
    phi_stmt_412: Block -- phi operator 
      signal idata: std_logic_vector(63 downto 0);
      signal req: BooleanArray(1 downto 0);
      --
    begin -- 
      idata <= type_cast_415_wire & type_cast_418_wire_constant;
      req <= phi_stmt_412_req_0 & phi_stmt_412_req_1;
      phi: PhiBase -- 
        generic map( -- 
          num_reqs => 2,
          data_width => 32) -- 
        port map( -- 
          req => req, 
          ack => phi_stmt_412_ack_0,
          idata => idata,
          odata => idxx_x01x_xi4_412,
          clk => clk,
          reset => reset ); -- 
      -- 
    end Block; -- phi operator phi_stmt_412
    LogOperator(clk,reset,global_clock_cycle_count,addr_of_298_final_reg_req_0,addr_of_298_final_reg_ack_0,sl_one,"addr_of_298_final_reg ",false,array_obj_ref_297_root_address,
    false,scevgepx_xi_299);
    register_block_0 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= addr_of_298_final_reg_req_0;
      addr_of_298_final_reg_ack_0 <= ack; 
      addr_of_298_final_reg: RegisterBase --
        generic map(in_data_width => 7,out_data_width => 32) 
        port map( din => array_obj_ref_297_root_address, dout => scevgepx_xi_299, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,addr_of_303_final_reg_req_0,addr_of_303_final_reg_ack_0,sl_one,"addr_of_303_final_reg ",false,array_obj_ref_302_root_address,
    false,scevgep2x_xi_304);
    register_block_1 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= addr_of_303_final_reg_req_0;
      addr_of_303_final_reg_ack_0 <= ack; 
      addr_of_303_final_reg: RegisterBase --
        generic map(in_data_width => 7,out_data_width => 32) 
        port map( din => array_obj_ref_302_root_address, dout => scevgep2x_xi_304, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,addr_of_364_final_reg_req_0,addr_of_364_final_reg_ack_0,sl_one,"addr_of_364_final_reg ",false,array_obj_ref_363_root_address,
    false,scevgepx_xi1_365);
    register_block_2 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= addr_of_364_final_reg_req_0;
      addr_of_364_final_reg_ack_0 <= ack; 
      addr_of_364_final_reg: RegisterBase --
        generic map(in_data_width => 7,out_data_width => 32) 
        port map( din => array_obj_ref_363_root_address, dout => scevgepx_xi1_365, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,addr_of_369_final_reg_req_0,addr_of_369_final_reg_ack_0,sl_one,"addr_of_369_final_reg ",false,array_obj_ref_368_root_address,
    false,scevgep2x_xi2_370);
    register_block_3 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= addr_of_369_final_reg_req_0;
      addr_of_369_final_reg_ack_0 <= ack; 
      addr_of_369_final_reg: RegisterBase --
        generic map(in_data_width => 7,out_data_width => 32) 
        port map( din => array_obj_ref_368_root_address, dout => scevgep2x_xi2_370, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,addr_of_374_final_reg_req_0,addr_of_374_final_reg_ack_0,sl_one,"addr_of_374_final_reg ",false,array_obj_ref_373_root_address,
    false,scevgep3x_xi_375);
    register_block_4 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= addr_of_374_final_reg_req_0;
      addr_of_374_final_reg_ack_0 <= ack; 
      addr_of_374_final_reg: RegisterBase --
        generic map(in_data_width => 7,out_data_width => 32) 
        port map( din => array_obj_ref_373_root_address, dout => scevgep3x_xi_375, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,addr_of_423_final_reg_req_0,addr_of_423_final_reg_ack_0,sl_one,"addr_of_423_final_reg ",false,array_obj_ref_422_root_address,
    false,scevgepx_xi5_424);
    register_block_5 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= addr_of_423_final_reg_req_0;
      addr_of_423_final_reg_ack_0 <= ack; 
      addr_of_423_final_reg: RegisterBase --
        generic map(in_data_width => 7,out_data_width => 32) 
        port map( din => array_obj_ref_422_root_address, dout => scevgepx_xi5_424, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,type_cast_293_inst_req_0,type_cast_293_inst_ack_0,sl_one,"type_cast_293_inst ",false,idxx_x01x_xix_xbe_335,
    false,type_cast_293_wire);
    register_block_6 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= type_cast_293_inst_req_0;
      type_cast_293_inst_ack_0 <= ack; 
      type_cast_293_inst: RegisterBase --
        generic map(in_data_width => 32,out_data_width => 32) 
        port map( din => idxx_x01x_xix_xbe_335, dout => type_cast_293_wire, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,type_cast_338_inst_req_0,type_cast_338_inst_ack_0,sl_one,"type_cast_338_inst ",false,iNsTr_5_321,
    false,type_cast_338_wire);
    register_block_7 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= type_cast_338_inst_req_0;
      type_cast_338_inst_ack_0 <= ack; 
      type_cast_338_inst: RegisterBase --
        generic map(in_data_width => 32,out_data_width => 32) 
        port map( din => iNsTr_5_321, dout => type_cast_338_wire, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,type_cast_358_inst_req_0,type_cast_358_inst_ack_0,sl_one,"type_cast_358_inst ",false,indvarx_xnextx_xi_398,
    false,type_cast_358_wire);
    register_block_8 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= type_cast_358_inst_req_0;
      type_cast_358_inst_ack_0 <= ack; 
      type_cast_358_inst: RegisterBase --
        generic map(in_data_width => 32,out_data_width => 32) 
        port map( din => indvarx_xnextx_xi_398, dout => type_cast_358_wire, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,type_cast_415_inst_req_0,type_cast_415_inst_ack_0,sl_one,"type_cast_415_inst ",false,iNsTr_19_437,
    false,type_cast_415_wire);
    register_block_9 : block -- 
      signal req, ack: boolean; --
    begin -- 
      req <= type_cast_415_inst_req_0;
      type_cast_415_inst_ack_0 <= ack; 
      type_cast_415_inst: RegisterBase --
        generic map(in_data_width => 32,out_data_width => 32) 
        port map( din => iNsTr_19_437, dout => type_cast_415_wire, req => req,  ack => ack,  clk => clk, reset => reset); -- 
      -- 
    end block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_297_index_0_rename_req_0,array_obj_ref_297_index_0_rename_ack_0,sl_one,"array_obj_ref_297_index_0_rename ",false,simple_obj_ref_296_resized,
    false,simple_obj_ref_296_scaled);
    array_obj_ref_297_index_0_rename: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_297_index_0_rename_ack_0 <= array_obj_ref_297_index_0_rename_req_0;
      in_aggregated_sig <= simple_obj_ref_296_resized;
      out_aggregated_sig <= in_aggregated_sig;
      simple_obj_ref_296_scaled <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_297_index_0_resize_req_0,array_obj_ref_297_index_0_resize_ack_0,sl_one,"array_obj_ref_297_index_0_resize ",false,idxx_x01x_xi_287,
    false,simple_obj_ref_296_resized);
    array_obj_ref_297_index_0_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_297_index_0_resize_ack_0 <= array_obj_ref_297_index_0_resize_req_0;
      in_aggregated_sig <= idxx_x01x_xi_287;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      simple_obj_ref_296_resized <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_297_offset_inst_req_0,array_obj_ref_297_offset_inst_ack_0,sl_one,"array_obj_ref_297_offset_inst ",false,simple_obj_ref_296_scaled,
    false,array_obj_ref_297_final_offset);
    array_obj_ref_297_offset_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_297_offset_inst_ack_0 <= array_obj_ref_297_offset_inst_req_0;
      in_aggregated_sig <= simple_obj_ref_296_scaled;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_297_final_offset <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_297_root_address_inst_req_0,array_obj_ref_297_root_address_inst_ack_0,sl_one,"array_obj_ref_297_root_address_inst ",false,array_obj_ref_297_final_offset,
    false,array_obj_ref_297_root_address);
    array_obj_ref_297_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_297_root_address_inst_ack_0 <= array_obj_ref_297_root_address_inst_req_0;
      in_aggregated_sig <= array_obj_ref_297_final_offset;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_297_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_302_index_0_rename_req_0,array_obj_ref_302_index_0_rename_ack_0,sl_one,"array_obj_ref_302_index_0_rename ",false,simple_obj_ref_301_resized,
    false,simple_obj_ref_301_scaled);
    array_obj_ref_302_index_0_rename: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_302_index_0_rename_ack_0 <= array_obj_ref_302_index_0_rename_req_0;
      in_aggregated_sig <= simple_obj_ref_301_resized;
      out_aggregated_sig <= in_aggregated_sig;
      simple_obj_ref_301_scaled <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_302_index_0_resize_req_0,array_obj_ref_302_index_0_resize_ack_0,sl_one,"array_obj_ref_302_index_0_resize ",false,idxx_x01x_xi_287,
    false,simple_obj_ref_301_resized);
    array_obj_ref_302_index_0_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_302_index_0_resize_ack_0 <= array_obj_ref_302_index_0_resize_req_0;
      in_aggregated_sig <= idxx_x01x_xi_287;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      simple_obj_ref_301_resized <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_302_offset_inst_req_0,array_obj_ref_302_offset_inst_ack_0,sl_one,"array_obj_ref_302_offset_inst ",false,simple_obj_ref_301_scaled,
    false,array_obj_ref_302_final_offset);
    array_obj_ref_302_offset_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_302_offset_inst_ack_0 <= array_obj_ref_302_offset_inst_req_0;
      in_aggregated_sig <= simple_obj_ref_301_scaled;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_302_final_offset <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_302_root_address_inst_req_0,array_obj_ref_302_root_address_inst_ack_0,sl_one,"array_obj_ref_302_root_address_inst ",false,array_obj_ref_302_final_offset,
    false,array_obj_ref_302_root_address);
    array_obj_ref_302_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_302_root_address_inst_ack_0 <= array_obj_ref_302_root_address_inst_req_0;
      in_aggregated_sig <= array_obj_ref_302_final_offset;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_302_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_363_index_0_rename_req_0,array_obj_ref_363_index_0_rename_ack_0,sl_one,"array_obj_ref_363_index_0_rename ",false,simple_obj_ref_362_resized,
    false,simple_obj_ref_362_scaled);
    array_obj_ref_363_index_0_rename: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_363_index_0_rename_ack_0 <= array_obj_ref_363_index_0_rename_req_0;
      in_aggregated_sig <= simple_obj_ref_362_resized;
      out_aggregated_sig <= in_aggregated_sig;
      simple_obj_ref_362_scaled <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_363_index_0_resize_req_0,array_obj_ref_363_index_0_resize_ack_0,sl_one,"array_obj_ref_363_index_0_resize ",false,indvarx_xi_355,
    false,simple_obj_ref_362_resized);
    array_obj_ref_363_index_0_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_363_index_0_resize_ack_0 <= array_obj_ref_363_index_0_resize_req_0;
      in_aggregated_sig <= indvarx_xi_355;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      simple_obj_ref_362_resized <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_363_offset_inst_req_0,array_obj_ref_363_offset_inst_ack_0,sl_one,"array_obj_ref_363_offset_inst ",false,simple_obj_ref_362_scaled,
    false,array_obj_ref_363_final_offset);
    array_obj_ref_363_offset_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_363_offset_inst_ack_0 <= array_obj_ref_363_offset_inst_req_0;
      in_aggregated_sig <= simple_obj_ref_362_scaled;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_363_final_offset <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_363_root_address_inst_req_0,array_obj_ref_363_root_address_inst_ack_0,sl_one,"array_obj_ref_363_root_address_inst ",false,array_obj_ref_363_final_offset,
    false,array_obj_ref_363_root_address);
    array_obj_ref_363_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_363_root_address_inst_ack_0 <= array_obj_ref_363_root_address_inst_req_0;
      in_aggregated_sig <= array_obj_ref_363_final_offset;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_363_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_368_index_0_rename_req_0,array_obj_ref_368_index_0_rename_ack_0,sl_one,"array_obj_ref_368_index_0_rename ",false,simple_obj_ref_367_resized,
    false,simple_obj_ref_367_scaled);
    array_obj_ref_368_index_0_rename: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_368_index_0_rename_ack_0 <= array_obj_ref_368_index_0_rename_req_0;
      in_aggregated_sig <= simple_obj_ref_367_resized;
      out_aggregated_sig <= in_aggregated_sig;
      simple_obj_ref_367_scaled <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_368_index_0_resize_req_0,array_obj_ref_368_index_0_resize_ack_0,sl_one,"array_obj_ref_368_index_0_resize ",false,indvarx_xi_355,
    false,simple_obj_ref_367_resized);
    array_obj_ref_368_index_0_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_368_index_0_resize_ack_0 <= array_obj_ref_368_index_0_resize_req_0;
      in_aggregated_sig <= indvarx_xi_355;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      simple_obj_ref_367_resized <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_368_offset_inst_req_0,array_obj_ref_368_offset_inst_ack_0,sl_one,"array_obj_ref_368_offset_inst ",false,simple_obj_ref_367_scaled,
    false,array_obj_ref_368_final_offset);
    array_obj_ref_368_offset_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_368_offset_inst_ack_0 <= array_obj_ref_368_offset_inst_req_0;
      in_aggregated_sig <= simple_obj_ref_367_scaled;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_368_final_offset <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_368_root_address_inst_req_0,array_obj_ref_368_root_address_inst_ack_0,sl_one,"array_obj_ref_368_root_address_inst ",false,array_obj_ref_368_final_offset,
    false,array_obj_ref_368_root_address);
    array_obj_ref_368_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_368_root_address_inst_ack_0 <= array_obj_ref_368_root_address_inst_req_0;
      in_aggregated_sig <= array_obj_ref_368_final_offset;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_368_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_373_index_0_rename_req_0,array_obj_ref_373_index_0_rename_ack_0,sl_one,"array_obj_ref_373_index_0_rename ",false,simple_obj_ref_372_resized,
    false,simple_obj_ref_372_scaled);
    array_obj_ref_373_index_0_rename: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_373_index_0_rename_ack_0 <= array_obj_ref_373_index_0_rename_req_0;
      in_aggregated_sig <= simple_obj_ref_372_resized;
      out_aggregated_sig <= in_aggregated_sig;
      simple_obj_ref_372_scaled <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_373_index_0_resize_req_0,array_obj_ref_373_index_0_resize_ack_0,sl_one,"array_obj_ref_373_index_0_resize ",false,indvarx_xi_355,
    false,simple_obj_ref_372_resized);
    array_obj_ref_373_index_0_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_373_index_0_resize_ack_0 <= array_obj_ref_373_index_0_resize_req_0;
      in_aggregated_sig <= indvarx_xi_355;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      simple_obj_ref_372_resized <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_373_offset_inst_req_0,array_obj_ref_373_offset_inst_ack_0,sl_one,"array_obj_ref_373_offset_inst ",false,simple_obj_ref_372_scaled,
    false,array_obj_ref_373_final_offset);
    array_obj_ref_373_offset_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_373_offset_inst_ack_0 <= array_obj_ref_373_offset_inst_req_0;
      in_aggregated_sig <= simple_obj_ref_372_scaled;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_373_final_offset <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_373_root_address_inst_req_0,array_obj_ref_373_root_address_inst_ack_0,sl_one,"array_obj_ref_373_root_address_inst ",false,array_obj_ref_373_final_offset,
    false,array_obj_ref_373_root_address);
    array_obj_ref_373_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_373_root_address_inst_ack_0 <= array_obj_ref_373_root_address_inst_req_0;
      in_aggregated_sig <= array_obj_ref_373_final_offset;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_373_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_422_index_0_rename_req_0,array_obj_ref_422_index_0_rename_ack_0,sl_one,"array_obj_ref_422_index_0_rename ",false,simple_obj_ref_421_resized,
    false,simple_obj_ref_421_scaled);
    array_obj_ref_422_index_0_rename: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_422_index_0_rename_ack_0 <= array_obj_ref_422_index_0_rename_req_0;
      in_aggregated_sig <= simple_obj_ref_421_resized;
      out_aggregated_sig <= in_aggregated_sig;
      simple_obj_ref_421_scaled <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_422_index_0_resize_req_0,array_obj_ref_422_index_0_resize_ack_0,sl_one,"array_obj_ref_422_index_0_resize ",false,idxx_x01x_xi4_412,
    false,simple_obj_ref_421_resized);
    array_obj_ref_422_index_0_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_422_index_0_resize_ack_0 <= array_obj_ref_422_index_0_resize_req_0;
      in_aggregated_sig <= idxx_x01x_xi4_412;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      simple_obj_ref_421_resized <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_422_offset_inst_req_0,array_obj_ref_422_offset_inst_ack_0,sl_one,"array_obj_ref_422_offset_inst ",false,simple_obj_ref_421_scaled,
    false,array_obj_ref_422_final_offset);
    array_obj_ref_422_offset_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_422_offset_inst_ack_0 <= array_obj_ref_422_offset_inst_req_0;
      in_aggregated_sig <= simple_obj_ref_421_scaled;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_422_final_offset <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,array_obj_ref_422_root_address_inst_req_0,array_obj_ref_422_root_address_inst_ack_0,sl_one,"array_obj_ref_422_root_address_inst ",false,array_obj_ref_422_final_offset,
    false,array_obj_ref_422_root_address);
    array_obj_ref_422_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      array_obj_ref_422_root_address_inst_ack_0 <= array_obj_ref_422_root_address_inst_req_0;
      in_aggregated_sig <= array_obj_ref_422_final_offset;
      out_aggregated_sig <= in_aggregated_sig;
      array_obj_ref_422_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_309_addr_0_req_0,ptr_deref_309_addr_0_ack_0,sl_one,"ptr_deref_309_addr_0 ",false,ptr_deref_309_root_address,
    false,ptr_deref_309_word_address_0);
    ptr_deref_309_addr_0: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_309_addr_0_ack_0 <= ptr_deref_309_addr_0_req_0;
      in_aggregated_sig <= ptr_deref_309_root_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_309_word_address_0 <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_309_base_resize_req_0,ptr_deref_309_base_resize_ack_0,sl_one,"ptr_deref_309_base_resize ",false,scevgepx_xi_299,
    false,ptr_deref_309_resized_base_address);
    ptr_deref_309_base_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_309_base_resize_ack_0 <= ptr_deref_309_base_resize_req_0;
      in_aggregated_sig <= scevgepx_xi_299;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      ptr_deref_309_resized_base_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_309_gather_scatter_req_0,ptr_deref_309_gather_scatter_ack_0,sl_one,"ptr_deref_309_gather_scatter ",false,iNsTr_2_307,
    false,ptr_deref_309_data_0);
    ptr_deref_309_gather_scatter: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(31 downto 0);
      --
    begin -- 
      ptr_deref_309_gather_scatter_ack_0 <= ptr_deref_309_gather_scatter_req_0;
      in_aggregated_sig <= iNsTr_2_307;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_309_data_0 <= out_aggregated_sig(31 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_309_root_address_inst_req_0,ptr_deref_309_root_address_inst_ack_0,sl_one,"ptr_deref_309_root_address_inst ",false,ptr_deref_309_resized_base_address,
    false,ptr_deref_309_root_address);
    ptr_deref_309_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_309_root_address_inst_ack_0 <= ptr_deref_309_root_address_inst_req_0;
      in_aggregated_sig <= ptr_deref_309_resized_base_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_309_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_313_addr_0_req_0,ptr_deref_313_addr_0_ack_0,sl_one,"ptr_deref_313_addr_0 ",false,ptr_deref_313_root_address,
    false,ptr_deref_313_word_address_0);
    ptr_deref_313_addr_0: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_313_addr_0_ack_0 <= ptr_deref_313_addr_0_req_0;
      in_aggregated_sig <= ptr_deref_313_root_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_313_word_address_0 <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_313_base_resize_req_0,ptr_deref_313_base_resize_ack_0,sl_one,"ptr_deref_313_base_resize ",false,scevgep2x_xi_304,
    false,ptr_deref_313_resized_base_address);
    ptr_deref_313_base_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_313_base_resize_ack_0 <= ptr_deref_313_base_resize_req_0;
      in_aggregated_sig <= scevgep2x_xi_304;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      ptr_deref_313_resized_base_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_313_gather_scatter_req_0,ptr_deref_313_gather_scatter_ack_0,sl_one,"ptr_deref_313_gather_scatter ",false,iNsTr_2_307,
    false,ptr_deref_313_data_0);
    ptr_deref_313_gather_scatter: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(31 downto 0);
      --
    begin -- 
      ptr_deref_313_gather_scatter_ack_0 <= ptr_deref_313_gather_scatter_req_0;
      in_aggregated_sig <= iNsTr_2_307;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_313_data_0 <= out_aggregated_sig(31 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_313_root_address_inst_req_0,ptr_deref_313_root_address_inst_ack_0,sl_one,"ptr_deref_313_root_address_inst ",false,ptr_deref_313_resized_base_address,
    false,ptr_deref_313_root_address);
    ptr_deref_313_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_313_root_address_inst_ack_0 <= ptr_deref_313_root_address_inst_req_0;
      in_aggregated_sig <= ptr_deref_313_resized_base_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_313_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_378_addr_0_req_0,ptr_deref_378_addr_0_ack_0,sl_one,"ptr_deref_378_addr_0 ",false,ptr_deref_378_root_address,
    false,ptr_deref_378_word_address_0);
    ptr_deref_378_addr_0: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_378_addr_0_ack_0 <= ptr_deref_378_addr_0_req_0;
      in_aggregated_sig <= ptr_deref_378_root_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_378_word_address_0 <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_378_base_resize_req_0,ptr_deref_378_base_resize_ack_0,sl_one,"ptr_deref_378_base_resize ",false,scevgepx_xi1_365,
    false,ptr_deref_378_resized_base_address);
    ptr_deref_378_base_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_378_base_resize_ack_0 <= ptr_deref_378_base_resize_req_0;
      in_aggregated_sig <= scevgepx_xi1_365;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      ptr_deref_378_resized_base_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_378_gather_scatter_req_0,ptr_deref_378_gather_scatter_ack_0,sl_one,"ptr_deref_378_gather_scatter ",false,ptr_deref_378_data_0,
    false,iNsTr_10_379);
    ptr_deref_378_gather_scatter: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(31 downto 0);
      --
    begin -- 
      ptr_deref_378_gather_scatter_ack_0 <= ptr_deref_378_gather_scatter_req_0;
      in_aggregated_sig <= ptr_deref_378_data_0;
      out_aggregated_sig <= in_aggregated_sig;
      iNsTr_10_379 <= out_aggregated_sig(31 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_378_root_address_inst_req_0,ptr_deref_378_root_address_inst_ack_0,sl_one,"ptr_deref_378_root_address_inst ",false,ptr_deref_378_resized_base_address,
    false,ptr_deref_378_root_address);
    ptr_deref_378_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_378_root_address_inst_ack_0 <= ptr_deref_378_root_address_inst_req_0;
      in_aggregated_sig <= ptr_deref_378_resized_base_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_378_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_382_addr_0_req_0,ptr_deref_382_addr_0_ack_0,sl_one,"ptr_deref_382_addr_0 ",false,ptr_deref_382_root_address,
    false,ptr_deref_382_word_address_0);
    ptr_deref_382_addr_0: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_382_addr_0_ack_0 <= ptr_deref_382_addr_0_req_0;
      in_aggregated_sig <= ptr_deref_382_root_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_382_word_address_0 <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_382_base_resize_req_0,ptr_deref_382_base_resize_ack_0,sl_one,"ptr_deref_382_base_resize ",false,scevgep2x_xi2_370,
    false,ptr_deref_382_resized_base_address);
    ptr_deref_382_base_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_382_base_resize_ack_0 <= ptr_deref_382_base_resize_req_0;
      in_aggregated_sig <= scevgep2x_xi2_370;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      ptr_deref_382_resized_base_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_382_gather_scatter_req_0,ptr_deref_382_gather_scatter_ack_0,sl_one,"ptr_deref_382_gather_scatter ",false,ptr_deref_382_data_0,
    false,iNsTr_11_383);
    ptr_deref_382_gather_scatter: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(31 downto 0);
      --
    begin -- 
      ptr_deref_382_gather_scatter_ack_0 <= ptr_deref_382_gather_scatter_req_0;
      in_aggregated_sig <= ptr_deref_382_data_0;
      out_aggregated_sig <= in_aggregated_sig;
      iNsTr_11_383 <= out_aggregated_sig(31 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_382_root_address_inst_req_0,ptr_deref_382_root_address_inst_ack_0,sl_one,"ptr_deref_382_root_address_inst ",false,ptr_deref_382_resized_base_address,
    false,ptr_deref_382_root_address);
    ptr_deref_382_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_382_root_address_inst_ack_0 <= ptr_deref_382_root_address_inst_req_0;
      in_aggregated_sig <= ptr_deref_382_resized_base_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_382_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_390_addr_0_req_0,ptr_deref_390_addr_0_ack_0,sl_one,"ptr_deref_390_addr_0 ",false,ptr_deref_390_root_address,
    false,ptr_deref_390_word_address_0);
    ptr_deref_390_addr_0: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_390_addr_0_ack_0 <= ptr_deref_390_addr_0_req_0;
      in_aggregated_sig <= ptr_deref_390_root_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_390_word_address_0 <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_390_base_resize_req_0,ptr_deref_390_base_resize_ack_0,sl_one,"ptr_deref_390_base_resize ",false,scevgep3x_xi_375,
    false,ptr_deref_390_resized_base_address);
    ptr_deref_390_base_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_390_base_resize_ack_0 <= ptr_deref_390_base_resize_req_0;
      in_aggregated_sig <= scevgep3x_xi_375;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      ptr_deref_390_resized_base_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_390_gather_scatter_req_0,ptr_deref_390_gather_scatter_ack_0,sl_one,"ptr_deref_390_gather_scatter ",false,iNsTr_12_388,
    false,ptr_deref_390_data_0);
    ptr_deref_390_gather_scatter: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(31 downto 0);
      --
    begin -- 
      ptr_deref_390_gather_scatter_ack_0 <= ptr_deref_390_gather_scatter_req_0;
      in_aggregated_sig <= iNsTr_12_388;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_390_data_0 <= out_aggregated_sig(31 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_390_root_address_inst_req_0,ptr_deref_390_root_address_inst_ack_0,sl_one,"ptr_deref_390_root_address_inst ",false,ptr_deref_390_resized_base_address,
    false,ptr_deref_390_root_address);
    ptr_deref_390_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_390_root_address_inst_ack_0 <= ptr_deref_390_root_address_inst_req_0;
      in_aggregated_sig <= ptr_deref_390_resized_base_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_390_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_427_addr_0_req_0,ptr_deref_427_addr_0_ack_0,sl_one,"ptr_deref_427_addr_0 ",false,ptr_deref_427_root_address,
    false,ptr_deref_427_word_address_0);
    ptr_deref_427_addr_0: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_427_addr_0_ack_0 <= ptr_deref_427_addr_0_req_0;
      in_aggregated_sig <= ptr_deref_427_root_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_427_word_address_0 <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_427_base_resize_req_0,ptr_deref_427_base_resize_ack_0,sl_one,"ptr_deref_427_base_resize ",false,scevgepx_xi5_424,
    false,ptr_deref_427_resized_base_address);
    ptr_deref_427_base_resize: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_427_base_resize_ack_0 <= ptr_deref_427_base_resize_req_0;
      in_aggregated_sig <= scevgepx_xi5_424;
      out_aggregated_sig <= in_aggregated_sig(6 downto 0);
      ptr_deref_427_resized_base_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_427_gather_scatter_req_0,ptr_deref_427_gather_scatter_ack_0,sl_one,"ptr_deref_427_gather_scatter ",false,ptr_deref_427_data_0,
    false,iNsTr_16_428);
    ptr_deref_427_gather_scatter: Block -- 
      signal in_aggregated_sig: std_logic_vector(31 downto 0);
      signal out_aggregated_sig: std_logic_vector(31 downto 0);
      --
    begin -- 
      ptr_deref_427_gather_scatter_ack_0 <= ptr_deref_427_gather_scatter_req_0;
      in_aggregated_sig <= ptr_deref_427_data_0;
      out_aggregated_sig <= in_aggregated_sig;
      iNsTr_16_428 <= out_aggregated_sig(31 downto 0);
      --
    end Block;
    LogOperator(clk,reset,global_clock_cycle_count,ptr_deref_427_root_address_inst_req_0,ptr_deref_427_root_address_inst_ack_0,sl_one,"ptr_deref_427_root_address_inst ",false,ptr_deref_427_resized_base_address,
    false,ptr_deref_427_root_address);
    ptr_deref_427_root_address_inst: Block -- 
      signal in_aggregated_sig: std_logic_vector(6 downto 0);
      signal out_aggregated_sig: std_logic_vector(6 downto 0);
      --
    begin -- 
      ptr_deref_427_root_address_inst_ack_0 <= ptr_deref_427_root_address_inst_req_0;
      in_aggregated_sig <= ptr_deref_427_resized_base_address;
      out_aggregated_sig <= in_aggregated_sig;
      ptr_deref_427_root_address <= out_aggregated_sig(6 downto 0);
      --
    end Block;
    LogCPEvent(clk, reset, global_clock_cycle_count,do_while_stmt_353_branch_req_0," req0 do_while_stmt_353_branch");
    LogCPEvent(clk, reset, global_clock_cycle_count,do_while_stmt_353_branch_ack_0," ack0 do_while_stmt_353_branch");
    LogCPEvent(clk, reset, global_clock_cycle_count,do_while_stmt_353_branch_ack_1," ack1 do_while_stmt_353_branch");
    do_while_stmt_353_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= unary_407_wire;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => do_while_stmt_353_branch_req_0,
          ack0 => do_while_stmt_353_branch_ack_0,
          ack1 => do_while_stmt_353_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    LogCPEvent(clk, reset, global_clock_cycle_count,if_stmt_328_branch_req_0," req0 if_stmt_328_branch");
    LogCPEvent(clk, reset, global_clock_cycle_count,if_stmt_328_branch_ack_0," ack0 if_stmt_328_branch");
    LogCPEvent(clk, reset, global_clock_cycle_count,if_stmt_328_branch_ack_1," ack1 if_stmt_328_branch");
    if_stmt_328_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= exitcondx_xi_327;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_328_branch_req_0,
          ack0 => if_stmt_328_branch_ack_0,
          ack1 => if_stmt_328_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    LogCPEvent(clk, reset, global_clock_cycle_count,if_stmt_444_branch_req_0," req0 if_stmt_444_branch");
    LogCPEvent(clk, reset, global_clock_cycle_count,if_stmt_444_branch_ack_0," ack0 if_stmt_444_branch");
    LogCPEvent(clk, reset, global_clock_cycle_count,if_stmt_444_branch_ack_1," ack1 if_stmt_444_branch");
    if_stmt_444_branch: Block -- 
      -- branch-block
      signal condition_sig : std_logic_vector(0 downto 0);
      begin 
      condition_sig <= exitcond_443;
      branch_instance: BranchBase -- 
        generic map( condition_width => 1)
        port map( -- 
          condition => condition_sig,
          req => if_stmt_444_branch_req_0,
          ack0 => if_stmt_444_branch_ack_0,
          ack1 => if_stmt_444_branch_ack_1,
          clk => clk,
          reset => reset); -- 
      --
    end Block; -- branch-block
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_320_inst_req_0,binary_320_inst_ack_0,binary_320_inst_req_1,binary_320_inst_ack_1,sl_one,"binary_320_inst",false,idxx_x01x_xi_287 & type_cast_319_wire_constant,
    false,iNsTr_5_321);
    -- shared split operator group (0) : binary_320_inst 
    ApIntAdd_group_0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := ( 0 => 1);
      -- 
    begin -- 
      data_in <= idxx_x01x_xi_287;
      iNsTr_5_321 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= binary_320_inst_req_0;
      reqR(0) <= binary_320_inst_req_1;
      binary_320_inst_ack_0 <= ackL(0); 
      binary_320_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
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
          owidth => 32,
          constant_operand => "00000000000000000000000000000001",
          constant_width => 32,
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
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_326_inst_req_0,binary_326_inst_ack_0,binary_326_inst_req_1,binary_326_inst_ack_1,sl_one,"binary_326_inst",false,iNsTr_5_321 & type_cast_325_wire_constant,
    false,exitcondx_xi_327);
    -- shared split operator group (1) : binary_326_inst 
    ApIntEq_group_1: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      data_in <= iNsTr_5_321;
      exitcondx_xi_327 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= binary_326_inst_req_0;
      reqR(0) <= binary_326_inst_req_1;
      binary_326_inst_ack_0 <= ackL(0); 
      binary_326_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
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
          constant_operand => "00000000000000000000000001000000",
          constant_width => 32,
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
    end Block; -- split operator group 1
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_387_inst_req_0,binary_387_inst_ack_0,binary_387_inst_req_1,binary_387_inst_ack_1,sl_one,"binary_387_inst",false,iNsTr_10_379 & iNsTr_11_383,
    false,iNsTr_12_388);
    -- shared split operator group (2) : binary_387_inst 
    ApFloatAdd_group_2: Block -- 
      signal data_in: std_logic_vector(63 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      data_in <= iNsTr_10_379 & iNsTr_11_383;
      iNsTr_12_388 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL_unguarded(0) <= binary_387_inst_req_0;
      binary_387_inst_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= binary_387_inst_req_1;
      binary_387_inst_ack_1 <= ackR_unguarded(0);
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 4) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      PipedFpOp: PipelinedFPOperator -- 
        generic map( -- 
          name => "ApFloatAdd_group_2",
          operator_id => "ApFloatAdd",
          exponent_width => 8,
          fraction_width => 23, 
          no_arbitration => false,
          num_reqs => 1, detailed_buffering_per_output => buffering_per_output -- 
        )
        port map ( reqL => reqL , ackL => ackL, reqR => reqR, ackR => ackR, dataL => data_in, dataR => data_out, clk => clk, reset => reset); -- 
      -- 
    end Block; -- split operator group 2
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_397_inst_req_0,binary_397_inst_ack_0,binary_397_inst_req_1,binary_397_inst_ack_1,sl_one,"binary_397_inst",false,indvarx_xi_355 & type_cast_396_wire_constant,
    false,indvarx_xnextx_xi_398);
    -- shared split operator group (3) : binary_397_inst 
    ApIntAdd_group_3: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      data_in <= indvarx_xi_355;
      indvarx_xnextx_xi_398 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= binary_397_inst_req_0;
      reqR(0) <= binary_397_inst_req_1;
      binary_397_inst_ack_0 <= ackL(0); 
      binary_397_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
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
          owidth => 32,
          constant_operand => "00000000000000000000000000000001",
          constant_width => 32,
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
    end Block; -- split operator group 3
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_403_inst_req_0,binary_403_inst_ack_0,binary_403_inst_req_1,binary_403_inst_ack_1,sl_one,"binary_403_inst",false,indvarx_xnextx_xi_398 & type_cast_402_wire_constant,
    false,exitcond1_404);
    -- shared split operator group (4) : binary_403_inst 
    ApIntEq_group_4: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      data_in <= indvarx_xnextx_xi_398;
      exitcond1_404 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= binary_403_inst_req_0;
      reqR(0) <= binary_403_inst_req_1;
      binary_403_inst_ack_0 <= ackL(0); 
      binary_403_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
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
          constant_operand => "00000000000000000000000001000000",
          constant_width => 32,
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
    end Block; -- split operator group 4
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_436_inst_req_0,binary_436_inst_ack_0,binary_436_inst_req_1,binary_436_inst_ack_1,sl_one,"binary_436_inst",false,idxx_x01x_xi4_412 & type_cast_435_wire_constant,
    false,iNsTr_19_437);
    -- shared split operator group (5) : binary_436_inst 
    ApIntAdd_group_5: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := ( 0 => 1);
      -- 
    begin -- 
      data_in <= idxx_x01x_xi4_412;
      iNsTr_19_437 <= data_out(31 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= binary_436_inst_req_0;
      reqR(0) <= binary_436_inst_req_1;
      binary_436_inst_ack_0 <= ackL(0); 
      binary_436_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntAdd",
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
          owidth => 32,
          constant_operand => "00000000000000000000000000000001",
          constant_width => 32,
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
    end Block; -- split operator group 5
    LogSplitOperator(clk,reset,global_clock_cycle_count,binary_442_inst_req_0,binary_442_inst_ack_0,binary_442_inst_req_1,binary_442_inst_ack_1,sl_one,"binary_442_inst",false,iNsTr_19_437 & type_cast_441_wire_constant,
    false,exitcond_443);
    -- shared split operator group (6) : binary_442_inst 
    ApIntEq_group_6: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := ( 0 => 1);
      -- 
    begin -- 
      data_in <= iNsTr_19_437;
      exitcond_443 <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= binary_442_inst_req_0;
      reqR(0) <= binary_442_inst_req_1;
      binary_442_inst_ack_0 <= ackL(0); 
      binary_442_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntEq",
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
          constant_operand => "00000000000000000000000001000000",
          constant_width => 32,
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
    end Block; -- split operator group 6
    LogSplitOperator(clk,reset,global_clock_cycle_count,unary_407_inst_req_0,unary_407_inst_ack_0,unary_407_inst_req_1,unary_407_inst_ack_1,sl_one,"unary_407_inst",false,exitcond1_404,
    false,unary_407_wire);
    -- shared split operator group (7) : unary_407_inst 
    ApIntNot_group_7: Block -- 
      signal data_in: std_logic_vector(0 downto 0);
      signal data_out: std_logic_vector(0 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      data_in <= exitcond1_404;
      unary_407_wire <= data_out(0 downto 0);
      guard_vector(0)  <=  '1';
      reqL(0) <= unary_407_inst_req_0;
      reqR(0) <= unary_407_inst_req_1;
      unary_407_inst_ack_0 <= ackL(0); 
      unary_407_inst_ack_1 <= ackR(0); 
      UnsharedOperator: UnsharedOperatorBase -- 
        generic map ( -- 
          operator_id => "ApIntNot",
          input1_is_int => true, 
          input1_characteristic_width => 0, 
          input1_mantissa_width    => 0, 
          iwidth_1  => 1,
          input2_is_int => true, 
          input2_characteristic_width => 0, 
          input2_mantissa_width => 0, 
          iwidth_2      => 0, 
          num_inputs    => 1,
          output_is_int => true,
          output_characteristic_width  => 0, 
          output_mantissa_width => 0, 
          owidth => 1,
          constant_operand => "0",
          constant_width => 1,
          use_constant  => false
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
    end Block; -- split operator group 7
    LogSplitOperator(clk,reset,global_clock_cycle_count,ptr_deref_378_load_0_req_0,ptr_deref_378_load_0_ack_0,ptr_deref_378_load_0_req_1,ptr_deref_378_load_0_ack_1,sl_one,"ptr_deref_378_load_0",false,ptr_deref_378_word_address_0,
    false,ptr_deref_378_data_0);
    -- shared load operator group (0) : ptr_deref_378_load_0 
    LoadGroup0: Block -- 
      signal data_in: std_logic_vector(6 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated: BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      -- logging on!
      LogMemRead(clk, reset, global_clock_cycle_count,-- 
        ptr_deref_378_load_0_req_0,
        ptr_deref_378_load_0_ack_0,
        ptr_deref_378_load_0_req_1,
        ptr_deref_378_load_0_ack_1,
        "ptr_deref_378_load_0",
        "memory_space_0" ,
        ptr_deref_378_data_0,
        ptr_deref_378_word_address_0,
        "ptr_deref_378_data_0",
        "ptr_deref_378_word_address_0" -- 
      );
      reqL_unguarded(0) <= ptr_deref_378_load_0_req_0;
      ptr_deref_378_load_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ptr_deref_378_load_0_req_1;
      ptr_deref_378_load_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 4) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      data_in <= ptr_deref_378_word_address_0;
      ptr_deref_378_data_0 <= data_out(31 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 7,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 3,
        min_clock_period => true,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => memory_space_0_lr_req(0),
          mack => memory_space_0_lr_ack(0),
          maddr => memory_space_0_lr_addr(6 downto 0),
          mtag => memory_space_0_lr_tag(3 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( name => "LoadGroup0 load-complete ",
        data_width => 32,  num_reqs => 1,  tag_length => 1,  detailed_buffering_per_output => buffering_per_output,  no_arbitration => false)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => memory_space_0_lc_req(0),
          mack => memory_space_0_lc_ack(0),
          mdata => memory_space_0_lc_data(31 downto 0),
          mtag => memory_space_0_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 0
    LogSplitOperator(clk,reset,global_clock_cycle_count,ptr_deref_382_load_0_req_0,ptr_deref_382_load_0_ack_0,ptr_deref_382_load_0_req_1,ptr_deref_382_load_0_ack_1,sl_one,"ptr_deref_382_load_0",false,ptr_deref_382_word_address_0,
    false,ptr_deref_382_data_0);
    -- shared load operator group (1) : ptr_deref_382_load_0 
    LoadGroup1: Block -- 
      signal data_in: std_logic_vector(6 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated: BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      -- logging on!
      LogMemRead(clk, reset, global_clock_cycle_count,-- 
        ptr_deref_382_load_0_req_0,
        ptr_deref_382_load_0_ack_0,
        ptr_deref_382_load_0_req_1,
        ptr_deref_382_load_0_ack_1,
        "ptr_deref_382_load_0",
        "memory_space_1" ,
        ptr_deref_382_data_0,
        ptr_deref_382_word_address_0,
        "ptr_deref_382_data_0",
        "ptr_deref_382_word_address_0" -- 
      );
      reqL_unguarded(0) <= ptr_deref_382_load_0_req_0;
      ptr_deref_382_load_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ptr_deref_382_load_0_req_1;
      ptr_deref_382_load_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 4) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      data_in <= ptr_deref_382_word_address_0;
      ptr_deref_382_data_0 <= data_out(31 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 7,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 3,
        min_clock_period => true,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => memory_space_1_lr_req(0),
          mack => memory_space_1_lr_ack(0),
          maddr => memory_space_1_lr_addr(6 downto 0),
          mtag => memory_space_1_lr_tag(3 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( name => "LoadGroup1 load-complete ",
        data_width => 32,  num_reqs => 1,  tag_length => 1,  detailed_buffering_per_output => buffering_per_output,  no_arbitration => false)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => memory_space_1_lc_req(0),
          mack => memory_space_1_lc_ack(0),
          mdata => memory_space_1_lc_data(31 downto 0),
          mtag => memory_space_1_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 1
    LogSplitOperator(clk,reset,global_clock_cycle_count,ptr_deref_427_load_0_req_0,ptr_deref_427_load_0_ack_0,ptr_deref_427_load_0_req_1,ptr_deref_427_load_0_ack_1,sl_one,"ptr_deref_427_load_0",false,ptr_deref_427_word_address_0,
    false,ptr_deref_427_data_0);
    -- shared load operator group (2) : ptr_deref_427_load_0 
    LoadGroup2: Block -- 
      signal data_in: std_logic_vector(6 downto 0);
      signal data_out: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated: BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := ( 0 => 1);
      -- 
    begin -- 
      -- logging on!
      LogMemRead(clk, reset, global_clock_cycle_count,-- 
        ptr_deref_427_load_0_req_0,
        ptr_deref_427_load_0_ack_0,
        ptr_deref_427_load_0_req_1,
        ptr_deref_427_load_0_ack_1,
        "ptr_deref_427_load_0",
        "memory_space_2" ,
        ptr_deref_427_data_0,
        ptr_deref_427_word_address_0,
        "ptr_deref_427_data_0",
        "ptr_deref_427_word_address_0" -- 
      );
      reqL_unguarded(0) <= ptr_deref_427_load_0_req_0;
      ptr_deref_427_load_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ptr_deref_427_load_0_req_1;
      ptr_deref_427_load_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      data_in <= ptr_deref_427_word_address_0;
      ptr_deref_427_data_0 <= data_out(31 downto 0);
      LoadReq: LoadReqShared -- 
        generic map (addr_width => 7,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 3,
        min_clock_period => true,
        no_arbitration => false)
        port map ( -- 
          reqL => reqL , 
          ackL => ackL , 
          dataL => data_in, 
          mreq => memory_space_2_lr_req(0),
          mack => memory_space_2_lr_ack(0),
          maddr => memory_space_2_lr_addr(6 downto 0),
          mtag => memory_space_2_lr_tag(3 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      LoadComplete: LoadCompleteShared -- 
        generic map ( name => "LoadGroup2 load-complete ",
        data_width => 32,  num_reqs => 1,  tag_length => 1,  detailed_buffering_per_output => buffering_per_output,  no_arbitration => false)
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          dataR => data_out, 
          mreq => memory_space_2_lc_req(0),
          mack => memory_space_2_lc_ack(0),
          mdata => memory_space_2_lc_data(31 downto 0),
          mtag => memory_space_2_lc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- load group 2
    LogSplitOperator(clk,reset,global_clock_cycle_count,ptr_deref_309_store_0_req_0,ptr_deref_309_store_0_ack_0,ptr_deref_309_store_0_req_1,ptr_deref_309_store_0_ack_1,sl_one,"ptr_deref_309_store_0",false,ptr_deref_309_word_address_0 & ptr_deref_309_data_0,
    true, slv_zero);
    -- logging on!
    LogMemWrite(clk, reset,global_clock_cycle_count,  -- 
      ptr_deref_309_store_0_req_0,
      ptr_deref_309_store_0_ack_0,
      ptr_deref_309_store_0_req_1,
      ptr_deref_309_store_0_ack_1,
      "ptr_deref_309_store_0",
      "memory_space_0" ,
      ptr_deref_309_data_0,
      ptr_deref_309_word_address_0,
      "ptr_deref_309_data_0",
      "ptr_deref_309_word_address_0" -- 
    );
    -- shared store operator group (0) : ptr_deref_309_store_0 
    StoreGroup0: Block -- 
      signal addr_in: std_logic_vector(6 downto 0);
      signal data_in: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := ( 0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= ptr_deref_309_store_0_req_0;
      ptr_deref_309_store_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ptr_deref_309_store_0_req_1;
      ptr_deref_309_store_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      addr_in <= ptr_deref_309_word_address_0;
      data_in <= ptr_deref_309_data_0;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 7,
        data_width => 32,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 3,
        min_clock_period => true,
        no_arbitration => false)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => memory_space_0_sr_req(0),
          mack => memory_space_0_sr_ack(0),
          maddr => memory_space_0_sr_addr(6 downto 0),
          mdata => memory_space_0_sr_data(31 downto 0),
          mtag => memory_space_0_sr_tag(3 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          num_reqs => 1,
          detailed_buffering_per_output => buffering_per_output,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => memory_space_0_sc_req(0),
          mack => memory_space_0_sc_ack(0),
          mtag => memory_space_0_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 0
    LogSplitOperator(clk,reset,global_clock_cycle_count,ptr_deref_313_store_0_req_0,ptr_deref_313_store_0_ack_0,ptr_deref_313_store_0_req_1,ptr_deref_313_store_0_ack_1,sl_one,"ptr_deref_313_store_0",false,ptr_deref_313_word_address_0 & ptr_deref_313_data_0,
    true, slv_zero);
    -- logging on!
    LogMemWrite(clk, reset,global_clock_cycle_count,  -- 
      ptr_deref_313_store_0_req_0,
      ptr_deref_313_store_0_ack_0,
      ptr_deref_313_store_0_req_1,
      ptr_deref_313_store_0_ack_1,
      "ptr_deref_313_store_0",
      "memory_space_1" ,
      ptr_deref_313_data_0,
      ptr_deref_313_word_address_0,
      "ptr_deref_313_data_0",
      "ptr_deref_313_word_address_0" -- 
    );
    -- shared store operator group (1) : ptr_deref_313_store_0 
    StoreGroup1: Block -- 
      signal addr_in: std_logic_vector(6 downto 0);
      signal data_in: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := ( 0 => 1);
      -- 
    begin -- 
      reqL_unguarded(0) <= ptr_deref_313_store_0_req_0;
      ptr_deref_313_store_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ptr_deref_313_store_0_req_1;
      ptr_deref_313_store_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 1) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      addr_in <= ptr_deref_313_word_address_0;
      data_in <= ptr_deref_313_data_0;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 7,
        data_width => 32,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 3,
        min_clock_period => true,
        no_arbitration => false)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => memory_space_1_sr_req(0),
          mack => memory_space_1_sr_ack(0),
          maddr => memory_space_1_sr_addr(6 downto 0),
          mdata => memory_space_1_sr_data(31 downto 0),
          mtag => memory_space_1_sr_tag(3 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          num_reqs => 1,
          detailed_buffering_per_output => buffering_per_output,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => memory_space_1_sc_req(0),
          mack => memory_space_1_sc_ack(0),
          mtag => memory_space_1_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 1
    LogSplitOperator(clk,reset,global_clock_cycle_count,ptr_deref_390_store_0_req_0,ptr_deref_390_store_0_ack_0,ptr_deref_390_store_0_req_1,ptr_deref_390_store_0_ack_1,sl_one,"ptr_deref_390_store_0",false,ptr_deref_390_word_address_0 & ptr_deref_390_data_0,
    true, slv_zero);
    -- logging on!
    LogMemWrite(clk, reset,global_clock_cycle_count,  -- 
      ptr_deref_390_store_0_req_0,
      ptr_deref_390_store_0_ack_0,
      ptr_deref_390_store_0_req_1,
      ptr_deref_390_store_0_ack_1,
      "ptr_deref_390_store_0",
      "memory_space_2" ,
      ptr_deref_390_data_0,
      ptr_deref_390_word_address_0,
      "ptr_deref_390_data_0",
      "ptr_deref_390_word_address_0" -- 
    );
    -- shared store operator group (2) : ptr_deref_390_store_0 
    StoreGroup2: Block -- 
      signal addr_in: std_logic_vector(6 downto 0);
      signal data_in: std_logic_vector(31 downto 0);
      signal reqR, ackR, reqL, ackL : BooleanArray( 0 downto 0);
      signal reqR_unguarded, ackR_unguarded, reqL_unguarded, ackL_unguarded : BooleanArray( 0 downto 0);
      signal reqL_unregulated, ackL_unregulated : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      constant buffering_per_output : IntegerArray(0 downto 0) := (0 => 4);
      -- 
    begin -- 
      reqL_unguarded(0) <= ptr_deref_390_store_0_req_0;
      ptr_deref_390_store_0_ack_0 <= ackL_unguarded(0);
      reqR_unguarded(0) <= ptr_deref_390_store_0_req_1;
      ptr_deref_390_store_0_ack_1 <= ackR_unguarded(0);
      guard_vector(0)  <=  '1';
      gI0: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqL_unguarded,
        ackL => ackL_unguarded,
        reqR => reqL_unregulated,
        ackR => ackL_unregulated,
        guards => guard_vector); -- 
      accessRegulator_0: access_regulator_base generic map (num_slots => 4) -- 
        port map (req => reqL_unregulated(0), -- 
          ack => ackL_unregulated(0),
          regulated_req => reqL(0),
          regulated_ack => ackL(0),
          release_req => reqR(0),
          release_ack => ackR(0),
          clk => clk, reset => reset); -- 
      gI1: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => reqR_unguarded,
        ackL => ackR_unguarded,
        reqR => reqR,
        ackR => ackR,
        guards => guard_vector); -- 
      addr_in <= ptr_deref_390_word_address_0;
      data_in <= ptr_deref_390_data_0;
      StoreReq: StoreReqShared -- 
        generic map ( addr_width => 7,
        data_width => 32,
        num_reqs => 1,
        tag_length => 1,
        time_stamp_width => 3,
        min_clock_period => true,
        no_arbitration => false)
        port map (--
          reqL => reqL , 
          ackL => ackL , 
          addr => addr_in, 
          data => data_in, 
          mreq => memory_space_2_sr_req(0),
          mack => memory_space_2_sr_ack(0),
          maddr => memory_space_2_sr_addr(6 downto 0),
          mdata => memory_space_2_sr_data(31 downto 0),
          mtag => memory_space_2_sr_tag(3 downto 0),
          clk => clk, reset => reset -- 
        );--
      StoreComplete: StoreCompleteShared -- 
        generic map ( -- 
          num_reqs => 1,
          detailed_buffering_per_output => buffering_per_output,
          tag_length => 1 -- 
        )
        port map ( -- 
          reqR => reqR , 
          ackR => ackR , 
          mreq => memory_space_2_sc_req(0),
          mack => memory_space_2_sc_ack(0),
          mtag => memory_space_2_sc_tag(0 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- store group 2
    LogOperator(clk,reset,global_clock_cycle_count,simple_obj_ref_306_inst_req_0,simple_obj_ref_306_inst_ack_0,sl_one,"simple_obj_ref_306_inst  PipeRead from in_data_pipe",true, slv_zero,
    false,iNsTr_2_307);
    -- shared inport operator group (0) : simple_obj_ref_306_inst 
    InportGroup0: Block -- 
      signal data_out: std_logic_vector(31 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      signal req_unguarded, ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      -- 
    begin -- 
      -- logging on!
      process(clk)  begin -- 
        if clk'event and clk = '1' then -- 
          if simple_obj_ref_306_inst_ack_0 then -- 
            assert false report " ReadPipe in_data_pipe to wire iNsTr_2_307 value="  &  convert_slv_to_hex_string(data_out(31 downto 0))  severity note; --
          end if;
          --
        end if;
        -- 
      end process;
      req_unguarded(0) <= simple_obj_ref_306_inst_req_0;
      simple_obj_ref_306_inst_ack_0 <= ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => req_unguarded,
        ackL => ack_unguarded,
        reqR => req,
        ackR => ack,
        guards => guard_vector); -- 
      iNsTr_2_307 <= data_out(31 downto 0);
      in_data_pipe_read_0: InputPort -- 
        generic map ( data_width => 32,  num_reqs => 1,  no_arbitration => false)
        port map (-- 
          req => req , 
          ack => ack , 
          data => data_out, 
          oreq => in_data_pipe_pipe_read_req(0),
          oack => in_data_pipe_pipe_read_ack(0),
          odata => in_data_pipe_pipe_read_data(31 downto 0),
          clk => clk, reset => reset -- 
        ); -- 
      -- 
    end Block; -- inport group 0
    LogOperator(clk,reset,global_clock_cycle_count,simple_obj_ref_429_inst_req_0,simple_obj_ref_429_inst_ack_0,sl_one,"simple_obj_ref_429_inst  PipeWrite to out_data_pipe",false,iNsTr_16_428,
    true, slv_zero);
    -- logging on!
    process(clk)  begin -- 
      if clk'event and clk = '1' then -- 
        if simple_obj_ref_429_inst_ack_0 then -- 
          assert false report " WritePipe out_data_pipe from wire iNsTr_16_428 value="  &  convert_slv_to_hex_string(iNsTr_16_428) severity note; --
        end if;
        --
      end if;
      -- 
    end process;
    -- shared outport operator group (0) : simple_obj_ref_429_inst 
    OutportGroup0: Block -- 
      signal data_in: std_logic_vector(31 downto 0);
      signal req, ack : BooleanArray( 0 downto 0);
      signal req_unguarded, ack_unguarded : BooleanArray( 0 downto 0);
      signal guard_vector : std_logic_vector( 0 downto 0);
      -- 
    begin -- 
      req_unguarded(0) <= simple_obj_ref_429_inst_req_0;
      simple_obj_ref_429_inst_ack_0 <= ack_unguarded(0);
      guard_vector(0)  <=  '1';
      gI: GuardInterface generic map(nreqs => 1) -- 
        port map(reqL => req_unguarded,
        ackL => ack_unguarded,
        reqR => req,
        ackR => ack,
        guards => guard_vector); -- 
      data_in <= iNsTr_16_428;
      out_data_pipe_write_0: OutputPort -- 
        generic map ( data_width => 32,  num_reqs => 1,  no_arbitration => false)
        port map (--
          req => req , 
          ack => ack , 
          data => data_in, 
          oreq => out_data_pipe_pipe_write_req(0),
          oack => out_data_pipe_pipe_write_ack(0),
          odata => out_data_pipe_pipe_write_data(31 downto 0),
          clk => clk, reset => reset -- 
        );-- 
      -- 
    end Block; -- outport group 0
    -- 
  end Block; -- data_path
  -- 
end Default;
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.memory_subsystem_package.all;
use ahir.types.all;
use ahir.subprograms.all;
use ahir.components.all;
use ahir.basecomponents.all;
use ahir.operatorpackage.all;
use ahir.utilities.all;
use ahir.functionLibraryComponents.all;
library work;
use work.ahir_system_global_package.all;
entity ahir_system is  -- system 
  port (-- 
    clk : in std_logic;
    reset : in std_logic;
    in_data_pipe_pipe_write_data: in std_logic_vector(31 downto 0);
    in_data_pipe_pipe_write_req : in std_logic_vector(0 downto 0);
    in_data_pipe_pipe_write_ack : out std_logic_vector(0 downto 0);
    out_data_pipe_pipe_read_data: out std_logic_vector(31 downto 0);
    out_data_pipe_pipe_read_req : in std_logic_vector(0 downto 0);
    out_data_pipe_pipe_read_ack : out std_logic_vector(0 downto 0)); -- 
  -- 
end entity; 
architecture Default of ahir_system is -- system-architecture 
  -- interface signals to connect to memory space memory_space_0
  signal memory_space_0_lr_req :  std_logic_vector(0 downto 0);
  signal memory_space_0_lr_ack : std_logic_vector(0 downto 0);
  signal memory_space_0_lr_addr : std_logic_vector(6 downto 0);
  signal memory_space_0_lr_tag : std_logic_vector(3 downto 0);
  signal memory_space_0_lc_req : std_logic_vector(0 downto 0);
  signal memory_space_0_lc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_0_lc_data : std_logic_vector(31 downto 0);
  signal memory_space_0_lc_tag :  std_logic_vector(0 downto 0);
  signal memory_space_0_sr_req :  std_logic_vector(0 downto 0);
  signal memory_space_0_sr_ack : std_logic_vector(0 downto 0);
  signal memory_space_0_sr_addr : std_logic_vector(6 downto 0);
  signal memory_space_0_sr_data : std_logic_vector(31 downto 0);
  signal memory_space_0_sr_tag : std_logic_vector(3 downto 0);
  signal memory_space_0_sc_req : std_logic_vector(0 downto 0);
  signal memory_space_0_sc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_0_sc_tag :  std_logic_vector(0 downto 0);
  -- interface signals to connect to memory space memory_space_1
  signal memory_space_1_lr_req :  std_logic_vector(0 downto 0);
  signal memory_space_1_lr_ack : std_logic_vector(0 downto 0);
  signal memory_space_1_lr_addr : std_logic_vector(6 downto 0);
  signal memory_space_1_lr_tag : std_logic_vector(3 downto 0);
  signal memory_space_1_lc_req : std_logic_vector(0 downto 0);
  signal memory_space_1_lc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_1_lc_data : std_logic_vector(31 downto 0);
  signal memory_space_1_lc_tag :  std_logic_vector(0 downto 0);
  signal memory_space_1_sr_req :  std_logic_vector(0 downto 0);
  signal memory_space_1_sr_ack : std_logic_vector(0 downto 0);
  signal memory_space_1_sr_addr : std_logic_vector(6 downto 0);
  signal memory_space_1_sr_data : std_logic_vector(31 downto 0);
  signal memory_space_1_sr_tag : std_logic_vector(3 downto 0);
  signal memory_space_1_sc_req : std_logic_vector(0 downto 0);
  signal memory_space_1_sc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_1_sc_tag :  std_logic_vector(0 downto 0);
  -- interface signals to connect to memory space memory_space_2
  signal memory_space_2_lr_req :  std_logic_vector(0 downto 0);
  signal memory_space_2_lr_ack : std_logic_vector(0 downto 0);
  signal memory_space_2_lr_addr : std_logic_vector(6 downto 0);
  signal memory_space_2_lr_tag : std_logic_vector(3 downto 0);
  signal memory_space_2_lc_req : std_logic_vector(0 downto 0);
  signal memory_space_2_lc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_2_lc_data : std_logic_vector(31 downto 0);
  signal memory_space_2_lc_tag :  std_logic_vector(0 downto 0);
  signal memory_space_2_sr_req :  std_logic_vector(0 downto 0);
  signal memory_space_2_sr_ack : std_logic_vector(0 downto 0);
  signal memory_space_2_sr_addr : std_logic_vector(6 downto 0);
  signal memory_space_2_sr_data : std_logic_vector(31 downto 0);
  signal memory_space_2_sr_tag : std_logic_vector(3 downto 0);
  signal memory_space_2_sc_req : std_logic_vector(0 downto 0);
  signal memory_space_2_sc_ack :  std_logic_vector(0 downto 0);
  signal memory_space_2_sc_tag :  std_logic_vector(0 downto 0);
  -- declarations related to module vectorSum
  component vectorSum is -- 
    generic (tag_length : integer); 
    port ( -- 
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      memory_space_1_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_1_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_lr_addr : out  std_logic_vector(6 downto 0);
      memory_space_1_lr_tag :  out  std_logic_vector(3 downto 0);
      memory_space_1_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_1_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_lc_data : in   std_logic_vector(31 downto 0);
      memory_space_1_lc_tag :  in  std_logic_vector(0 downto 0);
      memory_space_2_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_2_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_2_lr_addr : out  std_logic_vector(6 downto 0);
      memory_space_2_lr_tag :  out  std_logic_vector(3 downto 0);
      memory_space_2_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_2_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_2_lc_data : in   std_logic_vector(31 downto 0);
      memory_space_2_lc_tag :  in  std_logic_vector(0 downto 0);
      memory_space_0_lr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lr_addr : out  std_logic_vector(6 downto 0);
      memory_space_0_lr_tag :  out  std_logic_vector(3 downto 0);
      memory_space_0_lc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_lc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_lc_data : in   std_logic_vector(31 downto 0);
      memory_space_0_lc_tag :  in  std_logic_vector(0 downto 0);
      memory_space_1_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_1_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_sr_addr : out  std_logic_vector(6 downto 0);
      memory_space_1_sr_data : out  std_logic_vector(31 downto 0);
      memory_space_1_sr_tag :  out  std_logic_vector(3 downto 0);
      memory_space_1_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_1_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_1_sc_tag :  in  std_logic_vector(0 downto 0);
      memory_space_2_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_2_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_2_sr_addr : out  std_logic_vector(6 downto 0);
      memory_space_2_sr_data : out  std_logic_vector(31 downto 0);
      memory_space_2_sr_tag :  out  std_logic_vector(3 downto 0);
      memory_space_2_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_2_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_2_sc_tag :  in  std_logic_vector(0 downto 0);
      memory_space_0_sr_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sr_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sr_addr : out  std_logic_vector(6 downto 0);
      memory_space_0_sr_data : out  std_logic_vector(31 downto 0);
      memory_space_0_sr_tag :  out  std_logic_vector(3 downto 0);
      memory_space_0_sc_req : out  std_logic_vector(0 downto 0);
      memory_space_0_sc_ack : in   std_logic_vector(0 downto 0);
      memory_space_0_sc_tag :  in  std_logic_vector(0 downto 0);
      in_data_pipe_pipe_read_req : out  std_logic_vector(0 downto 0);
      in_data_pipe_pipe_read_ack : in   std_logic_vector(0 downto 0);
      in_data_pipe_pipe_read_data : in   std_logic_vector(31 downto 0);
      out_data_pipe_pipe_write_req : out  std_logic_vector(0 downto 0);
      out_data_pipe_pipe_write_ack : in   std_logic_vector(0 downto 0);
      out_data_pipe_pipe_write_data : out  std_logic_vector(31 downto 0);
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
    -- 
  end component;
  -- argument signals for module vectorSum
  signal vectorSum_tag_in    : std_logic_vector(1 downto 0) := (others => '0');
  signal vectorSum_tag_out   : std_logic_vector(1 downto 0);
  signal vectorSum_start_req : std_logic;
  signal vectorSum_start_ack : std_logic;
  signal vectorSum_fin_req   : std_logic;
  signal vectorSum_fin_ack : std_logic;
  -- aggregate signals for read from pipe in_data_pipe
  signal in_data_pipe_pipe_read_data: std_logic_vector(31 downto 0);
  signal in_data_pipe_pipe_read_req: std_logic_vector(0 downto 0);
  signal in_data_pipe_pipe_read_ack: std_logic_vector(0 downto 0);
  -- aggregate signals for write to pipe out_data_pipe
  signal out_data_pipe_pipe_write_data: std_logic_vector(31 downto 0);
  signal out_data_pipe_pipe_write_req: std_logic_vector(0 downto 0);
  signal out_data_pipe_pipe_write_ack: std_logic_vector(0 downto 0);
  -- 
begin -- 
  -- module vectorSum
  vectorSum_instance:vectorSum-- 
    generic map(tag_length => 2)
    port map(-- 
      start_req => vectorSum_start_req,
      start_ack => vectorSum_start_ack,
      fin_req => vectorSum_fin_req,
      fin_ack => vectorSum_fin_ack,
      clk => clk,
      reset => reset,
      memory_space_0_lr_req => memory_space_0_lr_req(0 downto 0),
      memory_space_0_lr_ack => memory_space_0_lr_ack(0 downto 0),
      memory_space_0_lr_addr => memory_space_0_lr_addr(6 downto 0),
      memory_space_0_lr_tag => memory_space_0_lr_tag(3 downto 0),
      memory_space_0_lc_req => memory_space_0_lc_req(0 downto 0),
      memory_space_0_lc_ack => memory_space_0_lc_ack(0 downto 0),
      memory_space_0_lc_data => memory_space_0_lc_data(31 downto 0),
      memory_space_0_lc_tag => memory_space_0_lc_tag(0 downto 0),
      memory_space_1_lr_req => memory_space_1_lr_req(0 downto 0),
      memory_space_1_lr_ack => memory_space_1_lr_ack(0 downto 0),
      memory_space_1_lr_addr => memory_space_1_lr_addr(6 downto 0),
      memory_space_1_lr_tag => memory_space_1_lr_tag(3 downto 0),
      memory_space_1_lc_req => memory_space_1_lc_req(0 downto 0),
      memory_space_1_lc_ack => memory_space_1_lc_ack(0 downto 0),
      memory_space_1_lc_data => memory_space_1_lc_data(31 downto 0),
      memory_space_1_lc_tag => memory_space_1_lc_tag(0 downto 0),
      memory_space_2_lr_req => memory_space_2_lr_req(0 downto 0),
      memory_space_2_lr_ack => memory_space_2_lr_ack(0 downto 0),
      memory_space_2_lr_addr => memory_space_2_lr_addr(6 downto 0),
      memory_space_2_lr_tag => memory_space_2_lr_tag(3 downto 0),
      memory_space_2_lc_req => memory_space_2_lc_req(0 downto 0),
      memory_space_2_lc_ack => memory_space_2_lc_ack(0 downto 0),
      memory_space_2_lc_data => memory_space_2_lc_data(31 downto 0),
      memory_space_2_lc_tag => memory_space_2_lc_tag(0 downto 0),
      memory_space_0_sr_req => memory_space_0_sr_req(0 downto 0),
      memory_space_0_sr_ack => memory_space_0_sr_ack(0 downto 0),
      memory_space_0_sr_addr => memory_space_0_sr_addr(6 downto 0),
      memory_space_0_sr_data => memory_space_0_sr_data(31 downto 0),
      memory_space_0_sr_tag => memory_space_0_sr_tag(3 downto 0),
      memory_space_0_sc_req => memory_space_0_sc_req(0 downto 0),
      memory_space_0_sc_ack => memory_space_0_sc_ack(0 downto 0),
      memory_space_0_sc_tag => memory_space_0_sc_tag(0 downto 0),
      memory_space_1_sr_req => memory_space_1_sr_req(0 downto 0),
      memory_space_1_sr_ack => memory_space_1_sr_ack(0 downto 0),
      memory_space_1_sr_addr => memory_space_1_sr_addr(6 downto 0),
      memory_space_1_sr_data => memory_space_1_sr_data(31 downto 0),
      memory_space_1_sr_tag => memory_space_1_sr_tag(3 downto 0),
      memory_space_1_sc_req => memory_space_1_sc_req(0 downto 0),
      memory_space_1_sc_ack => memory_space_1_sc_ack(0 downto 0),
      memory_space_1_sc_tag => memory_space_1_sc_tag(0 downto 0),
      memory_space_2_sr_req => memory_space_2_sr_req(0 downto 0),
      memory_space_2_sr_ack => memory_space_2_sr_ack(0 downto 0),
      memory_space_2_sr_addr => memory_space_2_sr_addr(6 downto 0),
      memory_space_2_sr_data => memory_space_2_sr_data(31 downto 0),
      memory_space_2_sr_tag => memory_space_2_sr_tag(3 downto 0),
      memory_space_2_sc_req => memory_space_2_sc_req(0 downto 0),
      memory_space_2_sc_ack => memory_space_2_sc_ack(0 downto 0),
      memory_space_2_sc_tag => memory_space_2_sc_tag(0 downto 0),
      in_data_pipe_pipe_read_req => in_data_pipe_pipe_read_req(0 downto 0),
      in_data_pipe_pipe_read_ack => in_data_pipe_pipe_read_ack(0 downto 0),
      in_data_pipe_pipe_read_data => in_data_pipe_pipe_read_data(31 downto 0),
      out_data_pipe_pipe_write_req => out_data_pipe_pipe_write_req(0 downto 0),
      out_data_pipe_pipe_write_ack => out_data_pipe_pipe_write_ack(0 downto 0),
      out_data_pipe_pipe_write_data => out_data_pipe_pipe_write_data(31 downto 0),
      tag_in => vectorSum_tag_in,
      tag_out => vectorSum_tag_out-- 
    ); -- 
  -- module will be run forever 
  vectorSum_tag_in <= (others => '0');
  vectorSum_auto_run: auto_run generic map(use_delay => true)  port map(clk => clk, reset => reset, start_req => vectorSum_start_req, start_ack => vectorSum_start_ack,  fin_req => vectorSum_fin_req,  fin_ack => vectorSum_fin_ack);
  in_data_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe in_data_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => in_data_pipe_pipe_read_req,
      read_ack => in_data_pipe_pipe_read_ack,
      read_data => in_data_pipe_pipe_read_data,
      write_req => in_data_pipe_pipe_write_req,
      write_ack => in_data_pipe_pipe_write_ack,
      write_data => in_data_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  out_data_pipe_Pipe: PipeBase -- 
    generic map( -- 
      name => "pipe out_data_pipe",
      num_reads => 1,
      num_writes => 1,
      data_width => 32,
      lifo_mode => false,
      depth => 1 --
    )
    port map( -- 
      read_req => out_data_pipe_pipe_read_req,
      read_ack => out_data_pipe_pipe_read_ack,
      read_data => out_data_pipe_pipe_read_data,
      write_req => out_data_pipe_pipe_write_req,
      write_ack => out_data_pipe_pipe_write_ack,
      write_data => out_data_pipe_pipe_write_data,
      clk => clk,reset => reset -- 
    ); -- 
  MemorySpace_memory_space_0: ordered_memory_subsystem -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 7,
      data_width => 32,
      tag_width => 1,
      time_stamp_width => 3,
      number_of_banks => 1,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 7,
      base_bank_data_width => 32
      ) -- 
    port map(-- 
      lr_addr_in => memory_space_0_lr_addr,
      lr_req_in => memory_space_0_lr_req,
      lr_ack_out => memory_space_0_lr_ack,
      lr_tag_in => memory_space_0_lr_tag,
      lc_req_in => memory_space_0_lc_req,
      lc_ack_out => memory_space_0_lc_ack,
      lc_data_out => memory_space_0_lc_data,
      lc_tag_out => memory_space_0_lc_tag,
      sr_addr_in => memory_space_0_sr_addr,
      sr_data_in => memory_space_0_sr_data,
      sr_req_in => memory_space_0_sr_req,
      sr_ack_out => memory_space_0_sr_ack,
      sr_tag_in => memory_space_0_sr_tag,
      sc_req_in=> memory_space_0_sc_req,
      sc_ack_out => memory_space_0_sc_ack,
      sc_tag_out => memory_space_0_sc_tag,
      clock => clk,
      reset => reset); -- 
  MemorySpace_memory_space_1: ordered_memory_subsystem -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 7,
      data_width => 32,
      tag_width => 1,
      time_stamp_width => 3,
      number_of_banks => 1,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 7,
      base_bank_data_width => 32
      ) -- 
    port map(-- 
      lr_addr_in => memory_space_1_lr_addr,
      lr_req_in => memory_space_1_lr_req,
      lr_ack_out => memory_space_1_lr_ack,
      lr_tag_in => memory_space_1_lr_tag,
      lc_req_in => memory_space_1_lc_req,
      lc_ack_out => memory_space_1_lc_ack,
      lc_data_out => memory_space_1_lc_data,
      lc_tag_out => memory_space_1_lc_tag,
      sr_addr_in => memory_space_1_sr_addr,
      sr_data_in => memory_space_1_sr_data,
      sr_req_in => memory_space_1_sr_req,
      sr_ack_out => memory_space_1_sr_ack,
      sr_tag_in => memory_space_1_sr_tag,
      sc_req_in=> memory_space_1_sc_req,
      sc_ack_out => memory_space_1_sc_ack,
      sc_tag_out => memory_space_1_sc_tag,
      clock => clk,
      reset => reset); -- 
  MemorySpace_memory_space_2: ordered_memory_subsystem -- 
    generic map(-- 
      num_loads => 1,
      num_stores => 1,
      addr_width => 7,
      data_width => 32,
      tag_width => 1,
      time_stamp_width => 3,
      number_of_banks => 1,
      mux_degree => 2,
      demux_degree => 2,
      base_bank_addr_width => 7,
      base_bank_data_width => 32
      ) -- 
    port map(-- 
      lr_addr_in => memory_space_2_lr_addr,
      lr_req_in => memory_space_2_lr_req,
      lr_ack_out => memory_space_2_lr_ack,
      lr_tag_in => memory_space_2_lr_tag,
      lc_req_in => memory_space_2_lc_req,
      lc_ack_out => memory_space_2_lc_ack,
      lc_data_out => memory_space_2_lc_data,
      lc_tag_out => memory_space_2_lc_tag,
      sr_addr_in => memory_space_2_sr_addr,
      sr_data_in => memory_space_2_sr_data,
      sr_req_in => memory_space_2_sr_req,
      sr_ack_out => memory_space_2_sr_ack,
      sr_tag_in => memory_space_2_sr_tag,
      sc_req_in=> memory_space_2_sc_req,
      sc_ack_out => memory_space_2_sc_ack,
      sc_tag_out => memory_space_2_sc_tag,
      clock => clk,
      reset => reset); -- 
  -- 
end Default;
