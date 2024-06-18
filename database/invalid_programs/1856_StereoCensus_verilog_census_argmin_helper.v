// This program was cloned from: https://github.com/slongfield/StereoCensus
// License: GNU General Public License v3.0

/*  Argmin helper is the recursive step of the argmin function.
 *
 *  Copyright (c) 2016, Stephen Longfield, stephenlongfield.com
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

`ifndef CENSUS_ARGMIN_HELPER_V_
`define CENSUS_ARGMIN_HELPER_V_

`include "argmin_stage.v"
`include "dff.v"

// Argmin helper is an individual 'layer' of the argmin tree.
// Argmin is made out of a pipelined tree of argmin helpers, each of which looks
// to see if the left or right value is smaller, and then forwards along the
// minimum value, along with the 'address' of the minimum for the section of the
// list it's scanned so far. For instance, for a length-6 list:
//
//          Out
//          _|_
//        0/   \1
//      __|__    |___
//    0/     \1      \0
//    X       X       X
//  0/ \1   0/ \1   0/ \1
//  0   1   2   3   4   5
//
// If element 3 is the minimum, then follow the path from the output back to
// 3 to get the address, 011, or 3. Note that when a layer isn't a multiple of
// two long, a pass-through stage is used.
module argmin_helper#(
    parameter WIDTH=1,
    parameter ADDR_WIDTH=1,
    parameter NUM_INP=2,
    parameter NUM_OUTP=1,
    parameter STAGE=1
  ) (
    input wire clk,
    input wire rst,

    input wire [WIDTH*NUM_INP-1:0] inp,
    input wire [ADDR_WIDTH*NUM_INP-1:0] inp_addr,

    output wire [WIDTH*NUM_OUTP-1:0] outp,
    output wire [ADDR_WIDTH*NUM_OUTP-1:0] outp_addr
  );

  localparam INP_WIDTH = WIDTH*NUM_INP;
  localparam INP_A_WIDTH = ADDR_WIDTH*NUM_INP;

  // Unpack the input words
  wire [WIDTH-1:0] inp_word[NUM_INP];
  wire [ADDR_WIDTH-1:0] inp_addr_word[NUM_INP];
  genvar i;
  generate
  for (i = 0; i < NUM_INP; i++) begin
    assign inp_word[i] = inp[(INP_WIDTH-WIDTH*i-1):(INP_WIDTH-WIDTH*(i+1))];
    assign inp_addr_word[i] = inp_addr[(INP_A_WIDTH-ADDR_WIDTH*i-1):
                                       (INP_A_WIDTH-ADDR_WIDTH*(i+1))];
  end
  endgenerate

  localparam OUTP_WIDTH = WIDTH*NUM_OUTP;
  localparam OUTP_A_WIDTH = ADDR_WIDTH*NUM_OUTP;

  // Pack the output words
  wire [WIDTH-1:0] outp_word[NUM_OUTP];
  wire [ADDR_WIDTH-1:0] outp_addr_word[NUM_OUTP];
  genvar j;
  generate
  for (j = 0; j < NUM_OUTP; j++) begin
    assign outp[(OUTP_WIDTH-WIDTH*j-1):(OUTP_WIDTH-WIDTH*(j+1))] = outp_word[j];
    assign outp_addr[(OUTP_A_WIDTH-ADDR_WIDTH*j-1):
                     (OUTP_A_WIDTH-ADDR_WIDTH*(j+1))] = outp_addr_word[j];
  end
  endgenerate

  // Create the different argmin stages.
  genvar k;
  generate
  for (k = 0; k < NUM_INP; k += 2) begin : node
    if (k+2 > NUM_INP) begin
      // This will be satisfied iff NUM_INP is odd, and we are at the end of the
      // list. If that's the case, generate pass-through flip-flops instead of
      // the argmin stage.
      dff#(.WIDTH(WIDTH)) val(clk, rst, inp_word[k], outp_word[k/2]);
      dff#(.WIDTH(ADDR_WIDTH)) addr(clk, rst, inp_addr_word[k], 
        outp_addr_word[k/2]);
    end else begin
      // Otherwise, generate an argmin_stage that reduces two inputs to a single
      // output.
      argmin_stage#(.WIDTH(WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .STAGE(STAGE))
        as(clk, rst, inp_word[k], inp_addr_word[k], inp_word[k+1], 
          inp_addr_word[k+1],
           outp_word[k/2], outp_addr_word[k/2]);
    end
  end
  endgenerate

endmodule

`endif // CENSUS_ARGMIN_HELPER_V_
