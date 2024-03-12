//  --=====================================================================--
//  This confidential and proprietary software may be used only as
//  authorised by a licensing agreement from ARM Limited
//   (C) COPYRIGHT 2013 ARM Limited
//        ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorised
//  copies and copies may only be made to the extent permitted
//  by a licensing agreement from ARM Limited.
//
//  -------------------------------------------------------------------------
//  Version and Release Control Information:
//
//   File Revision       :
//
//   Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//  -------------------------------------------------------------------------
//
//
//  -------------------------------------------------------------------------
//  Purpose: Metastability regs
//  -------------------------------------------------------------------------
module meta_regs (
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
