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
// Title    : cfg_respfifo.v
// Function : This file contains a response buffer FIFO to buffer a number of config_* responses and response data FLITs
//            to the TLX. Having a response buffer helps improve the throughput of configuration commands, and indirectly
//            reduce head of line blocking of config vs. non-config commands out of the TLX, because config_* commands
//            can be executed in parallel with inserting responses into the TLX to host FLIT stream.
//
// -------------------------------------------------------------------
// Modification History :
//                               |Version    |     |Author   |Description of change
//                               |-----------|     |-------- |---------------------
  `define CFG_RESPFIFO_VERSION    12_Sep_2017   //            Change items reproted by HAL check
// -------------------------------------------------------------------


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module cfg_respfifo (
    input         clock                   // Clock - samples & launches data on rising edge
  , input         reset                   // When 1, reset registers to an empty FIFO state

    // Input into FIFO
  , input   [7:0] cfg_rff_resp_opcode
  , input   [3:0] cfg_rff_resp_code
//, input   [1:0] cfg_rff_resp_dl
//, input   [1:0] cfg_rff_resp_dp
  , input  [15:0] cfg_rff_resp_capptag
  , input   [3:0] cfg_rff_rdata_offset
  , input         cfg_rff_rdata_bdi
  , input  [31:0] cfg_rff_rdata_bus
  , input         cfg_rff_resp_in_valid   // When 1, load 'resp_in' into the FIFO
  , output  [3:0] resp_buffers_available  // Number of buffer slots available (1 buffer holds response and data FLIT (if used))

    // Output from FIFO
  , output  [7:0] cfg_tlx_resp_opcode
//, output  [1:0] cfg_tlx_resp_dl
  , output [15:0] cfg_tlx_resp_capptag
//, output  [1:0] cfg_tlx_resp_dp
  , output  [3:0] cfg_tlx_resp_code
  , output  [3:0] cfg_tlx_rdata_offset
  , output [31:0] cfg_tlx_rdata_bus
  , output        cfg_tlx_rdata_bdi

     // Valid-Ack handshake with TLX
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg_tlx_resp_valid      // Tell TLX when a response is ready for it to send
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         tlx_cfg_resp_ack        // TLX indicates current valid response has been sent

     // Error conditions
  , output        fifo_overflow           // When 1, error FIFO was full when another 'resp_valid' arrived
) ;


// ==============================================================================================================================
// @@@  Implement FIFO
// ==============================================================================================================================

parameter integer WIDTH = 68;   // Increase to 72 if include dL and dP

//(* RAM_STYLE="DISTRIBUTED" *)     // CAUTION: DISTRIBUTED (LUT) arrays do not latch the output (3/24/17 Timing is worse with DISTRIBUTED RAM) 
reg  [WIDTH-1:0] respfifo [7:0];    // 8 row array
wire [WIDTH-1:0] resp_in, resp_out;

reg  [2:0] wrptr;             // Write pointer into array, points to next free entry
reg  [2:0] rdptr;             // Read  pointer from array, points to oldest valid entry
reg  [7:0] respfifo_val;      // 1=associated entry is used, 0=associated entry is open and can be overwritten
reg        resp_sent;         // When 1, remove response from RESP FIFO

wire       resp_in_valid;     // Shorten name for readability
assign resp_in_valid = cfg_rff_resp_in_valid;

// Manage write pointer
always @(posedge(clock))
  begin
    if (reset == 1'b1) 
      wrptr <= 3'b000;                                      // Initialize to location 0
    else if (resp_in_valid == 1'b1 && wrptr != 3'b111)   
      wrptr <= wrptr + 3'b001;                              // Add an entry, so increment
    else if (resp_in_valid == 1'b1 && wrptr == 3'b111)   
      wrptr <= 3'b000;                                      // Add an entry, but wrap around to increment
    else
      wrptr <= wrptr;                                       // Hold value, nothing to load
  end

// Manage read pointer 
always @(posedge(clock))
  begin
    if (reset == 1'b1)
      rdptr <= 3'b000;                                      // Initialize to location 0
    else if (resp_sent == 1'b1 && rdptr != 3'b111)
      rdptr <= rdptr + 3'b001;                              // Move to next location, this one is complete
    else if (resp_sent == 1'b1 && rdptr == 3'b111)
      rdptr <= 3'b000;                                      // Move to next location, but wrap around
    else
      rdptr <= rdptr;                                       // Hold value, no operation or operation is still in progress
  end

// Manage valid indicator
always @(posedge(clock))
  begin 
    if (reset == 1'b1)  
      respfifo_val <= 8'h00;                                                     // Initialize to all 0, all rows are free
    else if (resp_in_valid == 1'b1 && resp_sent == 1'b0)  
      respfifo_val <= respfifo_val | (8'h01 << wrptr);                           // When loading, set wrptr bit to 1
    else if (resp_in_valid == 1'b0 && resp_sent == 1'b1)
      respfifo_val <= respfifo_val & ~(8'h01 << rdptr);                          // When done, set rdptr bit to 0 
    else if (resp_in_valid == 1'b1 && resp_sent == 1'b1)
      respfifo_val <= (respfifo_val | (8'h01 << wrptr)) & ~(8'h01 << rdptr);     // Both set and clear a bit 
    else
      respfifo_val <= respfifo_val;                                              // Hold value if neither bit is set
  end

// Assemble signals into FIFO (order and pad signals to hex boundary to make simulation debug easier)
assign resp_in = {            
    cfg_rff_resp_opcode
  , cfg_rff_resp_code
//, cfg_rff_resp_dl
//, cfg_rff_resp_dp
  , cfg_rff_resp_capptag
  , cfg_rff_rdata_offset
  , 3'b000
  , cfg_rff_rdata_bdi
  , cfg_rff_rdata_bus
};

// Manage row contents
// Note: Contents of array row will be 'X' until written the first time, but this should be OK.
always @(posedge(clock)) begin
  if (resp_in_valid) respfifo[wrptr] <= resp_in;   // Use code format recommended by Vivado
end
//  respfifo[wrptr] <= (resp_in_valid == 1'b1) ? resp_in : respfifo[wrptr];  // Load or hold array row

// Manage data output and valid. If valid is not set, drive 0's which should decode to NOP.
// Note: DISTRIBUTED arrays do not latch the output.
// Provide data directly out of array (if timing permits) to align with changing of rdptr with respect to resp_sent
assign resp_out = (respfifo_val[rdptr] == 1'b1) ? respfifo[rdptr] : {WIDTH{1'b0}};  

// Break out signals from FIFO
wire  [2:0] pad;
assign {
    cfg_tlx_resp_opcode
  , cfg_tlx_resp_code
//, cfg_tlx_resp_dl
//, cfg_tlx_resp_dp
  , cfg_tlx_resp_capptag
  , cfg_tlx_rdata_offset
  , pad
  , cfg_tlx_rdata_bdi
  , cfg_tlx_rdata_bus
} = resp_out;

// Provide data directly out of array (if timing permits) to align with changing of rdptr with respect to resp_sent
wire   resp_out_valid;
assign resp_out_valid = respfifo_val[rdptr];  

// Check for overflow
assign fifo_overflow   = (resp_in_valid == 1'b1 && respfifo_val == 8'hFF) ? 1'b1 : 1'b0;

// Determine number of available buffers
// Note: wrptr points to the next location to write (one past the last written entry)
//       rdptr points to the next valid location
reg [3:0] resp_buffers_used;
always @(*)   // Combinational
  if (respfifo_val == 8'h00)                  // Empty FIFO
    resp_buffers_used = 4'b0000; 
  else if (wrptr > rdptr)                     // Pointers are not wrapped with respect to each other
    resp_buffers_used = {1'b0,wrptr} - {1'b0,rdptr};      // Bit extension circumvents IBM 'tvc' tool warnings 
  else if (wrptr < rdptr)                     // Write pointer wrapped around
    resp_buffers_used = (4'b1000 + {1'b0,wrptr}) - {1'b0,rdptr};   
  else // wrptr == rdptr                      // Pointers are equal, but FIFO is not empty so it must be full
    resp_buffers_used = 4'b1000; 
assign resp_buffers_available = 4'b1000 - resp_buffers_used;


// ==============================================================================================================================
// @@@  Valid-Ack handshake with TLX
// ==============================================================================================================================

// Handshake sequencer with TLX
reg [1:0] SM_CFG_RFF;
parameter SM_CFG_RFF_IDLE           = 2'b00;
parameter SM_CFG_RFF_WAIT_FOR_ACK_1 = 2'b01;
parameter SM_CFG_RFF_WAIT_FOR_ACK_0 = 2'b10;
parameter SM_CFG_RFF_ERROR          = 2'b11;

reg    resp_valid;
assign cfg_tlx_resp_valid = resp_valid;   // Connect internal valid to output port

// Determine behavior in each state
always @(posedge(clock))
  case (SM_CFG_RFF)

    SM_CFG_RFF_IDLE:            
      if (resp_out_valid == 1'b1)            // There is a valid response to send
        begin
          resp_valid <= 1'b1;                // Raise response valid to TLX
          resp_sent  <= 1'b0;                // Response has not been received yet
        end
      else                                   // Waiting for a response to send
        begin
          resp_valid <= 1'b0;                // Set register bits to default (inactive) values
          resp_sent  <= 1'b0;
        end

    SM_CFG_RFF_WAIT_FOR_ACK_1:
      if (tlx_cfg_resp_ack == 1'b1)          // Received ACK from TLX
        begin
          resp_valid <= 1'b0;                // Drop response valid to TLX
          resp_sent  <= 1'b1;                // Indicate response has been received, tell RESP FIFO to present next response (if there is one)
        end
      else                                   // Waiting for ACK to become active
        begin
          resp_valid <= resp_valid;          // Hold previous values     
          resp_sent  <= resp_sent;
        end

    SM_CFG_RFF_WAIT_FOR_ACK_0:
      if (tlx_cfg_resp_ack == 1'b0)          // Complete the handshake by waiting for ACK return to 0
        begin
          resp_valid <= 1'b0;                // Keep valid inactive until the handshake sequencer is complete
          resp_sent  <= 1'b0;                // Make 'resp_sent' a pulse to the RESP FIFO by clearing it 1 cycle after it was raised
        end
      else                                   // Waiting for ACK to go inactive
        begin
          resp_valid <= resp_valid;          // Hold previous value   
          resp_sent  <= 1'b0;                // Make 'resp_sent' a pulse to the RESP FIFO by clearing it 1 cycle after it was raised
        end

    SM_CFG_RFF_ERROR:
      begin
        resp_valid <= 1'b0;                  // Set to inactive values
        resp_sent  <= 1'b0;
      end
  endcase

// Determine next state
always @(posedge(clock))
  if (reset == 1'b1)                             SM_CFG_RFF <= SM_CFG_RFF_IDLE;   
  else 
    case (SM_CFG_RFF)
      SM_CFG_RFF_IDLE:            
          if (resp_out_valid == 1'b1)            SM_CFG_RFF <= SM_CFG_RFF_WAIT_FOR_ACK_1;
          else                                   SM_CFG_RFF <= SM_CFG_RFF_IDLE;
      SM_CFG_RFF_WAIT_FOR_ACK_1:
          if (tlx_cfg_resp_ack == 1'b1)          SM_CFG_RFF <= SM_CFG_RFF_WAIT_FOR_ACK_0;
          else                                   SM_CFG_RFF <= SM_CFG_RFF_WAIT_FOR_ACK_1;
      SM_CFG_RFF_WAIT_FOR_ACK_0:
          if (tlx_cfg_resp_ack == 1'b0)          SM_CFG_RFF <= SM_CFG_RFF_IDLE;
          else                                   SM_CFG_RFF <= SM_CFG_RFF_WAIT_FOR_ACK_0;
      SM_CFG_RFF_ERROR:
                                                 SM_CFG_RFF <= SM_CFG_RFF_ERROR;
      default:
                                                 SM_CFG_RFF <= SM_CFG_RFF_ERROR;
    endcase

endmodule
