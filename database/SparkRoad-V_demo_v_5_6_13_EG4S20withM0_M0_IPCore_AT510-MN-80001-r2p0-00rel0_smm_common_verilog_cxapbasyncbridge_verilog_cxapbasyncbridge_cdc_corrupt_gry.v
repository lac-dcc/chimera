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
//  Purpose : This is a cdc corruption block.
//            It is a non-functional verification block that (when enabled)
//            corrupts any bit of data from the point at which it changes
//            until either the next capture clock edge or another bit changes.
//------------------------------------------------------------------------------

module cxapbasyncbridge_cdc_corrupt_gry (
  clk, 
  resetn, 
  sync,
  d_async,
  q_async
  );

  parameter WIDTH = 1;
  
  // ------------------------------------------------------
  // port declaration
  // ------------------------------------------------------
  input               clk; 
  input               resetn; 
  input               sync;
  input  [WIDTH-1:0]  d_async;
  output [WIDTH-1:0]  q_async;

  // -------------------------------------------
  // reg/wire declarations
  // ------------------------------------------------------

`ifdef ARM_CDC_CHECK

  reg      [WIDTH-1:0]  d_latch;
  reg      [WIDTH-1:0]  out_async;
  reg      [WIDTH-1:0]  corrupt;
  wire     [WIDTH-1:0]  change_vector;
  wire                  change;

  integer            i;

  //Bypass when in sync mode
  assign q_async = (sync) ? d_async : out_async;

  //Latch to detect changes in d_async
  always @(d_async)
     d_latch <= d_async; 

  //Create change vector (single delta cycle)
  assign change_vector = (d_async ^ d_latch);

  //Create a change pulse (single delta cycle)
  assign change = |change_vector;
  
  //Corrupt bits 
  always @(posedge clk or posedge change)
    begin 
       if (change) begin
          corrupt <= change_vector;
       end else begin
          corrupt <= {WIDTH{1'b0}};
       end
    end

  always @(corrupt or d_async)
    for (i = 0; i < WIDTH; i=i+1) begin
       out_async[i] = corrupt[i] ? 1'bz : d_async[i];
    end   
  
`else

  assign q_async = d_async;

`endif
  
endmodule
