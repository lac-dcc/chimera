// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : ttc_interface_lite.v
//Title       : 
//Created     : 1999
//Description : The APB interface with the triple timer counter
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


//----------------------------------------------------------------------------
// Module definition
//----------------------------------------------------------------------------

module ttc_interface_lite( 

  //inputs
  n_p_reset,    
  pclk,                          
  psel,
  penable,
  pwrite,
  paddr,
  clk_ctrl_reg_1,
  clk_ctrl_reg_2,
  clk_ctrl_reg_3,
  cntr_ctrl_reg_1,
  cntr_ctrl_reg_2,
  cntr_ctrl_reg_3,
  counter_val_reg_1,
  counter_val_reg_2,
  counter_val_reg_3,
  interval_reg_1,
  match_1_reg_1,
  match_2_reg_1,
  match_3_reg_1,
  interval_reg_2,
  match_1_reg_2,
  match_2_reg_2,
  match_3_reg_2,
  interval_reg_3,
  match_1_reg_3,
  match_2_reg_3,
  match_3_reg_3,
  interrupt_reg_1,
  interrupt_reg_2,
  interrupt_reg_3,      
  interrupt_en_reg_1,
  interrupt_en_reg_2,
  interrupt_en_reg_3,
                  
  //outputs
  prdata,
  clk_ctrl_reg_sel_1,
  clk_ctrl_reg_sel_2,
  clk_ctrl_reg_sel_3,
  cntr_ctrl_reg_sel_1,
  cntr_ctrl_reg_sel_2,
  cntr_ctrl_reg_sel_3,
  interval_reg_sel_1,                            
  interval_reg_sel_2,                          
  interval_reg_sel_3,
  match_1_reg_sel_1,                          
  match_1_reg_sel_2,                          
  match_1_reg_sel_3,                
  match_2_reg_sel_1,                          
  match_2_reg_sel_2,
  match_2_reg_sel_3,
  match_3_reg_sel_1,                          
  match_3_reg_sel_2,                         
  match_3_reg_sel_3,
  intr_en_reg_sel,
  clear_interrupt        
                  
);


//----------------------------------------------------------------------------
// PORT DECLARATIONS
//----------------------------------------------------------------------------

   //inputs
   input        n_p_reset;              //reset signal
   input        pclk;                 //System Clock
   input        psel;                 //Select line
   input        penable;              //Strobe line
   input        pwrite;               //Write line, 1 for write, 0 for read
   input [7:0]  paddr;                //Address Bus register
   input [6:0]  clk_ctrl_reg_1;       //Clock Control reg for Timer_Counter 1
   input [6:0]  cntr_ctrl_reg_1;      //Counter Control reg for Timer_Counter 1
   input [6:0]  clk_ctrl_reg_2;       //Clock Control reg for Timer_Counter 2
   input [6:0]  cntr_ctrl_reg_2;      //Counter Control reg for Timer Counter 2
   input [6:0]  clk_ctrl_reg_3;       //Clock Control reg Timer_Counter 3
   input [6:0]  cntr_ctrl_reg_3;      //Counter Control reg for Timer Counter 3
   input [15:0] counter_val_reg_1;    //Counter Value from Timer_Counter 1
   input [15:0] counter_val_reg_2;    //Counter Value from Timer_Counter 2
   input [15:0] counter_val_reg_3;    //Counter Value from Timer_Counter 3
   input [15:0] interval_reg_1;       //Interval reg value from Timer_Counter 1
   input [15:0] match_1_reg_1;        //Match reg value from Timer_Counter 
   input [15:0] match_2_reg_1;        //Match reg value from Timer_Counter     
   input [15:0] match_3_reg_1;        //Match reg value from Timer_Counter 
   input [15:0] interval_reg_2;       //Interval reg value from Timer_Counter 2
   input [15:0] match_1_reg_2;        //Match reg value from Timer_Counter     
   input [15:0] match_2_reg_2;        //Match reg value from Timer_Counter     
   input [15:0] match_3_reg_2;        //Match reg value from Timer_Counter 
   input [15:0] interval_reg_3;       //Interval reg value from Timer_Counter 3
   input [15:0] match_1_reg_3;        //Match reg value from Timer_Counter   
   input [15:0] match_2_reg_3;        //Match reg value from Timer_Counter   
   input [15:0] match_3_reg_3;        //Match reg value from Timer_Counter   
   input [5:0]  interrupt_reg_1;      //Interrupt Reg from Interrupt Module 1
   input [5:0]  interrupt_reg_2;      //Interrupt Reg from Interrupt Module 2
   input [5:0]  interrupt_reg_3;      //Interrupt Reg from Interrupt Module 3
   input [5:0]  interrupt_en_reg_1;   //Interrupt Enable Reg from Intrpt Module 1
   input [5:0]  interrupt_en_reg_2;   //Interrupt Enable Reg from Intrpt Module 2
   input [5:0]  interrupt_en_reg_3;   //Interrupt Enable Reg from Intrpt Module 3
   
   //outputs
   output [31:0] prdata;              //Read Data from the APB Interface
   output clk_ctrl_reg_sel_1;         //Clock Control Reg Select TC_1 
   output clk_ctrl_reg_sel_2;         //Clock Control Reg Select TC_2 
   output clk_ctrl_reg_sel_3;         //Clock Control Reg Select TC_3 
   output cntr_ctrl_reg_sel_1;        //Counter Control Reg Select TC_1
   output cntr_ctrl_reg_sel_2;        //Counter Control Reg Select TC_2
   output cntr_ctrl_reg_sel_3;        //Counter Control Reg Select TC_3
   output interval_reg_sel_1;         //Interval Interrupt Reg Select TC_1 
   output interval_reg_sel_2;         //Interval Interrupt Reg Select TC_2 
   output interval_reg_sel_3;         //Interval Interrupt Reg Select TC_3 
   output match_1_reg_sel_1;          //Match Reg Select TC_1
   output match_1_reg_sel_2;          //Match Reg Select TC_2
   output match_1_reg_sel_3;          //Match Reg Select TC_3
   output match_2_reg_sel_1;          //Match Reg Select TC_1
   output match_2_reg_sel_2;          //Match Reg Select TC_2
   output match_2_reg_sel_3;          //Match Reg Select TC_3
   output match_3_reg_sel_1;          //Match Reg Select TC_1
   output match_3_reg_sel_2;          //Match Reg Select TC_2
   output match_3_reg_sel_3;          //Match Reg Select TC_3
   output [3:1] intr_en_reg_sel;      //Interrupt Enable Reg Select
   output [3:1] clear_interrupt;      //Clear Interrupt line


//-----------------------------------------------------------------------------
// PARAMETER DECLARATIONS
//-----------------------------------------------------------------------------

   parameter   [7:0] CLK_CTRL_REG_1_ADDR   = 8'h00; //Clock control 1 address
   parameter   [7:0] CLK_CTRL_REG_2_ADDR   = 8'h04; //Clock control 2 address
   parameter   [7:0] CLK_CTRL_REG_3_ADDR   = 8'h08; //Clock control 3 address
   parameter   [7:0] CNTR_CTRL_REG_1_ADDR  = 8'h0C; //Counter control 1 address
   parameter   [7:0] CNTR_CTRL_REG_2_ADDR  = 8'h10; //Counter control 2 address
   parameter   [7:0] CNTR_CTRL_REG_3_ADDR  = 8'h14; //Counter control 3 address
   parameter   [7:0] CNTR_VAL_REG_1_ADDR   = 8'h18; //Counter value 1 address
   parameter   [7:0] CNTR_VAL_REG_2_ADDR   = 8'h1C; //Counter value 2 address
   parameter   [7:0] CNTR_VAL_REG_3_ADDR   = 8'h20; //Counter value 3 address
   parameter   [7:0] INTERVAL_REG_1_ADDR   = 8'h24; //Module 1 interval address
   parameter   [7:0] INTERVAL_REG_2_ADDR   = 8'h28; //Module 2 interval address
   parameter   [7:0] INTERVAL_REG_3_ADDR   = 8'h2C; //Module 3 interval address
   parameter   [7:0] MATCH_1_REG_1_ADDR    = 8'h30; //Module 1 Match 1 address
   parameter   [7:0] MATCH_1_REG_2_ADDR    = 8'h34; //Module 2 Match 1 address
   parameter   [7:0] MATCH_1_REG_3_ADDR    = 8'h38; //Module 3 Match 1 address
   parameter   [7:0] MATCH_2_REG_1_ADDR    = 8'h3C; //Module 1 Match 2 address
   parameter   [7:0] MATCH_2_REG_2_ADDR    = 8'h40; //Module 2 Match 2 address
   parameter   [7:0] MATCH_2_REG_3_ADDR    = 8'h44; //Module 3 Match 2 address
   parameter   [7:0] MATCH_3_REG_1_ADDR    = 8'h48; //Module 1 Match 3 address
   parameter   [7:0] MATCH_3_REG_2_ADDR    = 8'h4C; //Module 2 Match 3 address
   parameter   [7:0] MATCH_3_REG_3_ADDR    = 8'h50; //Module 3 Match 3 address
   parameter   [7:0] IRQ_REG_1_ADDR        = 8'h54; //Interrupt register 1
   parameter   [7:0] IRQ_REG_2_ADDR        = 8'h58; //Interrupt register 2
   parameter   [7:0] IRQ_REG_3_ADDR        = 8'h5C; //Interrupt register 3
   parameter   [7:0] IRQ_EN_REG_1_ADDR     = 8'h60; //Interrupt enable register 1
   parameter   [7:0] IRQ_EN_REG_2_ADDR     = 8'h64; //Interrupt enable register 2
   parameter   [7:0] IRQ_EN_REG_3_ADDR     = 8'h68; //Interrupt enable register 3
   
//-----------------------------------------------------------------------------
// Internal Signals & Registers
//-----------------------------------------------------------------------------

   reg clk_ctrl_reg_sel_1;         //Clock Control Reg Select TC_1
   reg clk_ctrl_reg_sel_2;         //Clock Control Reg Select TC_2 
   reg clk_ctrl_reg_sel_3;         //Clock Control Reg Select TC_3 
   reg cntr_ctrl_reg_sel_1;        //Counter Control Reg Select TC_1
   reg cntr_ctrl_reg_sel_2;        //Counter Control Reg Select TC_2
   reg cntr_ctrl_reg_sel_3;        //Counter Control Reg Select TC_3
   reg interval_reg_sel_1;         //Interval Interrupt Reg Select TC_1 
   reg interval_reg_sel_2;         //Interval Interrupt Reg Select TC_2
   reg interval_reg_sel_3;         //Interval Interrupt Reg Select TC_3
   reg match_1_reg_sel_1;          //Match Reg Select TC_1
   reg match_1_reg_sel_2;          //Match Reg Select TC_2
   reg match_1_reg_sel_3;          //Match Reg Select TC_3
   reg match_2_reg_sel_1;          //Match Reg Select TC_1
   reg match_2_reg_sel_2;          //Match Reg Select TC_2
   reg match_2_reg_sel_3;          //Match Reg Select TC_3
   reg match_3_reg_sel_1;          //Match Reg Select TC_1
   reg match_3_reg_sel_2;          //Match Reg Select TC_2
   reg match_3_reg_sel_3;          //Match Reg Select TC_3
   reg [3:1] intr_en_reg_sel;      //Interrupt Enable 1 Reg Select
   reg [31:0] prdata;              //APB read data
   
   wire [3:1] clear_interrupt;     // 3-bit clear interrupt reg on read
   wire write;                     //APB write command  
   wire read;                      //APB read command    



   assign write = psel & penable & pwrite;  
   assign read  = psel & ~pwrite;  
   assign clear_interrupt[1] = read & penable & (paddr == IRQ_REG_1_ADDR);
   assign clear_interrupt[2] = read & penable & (paddr == IRQ_REG_2_ADDR);
   assign clear_interrupt[3] = read & penable & (paddr == IRQ_REG_3_ADDR);   
   
   //p_write_sel: Process to select the required regs for write access.

   always @ (paddr or write)
   begin: p_write_sel

       clk_ctrl_reg_sel_1  = (write && (paddr == CLK_CTRL_REG_1_ADDR));
       clk_ctrl_reg_sel_2  = (write && (paddr == CLK_CTRL_REG_2_ADDR));
       clk_ctrl_reg_sel_3  = (write && (paddr == CLK_CTRL_REG_3_ADDR));
       cntr_ctrl_reg_sel_1 = (write && (paddr == CNTR_CTRL_REG_1_ADDR));
       cntr_ctrl_reg_sel_2 = (write && (paddr == CNTR_CTRL_REG_2_ADDR));
       cntr_ctrl_reg_sel_3 = (write && (paddr == CNTR_CTRL_REG_3_ADDR));
       interval_reg_sel_1  = (write && (paddr == INTERVAL_REG_1_ADDR));
       interval_reg_sel_2  = (write && (paddr == INTERVAL_REG_2_ADDR));
       interval_reg_sel_3  = (write && (paddr == INTERVAL_REG_3_ADDR));
       match_1_reg_sel_1   = (write && (paddr == MATCH_1_REG_1_ADDR));
       match_1_reg_sel_2   = (write && (paddr == MATCH_1_REG_2_ADDR));
       match_1_reg_sel_3   = (write && (paddr == MATCH_1_REG_3_ADDR));
       match_2_reg_sel_1   = (write && (paddr == MATCH_2_REG_1_ADDR));
       match_2_reg_sel_2   = (write && (paddr == MATCH_2_REG_2_ADDR));
       match_2_reg_sel_3   = (write && (paddr == MATCH_2_REG_3_ADDR));
       match_3_reg_sel_1   = (write && (paddr == MATCH_3_REG_1_ADDR));
       match_3_reg_sel_2   = (write && (paddr == MATCH_3_REG_2_ADDR));
       match_3_reg_sel_3   = (write && (paddr == MATCH_3_REG_3_ADDR));
       intr_en_reg_sel[1]  = (write && (paddr == IRQ_EN_REG_1_ADDR));
       intr_en_reg_sel[2]  = (write && (paddr == IRQ_EN_REG_2_ADDR));
       intr_en_reg_sel[3]  = (write && (paddr == IRQ_EN_REG_3_ADDR));      
   end  //p_write_sel
    

//    p_read_sel: Process to enable the read operation to occur.

   always @ (posedge pclk or negedge n_p_reset)
   begin: p_read_sel

      if (!n_p_reset)                                   
      begin                                     
         prdata <= 32'h00000000;
      end    
      else
      begin 

         if (read == 1'b1)
         begin
            
            case (paddr)

               CLK_CTRL_REG_1_ADDR : prdata <= {25'h0000000,clk_ctrl_reg_1};
               CLK_CTRL_REG_2_ADDR : prdata <= {25'h0000000,clk_ctrl_reg_2};
               CLK_CTRL_REG_3_ADDR : prdata <= {25'h0000000,clk_ctrl_reg_3};
               CNTR_CTRL_REG_1_ADDR: prdata <= {25'h0000000,cntr_ctrl_reg_1};
               CNTR_CTRL_REG_2_ADDR: prdata <= {25'h0000000,cntr_ctrl_reg_2};
               CNTR_CTRL_REG_3_ADDR: prdata <= {25'h0000000,cntr_ctrl_reg_3};
               CNTR_VAL_REG_1_ADDR : prdata <= {16'h0000,counter_val_reg_1};
               CNTR_VAL_REG_2_ADDR : prdata <= {16'h0000,counter_val_reg_2};
               CNTR_VAL_REG_3_ADDR : prdata <= {16'h0000,counter_val_reg_3};
               INTERVAL_REG_1_ADDR : prdata <= {16'h0000,interval_reg_1};
               INTERVAL_REG_2_ADDR : prdata <= {16'h0000,interval_reg_2};
               INTERVAL_REG_3_ADDR : prdata <= {16'h0000,interval_reg_3};
               MATCH_1_REG_1_ADDR  : prdata <= {16'h0000,match_1_reg_1};
               MATCH_1_REG_2_ADDR  : prdata <= {16'h0000,match_1_reg_2};
               MATCH_1_REG_3_ADDR  : prdata <= {16'h0000,match_1_reg_3};
               MATCH_2_REG_1_ADDR  : prdata <= {16'h0000,match_2_reg_1};
               MATCH_2_REG_2_ADDR  : prdata <= {16'h0000,match_2_reg_2};
               MATCH_2_REG_3_ADDR  : prdata <= {16'h0000,match_2_reg_3};
               MATCH_3_REG_1_ADDR  : prdata <= {16'h0000,match_3_reg_1};
               MATCH_3_REG_2_ADDR  : prdata <= {16'h0000,match_3_reg_2};
               MATCH_3_REG_3_ADDR  : prdata <= {16'h0000,match_3_reg_3};
               IRQ_REG_1_ADDR      : prdata <= {26'h0000,interrupt_reg_1};
               IRQ_REG_2_ADDR      : prdata <= {26'h0000,interrupt_reg_2};
               IRQ_REG_3_ADDR      : prdata <= {26'h0000,interrupt_reg_3};
               IRQ_EN_REG_1_ADDR   : prdata <= {26'h0000,interrupt_en_reg_1};
               IRQ_EN_REG_2_ADDR   : prdata <= {26'h0000,interrupt_en_reg_2};
               IRQ_EN_REG_3_ADDR   : prdata <= {26'h0000,interrupt_en_reg_3};
               default             : prdata <= 32'h00000000;

            endcase

         end // if (read == 1'b1)
         
         else
            
         begin
            
            prdata <= 32'h00000000;
            
         end // else: !if(read == 1'b1)         
         
      end // else: !if(!n_p_reset)
      
   end // block: p_read_sel

endmodule

