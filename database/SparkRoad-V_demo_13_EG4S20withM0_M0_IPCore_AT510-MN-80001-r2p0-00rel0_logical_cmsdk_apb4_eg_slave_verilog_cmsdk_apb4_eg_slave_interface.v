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
//      Checked In          : $Date: 2012-07-31 10:47:23 +0100 (Tue, 31 Jul 2012) $
//
//      Revision            : $Revision: 217027 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AMBA APB4 example slave interface module. Transfer APB BUS protocol to
//            simple register read write protocol
//-----------------------------------------------------------------------------
module cmsdk_apb4_eg_slave_interface #(
  // parameter for address width
  parameter ADDRWIDTH = 12)
 (
  // IO declaration

  input  wire                    pclk,     // pclk
  input  wire                    presetn,  // reset

  // apb interface inputs
  input  wire                    psel,
  input  wire [ADDRWIDTH-1:0]    paddr,
  input  wire                    penable,
  input  wire                    pwrite,
  input  wire [31:0]             pwdata,
  input  wire [3:0]              pstrb,

  // apb interface outputs
  output wire [31:0]             prdata,
  output wire                    pready,
  output wire                    pslverr,

  //Register interface
  output wire [ADDRWIDTH-1:0]    addr,
  output wire                    read_en,
  output wire                    write_en,
  output wire [3:0]              byte_strobe,
  output wire [31:0]             wdata,
  input  wire [31:0]             rdata);


 //--------------------------
  // ----------------------------------------------------
 // module logic start
 //------------------------------------------------------------------------------

// APB interface
assign   pready  = 1'b1; //always ready. Can be customized to support waitstate if required.
assign   pslverr = 1'b0; //always OKAY. Can be customized to support error response if required.


// register read and write signal
assign  addr = paddr;
assign  read_en  = psel & (~pwrite); // assert for whole apb read transfer
assign  write_en = psel & (~penable) & pwrite; // assert for 1st cycle of write transfer
        // It is also possible to change the design to perform the write in the 2nd
        // APB cycle.   E.g.
        //   assign write_en = psel & penable & pwrite;
        // However, if the design generate waitstate, this expression will result
        // in write_en being asserted for multiple cycles.
assign  byte_strobe = pstrb;
assign  wdata       = pwdata;
assign  prdata      = rdata;

`ifdef ARM_APB_ASSERT_ON

 `include "std_ovl_defines.h"
  // ------------------------------------------------------------
  // Assertions
  // ------------------------------------------------------------

  // Check error response should not be generated if not selected
    assert_never
     #(`OVL_ERROR,
       `OVL_ASSERT,
       "Error! Should not generate error response if not selected")
     u_ovl_apb4_eg_slave_response_illegal
     (.clk        (pclk),
      .reset_n    (presetn),
      .test_expr  (pslverr & pready & (~psel))
      );

`endif
 //------------------------------------------------------------------------------
 // module logic end
 //------------------------------------------------------------------------------

endmodule


