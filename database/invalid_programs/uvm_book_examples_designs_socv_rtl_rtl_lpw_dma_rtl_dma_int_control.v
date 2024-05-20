// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : dma_int_control.v
//Title       : 
//Created     : 1999
//Description : DMA interrupt controller
//Notes       : The DMA interrupt controller will take each of the dma channels
//              status information and assert an interrupt to the PIC if the 
//              appropriate mask bit is asserted.
//              A read of the status register will cause any set status bits to be
//              cleared (care must be taken to avoid interrupts occuring at the
//              same time as the read being lost)

//------------------------------------------------------------------------------
// Include Files
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
//------------------------------------------------------------------------------

`include   "dma_defs.v"             // DMA defines

//------------------------------------------------------------------------------
// Module Declaration
//------------------------------------------------------------------------------
//
module dma_int_control(
            hclk,                       // ahb system clock
            n_hreset,                    // ahb system reset
            // register control signals (4 registers)
            mask_en_sel,                // write to mask enable
            mask_dis_sel,               // write to mask disable
            int_sel,                    // write to status reg 
// (write one to clear)
            write_data,                 // data for writes 
            // (assume word accesses)
            ahb_byte,
            // dma status inputs
            ch0_complete,
            ch0_abort,
`ifdef one_channel
`else
            ch1_complete,
            ch1_abort,
`ifdef two_channel
`else
            ch2_complete,
            ch2_abort,  
`ifdef three_channel
`else
            ch3_complete,
            ch3_abort,  
`endif
`endif
`endif
            // register outputs
            int_mask,
            int_status,
            // interrupt output
            dma_int
            );

//==========================
// input/output declarations
//==========================

  input             hclk;
  input             n_hreset;
// register control signals (4 registers)
  input             mask_en_sel;            
  input             mask_dis_sel;           
  input             int_sel;                
  //input      [31:0] write_data; 
  input       [7:0] write_data; 
  //input       [3:0] ahb_byte;           
  input             ahb_byte;           
// dma status inputs
  input             ch0_complete;
  input             ch0_abort;
`ifdef one_channel
`else
  input             ch1_complete;
  input             ch1_abort;
`ifdef two_channel
`else
  input             ch2_complete;
  input             ch2_abort;  
`ifdef three_channel
`else
  input             ch3_complete;
  input             ch3_abort;  
`endif
`endif
`endif
// register outputs
`ifdef one_channel
  output      [1:0] int_mask;
  output      [1:0] int_status;
`else
`ifdef two_channel
  output      [3:0] int_mask;
  output      [3:0] int_status;
`else
`ifdef three_channel
  output      [5:0] int_mask;
  output      [5:0] int_status;
`else
  output      [7:0] int_mask;
  output      [7:0] int_status;
`endif
`endif
`endif

// interrupt output
  output            dma_int;


//==================
// wire declarations
//==================

  wire              hclk;
  wire              n_hreset;
  wire              mask_en_sel;            
  wire              mask_dis_sel;           
  wire              int_sel;                
  //wire       [31:0] write_data;             
  wire        [7:0] write_data;
  //wire        [3:0] ahb_byte;           
  wire              ahb_byte;           
// dma status wire s
  wire              ch0_complete;
  wire              ch0_abort;
  reg               ch0_complete_reg;
  reg               ch0_abort_reg;
`ifdef one_channel
  reg         [1:0] int_mask;
  reg         [1:0] int_status;
`else
  wire              ch1_complete;
  wire              ch1_abort;
  reg               ch1_complete_reg;
  reg               ch1_abort_reg;
`ifdef two_channel
  reg         [3:0] int_mask;
  reg         [3:0] int_status;
`else
  wire              ch2_complete;
  wire              ch2_abort;  
  reg               ch2_complete_reg;
  reg               ch2_abort_reg;  
`ifdef three_channel
  reg         [5:0] int_mask;
  reg         [5:0] int_status;
`else
  wire              ch3_complete;
  wire              ch3_abort;  
  reg               ch3_complete_reg;
  reg               ch3_abort_reg;  
  reg         [7:0] int_mask;
  reg         [7:0] int_status;
`endif
`endif
`endif
// interrupt reg   
  reg               dma_int;


//==========
// Main code
//==========

// This module implements a mask and a status register.  The mask is a register
// triplet and the status register is read clear - with all status bits being 
// triggered (do not need to perform anti-metastability as status signals
// are generated synchronously

always @(posedge hclk or negedge n_hreset)
begin
    if (~n_hreset)
    begin
//added by Binata start
`ifdef one_channel 
        int_mask <= 2'b00;
`else
`ifdef two_channel
	int_mask <= 4'b0000;
`else
`ifdef three_channel
	int_mask <= 6'b000000;
`else
	int_mask <= 8'b00000000;
`endif
`endif
`endif

//end of addition
    end
    else
    begin
        //if (ahb_byte[0]) // only bottom byte ever used(unless more 
        if (ahb_byte) // only bottom byte ever used(unless more 
                         // channel/interrupts added)
        begin
            if (mask_en_sel)
`ifdef one_channel
                int_mask <= int_mask | write_data[1:0];
            else if (mask_dis_sel)
                int_mask <= int_mask & ~write_data[1:0];
`else
`ifdef two_channel
                int_mask <= int_mask | write_data[3:0];
            else if (mask_dis_sel)
                int_mask <= int_mask & ~write_data[3:0];
`else
`ifdef three_channel
                int_mask <= int_mask | write_data[5:0];
            else if (mask_dis_sel)
                int_mask <= int_mask & ~write_data[5:0];
`else
                int_mask <= int_mask | write_data[7:0];
            else if (mask_dis_sel)
                int_mask <= int_mask & ~write_data[7:0];
`endif
`endif
`endif
        end
    end
end

// all status inputs are pulses therefore no edge detection is required
// the inputs are registered and cleared when a read occurs.

always @(posedge hclk or negedge n_hreset)
begin
    if (~n_hreset)
    begin
        ch0_complete_reg <= 1'b0;
        ch0_abort_reg    <= 1'b0;
    end
    else
    begin
        if (ch0_complete)
            ch0_complete_reg <= 1'b1;
        else if (int_sel & write_data[0] & ahb_byte)
            ch0_complete_reg <= 1'b0;
        if (ch0_abort)
            ch0_abort_reg <= 1'b1;
        else if (int_sel & write_data[1] & ahb_byte)
            ch0_abort_reg <= 1'b0;
    end
end

`ifdef one_channel
`else
always @(posedge hclk or negedge n_hreset)
begin
    if (~n_hreset)
    begin
        ch1_complete_reg <= 1'b0;
        ch1_abort_reg    <= 1'b0;
    end
    else
    begin
        if (ch1_complete)
            ch1_complete_reg <= 1'b1;
        else if (int_sel & write_data[2] & ahb_byte)
            ch1_complete_reg <= 1'b0;
        if (ch1_abort)
            ch1_abort_reg <= 1'b1;
        else if (int_sel & write_data[3] & ahb_byte)
            ch1_abort_reg <= 1'b0;
    end
end

`ifdef two_channel
`else
always @(posedge hclk or negedge n_hreset)
begin
    if (~n_hreset)
    begin
        ch2_complete_reg <= 1'b0;
        ch2_abort_reg    <= 1'b0;  
    end
    else
    begin
        if (ch2_complete)
            ch2_complete_reg <= 1'b1;
        else if (int_sel & write_data[4] & ahb_byte)
            ch2_complete_reg <= 1'b0;
        if (ch2_abort)
            ch2_abort_reg <= 1'b1;
        else if (int_sel & write_data[5] & ahb_byte)
            ch2_abort_reg <= 1'b0;
    end
end

`ifdef three_channel
`else
always @(posedge hclk or negedge n_hreset)
begin
    if (~n_hreset)
    begin
        ch3_complete_reg <= 1'b0;
        ch3_abort_reg    <= 1'b0;  
    end
    else
    begin
        if (ch3_complete)
            ch3_complete_reg <= 1'b1;
        else if (int_sel & write_data[6] & ahb_byte)
            ch3_complete_reg <= 1'b0;
        if (ch3_abort)
            ch3_abort_reg <= 1'b1;
        else if (int_sel & write_data[7] & ahb_byte)
            ch3_abort_reg <= 1'b0;
    end
end
`endif
`endif
`endif

// build int_status register

always @(
`ifdef one_channel
`else
         ch1_complete_reg or ch1_abort_reg or 
`ifdef two_channel
`else
         ch2_complete_reg or ch2_abort_reg or 
`ifdef three_channel
`else
         ch3_complete_reg or ch3_abort_reg or 
`endif
`endif
`endif
         ch0_complete_reg or ch0_abort_reg)
begin
`ifdef one_channel
    int_status = {ch0_abort_reg, ch0_complete_reg};
//Binata
`else `ifdef two_channel
//`elseif two_channel
    int_status = {ch1_abort_reg, ch1_complete_reg,
                  ch0_abort_reg, ch0_complete_reg};
`else `ifdef three_channel
//`elseif  three_channel
    int_status = {ch2_abort_reg, ch2_complete_reg,
                  ch1_abort_reg, ch1_complete_reg,
                  ch0_abort_reg, ch0_complete_reg};
`else
    int_status = {ch3_abort_reg, ch3_complete_reg,
                  ch2_abort_reg, ch2_complete_reg,
                  ch1_abort_reg, ch1_complete_reg,
                  ch0_abort_reg, ch0_complete_reg};
`endif
`endif
`endif
end

// generate dma_int
// should be set if both the appropriate mask and status bits are set of
// any interrupt
always @(int_status or int_mask)
begin
    dma_int = |(int_mask & int_status);
end

endmodule
