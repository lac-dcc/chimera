// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_count_rst_lite.v
//Title       : 
//Created     : 1999
//Description : TTC counter reset block
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

module ttc_count_rst_lite(

  //inputs
  n_p_reset,                             
  pclk, 
  pwdata,                                                           
  clk_ctrl_reg_sel,
  restart,        

  //outputs
  count_en_out,
  clk_ctrl_reg_out

  );


//-----------------------------------------------------------------------------
// PORT DECLARATIONS
//-----------------------------------------------------------------------------

   // inputs
   input n_p_reset;                 // Reset signal
   input pclk;                    // APB System clock
   input [6:0] pwdata;           // 7-Bit pwdata from APB interface
   input clk_ctrl_reg_sel;        // Select for the clk_ctrl_reg
   input restart;                 // Restart reset from cntr_ctrl_reg

   // outputs
   output count_en_out;
   output [6:0] clk_ctrl_reg_out; // Controls clock selected


//-----------------------------------------------------------------------------
// Internal Signals & Registers
//-----------------------------------------------------------------------------


   
   reg [6:0]    clk_ctrl_reg;     //7-bit clock control register.
   
   reg          restart_var;      //ensures prescaler reset at start of restart 
   
   reg          count_en;         //enable signal to counter

   
   wire [6:0]   clk_ctrl_reg_out; //clock control output wire
   wire         count_en_out;     //counter enable output
   
   
//-----------------------------------------------------------------------------
// Logic Section:


//
//    p_clk_ctrl: Process to implement the clk_ctrl_reg.  
//                When select line is set then the data will be inserted to 
//                the clock control register, otherwise it will be equal to 
//                the previous value of the register, else it will be zero.
//-----------------------------------------------------------------------------

   assign clk_ctrl_reg_out  = clk_ctrl_reg;
   assign count_en_out      = count_en;


//    p_ps_counter: counter for clock enable generation.
   
   always @(posedge pclk or negedge n_p_reset)
   begin: p_ps_counter
      
      if (!n_p_reset)
      begin
         restart_var  <= 1'b0;
         count_en     <= 1'b0;
      end
      else
      begin
         if (restart & ~restart_var)
         begin
            restart_var  <= 1'b1;
            count_en     <= 1'b0;
         end 
         
         else 
           begin
              
              if (~restart)
                 restart_var <= 1'b0;
              else
                 restart_var <= restart_var;
                 
              count_en     <= 1'b1;        
              
           end
      end // else: !if(!n_p_reset)      
  
   end  //p_ps_counter



// p_clk_ctrl : Process for writing to the clk_ctrl_reg
   
   always @ (posedge pclk or negedge n_p_reset)
   begin: p_clk_ctrl
      
      if (!n_p_reset)
         clk_ctrl_reg <= 7'h00;
      else
      begin 

         if (clk_ctrl_reg_sel)
            clk_ctrl_reg <= pwdata;
         else
            clk_ctrl_reg <= clk_ctrl_reg;

      end 
      
   end  //p_clk_ctrl

   
endmodule
