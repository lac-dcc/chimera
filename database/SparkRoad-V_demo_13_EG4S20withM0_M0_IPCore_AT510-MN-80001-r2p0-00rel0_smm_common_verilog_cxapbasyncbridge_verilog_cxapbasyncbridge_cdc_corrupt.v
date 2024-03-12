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
//            corrupts the any bit of the data for the next two clock edges.
//            after any change. It is intended to help prove that handshake 
//            mechanisms surrounding the data are all working as expected.
//------------------------------------------------------------------------------

module cxapbasyncbridge_cdc_corrupt (
  clk, 
  sync,
  d,
  q
  );

  parameter WIDTH = 1;
  
  // ------------------------------------------------------
  // port declaration
  // ------------------------------------------------------
  input               clk; 
  input               sync;
  input  [WIDTH-1:0]  d;
  output [WIDTH-1:0]  q;

  // -------------------------------------------
  // reg/wire declarations
  // ------------------------------------------------------

`ifdef ARM_CDC_CHECK

  wire                  change;
  reg      [WIDTH-1:0]  d_latch;
  wire     [WIDTH-1:0]  out;
  reg      p1;
  reg      p2;


  //Set the appropriate output based on sync
  assign q = (sync) ? d : out;

  //Latch to detect change on incoming data 
  always @(d)
     d_latch <= d;

  //Create delta cycle pulse to reset pipeline on change
  assign change = (d !== d_latch);   

  //Pipeline is reset to 1s on any change in data
  //Data should be corrupted until the pipeline is clear
  always @(posedge clk or posedge change)
    begin 
       if (change) begin
          p1 <= 1'b1;
          p2 <= 1'b1;
       end else begin
          p1 <= 1'b0;
          p2 <= p1;
       end
    end

  //Corrupt data while there is something in the pipeline 
  assign out = (p2) ? {WIDTH{1'bz}} : d;

`else

  assign q = d;

`endif  
endmodule
