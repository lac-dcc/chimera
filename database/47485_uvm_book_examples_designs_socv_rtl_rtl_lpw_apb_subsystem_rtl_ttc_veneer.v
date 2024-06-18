// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_veneer.v
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
module ttc_veneer (
           
           //inputs
           n_p_reset,
           pclk,
           psel,
           penable,
           pwrite,
           pwdata,
           paddr,
           scan_in,
           scan_en,

           //outputs
           prdata,
           interrupt,
           scan_out           

           );


//-----------------------------------------------------------------------------
// PORT DECLARATIONS
//-----------------------------------------------------------------------------

   input         n_p_reset;            //System Reset
   input         pclk;                 //System clock
   input         psel;                 //Select line
   input         penable;              //Enable
   input         pwrite;               //Write line, 1 for write, 0 for read
   input [31:0]  pwdata;               //Write data
   input [7:0]   paddr;                //Address Bus register
   input         scan_in;              //Scan chain input port
   input         scan_en;              //Scan chain enable port
   
   output [31:0] prdata;               //Read Data from the APB Interface
   output [3:1]  interrupt;            //Interrupt from PCI 
   output        scan_out;             //Scan chain output port

//##############################################################################
// if the TTC is NOT black boxed 
//##############################################################################
`ifndef FV_KIT_BLACK_BOX_TTC 

ttc_lite i_ttc(

   //inputs
   .n_p_reset(n_p_reset),
   .pclk(pclk),
   .psel(psel),
   .penable(penable),
   .pwrite(pwrite),
   .pwdata(pwdata),
   .paddr(paddr),
   .scan_in(),
   .scan_en(scan_en),

   //outputs
   .prdata(prdata),
   .interrupt(interrupt),
   .scan_out()
);

`else 
//##############################################################################
// if the TTC is black boxed 
//##############################################################################

   wire          n_p_reset;            //System Reset
   wire          pclk;                 //System clock
   wire          psel;                 //Select line
   wire          penable;              //Enable
   wire          pwrite;               //Write line, 1 for write, 0 for read
   wire  [31:0]  pwdata;               //Write data
   wire  [7:0]   paddr;                //Address Bus register
   wire          scan_in;              //Scan chain wire  port
   wire          scan_en;              //Scan chain enable port
   
   reg    [31:0] prdata;               //Read Data from the APB Interface
   reg    [3:1]  interrupt;            //Interrupt from PCI 
   reg           scan_out;             //Scan chain reg    port

`endif
//##############################################################################
// black boxed defines 
//##############################################################################

endmodule
