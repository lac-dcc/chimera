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
// Abstract : I2S interface - Async data CDC destination section
//-----------------------------------------------------------------------------

module i2s_async_dest #(
  parameter WIDTH=32
  )
  (
  input   wire               clk,
  input   wire               rst_n,

  input   wire  [WIDTH-1:0]  data_in,         // async input
  input   wire               data_in_valid,   // async input
  output  wire               data_in_ack,
  
  output  wire  [WIDTH-1:0]  data_out,
  output  wire               data_out_valid,
  input   wire               data_out_ack
  );
   
  reg  [WIDTH-1:0]  reg_data_out;  
  wire              sample_data;
  
  wire              data_in_valid_sync;

  reg               reg_buf_full; // Register for data_out_valid
  wire              nxt_buf_full;
  
  reg               reg_data_in_ack; // Register for data_in_ack
  wire              nxt_data_in_ack;

  // Sample the data when buffer is empty and data input request is valid
  assign sample_data  = (~reg_buf_full) & data_in_valid_sync & ~reg_data_in_ack;
  // Next state for buffer status
  assign nxt_buf_full = sample_data | (reg_buf_full & ~data_out_ack);

  // Register buffer full status
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_buf_full <= 1'b0;
  else
    reg_buf_full <= nxt_buf_full;
  end

  // Acknowledge when data has been sampled
  // deassert ACK when data_in_valid_sync is low
  assign nxt_data_in_ack = sample_data | 
    (reg_data_in_ack & data_in_valid_sync);    
  
  // Register Data In ACK (back to source)
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_data_in_ack <= 1'b0;
  else
    reg_data_in_ack <= nxt_data_in_ack;
  end

  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_data_out <= {WIDTH{1'b0}};
  else if (sample_data)
    reg_data_out <= data_in;
  end
  
  assign data_out       = reg_data_out;
  assign data_out_valid = reg_buf_full;
  assign data_in_ack    = reg_data_in_ack;

  //--------------------------------------------
  // Synchroniser

  i2s_sync_cell u_i2s_sync_cell (
    .clk    (clk),
    .rst_n  (rst_n),
    .din    (data_in_valid),
    .dout   (data_in_valid_sync)
  );  

endmodule

