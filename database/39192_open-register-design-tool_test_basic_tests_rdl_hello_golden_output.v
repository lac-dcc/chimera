// This program was cloned from: https://github.com/Juniper/open-register-design-tool
// License: Apache License 2.0

//   Ordt 191120.01 autogenerated file 
//   Input: ./rdl_hello/test.rdl
//   Parms: ./rdl_hello/test.parms
//   Date: Wed Nov 20 22:21:09 EST 2019
//

//
//---------- module foo_jrdl_logic
//
module foo_jrdl_logic
(
  clk,
  reset,
  d2l_bar_a_reg_0_w,
  d2l_bar_a_reg_0_we,
  d2l_bar_a_reg_0_re,
  d2l_bar_a_reg_1_w,
  d2l_bar_a_reg_1_we,
  d2l_bar_a_reg_1_re,
  h2l_bar_a_reg_0_fld1_w,
  h2l_bar_a_reg_0_fld1_we,
  h2l_bar_a_reg_1_fld1_w,
  h2l_bar_a_reg_1_fld1_we,

  l2d_bar_a_reg_0_r,
  l2d_bar_a_reg_1_r,
  l2h_bar_a_reg_0_fld1_r,
  l2h_bar_a_reg_0_fld2_r,
  l2h_bar_a_reg_0_ERR25_r,
  l2h_bar_a_reg_1_fld1_r,
  l2h_bar_a_reg_1_fld2_r,
  l2h_bar_a_reg_1_ERR25_r );

  //------- inputs
  input    clk;
  input    reset;
  input     [31:0] d2l_bar_a_reg_0_w;
  input    d2l_bar_a_reg_0_we;
  input    d2l_bar_a_reg_0_re;
  input     [31:0] d2l_bar_a_reg_1_w;
  input    d2l_bar_a_reg_1_we;
  input    d2l_bar_a_reg_1_re;
  input     [9:0] h2l_bar_a_reg_0_fld1_w;
  input    h2l_bar_a_reg_0_fld1_we;
  input     [9:0] h2l_bar_a_reg_1_fld1_w;
  input    h2l_bar_a_reg_1_fld1_we;

  //------- outputs
  output     [31:0] l2d_bar_a_reg_0_r;
  output     [31:0] l2d_bar_a_reg_1_r;
  output     [9:0] l2h_bar_a_reg_0_fld1_r;
  output    l2h_bar_a_reg_0_fld2_r;
  output    l2h_bar_a_reg_0_ERR25_r;
  output     [9:0] l2h_bar_a_reg_1_fld1_r;
  output    l2h_bar_a_reg_1_fld2_r;
  output    l2h_bar_a_reg_1_ERR25_r;


  //------- reg defines
  reg   [9:0] rg_bar_a_reg_0_fld1;
  reg   [9:0] reg_bar_a_reg_0_fld1_next;
  reg   [9:0] l2h_bar_a_reg_0_fld1_r;
  reg  rg_bar_a_reg_0_fld2;
  reg  reg_bar_a_reg_0_fld2_next;
  reg  l2h_bar_a_reg_0_fld2_r;
  reg  rg_bar_a_reg_0_ERR25;
  reg  reg_bar_a_reg_0_ERR25_next;
  reg  l2h_bar_a_reg_0_ERR25_r;
  reg   [31:0] l2d_bar_a_reg_0_r;
  reg   [9:0] rg_bar_a_reg_1_fld1;
  reg   [9:0] reg_bar_a_reg_1_fld1_next;
  reg   [9:0] l2h_bar_a_reg_1_fld1_r;
  reg  rg_bar_a_reg_1_fld2;
  reg  reg_bar_a_reg_1_fld2_next;
  reg  l2h_bar_a_reg_1_fld2_r;
  reg  rg_bar_a_reg_1_ERR25;
  reg  reg_bar_a_reg_1_ERR25_next;
  reg  l2h_bar_a_reg_1_ERR25_r;
  reg   [31:0] l2d_bar_a_reg_1_r;
  
  
  //------- combinatorial assigns for bar_a_reg_1 (pio read data)
  always @ (*) begin
    l2d_bar_a_reg_1_r = 32'b0;
    l2d_bar_a_reg_1_r [9:0]  = rg_bar_a_reg_1_fld1;
    l2d_bar_a_reg_1_r [15]  = rg_bar_a_reg_1_fld2;
    l2d_bar_a_reg_1_r [25]  = rg_bar_a_reg_1_ERR25;
  end
  
  //------- combinatorial assigns for bar_a_reg_0
  always @ (*) begin
    reg_bar_a_reg_0_fld1_next = rg_bar_a_reg_0_fld1;
    l2h_bar_a_reg_0_fld1_r = rg_bar_a_reg_0_fld1;
    reg_bar_a_reg_0_fld2_next = rg_bar_a_reg_0_fld2;
    l2h_bar_a_reg_0_fld2_r = rg_bar_a_reg_0_fld2;
    reg_bar_a_reg_0_ERR25_next = rg_bar_a_reg_0_ERR25;
    l2h_bar_a_reg_0_ERR25_r = rg_bar_a_reg_0_ERR25;
    if (h2l_bar_a_reg_0_fld1_we) reg_bar_a_reg_0_fld1_next = h2l_bar_a_reg_0_fld1_w;
    if (d2l_bar_a_reg_0_we) reg_bar_a_reg_0_fld1_next = d2l_bar_a_reg_0_w [9:0] ;
    if (d2l_bar_a_reg_0_we) reg_bar_a_reg_0_fld2_next = d2l_bar_a_reg_0_w [15] ;
    if (d2l_bar_a_reg_0_we) reg_bar_a_reg_0_ERR25_next = d2l_bar_a_reg_0_w [25] ;
  end
  
  //------- reg assigns for bar_a_reg_0
  always @ (posedge clk) begin
    if (reset) begin
      rg_bar_a_reg_0_fld1 <= #1 10'd0;
      rg_bar_a_reg_0_ERR25 <= #1 1'h1;
    end
    else begin
      rg_bar_a_reg_0_fld1 <= #1  reg_bar_a_reg_0_fld1_next;
      rg_bar_a_reg_0_ERR25 <= #1  reg_bar_a_reg_0_ERR25_next;
    end
    rg_bar_a_reg_0_fld2 <= #1  reg_bar_a_reg_0_fld2_next;
  end
  
  //------- combinatorial assigns for bar_a_reg_1
  always @ (*) begin
    reg_bar_a_reg_1_fld1_next = rg_bar_a_reg_1_fld1;
    l2h_bar_a_reg_1_fld1_r = rg_bar_a_reg_1_fld1;
    reg_bar_a_reg_1_fld2_next = rg_bar_a_reg_1_fld2;
    l2h_bar_a_reg_1_fld2_r = rg_bar_a_reg_1_fld2;
    reg_bar_a_reg_1_ERR25_next = rg_bar_a_reg_1_ERR25;
    l2h_bar_a_reg_1_ERR25_r = rg_bar_a_reg_1_ERR25;
    if (h2l_bar_a_reg_1_fld1_we) reg_bar_a_reg_1_fld1_next = h2l_bar_a_reg_1_fld1_w;
    if (d2l_bar_a_reg_1_we) reg_bar_a_reg_1_fld1_next = d2l_bar_a_reg_1_w [9:0] ;
    if (d2l_bar_a_reg_1_we) reg_bar_a_reg_1_fld2_next = d2l_bar_a_reg_1_w [15] ;
    if (d2l_bar_a_reg_1_we) reg_bar_a_reg_1_ERR25_next = d2l_bar_a_reg_1_w [25] ;
  end
  
  //------- reg assigns for bar_a_reg_1
  always @ (posedge clk) begin
    if (reset) begin
      rg_bar_a_reg_1_fld1 <= #1 10'd0;
      rg_bar_a_reg_1_ERR25 <= #1 1'h1;
    end
    else begin
      rg_bar_a_reg_1_fld1 <= #1  reg_bar_a_reg_1_fld1_next;
      rg_bar_a_reg_1_ERR25 <= #1  reg_bar_a_reg_1_ERR25_next;
    end
    rg_bar_a_reg_1_fld2 <= #1  reg_bar_a_reg_1_fld2_next;
  end
  
  //------- combinatorial assigns for bar_a_reg_0 (pio read data)
  always @ (*) begin
    l2d_bar_a_reg_0_r = 32'b0;
    l2d_bar_a_reg_0_r [9:0]  = rg_bar_a_reg_0_fld1;
    l2d_bar_a_reg_0_r [15]  = rg_bar_a_reg_0_fld2;
    l2d_bar_a_reg_0_r [25]  = rg_bar_a_reg_0_ERR25;
  end
  
endmodule

//
//---------- module foo_jrdl_decode
//
module foo_jrdl_decode
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
  l2d_bar_a_reg_0_r,
  l2d_bar_a_reg_1_r,

  dec_leaf_rd_data,
  dec_leaf_ack,
  dec_leaf_nack,
  dec_leaf_accept,
  dec_leaf_reject,
  dec_leaf_retry_atomic,
  dec_leaf_data_width,
  d2l_bar_a_reg_0_w,
  d2l_bar_a_reg_0_we,
  d2l_bar_a_reg_0_re,
  d2l_bar_a_reg_1_w,
  d2l_bar_a_reg_1_we,
  d2l_bar_a_reg_1_re );

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
  input     [31:0] l2d_bar_a_reg_0_r;
  input     [31:0] l2d_bar_a_reg_1_r;

  //------- outputs
  output     [31:0] dec_leaf_rd_data;
  output    dec_leaf_ack;
  output    dec_leaf_nack;
  output    dec_leaf_accept;
  output    dec_leaf_reject;
  output    dec_leaf_retry_atomic;
  output     [2:0] dec_leaf_data_width;
  output     [31:0] d2l_bar_a_reg_0_w;
  output    d2l_bar_a_reg_0_we;
  output    d2l_bar_a_reg_0_re;
  output     [31:0] d2l_bar_a_reg_1_w;
  output    d2l_bar_a_reg_1_we;
  output    d2l_bar_a_reg_1_re;


  //------- wire defines
  wire   [31:0] pio_dec_write_data;
  wire  pio_dec_address;
  wire  pio_dec_read;
  wire  pio_dec_write;
  wire   [39:0] block_sel_addr;
  wire  block_sel;
  wire  leaf_dec_valid_active;
  wire  leaf_dec_wr_dvld_active;
  
  //------- reg defines
  reg   [31:0] d2l_bar_a_reg_0_w;
  reg  d2l_bar_a_reg_0_we;
  reg  d2l_bar_a_reg_0_re;
  reg   [31:0] d2l_bar_a_reg_1_w;
  reg  d2l_bar_a_reg_1_we;
  reg  d2l_bar_a_reg_1_re;
  reg  leaf_dec_valid_hld1;
  reg  leaf_dec_valid_hld1_next;
  reg  leaf_dec_wr_dvld_hld1;
  reg  leaf_dec_wr_dvld_hld1_next;
  reg  pio_write_active;
  reg  pio_read_active;
  reg  pio_dec_address_d1;
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
  assign  pio_dec_address = leaf_dec_addr [2] ;
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
    
    d2l_bar_a_reg_0_w = pio_dec_write_data_d1  [31:0] ;
    d2l_bar_a_reg_0_we = 1'b0;
    d2l_bar_a_reg_0_re = 1'b0;
    d2l_bar_a_reg_1_w = pio_dec_write_data_d1  [31:0] ;
    d2l_bar_a_reg_1_we = 1'b0;
    d2l_bar_a_reg_1_re = 1'b0;
    
    casez(pio_dec_address_d1)
    //  Register: bar.a_reg_0     Address: 0x0     External: false
    1'b0:
      begin
        d2l_bar_a_reg_0_we = pio_write_active & ~dec_pio_ack;
        d2l_bar_a_reg_0_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_bar_a_reg_0_r;
      end
    //  Register: bar.a_reg_1     Address: 0x4     External: false
    1'b1:
      begin
        d2l_bar_a_reg_1_we = pio_write_active & ~dec_pio_ack;
        d2l_bar_a_reg_1_re = pio_read_active & ~dec_pio_ack;
        pio_internal_ack =  pio_read_active | pio_write_active;
        dec_pio_read_data_next  [31:0]  = l2d_bar_a_reg_1_r;
      end
    endcase
  end
  
endmodule

//
//---------- module foo_pio
//
module foo_pio
(
  clk,
  reset,
  h2l_bar_a_reg_0_fld1_w,
  h2l_bar_a_reg_0_fld1_we,
  h2l_bar_a_reg_1_fld1_w,
  h2l_bar_a_reg_1_fld1_we,
  leaf_dec_wr_data,
  leaf_dec_addr,
  leaf_dec_block_sel,
  leaf_dec_valid,
  leaf_dec_wr_dvld,
  leaf_dec_cycle,
  leaf_dec_wr_width,

  l2h_bar_a_reg_0_fld1_r,
  l2h_bar_a_reg_0_fld2_r,
  l2h_bar_a_reg_0_ERR25_r,
  l2h_bar_a_reg_1_fld1_r,
  l2h_bar_a_reg_1_fld2_r,
  l2h_bar_a_reg_1_ERR25_r,
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
  input     [9:0] h2l_bar_a_reg_0_fld1_w;
  input    h2l_bar_a_reg_0_fld1_we;
  input     [9:0] h2l_bar_a_reg_1_fld1_w;
  input    h2l_bar_a_reg_1_fld1_we;
  input     [31:0] leaf_dec_wr_data;
  input     [39:0] leaf_dec_addr;
  input    leaf_dec_block_sel;
  input    leaf_dec_valid;
  input    leaf_dec_wr_dvld;
  input     [1:0] leaf_dec_cycle;
  input     [2:0] leaf_dec_wr_width;

  //------- outputs
  output     [9:0] l2h_bar_a_reg_0_fld1_r;
  output    l2h_bar_a_reg_0_fld2_r;
  output    l2h_bar_a_reg_0_ERR25_r;
  output     [9:0] l2h_bar_a_reg_1_fld1_r;
  output    l2h_bar_a_reg_1_fld2_r;
  output    l2h_bar_a_reg_1_ERR25_r;
  output     [31:0] dec_leaf_rd_data;
  output    dec_leaf_ack;
  output    dec_leaf_nack;
  output    dec_leaf_accept;
  output    dec_leaf_reject;
  output    dec_leaf_retry_atomic;
  output     [2:0] dec_leaf_data_width;


  //------- wire defines
  wire   [31:0] d2l_bar_a_reg_0_w;
  wire  d2l_bar_a_reg_0_we;
  wire  d2l_bar_a_reg_0_re;
  wire   [31:0] d2l_bar_a_reg_1_w;
  wire  d2l_bar_a_reg_1_we;
  wire  d2l_bar_a_reg_1_re;
  wire   [31:0] l2d_bar_a_reg_0_r;
  wire   [31:0] l2d_bar_a_reg_1_r;
  
  
  foo_jrdl_decode pio_decode (
    .clk(clk),
    .reset(reset),
    .leaf_dec_wr_data(leaf_dec_wr_data),
    .leaf_dec_addr(leaf_dec_addr),
    .leaf_dec_block_sel(leaf_dec_block_sel),
    .leaf_dec_valid(leaf_dec_valid),
    .leaf_dec_wr_dvld(leaf_dec_wr_dvld),
    .leaf_dec_cycle(leaf_dec_cycle),
    .leaf_dec_wr_width(leaf_dec_wr_width),
    .l2d_bar_a_reg_0_r(l2d_bar_a_reg_0_r),
    .l2d_bar_a_reg_1_r(l2d_bar_a_reg_1_r),
    .dec_leaf_rd_data(dec_leaf_rd_data),
    .dec_leaf_ack(dec_leaf_ack),
    .dec_leaf_nack(dec_leaf_nack),
    .dec_leaf_accept(dec_leaf_accept),
    .dec_leaf_reject(dec_leaf_reject),
    .dec_leaf_retry_atomic(dec_leaf_retry_atomic),
    .dec_leaf_data_width(dec_leaf_data_width),
    .d2l_bar_a_reg_0_w(d2l_bar_a_reg_0_w),
    .d2l_bar_a_reg_0_we(d2l_bar_a_reg_0_we),
    .d2l_bar_a_reg_0_re(d2l_bar_a_reg_0_re),
    .d2l_bar_a_reg_1_w(d2l_bar_a_reg_1_w),
    .d2l_bar_a_reg_1_we(d2l_bar_a_reg_1_we),
    .d2l_bar_a_reg_1_re(d2l_bar_a_reg_1_re) );
    
  foo_jrdl_logic pio_logic (
    .clk(clk),
    .reset(reset),
    .d2l_bar_a_reg_0_w(d2l_bar_a_reg_0_w),
    .d2l_bar_a_reg_0_we(d2l_bar_a_reg_0_we),
    .d2l_bar_a_reg_0_re(d2l_bar_a_reg_0_re),
    .d2l_bar_a_reg_1_w(d2l_bar_a_reg_1_w),
    .d2l_bar_a_reg_1_we(d2l_bar_a_reg_1_we),
    .d2l_bar_a_reg_1_re(d2l_bar_a_reg_1_re),
    .h2l_bar_a_reg_0_fld1_w(h2l_bar_a_reg_0_fld1_w),
    .h2l_bar_a_reg_0_fld1_we(h2l_bar_a_reg_0_fld1_we),
    .h2l_bar_a_reg_1_fld1_w(h2l_bar_a_reg_1_fld1_w),
    .h2l_bar_a_reg_1_fld1_we(h2l_bar_a_reg_1_fld1_we),
    .l2d_bar_a_reg_0_r(l2d_bar_a_reg_0_r),
    .l2d_bar_a_reg_1_r(l2d_bar_a_reg_1_r),
    .l2h_bar_a_reg_0_fld1_r(l2h_bar_a_reg_0_fld1_r),
    .l2h_bar_a_reg_0_fld2_r(l2h_bar_a_reg_0_fld2_r),
    .l2h_bar_a_reg_0_ERR25_r(l2h_bar_a_reg_0_ERR25_r),
    .l2h_bar_a_reg_1_fld1_r(l2h_bar_a_reg_1_fld1_r),
    .l2h_bar_a_reg_1_fld2_r(l2h_bar_a_reg_1_fld2_r),
    .l2h_bar_a_reg_1_ERR25_r(l2h_bar_a_reg_1_ERR25_r) );
    
endmodule

