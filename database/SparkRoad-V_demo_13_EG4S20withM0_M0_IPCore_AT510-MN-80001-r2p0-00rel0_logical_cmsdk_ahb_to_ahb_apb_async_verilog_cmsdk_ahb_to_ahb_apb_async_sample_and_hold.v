//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2012-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//   Checked In : $Date: 2013-03-27 10:42:39 +0000 (Wed, 27 Mar 2013) $
//   Revision   : $Revision: 242361 $
//   Release    : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// CDC sample and hold
//-----------------------------------------------------------------------------

// Cell implementing a D-type enabled flop with guaranteed electrically stable
// output when clocked but not enabled (i.e. an actual implementation may want
// to use a clock gate feeding a D-type here) followed by a hard AND gate
// guaranteed to produce a stable logic zero as long as at least one of its
// inputs is a stable logic zero.

module cmsdk_ahb_to_ahb_apb_async_sample_and_hold #(
      parameter WIDTH = 32
   ) (
      input  wire             CLK,
      input  wire             EN,
      input  wire             MASK,
      input  wire [WIDTH-1:0] D,
      output wire [WIDTH-1:0] Q
   );

   // --------
   // Clock enabled D-type register.

   reg [WIDTH-1:0] q_q;

   always @(posedge CLK)
      if(EN)
         q_q <= D;

   // --------
   // Mask with hard AND gate.

   assign Q = q_q & {WIDTH{~MASK}};

endmodule

// ----------------------------------------------------------------------------
// EOF
// ----------------------------------------------------------------------------
