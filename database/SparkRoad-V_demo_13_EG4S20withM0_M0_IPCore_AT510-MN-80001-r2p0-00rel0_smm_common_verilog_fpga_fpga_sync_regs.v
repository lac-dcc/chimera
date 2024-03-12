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
// Abstract : Synchronization registers for metastability prevention
//-----------------------------------------------------------------------------

module fpga_sync_regs (
  dest_clk,
  dest_resetn,
  source_data,
  dest_data
  );

//  Simple metastability register

parameter INPUT_WIDTH      = 8;                 // Width of data bus
parameter INPUT_MAX        = INPUT_WIDTH - 1;   // Upper bound of data vector

  input                dest_clk;
  input                dest_resetn;
  input  [INPUT_MAX:0] source_data;
  output [INPUT_MAX:0] dest_data;

  // synchronization registers to avoid metastability issue
  wire [INPUT_MAX:0] dest_data;
  reg  [INPUT_MAX:0] dest_data_i1;
  reg  [INPUT_MAX:0] dest_data_i2;

  always @ (posedge dest_clk or negedge dest_resetn)
  begin
  if (!dest_resetn) begin
    dest_data_i1 <= {INPUT_WIDTH{1'b0}};
    dest_data_i2 <= {INPUT_WIDTH{1'b0}};
  end else begin
    dest_data_i1 <= source_data;
    dest_data_i2 <= dest_data_i1;
  end
  end

  assign dest_data = dest_data_i2;

endmodule
