///////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2010-2012 by Michael A. Morris, dba M. A. Morris & Associates
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

///////////////////////////////////////////////////////////////////////////////
// Company:         M. A. Morris & Associates
// Engineer:        Michael A. Morris
// 
// Create Date:     12:59:58 10/02/2010 
// Design Name:     Fast 4-bit Booth Multiplier 
// Module Name:     Booth_Multiplier_4x.v
// Project Name:    Booth_Multiplier
// Target Devices:  Spartan-3AN
// Tool versions:   Xilinx ISE 10.1 SP3
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
// Dependencies: 
//
// Revision: 
//
//  0.01    10J02   MAM     File Created
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
//  A better implementation might be to consider implementing two simultaneous
//  4-bit partial products at a time, and combining the partial products after
//  they are computed with an appropriate 4-bit shift in the rightmost partial
//  product. This approach can be used to trade off complexity for speed. In
//  the limit, this approach leads to the implementation of a parallel multi-
//  plier. State-of-the-Art parallel multipliers are generally built in this
//  manner, but they use arrays of small elements to compute the partial pro-
//  ducts in a parallel manner. Typically these partial product generators are
//  built around arrays of dual 4-bit inputs and 8-bit output adders with fast
//  carry-propagate output carry generators.
//
///////////////////////////////////////////////////////////////////////////////

module Booth_Multiplier_4x #(
    parameter N = 16                // Width = N: multiplicand & multiplier
)(
    input   Rst,                    // Reset
    input   Clk,                    // Clock
    
    input   Ld,                     // Load Registers and Start Multiplier
    input   [(N - 1):0] M,          // Multiplicand
    input   [(N - 1):0] R,          // Multiplier
    output  reg Valid,              // Product Valid
    output  reg [((2*N) - 1):0] P   // Product <= M * R
);

///////////////////////////////////////////////////////////////////////////////
//
//  Local Parameters
//

localparam pNumCycles = ((N + 1)/4);    // No. of cycles required for product

///////////////////////////////////////////////////////////////////////////////
//
//  Declarations
//

reg     [4:0] Cntr;                     // Operation Counter
reg     [4:0] Booth;                    // Booth Recoding Field
reg     Guard;                          // Shift Bit for Booth Recoding

reg     [(N + 3):0] A;                  // Multiplicand w/ guards
reg     [(N + 3):0] S;                  // Adder w/ guards
wire    [(N + 3):0] Hi;                 // Upper Half of Product w/ guards

reg     [((2*N) + 3):0] Prod;           // Double Length Product w/ guards

///////////////////////////////////////////////////////////////////////////////
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
//      negative value is provided as the input.

always @(posedge Clk)
begin
    if(Rst)
        A <= #1 0;
    else if(Ld)
        A <= #1 {{4{M[(N - 1)]}}, M};
end

//  Compute Upper Partial Product: (N + 4) bits in width

always @(*) Booth <= {Prod[3:0], Guard};    // Booth's Multiplier Recoding fld

assign Hi = Prod[((2*N) + 3):N];            // Upper Half of Product Register

always @(*)
begin
    case(Booth)
        5'b00000 : S <= Hi;                         // Prod <= (Prod + 0*M + 0*M) >> 4;              
        5'b00001 : S <= Hi +  A;                    // Prod <= (Prod + 0*M + 1*M) >> 4;         
        5'b00010 : S <= Hi +  A;                    // Prod <= (Prod + 0*M + 1*M) >> 4;         
        5'b00011 : S <= Hi + {A, 1'b0};             // Prod <= (Prod + 2*M + 0*M) >> 4;  
        5'b00100 : S <= Hi + {A, 1'b0};             // Prod <= (Prod + 2*M + 0*M) >> 4;  
        5'b00101 : S <= Hi + {A, 1'b0} +  A;        // Prod <= (Prod + 2*M + 1*M) >> 4;         
        5'b00110 : S <= Hi + {A, 1'b0} +  A;        // Prod <= (Prod + 2*M + 1*M) >> 4;         
        5'b00111 : S <= Hi + {A, 2'b0};             // Prod <= (Prod + 4*M + 0*M) >> 4;              
        5'b01000 : S <= Hi + {A, 2'b0};             // Prod <= (Prod + 4*M + 0*M) >> 4;             
        5'b01001 : S <= Hi + {A, 2'b0} +  A;        // Prod <= (Prod + 4*M + 1*M) >> 4;         
        5'b01010 : S <= Hi + {A, 2'b0} +  A;        // Prod <= (Prod + 4*M + 1*M) >> 4;         
        5'b01011 : S <= Hi + {A, 2'b0} + {A, 1'b0}; // Prod <= (Prod + 4*M + 2*M) >> 4;  
        5'b01100 : S <= Hi + {A, 2'b0} + {A, 1'b0}; // Prod <= (Prod + 4*M + 2*M) >> 4;  
        5'b01101 : S <= Hi + {A, 3'b0} -  A;        // Prod <= (Prod + 8*M - 1*M) >> 4;         
        5'b01110 : S <= Hi + {A, 3'b0} -  A;        // Prod <= (Prod + 8*M - 1*M) >> 4;
        5'b01111 : S <= Hi + {A, 3'b0};             // Prod <= (Prod + 8*M + 0*M) >> 4;              
        5'b10000 : S <= Hi - {A, 3'b0};             // Prod <= (Prod - 8*M - 0*M) >> 4;              
        5'b10001 : S <= Hi - {A, 3'b0} +  A;        // Prod <= (Prod - 8*M + 1*M) >> 4;         
        5'b10010 : S <= Hi - {A, 3'b0} +  A;        // Prod <= (Prod - 8*M + 1*M) >> 4;        
        5'b10011 : S <= Hi - {A, 2'b0} - {A, 1'b0}; // Prod <= (Prod - 4*M - 2*M) >> 4;  
        5'b10100 : S <= Hi - {A, 2'b0} - {A, 1'b0}; // Prod <= (Prod - 4*M - 2*M) >> 4;  
        5'b10101 : S <= Hi - {A, 2'b0} -  A;        // Prod <= (Prod - 4*M - 1*M) >> 4;         
        5'b10110 : S <= Hi - {A, 2'b0} -  A;        // Prod <= (Prod - 4*M - 1*M) >> 4;         
        5'b10111 : S <= Hi - {A, 2'b0};             // Prod <= (Prod - 4*M - 0*M) >> 4;              
        5'b11000 : S <= Hi - {A, 2'b0};             // Prod <= (Prod - 4*M - 0*M) >> 4;              
        5'b11001 : S <= Hi - {A, 1'b0} -  A;        // Prod <= (Prod - 2*M - 1*M) >> 4;         
        5'b11010 : S <= Hi - {A, 1'b0} -  A;        // Prod <= (Prod - 2*M - 1*M) >> 4;         
        5'b11011 : S <= Hi - {A, 1'b0};             // Prod <= (Prod - 2*M - 0*M) >> 4;  
        5'b11100 : S <= Hi - {A, 1'b0};             // Prod <= (Prod - 2*M - 0*M) >> 4;  
        5'b11101 : S <= Hi -  A;                    // Prod <= (Prod - 0*M - 1*M) >> 4;         
        5'b11110 : S <= Hi -  A;                    // Prod <= (Prod - 0*M - 1*M) >> 4;         
        5'b11111 : S <= Hi;                         // Prod <= (Prod - 0*M - 0*M) >> 4;              
    endcase
end

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
        Prod <= #1 {{4{S[(N + 3)]}}, S, Prod[(N - 1):4]};
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
