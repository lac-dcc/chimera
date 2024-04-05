
      //`define EP board.dut.PCIe_Path.pcie3_x8_ip.inst.pcie_top_i
      //`define RP board.RP.rport.pcie_top_i

  generate 
  if(PIPE_SIM == "TRUE") begin
      //RP PIPE TX --> EP PIPE RX
      //Lane 0 
      assign `EP.pipe_rx0_char_is_k_gt   =  `RP.pipe_tx0_char_is_k_gt;
      assign `EP.pipe_rx0_data_gt        =  `RP.pipe_tx0_data_gt;
      assign `EP.pipe_rx0_data_valid_gt  =  `RP.pipe_tx0_data_valid_gt;
      assign `EP.pipe_rx0_start_block_gt =  `RP.pipe_tx0_start_block_gt;
      assign `EP.pipe_rx0_syncheader_gt  =  `RP.pipe_tx0_syncheader_gt;
      assign `EP.pipe_rx0_elec_idle_gt   =  `RP.pipe_tx0_elec_idle_gt;
      //Lane 1 
      assign `EP.pipe_rx1_char_is_k_gt   =  `RP.pipe_tx1_char_is_k_gt;
      assign `EP.pipe_rx1_data_gt        =  `RP.pipe_tx1_data_gt;
      assign `EP.pipe_rx1_data_valid_gt  =  `RP.pipe_tx1_data_valid_gt;
      assign `EP.pipe_rx1_start_block_gt =  `RP.pipe_tx1_start_block_gt;
      assign `EP.pipe_rx1_syncheader_gt  =  `RP.pipe_tx1_syncheader_gt;
      assign `EP.pipe_rx1_elec_idle_gt   =  `RP.pipe_tx1_elec_idle_gt;
      //Lane 2 
      assign `EP.pipe_rx2_char_is_k_gt   =  `RP.pipe_tx2_char_is_k_gt;
      assign `EP.pipe_rx2_data_gt        =  `RP.pipe_tx2_data_gt;
      assign `EP.pipe_rx2_data_valid_gt  =  `RP.pipe_tx2_data_valid_gt;
      assign `EP.pipe_rx2_start_block_gt =  `RP.pipe_tx2_start_block_gt;
      assign `EP.pipe_rx2_syncheader_gt  =  `RP.pipe_tx2_syncheader_gt;
      assign `EP.pipe_rx2_elec_idle_gt   =  `RP.pipe_tx2_elec_idle_gt;
      //Lane 3 
      assign `EP.pipe_rx3_char_is_k_gt   =  `RP.pipe_tx3_char_is_k_gt;
      assign `EP.pipe_rx3_data_gt        =  `RP.pipe_tx3_data_gt;
      assign `EP.pipe_rx3_data_valid_gt  =  `RP.pipe_tx3_data_valid_gt;
      assign `EP.pipe_rx3_start_block_gt =  `RP.pipe_tx3_start_block_gt;
      assign `EP.pipe_rx3_syncheader_gt  =  `RP.pipe_tx3_syncheader_gt;
      assign `EP.pipe_rx3_elec_idle_gt   =  `RP.pipe_tx3_elec_idle_gt;
      //Lane 4 
      assign `EP.pipe_rx4_char_is_k_gt   =  `RP.pipe_tx4_char_is_k_gt;
      assign `EP.pipe_rx4_data_gt        =  `RP.pipe_tx4_data_gt;
      assign `EP.pipe_rx4_data_valid_gt  =  `RP.pipe_tx4_data_valid_gt;
      assign `EP.pipe_rx4_start_block_gt =  `RP.pipe_tx4_start_block_gt;
      assign `EP.pipe_rx4_syncheader_gt  =  `RP.pipe_tx4_syncheader_gt;
      assign `EP.pipe_rx4_elec_idle_gt   =  `RP.pipe_tx4_elec_idle_gt;
      //Lane 5 
      assign `EP.pipe_rx5_char_is_k_gt   = `RP.pipe_tx5_char_is_k_gt;
      assign `EP.pipe_rx5_data_gt        = `RP.pipe_tx5_data_gt;
      assign `EP.pipe_rx5_data_valid_gt  = `RP.pipe_tx5_data_valid_gt;
      assign `EP.pipe_rx5_start_block_gt = `RP.pipe_tx5_start_block_gt;
      assign `EP.pipe_rx5_syncheader_gt  = `RP.pipe_tx5_syncheader_gt;
      assign `EP.pipe_rx5_elec_idle_gt   = `RP.pipe_tx5_elec_idle_gt;
      //Lane 6 
      assign `EP.pipe_rx6_char_is_k_gt   =  `RP.pipe_tx6_char_is_k_gt;
      assign `EP.pipe_rx6_data_gt        =  `RP.pipe_tx6_data_gt;
      assign `EP.pipe_rx6_data_valid_gt  =  `RP.pipe_tx6_data_valid_gt;
      assign `EP.pipe_rx6_start_block_gt =  `RP.pipe_tx6_start_block_gt;
      assign `EP.pipe_rx6_syncheader_gt  =  `RP.pipe_tx6_syncheader_gt;
      assign `EP.pipe_rx6_elec_idle_gt   =  `RP.pipe_tx6_elec_idle_gt;
      //Lane 7
      assign `EP.pipe_rx7_char_is_k_gt   = `RP.pipe_tx7_char_is_k_gt;
      assign `EP.pipe_rx7_data_gt        = `RP.pipe_tx7_data_gt;
      assign `EP.pipe_rx7_data_valid_gt  = `RP.pipe_tx7_data_valid_gt;
      assign `EP.pipe_rx7_start_block_gt = `RP.pipe_tx7_start_block_gt;
      assign `EP.pipe_rx7_syncheader_gt  = `RP.pipe_tx7_syncheader_gt;
      assign `EP.pipe_rx7_elec_idle_gt   = `RP.pipe_tx7_elec_idle_gt;

      //EP PIPE TX --> RP PIPE RX
      //Lane 0 
      assign `RP.pipe_rx0_char_is_k_gt   =  `EP.pipe_tx0_char_is_k_gt;
      assign `RP.pipe_rx0_data_gt        =  `EP.pipe_tx0_data_gt;
      assign `RP.pipe_rx0_data_valid_gt  =  `EP.pipe_tx0_data_valid_gt;
      assign `RP.pipe_rx0_start_block_gt =  `EP.pipe_tx0_start_block_gt;
      assign `RP.pipe_rx0_syncheader_gt  =  `EP.pipe_tx0_syncheader_gt;
      assign `RP.pipe_rx0_elec_idle_gt   =  `EP.pipe_tx0_elec_idle_gt;
      //Lane 1 
      assign `RP.pipe_rx1_char_is_k_gt   =  `EP.pipe_tx1_char_is_k_gt;
      assign `RP.pipe_rx1_data_gt        =  `EP.pipe_tx1_data_gt;
      assign `RP.pipe_rx1_data_valid_gt  =  `EP.pipe_tx1_data_valid_gt;
      assign `RP.pipe_rx1_start_block_gt =  `EP.pipe_tx1_start_block_gt;
      assign `RP.pipe_rx1_syncheader_gt  =  `EP.pipe_tx1_syncheader_gt;
      assign `RP.pipe_rx1_elec_idle_gt   =  `EP.pipe_tx1_elec_idle_gt;
      //Lane 2 
      assign `RP.pipe_rx2_char_is_k_gt   =  `EP.pipe_tx2_char_is_k_gt;
      assign `RP.pipe_rx2_data_gt        =  `EP.pipe_tx2_data_gt;
      assign `RP.pipe_rx2_data_valid_gt  =  `EP.pipe_tx2_data_valid_gt;
      assign `RP.pipe_rx2_start_block_gt =  `EP.pipe_tx2_start_block_gt;
      assign `RP.pipe_rx2_syncheader_gt  =  `EP.pipe_tx2_syncheader_gt;
      assign `RP.pipe_rx2_elec_idle_gt   =  `EP.pipe_tx2_elec_idle_gt;
      //Lane 3 
      assign `RP.pipe_rx3_char_is_k_gt   =  `EP.pipe_tx3_char_is_k_gt;
      assign `RP.pipe_rx3_data_gt        =  `EP.pipe_tx3_data_gt;
      assign `RP.pipe_rx3_data_valid_gt  =  `EP.pipe_tx3_data_valid_gt;
      assign `RP.pipe_rx3_start_block_gt =  `EP.pipe_tx3_start_block_gt;
      assign `RP.pipe_rx3_syncheader_gt  =  `EP.pipe_tx3_syncheader_gt;
      assign `RP.pipe_rx3_elec_idle_gt   =  `EP.pipe_tx3_elec_idle_gt;
      //Lane 4 
      assign `RP.pipe_rx4_char_is_k_gt   =  `EP.pipe_tx4_char_is_k_gt;
      assign `RP.pipe_rx4_data_gt        =  `EP.pipe_tx4_data_gt;
      assign `RP.pipe_rx4_data_valid_gt  =  `EP.pipe_tx4_data_valid_gt;
      assign `RP.pipe_rx4_start_block_gt =  `EP.pipe_tx4_start_block_gt;
      assign `RP.pipe_rx4_syncheader_gt  =  `EP.pipe_tx4_syncheader_gt;
      assign `RP.pipe_rx4_elec_idle_gt   =  `EP.pipe_tx4_elec_idle_gt;
      //Lane 5 
      assign `RP.pipe_rx5_char_is_k_gt   =  `EP.pipe_tx5_char_is_k_gt;
      assign `RP.pipe_rx5_data_gt        =  `EP.pipe_tx5_data_gt;
      assign `RP.pipe_rx5_data_valid_gt  =  `EP.pipe_tx5_data_valid_gt;
      assign `RP.pipe_rx5_start_block_gt =  `EP.pipe_tx5_start_block_gt;
      assign `RP.pipe_rx5_syncheader_gt  =  `EP.pipe_tx5_syncheader_gt;
      assign `RP.pipe_rx5_elec_idle_gt   =  `EP.pipe_tx5_elec_idle_gt;
      //Lane 6 
      assign `RP.pipe_rx6_char_is_k_gt   =  `EP.pipe_tx6_char_is_k_gt;
      assign `RP.pipe_rx6_data_gt        =  `EP.pipe_tx6_data_gt;
      assign `RP.pipe_rx6_data_valid_gt  =  `EP.pipe_tx6_data_valid_gt;
      assign `RP.pipe_rx6_start_block_gt =  `EP.pipe_tx6_start_block_gt;
      assign `RP.pipe_rx6_syncheader_gt  =  `EP.pipe_tx6_syncheader_gt;
      assign `RP.pipe_rx6_elec_idle_gt   =  `EP.pipe_tx6_elec_idle_gt;
      //Lane 7
      assign `RP.pipe_rx7_char_is_k_gt   =  `EP.pipe_tx7_char_is_k_gt;
      assign `RP.pipe_rx7_data_gt        =  `EP.pipe_tx7_data_gt;
      assign `RP.pipe_rx7_data_valid_gt  =  `EP.pipe_tx7_data_valid_gt;
      assign `RP.pipe_rx7_start_block_gt =  `EP.pipe_tx7_start_block_gt;
      assign `RP.pipe_rx7_syncheader_gt  =  `EP.pipe_tx7_syncheader_gt;
      assign `RP.pipe_rx7_elec_idle_gt   =  `EP.pipe_tx7_elec_idle_gt;
  end
  endgenerate
