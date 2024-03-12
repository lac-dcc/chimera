//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2008-2010 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//------------------------------------------------------------------------------
// Version and Release Control Information:
//
// File Revision       :  7369 
// File Date           :  2010-04-27 20:30:45 +0530 (Tue, 27 Apr 2010) 
// Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//------------------------------------------------------------------------------
//  Purpose : This is a cdc launch block. It contains the cdc launch register
//            and an OVL to assert that the output of the block is gray encoded
//------------------------------------------------------------------------------

module cxapbasyncbridge_cdc_launch_gry (
  clk, 
  resetn, 
  enable,
  in_cdc,
  out_async
  );

  parameter WIDTH = 1;
  
  // ------------------------------------------------------
  // port declaration
  // ------------------------------------------------------
  input               clk; 
  input               resetn; 
  input               enable;
  input  [WIDTH-1:0]  in_cdc;
  output [WIDTH-1:0]  out_async;

  // -------------------------------------------
  // reg/wire declarations
  // ------------------------------------------------------

  reg   [WIDTH-1:0]  out_async;

  always@(posedge clk or negedge resetn)
     begin : p_cdc_launch_seq
        if(!resetn)
           out_async <= {WIDTH{1'b0}};
        else if (enable)
           out_async <= in_cdc;
     end

`ifdef ARM_ASSERT_ON

  //----------------------------------------------------------------------------
  // OVL_ASSERT: Check that the value is correctly gray encoded
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  // OVL_ASSERT_RTL
  ovl_code_distance
    #(0, 1, 1, WIDTH, 0, "Clock domain crossing signal is not correctly gray encoded")
      ovl_gray_enc_check
        (.clock        (clk),
         .reset      (resetn),
         .enable     (1'b1),
         .test_expr1 (in_cdc),
         .test_expr2 (out_async),
         .fire       ());
  // OVL_ASSERT_END

`endif
  
endmodule
