// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
// Module designer: Dimitris Syrivelis
// Backup: Christian Pinto, Michele Gazzetti

`timescale 1ns / 10ps

// ******************************************************************************************************************************
// File Name          :  net_cmdfifo.v
// 
// Module Description : This file contains a command buffer FIFO to "pre-fetch" a number of commands from the TLX.
//                      More importantly, the command at the head of the FIFO can be presented and held for any number
//                      of cycles. This differs from the TLX interface where the command is only valid for one cycle
//                      (when cmd_valid=1) whether the AFU is ready to receive it or not. The AFU's command dispatch
//                      logic may not be able to begin servicing the command immediately, depending on the command type
//                      and current state of response credits or pipelined operations in progress. Therefore this command
//                      FIFO was added to provide this behavior. 
//
//                      In addition, several commands are buffered up at once. This helps absorb latency cycles in the TLX,
//                      measured from receipt of a cmd_credit to the presentation of the next command. It also allows for
//                      a higher performing interface by enabling back to back operation of bulk memory operations if they 
//                      are of the appropriate mix. In other words if all commands are 1 FLIT writes, there will likely be
//                      a burst of commands started in the pipeline, then a break while the credit flow catches up. However
//                      if the commands are a mix of reads and writes of various lengths, there will be natural pauses in
//                      command stream while waiting for data and these pauses can be used to let the command FIFO fill up
//                      again. 
//
//                      The width of the FIFO is parameterized to make it easy to adjust to the number of TLX command
//                      signals that are needed. The LPC does not support all OpenCAPI TL commands, so some of the TLX->AFU
//                      interface signals are unused. Rather than capture them in the FIFO and discard them when dispatching,
//                      resources can be conserved by ignoring them at the TLX interface. Thus the width of the FIFO is
//                      variable to enable easy modifications as additional signals are used as functionality increases.
//                      
//                      In addition, this fifo convert OpenCAPI tlx_afu command opcodes to afu_tlx counterparts for remote mastering
//                      of the transactions. It also appends network identifier to the transaction header, and converts Real Address
//                      to Effective Address. The design works for the first 10TB of RA address space and segments it to 1TB segments. 
//                      The transaction that belong to the same segment get the same offset applied and the same network identifier
//
// ******************************************************************************************************************************
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module net_cmdfifo #(parameter integer WIDTH = 163) (
    input              clock             // Clock - samples & launches data on rising edge
  , input              reset             // When 1, reset registers to an empty FIFO state

  // Input into FIFO
  , input  [WIDTH-7:0] cmd_in            // Vector of command information to save
  , input              cmd_in_valid      // When 1, load 'cmd_in' into the FIFO
  , output             cmd_full         // When 1, there is no space in the FIFO for another command

  // Output from FIFO
  , input              cmd_dispatched    // When 1, increment read FIFO pointer to present the next FIFO entry
  , output [WIDTH-1:0] cmd_out           // Command information at head of FIFO
  , output             cmd_out_valid     // needs to be active low  fifo is empty contains valid information
 
    // Error conditions
  , output             fifo_overflow     // When 1, FIFO was full when another 'cmd_valid' arrived
   // ThymesisFlow inputs to convert PA -> EA for destination and provide destination output port
  , input [63:0]  thymesis_slot0_cfg_reg  // ThymesisFlow configuration register 0 
  , input [63:0]  thymesis_slot1_cfg_reg  // ThymesisFlow configuration register 1
  , input [63:0]  thymesis_slot2_cfg_reg  // ThymesisFlow configuration register 2
  , input [63:0]  thymesis_slot3_cfg_reg  // ThymesisFlow configuration register 3
  , input [63:0]  thymesis_slot4_cfg_reg  // ThymesisFlow configuration register 4
  , input [63:0]  thymesis_slot5_cfg_reg  // ThymesisFlow configuration register 5
  , input [63:0]  thymesis_slot6_cfg_reg  // ThymesisFlow configuration register 6
  , input [63:0]  thymesis_slot7_cfg_reg  // ThymesisFlow configuration register 7
  , input [63:0]  thymesis_slot8_cfg_reg  // ThymesisFlow configuration register 8
  , input [63:0]  thymesis_slot9_cfg_reg  // ThymesisFlow configuration register 9
  , input [63:0]  thymesis_slot10_cfg_reg // ThymesisFlow configuration register 10
  , input [63:0]  thymesis_slot11_cfg_reg // ThymesisFlow configuration register 11

) ;


// ==============================================================================================================================
// @@@  Implement FIFO
// ==============================================================================================================================

//(* RAM_STYLE="DISTRIBUTED" *)    // CAUTION: DISTRIBUTED (LUT) arrays do not latch the output (3/24/17 Timing is worse with DISTRIBUTED RAM)  
reg [WIDTH-1:0] cmdfifo [7:0];   // 8 row array
reg       [2:0] wrptr;           // Write pointer into array, points to next free entry
reg       [2:0] rdptr;           // Read  pointer from array, points to oldest valid entry
reg       [7:0] cmdfifo_val;     // 1=associated entry is used, 0=associated entry is open and can be overwritten


// Manage write pointer
always @(posedge(clock))
  begin
    if (reset == 1'b1) 
      wrptr <= 3'b000;                                      // Initialize to location 0
    else if (cmd_in_valid == 1'b1 && wrptr != 3'b111)   
      wrptr <= wrptr + 3'b001;                              // Add an entry, so increment
    else if (cmd_in_valid == 1'b1 && wrptr == 3'b111)   
      wrptr <= 3'b000;                                      // Add an entry, but wrap around to increment
    else
      wrptr <= wrptr;                                       // Hold value, nothing to load
  end

// Manage read pointer. 

always @(posedge(clock))
  begin
    if (reset == 1'b1)
      rdptr <= 3'b000;                                     // Initialize to location 0
    else if (cmd_dispatched == 1'b1 && rdptr != 3'b111 && cmdfifo_val[rdptr] == 1'b1 )
      rdptr <= rdptr + 3'b001;                              // Move to next location if cmdfifo has currently valid entries else wait for that.
    else if (cmd_dispatched == 1'b1 && rdptr == 3'b111 && cmdfifo_val[rdptr] == 1'b1)
      rdptr <= 3'b000;                                      // like above but wrap around
    else
      rdptr <= rdptr;                                       // Hold value, no operation or operation is still in progress
  end



// Manage valid indicator
/* Converted for AXI-S behaviour the fifo output
  A.  if current read pointer indicates empty spot and a new entry is in,
      just mark the spot as valid using the write pointer. This valid
      will be presented in the next cycle to the read pointer as write pointer
      advances
      
 B. if no command comes in, but read currently points to valid and the other
    entity is ready to accept now (cmd_dispatched) => invalidate read pointer bit

 C. if both command comes in and command goes out in the same cycle (which means the other entity
    can receive.
    
 D. if command comes in and command also available to go out but recipient not ready.
*/

always @(posedge(clock))
  begin 
    if (reset == 1'b1)
      cmdfifo_val <= 8'h00;                                                  // Initialize to all 0, all rows are free
    else if (cmd_in_valid == 1'b0 &&  cmdfifo_val[rdptr] == 1'b1 && cmd_dispatched == 1'b1)
      cmdfifo_val <= cmdfifo_val & ~(8'h01 << rdptr);
    else if (cmd_in_valid == 1'b1 &&  cmdfifo_val[rdptr] == 1'b1 && cmd_dispatched == 1'b1)
      cmdfifo_val <= (cmdfifo_val | (8'h01 << wrptr)) & ~(8'h01 << rdptr);  //Both set and clear bit.
    else if (cmd_in_valid == 1'b1) 
      cmdfifo_val <= cmdfifo_val | (8'h01 << wrptr);
    else
      cmdfifo_val <= cmdfifo_val;                                           // Hold value if neither bit is set
  end



// Manage row contents
// Note: Contents of array row will be 'X' until written the first time, but this should be OK.
//always @(posedge(clock))
//  if (cmd_in_valid) cmdfifo[wrptr] <= cmd_in;                           // Use code format recommended by Vivado

// Important for ThymesisFlow
// The Capture Range [HIGH BIT POSITION :LOW BIT POSITION] defines the size and number of continuous memory sections that
// can be mapped. More specifically the LOW BIT POSITION defines the size (e.g. for 1TB segments (2^40) => LOW BIT POSITION = 40)
// Eg 64 Consecutive 1TB segments we need  bits so the HIGH BIT POSITION needs to be LOW BIT POSITION + 5. Each segment 
// defines the register that holds the RA->EA conversion offset and the network pipeline credentials for the destination.
//cmd in contains:
//wire  [7:0] ncff_cmd_opcode; 8
//wire  [1:0] ncff_cmd_dl; 2
//wire [15:0] ncff_cmd_capptag; 16
//wire  [2:0] ncff_cmd_pl; 3
//wire [63:0] ncff_cmd_be; 64
//wire [63:0] ncff_cmd_pa; 64   Total = 8+2+16+3+64+64 = 157 
//cmdfifo needs to store
//wire  [5:0] nccf_net_id; 6  WIDTH-1:WIDTH-6 
//wire  [7:0] ncff_cmd_opcode; 8
//wire  [1:0] ncff_cmd_dl; 2
//wire [15:0] ncff_cmd_capptag; 16
//wire  [2:0] ncff_cmd_pl; 3
//wire [63:0] ncff_cmd_be; 64
//wire [63:0] ncff_cmd_pa; 64   Total = 6+8+2+16+3+64+64 = 163 

always @(posedge(clock))

        case({cmd_in_valid,cmd_in[45:40]})
           7'b1000000: 
                      begin             
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot0_cfg_reg[5:0];  //162-157
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;  //156 - 155
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9]; 
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot0_cfg_reg[63:6],6'b000000};
                      end
           7'b1000001: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot1_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot1_cfg_reg[63:6],6'b000000};
                      end
           7'b1000010: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot2_cfg_reg[5:0]; 
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot2_cfg_reg[63:6],6'b000000};
                      end 
           7'b1000011: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot3_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                       
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot3_cfg_reg[63:6],6'b000000};
                      end 
	       7'b1000100: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot4_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                          
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot4_cfg_reg[63:6],6'b000000};
                      end 
           7'b1000101: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot5_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                       
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot5_cfg_reg[63:6],6'b000000};
                      end 
           7'b1000110: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot6_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot6_cfg_reg[63:6],6'b000000};
                      end 
           7'b1000111: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot7_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot7_cfg_reg[63:6],6'b000000};
                      end 
           7'b1001000: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot8_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot8_cfg_reg[63:6],6'b000000};
                      end 
           7'b1001001: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot9_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot9_cfg_reg[63:6],6'b000000};
                      end 
           7'b1001010: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot10_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot10_cfg_reg[63:6],6'b000000};
                      end 
           7'b1001011: 
                      begin
                         cmdfifo[wrptr][WIDTH-1:WIDTH-6] <= thymesis_slot11_cfg_reg[5:0];
                         cmdfifo[wrptr][WIDTH-7:WIDTH-8] <= 2'b00;
                         cmdfifo[wrptr][WIDTH-11:WIDTH-14] <= 4'b0000;
                         cmdfifo[wrptr][WIDTH-10] <= cmd_in[WIDTH-9];
                         cmdfifo[wrptr][WIDTH-9] <= cmd_in[WIDTH-7] & cmd_in[WIDTH-14];                         
                         cmdfifo[wrptr][WIDTH-15:64] <= cmd_in[WIDTH-15:64];
                         cmdfifo[wrptr][63:0] <= cmd_in[63:0] + {thymesis_slot11_cfg_reg[63:6],6'b000000};
                      end
           default: ; // This is an invalid segment, hardware should have enough entries so that RA never ends up here.
        endcase
    



// Manage data output and valid. If valid is not set, drive 0's which should decode to NOP.
// Note: In order to enable 1 cmd presented each cycle in pipeline mode, cannot register cmd_out or cmd_out_valid

  assign cmd_out_valid =  cmdfifo_val[rdptr];
  assign cmd_out       = (cmdfifo_val[rdptr] == 1'b1) ? cmdfifo[rdptr] : {WIDTH{1'b0}};

  assign cmd_full = (cmdfifo_val == 8'hFF) ? 1'b1 : 1'b0; 

  // Check for overflow
  assign fifo_overflow   = (cmd_in_valid == 1'b1 && cmdfifo_val == 8'hFF) ? 1'b1 : 1'b0;


endmodule
