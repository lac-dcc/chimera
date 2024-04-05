`include "versatile_mem_ctrl_defines.v"

module fifo
  (
   // A side
   input [35:0]  a_dat_i,
   input 	 a_we_i,
   input  [2:0]  a_fifo_sel_i,
   output [7:0]  a_fifo_full_o,
   input 	 a_clk,
   // B side
   output [35:0] b_dat_o,
   input 	 b_re_i,
   input [2:0]   b_fifo_sel_i,
   output [7:0]  b_fifo_empty_o,
   input 	 b_clk,
   // Common
   input 	 rst 	 
   );

   wire [4:0] 	 wadr0, radr0;
   wire [4:0]	 wadr1, radr1;
   wire [4:0]	 wadr2, radr2;
   wire [4:0]	 wadr3, radr3;
   wire [4:0]	 wadr4, radr4;
   wire [4:0]	 wadr5, radr5;
   wire [4:0]	 wadr6, radr6;
   wire [4:0]	 wadr7, radr7;
   
`ifdef PORT0
   wire [4:0] 	 wptr0, rptr0;
`endif
`ifdef PORT1
   wire [4:0] 	 wptr1, rptr1;
`endif
`ifdef PORT2
   wire [4:0] 	 wptr2, rptr2;
`endif
`ifdef PORT3
   wire [4:0] 	 wptr3, rptr3;
`endif
`ifdef PORT4
   wire [4:0] 	 wptr4, rptr4;
`endif
`ifdef PORT5
   wire [4:0] 	 wptr5, rptr5;
`endif
`ifdef PORT6
   wire [4:0] 	 wptr6, rptr6;
`endif
`ifdef PORT7
   wire [4:0] 	 wptr7, rptr7;
`endif
   
   wire [7:0] 	 dpram_a_a, dpram_a_b;   

   // WB#0
`ifdef PORT0
   fifo_adr_counter wptr0_cnt
     (
      .q(wptr0),
      .q_bin(wadr0),
      .cke(a_we_i & (a_fifo_sel_i==3'h0)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr0_cnt
     (
      .q(rptr0),
      .q_bin(radr0),
      .cke(b_re_i & (b_fifo_sel_i==3'h0)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp0
    ( 
      .wptr(wptr0), 
      .rptr(rptr0), 
      .fifo_empty(b_fifo_empty_o[0]), 
      .fifo_full(a_fifo_full_o[0]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT0
   assign wptr0 = 5'h0;
   assign wadr0 = 5'h0;
   assign rptr0 = 5'h0;
   assign radr0 = 5'h0;
   assign a_fifo_full_o[0] = 1'b0;
   assign b_fifo_empty_o[0] = 1'b1;
`endif // !`ifdef PORT0
   
   // WB#1
`ifdef PORT1
   fifo_adr_counter wptr1_cnt
     (
      .q(wptr1),
      .q_bin(wadr1),
      .cke(a_we_i & (a_fifo_sel_i==3'h1)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr1_cnt
     (
      .q(rptr1),
      .q_bin(radr1),
      .cke(b_re_i & (b_fifo_sel_i==3'h1)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp1
    ( 
      .wptr(wptr1), 
      .rptr(rptr1), 
      .fifo_empty(b_fifo_empty_o[1]), 
      .fifo_full(a_fifo_full_o[1]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT1
   assign wptr1 = 5'h0;
   assign wadr1 = 5'h0;
   assign rptr1 = 5'h0;
   assign radr1 = 5'h0;
   assign a_fifo_full_o[1] = 1'b0;
   assign b_fifo_empty_o[1] = 1'b1;
`endif // !`ifdef PORT1
   
   // WB#2
`ifdef PORT2
   fifo_adr_counter wptr2_cnt
     (
      .q(wptr2),
      .q_bin(wadr2),
      .cke(a_we_i & (a_fifo_sel_i==3'h2)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr2_cnt
     (
      .q(rptr2),
      .q_bin(radr2),
      .cke(b_re_i & (b_fifo_sel_i==3'h2)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp2
    ( 
      .wptr(wptr2), 
      .rptr(rptr2), 
      .fifo_empty(b_fifo_empty_o[2]), 
      .fifo_full(a_fifo_full_o[2]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT2
   assign wptr2 = 5'h0;
   assign wadr2 = 5'h0;
   assign rptr2 = 5'h0;
   assign radr2 = 5'h0;
   assign a_fifo_full_o[2] = 1'b0;
   assign b_fifo_empty_o[2] = 1'b1;
`endif // !`ifdef PORT2
   
   // WB#3
`ifdef PORT3
   fifo_adr_counter wptr3_cnt
     (
      .q(wptr3),
      .q_bin(wadr3),
      .cke(a_we_i & (a_fifo_sel_i==3'h3)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr3_cnt
     (
      .q(rptr3),
      .q_bin(radr3),
      .cke(b_re_i & (b_fifo_sel_i==3'h3)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp3
    ( 
      .wptr(wptr3), 
      .rptr(rptr3), 
      .fifo_empty(b_fifo_empty_o[3]), 
      .fifo_full(a_fifo_full_o[3]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT3
   assign wptr3 = 5'h0;
   assign wadr3 = 5'h0;
   assign rptr3 = 5'h0;
   assign radr3 = 5'h0;
   assign a_fifo_full_o[3] = 1'b0;
   assign b_fifo_empty_o[3] = 1'b1;
`endif // !`ifdef PORT3
   
   // WB#4
`ifdef PORT4
   fifo_adr_counter wptr4_cnt
     (
      .q(wptr4),
      .q_bin(wadr4),
      .cke(a_we_i & (a_fifo_sel_i==3'h4)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr4_cnt
     (
      .q(rptr4),
      .q_bin(radr4),
      .cke(b_re_i & (b_fifo_sel_i==3'h4)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp4
    ( 
      .wptr(wptr4), 
      .rptr(rptr4), 
      .fifo_empty(b_fifo_empty_o[4]), 
      .fifo_full(a_fifo_full_o[4]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT4
   assign wptr4 = 5'h0;
   assign wadr4 = 5'h0;
   assign rptr4 = 5'h0;
   assign radr4 = 5'h0;
   assign a_fifo_full_o[4] = 1'b0;
   assign b_fifo_empty_o[4] = 1'b1;
`endif // !`ifdef PORT4
   
   // WB#5
`ifdef PORT5
   fifo_adr_counter wptr5_cnt
     (
      .q(wptr5),
      .q_bin(wadr5),
      .cke(a_we_i & (a_fifo_sel_i==3'h5)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr5_cnt
     (
      .q(rptr5),
      .q_bin(radr5),
      .cke(b_re_i & (b_fifo_sel_i==3'h5)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp5
    ( 
      .wptr(wptr5), 
      .rptr(rptr5), 
      .fifo_empty(b_fifo_empty_o[5]), 
      .fifo_full(a_fifo_full_o[5]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT5
   assign wptr5 = 5'h0;
   assign wadr5 = 5'h0;
   assign rptr5 = 5'h0;
   assign radr5 = 5'h0;
   assign a_fifo_full_o[5] = 1'b0;
   assign b_fifo_empty_o[5] = 1'b1;
`endif // !`ifdef PORT5
   
   // WB#6
`ifdef PORT6
   fifo_adr_counter wptr6_cnt
     (
      .q(wptr6),
      .q_bin(wadr6),
      .cke(a_we_i & (a_fifo_sel_i==3'h6)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr6_cnt
     (
      .q(rptr6),
      .q_bin(radr6),
      .cke(b_re_i & (b_fifo_sel_i==3'h6)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp6
    ( 
      .wptr(wptr6), 
      .rptr(rptr6), 
      .fifo_empty(b_fifo_empty_o[6]), 
      .fifo_full(a_fifo_full_o[6]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT6
   assign wptr6 = 5'h0;
   assign wadr6 = 5'h0;
   assign rptr6 = 5'h0;
   assign radr6 = 5'h0;
   assign a_fifo_full_o[6] = 1'b0;
   assign b_fifo_empty_o[6] = 1'b1;
`endif // !`ifdef PORT6
   
   // WB#7
`ifdef PORT7
   fifo_adr_counter wptr7_cnt
     (
      .q(wptr7),
      .q_bin(wadr7),
      .cke(a_we_i & (a_fifo_sel_i==3'h7)),
      .clk(a_clk),
      .rst(rst)
      );

   fifo_adr_counter rptr7_cnt
     (
      .q(rptr7),
      .q_bin(radr7),
      .cke(b_re_i & (b_fifo_sel_i==3'h7)),
      .clk(b_clk),
      .rst(rst)
      );

  versatile_fifo_async_cmp
    #
    (
     .ADDR_WIDTH(5)
     )
    cmp7
    ( 
      .wptr(wptr7), 
      .rptr(rptr7), 
      .fifo_empty(b_fifo_empty_o[7]), 
      .fifo_full(a_fifo_full_o[7]), 
      .wclk(a_clk), 
      .rclk(b_clk), 
      .rst(rst)
      );
`else // !`ifdef PORT7
   assign wptr7 = 5'h0;
   assign wadr7 = 5'h0;
   assign rptr7 = 5'h0;
   assign radr7 = 5'h0;
   assign a_fifo_full_o[7] = 1'b0;
   assign b_fifo_empty_o[7] = 1'b1;
`endif // !`ifdef PORT7
   
   assign dpram_a_a = (a_fifo_sel_i==3'd0) ? {a_fifo_sel_i,wadr0} :
		      (a_fifo_sel_i==3'd1) ? {a_fifo_sel_i,wadr1} :
		      (a_fifo_sel_i==3'd2) ? {a_fifo_sel_i,wadr2} :
		      (a_fifo_sel_i==3'd3) ? {a_fifo_sel_i,wadr3} :
		      (a_fifo_sel_i==3'd4) ? {a_fifo_sel_i,wadr4} :
		      (a_fifo_sel_i==3'd5) ? {a_fifo_sel_i,wadr5} :
		      (a_fifo_sel_i==3'd6) ? {a_fifo_sel_i,wadr6} :
		                             {a_fifo_sel_i,wadr7} ;

   assign dpram_a_b = (b_fifo_sel_i==3'd0) ? {b_fifo_sel_i,radr0} :
		      (b_fifo_sel_i==3'd1) ? {b_fifo_sel_i,radr1} :
		      (b_fifo_sel_i==3'd2) ? {b_fifo_sel_i,radr2} :
		      (b_fifo_sel_i==3'd3) ? {b_fifo_sel_i,radr3} :
		      (b_fifo_sel_i==3'd4) ? {b_fifo_sel_i,radr4} :
		      (b_fifo_sel_i==3'd5) ? {b_fifo_sel_i,radr5} :
		      (b_fifo_sel_i==3'd6) ? {b_fifo_sel_i,radr6} :
		                             {b_fifo_sel_i,radr7} ;
		      

`ifdef ACTEL
   TwoPortRAM_256x36 dpram
     (
      .WD(a_dat_i),
      .RD(b_dat_o),
      .WEN(a_we_i),
      //.REN(b_re_i),
      .REN(1'b1),
      .WADDR(dpram_a_a),
      .RADDR(dpram_a_b),
      .WCLK(a_clk),
      .RCLK(b_clk)
      );   
`else		        
   vfifo_dual_port_ram_dc_dw
/*     #
     (
      .ADDR_WIDTH(8),
      .DATA_WIDTH(36)
      )*/
     dpram
     (
      .d_a(a_dat_i),
      .q_a(),
      .adr_a(dpram_a_a), 
      .we_a(a_we_i),
      .clk_a(a_clk),
      .q_b(b_dat_o),
      .adr_b(dpram_a_b),
      .d_b(36'h0), 
      .we_b(1'b0),
      .clk_b(b_clk)
      );
`endif
endmodule // sd_fifo
