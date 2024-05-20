// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module usb_phy (clk,rst,phy_tx_mode,reg usb_rst,txdp,txdn,txoe,rxd,rxdp,rxdn,DataOut_i,TxValid_i,TxReady_o,DataIn_o,RxValid_o,RxActive_o,RxError_o,LineState_o) ; 
   reg [4:0] rst_cnt ;  
   wire fs_ce ;  
   wire rst ;  
  
 
 parameter i_tx_phy_IDLE =3'd0, i_tx_phy_SOP =3'h1, i_tx_phy_DATA =3'h2, i_tx_phy_EOP1 =3'h3, i_tx_phy_EOP2 =3'h4, i_tx_phy_WAIT =3'h5; 
   reg[2:0] i_tx_phy_state ; 
   reg[2:0] i_tx_phy_next_state ; 
   reg i_tx_phy_tx_ready_d ; 
   reg i_tx_phy_ld_sop_d ; 
   reg i_tx_phy_ld_data_d ; 
   reg i_tx_phy_ld_eop_d ; 
   reg i_tx_phy_tx_ip ; 
   reg i_tx_phy_tx_ip_sync ; 
   reg[2:0] i_tx_phy_bit_cnt ; 
   reg[7:0] i_tx_phy_hold_reg ; 
   reg[7:0] i_tx_phy_hold_reg_d ; 
   reg i_tx_phy_sd_raw_o ; 
   wire i_tx_phy_hold ; 
   reg i_tx_phy_data_done ; 
   reg i_tx_phy_sft_done ; 
   reg i_tx_phy_sft_done_r ; 
   wire i_tx_phy_sft_done_e ; 
   reg i_tx_phy_ld_data ; 
   wire i_tx_phy_eop_done ; 
   reg[2:0] i_tx_phy_one_cnt ; 
   wire i_tx_phy_stuff ; 
   reg i_tx_phy_sd_bs_o ; 
   reg i_tx_phy_sd_nrzi_o ; 
   reg i_tx_phy_append_eop ; 
   reg i_tx_phy_append_eop_sync1 ; 
   reg i_tx_phy_append_eop_sync2 ; 
   reg i_tx_phy_append_eop_sync3 ; 
   reg i_tx_phy_append_eop_sync4 ; 
   reg i_tx_phy_txoe_r1 ; 
   reg i_tx_phy_txoe_r2 ; 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_TxReady_o  <=1'b0;
        else 
           i_tx_phy_TxReady_o  <= i_tx_phy_tx_ready_d & i_tx_phy_TxValid_i ;
 
  always @( posedge  i_tx_phy_clk )
        i_tx_phy_ld_data  <= i_tx_phy_ld_data_d ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_tx_ip  <=1'b0;
        else 
          if ( i_tx_phy_ld_sop_d )
              i_tx_phy_tx_ip  <=1'b1;
           else 
             if ( i_tx_phy_eop_done )
                 i_tx_phy_tx_ip  <=1'b0;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_tx_ip_sync  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_tx_ip_sync  <= i_tx_phy_tx_ip ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_data_done  <=1'b0;
        else 
          if ( i_tx_phy_TxValid_i &&! i_tx_phy_tx_ip )
              i_tx_phy_data_done  <=1'b1;
           else 
             if (! i_tx_phy_TxValid_i )
                 i_tx_phy_data_done  <=1'b0;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_bit_cnt  <=3'h0;
        else 
          if (! i_tx_phy_tx_ip_sync )
              i_tx_phy_bit_cnt  <=3'h0;
           else 
             if ( i_tx_phy_fs_ce &&! i_tx_phy_hold )
                 i_tx_phy_bit_cnt  <= i_tx_phy_bit_cnt +3'h1;
 
  assign  i_tx_phy_hold = i_tx_phy_stuff ; 
  always @( posedge  i_tx_phy_clk )
       if (! i_tx_phy_tx_ip_sync )
           i_tx_phy_sd_raw_o  <=1'b0;
        else 
          case ( i_tx_phy_bit_cnt )
           3 'h0:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [0];
           3 'h1:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [1];
           3 'h2:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [2];
           3 'h3:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [3];
           3 'h4:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [4];
           3 'h5:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [5];
           3 'h6:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [6];
           3 'h7:
               i_tx_phy_sd_raw_o  <= i_tx_phy_hold_reg_d [7];
          endcase
  
  always @( posedge  i_tx_phy_clk )
        i_tx_phy_sft_done  <=! i_tx_phy_hold &( i_tx_phy_bit_cnt ==3'h7);
 
  always @( posedge  i_tx_phy_clk )
        i_tx_phy_sft_done_r  <= i_tx_phy_sft_done ;
 
  assign  i_tx_phy_sft_done_e = i_tx_phy_sft_done &! i_tx_phy_sft_done_r ; 
  always @( posedge  i_tx_phy_clk )
       if ( i_tx_phy_ld_sop_d )
           i_tx_phy_hold_reg  <=8'h80;
        else 
          if ( i_tx_phy_ld_data )
              i_tx_phy_hold_reg  <= i_tx_phy_DataOut_i ;
 
  always @( posedge  i_tx_phy_clk )
        i_tx_phy_hold_reg_d  <= i_tx_phy_hold_reg ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_one_cnt  <=3'h0;
        else 
          if (! i_tx_phy_tx_ip_sync )
              i_tx_phy_one_cnt  <=3'h0;
           else 
             if ( i_tx_phy_fs_ce )
                begin 
                  if (! i_tx_phy_sd_raw_o || i_tx_phy_stuff )
                      i_tx_phy_one_cnt  <=3'h0;
                   else 
                      i_tx_phy_one_cnt  <= i_tx_phy_one_cnt +3'h1;
                end
  
  assign  i_tx_phy_stuff =( i_tx_phy_one_cnt ==3'h6); 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_sd_bs_o  <=1'h0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_sd_bs_o  <=! i_tx_phy_tx_ip_sync ?1'b0:( i_tx_phy_stuff ?1'b0: i_tx_phy_sd_raw_o );
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_sd_nrzi_o  <=1'b1;
        else 
          if (! i_tx_phy_tx_ip_sync ||! i_tx_phy_txoe_r1 )
              i_tx_phy_sd_nrzi_o  <=1'b1;
           else 
             if ( i_tx_phy_fs_ce )
                 i_tx_phy_sd_nrzi_o  <= i_tx_phy_sd_bs_o ? i_tx_phy_sd_nrzi_o :~ i_tx_phy_sd_nrzi_o ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_append_eop  <=1'b0;
        else 
          if ( i_tx_phy_ld_eop_d )
              i_tx_phy_append_eop  <=1'b1;
           else 
             if ( i_tx_phy_append_eop_sync2 )
                 i_tx_phy_append_eop  <=1'b0;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_append_eop_sync1  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_append_eop_sync1  <= i_tx_phy_append_eop ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_append_eop_sync2  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_append_eop_sync2  <= i_tx_phy_append_eop_sync1 ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_append_eop_sync3  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_append_eop_sync3  <= i_tx_phy_append_eop_sync2 |( i_tx_phy_append_eop_sync3 &! i_tx_phy_append_eop_sync4 );
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_append_eop_sync4  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_append_eop_sync4  <= i_tx_phy_append_eop_sync3 ;
 
  assign  i_tx_phy_eop_done = i_tx_phy_append_eop_sync3 ; 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_txoe_r1  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_txoe_r1  <= i_tx_phy_tx_ip_sync ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_txoe_r2  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_txoe_r2  <= i_tx_phy_txoe_r1 ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_txoe  <=1'b1;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_txoe  <=!( i_tx_phy_txoe_r1 | i_tx_phy_txoe_r2 );
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_txdp  <=1'b1;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_txdp  <= i_tx_phy_phy_mode ?(! i_tx_phy_append_eop_sync3 & i_tx_phy_sd_nrzi_o ): i_tx_phy_sd_nrzi_o ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_txdn  <=1'b0;
        else 
          if ( i_tx_phy_fs_ce )
              i_tx_phy_txdn  <= i_tx_phy_phy_mode ?(! i_tx_phy_append_eop_sync3 &~ i_tx_phy_sd_nrzi_o ): i_tx_phy_append_eop_sync3 ;
 
  always @(  posedge   i_tx_phy_clk or negedge  i_tx_phy_rst )
       if (! i_tx_phy_rst )
           i_tx_phy_state  <= i_tx_phy_IDLE ;
        else 
           i_tx_phy_state  <= i_tx_phy_next_state ;
 
  always @(       i_tx_phy_state       or  i_tx_phy_TxValid_i  or  i_tx_phy_data_done  or  i_tx_phy_sft_done_e  or  i_tx_phy_eop_done  or  i_tx_phy_fs_ce  )
       begin 
          i_tx_phy_next_state  = i_tx_phy_state ;
          i_tx_phy_tx_ready_d  =1'b0;
          i_tx_phy_ld_sop_d  =1'b0;
          i_tx_phy_ld_data_d  =1'b0;
          i_tx_phy_ld_eop_d  =1'b0;
         case ( i_tx_phy_state )
           i_tx_phy_IDLE  :
             if ( i_tx_phy_TxValid_i )
                begin 
                   i_tx_phy_ld_sop_d  =1'b1;
                   i_tx_phy_next_state  = i_tx_phy_SOP ;
                end 
           i_tx_phy_SOP  :
             if ( i_tx_phy_sft_done_e )
                begin 
                   i_tx_phy_tx_ready_d  =1'b1;
                   i_tx_phy_ld_data_d  =1'b1;
                   i_tx_phy_next_state  = i_tx_phy_DATA ;
                end 
           i_tx_phy_DATA  :
             begin 
               if (! i_tx_phy_data_done && i_tx_phy_sft_done_e )
                  begin 
                     i_tx_phy_ld_eop_d  =1'b1;
                     i_tx_phy_next_state  = i_tx_phy_EOP1 ;
                  end 
               if ( i_tx_phy_data_done && i_tx_phy_sft_done_e )
                  begin 
                     i_tx_phy_tx_ready_d  =1'b1;
                     i_tx_phy_ld_data_d  =1'b1;
                  end 
             end 
           i_tx_phy_EOP1  :
             if ( i_tx_phy_eop_done )
                 i_tx_phy_next_state  = i_tx_phy_EOP2 ;
           i_tx_phy_EOP2  :
             if (! i_tx_phy_eop_done && i_tx_phy_fs_ce )
                 i_tx_phy_next_state  = i_tx_phy_WAIT ;
           i_tx_phy_WAIT  :
             if ( i_tx_phy_fs_ce )
                 i_tx_phy_next_state  = i_tx_phy_IDLE ;
         endcase 
       end
 
 
  
 
   reg i_rx_phy_rxd_s0 ; 
   reg i_rx_phy_rxd_s1 ; 
   reg i_rx_phy_rxd_s ; 
   reg i_rx_phy_rxdp_s0 ; 
   reg i_rx_phy_rxdp_s1 ; 
   reg i_rx_phy_rxdp_s ; 
   reg i_rx_phy_rxdp_s_r ; 
   reg i_rx_phy_rxdn_s0 ; 
   reg i_rx_phy_rxdn_s1 ; 
   reg i_rx_phy_rxdn_s ; 
   reg i_rx_phy_rxdn_s_r ; 
   reg i_rx_phy_synced_d ; 
   wire i_rx_phy_k ; 
   wire i_rx_phy_j ; 
   wire i_rx_phy_se0 ; 
   reg i_rx_phy_rxd_r ; 
   reg i_rx_phy_rx_en ; 
   reg i_rx_phy_rx_active ; 
   reg[2:0] i_rx_phy_bit_cnt ; 
   reg i_rx_phy_rx_valid1 ; 
   reg i_rx_phy_rx_valid ; 
   reg i_rx_phy_shift_en ; 
   reg i_rx_phy_sd_r ; 
   reg i_rx_phy_sd_nrzi ; 
   reg[7:0] i_rx_phy_hold_reg ; 
   wire i_rx_phy_drop_bit ; 
   reg[2:0] i_rx_phy_one_cnt ; 
   reg[1:0] i_rx_phy_dpll_state ; 
   reg[1:0] i_rx_phy_dpll_next_state ; 
   reg i_rx_phy_fs_ce_d ; 
   wire i_rx_phy_change ; 
   wire i_rx_phy_lock_en ; 
   reg[2:0] i_rx_phy_fs_state ; 
   reg[2:0] i_rx_phy_fs_next_state ; 
   reg i_rx_phy_rx_valid_r ; 
   reg i_rx_phy_sync_err_d ; 
   reg i_rx_phy_sync_err ; 
   reg i_rx_phy_bit_stuff_err ; 
   reg i_rx_phy_se0_r ; 
   reg i_rx_phy_byte_err ; 
   reg i_rx_phy_se0_s ; 
  assign  i_rx_phy_RxActive_o = i_rx_phy_rx_active ; 
  assign  i_rx_phy_RxValid_o = i_rx_phy_rx_valid ; 
  assign  i_rx_phy_RxError_o = i_rx_phy_sync_err | i_rx_phy_bit_stuff_err | i_rx_phy_byte_err ; 
  assign  i_rx_phy_DataIn_o = i_rx_phy_hold_reg ; 
  assign  i_rx_phy_LineState ={ i_rx_phy_rxdn_s1 , i_rx_phy_rxdp_s1 }; 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rx_en  <= i_rx_phy_RxEn_i ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_sync_err  <=! i_rx_phy_rx_active & i_rx_phy_sync_err_d ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxd_s0  <= i_rx_phy_rxd ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxd_s1  <= i_rx_phy_rxd_s0 ;
 
  always @( posedge  i_rx_phy_clk )
       if ( i_rx_phy_rxd_s0 && i_rx_phy_rxd_s1 )
           i_rx_phy_rxd_s  <=1'b1;
        else 
          if (! i_rx_phy_rxd_s0 &&! i_rx_phy_rxd_s1 )
              i_rx_phy_rxd_s  <=1'b0;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdp_s0  <= i_rx_phy_rxdp ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdp_s1  <= i_rx_phy_rxdp_s0 ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdp_s_r  <= i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1 ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdp_s  <=( i_rx_phy_rxdp_s0 & i_rx_phy_rxdp_s1 )| i_rx_phy_rxdp_s_r ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdn_s0  <= i_rx_phy_rxdn ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdn_s1  <= i_rx_phy_rxdn_s0 ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdn_s_r  <= i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1 ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxdn_s  <=( i_rx_phy_rxdn_s0 & i_rx_phy_rxdn_s1 )| i_rx_phy_rxdn_s_r ;
 
  assign  i_rx_phy_k =! i_rx_phy_rxdp_s & i_rx_phy_rxdn_s ; 
  assign  i_rx_phy_j = i_rx_phy_rxdp_s &! i_rx_phy_rxdn_s ; 
  assign  i_rx_phy_se0 =! i_rx_phy_rxdp_s &! i_rx_phy_rxdn_s ; 
  always @( posedge  i_rx_phy_clk )
       if ( i_rx_phy_fs_ce )
           i_rx_phy_se0_s  <= i_rx_phy_se0 ;
 
  assign  i_rx_phy_lock_en = i_rx_phy_rx_en ; 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rxd_r  <= i_rx_phy_rxd_s ;
 
  assign  i_rx_phy_change = i_rx_phy_rxd_r != i_rx_phy_rxd_s ; 
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_dpll_state  <=2'h1;
        else 
           i_rx_phy_dpll_state  <= i_rx_phy_dpll_next_state ;
 
  always @(    i_rx_phy_dpll_state    or  i_rx_phy_lock_en  or  i_rx_phy_change  )
       begin 
          i_rx_phy_fs_ce_d  =1'b0;
         case ( i_rx_phy_dpll_state )
          2 'h0:
             if ( i_rx_phy_lock_en && i_rx_phy_change )
                 i_rx_phy_dpll_next_state  =2'h0;
              else 
                 i_rx_phy_dpll_next_state  =2'h1;
          2 'h1:
             begin 
                i_rx_phy_fs_ce_d  =1'b1;
               if ( i_rx_phy_lock_en && i_rx_phy_change )
                   i_rx_phy_dpll_next_state  =2'h3;
                else 
                   i_rx_phy_dpll_next_state  =2'h2;
             end 
          2 'h2:
             if ( i_rx_phy_lock_en && i_rx_phy_change )
                 i_rx_phy_dpll_next_state  =2'h0;
              else 
                 i_rx_phy_dpll_next_state  =2'h3;
          2 'h3:
             if ( i_rx_phy_lock_en && i_rx_phy_change )
                 i_rx_phy_dpll_next_state  =2'h0;
              else 
                 i_rx_phy_dpll_next_state  =2'h0;
         endcase 
       end
  
   reg i_rx_phy_fs_ce_r1 , i_rx_phy_fs_ce_r2 ; 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_fs_ce_r1  <= i_rx_phy_fs_ce_d ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_fs_ce_r2  <= i_rx_phy_fs_ce_r1 ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_fs_ce  <= i_rx_phy_fs_ce_r2 ;
 
 parameter i_rx_phy_FS_IDLE =3'h0, i_rx_phy_K1 =3'h1, i_rx_phy_J1 =3'h2, i_rx_phy_K2 =3'h3, i_rx_phy_J2 =3'h4, i_rx_phy_K3 =3'h5, i_rx_phy_J3 =3'h6, i_rx_phy_K4 =3'h7; 
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_fs_state  <= i_rx_phy_FS_IDLE ;
        else 
           i_rx_phy_fs_state  <= i_rx_phy_fs_next_state ;
 
  always @(         i_rx_phy_fs_state         or  i_rx_phy_fs_ce  or  i_rx_phy_k  or  i_rx_phy_j  or  i_rx_phy_rx_en  or  i_rx_phy_rx_active  or  i_rx_phy_se0  or  i_rx_phy_se0_s  )
       begin 
          i_rx_phy_synced_d  =1'b0;
          i_rx_phy_sync_err_d  =1'b0;
          i_rx_phy_fs_next_state  = i_rx_phy_fs_state ;
         if ( i_rx_phy_fs_ce &&! i_rx_phy_rx_active &&! i_rx_phy_se0 &&! i_rx_phy_se0_s )
            case ( i_rx_phy_fs_state )
              i_rx_phy_FS_IDLE  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K1 ;
                end 
              i_rx_phy_K1  :
                begin 
                  if ( i_rx_phy_j && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_J1 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_J1  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K2 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_K2  :
                begin 
                  if ( i_rx_phy_j && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_J2 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_J2  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K3 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_K3  :
                begin 
                  if ( i_rx_phy_j && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_J3 ;
                   else 
                     if ( i_rx_phy_k && i_rx_phy_rx_en )
                        begin 
                           i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                           i_rx_phy_synced_d  =1'b1;
                        end 
                      else 
                        begin 
                           i_rx_phy_sync_err_d  =1'b1;
                           i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                        end 
                end 
              i_rx_phy_J3  :
                begin 
                  if ( i_rx_phy_k && i_rx_phy_rx_en )
                      i_rx_phy_fs_next_state  = i_rx_phy_K4 ;
                   else 
                     begin 
                        i_rx_phy_sync_err_d  =1'b1;
                        i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                     end 
                end 
              i_rx_phy_K4  :
                begin 
                  if ( i_rx_phy_k )
                      i_rx_phy_synced_d  =1'b1;
                   i_rx_phy_fs_next_state  = i_rx_phy_FS_IDLE ;
                end 
            endcase 
       end
  
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_rx_active  <=1'b0;
        else 
          if ( i_rx_phy_synced_d && i_rx_phy_rx_en )
              i_rx_phy_rx_active  <=1'b1;
           else 
             if ( i_rx_phy_se0 && i_rx_phy_rx_valid_r )
                 i_rx_phy_rx_active  <=1'b0;
 
  always @( posedge  i_rx_phy_clk )
       if ( i_rx_phy_rx_valid )
           i_rx_phy_rx_valid_r  <=1'b1;
        else 
          if ( i_rx_phy_fs_ce )
              i_rx_phy_rx_valid_r  <=1'b0;
 
  always @( posedge  i_rx_phy_clk )
       if ( i_rx_phy_fs_ce )
           i_rx_phy_sd_r  <= i_rx_phy_rxd_s ;
 
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_sd_nrzi  <=1'b0;
        else 
          if (! i_rx_phy_rx_active )
              i_rx_phy_sd_nrzi  <=1'b1;
           else 
             if ( i_rx_phy_rx_active && i_rx_phy_fs_ce )
                 i_rx_phy_sd_nrzi  <=!( i_rx_phy_rxd_s ^ i_rx_phy_sd_r );
 
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_one_cnt  <=3'h0;
        else 
          if (! i_rx_phy_shift_en )
              i_rx_phy_one_cnt  <=3'h0;
           else 
             if ( i_rx_phy_fs_ce )
                begin 
                  if (! i_rx_phy_sd_nrzi || i_rx_phy_drop_bit )
                      i_rx_phy_one_cnt  <=3'h0;
                   else 
                      i_rx_phy_one_cnt  <= i_rx_phy_one_cnt +3'h1;
                end
  
  assign  i_rx_phy_drop_bit =( i_rx_phy_one_cnt ==3'h6); 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_bit_stuff_err  <= i_rx_phy_drop_bit & i_rx_phy_sd_nrzi & i_rx_phy_fs_ce &! i_rx_phy_se0 & i_rx_phy_rx_active ;
 
  always @( posedge  i_rx_phy_clk )
       if ( i_rx_phy_fs_ce )
           i_rx_phy_shift_en  <= i_rx_phy_synced_d | i_rx_phy_rx_active ;
 
  always @( posedge  i_rx_phy_clk )
       if ( i_rx_phy_fs_ce && i_rx_phy_shift_en &&! i_rx_phy_drop_bit )
           i_rx_phy_hold_reg  <={ i_rx_phy_sd_nrzi , i_rx_phy_hold_reg [7:1]};
 
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_bit_cnt  <=3'b0;
        else 
          if (! i_rx_phy_shift_en )
              i_rx_phy_bit_cnt  <=3'h0;
           else 
             if ( i_rx_phy_fs_ce &&! i_rx_phy_drop_bit )
                 i_rx_phy_bit_cnt  <= i_rx_phy_bit_cnt +3'h1;
 
  always @(  posedge   i_rx_phy_clk or negedge  i_rx_phy_rst )
       if (! i_rx_phy_rst )
           i_rx_phy_rx_valid1  <=1'b0;
        else 
          if ( i_rx_phy_fs_ce &&! i_rx_phy_drop_bit &&( i_rx_phy_bit_cnt ==3'h7))
              i_rx_phy_rx_valid1  <=1'b1;
           else 
             if ( i_rx_phy_rx_valid1 && i_rx_phy_fs_ce &&! i_rx_phy_drop_bit )
                 i_rx_phy_rx_valid1  <=1'b0;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_rx_valid  <=! i_rx_phy_drop_bit & i_rx_phy_rx_valid1 & i_rx_phy_fs_ce ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_se0_r  <= i_rx_phy_se0 ;
 
  always @( posedge  i_rx_phy_clk )
        i_rx_phy_byte_err  <= i_rx_phy_se0 &! i_rx_phy_se0_r &(| i_rx_phy_bit_cnt [2:1])& i_rx_phy_rx_active ;

 
  always @(  posedge clk or  negedge rst)
       if (!rst)
          rst_cnt <=5'h0;
        else 
          if (LineState_o!=2'h0)
             rst_cnt <=5'h0;
           else 
             if (!usb_rst&&fs_ce)
                rst_cnt <=rst_cnt+5'h1;
 
  always @(  posedge clk or  negedge rst)
       if (!rst)
          usb_rst <=1'b0;
        else 
          usb_rst <=(rst_cnt==5'h1f);
 
endmodule
