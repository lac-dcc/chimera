`include "p_parameter.vh"

module performance_monitor_reg 
(
  //system
  input  wire                                     i_bus_clk,
  input  wire                                     i_bus_rstn,
  
  //host interface
  input  wire       [`SLV_DATA_WD-1:0]            i_slv_data,
  output reg        [`SLV_DATA_WD-1:0]            o_slv_data,
  input  wire       [`SLV_ADDR_WD-1:0]            i_slv_addr,
  input  wire                                     i_slv_rnw,
  output wire                                     o_slv_write_ack,
  output reg                                      o_slv_read_ack,
  input  wire                                     i_slv_wr_ack, //get from wrce
  input  wire                                     i_slv_rd_ack, //get from rdce

  //from_channel controller
  input  wire       [`WAY-1:0]                    i_prog_start,
  input  wire       [`WAY-1:0]                    i_prog_end,
  input  wire       [`WAY-1:0]                    i_read_start,
  input  wire       [`WAY-1:0]                    i_read_end,
  input  wire       [`WAY-1:0]                    i_erase_start,
  input  wire       [`WAY-1:0]                    i_erase_end,
  input  wire       [`WAY-1:0]                    i_op_fail
);
  
  //system
  reg  [`SLV_DATA_WD-1:0] r_ch_monitor_confi ;
  reg  [`SLV_DATA_WD-1:0] r_way_monitor_confi ;
  wire [`SLV_DATA_WD-1:0] w_way_monitor_status;
  reg  [`SLV_DATA_WD-1:0] r_reserved      ;
  
  //ch monitor
  wire [`SLV_DATA_WD-1:0] w_ch_req_cnt;
  wire [`SLV_DATA_WD-1:0] w_ch_monitor_status;
  //prog
  wire [`SLV_DATA_WD-1:0] w_ch_prog_cnt;
  wire [9:0]              w_ch_prog_req_cnt;
  wire                    w_ch_prog_ready;
  reg                     r_ch_prog_cnt_cp_cmplt;
  //read
  wire [`SLV_DATA_WD-1:0] w_ch_read_cnt;
  wire [11:0]             w_ch_read_req_cnt;
  wire                    w_ch_read_ready;
  reg                     r_ch_read_cnt_cp_cmplt;
  //erase
  wire [`SLV_DATA_WD-1:0] w_ch_erase_cnt;
  wire [9:0]              w_ch_erase_req_cnt;
  wire                    w_ch_erase_ready;
  reg                     r_ch_erase_cnt_cp_cmplt;
  
  //way monitor
  wire [`SLV_DATA_WD*`WAY-1:0] w_prog_cnt;
  wire [`SLV_DATA_WD*`WAY-1:0] w_read_cnt;
  wire [`SLV_DATA_WD*`WAY-1:0] w_erase_cnt;
  
  `ifdef WAY8
  wire [`SLV_DATA_WD-1:0] w0_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w1_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w1_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w1_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w2_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w2_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w2_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w3_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w3_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w3_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w4_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w4_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w4_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w5_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w5_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w5_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w6_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w6_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w6_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w7_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w7_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w7_erase_cnt;
  `else `ifdef WAY4
  wire [`SLV_DATA_WD-1:0] w0_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w1_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w1_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w1_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w2_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w2_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w2_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w3_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w3_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w3_erase_cnt;
  `else `ifdef WAY2
  wire [`SLV_DATA_WD-1:0] w0_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_erase_cnt;
  wire [`SLV_DATA_WD-1:0] w1_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w1_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w1_erase_cnt;
  `else `ifdef WAY1
  wire [`SLV_DATA_WD-1:0] w0_prog_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_read_cnt ;
  wire [`SLV_DATA_WD-1:0] w0_erase_cnt;
  `endif `endif `endif `endif 
  
  wire [`SLV_DATA_WD-1:0] w_req_cnt [0:7];
  
  wire [9:0]  w_prog_req_cnt [0:7];
  wire [11:0] w_read_req_cnt [0:7];
  wire [9:0]  w_erase_req_cnt[0:7];
   
  wire [`WAY-1:0] w_prog_ready;
  wire [`WAY-1:0] w_read_ready;
  wire [`WAY-1:0] w_erase_ready;
  //capture complete
  reg [7:0] r_prog_cnt_cp_cmplt; 
  reg [7:0] r_read_cnt_cp_cmplt; 
  reg [7:0] r_erase_cnt_cp_cmplt;  

  assign o_slv_write_ack = i_slv_wr_ack;
  //assign o_slv_read_ack = i_slv_rd_ack;
  
  always @ (posedge i_bus_clk)
  begin
      o_slv_read_ack <= i_slv_rd_ack;
  end
  
  //monitoring module conficuration and check
  always @ (posedge i_bus_clk or negedge i_bus_rstn)
  begin
       if(!i_bus_rstn)
       begin
            r_way_monitor_confi  <= 'b0;
            r_reserved           <= 'b0;
       end
       
       else
       begin
            if(i_slv_wr_ack)
            begin
                 case(i_slv_addr[7:0])
                     8'h0_0: r_ch_monitor_confi  <= i_slv_data;
                     8'h0_4: r_way_monitor_confi <= i_slv_data;
                     8'h0_8: r_reserved          <= i_slv_data;
                     8'h0_c: r_reserved          <= i_slv_data;
                     default: ;
                 endcase
            end
       end
  end
  
  always @ (posedge i_bus_clk) //*
  begin
       if(i_slv_rd_ack)
       case(i_slv_addr[7:0])
           8'h0_0: o_slv_data <= r_ch_monitor_confi;
           8'h0_4: o_slv_data <= r_way_monitor_confi;
           8'h0_8: o_slv_data <= w_ch_monitor_status;
           8'h0_c: o_slv_data <= w_way_monitor_status;
      `ifdef WAY8
           8'h1_0: o_slv_data <= w0_prog_cnt ; //way0
           8'h1_4: o_slv_data <= w0_read_cnt ;
           8'h1_8: o_slv_data <= w0_erase_cnt;
           8'h1_c: o_slv_data <= r_reserved;
           8'h2_0: o_slv_data <= w1_prog_cnt ; //way1
           8'h2_4: o_slv_data <= w1_read_cnt ;
           8'h2_8: o_slv_data <= w1_erase_cnt;
           8'h2_c: o_slv_data <= r_reserved;
           8'h3_0: o_slv_data <= w2_prog_cnt ; //way2
           8'h3_4: o_slv_data <= w2_read_cnt ;
           8'h3_8: o_slv_data <= w2_erase_cnt;
           8'h3_c: o_slv_data <= r_reserved;
           8'h4_0: o_slv_data <= w3_prog_cnt ; //way3
           8'h4_4: o_slv_data <= w3_read_cnt ;
           8'h4_8: o_slv_data <= w3_erase_cnt;
           8'h4_c: o_slv_data <= r_reserved;
           8'h5_0: o_slv_data <= w4_prog_cnt ; //way4
           8'h5_4: o_slv_data <= w4_read_cnt ;
           8'h5_8: o_slv_data <= w4_erase_cnt;
           8'h5_c: o_slv_data <= r_reserved;
           8'h6_0: o_slv_data <= w5_prog_cnt ; //way5
           8'h6_4: o_slv_data <= w5_read_cnt ;
           8'h6_8: o_slv_data <= w5_erase_cnt;
           8'h6_c: o_slv_data <= r_reserved;
           8'h7_0: o_slv_data <= w6_prog_cnt ; //way6
           8'h7_4: o_slv_data <= w6_read_cnt ;
           8'h7_8: o_slv_data <= w6_erase_cnt;
           8'h7_c: o_slv_data <= r_reserved;
           8'h8_0: o_slv_data <= w7_prog_cnt ; //way7
           8'h8_4: o_slv_data <= w7_read_cnt ;
           8'h8_8: o_slv_data <= w7_erase_cnt;
           8'h8_c: o_slv_data <= r_reserved;
           //req cnt
           8'h9_0: o_slv_data <= w_req_cnt[0]; //way0   //prog(10 bits), read(12 bits), erase(10 bits)
           8'h9_4: o_slv_data <= w_req_cnt[1]; //way1
           8'h9_8: o_slv_data <= w_req_cnt[2]; //way2
           8'h9_c: o_slv_data <= w_req_cnt[3]; //way3
           8'ha_0: o_slv_data <= w_req_cnt[4]; //way4
           8'ha_4: o_slv_data <= w_req_cnt[5]; //way5
           8'ha_8: o_slv_data <= w_req_cnt[6]; //way6
           8'ha_c: o_slv_data <= w_req_cnt[7]; //way7
           8'hb_0: o_slv_data <= w_ch_prog_cnt;  //ch_prog
           8'hb_4: o_slv_data <= w_ch_read_cnt;  //ch_read
           8'hb_8: o_slv_data <= w_ch_erase_cnt; //ch_erase
           8'hb_c: o_slv_data <= r_reserved;
           8'hc_0: o_slv_data <= w_ch_req_cnt;
           8'hc_4: o_slv_data <= r_reserved;
           8'hc_8: o_slv_data <= r_reserved;
           8'hc_c: o_slv_data <= r_reserved;
           8'hd_0: o_slv_data <= r_reserved;
           8'hd_4: o_slv_data <= r_reserved;
           8'hd_8: o_slv_data <= r_reserved;
           8'hd_c: o_slv_data <= r_reserved;
           8'he_0: o_slv_data <= r_reserved;
           8'he_4: o_slv_data <= r_reserved;
           8'he_8: o_slv_data <= r_reserved;
           8'he_c: o_slv_data <= r_reserved;
           8'hf_0: o_slv_data <= r_reserved;
           8'hf_4: o_slv_data <= r_reserved;
           8'hf_8: o_slv_data <= r_reserved;
           8'hf_c: o_slv_data <= r_reserved;
     `else `ifdef WAY4
           8'h1_0: o_slv_data <= w0_prog_cnt ;    //way0
           8'h1_4: o_slv_data <= w0_read_cnt ;
           8'h1_8: o_slv_data <= w0_erase_cnt;
           8'h1_c: o_slv_data <= r_reserved;
           8'h2_0: o_slv_data <= w1_prog_cnt ;   //way1
           8'h2_4: o_slv_data <= w1_read_cnt ;
           8'h2_8: o_slv_data <= w1_erase_cnt;
           8'h2_c: o_slv_data <= r_reserved;
           8'h3_0: o_slv_data <= w2_prog_cnt ;   //way2
           8'h3_4: o_slv_data <= w2_read_cnt ;
           8'h3_8: o_slv_data <= w2_erase_cnt;
           8'h3_c: o_slv_data <= r_reserved;
           8'h4_0: o_slv_data <= w3_prog_cnt ;  //way3
           8'h4_4: o_slv_data <= w3_read_cnt ;
           8'h4_8: o_slv_data <= w3_erase_cnt;
           8'h4_c: o_slv_data <= r_reserved;
     `else `ifdef WAY2
           8'h1_0: o_slv_data <= w0_prog_cnt ;    //way0
           8'h1_4: o_slv_data <= w0_read_cnt ; 
           8'h1_8: o_slv_data <= w0_erase_cnt;
           8'h1_c: o_slv_data <= r_reserved;
           8'h2_0: o_slv_data <= w1_prog_cnt ;   //way1
           8'h2_4: o_slv_data <= w1_read_cnt ; 
           8'h2_8: o_slv_data <= w1_erase_cnt;
           8'h2_c: o_slv_data <= r_reserved;
     `else `ifdef WAY1      
           8'h1_0: o_slv_data <= w0_prog_cnt ;    //way0
           8'h1_4: o_slv_data <= w0_read_cnt ; 
           8'h1_8: o_slv_data <= w0_erase_cnt;
           8'h1_c: o_slv_data <= r_reserved;
     `endif `endif `endif `endif     
           default: o_slv_data <= 'b0;
       endcase
  end
  
  always @ (posedge i_bus_clk)
  begin
  //way prog cnt capture complete ack
       r_prog_cnt_cp_cmplt[0] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & (!i_slv_addr[5]) & i_slv_addr[4]    & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[1] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & i_slv_addr[5]    & (!i_slv_addr[4]) & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[2] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & i_slv_addr[5]    & i_slv_addr[4]    & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[3] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & (!i_slv_addr[5]) & (!i_slv_addr[4]) & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[4] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & (!i_slv_addr[5]) & i_slv_addr[4]    & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[5] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & i_slv_addr[5]    & (!i_slv_addr[4]) & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[6] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & i_slv_addr[5]    & i_slv_addr[4]    & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_prog_cnt_cp_cmplt[7] <= i_slv_rd_ack & i_slv_addr[7] & (!i_slv_addr[6])    & (!i_slv_addr[5]) & (!i_slv_addr[4]) & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
  end
  
  always @ (posedge i_bus_clk)
  begin
  //way read cnt capture complete ack
       r_read_cnt_cp_cmplt[0] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & (!i_slv_addr[5]) & i_slv_addr[4]    & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[1] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & i_slv_addr[5]    & (!i_slv_addr[4]) & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[2] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & i_slv_addr[5]    & i_slv_addr[4]    & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[3] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & (!i_slv_addr[5]) & (!i_slv_addr[4]) & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[4] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & (!i_slv_addr[5]) & i_slv_addr[4]    & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[5] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & i_slv_addr[5]    & (!i_slv_addr[4]) & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[6] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & i_slv_addr[5]    & i_slv_addr[4]    & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_read_cnt_cp_cmplt[7] <= i_slv_rd_ack & i_slv_addr[7] & (!i_slv_addr[6])    & (!i_slv_addr[5]) & (!i_slv_addr[4]) & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
  end
  
  always @ (posedge i_bus_clk)
  begin
  //way erase cnt capture complete ack
       r_erase_cnt_cp_cmplt[0] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & (!i_slv_addr[5]) & i_slv_addr[4]    & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[1] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & i_slv_addr[5]    & (!i_slv_addr[4]) & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[2] <= i_slv_rd_ack & (!i_slv_addr[7]) & (!i_slv_addr[6]) & i_slv_addr[5]    & i_slv_addr[4]    & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[3] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & (!i_slv_addr[5]) & (!i_slv_addr[4]) & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[4] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & (!i_slv_addr[5]) & i_slv_addr[4]    & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[5] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & i_slv_addr[5]    & (!i_slv_addr[4]) & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[6] <= i_slv_rd_ack & (!i_slv_addr[7]) & i_slv_addr[6]    & i_slv_addr[5]    & i_slv_addr[4]    & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
       r_erase_cnt_cp_cmplt[7] <= i_slv_rd_ack & i_slv_addr[7]    & (!i_slv_addr[6]) & (!i_slv_addr[5]) & (!i_slv_addr[4]) & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
  end
  
  always @ (posedge i_bus_clk)
  begin
  //ch prog cnt capture complete ack
       r_ch_prog_cnt_cp_cmplt = i_slv_rd_ack & i_slv_addr[7] & (!i_slv_addr[6]) & i_slv_addr[5] & i_slv_addr[4] & (!i_slv_addr[3]) & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
  //ch read cnt capture complete ack
       r_ch_read_cnt_cp_cmplt = i_slv_rd_ack & i_slv_addr[7] & (!i_slv_addr[6]) & i_slv_addr[5] & i_slv_addr[4] & (!i_slv_addr[3]) & i_slv_addr[2] & (!i_slv_addr[1]) & (!i_slv_addr[0]);
  //ch erase cnt capture complete ack
       r_ch_erase_cnt_cp_cmplt = i_slv_rd_ack & i_slv_addr[7] & (!i_slv_addr[6]) & i_slv_addr[5] & i_slv_addr[4] & i_slv_addr[3] & (!i_slv_addr[2]) & (!i_slv_addr[1]) & (!i_slv_addr[0]);
  end
    
  assign w0_prog_cnt  = w_prog_cnt[31:0] ;
  assign w0_read_cnt  = w_read_cnt[31:0] ;
  assign w0_erase_cnt = w_erase_cnt[31:0];
  assign w1_prog_cnt  = w_prog_cnt[63:32] ;
  assign w1_read_cnt  = w_read_cnt[63:32] ;
  assign w1_erase_cnt = w_erase_cnt[63:32];
  assign w2_prog_cnt  = w_prog_cnt[95:64] ;
  assign w2_read_cnt  = w_read_cnt[95:64] ;
  assign w2_erase_cnt = w_erase_cnt[95:64];
  assign w3_prog_cnt  = w_prog_cnt[127:96] ;
  assign w3_read_cnt  = w_read_cnt[127:96] ;
  assign w3_erase_cnt = w_erase_cnt[127:96];
  assign w4_prog_cnt  = w_prog_cnt[159:128] ;
  assign w4_read_cnt  = w_read_cnt[159:128] ;
  assign w4_erase_cnt = w_erase_cnt[159:128];
  assign w5_prog_cnt  = w_prog_cnt[191:160] ;
  assign w5_read_cnt  = w_read_cnt[191:160] ;
  assign w5_erase_cnt = w_erase_cnt[191:160];
  assign w6_prog_cnt  = w_prog_cnt[223:192] ;
  assign w6_read_cnt  = w_read_cnt[223:192] ;
  assign w6_erase_cnt = w_erase_cnt[223:192];
  assign w7_prog_cnt  = w_prog_cnt[255:224] ;
  assign w7_read_cnt  = w_read_cnt[255:224] ;
  assign w7_erase_cnt = w_erase_cnt[255:224];
  
  
  assign w_ch_req_cnt = {w_ch_prog_req_cnt, w_ch_read_req_cnt, w_ch_erase_req_cnt};
  assign w_ch_monitor_status = {w_ch_prog_ready, w_ch_read_ready, w_ch_erase_ready};
  
  //ch prog counter
  performance_ch_prog_counter performance_ch_prog_counter0(
  
  .i_bus_clk          (i_bus_clk),
  .i_bus_rst          (!i_bus_rstn),
  .i_config           (r_ch_monitor_confi),
  .i_prog_cnt_cp_cmplt(r_ch_prog_cnt_cp_cmplt),
  .o_prog_cnt         (w_ch_prog_cnt),
  .o_prog_req_cnt     (w_ch_prog_req_cnt),
  .i_prog_start       (i_prog_start),
  .i_prog_end         (i_prog_end),
  .i_op_fail          (i_op_fail),
  .o_prog_ready       (w_ch_prog_ready)
  );
  //ch read counter
  performance_ch_read_counter performance_ch_read_counter0(
  
  .i_bus_clk          (i_bus_clk),
  .i_bus_rst          (!i_bus_rstn),
  .i_config           (r_ch_monitor_confi),
  .i_read_cnt_cp_cmplt(r_ch_read_cnt_cp_cmplt),
  .o_read_cnt         (w_ch_read_cnt),
  .o_read_req_cnt     (w_ch_read_req_cnt),
  .i_read_start       (i_read_start),
  .i_read_end         (i_read_end),
  .i_op_fail          (i_op_fail),
  .o_read_ready       (w_ch_read_ready)
  );
  //ch erase couter
  performance_ch_erase_counter performance_ch_erase_counter0(
  
  .i_bus_clk           (i_bus_clk),
  .i_bus_rst           (!i_bus_rstn),
  .i_config            (r_ch_monitor_confi),
  .i_erase_cnt_cp_cmplt(r_ch_erase_cnt_cp_cmplt),
  .o_erase_cnt         (w_ch_erase_cnt),
  .o_erase_req_cnt     (w_ch_erase_req_cnt),
  .i_erase_start       (i_erase_start),
  .i_erase_end         (i_erase_end),
  .i_op_fail           (i_op_fail),
  .o_erase_ready       (w_ch_erase_ready)
  );
  
  genvar i;
  generate
  for(i=0;i<`WAY;i=i+1)
  begin : performance_status
       assign w_way_monitor_status[(i+1)*4-1:i*4] = {w_prog_ready[i], w_read_ready[i], w_erase_ready[i], 1'b0};
  end
  endgenerate
  
  generate
  for(i=0;i<`WAY;i=i+1)
  begin : req_cnt
       assign w_req_cnt[i] = {w_prog_req_cnt[i], w_read_req_cnt[i], w_erase_req_cnt[i]};
  end
  endgenerate  
  
  generate
  for(i=0;i<`WAY;i=i+1)
  begin : prog_monitoring_module_generate
  performance_counter_prog prog_counter(

  .i_bus_clk           (i_bus_clk),
  .i_bus_rst           (!i_bus_rstn),
  .i_config            (r_way_monitor_confi),
  .i_prog_cnt_cp_cmplt (r_prog_cnt_cp_cmplt[i]),
  .o_prog_cnt          (w_prog_cnt[`SLV_DATA_WD*(i+1)-1:`SLV_DATA_WD*i]),
  .o_prog_req_cnt      (w_prog_req_cnt[i]),
  .i_prog_start        (i_prog_start[i]),
  .i_prog_end          (i_prog_end[i]),
  .i_op_fail           (i_op_fail[i]),
  .o_prog_ready        (w_prog_ready[i])
  );
  end
  endgenerate
  
  generate
  for(i=0;i<`WAY;i=i+1)
  begin : read_monitoring_module_generate
  performance_counter_read read_counter(

  .i_bus_clk           (i_bus_clk),
  .i_bus_rst           (!i_bus_rstn),
  .i_config            (r_way_monitor_confi),
  .i_read_cnt_cp_cmplt (r_read_cnt_cp_cmplt[i]),
  .o_read_cnt          (w_read_cnt[`SLV_DATA_WD*(i+1)-1:`SLV_DATA_WD*i]),
  .o_read_req_cnt      (w_read_req_cnt[i]), 
  .i_read_start        (i_read_start[i]),
  .i_read_end          (i_read_end[i]),
  .i_op_fail           (i_op_fail[i]),
  .o_read_ready        (w_read_ready[i])
  );
  end
  endgenerate
  
  generate
  for(i=0;i<`WAY;i=i+1)
  begin : erase_monitoring_module_generate
  performance_counter_erase erase_counter(

  .i_bus_clk            (i_bus_clk),
  .i_bus_rst            (!i_bus_rstn),
  .i_config             (r_way_monitor_confi),
  .i_erase_cnt_cp_cmplt (r_erase_cnt_cp_cmplt[i]),
  .o_erase_cnt          (w_erase_cnt[`SLV_DATA_WD*(i+1)-1:`SLV_DATA_WD*i]),
  .o_erase_req_cnt      (w_erase_req_cnt[i]), 
  .i_erase_start        (i_erase_start[i]),
  .i_erase_end          (i_erase_end[i]),
  .i_op_fail            (i_op_fail[i]),
  .o_erase_ready        (w_erase_ready[i])
  );
  end
  endgenerate
  
  //function - register width
  function integer clogb2;
    input [31:0] value;
    integer i;
    begin
      clogb2 = 0;
      for(i = 0; 2**i < value; i = i + 1)
        clogb2 = i + 1;
    end
  endfunction
  
endmodule
