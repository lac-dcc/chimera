// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_timer_counter_lite.v
//Title       : 
//Created     : 1999
//Description : An instantiation of counter modules.
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

module ttc_timer_counter_lite(

   //inputs
   n_p_reset,    
   pclk,                         
   pwdata,                              
   clk_ctrl_reg_sel,
   cntr_ctrl_reg_sel,
   interval_reg_sel, 
   match_1_reg_sel,
   match_2_reg_sel,
   match_3_reg_sel,
   intr_en_reg_sel,
   clear_interrupt,
                 
   //outputs             
   clk_ctrl_reg, 
   counter_val_reg,
   cntr_ctrl_reg,
   interval_reg,
   match_1_reg,
   match_2_reg,
   match_3_reg,
   interrupt,
   interrupt_reg,
   interrupt_en_reg
);


//-----------------------------------------------------------------------------
// PORT DECLARATIONS
//-----------------------------------------------------------------------------

   //inputs
   input         n_p_reset;            //reset signal
   input         pclk;                 //APB system clock
   input [15:0]  pwdata;               //16 Bit data signal
   input         clk_ctrl_reg_sel;     //Select clk_ctrl_reg from prescaler
   input         cntr_ctrl_reg_sel;    //Select control reg from counter.
   input         interval_reg_sel;     //Select Interval reg from counter.
   input         match_1_reg_sel;      //Select match_1_reg from counter. 
   input         match_2_reg_sel;      //Select match_2_reg from counter.
   input         match_3_reg_sel;      //Select match_3_reg from counter.
   input         intr_en_reg_sel;      //Select interrupt register.
   input         clear_interrupt;      //Clear interrupt
   
   //Outputs
   output [15:0]  counter_val_reg;     //Counter value register from counter. 
   output [6:0]   clk_ctrl_reg;        //Clock control reg from prescaler.
   output [6:0]   cntr_ctrl_reg;     //Counter control register 1.
   output [15:0]  interval_reg;        //Interval register from counter.
   output [15:0]  match_1_reg;         //Match 1 register sent from counter. 
   output [15:0]  match_2_reg;         //Match 2 register sent from counter. 
   output [15:0]  match_3_reg;         //Match 3 register sent from counter. 
   output         interrupt;
   output [5:0]   interrupt_reg;
   output [5:0]   interrupt_en_reg;
   
//-----------------------------------------------------------------------------
// Module Interconnect
//-----------------------------------------------------------------------------

   wire count_en;
   wire interval_intr;          //Interval overflow interrupt
   wire [3:1] match_intr;       //Match interrupts
   wire overflow_intr;          //Overflow interupt   
   wire [6:0] cntr_ctrl_reg;    //Counter control register
   
//-----------------------------------------------------------------------------
// Module Instantiations
//-----------------------------------------------------------------------------


    //outputs

  ttc_count_rst_lite i_ttc_count_rst_lite(

    //inputs
    .n_p_reset                              (n_p_reset),   
    .pclk                                   (pclk),                             
    .pwdata                                 (pwdata[6:0]),
    .clk_ctrl_reg_sel                       (clk_ctrl_reg_sel),
    .restart                                (cntr_ctrl_reg[4]),
                         
    //outputs        
    .count_en_out                           (count_en),                         
    .clk_ctrl_reg_out                       (clk_ctrl_reg)

  );


  ttc_counter_lite i_ttc_counter_lite(

    //inputs
    .n_p_reset                              (n_p_reset),  
    .pclk                                   (pclk),                          
    .pwdata                                 (pwdata),                           
    .count_en                               (count_en),
    .cntr_ctrl_reg_sel                      (cntr_ctrl_reg_sel), 
    .interval_reg_sel                       (interval_reg_sel),
    .match_1_reg_sel                        (match_1_reg_sel),
    .match_2_reg_sel                        (match_2_reg_sel),
    .match_3_reg_sel                        (match_3_reg_sel),

    //outputs
    .count_val_out                          (counter_val_reg),
    .cntr_ctrl_reg_out                      (cntr_ctrl_reg),
    .interval_reg_out                       (interval_reg),
    .match_1_reg_out                        (match_1_reg),
    .match_2_reg_out                        (match_2_reg),
    .match_3_reg_out                        (match_3_reg),
    .interval_intr                          (interval_intr),
    .match_intr                             (match_intr),
    .overflow_intr                          (overflow_intr)
    
  );

  ttc_interrupt_lite i_ttc_interrupt_lite(

    //inputs
    .n_p_reset                           (n_p_reset), 
    .pwdata                              (pwdata[5:0]),
    .pclk                                (pclk),
    .intr_en_reg_sel                     (intr_en_reg_sel), 
    .clear_interrupt                     (clear_interrupt),
    .interval_intr                       (interval_intr),
    .match_intr                          (match_intr),
    .overflow_intr                       (overflow_intr),
    .restart                             (cntr_ctrl_reg[4]),

    //outputs
    .interrupt                           (interrupt),
    .interrupt_reg_out                   (interrupt_reg),
    .interrupt_en_out                    (interrupt_en_reg)
                       
  );


   
endmodule
