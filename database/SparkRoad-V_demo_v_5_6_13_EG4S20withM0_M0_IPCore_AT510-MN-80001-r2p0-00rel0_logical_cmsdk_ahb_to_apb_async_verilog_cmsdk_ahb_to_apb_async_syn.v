//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-10 15:07:36 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243494 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Synchronizer for AHB to APB bridge asynchronous bridge
//-----------------------------------------------------------------------------
// The module define a double flip-flop synchronizer
//
module cmsdk_ahb_to_apb_async_syn (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input  wire      clk,
  input  wire      resetn,

  input  wire      enable,
  input  wire      d_in,

  output wire      d_out);

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------
  reg         sync_reg_1;
  reg         sync_reg_2;

  // --------------------------------------------------------------------------
  // Start of main code
  // --------------------------------------------------------------------------

  // Double flip-flop syncrhonizer
  always @(posedge clk or negedge resetn)
  begin
  if (~resetn)
    begin
    sync_reg_1 <= 1'b0;
    sync_reg_2 <= 1'b0;
    end
  else if (enable)
    begin
    sync_reg_1 <= d_in;
    sync_reg_2 <= sync_reg_1;
    end
  end

  assign  d_out = sync_reg_2;

endmodule
