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
// Abstract : Simple reset synchronizer
//-----------------------------------------------------------------------------

// Reset synchroniser
module fpga_rst_sync  (
  input  wire  clk,
  input  wire  rst_n_in,
  input  wire  rst_request,
  output wire  rst_n_out
  );

  reg   [1:0]  reg_rst_sync;

  always @(posedge clk or negedge rst_n_in)
  begin
  if (~rst_n_in)
    reg_rst_sync <= 2'b00;
  else
    if (rst_request)
      reg_rst_sync <= 2'b00;
    else
      reg_rst_sync <= {reg_rst_sync[0], 1'b1};
  end

  assign     rst_n_out = reg_rst_sync[1];

endmodule
