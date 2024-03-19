///////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2010-2020 by Michael A. Morris, dba M. A. Morris & Associates
//
//  All rights reserved. The source code contained herein is publicly released
//  under the terms and conditions of the GNU Lesser Public License. No part of
//  this source code may be reproduced or transmitted in any form or by any
//  means, electronic or mechanical, including photocopying, recording, or any
//  information storage and retrieval system in violation of the license under
//  which the source code is released.
//
//  The souce code contained herein is free; it may be redistributed and/or 
//  modified in accordance with the terms of the GNU Lesser General Public
//  License as published by the Free Software Foundation; either version 2.1 of
//  the GNU Lesser General Public License, or any later version.
//
//  The souce code contained herein is freely released WITHOUT ANY WARRANTY;
//  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
//  PARTICULAR PURPOSE. (Refer to the GNU Lesser General Public License for
//  more details.)
//
//  A copy of the GNU Lesser General Public License should have been received
//  along with the source code contained herein; if not, a copy can be obtained
//  by writing to:
//
//  Free Software Foundation, Inc.
//  51 Franklin Street, Fifth Floor
//  Boston, MA  02110-1301 USA
//
//  Further, no use of this source code is permitted in any form or means
//  without inclusion of this banner prominently in any derived works. 
//
//  Michael A. Morris
//  Huntsville, AL
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:         M. A. Morris & Associates
// Engineer:        Michael A. Morris
// 
// Create Date:     12:59:58 10/02/2010 
// Design Name:     Fast 4-bit Booth Multiplier 
// Module Name:     Booth_Multiplier_4xB.v
// Project Name:    Booth_Multiplier
// Target Devices:  Artix-7 FPGA
// Tool versions:   Xilinx ISE 14.7i
//
// Description:
//
//  This module implements a parameterized multiplier which uses a Modified
//  Booth algorithm for its implementation. The implementation is based on the
//  algorithm described in "Computer Organization", Hamacher et al, McGraw-
//  Hill Book Company, New York, NY, 1978, ISBN: 0-07-025681-0.
//
//  Compared to the standard, 1-bit at a time Booth algorithm, this modified
//  Booth multiplier algorithm shifts the multiplier 4 bits at a time. Thus,
//  this algorithm will compute a 2's complement product four times as fast as
//  the base algorithm.
//
//  This particular module attempts to optimize the synthesis and implementation
//  results relative to those of the Booth_Multiplier_4x.v module. Examination
//  of the synthesis results of that module indicate that 16 20-bit adders and
//  16 20-bit subtractors are needed to implement the partial products. This
//  module uses a different approach to eliminate the large number of adders
//  and subtractors such that only two cascaded adders are required; When sub-
//  traction is required, complementing the input and adding a carry into the
//  sum is how the subtractions are implemented. 32:1 multiplexers are used to
//  evaluated the Booth recoding value and determine the value and operation to
//  be performed by the two cascaded adders.
//
// Dependencies: 
//
// Revision: 
//
//  0.01    10J02   MAM     File Created
//
//  1.0     12I02   MAM     Changed the implementation of the base module to
//                          reduced the number of inferred adders and reduce
//                          the number of multiplexers required.
//
//  2.0     20I12   MAM     Modified the multiplier to support both signed and
//                          unsigned multiplication. To support unsigned multi-
//                          plication, and additional adder is required. The un-
//                          signed multiplication select input was added to the
//                          Booth recoding tables, i.e. the tables were expanded
//                          from 32 to 64 locations. A third table was added to
//                          support the third adder. The Booth recoding table 
//                          was adjusted so that one column supports +16 and ±8,
//                          another column only supports ±4, and the last column
//                          supports ±1 and ±2.
//
// Additional Comments:
//
//  The basic operations follow those of the standard Booth multiplier except
//  that the transitions are being tracked across 4 bits plus the guard bit.
//  The result is that the operations required are 0, ±1, ±2, ±3, ±4, ±5, ±6,
//  ±7, and ±8 times the multiplicand (M). However, it is possible to reduce 
//  the number of partial products required to implement the multiplication to
//  two. That is, ±3, ±5, ±6, and ±7 can be written in terms of combinations of
//  ±1, ±2, ±4, and ±8. For example, 3M = (2M + 1M), 5M = (4M + M), 6M = (4M
//  + 2M), and 7M = (8M - M). Thus, the following 32 entry table defines the
//  operations required for generating the partial products through each pass
//  of the algorithm over the multiplier:
//  
//  Prod[4:0]       Operation
//    00000      Prod <= (Prod + 0*M + 0*M) >> 4;
//    00001      Prod <= (Prod + 0*M + 1*M) >> 4;
//    00010      Prod <= (Prod + 0*M + 1*M) >> 4;
//    00011      Prod <= (Prod + 2*M + 0*M) >> 4;
//    00100      Prod <= (Prod + 2*M + 0*M) >> 4;
//    00101      Prod <= (Prod + 2*M + 1*M) >> 4;
//    00110      Prod <= (Prod + 2*M + 1*M) >> 4;
//    00111      Prod <= (Prod + 4*M + 0*M) >> 4;
//    01000      Prod <= (Prod + 4*M + 0*M) >> 4;
//    01001      Prod <= (Prod + 4*M + 1*M) >> 4;
//    01010      Prod <= (Prod + 4*M + 1*M) >> 4;
//    01011      Prod <= (Prod + 4*M + 2*M) >> 4;
//    01100      Prod <= (Prod + 4*M + 2*M) >> 4;
//    01101      Prod <= (Prod + 8*M - 1*M) >> 4;
//    01110      Prod <= (Prod + 8*M - 1*M) >> 4;
//    01111      Prod <= (Prod + 8*M + 0*M) >> 4;
//    10000      Prod <= (Prod - 8*M - 0*M) >> 4;
//    10001      Prod <= (Prod - 8*M + 1*M) >> 4;
//    10010      Prod <= (Prod - 8*M + 1*M) >> 4;
//    10011      Prod <= (Prod - 4*M - 2*M) >> 4;
//    10100      Prod <= (Prod - 4*M - 2*M) >> 4;
//    10101      Prod <= (Prod - 4*M - 1*M) >> 4;
//    10110      Prod <= (Prod - 4*M - 1*M) >> 4;
//    10111      Prod <= (Prod - 4*M - 0*M) >> 4;
//    11000      Prod <= (Prod - 4*M - 0*M) >> 4;
//    11001      Prod <= (Prod - 2*M - 1*M) >> 4;
//    11010      Prod <= (Prod - 2*M - 1*M) >> 4;
//    11011      Prod <= (Prod - 2*M - 0*M) >> 4;
//    11100      Prod <= (Prod - 2*M - 0*M) >> 4;
//    11101      Prod <= (Prod - 0*M - 1*M) >> 4;
//    11110      Prod <= (Prod - 0*M - 1*M) >> 4;
//    11111      Prod <= (Prod - 0*M - 0*M) >> 4;
//
//  One approach to implementing the recoding table is to use a 32:1 multiplexer
//  and simply write out the necessary operations. This is the approach used in
//  the first version of the 4 bits at a time Booth multiplier. The problem is
//  that the implementation of the preceding recoding table in a first prin-
//  ciples manner results in a large number of adders and subtractors being
//  synthesized. Apparently, the structure and character of the RTL code is such
//  that the synthesizer is unable to use multiplexers to determine the operands
//  of the two adders which are required.
//
//  Examining the previous recoding table shows that seven multiples of the
//  multiplicand (M) are represented in the first multiplicand column, 0x, ±2x,
//  ±4x, and ±8x, and five are represented in the second multiplicand column,
//  0x, ±1x, and ±2. The synthesizer is able to identify the need for adders and
//  subractors, but is unable to morph the structure from one embedded in a 32:1
//  multiplexer into one where an 8:1 multiplexer feeds the first multiplicand
//  products into one adder, and another 8:1 multiplexer feeds the second multi-
//  plicand product into another adder cascaded with the first.
//
//  A review of the corresponding synthesis report shows that the synthesizer
//  extracted 8 adders and 8 subtractors. Refering to the 32 line recoding table
//  above, shows that there are 8 diffent combinations of the multiplicand pro-
//  ducts that must be added/subtracted to the partial product, Prod, to deter-
//  mine the final product. The resulting implementation is correct, as deter-
//  mined by its testbench, but the implementation certainly uses more resources
//  than would be expected when increasing the number of bits processed per
//  stage/iteration from 2 to 4. A natural assumption is that the resources uti-
//  lized would increase by a factor close to 2 as the number of bits processed
//  is increased by powers of 2: 1, 2, 4, etc.
//
//  It is now clear that the synthesizer is unable to transform the multiplexed
//  adder structure inherent in the current specification into a structure which
//  is composed of multiplexers followed by two cascaded adders. Therefore, that
//  simpler structure must be explcitly specified in this module's RTL. In order
//  to minimize the multiplexers, the recoding table needs to be modified from
//  its current definition to an equivalent definition that can be implemented
//  using just two multiplicand products. The following recoding table can be
//  compared to the one above to see the adjustments made. In essence, the first
//  multiplicand column allows only five multiplicand product values, 0M, ±4M,
//  and ±8M, and the second multiplicand column also allows only five values,
//  0M, ±1M, and ±2M.
//  
//  Prod[4:0]       Operation
//    00000      Prod <= (Prod + 0*M + 0*M) >> 4;
//    00001      Prod <= (Prod + 0*M + 1*M) >> 4;
//    00010      Prod <= (Prod + 0*M + 1*M) >> 4;
//    00011      Prod <= (Prod + 0*M + 2*M) >> 4;
//    00100      Prod <= (Prod + 0*M + 2*M) >> 4;
//    00101      Prod <= (Prod + 4*M - 1*M) >> 4;
//    00110      Prod <= (Prod + 4*M - 1*M) >> 4;
//    00111      Prod <= (Prod + 4*M + 0*M) >> 4;
//    01000      Prod <= (Prod + 4*M + 0*M) >> 4;
//    01001      Prod <= (Prod + 4*M + 1*M) >> 4;
//    01010      Prod <= (Prod + 4*M + 1*M) >> 4;
//    01011      Prod <= (Prod + 4*M + 2*M) >> 4;
//    01100      Prod <= (Prod + 4*M + 2*M) >> 4;
//    01101      Prod <= (Prod + 8*M - 1*M) >> 4
//    01110      Prod <= (Prod + 8*M - 1*M) >> 4;
//    01111      Prod <= (Prod + 8*M + 0*M) >> 4;
//    10000      Prod <= (Prod - 8*M - 0*M) >> 4;
//    10001      Prod <= (Prod - 8*M + 1*M) >> 4;
//    10010      Prod <= (Prod - 8*M + 1*M) >> 4;
//    10011      Prod <= (Prod - 4*M - 2*M) >> 4;
//    10100      Prod <= (Prod - 4*M - 2*M) >> 4;
//    10101      Prod <= (Prod - 4*M - 1*M) >> 4;
//    10110      Prod <= (Prod - 4*M - 1*M) >> 4;
//    10111      Prod <= (Prod - 4*M - 0*M) >> 4;
//    11000      Prod <= (Prod - 4*M - 0*M) >> 4;
//    11001      Prod <= (Prod - 4*M + 1*M) >> 4;
//    11010      Prod <= (Prod - 4*M + 1*M) >> 4;
//    11011      Prod <= (Prod - 0*M - 2*M) >> 4;
//    11100      Prod <= (Prod - 0*M - 2*M) >> 4;
//    11101      Prod <= (Prod - 0*M - 1*M) >> 4;
//    11110      Prod <= (Prod - 0*M - 1*M) >> 4;
//    11111      Prod <= (Prod - 0*M - 0*M) >> 4;
//
//  The zero terms and the subtractions will be implemented using logic: bus AND
//  for 0, and bus XOR and carry input for subtraction, i.e. 2sC add. With this
//  additional reduction of operands, the multiplexers at the input to the adder
//  tree only multiplex two values each, {4M, 8M} or {1M, 2M}, respectively. The
//  operations required of the multiplexer and adder for each multiplicand
//  column can be defined by the triple: {PnM, M_Sel, En}. En is the control for
//  the bus AND which forms 0*M. M_Sel is the control for the multiplexer that
//  selects {4M, 8M} or {1M, 2M}, respectively. PnM is the input to the bus XOR
//  and carry input of the adder, and if 0 an addition is performed with the
//  operand at the output of the bus AND, and if 1, the adder is presented with
//  the complement of that operand plus an input carry. The bus AND can be built
//  explicitly after the multiplexer, or it can be included as the default case
//  of the multiplexer itself.
//
//  In either case, the triples {PnM, M_Sel, En} can be constructed using a 32x6
//  ROM. The first triple refers to the control signals for the first multipli-
//  cand column and the second refers to the control signals for the second
//  multiplicand column. To force the synthesizer to infer a ROM, a fully defin-
//  ed case statement of 32 entries for each column is required:
//
//  For the first column - B
//
//  case(Booth)
//      5'b00000 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod + 0*M + 0*M) >> 4;
//      5'b00001 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod + 0*M + 1*M) >> 4;
//      5'b00010 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod + 0*M + 1*M) >> 4;
//      5'b00011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod + 0*M + 2*M) >> 4;
//      5'b00100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod + 0*M + 2*M) >> 4;
//      5'b00101 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M - 1*M) >> 4;
//      5'b00110 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M - 1*M) >> 4;
//      5'b00111 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M + 0*M) >> 4;
//      5'b01000 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M + 0*M) >> 4;
//      5'b01001 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M + 1*M) >> 4;
//      5'b01010 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M + 1*M) >> 4;
//      5'b01011 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M + 2*M) >> 4;
//      5'b01100 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (Prod + 4*M + 2*M) >> 4;
//      5'b01101 : {MnP_B, M_Sel_B, En_B} <= 3'b011; // (Prod + 8*M - 1*M) >> 4
//      5'b01110 : {MnP_B, M_Sel_B, En_B} <= 3'b011; // (Prod + 8*M - 1*M) >> 4;
//      5'b01111 : {MnP_B, M_Sel_B, En_B} <= 3'b011; // (Prod + 8*M + 0*M) >> 4;
//      5'b10000 : {MnP_B, M_Sel_B, En_B} <= 3'b111; // (Prod - 8*M - 0*M) >> 4;
//      5'b10001 : {MnP_B, M_Sel_B, En_B} <= 3'b111; // (Prod - 8*M + 1*M) >> 4;
//      5'b10010 : {MnP_B, M_Sel_B, En_B} <= 3'b111; // (Prod - 8*M + 1*M) >> 4;
//      5'b10011 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M - 2*M) >> 4;
//      5'b10100 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M - 2*M) >> 4;
//      5'b10101 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M - 1*M) >> 4;
//      5'b10110 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M - 1*M) >> 4;
//      5'b10111 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M - 0*M) >> 4;
//      5'b11000 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M - 0*M) >> 4;
//      5'b11001 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M + 1*M) >> 4;
//      5'b11010 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (Prod - 4*M + 1*M) >> 4;
//      5'b11011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod - 0*M - 2*M) >> 4;
//      5'b11100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod - 0*M - 2*M) >> 4;
//      5'b11101 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod - 0*M - 1*M) >> 4;
//      5'b11110 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod - 0*M - 1*M) >> 4;
//      5'b11111 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod - 0*M - 0*M) >> 4;
//      default  : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (Prod - 0*M - 0*M) >> 4;
//  endcase
//  
//  For the second column - C
//
//  case(Booth)
//      5'b00000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod + 0*M + 0*M) >> 4;
//      5'b00001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod + 0*M + 1*M) >> 4;
//      5'b00010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod + 0*M + 1*M) >> 4;
//      5'b00011 : {MnP_C, M_Sel_C, En_C} <= 3'b011; // (Prod + 0*M + 2*M) >> 4;
//      5'b00100 : {MnP_C, M_Sel_C, En_C} <= 3'b011; // (Prod + 0*M + 2*M) >> 4;
//      5'b00101 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod + 4*M - 1*M) >> 4;
//      5'b00110 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod + 4*M - 1*M) >> 4;
//      5'b00111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod + 4*M + 0*M) >> 4;
//      5'b01000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod + 4*M + 0*M) >> 4;
//      5'b01001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod + 4*M + 1*M) >> 4;
//      5'b01010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod + 4*M + 1*M) >> 4;
//      5'b01011 : {MnP_C, M_Sel_C, En_C} <= 3'b011; // (Prod + 4*M + 2*M) >> 4;
//      5'b01100 : {MnP_C, M_Sel_C, En_C} <= 3'b011; // (Prod + 4*M + 2*M) >> 4;
//      5'b01101 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod + 8*M - 1*M) >> 4
//      5'b01110 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod + 8*M - 1*M) >> 4;
//      5'b01111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod + 8*M + 0*M) >> 4;
//      5'b10000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod - 8*M - 0*M) >> 4;
//      5'b10001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod - 8*M + 1*M) >> 4;
//      5'b10010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod - 8*M + 1*M) >> 4;
//      5'b10011 : {MnP_C, M_Sel_C, En_C} <= 3'b111; // (Prod - 4*M - 2*M) >> 4;
//      5'b10100 : {MnP_C, M_Sel_C, En_C} <= 3'b111; // (Prod - 4*M - 2*M) >> 4;
//      5'b10101 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod - 4*M - 1*M) >> 4;
//      5'b10110 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod - 4*M - 1*M) >> 4;
//      5'b10111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod - 4*M - 0*M) >> 4;
//      5'b11000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod - 4*M - 0*M) >> 4;
//      5'b11001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod - 4*M + 1*M) >> 4;
//      5'b11010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (Prod - 4*M + 1*M) >> 4;
//      5'b11011 : {MnP_C, M_Sel_C, En_C} <= 3'b111; // (Prod - 0*M - 2*M) >> 4;
//      5'b11100 : {MnP_C, M_Sel_C, En_C} <= 3'b111; // (Prod - 0*M - 2*M) >> 4;
//      5'b11101 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod - 0*M - 1*M) >> 4;
//      5'b11110 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (Prod - 0*M - 1*M) >> 4;
//      5'b11111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod - 0*M - 0*M) >> 4;
//      default  : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (Prod - 0*M - 0*M) >> 4;
//  endcase
//  
////////////////////////////////////////////////////////////////////////////////

module Booth_Multiplier_4xB #(
    parameter N = 16                // Width = N: multiplicand & multiplier
)(
    input   Rst,                    // Reset
    input   Clk,                    // Clock
    
    input   Ld,                     // Load Registers and Start Multiplier
    input   Unsigned,               // Unsigned operands
    
    input   [(N - 1):0] M,          // Multiplicand
    input   [(N - 1):0] R,          // Multiplier
    output  reg Valid,              // Product Valid
    output  reg [((2*N) - 1):0] P   // Product <= M * R
);

////////////////////////////////////////////////////////////////////////////////
//
//  Local Parameters
//

localparam pNumCycles   = ((N + 3) / 4);    // No. cycles product

////////////////////////////////////////////////////////////////////////////////
//
//  Declarations
//

reg     [4:0] Cntr;                     // Operation Counter
reg     [4:0] Booth;                    // Booth Recoding Field
reg     Guard;                          // Shift Bit for Booth Recoding
reg     [(N + 3):0] A;                  // Multiplicand w/ guards
wire    [(N + 3):0] Mx16;               // Multiplicand products w/ guards
wire    [(N + 3):0] Mx8;                // Multiplicand products w/ guards
wire    [(N + 3):0] Mx4;                // Multiplicand products w/ guards
wire    [(N + 3):0] Mx2;                // Multiplicand products w/ guards
wire    [(N + 3):0] Mx1;                // Multiplicand products w/ guards
reg     MnP_B, M_Sel_B, En_B;           // Operand B Control Triple
reg     MnP_C, M_Sel_C, En_C;           // Operand C Control Triple
reg     MnP_D, M_Sel_D, En_D;           // Operand D Control Triple
wire    [(N + 3):0] Hi;                 // Upper Half of Product w/ guards
reg     [(N + 3):0] B, C, D;            // Adder tree Operand Inputs
reg     Ci_B, Ci_C, Ci_D;               // Adder tree Carry Inputs
wire    [(N + 3):0] U, T, S;            // Adder Tree Outputs w/ guards
reg     [((2*N) + 3):0] Prod;           // Double Length Product w/ guards

////////////////////////////////////////////////////////////////////////////////
//
//  Implementation
//

always @(posedge Clk)
begin
    if(Rst)
        Cntr <= #1 0;
    else if(Ld)
        Cntr <= #1 pNumCycles;
    else if(|Cntr)
        Cntr <= #1 (Cntr - 1);
end

//  Multiplicand Register
//      includes 4 bits to guard sign of multiplicand in the event the most
//      positive unsigned or most negative signed value is provided as the input

always @(posedge Clk)
begin
    if(Rst)
        A <= #1 0;
    else if(Ld)
        A <= #1 ((Unsigned) ? {4'b0, M} : {{4{M[(N - 1)]}}, M});
end

assign Mx16 = ((Unsigned) ? {      A, 4'b0} : {             A, 4'b0});
assign Mx8  = ((Unsigned) ? {1'b0, A, 3'b0} : {{1{A[N-1]}}, A, 3'b0});
assign Mx4  = ((Unsigned) ? {2'b0, A, 2'b0} : {{2{A[N-1]}}, A, 2'b0});
assign Mx2  = ((Unsigned) ? {3'b0, A, 1'b0} : {{3{A[N-1]}}, A, 1'b0});
assign Mx1  = ((Unsigned) ? {4'b0, A      } : {{4{A[N-1]}}, A      });

//  Compute Upper Partial Product: (N + 5) bits in width

always @(*) Booth <= {Prod[3:0], Guard};    // Booth's Multiplier Recoding field

assign Hi = Prod[((2*N) + 3):N];            // Upper Half of Product Register

// Compute the Control Triples for the First and Second Multiplicand Columns

//  For the first column - B

always @(*)
begin
    case({Unsigned, Booth})
        // Signed Operations
        6'b000000 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b000001 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b000010 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b000011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b000100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b000101 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M - 1*M)
        6'b000110 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M - 1*M)
        6'b000111 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b001000 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b001001 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 1*M)
        6'b001010 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 1*M)
        6'b001011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 2*M)
        6'b001100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 2*M)
        6'b001101 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M - 1*M)
        6'b001110 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M - 1*M)
        6'b001111 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 0*M)
        6'b010000 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (P -  8*M + 0*M - 0*M)
        6'b010001 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (P -  8*M + 0*M + 1*M)
        6'b010010 : {MnP_B, M_Sel_B, En_B} <= 3'b101; // (P -  8*M + 0*M + 1*M)
        6'b010011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M - 2*M)
        6'b010100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M - 2*M)
        6'b010101 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M - 1*M)
        6'b010110 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M - 1*M)
        6'b010111 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M - 0*M)
        6'b011000 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M - 0*M)
        6'b011001 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M + 1*M)
        6'b011010 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 4*M + 1*M)
        6'b011011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 0*M - 2*M)
        6'b011100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 0*M - 2*M)
        6'b011101 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 0*M - 1*M)
        6'b011110 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M - 0*M - 1*M)
        6'b011111 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        // Unsigned Operations
        6'b100000 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b100001 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b100010 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b100011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b100100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b100101 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b100110 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M - 1*M)
        6'b100111 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M - 1*M)
        6'b101000 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b101001 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b101010 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 1*M)
        6'b101011 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 1*M)
        6'b101100 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 2*M)
        6'b101101 : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 4*M + 2*M)
        6'b101110 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M - 1*M)
        6'b101111 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M - 1*M)
        6'b110000 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 0*M)
        6'b110001 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 0*M)
        6'b110010 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 1*M)
        6'b110011 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 1*M)
        6'b110100 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 2*M)
        6'b110101 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 0*M + 2*M)
        6'b110110 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M - 1*M)
        6'b110111 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M - 1*M)
        6'b111000 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M + 0*M)
        6'b111001 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M + 0*M)
        6'b111010 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M + 1*M)
        6'b111011 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M + 1*M)
        6'b111100 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M + 2*M)
        6'b111101 : {MnP_B, M_Sel_B, En_B} <= 3'b001; // (P +  8*M + 4*M + 2*M)
        6'b111110 : {MnP_B, M_Sel_B, En_B} <= 3'b011; // (P + 16*M + 0*M - 1*M)
        6'b111111 : {MnP_B, M_Sel_B, En_B} <= 3'b011; // (P + 16*M + 0*M - 1*M)
        default   : {MnP_B, M_Sel_B, En_B} <= 3'b000; // (P +  0*M + 0*M + 0*M)
    endcase
end

//  For the second column - C

always @(*)
begin
    case({Unsigned, Booth})
        // Signed Operations
        6'b000000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b000001 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b000010 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b000011 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b000100 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b000101 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M - 1*M)
        6'b000110 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M - 1*M)
        6'b000111 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 0*M)
        6'b001000 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 0*M)
        6'b001001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b001010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b001011 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 2*M)
        6'b001100 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 2*M)
        6'b001101 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M - 1*M)
        6'b001110 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M - 1*M)
        6'b001111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 0*M)
        6'b010000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P -  8*M + 0*M + 0*M)
        6'b010001 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P -  8*M + 0*M + 1*M)
        6'b010010 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P -  8*M + 0*M + 1*M)
        6'b010011 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M - 2*M)
        6'b010100 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M - 2*M)
        6'b010101 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M - 1*M)
        6'b010110 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M - 1*M)
        6'b010111 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M - 0*M)
        6'b011000 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M - 0*M)
        6'b011001 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M + 1*M)
        6'b011010 : {MnP_C, M_Sel_C, En_C} <= 3'b101; // (P +  0*M - 4*M + 1*M)
        6'b011011 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M - 2*M)
        6'b011100 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M - 2*M)
        6'b011101 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M - 1*M)
        6'b011110 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M - 1*M)
        6'b011111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        // Unsigned Operations
        6'b100000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b100001 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b100010 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b100011 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 1*M)
        6'b100100 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b100101 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 2*M)
        6'b100110 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M - 1*M)
        6'b100111 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M - 1*M)
        6'b101000 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 0*M)
        6'b101001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 0*M)
        6'b101010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b101011 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b101100 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 2*M)
        6'b101101 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  0*M + 4*M + 2*M)
        6'b101110 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M - 1*M)
        6'b101111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M - 1*M)
        6'b110000 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 0*M)
        6'b110001 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 0*M)
        6'b110010 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 1*M)
        6'b110011 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 1*M)
        6'b110100 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 2*M)
        6'b110101 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  8*M + 0*M + 2*M)
        6'b110110 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M - 1*M)
        6'b110111 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M - 1*M)
        6'b111000 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M + 0*M)
        6'b111001 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M + 0*M)
        6'b111010 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M + 1*M)
        6'b111011 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M + 1*M)
        6'b111100 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M + 2*M)
        6'b111101 : {MnP_C, M_Sel_C, En_C} <= 3'b001; // (P +  8*M + 4*M + 2*M)
        6'b111110 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P + 16*M + 0*M - 1*M)
        6'b111111 : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P + 16*M + 0*M - 1*M)
        default   : {MnP_C, M_Sel_C, En_C} <= 3'b000; // (P +  0*M + 0*M + 0*M)
    endcase
end

//  For the third column - D
always @(*)
begin
    case({Unsigned, Booth})
        // Signed Operations
        6'b000000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b000001 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 0*M + 1*M)
        6'b000010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 0*M + 1*M)
        6'b000011 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 0*M + 2*M)
        6'b000100 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 0*M + 2*M)
        6'b000101 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M + 4*M - 1*M)
        6'b000110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M + 4*M - 1*M)
        6'b000111 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b001000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b001001 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b001010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b001011 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 4*M + 2*M)
        6'b001100 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 4*M + 2*M)
        6'b001101 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  8*M + 0*M - 1*M)
        6'b001110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  8*M + 0*M - 1*M)
        6'b001111 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  8*M + 0*M + 0*M)
        6'b010000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P -  8*M + 0*M + 0*M)
        6'b010001 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P -  8*M + 0*M + 1*M)
        6'b010010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P -  8*M + 0*M + 1*M)
        6'b010011 : {MnP_D, M_Sel_D, En_D} <= 3'b111; // (P +  0*M - 4*M - 2*M)
        6'b010100 : {MnP_D, M_Sel_D, En_D} <= 3'b111; // (P +  0*M - 4*M - 2*M)
        6'b010101 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M - 4*M - 1*M)
        6'b010110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M - 4*M - 1*M)
        6'b010111 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M - 4*M + 0*M)
        6'b011000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M - 4*M + 0*M)
        6'b011001 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M - 4*M + 1*M)
        6'b011010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M - 4*M + 1*M)
        6'b011011 : {MnP_D, M_Sel_D, En_D} <= 3'b111; // (P +  0*M + 0*M - 2*M)
        6'b011100 : {MnP_D, M_Sel_D, En_D} <= 3'b111; // (P +  0*M + 0*M - 2*M)
        6'b011101 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M + 0*M - 1*M)
        6'b011110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M + 0*M - 1*M)
        6'b011111 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        // Unsigned Operations
        6'b100000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b100001 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 0*M + 0*M)
        6'b100010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 0*M + 1*M)
        6'b100011 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 0*M + 1*M)
        6'b100100 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 0*M + 2*M)
        6'b100101 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 0*M + 2*M)
        6'b100110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M + 4*M - 1*M)
        6'b100111 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  0*M + 4*M - 1*M)
        6'b101000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b101001 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 4*M + 0*M)
        6'b101010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b101011 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  0*M + 4*M + 1*M)
        6'b101100 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 4*M + 2*M)
        6'b101101 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  0*M + 4*M + 2*M)
        6'b101110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  8*M + 0*M - 1*M)
        6'b101111 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  8*M + 0*M - 1*M)
        6'b110000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  8*M + 0*M + 0*M)
        6'b110001 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  8*M + 0*M + 0*M)
        6'b110010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  8*M + 0*M + 1*M)
        6'b110011 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  8*M + 0*M + 1*M)
        6'b110100 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  8*M + 0*M + 2*M)
        6'b110101 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  8*M + 0*M + 2*M)
        6'b110110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  8*M + 4*M - 1*M)
        6'b110111 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P +  8*M + 4*M - 1*M)
        6'b111000 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  8*M + 4*M + 0*M)
        6'b111001 : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  8*M + 4*M + 0*M)
        6'b111010 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  8*M + 4*M + 1*M)
        6'b111011 : {MnP_D, M_Sel_D, En_D} <= 3'b001; // (P +  8*M + 4*M + 1*M)
        6'b111100 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  8*M + 4*M + 2*M)
        6'b111101 : {MnP_D, M_Sel_D, En_D} <= 3'b011; // (P +  8*M + 4*M + 2*M)
        6'b111110 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P + 16*M + 0*M - 1*M)
        6'b111111 : {MnP_D, M_Sel_D, En_D} <= 3'b101; // (P + 16*M + 0*M - 1*M)
        default   : {MnP_D, M_Sel_D, En_D} <= 3'b000; // (P +  0*M + 0*M + 0*M)
    endcase
end

//  Compute the first operand - B

always @(*)
begin
    case({MnP_B, M_Sel_B, En_B})
        3'b001  : {Ci_B, B} <= {1'b0,  Mx8};
        3'b011  : {Ci_B, B} <= {1'b0,  Mx16};
        3'b101  : {Ci_B, B} <= {1'b1, ~Mx8};
        3'b111  : {Ci_B, B} <= {1'b1, ~Mx16};
        default : {Ci_B, B} <= 0;
    endcase
end

//  Compute the second operand - C

always @(*)
begin
    case({MnP_C, M_Sel_C, En_C})
        3'b001  : {Ci_C, C} <= {1'b0,  Mx4};
        3'b011  : {Ci_C, C} <= {1'b0,  Mx4};
        3'b101  : {Ci_C, C} <= {1'b1, ~Mx4};
        3'b111  : {Ci_C, C} <= {1'b1, ~Mx4};
        default : {Ci_C, C} <= 0;
    endcase
end

//  Compute the second operand - D

always @(*)
begin
    case({MnP_D, M_Sel_D, En_D})
        3'b001  : {Ci_D, D} <= {1'b0,  Mx1};
        3'b011  : {Ci_D, D} <= {1'b0,  Mx2};
        3'b101  : {Ci_D, D} <= {1'b1, ~Mx1};
        3'b111  : {Ci_D, D} <= {1'b1, ~Mx2};
        default : {Ci_D, D} <= 0;
    endcase
end

//  Compute Partial Sum - Cascaded Adders

assign U = Hi + B + Ci_B;
assign T =  U + C + Ci_C;
assign S =  T + D + Ci_D;

//  Double Length Product Register
//      Multiplier, R, is loaded into the least significant half on load, Ld
//      Shifted right four places as the product is computed iteratively.

always @(posedge Clk)
begin
    if(Rst)
        Prod <= #1 0;
    else if(Ld)
        Prod <= #1 R;
    else if(|Cntr)  // Shift right four bits
        Prod <= #1 ((Unsigned) ? { 4'b0,           S, Prod[(N - 1):4]}
                               : {{4{S[(N + 3)]}}, S, Prod[(N - 1):4]});
end

always @(posedge Clk)
begin
    if(Rst)
        Guard <= #1 0;
    else if(Ld)
        Guard <= #1 0;
    else if(|Cntr)
        Guard <= #1 Prod[3];
end

//  Assign the product less the four guard bits to the output port
//      A 4-bit right shift is required since the output product is stored
//      into a synchronous register on the last cycle of the multiply.

always @(posedge Clk)
begin
    if(Rst)
        P <= #1 0;
    else if(Cntr == 1)
        P <= #1 {S, Prod[(N - 1):4]};
end

//  Count the number of shifts
//      This implementation does not use any optimizations to perform multiple
//      bit shifts to skip over runs of 1s or 0s.

always @(posedge Clk)
begin
    if(Rst)
        Valid <= #1 0;
    else
        Valid <= #1 (Cntr == 1);
end

endmodule
