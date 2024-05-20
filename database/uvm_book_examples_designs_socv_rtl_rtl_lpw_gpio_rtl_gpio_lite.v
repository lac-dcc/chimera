// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : gpio_lite.v
//Title       : GPIO top level
//Created     : 1999
//Description : A gpio module for use with amba 
//                   apb, with up to 16 io pins 
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

module gpio_lite( 
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
     
// gpio_internal signals declarations
 
   // registers + wires for outputs 
   reg  [31:0] 
                prdata;             // registered output to apb
   wire         gpio_int;                // gpio_interrupt to apb
   wire [15:0] 
                n_gpio_pin_oe;           // gpio output enable
   wire [15:0] 
                gpio_pin_out;            // gpio out
    
   // generic gpio stuff 
   wire         write;              // apb register write strobe
   wire         read;               // apb register read strobe
   wire [5:0]
                addr;               // apb register address
   wire         n_p_reset;            // apb reset
   wire         pclk;               // apb clock
   wire [15:0] 
                rdata;              // registered output to apb
   wire         sel;                // apb peripheral select
         
   //for gpio_interrupts 
   wire [15:0] 
                gpio_interrupt_gen;      // gpio_interrupt to apb

   integer      i;                   // loop variable
                
 
    
   // assignments 
 
   // generic assignments for the gpio bus 
   // variables starting with gpio are the 
   // generic variables used below. 
   // change these variable to use another bus protocol 
   // for the gpio. 
 
   // inputs  
   assign write      = pwrite & penable & psel; 
    
   assign read       = ~(pwrite) & ~(penable) & psel; 
    
   assign addr       = paddr; 
  
   assign sel        = psel; 

   
   // p_map_prdata: combinatorial/ rdata
   //
   // this process adds zeros to all the unused prdata lines, 
   // according to the chosen width of the gpio module
   
   always @ ( rdata )
   begin : p_map_prdata
      begin
         for ( i = 16; i < 32; i = i + 1 )
           prdata[i] = 1'b0;
      end

      prdata[15:0] = rdata;

   end // p_map_prdata

   assign gpio_int = |gpio_interrupt_gen;

   gpio_lite_subunit  // gpio_subunit module instance

   
   i_gpio_lite_subunit // instance name to take the annotated parameters

// pin annotation
   (
       //inputs

       .n_reset            (n_p_reset),         // reset
       .pclk               (pclk),              // gpio pclk
       .read               (read),              // select for gpio
       .write              (write),             // gpio write
       .addr               (addr),              // address bus
       .wdata              (pwdata[15:0]),  
                                                 // gpio input
       .pin_in             (gpio_pin_in),        // input data from pin
       .tri_state_enable   (tri_state_enable),   // disables op enable

       //outputs
       .rdata              (rdata),              // gpio output
       .interrupt          (gpio_interrupt_gen), // gpio_interupt
       .pin_oe_n           (n_gpio_pin_oe),      // output enable
       .pin_out            (gpio_pin_out)        // output signal
    );

 endmodule
