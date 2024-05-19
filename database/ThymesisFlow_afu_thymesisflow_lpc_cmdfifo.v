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
`timescale 1ns / 1ps
// Title    : lpc_cmdfifo.v
// Function : This file contains a command buffer FIFO to "pre-fetch" a number of commands from the TLX.
//            More importantly, the command at the head of the FIFO can be presented and held for any number
//            of cycles. This differs from the TLX interface where the command is only valid for one cycle
//            (when cmd_valid=1) whether the AFU is ready to receive it or not. The AFU's command dispatch
//            logic may not be able to begin servicing the command immediately, depending on the command type
//            and current state of response credits or pipelined operations in progress. Therefore this command
//            FIFO was added to provide this behavior. 
//
//            In addition, several commands are buffered up at once. This helps absorb latency cycles in the TLX,
//            measured from receipt of a cmd_credit to the presentation of the next command. It also allows for
//            a higher performing interface by enabling back to back operation of bulk memory operations if they 
//            are of the appropriate mix. In other words if all commands are 1 FLIT writes, there will likely be
//            a burst of commands started in the pipeline, then a break while the credit flow catches up. However
//            if the commands are a mix of reads and writes of various lengths, there will be natural pauses in
//            command stream while waiting for data and these pauses can be used to let the command FIFO fill up
//            again. 
//
//            The width of the FIFO is parameterized to make it easy to adjust to the number of TLX command
//            signals that are needed. The LPC does not support all OpenCAPI TL commands, so some of the TLX->AFU
//            interface signals are unused. Rather than capture them in the FIFO and discard them when dispatching,
//            resources can be conserved by ignoring them at the TLX interface. Thus the width of the FIFO is
//            variable to enable easy modifications as additional signals are used as functionality increases.
//
//            Note: The depth of the FIFO is fixed, but may need to be adjusted after performance feedback from 
//                  simulation is obtained.
//
// -------------------------------------------------------------------


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module lpc_cmdfifo #(parameter integer WIDTH = 158) (
    input              clock             // Clock - samples & launches data on rising edge
  , input              reset             // When 1, reset registers to an empty FIFO state
  , input              resync_credits    // Reset credit counts when 1, start capturing/sending new credits on 1->0 transition 
  , input              tlx_is_ready      // When 1, TLX is ready to exchange commands and responses

  // Input into FIFO
  , input  [WIDTH-1:0] cmd_in            // Vector of command information to save
  , input              cmd_in_valid      // When 1, load 'cmd_in' into the FIFO
  , output             cmd_credit_to_TLX // When 1, there is space in the FIFO for another command

  // Output from FIFO
  , input              cmd_dispatched    // When 1, increment read FIFO pointer to present the next FIFO entry
  , output [WIDTH-1:0] cmd_out           // Command information at head of FIFO
  , output             cmd_out_valid     // When 1, 'cmd_out' contains valid information
 
    // Error conditions
  , output             fifo_overflow     // When 1, FIFO was full when another 'cmd_valid' arrived
) ;


// ==============================================================================================================================
// @@@  Implement FIFO
// ==============================================================================================================================

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
      cmdfifo_val <= 8'h00;                                                  // Initialize to all 0, all rows are free
    else if (cmd_in_valid == 1'b1 && cmd_dispatched == 1'b0)  
      cmdfifo_val <= cmdfifo_val | (8'h01 << wrptr);                        // When loading, set wrptr bit to 1
    else if (cmd_in_valid == 1'b0 && cmd_dispatched == 1'b1)
      cmdfifo_val <= cmdfifo_val & ~(8'h01 << rdptr);                       // When done, set rdptr bit to 0 
    else if (cmd_in_valid == 1'b1 && cmd_dispatched == 1'b1)
      cmdfifo_val <= (cmdfifo_val | (8'h01 << wrptr)) & ~(8'h01 << rdptr);  // Both set and clear a bit 
    else
      cmdfifo_val <= cmdfifo_val;                                           // Hold value if neither bit is set
  end

// Manage row contents
always @(posedge(clock))
  if (cmd_in_valid) cmdfifo[wrptr] <= cmd_in;                           // Use code format recommended by Vivado

// Manage data output and valid. If valid is not set, drive 0's which should decode to NOP.
  assign cmd_out_valid =  cmdfifo_val[rdptr];
  assign cmd_out       = (cmdfifo_val[rdptr] == 1'b1) ? cmdfifo[rdptr] : {WIDTH{1'b0}};


// Check for overflow
assign fifo_overflow   = (cmd_in_valid == 1'b1 && cmdfifo_val == 8'hFF) ? 1'b1 : 1'b0;


// After resync_credits falls (1->0) delay sending credits for a number of cycles, giving time for the other side to
// get ready to receive them. There might be a difference in propagation cycles of resync_credits from CFG to the
// various destinations due to fan out or internal register buffering for timing closure.
reg [7:0] resync_credits_dly_q;   // Use delay chain to hold off sending credits
always @(posedge(clock))
  begin
    resync_credits_dly_q[7]   <= (reset | resync_credits);    // Hold off if got either reset or resync_credits signal
    resync_credits_dly_q[6:0] <= resync_credits_dly_q[7:1];
  end
wire   ok_to_send_credits;
assign ok_to_send_credits = ~(|resync_credits_dly_q);   // Set bit only when all bits in delay chain are 0 (| is OR Reduce operator)  

// Generate a pulse for each free entry in the FIFO, which is used as 'cmd_credit' back to the TLX
// a) At reset or resync_credits when the FIFO is empty, send 'number of FIFO entries' pulses as initial credits
// b) After initial credits have been given, pulse once each time a command is removed from the FIFO
// Special case: When command is removed while there are still initial credits being issued, don't lose a credit.
// NOTE: Because this logic manages initial cmd credits, set 'afu_tlx_cmd_initial_credit' to 0.
reg [3:0] initial_credits;
always @(posedge(clock))
  begin
    if (reset == 1'b1 || resync_credits == 1'b1)     
      initial_credits <= 4'b1000;                   // Initialize to number of FIFO entries
    else if (tlx_is_ready == 1'b0)
      initial_credits <= initial_credits;           // While TLX is still initializing, keep credits but don't send them
    else if (cmd_dispatched == 1'b1 && initial_credits > 4'b0000)
      initial_credits <= initial_credits;           // If cmd is removed from FIFO before initial credits are issued, hold off on decrementing.
    else if (initial_credits > 4'b0000 && ok_to_send_credits == 1'b1) 
      initial_credits <= initial_credits - 4'b0001; // Decrement 'number of FIFO entries' times, not counting cycles when cmd is removed from FIFO.
    else
      initial_credits <= initial_credits;           // Hold at 0 when it reaches 0. From here on, only removing cmd from FIFO issues credits.
  end

// To meet timing, register cmd_credit_to_TLX before sending to the TLX. A one cycle delay shouldn't hurt anything except increase the
// latency in the TLX->CFF->TLX command credit loop by a cycle.
reg cmd_credit_to_TLX_q;
always @(posedge(clock))
  if (reset == 1'b1 || resync_credits == 1'b1)   // Stop sending credits on either reset or resync_credits
    cmd_credit_to_TLX_q <= 1'b0;
  else
    cmd_credit_to_TLX_q <= (tlx_is_ready == 1'b1 && 
                            (cmd_dispatched == 1'b1 || (initial_credits > 4'b0000 && ok_to_send_credits == 1'b1))
                           ) ? 1'b1 : 1'b0;
assign cmd_credit_to_TLX = cmd_credit_to_TLX_q;

endmodule
