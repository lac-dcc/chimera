// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_lite.v
//Title       : 
//Created     : 1999
//Description : The top level of the Triple Timer Counter.
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

module ttc_lite(
           
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

   input         n_p_reset;              //System Reset
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

//-----------------------------------------------------------------------------
// Module Interconnect
//-----------------------------------------------------------------------------
   wire [3:1] TTC_int;
   wire        clk_ctrl_reg_sel_1;     //Module 1 clock control select
   wire        clk_ctrl_reg_sel_2;     //Module 2 clock control select
   wire        clk_ctrl_reg_sel_3;     //Module 3 clock control select
   wire        cntr_ctrl_reg_sel_1;    //Module 1 counter control select
   wire        cntr_ctrl_reg_sel_2;    //Module 2 counter control select
   wire        cntr_ctrl_reg_sel_3;    //Module 3 counter control select
   wire        interval_reg_sel_1;     //Interval 1 register select
   wire        interval_reg_sel_2;     //Interval 2 register select
   wire        interval_reg_sel_3;     //Interval 3 register select
   wire        match_1_reg_sel_1;      //Module 1 match 1 select
   wire        match_1_reg_sel_2;      //Module 1 match 2 select
   wire        match_1_reg_sel_3;      //Module 1 match 3 select
   wire        match_2_reg_sel_1;      //Module 2 match 1 select
   wire        match_2_reg_sel_2;      //Module 2 match 2 select
   wire        match_2_reg_sel_3;      //Module 2 match 3 select
   wire        match_3_reg_sel_1;      //Module 3 match 1 select
   wire        match_3_reg_sel_2;      //Module 3 match 2 select
   wire        match_3_reg_sel_3;      //Module 3 match 3 select
   wire [3:1]  intr_en_reg_sel;        //Interrupt enable register select
   wire [3:1]  clear_interrupt;        //Clear interrupt signal
   wire [5:0]  interrupt_reg_1;        //Interrupt register 1
   wire [5:0]  interrupt_reg_2;        //Interrupt register 2
   wire [5:0]  interrupt_reg_3;        //Interrupt register 3 
   wire [5:0]  interrupt_en_reg_1;     //Interrupt enable register 1
   wire [5:0]  interrupt_en_reg_2;     //Interrupt enable register 2
   wire [5:0]  interrupt_en_reg_3;     //Interrupt enable register 3
   wire [6:0]  clk_ctrl_reg_1;         //Clock control regs for the 
   wire [6:0]  clk_ctrl_reg_2;         //Timer_Counter 1,2,3
   wire [6:0]  clk_ctrl_reg_3;         //Value of the clock frequency
   wire [15:0] counter_val_reg_1;      //Module 1 counter value 
   wire [15:0] counter_val_reg_2;      //Module 2 counter value 
   wire [15:0] counter_val_reg_3;      //Module 3 counter value 
   wire [6:0]  cntr_ctrl_reg_1;        //Module 1 counter control  
   wire [6:0]  cntr_ctrl_reg_2;        //Module 2 counter control  
   wire [6:0]  cntr_ctrl_reg_3;        //Module 3 counter control  
   wire [15:0] interval_reg_1;         //Module 1 interval register
   wire [15:0] interval_reg_2;         //Module 2 interval register
   wire [15:0] interval_reg_3;         //Module 3 interval register
   wire [15:0] match_1_reg_1;          //Module 1 match 1 register
   wire [15:0] match_1_reg_2;          //Module 1 match 2 register
   wire [15:0] match_1_reg_3;          //Module 1 match 3 register
   wire [15:0] match_2_reg_1;          //Module 2 match 1 register
   wire [15:0] match_2_reg_2;          //Module 2 match 2 register
   wire [15:0] match_2_reg_3;          //Module 2 match 3 register
   wire [15:0] match_3_reg_1;          //Module 3 match 1 register
   wire [15:0] match_3_reg_2;          //Module 3 match 2 register
   wire [15:0] match_3_reg_3;          //Module 3 match 3 register

  assign interrupt = TTC_int;   // Bug Fix for floating ints - Santhosh 8 Nov 06
   

//-----------------------------------------------------------------------------
// Module Instantiations
//-----------------------------------------------------------------------------


  ttc_interface_lite i_ttc_interface_lite ( 

    //inputs
    .n_p_reset                           (n_p_reset),
    .pclk                                (pclk),
    .psel                                (psel),
    .penable                             (penable),
    .pwrite                              (pwrite),
    .paddr                               (paddr),
    .clk_ctrl_reg_1                      (clk_ctrl_reg_1),
    .clk_ctrl_reg_2                      (clk_ctrl_reg_2),
    .clk_ctrl_reg_3                      (clk_ctrl_reg_3),
    .cntr_ctrl_reg_1                     (cntr_ctrl_reg_1),
    .cntr_ctrl_reg_2                     (cntr_ctrl_reg_2),
    .cntr_ctrl_reg_3                     (cntr_ctrl_reg_3),
    .counter_val_reg_1                   (counter_val_reg_1),
    .counter_val_reg_2                   (counter_val_reg_2),
    .counter_val_reg_3                   (counter_val_reg_3),
    .interval_reg_1                      (interval_reg_1),
    .match_1_reg_1                       (match_1_reg_1),
    .match_2_reg_1                       (match_2_reg_1),
    .match_3_reg_1                       (match_3_reg_1),
    .interval_reg_2                      (interval_reg_2),
    .match_1_reg_2                       (match_1_reg_2),
    .match_2_reg_2                       (match_2_reg_2),
    .match_3_reg_2                       (match_3_reg_2),
    .interval_reg_3                      (interval_reg_3),
    .match_1_reg_3                       (match_1_reg_3),
    .match_2_reg_3                       (match_2_reg_3),
    .match_3_reg_3                       (match_3_reg_3),
    .interrupt_reg_1                     (interrupt_reg_1),
    .interrupt_reg_2                     (interrupt_reg_2),
    .interrupt_reg_3                     (interrupt_reg_3), 
    .interrupt_en_reg_1                  (interrupt_en_reg_1),
    .interrupt_en_reg_2                  (interrupt_en_reg_2),
    .interrupt_en_reg_3                  (interrupt_en_reg_3), 

    //outputs
    .prdata                              (prdata),
    .clk_ctrl_reg_sel_1                  (clk_ctrl_reg_sel_1),
    .clk_ctrl_reg_sel_2                  (clk_ctrl_reg_sel_2),
    .clk_ctrl_reg_sel_3                  (clk_ctrl_reg_sel_3),
    .cntr_ctrl_reg_sel_1                 (cntr_ctrl_reg_sel_1),
    .cntr_ctrl_reg_sel_2                 (cntr_ctrl_reg_sel_2),
    .cntr_ctrl_reg_sel_3                 (cntr_ctrl_reg_sel_3),
    .interval_reg_sel_1                  (interval_reg_sel_1),  
    .interval_reg_sel_2                  (interval_reg_sel_2), 
    .interval_reg_sel_3                  (interval_reg_sel_3),
    .match_1_reg_sel_1                   (match_1_reg_sel_1),     
    .match_1_reg_sel_2                   (match_1_reg_sel_2),
    .match_1_reg_sel_3                   (match_1_reg_sel_3),                
    .match_2_reg_sel_1                   (match_2_reg_sel_1),
    .match_2_reg_sel_2                   (match_2_reg_sel_2),
    .match_2_reg_sel_3                   (match_2_reg_sel_3),
    .match_3_reg_sel_1                   (match_3_reg_sel_1),
    .match_3_reg_sel_2                   (match_3_reg_sel_2),
    .match_3_reg_sel_3                   (match_3_reg_sel_3),
    .intr_en_reg_sel                     (intr_en_reg_sel),
    .clear_interrupt                     (clear_interrupt)

  );


   

  ttc_timer_counter_lite i_ttc_timer_counter_lite_1 ( 

    //inputs
    .n_p_reset                           (n_p_reset),
    .pclk                                (pclk), 
    .pwdata                              (pwdata[15:0]),
    .clk_ctrl_reg_sel                    (clk_ctrl_reg_sel_1),
    .cntr_ctrl_reg_sel                   (cntr_ctrl_reg_sel_1),
    .interval_reg_sel                    (interval_reg_sel_1),
    .match_1_reg_sel                     (match_1_reg_sel_1),
    .match_2_reg_sel                     (match_2_reg_sel_1),
    .match_3_reg_sel                     (match_3_reg_sel_1),
    .intr_en_reg_sel                     (intr_en_reg_sel[1]),
    .clear_interrupt                     (clear_interrupt[1]),
                                  
    //outputs
    .clk_ctrl_reg                        (clk_ctrl_reg_1),
    .counter_val_reg                     (counter_val_reg_1),
    .cntr_ctrl_reg                       (cntr_ctrl_reg_1),
    .interval_reg                        (interval_reg_1),
    .match_1_reg                         (match_1_reg_1),
    .match_2_reg                         (match_2_reg_1),
    .match_3_reg                         (match_3_reg_1),
    .interrupt                           (TTC_int[1]),
    .interrupt_reg                       (interrupt_reg_1),
    .interrupt_en_reg                    (interrupt_en_reg_1)
  );


  ttc_timer_counter_lite i_ttc_timer_counter_lite_2 ( 

    //inputs
    .n_p_reset                           (n_p_reset), 
    .pclk                                (pclk),
    .pwdata                              (pwdata[15:0]),
    .clk_ctrl_reg_sel                    (clk_ctrl_reg_sel_2),
    .cntr_ctrl_reg_sel                   (cntr_ctrl_reg_sel_2),
    .interval_reg_sel                    (interval_reg_sel_2),
    .match_1_reg_sel                     (match_1_reg_sel_2),
    .match_2_reg_sel                     (match_2_reg_sel_2),
    .match_3_reg_sel                     (match_3_reg_sel_2),
    .intr_en_reg_sel                     (intr_en_reg_sel[2]),
    .clear_interrupt                     (clear_interrupt[2]),
                                  
    //outputs
    .clk_ctrl_reg                        (clk_ctrl_reg_2),
    .counter_val_reg                     (counter_val_reg_2),
    .cntr_ctrl_reg                       (cntr_ctrl_reg_2),
    .interval_reg                        (interval_reg_2),
    .match_1_reg                         (match_1_reg_2),
    .match_2_reg                         (match_2_reg_2),
    .match_3_reg                         (match_3_reg_2),
    .interrupt                           (TTC_int[2]),
    .interrupt_reg                       (interrupt_reg_2),
    .interrupt_en_reg                    (interrupt_en_reg_2)
  );



  ttc_timer_counter_lite i_ttc_timer_counter_lite_3 ( 

    //inputs
    .n_p_reset                           (n_p_reset), 
    .pclk                                (pclk),
    .pwdata                              (pwdata[15:0]),
    .clk_ctrl_reg_sel                    (clk_ctrl_reg_sel_3),
    .cntr_ctrl_reg_sel                   (cntr_ctrl_reg_sel_3),
    .interval_reg_sel                    (interval_reg_sel_3),
    .match_1_reg_sel                     (match_1_reg_sel_3),
    .match_2_reg_sel                     (match_2_reg_sel_3),
    .match_3_reg_sel                     (match_3_reg_sel_3),
    .intr_en_reg_sel                     (intr_en_reg_sel[3]),
    .clear_interrupt                     (clear_interrupt[3]),
                                              
    //outputs
    .clk_ctrl_reg                        (clk_ctrl_reg_3),
    .counter_val_reg                     (counter_val_reg_3),
    .cntr_ctrl_reg                       (cntr_ctrl_reg_3),
    .interval_reg                        (interval_reg_3),
    .match_1_reg                         (match_1_reg_3),
    .match_2_reg                         (match_2_reg_3),
    .match_3_reg                         (match_3_reg_3),
    .interrupt                           (TTC_int[3]),
    .interrupt_reg                       (interrupt_reg_3),
    .interrupt_en_reg                    (interrupt_en_reg_3)
  );





endmodule 
