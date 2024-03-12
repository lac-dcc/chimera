//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : I2S interface - Simple 4 entries FIFO
//-----------------------------------------------------------------------------

module i2s_fifo_4 #(
  parameter WIDTH=32
  )
  (
  input   wire               clk,
  input   wire               rst_n,

  input   wire               fifo_reset,
  
  input   wire  [WIDTH-1:0]  data_in,
  input   wire               data_in_valid,
  output  wire               data_in_ack,
  output  wire               fifo_full,
  output  wire               fifo_empty,
  
  output  wire  [WIDTH-1:0]  data_out,
  output  wire               data_out_valid,
  input   wire               data_out_ack,
  
  output  wire   [2:0]       fifo_space
  );
  
  localparam ptr_w=3;
  
  reg   [ptr_w-1:0]  reg_wr_ptr;    // Write pointer
  reg   [ptr_w-1:0]  reg_rd_ptr;    // read pointer
  reg   [ptr_w-1:0]  nxt_wr_ptr;    // Write pointer
  reg   [ptr_w-1:0]  nxt_rd_ptr;    // read pointer
  
  reg   [WIDTH-1:0]  reg_buf0;      // FIFO registers
  reg   [WIDTH-1:0]  reg_buf1;
  reg   [WIDTH-1:0]  reg_buf2;
  reg   [WIDTH-1:0]  reg_buf3;

  //-----------------------------------------------
  // Write pointer
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_wr_ptr <= {ptr_w{1'b0}};
  else if (fifo_reset | (data_in_valid & data_in_ack))
    reg_wr_ptr <= nxt_wr_ptr;
  end
  
  always @(reg_wr_ptr or fifo_reset or data_in_valid or fifo_full)
  begin
  if (fifo_reset)
    nxt_wr_ptr = {ptr_w{1'b0}};
  else
    // increment if (data_in_valid & ~fifo_full)
    nxt_wr_ptr = reg_wr_ptr + (data_in_valid & ~fifo_full);
  end
    
  //-----------------------------------------------
  // Read pointer
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_rd_ptr <= {ptr_w{1'b0}};
  else if (fifo_reset | (data_out_valid & data_out_ack))
    reg_rd_ptr <= nxt_rd_ptr;
  end
  
  always @(reg_rd_ptr or fifo_reset or data_out_valid or data_out_ack)
  begin
  if (fifo_reset)
    nxt_rd_ptr = {ptr_w{1'b0}};
  else
    // increment if (data_out_valid & data_out_ack)
    nxt_rd_ptr = reg_rd_ptr + (data_out_valid & data_out_ack);
  end

  //-----------------------------------------------
  // FIFO control
  assign data_in_ack = ~fifo_reset & (data_in_valid & ~fifo_full);
  assign fifo_full   = (reg_wr_ptr[1:0]==reg_rd_ptr[1:0]) &
                       (reg_wr_ptr[2]  !=reg_rd_ptr[2]);
  assign fifo_empty  = (reg_wr_ptr[2:0]==reg_rd_ptr[2:0]);
  assign data_out_valid = (reg_wr_ptr[2:0]!=reg_rd_ptr[2:0]);

  wire [1:0] fifo_space_tmp = reg_rd_ptr[1:0] - reg_wr_ptr[1:0];
  
  assign fifo_space = (fifo_empty) ? 3'b100 :
                      {1'b0, fifo_space_tmp};

  //-----------------------------------------------
  // FIFO data
  
  // Data #0
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_buf0 <= {WIDTH{1'b0}};
  else if (data_in_ack & (reg_wr_ptr[1:0]==2'b00))
    reg_buf0 <= data_in;
  end

  // Data #1
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_buf1 <= {WIDTH{1'b0}};
  else if (data_in_ack & (reg_wr_ptr[1:0]==2'b01))
    reg_buf1 <= data_in;
  end

  // Data #2
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_buf2 <= {WIDTH{1'b0}};
  else if (data_in_ack & (reg_wr_ptr[1:0]==2'b10))
    reg_buf2 <= data_in;
  end
  
  // Data #3
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_buf3 <= {WIDTH{1'b0}};
  else if (data_in_ack & (reg_wr_ptr[1:0]==2'b11))
    reg_buf3 <= data_in;
  end

  // Read mux
  assign data_out = (reg_buf0 & {WIDTH{(reg_rd_ptr[1:0]==2'b00)}}) |
                    (reg_buf1 & {WIDTH{(reg_rd_ptr[1:0]==2'b01)}}) |
                    (reg_buf2 & {WIDTH{(reg_rd_ptr[1:0]==2'b10)}}) |
                    (reg_buf3 & {WIDTH{(reg_rd_ptr[1:0]==2'b11)}}) ;

endmodule
      
