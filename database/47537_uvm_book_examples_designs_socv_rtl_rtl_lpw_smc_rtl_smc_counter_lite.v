// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_counter_lite.v
//Title       : 
//Created     : 1999
//Description : Counter block.
//            : Static Memory Controller.
//            : The counter block provides generates all cycle timings
//            : The leading edge counts are individual 2bit, loadable,
//            : counters. The wait state counter is a count down
//            : counter with a maximum size of 5 bits. The trailing
//            : edge counts are registered for comparison with the
//            : wait state counter. The bus float (CSTE) is a
//            : separate 2bit counter. The initial count values are
//            : stored and reloaded into the counters if multiple
//            : accesses are required.
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


module smc_counter_lite  (
                     //inputs

                     sys_clk,
                     n_sys_reset,
                     valid_access,
                     mac_done, 
                     smc_done, 
                     cste_enable, 
                     ws_enable,
                     le_enable, 

                     //outputs

                     r_csle_count,
                     r_wele_count,
                     r_ws_count,
                     r_ws_store,
                     r_oete_store,
                     r_wete_store,
                     r_wele_store,
                     r_cste_count,
                     r_csle_store);
   

//----------------------------------------------------------------------
// the Wait State Counter
//----------------------------------------------------------------------
   
   
   // I/O
   
   input     sys_clk;                  // AHB System clock
   input     n_sys_reset;              // AHB System reset (Active LOW)
   
   input     valid_access;             // load values are valid if high
   input     mac_done;                 // All cycles in a multiple access

   //  completed
   
   input                 smc_done;   // one access completed
   input                 cste_enable;// Enable CS Trailing Edge counter
   input                 ws_enable;  // Enable Wait State counter
   input                 le_enable;  // Enable all Leading Edge counters
   
   // Counter outputs
   
   output [1:0]             r_csle_count;  //chip select leading
                                             //  edge count
   output [1:0]             r_wele_count;  //write strobe leading 
                                             // edge count
   output [7:0] r_ws_count;    //wait state count
   output [1:0]             r_cste_count;  //chip select trailing 
                                             // edge count
   
   // Stored counts for MAC
   
   output [1:0]             r_oete_store;  //read strobe
   output [1:0]             r_wete_store;  //write strobe trailing 
                                              // edge store
   output [7:0] r_ws_store;    //wait state store
   output [1:0]             r_wele_store;  //write strobe leading
                                             //  edge store
   output [1:0]             r_csle_store;  //chip select  leading
                                             //  edge store
   
   
   // Counters
   
   reg [1:0]             r_csle_count;  // Chip select LE counter
   reg [1:0]             r_wele_count;  // Write counter
   reg [7:0] r_ws_count;    // Wait state select counter
   reg [1:0]             r_cste_count;  // Chip select TE counter
   
   
   // These strobes finish early so no counter is required. 
   // The stored value is compared with WS counter to determine 
   // when the strobe should end.

   reg [1:0]    r_wete_store;    // Write strobe TE end time before CS
   reg [1:0]    r_oete_store;    // Read strobe TE end time before CS
   
   
   // The following four regisrers are used to store the configuration
   // during mulitple accesses. The counters are reloaded from these
   // registers before each cycle.
   
   reg [1:0]             r_csle_store;    // Chip select LE store
   reg [1:0]             r_wele_store;    // Write strobe LE store
   reg [7:0] r_ws_store;      // Wait state store
   reg [1:0]             r_cste_store;    // Chip Select TE delay
                                          //  (Bus float time)

   // wires used for meeting coding standards
   
   wire         ws_count;      //ORed r_ws_count
   wire         wele_count;    //ORed r_wele_count
   wire         cste_count;    //ORed r_cste_count
   wire         mac_smc_done;  //ANDed smc_done and not(mac_done)
   wire [4:0]   case_cste;     //concatenated signals for case statement
   wire [4:0]   case_wele;     //concatenated signals for case statement
   wire [4:0]   case_ws;       //concatenated signals for case statement
   
   
   
   // Main Code
   
//----------------------------------------------------------------------
// Counters (& Count Store for MAC)
//----------------------------------------------------------------------


//----------------------------------------------------------------------
// WETE Store
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))
     
      r_wete_store <= 2'b00;
   
   
   else if (valid_access)
     
      r_wete_store <= 2'b0;
   
   else
     
      r_wete_store <= r_wete_store;

end
   
//----------------------------------------------------------------------
// OETE Store
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))
     
      r_oete_store <= 2'b00;
   
   
   else if (valid_access)
     
      r_oete_store <= 2'b0;
   
   else

      r_oete_store <= r_oete_store;

end
   
//----------------------------------------------------------------------
// CSLE Store
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))
     
      r_csle_store <= 2'b00;
   
   
   else if (valid_access)
     
      r_csle_store <= 2'b00;
   
   else
     
      r_csle_store <= r_csle_store;

end
   
//----------------------------------------------------------------------
// CSLE Counter
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))
     
      r_csle_count <= 2'b00;
   
   
   else
   begin
        
      if (valid_access)
        
         r_csle_count <= 2'b00;
      
      else if (~(mac_done) & smc_done)
        
         r_csle_count <= r_csle_store;
      
      else if (r_csle_count == 2'b00)
        
         r_csle_count <= r_csle_count;
      
      else if (le_enable)               
        
         r_csle_count <= r_csle_count - 2'd1;
      
      else
        
          r_csle_count <= r_csle_count;
      
     end

end
   
   
//----------------------------------------------------------------------
// CSTE Store
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))

      r_cste_store <= 2'b00;

   else if (valid_access)

      r_cste_store <= 2'b0;

   else

      r_cste_store <= r_cste_store;

end
   
   
   
//----------------------------------------------------------------------
//concatenation of signals to avoid using nested ifs
//----------------------------------------------------------------------

 assign mac_smc_done = (~(mac_done) & smc_done);
 assign cste_count   = (|r_cste_count);           //checks for count = 0
 assign case_cste   = {1'b0,valid_access,mac_smc_done,cste_count,
                       cste_enable};
   
//----------------------------------------------------------------------
//CSTE COUNTER
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))

      r_cste_count <= 2'b00;

   else 
   begin
      casex(case_cste)
           
        5'b1xxxx:        r_cste_count <= r_cste_count;

        5'b01xxx:        r_cste_count <= 2'b0;

        5'b001xx:        r_cste_count <= r_cste_store;

        5'b0000x:        r_cste_count <= r_cste_count;

        5'b00011:        r_cste_count <= r_cste_count - 2'd1;

        default :        r_cste_count <= r_cste_count;

      endcase // casex(w_cste_case)
      
   end
   
end

//----------------------------------------------------------------------
// WELE Store
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))

      r_wele_store <= 2'b00;


   else if (valid_access)

      r_wele_store <= 2'b00;

   else

      r_wele_store <= r_wele_store;

end
   
   
   
//----------------------------------------------------------------------
//concatenation of signals to avoid using nested ifs
//----------------------------------------------------------------------
   
   assign wele_count   = (|r_wele_count);         //checks for count = 0
   assign case_wele   = {1'b0,valid_access,mac_smc_done,wele_count,
                         le_enable};
   
//----------------------------------------------------------------------
// WELE Counter
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   
   if (~(n_sys_reset))

      r_wele_count <= 2'b00;

   else
   begin

      casex(case_wele)

        5'b1xxxx :  r_wele_count <= r_wele_count;

        5'b01xxx :  r_wele_count <= 2'b00;

        5'b001xx :  r_wele_count <= r_wele_store;

        5'b0000x :  r_wele_count <= r_wele_count;

        5'b00011 :  r_wele_count <= r_wele_count - (2'd1);

        default  :  r_wele_count <= r_wele_count;

      endcase // casex(case_wele)

   end

end
   
//----------------------------------------------------------------------
// WS Store
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)
  
begin   

   if (~(n_sys_reset))

      r_ws_store <= 8'd0;


   else if (valid_access)

      r_ws_store <= 8'h01;

   else

      r_ws_store <= r_ws_store;

end
   
   
   
//----------------------------------------------------------------------
//concatenation of signals to avoid using nested ifs
//----------------------------------------------------------------------
   
   assign ws_count   = (|r_ws_count); //checks for count = 0
   assign case_ws   = {1'b0,valid_access,mac_smc_done,ws_count,
                       ws_enable};
   
//----------------------------------------------------------------------
// WS Counter
//----------------------------------------------------------------------

always @(posedge sys_clk or negedge n_sys_reset)

begin   

   if (~(n_sys_reset))

      r_ws_count <= 8'd0;

   else  
   begin
   
      casex(case_ws)
 
         5'b1xxxx :  
            r_ws_count <= r_ws_count;
        
         5'b01xxx :
            r_ws_count <= 8'h01;
        
         5'b001xx :  
            r_ws_count <= r_ws_store;
        
         5'b0000x :  
            r_ws_count <= r_ws_count;
        
         5'b00011 :  
            r_ws_count <= r_ws_count - 8'd1;
        
         default  :  
            r_ws_count <= r_ws_count;

      endcase // casex(case_ws)
      
   end
   
end  
   
   
endmodule
