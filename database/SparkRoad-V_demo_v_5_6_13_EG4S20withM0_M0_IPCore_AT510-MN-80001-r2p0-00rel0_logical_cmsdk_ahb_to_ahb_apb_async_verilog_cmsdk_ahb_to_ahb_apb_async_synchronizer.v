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

// ----------------------------------------------------------------------------
// CDC synchronizer
// ----------------------------------------------------------------------------

// Standard double flop logic value synchronizer.

module cmsdk_ahb_to_ahb_apb_async_synchronizer (
      input  wire CLK,
      input  wire D,
      output wire Q
   );

   reg [1:0] q_q;

   always @(posedge CLK)
      q_q <= {q_q[0], D};

   assign Q = q_q[1];

endmodule

// ----------------------------------------------------------------------------
// EOF
// ----------------------------------------------------------------------------
