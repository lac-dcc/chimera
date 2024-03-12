//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2007-2010 ARM Limited.
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
//  Purpose : Randomly replaces X and Z inputs with a 0 or 1.
// -----------------------------------------------------------------------------

module cxapbasyncbridge_cdc_random
  ( din, dout);

  // ------------------------------------------------------
  // parameter declaration
  // ------------------------------------------------------

  parameter WIDTH = 4;
  parameter HIER_LEN = 100;

  // ------------------------------------------------------
  // port declaration
  // ------------------------------------------------------
  input [WIDTH-1:0]     din;
  output [WIDTH-1:0]    dout;

`ifdef ARM_CDC_CHECK

  // ------------------------------------------------------
  // reg/wire declarations
  // ------------------------------------------------------
  reg [WIDTH-1:0]       dout;

  integer               seed;
  integer               i;
  integer               j;
  integer               seed_char;
  reg [0:(8*HIER_LEN)]  seed_string;
  integer               top_level_seed;
  
  reg [31:0]            lfsr;
  wire                  lfsr_feedback;
                           
  // generate random seed from the hierarchical filename
  initial 
    begin
      $swrite(seed_string,"%m");
    
      //convert string into an integer for the seed
      //by converting one ascii byte at a time and adding it
      //to the seed
      
      seed = 0;
      for (i = 0; i < (8*HIER_LEN); i = i + 8) 
        begin
          seed_char = (seed_string[i+:8]);
          seed = seed + seed_char;     
        end
      
      
      if ($value$plusargs("seed=%d",top_level_seed)) seed = seed+top_level_seed;
      
      $display ("%s using seed %h",seed_string, seed);
      
      lfsr <= seed;
      
    end 
  
  assign lfsr_feedback = lfsr[2] ^ lfsr[30];

  always @(din)
    for (j = 0; j < WIDTH; j = j + 1) begin

        if ((din[j] ^ din[j]) !== 1'b0)
          begin
            dout[j] = lfsr[0];
            lfsr = {lfsr[30:0],lfsr_feedback};
          end
        else
          dout[j] = din[j];
    end      
  
`else
    assign dout = din;
`endif

endmodule

