// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_interrupt_lite.v
//Title       : 
//Created     : 1999
//Description : Interrupts from the counter modules are registered
//              and if enabled cause the output interrupt to go high.
//              Also the match1 interrupts are monitored to generate output 
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
 


//-----------------------------------------------------------------------------
// Module definition
//-----------------------------------------------------------------------------

module ttc_interrupt_lite(

  //inputs
  n_p_reset,                             
  pwdata,                             
  pclk,
  intr_en_reg_sel, 
  clear_interrupt,                   
  interval_intr,
  match_intr,
  overflow_intr,
  restart,

  //outputs
  interrupt,
  interrupt_reg_out,
  interrupt_en_out
  
);


//-----------------------------------------------------------------------------
// PORT DECLARATIONS
//-----------------------------------------------------------------------------

   //inputs
   input         n_p_reset;            //reset signal
   input [5:0]   pwdata;               //6 Bit Data signal
   input         pclk;                 //System clock
   input         intr_en_reg_sel;      //Interrupt Enable Reg Select signal
   input         clear_interrupt;      //Clear Interrupt Register signal
   input         interval_intr;        //Timer_Counter Interval Interrupt
   input [3:1]   match_intr;           //Timer_Counter Match 1 Interrupt 
   input         overflow_intr;        //Timer_Counter Overflow Interrupt 
   input         restart;              //Counter restart

   //Outputs
   output        interrupt;            //Interrupt Signal 
   output [5:0]  interrupt_reg_out;    //6 Bit Interrupt Register
   output [5:0]  interrupt_en_out; //6 Bit Interrupt Enable Register


//-----------------------------------------------------------------------------
// Internal Signals & Registers
//-----------------------------------------------------------------------------

   wire [5:0]   intr_detect;          //Interrupts from the Timer_Counter
   reg [5:0]    int_sync_reg;         //6-bit 1st cycle sync register
   reg [5:0]    int_cycle_reg;        //6-bit register ensuring each interrupt 
                                      //only read once
   reg [5:0]    interrupt_reg;        //6-bit interrupt register        
   reg [5:0]    interrupt_en_reg; //6-bit interrupt enable register
   

   reg          interrupt_set;        //Prevents unread interrupt being cleared
   
   wire         interrupt;            //Interrupt output
   wire [5:0]   interrupt_reg_out;    //Interrupt register output
   wire [5:0]   interrupt_en_out; //Interrupt enable output


   assign interrupt              = |(interrupt_reg);
   assign interrupt_reg_out      = interrupt_reg;
   assign interrupt_en_out       = interrupt_en_reg;
   
   assign intr_detect = {1'b0,
                         overflow_intr,  
                         match_intr[3],  
                         match_intr[2], 
                         match_intr[1], 
                         interval_intr};

   

// Setting interrupt registers
   
   always @ (posedge pclk or negedge n_p_reset)
   begin: p_intr_reg_ctrl
      
      if (!n_p_reset)
      begin
         int_sync_reg         <= 6'b000000;
         interrupt_reg        <= 6'b000000;
         int_cycle_reg        <= 6'b000000;
         interrupt_set        <= 1'b0;
      end
      else 
      begin

         int_sync_reg    <= intr_detect;
         int_cycle_reg   <= ~int_sync_reg & intr_detect;

         interrupt_set   <= |int_cycle_reg;
          
         if (clear_interrupt & ~interrupt_set)
            interrupt_reg <= (6'b000000 | (int_cycle_reg & interrupt_en_reg));
         else 
            interrupt_reg <= (interrupt_reg | (int_cycle_reg & 
                                               interrupt_en_reg));
      end 
      
   end  //p_intr_reg_ctrl


// Setting interrupt enable register
   
   always @ (posedge pclk or negedge n_p_reset)
   begin: p_intr_en_reg
      
      if (!n_p_reset)
      begin
         interrupt_en_reg <= 6'b000000;
      end
      else 
      begin

         if (intr_en_reg_sel)
            interrupt_en_reg <= pwdata[5:0];
         else
            interrupt_en_reg <= interrupt_en_reg;

      end 
      
   end  
           


endmodule

