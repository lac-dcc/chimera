// This program was cloned from: https://github.com/Juniper/open-register-design-tool
// License: Apache License 2.0

//   Ordt 230719.01 autogenerated file 
//   Input: ./rdl_c_header/test.rdl
//   Parms: ./rdl_c_header/test.parms
//   Date: Thu Jul 20 12:53:13 EDT 2023
//

//
//---------- module example_addr_map_jrdl_logic
//
module example_addr_map_jrdl_logic
(
  clk,
  reset,
  d2l_r0_w,
  d2l_r0_we,
  d2l_r0_re,
  d2l_r1_w,
  d2l_r1_we,
  d2l_r1_re,
  d2l_r2_w,
  d2l_r2_we,
  d2l_r2_re,

  l2d_r0_r,
  l2d_r1_r,
  l2d_r2_r,
  l2h_r0_f0_r,
  l2h_r0_f1_r,
  l2h_r0_f2_r,
  l2h_r1_f0_r,
  l2h_r1_f1_r,
  l2h_r2_f0_r,
  l2h_r2_f2_r,
  l2h_r2_f3_r );

  //------- inputs
  input    clk;
  input    reset;
  input     [31:0] d2l_r0_w;
  input    d2l_r0_we;
  input    d2l_r0_re;
  input     [31:0] d2l_r1_w;
  input    d2l_r1_we;
  input    d2l_r1_re;
  input     [31:0] d2l_r2_w;
  input    d2l_r2_we;
  input    d2l_r2_re;

  //------- outputs
  output     [31:0] l2d_r0_r;
  output     [31:0] l2d_r1_r;
  output     [31:0] l2d_r2_r;
  output     [7:0] l2h_r0_f0_r;
  output     [7:0] l2h_r0_f1_r;
  output     [15:0] l2h_r0_f2_r;
  output     [3:0] l2h_r1_f0_r;
  output     [3:0] l2h_r1_f1_r;
  output     [1:0] l2h_r2_f0_r;
  output     [1:0] l2h_r2_f2_r;
  output     [3:0] l2h_r2_f3_r;


  //------- reg defines
  reg   [7:0] rg_r0_f0;
  reg   [7:0] reg_r0_f0_next;
  reg   [7:0] l2h_r0_f0_r;
  reg   [7:0] rg_r0_f1;
  reg   [7:0] reg_r0_f1_next;
  reg   [7:0] l2h_r0_f1_r;
  reg   [15:0] rg_r0_f2;
  reg   [15:0] reg_r0_f2_next;
  reg   [15:0] l2h_r0_f2_r;
  reg   [31:0] l2d_r0_r;
  reg   [3:0] rg_r1_f0;
  reg   [3:0] reg_r1_f0_next;
  reg   [3:0] l2h_r1_f0_r;
  reg   [3:0] rg_r1_f1;
  reg   [3:0] reg_r1_f1_next;
  reg   [3:0] l2h_r1_f1_r;
  reg   [31:0] l2d_r1_r;
  reg   [1:0] rg_r2_f0;
  reg   [1:0] reg_r2_f0_next;
  reg   [1:0] l2h_r2_f0_r;
  reg   [1:0] rg_r2_f2;
  reg   [1:0] reg_r2_f2_next;
  reg   [1:0] l2h_r2_f2_r;
  reg   [3:0] rg_r2_f3;
  reg   [3:0] reg_r2_f3_next;
  reg   [3:0] l2h_r2_f3_r;
  reg   [31:0] l2d_r2_r;
  
  
  //------- combinatorial assigns for r2
  always @ (*) begin
    reg_r2_f0_next = rg_r2_f0;
    l2h_r2_f0_r = rg_r2_f0;
    reg_r2_f2_next = rg_r2_f2;
    l2h_r2_f2_r = rg_r2_f2;
    reg_r2_f3_next = rg_r2_f3;
    l2h_r2_f3_r = rg_r2_f3;
    if (d2l_r2_we) reg_r2_f0_next = d2l_r2_w [3:2] ;
    if (d2l_r2_we) reg_r2_f2_next = d2l_r2_w [1:0] ;
    if (d2l_r2_we) reg_r2_f3_next = d2l_r2_w [7:4] ;
  end
  
  //------- reg assigns for r2
  always @ (posedge clk) begin
    if (reset) begin
      rg_r2_f0 <= #1 2'h1;
      rg_r2_f2 <= #1 2'h1;
      rg_r2_f3 <= #1 4'h0;
    end
    else begin
      rg_r2_f0 <= #1  reg_r2_f0_next;
      rg_r2_f2 <= #1  reg_r2_f2_next;
      rg_r2_f3 <= #1  reg_r2_f3_next;
    end
  end
  
  //------- combinatorial assigns for r0 (pio read data)
  always @ (*) begin
    l2d_r0_r [7:0]  = rg_r0_f0;
    l2d_r0_r [15:8]  = rg_r0_f1;
    l2d_r0_r [31:16]  = rg_r0_f2;
  end
  
  //------- combinatorial assigns for r1 (pio read data)
  always @ (*) begin
    l2d_r1_r = 32'b0;
    l2d_r1_r [3:0]  = rg_r1_f0;
    l2d_r1_r [7:4]  = rg_r1_f1;
  end
  
  //------- combinatorial assigns for r2 (pio read data)
  always @ (*) begin
    l2d_r2_r = 32'b0;
    l2d_r2_r [3:2]  = rg_r2_f0;
    l2d_r2_r [1:0]  = rg_r2_f2;
    l2d_r2_r [7:4]  = rg_r2_f3;
  end
  
  //------- combinatorial assigns for r0
  always @ (*) begin
    reg_r0_f0_next = rg_r0_f0;
    l2h_r0_f0_r = rg_r0_f0;
    reg_r0_f1_next = rg_r0_f1;
    l2h_r0_f1_r = rg_r0_f1;
    reg_r0_f2_next = rg_r0_f2;
    l2h_r0_f2_r = rg_r0_f2;
    if (d2l_r0_we) reg_r0_f0_next = d2l_r0_w [7:0] ;
    if (d2l_r0_we) reg_r0_f1_next = d2l_r0_w [15:8] ;
    if (d2l_r0_we) reg_r0_f2_next = d2l_r0_w [31:16] ;
  end
  
  //------- reg assigns for r0
  always @ (posedge clk) begin
    if (reset) begin
      rg_r0_f0 <= #1 8'h2;
      rg_r0_f1 <= #1 8'h4;
      rg_r0_f2 <= #1 16'ha0b;
    end
    else begin
      rg_r0_f0 <= #1  reg_r0_f0_next;
      rg_r0_f1 <= #1  reg_r0_f1_next;
      rg_r0_f2 <= #1  reg_r0_f2_next;
    end
  end
  
  //------- combinatorial assigns for r1
  always @ (*) begin
    reg_r1_f0_next = rg_r1_f0;
    l2h_r1_f0_r = rg_r1_f0;
    reg_r1_f1_next = rg_r1_f1;
    l2h_r1_f1_r = rg_r1_f1;
    if (d2l_r1_we) reg_r1_f0_next = d2l_r1_w [3:0] ;
    if (d2l_r1_we) reg_r1_f1_next = d2l_r1_w [7:4] ;
  end
  
  //------- reg assigns for r1
  always @ (posedge clk) begin
    if (reset) begin
      rg_r1_f0 <= #1 4'h1;
      rg_r1_f1 <= #1 4'h0;
    end
    else begin
      rg_r1_f0 <= #1  reg_r1_f0_next;
      rg_r1_f1 <= #1  reg_r1_f1_next;
    end
  end
  
endmodule

//
//---------- module example_addr_map_jrdl_decode
//
module example_addr_map_jrdl_decode
(
  clk,
  reset,
  leaf_dec_wr_data,
  leaf_dec_addr,
  leaf_dec_block_sel,
  leaf_dec_valid,
  leaf_dec_wr_dvld,
  leaf_dec_cycle,
  leaf_dec_wr_width,
  l2d_r0_r,
  l2d_r1_r,
  l2d_r2_r,

  dec_leaf_rd_data,
  dec_leaf_ack,
  dec_leaf_nack,
  dec_leaf_accept,
  dec_leaf_reject,
  dec_leaf_retry_atomic,
  dec_leaf_data_width,
  d2l_r0_w,
  d2l_r0_we,
  d2l_r0_re,
  d2l_r1_w,
  d2l_r1_we,
  d2l_r1_re,
  d2l_r2_w,
  d2l_r2_we,
  d2l_r2_re );

  //------- inputs
  input    clk;
  input    reset;
  input     [31:0] leaf_dec_wr_data;
  input     [39:0] leaf_dec_addr;
  input    leaf_dec_block_sel;
  input    leaf_dec_valid;
  input    leaf_dec_wr_dvld;
  input     [1:0] leaf_dec_cycle;
  input     [2:0] leaf_dec_wr_width;
  input     [31:0] l2d_r0_r;
  input     [31:0] l2d_r1_r;
  input     [31:0] l2d_r2_r;

  //------- outputs
  output     [31:0] dec_leaf_rd_data;
  output    dec_leaf_ack;
  output    dec_leaf_nack;
  output    dec_leaf_accept;
  output    dec_leaf_reject;
  output    dec_leaf_retry_atomic;
  output     [2:0] dec_leaf_data_width;
  output     [31:0] d2l_r0_w;
  output    d2l_r0_we;
  output    d2l_r0_re;
  output     [31:0] d2l_r1_w;
  output    d2l_r1_we;
  output    d2l_r1_re;
  output     [31:0] d2l_r2_w;
  output    d2l_r2_we;
  output    d2l_r2_re;


  //------- wire defines
  wire   [31:0] pio_dec_write_data;
  wire   [3:2] pio_dec_address;
  wire  pio_dec_read;
  wire  pio_dec_write;
  wire   [39:0] block_sel_addr;
  wire  block_sel;
  wire  leaf_dec_valid_active;
  wire  leaf_dec_wr_dvld_active;
  
  //------- reg defines
  reg   [31:0] d2l_r0_w;
  reg  d2l_r0_we;
  reg  d2l_r0_re;
  reg   [31:0] d2l_r1_w;
  reg  d2l_r1_we;
  reg  d2l_r1_re;
  reg   [31:0] d2l_r2_w;
  reg  d2l_r2_we;
  reg  d2l_r2_re;
  reg  leaf_dec_valid_hld1;
  reg  leaf_dec_valid_hld1_next;
  reg  leaf_dec_wr_dvld_hld1;
  reg  leaf_dec_wr_dvld_hld1_next;
  reg  pio_write_active;
  reg  pio_read_active;
  reg   [3:2] pio_dec_address_d1;
  reg   [31:0] pio_dec_write_data_d1;
  reg   [31:0] dec_pio_read_data;
  reg   [31:0] dec_pio_read_data_d1;
  reg  dec_pio_ack;
  reg  dec_pio_nack;
  reg  dec_pio_ack_next;
  reg  dec_pio_nack_next;
  reg  pio_internal_ack;
  reg  pio_internal_nack;
  reg  pio_external_ack;
  reg  pio_external_nack;
  reg  pio_external_ack_next;
  reg  pio_external_nack_next;
  reg  pio_no_acks;
  reg  pio_activate_write;
  reg  pio_activate_read;
  reg   [31:0] dec_pio_read_data_next;
  reg  external_transaction_active;
  
  
  //------- assigns
  assign  pio_dec_write_data = leaf_dec_wr_data;
  assign  dec_leaf_rd_data = dec_pio_read_data;
  assign  dec_leaf_ack = dec_pio_ack;
  assign  dec_leaf_nack = dec_pio_nack;
  assign  pio_dec_address = leaf_dec_addr [3:2] ;
  assign  block_sel_addr = 40'h0;
  assign  block_sel = leaf_dec_block_sel;
  assign  leaf_dec_wr_dvld_active = leaf_dec_wr_dvld | leaf_dec_wr_dvld_hld1;
  assign  leaf_dec_valid_active = leaf_dec_valid | leaf_dec_valid_hld1;
  assign  dec_leaf_accept = leaf_dec_valid & block_sel;
  assign  dec_leaf_reject = leaf_dec_valid & ~block_sel;
  assign  pio_dec_read = block_sel & leaf_dec_valid_active & (leaf_dec_cycle == 2'b10);
  assign  pio_dec_write = block_sel & leaf_dec_wr_dvld_active & (leaf_dec_cycle[1] == 1'b0);
  assign  dec_leaf_retry_atomic = 1'b0;
  assign  dec_leaf_data_width = 3'b0;
  
  //------- combinatorial assigns for pio read data
  always @ (*) begin
    dec_pio_read_data = dec_pio_read_data_d1;
  end
  
  //------- reg assigns for pio read data
  always @ (posedge clk) begin
    if (reset) begin
      dec_pio_read_data_d1 <= #1  32'b0;
    end
    else begin
      dec_pio_read_data_d1 <= #1 dec_pio_read_data_next;
    end
  end
  
  //------- reg assigns for pio i/f
  always @ (posedge clk) begin
    if (reset) begin
      pio_write_active <= #1  1'b0;
      pio_read_active <= #1  1'b0;
    end
    else begin
      pio_write_active <= #1  pio_write_active ? pio_no_acks : pio_activate_write;
      pio_read_active <= #1  pio_read_active ? pio_no_acks : pio_activate_read;
    end
    pio_dec_address_d1 <= #1   pio_dec_address;
    pio_dec_write_data_d1 <= #1  pio_dec_write_data;
  end
  
  //------- combinatorial assigns for leaf i/f
  always @ (*) begin
    leaf_dec_valid_hld1_next = leaf_dec_valid | leaf_dec_valid_hld1;
    if (dec_pio_ack_next | dec_pio_nack_next) leaf_dec_valid_hld1_next = 1'b0;
    leaf_dec_wr_dvld_hld1_next = leaf_dec_wr_dvld | leaf_dec_wr_dvld_hld1;
    if (dec_pio_ack_next | dec_pio_nack_next | leaf_dec_valid) leaf_dec_wr_dvld_hld1_next = 1'b0;
  end
  
  //------- reg assigns for leaf i/f
  always @ (posedge clk) begin
    if (reset) begin
      leaf_dec_valid_hld1 <= #1  1'b0;
      leaf_dec_wr_dvld_hld1 <= #1  1'b0;
    end
    else begin
      leaf_dec_valid_hld1 <= #1 leaf_dec_valid_hld1_next;
      leaf_dec_wr_dvld_hld1 <= #1 leaf_dec_wr_dvld_hld1_next;
    end
  end
  
  //------- combinatorial assigns for pio ack/nack
  always @ (*) begin
    pio_internal_nack = (pio_read_active | pio_write_active) & ~pio_internal_ack & ~external_transaction_active;
    dec_pio_ack_next = (pio_internal_ack | (pio_external_ack_next & external_transaction_active));
    dec_pio_nack_next = (pio_internal_nack | (pio_external_nack_next & external_transaction_active));
    pio_no_acks = ~(dec_pio_ack | dec_pio_nack | pio_external_ack | pio_external_nack);
    pio_activate_write = (pio_dec_write & ~(dec_pio_ack | dec_pio_nack));
    pio_activate_read = (pio_dec_read & ~(dec_pio_ack | dec_pio_nack));
  end
  
  //------- reg assigns for pio ack/nack
  always @ (posedge clk) begin
    if (reset) begin
      dec_pio_ack <= #1 1'b0;
      dec_pio_nack <= #1 1'b0;
      pio_external_ack <= #1  1'b0;
      pio_external_nack <= #1  1'b0;
    end
    else begin
      dec_pio_ack <= #1 dec_pio_ack ? 1'b0 : dec_pio_ack_next;
      dec_pio_nack <= #1 dec_pio_nack ? 1'b0 : dec_pio_nack_next;
      pio_external_ack <= #1 pio_external_ack_next;
      pio_external_nack <= #1 pio_external_nack_next;
    end
  end
  
  
  //------- address decode
  always @ (*) begin
    pio_internal_ack = 1'b0;
    external_transaction_active = 1'b0;
    pio_external_ack_next = 1'b0;
    pio_external_nack_next = 1'b0;
    dec_pio_read_data_next = 32'b0;
    
    d2l_r0_w = pio_dec_write_data_d1  [31:0] ;
    d2l_r0_we = 1'b0;
    d2l_r0_re = 1'b0;
    d2l_r1_w = pio_dec_write_data_d1  [31:0] ;
    d2l_r1_we = 1'b0;
    d2l_r1_re = 1'b0;
    d2l_r2_w = pio_dec_write_data_d1  [31:0] ;
    d2l_r2_we = 1'b0;
    d2l_r2_re = 1'b0;
    
    casez(pio_dec_address_d1)
    //  Register: r0     Address: 0x0     External: false
    2'b00:
      begin
        d2l_r0_we = pio_write_active & ~dec_pio_ack;
        d2l_r0_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_r0_r;
      end
    //  Register: r1     Address: 0x4     External: false
    2'b01:
      begin
        d2l_r1_we = pio_write_active & ~dec_pio_ack;
        d2l_r1_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_r1_r;
      end
    //  Register: r2     Address: 0x8     External: false
    2'b10:
      begin
        d2l_r2_we = pio_write_active & ~dec_pio_ack;
        d2l_r2_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_r2_r;
      end
    endcase
  end
  
endmodule

//
//---------- module example_addr_map_pio
//
module example_addr_map_pio
(
  clk,
  reset,
  leaf_dec_wr_data,
  leaf_dec_addr,
  leaf_dec_block_sel,
  leaf_dec_valid,
  leaf_dec_wr_dvld,
  leaf_dec_cycle,
  leaf_dec_wr_width,

  l2h_r0_f0_r,
  l2h_r0_f1_r,
  l2h_r0_f2_r,
  l2h_r1_f0_r,
  l2h_r1_f1_r,
  l2h_r2_f0_r,
  l2h_r2_f2_r,
  l2h_r2_f3_r,
  dec_leaf_rd_data,
  dec_leaf_ack,
  dec_leaf_nack,
  dec_leaf_accept,
  dec_leaf_reject,
  dec_leaf_retry_atomic,
  dec_leaf_data_width );

  //------- inputs
  input    clk;
  input    reset;
  input     [31:0] leaf_dec_wr_data;
  input     [39:0] leaf_dec_addr;
  input    leaf_dec_block_sel;
  input    leaf_dec_valid;
  input    leaf_dec_wr_dvld;
  input     [1:0] leaf_dec_cycle;
  input     [2:0] leaf_dec_wr_width;

  //------- outputs
  output     [7:0] l2h_r0_f0_r;
  output     [7:0] l2h_r0_f1_r;
  output     [15:0] l2h_r0_f2_r;
  output     [3:0] l2h_r1_f0_r;
  output     [3:0] l2h_r1_f1_r;
  output     [1:0] l2h_r2_f0_r;
  output     [1:0] l2h_r2_f2_r;
  output     [3:0] l2h_r2_f3_r;
  output     [31:0] dec_leaf_rd_data;
  output    dec_leaf_ack;
  output    dec_leaf_nack;
  output    dec_leaf_accept;
  output    dec_leaf_reject;
  output    dec_leaf_retry_atomic;
  output     [2:0] dec_leaf_data_width;


  //------- wire defines
  wire   [31:0] d2l_r0_w;
  wire  d2l_r0_we;
  wire  d2l_r0_re;
  wire   [31:0] d2l_r1_w;
  wire  d2l_r1_we;
  wire  d2l_r1_re;
  wire   [31:0] d2l_r2_w;
  wire  d2l_r2_we;
  wire  d2l_r2_re;
  wire   [31:0] l2d_r0_r;
  wire   [31:0] l2d_r1_r;
  wire   [31:0] l2d_r2_r;
  
  
  example_addr_map_jrdl_decode pio_decode (
    .clk(clk),
    .reset(reset),
    .leaf_dec_wr_data(leaf_dec_wr_data),
    .leaf_dec_addr(leaf_dec_addr),
    .leaf_dec_block_sel(leaf_dec_block_sel),
    .leaf_dec_valid(leaf_dec_valid),
    .leaf_dec_wr_dvld(leaf_dec_wr_dvld),
    .leaf_dec_cycle(leaf_dec_cycle),
    .leaf_dec_wr_width(leaf_dec_wr_width),
    .l2d_r0_r(l2d_r0_r),
    .l2d_r1_r(l2d_r1_r),
    .l2d_r2_r(l2d_r2_r),
    .dec_leaf_rd_data(dec_leaf_rd_data),
    .dec_leaf_ack(dec_leaf_ack),
    .dec_leaf_nack(dec_leaf_nack),
    .dec_leaf_accept(dec_leaf_accept),
    .dec_leaf_reject(dec_leaf_reject),
    .dec_leaf_retry_atomic(dec_leaf_retry_atomic),
    .dec_leaf_data_width(dec_leaf_data_width),
    .d2l_r0_w(d2l_r0_w),
    .d2l_r0_we(d2l_r0_we),
    .d2l_r0_re(d2l_r0_re),
    .d2l_r1_w(d2l_r1_w),
    .d2l_r1_we(d2l_r1_we),
    .d2l_r1_re(d2l_r1_re),
    .d2l_r2_w(d2l_r2_w),
    .d2l_r2_we(d2l_r2_we),
    .d2l_r2_re(d2l_r2_re) );
    
  example_addr_map_jrdl_logic pio_logic (
    .clk(clk),
    .reset(reset),
    .d2l_r0_w(d2l_r0_w),
    .d2l_r0_we(d2l_r0_we),
    .d2l_r0_re(d2l_r0_re),
    .d2l_r1_w(d2l_r1_w),
    .d2l_r1_we(d2l_r1_we),
    .d2l_r1_re(d2l_r1_re),
    .d2l_r2_w(d2l_r2_w),
    .d2l_r2_we(d2l_r2_we),
    .d2l_r2_re(d2l_r2_re),
    .l2d_r0_r(l2d_r0_r),
    .l2d_r1_r(l2d_r1_r),
    .l2d_r2_r(l2d_r2_r),
    .l2h_r0_f0_r(l2h_r0_f0_r),
    .l2h_r0_f1_r(l2h_r0_f1_r),
    .l2h_r0_f2_r(l2h_r0_f2_r),
    .l2h_r1_f0_r(l2h_r1_f0_r),
    .l2h_r1_f1_r(l2h_r1_f1_r),
    .l2h_r2_f0_r(l2h_r2_f0_r),
    .l2h_r2_f2_r(l2h_r2_f2_r),
    .l2h_r2_f3_r(l2h_r2_f3_r) );
    
endmodule

