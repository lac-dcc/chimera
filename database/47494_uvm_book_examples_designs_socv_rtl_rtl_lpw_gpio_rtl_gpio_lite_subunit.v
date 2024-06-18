// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : gpio_lite_subunit.v
//Title       : 
//Created     : 1999
//Description : Parametrised GPIO pin circuits
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


module gpio_lite_subunit(
  //Inputs

  n_reset,
  pclk,

  read,
  write,
  addr,

  wdata,
  pin_in,

  tri_state_enable,

  //Outputs
 
  interrupt,

  rdata,
  pin_oe_n,
  pin_out

);
 
   // Inputs
   
   // Clocks   
   input n_reset;            // asynch reset, active low
   input pclk;               // Ppclk

   // Controls
   input read;               // select GPIO read
   input write;              // select GPIO write
   input [5:0] 
         addr;               // address bus of selected master

   // Dataflow
   input [15:0]
         wdata;              // GPIO Input
   input [15:0]
         pin_in;             // input data from pin

   //Design for Test Inputs
   input [15:0]
         tri_state_enable;   // disables op enable -> Z




   
   // Outputs
   
   // Controls
   output [15:0]
          interrupt;         // interupt for input pin change

   // Dataflow
   output [15:0]
          rdata;             // GPIO Output
   output [15:0]
          pin_oe_n;          // output enable signal to pin
   output [15:0]
          pin_out;           // output signal to pin
   



   
   // Registers in module

   //Define Physical registers in amba_unit
   reg    [15:0]
          direction_mode;     // 1=Input 0=Output              RW
   reg    [15:0]
          output_enable;      // Output active                 RW
   reg    [15:0]
          output_value;       // Value outputed from reg       RW
   reg    [15:0]
          input_value;        // Value input from bus          R
   reg    [15:0]
          int_status;         // Interrupt status              R

   // registers to remove metastability
   reg    [15:0]
          s_synch;            //stage_two
   reg    [15:0]
          s_synch_two;        //stage_one - to ext pin
   
   
    
          
   // Registers for outputs
   reg    [15:0]
          rdata;              // prdata reg
   wire   [15:0]
          pin_oe_n;           // gpio output enable
   wire   [15:0]
          pin_out;            // gpio output value
   wire   [15:0]
          interrupt;          // gpio interrupt
   wire   [15:0]
          interrupt_trigger;  // 1 sets interrupt status
   reg    [15:0]
          status_clear;       // 1 clears interrupt status
   wire   [15:0]
          int_event;          // 1 detects an interrupt event

   integer ia;                // loop variable
   


   // address decodes
   wire   ad_direction_mode;  // 1=Input 0=Output              RW
   wire   ad_output_enable;   // Output active                 RW
   wire   ad_output_value;    // Value outputed from reg       RW
   wire   ad_int_status;      // Interrupt status              R
   
//Register addresses
//If modifying the APB address (PADDR) width change the following bit widths
parameter GPR_DIRECTION_MODE   = 6'h04;       // set pin to either I or O
parameter GPR_OUTPUT_ENABLE    = 6'h08;       // contains oe control value
parameter GPR_OUTPUT_VALUE     = 6'h0C;       // output value to be driven
parameter GPR_INPUT_VALUE      = 6'h10;       // gpio input value reg
parameter GPR_INT_STATUS       = 6'h20;       // Interrupt status register

//Reset Values
//If modifying the GPIO width change the following bit widths
//parameter GPRV_RSRVD            = 32'h0000_0000; // Reserved
parameter GPRV_DIRECTION_MODE  = 32'h00000000; // Default to output mode
parameter GPRV_OUTPUT_ENABLE   = 32'h00000000; // Default 3 stated outs
parameter GPRV_OUTPUT_VALUE    = 32'h00000000; // Default to be driven
parameter GPRV_INPUT_VALUE     = 32'h00000000; // Read defaults to zero
parameter GPRV_INT_STATUS      = 32'h00000000; // Int status cleared



   //assign ad_bypass_mode    = ( addr == GPR_BYPASS_MODE );   
   assign ad_direction_mode = ( addr == GPR_DIRECTION_MODE );   
   assign ad_output_enable  = ( addr == GPR_OUTPUT_ENABLE );   
   assign ad_output_value   = ( addr == GPR_OUTPUT_VALUE );   
   assign ad_int_status     = ( addr == GPR_INT_STATUS );   

   // assignments
   
   assign interrupt         = ( int_status);

   assign interrupt_trigger = ( direction_mode & int_event ); 

   assign int_event = ((s_synch ^ input_value) & ((s_synch)));

   always @( ad_int_status or read )
   begin : p_status_clear

     for ( ia = 0; ia < 16; ia = ia + 1 )
     begin

       status_clear[ia] = ( ad_int_status & read );

     end // for ia

   end // p_status_clear

   // p_write_register : clocked / asynchronous
   //
   // this section contains all the code to write registers

   always @(posedge pclk or negedge n_reset)
   begin : p_write_register

      if (~n_reset)
      
       begin
         direction_mode  <= GPRV_DIRECTION_MODE;
         output_enable   <= GPRV_OUTPUT_ENABLE;
         output_value    <= GPRV_OUTPUT_VALUE;
       end
      
      else 
      
       begin
      
         if (write == 1'b1) // Write value to registers
      
          begin
              
            // Write Mode
         
            if ( ad_direction_mode ) 
               direction_mode <= wdata;
 
            if ( ad_output_enable ) 
               output_enable  <= wdata;
     
            if ( ad_output_value )
               output_value   <= wdata;

              

           end // if write
         
       end // else: ~if(~n_reset)
      
   end // block: p_write_register



   // p_metastable : clocked / asynchronous 
   //
   // This process  acts to remove  metastability propagation
   // Only for input to GPIO
   // In Bypass mode pin_in passes straight through

   always @(posedge pclk or negedge n_reset)
      
   begin : p_metastable
      
      if (~n_reset)
        begin
         
         s_synch       <= {16 {1'b0}};
         s_synch_two   <= {16 {1'b0}};
         input_value   <= GPRV_INPUT_VALUE;
         
        end // if (~n_reset)
      
      else         
        begin
         
         input_value   <= s_synch;
         s_synch       <= s_synch_two;
         s_synch_two   <= pin_in;

        end // else: ~if(~n_reset)
      
   end // block: p_metastable


   // p_interrupt : clocked / asynchronous 
   //
   // These lines set and clear the interrupt status

   always @(posedge pclk or negedge n_reset)
   begin : p_interrupt
      
      if (~n_reset)
         int_status      <= GPRV_INT_STATUS;
      
      else 
         int_status      <= ( int_status & ~(status_clear) // read & clear
                            ) |
                            interrupt_trigger;             // new interrupt
        
   end // block: p_interrupt
   
   
   // p_read_register  : clocked / asynchronous 
   //
   // this process registers the output values

   always @(posedge pclk or negedge n_reset)

      begin : p_read_register
         
         if (~n_reset)
         
           begin

            rdata <= {16 {1'b0}};

           end
           
         else //if not reset
         
           begin
         
            if (read == 1'b1)
            
              begin
            
               case (addr)
            
                  
                  GPR_DIRECTION_MODE:
                     rdata <= direction_mode;
                  
                  GPR_OUTPUT_ENABLE:
                     rdata <= output_enable;
                  
                  GPR_OUTPUT_VALUE:
                     rdata <= output_value;
                  
                  GPR_INT_STATUS:
                     rdata <= int_status;
                  
                  default: // if GPR_INPUT_VALUE or unmapped reg addr
                     rdata <= input_value;
            
               endcase
            
              end //end if read
            
            else //in not read
            
              begin // if not a valid read access, keep '0'-s 
              
               rdata <= {16 {1'b0}};
              
              end //end if not read
              
           end //end else if not reset

      end // p_read_register


   assign pin_out = 
        ( output_value ) ;
     
   assign pin_oe_n = 
      ( ( ~(output_enable & ~(direction_mode)) ) |
        tri_state_enable ) ;

                
  
endmodule // gpio_subunit



   
   



   
