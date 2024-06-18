// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_apb_lite_if.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------


`include "smc_defs_lite.v" 
// apb interface
module smc_apb_lite_if (
                   //Inputs
                   
                   n_preset, 
                   pclk, 
                   psel, 
                   penable, 
                   pwrite, 
                   paddr, 
                   pwdata,
 
                   
                   //Outputs
                   
                   
                   prdata
                   
                   );
   
    //   // APB Inputs  
   input     n_preset;           // APBreset 
   input     pclk;               // APB clock
   input     psel;               // APB select
   input     penable;            // APB enable 
   input     pwrite;             // APB write strobe 
   input [4:0] paddr;              // APB address bus
   input [31:0] pwdata;             // APB write data 
   
   // Outputs to SMC
   
   // APB Output
   output [31:0] prdata;        //APB output
   
   
    // Outputs to SMC
   
   wire   [31:0] prdata;

   wire   [31:0] rdata0;  // Selected data for register 0
   wire   [31:0] rdata1;  // Selected data for register 1
   wire   [31:0] rdata2;  // Selected data for register 2
   wire   [31:0] rdata3;  // Selected data for register 3
   wire   [31:0] rdata4;  // Selected data for register 4
   wire   [31:0] rdata5;  // Selected data for register 5
   wire   [31:0] rdata6;  // Selected data for register 6
   wire   [31:0] rdata7;  // Selected data for register 7

   reg    selreg;   // Select for register (bit significant)

   
   
   // register addresses
   
//`define address_config0 5'h00


smc_cfreg_lite i_cfreg0 (
  .selreg           ( selreg ),

  .rdata            ( rdata0 )
);


assign prdata = ( rdata0 );

// Generate register selects
always @ (
  psel or
  paddr or
  penable
)
begin : p_addr_decode

  if ( psel & penable )
    if (paddr == 5'h00)
       selreg = 1'b1;
    else
       selreg = 1'b0;
  else 
       selreg = 1'b0;

end // p_addr_decode
  
endmodule // smc_apb_interface


