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
// Abstract : I2S interface - Async data CDC source section
//-----------------------------------------------------------------------------

module i2s_async_src #(
  parameter WIDTH=32
  )
  (
  input   wire               clk,
  input   wire               rst_n,

  input   wire  [WIDTH-1:0]  data_in,
  input   wire               data_in_valid,
  output  wire               data_in_ack,
  
  output  wire  [WIDTH-1:0]  data_out,
  output  wire               data_out_valid,
  input   wire               data_out_ack    // async input
  );
  
  reg        [1:0]  reg_state;  
  // 00 - idle
  // 01 - data output, valid high, wait for ack to set
  // 10 - data output, valid low, wait for ack to clear
  reg        [1:0]  nxt_state;
  
  reg  [WIDTH-1:0]  reg_data_out;  
  wire              data_out_update;
  
  wire              data_out_ack_sync;

  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_state <= {2{1'b0}};
  else
    reg_state <= nxt_state;
  end

  always @(reg_state or data_in_valid or data_out_ack_sync)
  begin
  case (reg_state)
    2'b00: nxt_state = (data_in_valid) ? 2'b01 : 2'b00;
    2'b01: nxt_state = (data_out_ack_sync) ? 2'b10 : 2'b01;
    2'b10: nxt_state = (~data_out_ack_sync) ? 2'b00 : 2'b10;
    2'b11: nxt_state = 2'b00;
  endcase
  end
  
  assign data_out_update = (data_in_valid & (reg_state==2'b00));
  assign data_in_ack = data_out_update;
  assign data_out_valid = reg_state[0];
  
  always @(posedge clk or negedge rst_n)
  begin
  if (~rst_n)
    reg_data_out <= {WIDTH{1'b0}};
  else if (data_out_update)
    reg_data_out <= data_in;
  end
  
  assign data_out = reg_data_out;

  //--------------------------------------------
  // Synchroniser

  i2s_sync_cell u_i2s_sync_cell (
    .clk    (clk),
    .rst_n  (rst_n),
    .din    (data_out_ack),
    .dout   (data_out_ack_sync)
  );  

endmodule
