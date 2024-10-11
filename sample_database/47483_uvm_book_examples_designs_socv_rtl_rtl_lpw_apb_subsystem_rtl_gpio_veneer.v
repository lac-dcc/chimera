// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : gpio_veneer.v
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

module gpio_veneer ( 
              //inputs 
 
              n_p_reset, 
              pclk, 

              psel, 
              penable, 
              pwrite, 
              paddr, 
              pwdata, 

              gpio_pin_in, 

              scan_en, 
              tri_state_enable, 

              scan_in, //added by smarkov for dft
 
              //outputs
              
              scan_out, //added by smarkov for dft 
               
              prdata, 

              gpio_int, 

              n_gpio_pin_oe, 
              gpio_pin_out 
); 
 
//Numeric constants


   // inputs 
    
   // pclks  
   input        n_p_reset;            // amba reset 
   input        pclk;               // peripherical pclk bus 

   // AMBA Rev 2
   input        psel;               // peripheral select for gpio 
   input        penable;            // peripheral enable 
   input        pwrite;             // peripheral write strobe 
   input [5:0] 
                paddr;              // address bus of selected master 
   input [31:0] 
                pwdata;             // write data 

   // gpio generic inputs 
   input [15:0] 
                gpio_pin_in;             // input data from pin 

   //design for test inputs 
   input        scan_en;            // enables shifting of scans 
   input [15:0] 
                tri_state_enable;   // disables op enable -> z 
   input        scan_in;            // scan chain data input  
       
    
   // outputs 
 
   //amba outputs 
   output [31:0] 
                prdata;             // read data 
   // gpio generic outputs 
   output       gpio_int;                // gpio_interupt for input pin change 
   output [15:0] 
                n_gpio_pin_oe;           // output enable signal to pin 
   output [15:0] 
                gpio_pin_out;            // output signal to pin 
                
   // scan outputs
   output      scan_out;            // scan chain data output

//##############################################################################
// if the GPIO is NOT black boxed 
//##############################################################################
`ifndef FV_KIT_BLACK_BOX_GPIO

gpio_lite i_gpio_lite(
   //inputs
   .n_p_reset(n_p_reset),
   .pclk(pclk),
   .psel(psel),
   .penable(penable),
   .pwrite(pwrite),
   .paddr(paddr),
   .pwdata(pwdata),
   .gpio_pin_in(gpio_pin_in),
   .scan_en(scan_en),
   .tri_state_enable(tri_state_enable),
   .scan_in(), //added by smarkov for dft

   //outputs
   .scan_out(), //added by smarkov for dft
   .prdata(prdata),
   .gpio_int(gpio_int),
   .n_gpio_pin_oe(n_gpio_pin_oe),
   .gpio_pin_out(gpio_pin_out)
);
 
`else 
//##############################################################################
// if the GPIO is black boxed 
//##############################################################################

   // inputs 
    
   // pclks  
   wire         n_p_reset;            // amba reset 
   wire         pclk;               // peripherical pclk bus 

   // AMBA Rev 2
   wire         psel;               // peripheral select for gpio 
   wire         penable;            // peripheral enable 
   wire         pwrite;             // peripheral write strobe 
   wire  [5:0] 
                paddr;              // address bus of selected master 
   wire  [31:0] 
                pwdata;             // write data 

   // gpio generic inputs 
   wire  [15:0] 
                gpio_pin_in;             // wire  data from pin 

   //design for test inputs 
   wire         scan_en;            // enables shifting of scans 
   wire  [15:0] 
                tri_state_enable;   // disables op enable -> z 
   wire         scan_in;            // scan chain data wire   
       
    
   // outputs 
 
   //amba outputs 
   reg    [31:0] 
                prdata;             // read data 
   // gpio generic outputs 
   reg          gpio_int =0;                // gpio_interupt for wire  pin change 
   reg    [15:0] 
                n_gpio_pin_oe;           // reg    enable signal to pin 
   reg    [15:0] 
                gpio_pin_out;            // reg    signal to pin 
                
   // scan outputs
   reg         scan_out;            // scan chain data output

`endif
//##############################################################################
// black boxed defines 
//##############################################################################

endmodule
