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
// -------------------------------------------------------------------
// Title    : lpc_errary.v
// Function : This file contains an array that collects and saves error information detected by the state machines.
//            Errors are loaded into an array when they occur, and read out by software via MMIO registers.
//            Software is notified a error information is present by issuing an interrupt to the host. The error
//            data saved is sized to be 2 MMIO registers wide. The array acts like a FIFO, with the oldest error
//            information presented to the MMIO registers first. After software reads the registers, a pulse is
//            returned to this array and the next oldest error information is presented (if it exists).
//
// Note: Simultaneous presention of errors is not supported. This is because MMIO states should execute only one at
//       a time, in a non-overlapped fashion with each other and memory accesses. While memory accesses can be pipelined, the expectation
//       is errors will be presented in only one state of the pipeline avoiding the case where multiple errors are presented
//       simultaneously to this logic in all cases. If it ever happens however, an error will be flagged.
//
// Format of saved information: (not required but strongly encouraged at least for Host->AFU commands to keep commonality)
//  [127:112] = Bits [15:0] of loadsrc, a 1 indicates which state machine stored the error vector
//  [111:108] = Bits [3:0] of response code sent in fail response
//  [    107] = OR of FLIT BDI bits sent during write (config_write, mmio write, wr_mem, pr_wr_mem)
//  [106: 88] = Reserved (19b)
//  [     87] = T bit (on config_write and config_read only)
//  [ 86: 84] = pL[2:0] (partial length)
//  [ 83: 82] = Reserved (2b)
//  [ 81: 80] = dL[1:0] (data length)
//  [ 79: 64] = CAPPTag[15:0] from command
//  [ 63:  0] = PA[63:0] from command
//

// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module lpc_errary (
    input          clock             // Clock - samples & launches data on rising edge
  , input          reset             // When 1, clear all cross reference logic to the 'unallocated' state

    // Interface from error sources to save their error vector information
  , input   [15:0] ery_loadsrc       // When bit is 1, load the error information from the corresponding source into the array
  , input  [127:0] ery_src15         // Vector of data to save from error source
  , input  [127:0] ery_src14
//, input  [127:0] ery_src13
//, input  [127:0] ery_src12         // NOTE: Comment out inputs which aren't needed yet to conserve resources, uncomment when used
//, input  [127:0] ery_src11
//, input  [127:0] ery_src10
  , input  [127:0] ery_src09
  , input  [127:0] ery_src08
  , input  [127:0] ery_src07
  , input  [127:0] ery_src06
  , input  [127:0] ery_src05
  , input  [127:0] ery_src04
  , input  [127:0] ery_src03
  , input  [127:0] ery_src02
  , input  [127:0] ery_src01
  , input  [127:0] ery_src00

    // Interface to MMIO registers
  , output [127:0] ery_data_out      // Contents of oldest error vector in the FIFO
  , output         ery_data_valid    // When 1, contents of ery_data_out are valid. This triggers an interrupt to the host.
  , input          ery_data_done     // Pulsed to 1 when the current valid error vector has been read by software

    // Error conditions
  , output         ery_simultaneous_load  // When 1, multiple loadsrc bits were on in the same cycle
  , output         ery_overflow           // When 1, error FIFO was full when another loadsrc arrived
  , output         ery_trigger_intrp      // When pulsed (0-1-0), send an interrupt to the host
) ;

// ==============================================================================================================================
// @@@  Latch inputs, then select current input into array
// ==============================================================================================================================
reg  [127:0] captured_src15;
reg  [127:0] captured_src14;
//reg  [127:0] captured_src13;
//reg  [127:0] captured_src12;
//reg  [127:0] captured_src11;
//reg  [127:0] captured_src10;
reg  [127:0] captured_src09;
reg  [127:0] captured_src08;
reg  [127:0] captured_src07;
reg  [127:0] captured_src06;
reg  [127:0] captured_src05;
reg  [127:0] captured_src04;
reg  [127:0] captured_src03;
reg  [127:0] captured_src02;
reg  [127:0] captured_src01;
reg  [127:0] captured_src00;
reg   [15:0] captured_loadsrc;

always @(posedge(clock))
  begin
    captured_src15 <= (ery_loadsrc[15] == 1'b1) ? ery_src15 : captured_src15;
    captured_src14 <= (ery_loadsrc[14] == 1'b1) ? ery_src14 : captured_src14;
//  captured_src13 <= (ery_loadsrc[13] == 1'b1) ? ery_src13 : captured_src13;
//  captured_src12 <= (ery_loadsrc[12] == 1'b1) ? ery_src12 : captured_src12;
//  captured_src11 <= (ery_loadsrc[11] == 1'b1) ? ery_src11 : captured_src11;
//  captured_src10 <= (ery_loadsrc[10] == 1'b1) ? ery_src10 : captured_src10;
    captured_src09 <= (ery_loadsrc[09] == 1'b1) ? ery_src09 : captured_src09;
    captured_src08 <= (ery_loadsrc[08] == 1'b1) ? ery_src08 : captured_src08;
    captured_src07 <= (ery_loadsrc[07] == 1'b1) ? ery_src07 : captured_src07;
    captured_src06 <= (ery_loadsrc[06] == 1'b1) ? ery_src06 : captured_src06;
    captured_src05 <= (ery_loadsrc[05] == 1'b1) ? ery_src05 : captured_src05;
    captured_src04 <= (ery_loadsrc[04] == 1'b1) ? ery_src04 : captured_src04;
    captured_src03 <= (ery_loadsrc[03] == 1'b1) ? ery_src03 : captured_src03;
    captured_src02 <= (ery_loadsrc[02] == 1'b1) ? ery_src02 : captured_src02;
    captured_src01 <= (ery_loadsrc[01] == 1'b1) ? ery_src01 : captured_src01;
    captured_src00 <= (ery_loadsrc[00] == 1'b1) ? ery_src00 : captured_src00;
    captured_loadsrc <= ery_loadsrc;    // Register this too to introduce clean timing boundary
  end

// On the next cycle, select the right source
wire [127:0] selected_src;
assign selected_src = ( {128{captured_loadsrc[15]}} & captured_src15 ) |
                      ( {128{captured_loadsrc[14]}} & captured_src14 ) |
                      //( {128{captured_loadsrc[13]}} & captured_src13 ) |
                      //( {128{captured_loadsrc[12]}} & captured_src12 ) |
                      //( {128{captured_loadsrc[11]}} & captured_src11 ) |
                      //( {128{captured_loadsrc[10]}} & captured_src10 ) |
                      ( {128{captured_loadsrc[09]}} & captured_src09 ) |
                      ( {128{captured_loadsrc[08]}} & captured_src08 ) |
                      ( {128{captured_loadsrc[07]}} & captured_src07 ) |
                      ( {128{captured_loadsrc[06]}} & captured_src06 ) |
                      ( {128{captured_loadsrc[05]}} & captured_src05 ) |
                      ( {128{captured_loadsrc[04]}} & captured_src04 ) |
                      ( {128{captured_loadsrc[03]}} & captured_src03 ) |
                      ( {128{captured_loadsrc[02]}} & captured_src02 ) |
                      ( {128{captured_loadsrc[01]}} & captured_src01 ) |
                      ( {128{captured_loadsrc[00]}} & captured_src00 ) ;
wire combined_loadsrc;
assign combined_loadsrc = (| captured_loadsrc);  // OR reduce load control vector to 1 bit, coincident with selected data

wire [3:0] loadsrc_1count;
assign loadsrc_1count = {3'b0,captured_loadsrc[15]} + {3'b0,captured_loadsrc[14]} + {3'b0,captured_loadsrc[13]} + {3'b0,captured_loadsrc[12]} +
                        {3'b0,captured_loadsrc[11]} + {3'b0,captured_loadsrc[10]} + {3'b0,captured_loadsrc[09]} + {3'b0,captured_loadsrc[08]} +
                        {3'b0,captured_loadsrc[07]} + {3'b0,captured_loadsrc[06]} + {3'b0,captured_loadsrc[05]} + {3'b0,captured_loadsrc[04]} +
                        {3'b0,captured_loadsrc[03]} + {3'b0,captured_loadsrc[02]} + {3'b0,captured_loadsrc[01]} + {3'b0,captured_loadsrc[00]} ;
assign ery_simultaneous_load = (loadsrc_1count > 4'b0001) ? 1'b1 : 1'b0;  // OK if no or just 1 bit is on


// ==============================================================================================================================
// @@@  Load selected source into array
// ==============================================================================================================================

reg [127:0] errary [7:0];   // 8 row array, 128 bits wide (make bigger if necessary)
reg   [2:0] wrptr;          // Write pointer into array, points to next free entry
reg   [2:0] rdptr;          // Read  pointer from array, points to oldest valid entry
reg   [7:0] errary_val;     // 1=associated entry is used, 0=associated entry is open and can be overwritten
// Manage write pointer
always @(posedge(clock))
  begin
    if (reset == 1'b1)
      wrptr <= 3'b000;                                      // Initialize to location 0
    else if (combined_loadsrc == 1'b1 && wrptr != 3'b111)
      wrptr <= wrptr + 3'b001;                              // Add an entry, so increment
    else if (combined_loadsrc == 1'b1 && wrptr == 3'b111)
      wrptr <= 3'b000;                                      // Add an entry, but wrap around to increment
    else
      wrptr <= wrptr;                                       // Hold value, nothing to load
  end

// Manage read pointer.
// Note about including '&& errary_val[rdptr] == 1'b1':
// If software 'reads ahead' on the ERR_INFO_LO MMIO register, meaning it tries to read all errors rather than just
// one per interrupt, then it may make sense to include this condition to suppress the advancement of rdptr when the
// location does not hold valid error information. However it also means the last valid error information would be
// read repeatedly since the rdptr would not advance past the last valid
// entry. To avoid confusion we advance the pointer on all reads of the register.
// If this condition is added in the future, be sure to consider the effect on errary_val.
always @(posedge(clock))
  begin
    if (reset == 1'b1)
      rdptr <= 3'b000;                                      // Initialize to location 0
    else if (ery_data_done == 1'b1 && rdptr != 3'b111)
      rdptr <= rdptr + 3'b001;                              // Move to next location, this one is complete
    else if (ery_data_done == 1'b1 && rdptr == 3'b111)
      rdptr <= 3'b000;                                      // Move to next location, but wrap around
    else
      rdptr <= rdptr;                                       // Hold value, no operation or operation is still in progress
  end

// Manage valid indicator
always @(posedge(clock))
  begin
    if (reset == 1'b1)
      errary_val <= 8'h0;                                                 // Initialize to all 0, all rows are free
    else if (combined_loadsrc == 1'b1 && ery_data_done == 1'b0)
      errary_val <= errary_val | (8'h01 << wrptr);                        // When loading, set wrptr bit to 1
    else if (combined_loadsrc == 1'b0 && ery_data_done == 1'b1)
      errary_val <= errary_val & ~(8'h01 << rdptr);                       // When done, set rdptr bit to 0
    else if (combined_loadsrc == 1'b1 && ery_data_done == 1'b1)
      errary_val <= (errary_val | (8'h01 << wrptr)) & ~(8'h01 << rdptr);  // Both set and clear a bit
    else
      errary_val <= errary_val;                                           // Hold value if neither bit is set
  end

// Manage row contents
// Note: Contents of array row will be 'X' until written the first time, but this should be OK.
always @(posedge(clock))
  errary[wrptr] <= (combined_loadsrc == 1'b1) ? selected_src : errary[wrptr];  // Load or hold array row

// Manage data output and valid. If valid is not set, drive 0's to MMIO register so code will read 0's if no error vector is present.
assign ery_data_valid =  errary_val[rdptr];
assign ery_data_out   = (errary_val[rdptr] == 1'b1) ? errary[rdptr] : 128'b0;

// Check for overflow
assign ery_overflow   = (combined_loadsrc == 1'b1 && errary_val == 8'hFF) ? 1'b1 : 1'b0;

// Generate the trigger to issue an interrupt.
assign ery_trigger_intrp = combined_loadsrc;    // Should naturally be a pulse


endmodule
