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
`timescale 1ps / 1ps
// -------------------------------------------------------------------
//
// Title    : cfg_cmdfifo.v
// Function : This file contains a command buffer FIFO to "pre-fetch" a number of 'config_write' or 'config_read' 
//            commands from the TLX. Extracting commands from the TLX as soon as possible helps prevent
//            'head of line' blocking, since at the DLX/TLX interface configuration and other TL commands
//            are in serial order - meaning one can block another. 
//
//            The command at the head of the FIFO is presented and held for any number of cycles. This differs 
//            from the TLX interface where the command is only valid for one cycle (when cmd_valid=1) whether 
//            the CFG sequencer is ready to receive it or not. The command sequencer may not be able to begin 
//            servicing the command immediately, depending on the command type and current state of response credits
//            or operation in progress. 
//
//            In addition, several commands are buffered up at once. This helps absorb latency cycles in the TLX,
//            measured from receipt of a cmd_credit to the presentation of the next command. 
//
//            The width of the FIFO is parameterized to make it easy to adjust to the number of TLX command
//            signals that are needed. 
//
//            Note: The depth of the FIFO is fixed, but may need to be adjusted after performance feedback from 
//                  simulation is obtained.
//
// -------------------------------------------------------------------
// Modification History :
//                               |Version    |     |Author   |Description of change
//                               |-----------|     |-------- |---------------------
  `define CFG_CMDFIFO_VERSION     09_May_2017   //            Initial creation
// -------------------------------------------------------------------


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module cfg_cmdfifo (
    input         clock                // Clock - samples & launches data on rising edge
  , input         reset                // When 1, reset registers to an empty FIFO state
  , input         tlx_is_ready         // When 1, TLX is ready to exchange commands and responses

  // Input into FIFO
  , input   [7:0] tlx_cfg_opcode
  , input  [31:0] tlx_cfg_pa           // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , input  [15:0] tlx_cfg_capptag
  , input         tlx_cfg_t
  , input   [2:0] tlx_cfg_pl
  , input         tlx_cfg_data_bdi
  , input  [31:0] tlx_cfg_data_bus
  , input         cmd_in_valid         // When 1, load 'cmd_in' into the FIFO
  , output        cmd_credit_to_TLX    // When 1, there is space in the FIFO for another command

  // Output from FIFO
  , input         cmd_dispatched       // When 1, increment read FIFO pointer to present the next FIFO entry
  , output  [7:0] cfg_cff_cmd_opcode 
  , output [31:0] cfg_cff_cmd_pa       // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , output [15:0] cfg_cff_cmd_capptag 
  , output        cfg_cff_cmd_t 
  , output  [2:0] cfg_cff_cmd_pl 
  , output        cfg_cff_data_bdi 
  , output [31:0] cfg_cff_data_bus 
  , output        cmd_out_valid        // When 1, 'cmd_out' contains valid information
 
    // Error conditions
  , output        fifo_overflow        // When 1, FIFO was full when another 'cfg_valid' arrived
) ;


// ==============================================================================================================================
// @@@  Implement FIFO
// ==============================================================================================================================

parameter integer WIDTH = 96;

//(* RAM_STYLE="DISTRIBUTED" *)   // CAUTION: DISTRIBUTED (LUT) arrays do not latch the output (Timing is worse with DISTRIBUTED RAM)  
reg  [WIDTH-1:0] cmdfifo [7:0];   // 8 row array
wire [WIDTH-1:0] cmd_in, cmd_out;

// Data arrives one cycle after cmd_in_valid and other command signals. Align them before entering the FIFO by delaying those arriving before data.
reg   [7:0] tlx_cfg_opcode_q;
reg  [31:0] tlx_cfg_pa_q;           
reg  [15:0] tlx_cfg_capptag_q;
reg         tlx_cfg_t_q;
reg   [2:0] tlx_cfg_pl_q;
reg         cmd_in_valid_q;        
always @(posedge(clock))
  begin
    tlx_cfg_opcode_q  <= tlx_cfg_opcode;
    tlx_cfg_pa_q      <= tlx_cfg_pa;         
    tlx_cfg_capptag_q <= tlx_cfg_capptag;
    tlx_cfg_t_q       <= tlx_cfg_t;
    tlx_cfg_pl_q      <= tlx_cfg_pl;
    cmd_in_valid_q    <= cmd_in_valid;
  end


reg       [2:0] wrptr;           // Write pointer into array, points to next free entry
reg       [2:0] rdptr;           // Read  pointer from array, points to oldest valid entry
reg       [7:0] cmdfifo_val;     // 1=associated entry is used, 0=associated entry is open and can be overwritten

// Manage write pointer
always @(posedge(clock))
  begin
    if (reset == 1'b1) 
      wrptr <= 3'b000;                                      // Initialize to location 0
    else if (cmd_in_valid_q == 1'b1 && wrptr != 3'b111)   
      wrptr <= wrptr + 3'b001;                              // Add an entry, so increment
    else if (cmd_in_valid_q == 1'b1 && wrptr == 3'b111)   
      wrptr <= 3'b000;                                      // Add an entry, but wrap around to increment
    else
      wrptr <= wrptr;                                       // Hold value, nothing to load
  end

// Manage read pointer. 
always @(posedge(clock))
  begin
    if (reset == 1'b1)
      rdptr <= 3'b000;                                      // Initialize to location 0
    else if (cmd_dispatched == 1'b1 && rdptr != 3'b111)
      rdptr <= rdptr + 3'b001;                              // Move to next location, this one is complete
    else if (cmd_dispatched == 1'b1 && rdptr == 3'b111)
      rdptr <= 3'b000;                                      // Move to next location, but wrap around
    else
      rdptr <= rdptr;                                       // Hold value, no operation or operation is still in progress
  end

// Manage valid indicator
always @(posedge(clock))
  begin 
    if (reset == 1'b1)
      cmdfifo_val <= 8'h00;                                                 // Initialize to all 0, all rows are free
    else if (cmd_in_valid_q == 1'b1 && cmd_dispatched == 1'b0)  
      cmdfifo_val <= cmdfifo_val | (8'h01 << wrptr);                        // When loading, set wrptr bit to 1
    else if (cmd_in_valid_q == 1'b0 && cmd_dispatched == 1'b1)
      cmdfifo_val <= cmdfifo_val & ~(8'h01 << rdptr);                       // When done, set rdptr bit to 0 
    else if (cmd_in_valid_q == 1'b1 && cmd_dispatched == 1'b1)
      cmdfifo_val <= (cmdfifo_val | (8'h01 << wrptr)) & ~(8'h01 << rdptr);  // Both set and clear a bit 
    else
      cmdfifo_val <= cmdfifo_val;                                           // Hold value if neither bit is set
  end


// Assemble FIFO inputs into a vector (order and pad signals to hex boundary to make simulation debug easier)
assign cmd_in = {                  
    tlx_cfg_opcode_q
  , tlx_cfg_pa_q
  , tlx_cfg_capptag_q
  , tlx_cfg_t_q
  , tlx_cfg_pl_q
  , 3'b000
  , tlx_cfg_data_bdi     // Note: Here is where command and data become cycle aligned.
  , tlx_cfg_data_bus
};

// Manage row contents
// Note: Contents of array row will be 'X' until written the first time, but this should be OK.
always @(posedge(clock))
  if (cmd_in_valid_q) cmdfifo[wrptr] <= cmd_in;                           // Use code format recommended by Vivado
// cmdfifo[wrptr] <= (cmd_in_valid_q == 1'b1) ? cmd_in : cmdfifo[wrptr];  // (Equivalent logically to above) Load or hold array row

// Manage data output and valid. If valid is not set, drive 0's which should decode to NOP.
assign cmd_out_valid =  cmdfifo_val[rdptr];
assign cmd_out       = (cmdfifo_val[rdptr] == 1'b1) ? cmdfifo[rdptr] : {WIDTH{1'b0}};

// Break out outputs from FIFO
wire [2:0] pad;
assign {  
    cfg_cff_cmd_opcode
  , cfg_cff_cmd_pa
  , cfg_cff_cmd_capptag
  , cfg_cff_cmd_t
  , cfg_cff_cmd_pl
  , pad
  , cfg_cff_data_bdi
  , cfg_cff_data_bus
} = cmd_out;

// Check for overflow
assign fifo_overflow = (cmd_in_valid_q == 1'b1 && cmdfifo_val == 8'hFF) ? 1'b1 : 1'b0;

// Generate a pulse for each free entry in the FIFO, which is used as 'cmd_credit' back to the TLX
// a) At reset when the FIFO is empty, send 'number of FIFO entries' pulses as initial credits
// b) After initial credits have been given, pulse once each time a command is removed from the FIFO
// Special case: When command is removed while there are still initial credits being issued, don't lose a credit.
// NOTE: Because this logic manages initial cmd credits, set 'cfg_tlx_initial_credit' to 0.
reg [3:0] initial_credits;
always @(posedge(clock))
  begin
    if (reset == 1'b1)     
      initial_credits <= 4'b1000;                   // Initialize to number of FIFO entries
//    initial_credits <= 4'b1001;                   // Initialize to number of FIFO entries (use this to force 'fifo_overflow' during testing)
    else if (tlx_is_ready == 1'b0)
      initial_credits <= initial_credits;           // While TLX is still initializing, keep credits but don't send them
    else if (cmd_dispatched == 1'b1 && initial_credits > 4'b0000)
      initial_credits <= initial_credits;           // If cmd is removed from FIFO before initial credits are issued, hold off on decrementing.
    else if (initial_credits > 4'b0000) 
      initial_credits <= initial_credits - 4'b0001; // Decrement 'number of FIFO entries' times, not counting cycles when cmd is removed from FIFO.
    else
      initial_credits <= initial_credits;           // Hold at 0 when it reaches 0. From here on, only removing cmd from FIFO issues credits.
  end

// To meet timing, register cmd_credit_to_TLX before sending to the TLX. A one cycle delay shouldn't hurt anything except increase the
// latency in the TLX->FIFO->TLX command credit loop by a cycle.
reg cmd_credit_to_TLX_q;
always @(posedge(clock))
  if (reset == 1'b1)
    cmd_credit_to_TLX_q <= 1'b0;
  else
    cmd_credit_to_TLX_q <= (tlx_is_ready == 1'b1 && (cmd_dispatched == 1'b1 || initial_credits != 4'b0000)) ? 1'b1 : 1'b0;
assign cmd_credit_to_TLX = cmd_credit_to_TLX_q;

endmodule
