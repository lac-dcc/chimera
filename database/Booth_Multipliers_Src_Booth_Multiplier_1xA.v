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

////////////////////////////////////////////////////////////////////////////////
// Company:         M. A. Morris & Associates
// Engineer:        Michael A. Morris
// 
// Create Date:     19:48:02 07/10/2010 
// Design Name:     Booth Multiplier (1 bit at a time)
// Module Name:     Booth_Multiplier_1xA.v
// Project Name:    Booth_Multiplier
// Target Devices:  Spartan-3AN
// Tool versions:   Xilinx ISE 10.1 SP3
//
// Description:
//
//  This module implements a parameterized multiplier which uses the Booth
//  algorithm for its implementation. The implementation is based on the 
//  algorithm described in "Computer Organization", Hamacher et al, McGraw-
//  Hill Book Company, New York, NY, 1978, ISBN: 0-07-025681-0. 
//
// Dependencies: 
//
// Revision: 
//
//  0.01    10G10   MAM     File Created
//
//  1.00    12I02   MAM     Changed parameterization from a power of 2 to the
//                          number of bits to match the other modules in this
//                          family of Booth multipliers. Made the structure of
//                          the module match that of the x2 and x4 modules.
//
//  1.10    12I03   MAM     Changed the implementation technique of the partial
//                          product summer to match that of the x4A module. This
//                          reduces the adder to a single adder with a preceed-
//                          ing multiplexer that generates the proper operand as
//                          0, M w/ no carry in, or ~M w/ carry input.
//          
//
// Additional Comments: 
//
////////////////////////////////////////////////////////////////////////////////

module Booth_Multiplier_1xA #(
    parameter N = 16            // Width = N: multiplicand & multiplier
)(
    input   Rst,                // Reset
    input   Clk,                // Clock
    
    input   Ld,                 // Load Registers and Start Multiplier
    input   [(N - 1):0] M,      // Multiplicand
    input   [(N - 1):0] R,      // Multiplier
    output  reg Valid,          // Product Valid
    output  reg [(2*N - 1):0] P // Product <= M * R
);

///////////////////////////////////////////////////////////////////////////////
//
//  Local Parameters
//

///////////////////////////////////////////////////////////////////////////////
//
//  Declarations
//

reg     [4:0] Cntr;             // Operation Counter
reg     [1:0] Booth;            // Booth Recoding Field
reg     Guard;                  // Shift bit for Booth Recoding
reg     [N:0] A;                // Multiplicand w/ sign guard bit
reg     [N:0] B;                // Input Operand to Adder w/ sign guard bit
reg     Ci;                     // Carry input to Adder
reg     [N:0] S;                // Adder w/ sign guard bit
wire    [N:0] Hi;               // Upper half of Product w/ sign guard

reg     [2*N:0] Prod;           // Double length product w/ sign guard bit

///////////////////////////////////////////////////////////////////////////////
//
//  Implementation
//

always @(posedge Clk)
begin
    if(Rst)
        Cntr <= #1 0;
    else if(Ld)
        Cntr <= #1 N;
    else if(|Cntr)
        Cntr <= #1 (Cntr - 1);
end

//  Multiplicand Register
//      includes an additional bit to guard sign bit in the event the
//      most negative value is provided as the multiplicand.

always @(posedge Clk)
begin
    if(Rst)
        A <= #1 0;
    else if(Ld)
        A <= #1 {M[N - 1], M};  
end

//  Compute Upper Partial Product: (N + 1) bits in width

always @(*) Booth <= {Prod[0], Guard};  // Booth's Multiplier Recoding field

assign Hi = Prod[2*N:N];                // Upper Half of the Product Register

always @(*)
begin
    case(Booth)
        2'b01   : {Ci, B} <= {1'b0,  A};
        2'b10   : {Ci, B} <= {1'b1, ~A};
        default : {Ci, B} <= 0;
    endcase
end

always @(*) S <= Hi + B + Ci;

//  Register Partial products and shift right arithmetically.
//      Product register has a sign extension guard bit.

always @(posedge Clk)
begin
    if(Rst)
        Prod <= #1 0;
    else if(Ld)
        Prod <= #1 R;
    else if(|Cntr)  // Arithmetic right shift 1 bit
        Prod <= #1 {S[N], S, Prod[(N - 1):1]};
end

always @(posedge Clk)
begin
    if(Rst)
        Guard <= #1 0;
    else if(Ld)
        Guard <= #1 0;
    else if(|Cntr)
        Guard <= #1 Prod[0];
end

//  Assign the product less the sign extension guard bit to the output port

always @(posedge Clk)
begin
    if(Rst)
        P <= #1 0;
    else if(Cntr == 1)
        P <= #1 {S, Prod[(N - 1):1]};
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
