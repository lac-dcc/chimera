// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_counter_lite.v
//Title       : 
//Created     : 1999
//Description :The counter can increment and decrement.
//   In increment mode instead of counting to its full 16 bit
//   value the counter counts up to or down from a programmed interval value.
//   Interrupts are issued when the counter overflows or reaches it's interval
//   value. In match mode if the count value equals that stored in one of three
//   match registers an interrupt is issued.
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
//


module ttc_counter_lite(

  //inputs
  n_p_reset,    
  pclk,          
  pwdata,              
  count_en,
  cntr_ctrl_reg_sel, 
  interval_reg_sel,
  match_1_reg_sel,
  match_2_reg_sel,
  match_3_reg_sel,         

  //outputs    
  count_val_out,
  cntr_ctrl_reg_out,
  interval_reg_out,
  match_1_reg_out,
  match_2_reg_out,
  match_3_reg_out,
  interval_intr,
  match_intr,
  overflow_intr

);


//--------------------------------------------------------------------
// PORT DECLARATIONS
//--------------------------------------------------------------------

   //inputs
   input          n_p_reset;         //reset signal
   input          pclk;              //System Clock
   input [15:0]   pwdata;            //6 Bit data signal
   input          count_en;          //Count enable signal
   input          cntr_ctrl_reg_sel; //Select bit for ctrl_reg
   input          interval_reg_sel;  //Interval Select Register
   input          match_1_reg_sel;   //Match 1 Select register
   input          match_2_reg_sel;   //Match 2 Select register
   input          match_3_reg_sel;   //Match 3 Select register

   //outputs
   output [15:0]  count_val_out;        //Value for counter reg
   output [6:0]   cntr_ctrl_reg_out;    //Counter control reg select
   output [15:0]  interval_reg_out;     //Interval reg
   output [15:0]  match_1_reg_out;      //Match 1 register
   output [15:0]  match_2_reg_out;      //Match 2 register
   output [15:0]  match_3_reg_out;      //Match 3 register
   output         interval_intr;        //Interval interrupt
   output [3:1]   match_intr;           //Match interrupt
   output         overflow_intr;        //Overflow interrupt

//--------------------------------------------------------------------
// Internal Signals & Registers
//--------------------------------------------------------------------

   reg [6:0]      cntr_ctrl_reg;     // 5-bit Counter Control Register
   reg [15:0]     interval_reg;      //16-bit Interval Register 
   reg [15:0]     match_1_reg;       //16-bit Match_1 Register
   reg [15:0]     match_2_reg;       //16-bit Match_2 Register
   reg [15:0]     match_3_reg;       //16-bit Match_3 Register
   reg [15:0]     count_val;         //16-bit counter value register
                                                                      
   
   reg            counting;          //counter has starting counting
   reg            restart_temp;   //ensures soft reset lasts 1 cycle    
   
   wire [6:0]     cntr_ctrl_reg_out; //7-bit Counter Control Register
   wire [15:0]    interval_reg_out;  //16-bit Interval Register 
   wire [15:0]    match_1_reg_out;   //16-bit Match_1 Register
   wire [15:0]    match_2_reg_out;   //16-bit Match_2 Register
   wire [15:0]    match_3_reg_out;   //16-bit Match_3 Register
   wire [15:0]    count_val_out;     //16-bit counter value register

//-------------------------------------------------------------------
// Assign output wires
//-------------------------------------------------------------------

   assign cntr_ctrl_reg_out = cntr_ctrl_reg;    // 7-bit Counter Control
   assign interval_reg_out  = interval_reg;     // 16-bit Interval
   assign match_1_reg_out   = match_1_reg;      // 16-bit Match_1
   assign match_2_reg_out   = match_2_reg;      // 16-bit Match_2 
   assign match_3_reg_out   = match_3_reg;      // 16-bit Match_3 
   assign count_val_out     = count_val;        // 16-bit counter value
   
//--------------------------------------------------------------------
// Assigning interrupts
//--------------------------------------------------------------------

   assign interval_intr =  cntr_ctrl_reg[1] & (count_val == 16'h0000)
      & (counting) & ~cntr_ctrl_reg[4] & ~cntr_ctrl_reg[0];
   assign overflow_intr = ~cntr_ctrl_reg[1] & (count_val == 16'h0000)
      & (counting) & ~cntr_ctrl_reg[4] & ~cntr_ctrl_reg[0];
   assign match_intr[1]  =  cntr_ctrl_reg[3] & (count_val == match_1_reg)
      & (counting) & ~cntr_ctrl_reg[4] & ~cntr_ctrl_reg[0];
   assign match_intr[2]  =  cntr_ctrl_reg[3] & (count_val == match_2_reg)
      & (counting) & ~cntr_ctrl_reg[4] & ~cntr_ctrl_reg[0];
   assign match_intr[3]  =  cntr_ctrl_reg[3] & (count_val == match_3_reg)
      & (counting) & ~cntr_ctrl_reg[4] & ~cntr_ctrl_reg[0];


//    p_reg_ctrl: Process to write to the counter control registers
//    cntr_ctrl_reg decode:  0 - Counter Enable Active Low
//                           1 - Interval Mode =1, Overflow =0
//                           2 - Decrement Mode
//                           3 - Match Mode
//                           4 - Restart
//                           5 - Waveform enable active low
//                           6 - Waveform polarity
   
   always @ (posedge pclk or negedge n_p_reset)
   begin: p_reg_ctrl  // Register writes
      
      if (!n_p_reset)                                   
      begin                                     
         cntr_ctrl_reg <= 7'b0000001;
         interval_reg  <= 16'h0000;
         match_1_reg   <= 16'h0000;
         match_2_reg   <= 16'h0000;
         match_3_reg   <= 16'h0000;  
      end    
      else 
      begin
         if (cntr_ctrl_reg_sel)
            cntr_ctrl_reg <= pwdata[6:0];
         else if (restart_temp)
            cntr_ctrl_reg[4]  <= 1'b0;    
         else 
            cntr_ctrl_reg <= cntr_ctrl_reg;             

         interval_reg  <= (interval_reg_sel) ? pwdata : interval_reg;
         match_1_reg   <= (match_1_reg_sel)  ? pwdata : match_1_reg;
         match_2_reg   <= (match_2_reg_sel)  ? pwdata : match_2_reg;
         match_3_reg   <= (match_3_reg_sel)  ? pwdata : match_3_reg;   
      end
      
   end  //p_reg_ctrl

   
//    p_cntr: Process to increment or decrement the counter on receiving a 
//            count_en signal from the pre_scaler. Count can be restarted
//            or disabled and can overflow at a specified interval value.
   
   
   always @ (posedge pclk or negedge n_p_reset)
   begin: p_cntr   // Counter block

      if (!n_p_reset)     //System Reset
      begin                     
         count_val <= 16'h0000;
         counting  <= 1'b0;
         restart_temp <= 1'b0;
      end
      else if (count_en)
      begin
         
         if (cntr_ctrl_reg[4])     //Restart
         begin     
            if (~cntr_ctrl_reg[2])  
               count_val         <= 16'h0000;
            else
            begin
              if (cntr_ctrl_reg[1])
                 count_val         <= interval_reg;     
              else
                 count_val         <= 16'hFFFF;     
            end
            counting       <= 1'b0;
            restart_temp   <= 1'b1;

         end
         else 
         begin
            if (!cntr_ctrl_reg[0])          //Low Active Counter Enable
            begin

               if (cntr_ctrl_reg[1])  //Interval               
                  if (cntr_ctrl_reg[2])  //Decrement        
                  begin
                     if (count_val == 16'h0000)
                        count_val <= interval_reg;  //Assumed Static
                     else
                        count_val <= count_val - 16'h0001;
                  end
                  else                   //Increment
                  begin
                     if (count_val == interval_reg)
                        count_val <= 16'h0000;
                     else           
                        count_val <= count_val + 16'h0001;
                  end
               else    
               begin  //Overflow
                  if (cntr_ctrl_reg[2])   //Decrement
                  begin
                     if (count_val == 16'h0000)
                        count_val <= 16'hFFFF;
                     else           
                        count_val <= count_val - 16'h0001;
                  end
                  else                    //Increment
                  begin
                     if (count_val == 16'hFFFF)
                        count_val <= 16'h0000;
                     else           
                        count_val <= count_val + 16'h0001;
                  end 
               end
               counting  <= 1'b1;
            end     
            else
               count_val <= count_val;   //Disabled
   
            restart_temp <= 1'b0;
      
         end
     
      end // if (count_en)

      else
      begin
         count_val    <= count_val;
         counting     <= counting;
         restart_temp <= restart_temp;               
      end
     
   end  //p_cntr

endmodule
