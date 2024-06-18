// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : alut_veneer.v
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
module alut_veneer
(   
   // Inputs
   pclk,
   n_p_reset,
   psel,            
   penable,       
   pwrite,         
   paddr,           
   pwdata,          

   // Outputs
   prdata  
);

   // APB Inputs
   input             pclk;               // APB clock                          
   input             n_p_reset;          // Reset                              
   input             psel;               // Module select signal               
   input             penable;            // Enable signal                      
   input             pwrite;             // Write when HIGH and read when LOW  
   input [6:0]       paddr;              // Address bus for read write         
   input [31:0]      pwdata;             // APB write bus                      

   output [31:0]     prdata;             // APB read bus                       


//-----------------------------------------------------------------------
//##############################################################################
// if the ALUT is NOT black boxed 
//##############################################################################
`ifndef FV_KIT_BLACK_BOX_LUT 


alut i_alut (
        //inputs
        . n_p_reset(n_p_reset),
        . pclk(pclk),
        . psel(psel),
        . penable(penable),
        . pwrite(pwrite),
        . paddr(paddr[6:0]),
        . pwdata(pwdata),

        //outputs
        . prdata(prdata)
);


`else 
//##############################################################################
// if the <module> is black boxed 
//##############################################################################

   // APB Inputs
   wire              pclk;               // APB clock                          
   wire              n_p_reset;          // Reset                              
   wire              psel;               // Module select signal               
   wire              penable;            // Enable signal                      
   wire              pwrite;             // Write when HIGH and read when LOW  
   wire  [6:0]       paddr;              // Address bus for read write         
   wire  [31:0]      pwdata;             // APB write bus                      

   reg   [31:0]      prdata;             // APB read bus                       


`endif

endmodule
