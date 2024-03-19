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
// Create Date:     19:48:02 07/10/2010 
// Design Name:     Fast 2-bit Booth Multiplier 
// Module Name:     Booth_Multiplier_2x.v
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
//  Booth multiplier algorithm shifts the multiplier 2 bits at a time. Thus,
//  this algorithm will compute a 2's complement product twice as fast as the
//  standard algorithm.
//
// Dependencies: 
//
// Revision: 
//
//  0.01    10G11   MAM     File Created
//
//  1.00    10J06   MAM     Corrected the sign extension/guards required to 
//                          yield the correct product. Sign extension is needed
//                          to insure that carries from the least significant
//                          partial product propagate into the most significant
//                          partial products at each stage. Thus, the number
//                          of extra bits required is equal to 1 plus the shift
//                          required in the partial products. In this implemen-
//                          tation, the number of extra bits is 2: one for the
//                          sign and one for the shift (±2).
//
//  1.10    10J09   MAM     Made correction to the parameterized equation for
//                          the Guard bit. The paramterization of Prod[pN-1]
//                          incorrect for a Booth Multiplier for a 2-bits at a
//                          time multiplier. The bit shifted into the Guard bit
//                          is always Prod[1]. Thus, the change was made. The
//                          parameterization works for pN == 2, but fails for
//                          values of pN greater than 2.
//
//  1.11    10J09   MAM     Changed parameterization from a power of 2 to the
//                          number of bits representing the inputs. Allows the
//                          use of widths not representable as integer power of
//                          2 such as 5. At present, the implementation does
//                          allow odd lengths for the inputs. To accomodate odd
//                          lengths an adjustment of the product register to
//                          the nearest even length is required. Also required
//                          is a compensation of the the output to account for
//                          the extra bit in the input. The number of cycles
//                          required for an odd length is the same that needed
//                          for the next larger even length since this imple-
//                          mentation is for multiplication 2 bits at a time.
//
// Additional Comments:
//
//  The basic operations follow those of the standard Booth multiplier except
//  that the transitions are being tracked across 2 bits plus the guard bit.
//  The result is that the operations required are 0, ±1, and ±2 times the 
//  multiplicand (M). That is:
//  
//  Prod[2:0]   Operation
//     000      Prod <= (Prod + 0*M) >> 2;
//     001      Prod <= (Prod + 1*M) >> 2;
//     010      Prod <= (Prod + 1*M) >> 2;
//     011      Prod <= (Prod + 2*M) >> 2;
//     100      Prod <= (Prod - 2*M) >> 2;
//     101      Prod <= (Prod - 1*M) >> 2;
//     110      Prod <= (Prod - 1*M) >> 2;
//     111      Prod <= (Prod - 0*M) >> 2;
//
//  The operations in this table can be seen as direct extensions of the four
//  conditions used in the standard Booth algorithm. The first and last terms
//  simply indicate to skip over runs of 1s and 0s. The terms 001 and 110 are
//  indicative of the 01 (+1) and 10 (-1) operations of the standard Booth al-
//  gorithm. The terms 010 (+2,-1) and 101 (-2,+1) reduce to the operations
//  noted in the table, namely ±1*M, respectively. The terms 011 (+2,0) and
//  100 (-2, 0) are the two new operations required for this modified Booth
//  algorithm.
//
//  The algorithm could be extended to any number of bits as required by noting
//  that as more bits are added to the left, the number of terms (operations)
//  required increases. Addding another bit, i.e. a 3-bit Booth recoding, means
//  that the operations required of the adder/partial product are 0, ±1, ±2,
//  and ±4. The guard bits provided for the sign bit accomodates the ±2 opera-
//  tion required for the 2-bit modified booth algorithm. Adding a third bit
//  means that a third guard bit will be required for the sign bit to insure
//  that there is no overflow in the partial product when ±4 is the operation.
//
//  A better implementation might be to consider implementing two simultaneous
//  2-bit partial products at a time, and combining the partial products after
//  they are computed with an appropriate 2-bit shift in the rightmost partial
//  product. This approach can be used to trade off complexity for speed. In
//  the limit, this approach leads to the implementation of a parallel multi-
//  plier. State-of-the-Art parallel multipliers are generally built in this
//  manner, but they use arrays of small elements to compute the partial pro-
//  ducts in a parallel manner. Typically these partial product generators are
//  built around arrays of dual 2-bit inputs and 4-bit output adders with fast
//  carry-propagate output carry generators.
//
///////////////////////////////////////////////////////////////////////////////

module Booth_Multiplier_2x #(
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

localparam pNumCycles = ((N + 1)/2);    // No. of cycles required for product

///////////////////////////////////////////////////////////////////////////////
//
//  Declarations
//

reg     [4:0] Cntr;         // Operation Counter
reg     [2:0] Booth;        // Booth Recoding Field
reg     Guard;              // Shift Bit for Booth Recoding

reg     [(N + 1):0] A;      // Multiplicand w/ guards
reg     [(N + 1):0] S;      // Adder w/ guards
wire    [(N + 1):0] Hi;     // Upper Half of Product w/ guards

reg     [((2*N) + 1):0] Prod;   // Double Length Product w/ guards

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
//      includes 2 bits to guard sign of multiplicand in the event the most
//      negative value is provided as the input.

always @(posedge Clk)
begin
    if(Rst)
        A <= #1 0;
    else if(Ld)
        A <= #1 {{2{M[(N - 1)]}}, M};
end

//  Compute Upper Partial Product: (N + 2) bits in width

always @(*) Booth <= {Prod[1:0], Guard};    // Booth's Multiplier Recoding fld

assign Hi = Prod[((2*N) + 1):N];    // Upper Half of the Product Register

always @(*)
begin
    case(Booth)
        3'b000  : S <= Hi;              // Prod <= (Prod + 0*A) >> 2;
        3'b001  : S <= Hi +  A;         // Prod <= (Prod + 1*A) >> 2;
        3'b010  : S <= Hi +  A;         // Prod <= (Prod + 1*A) >> 2;
        3'b011  : S <= Hi + {A, 1'b0};  // Prod <= (Prod + 2*A) >> 2;
        3'b100  : S <= Hi - {A, 1'b0};  // Prod <= (Prod - 2*A) >> 2;
        3'b101  : S <= Hi -  A;         // Prod <= (Prod - 1*A) >> 2;
        3'b110  : S <= Hi -  A;         // Prod <= (Prod - 1*A) >> 2;
        3'b111  : S <= Hi;              // Prod <= (Prod - 0*A) >> 2;
    endcase
end

//  Double Length Product Register
//      Multiplier, R, is loaded into the least significant half on load, Ld.
//      Shifted right two places as the product is computed iteratively.

always @(posedge Clk)
begin
    if(Rst)
        Prod <= #1 0;
    else if(Ld)
        Prod <= #1 R;
    else if(|Cntr)  // Shift right two bits
        Prod <= #1 {{2{S[(N + 1)]}}, S, Prod[(N - 1):2]};
end

always @(posedge Clk)
begin
    if(Rst)
        Guard <= #1 0;
    else if(Ld)
        Guard <= #1 0;
    else if(|Cntr)
        Guard <= #1 Prod[1];
end

//  Assign the product less the two guard bits to the output port
//      A double right shift is required since the output product is stored
//      into a synchronous register on the last cycle of the multiply.

always @(posedge Clk)
begin
    if(Rst)
        P <= #1 0;
    else if(Cntr == 1)
        P <= #1 {S, Prod[(N - 1):2]};
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
