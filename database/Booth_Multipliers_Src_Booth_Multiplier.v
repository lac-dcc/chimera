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
// Design Name:     Booth Multiplier 
// Module Name:     Booth_Multiplier.v
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
// Additional Comments: 
//
///////////////////////////////////////////////////////////////////////////////

module Booth_Multiplier #(
    parameter pN = 4                // Width = 2**pN: multiplicand & multiplier
)(
    input   Rst,                    // Reset
    input   Clk,                    // Clock
    
    input   Ld,                     // Load Registers and Start Multiplier
    input   [(2**pN - 1):0] M,      // Multiplicand
    input   [(2**pN - 1):0] R,      // Multiplier
    output  reg Valid,              // Product Valid
    output  reg [(2**(pN+1) - 1):0] P   // Product <= M * R
);

///////////////////////////////////////////////////////////////////////////////
//
//  Local Parameters
//

///////////////////////////////////////////////////////////////////////////////
//
//  Declarations
//

reg     [2**pN:0] A;      // Multiplicand w/ sign guard bit
reg     [   pN:0] Cntr;   // Operation Counter
reg     [2**pN:0] S;      // Adder w/ sign guard bit

reg     [(2**(pN+1) + 1):0] Prod;   // Double length product w/ guard bits

///////////////////////////////////////////////////////////////////////////////
//
//  Implementation
//

always @(posedge Clk)
begin
    if(Rst)
        Cntr <= #1 0;
    else if(Ld)
        Cntr <= #1 2**pN;
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
        A <= #1 {M[2**pN - 1], M};  
end

//  Compute Upper Partial Product: (2**pN + 1) bits in width

always @(*)
begin
    case(Prod[1:0])
        2'b01   : S <= Prod[(2**(pN+1) + 1):(2**pN + 1)] + A;
        2'b10   : S <= Prod[(2**(pN+1) + 1):(2**pN + 1)] - A;
        default : S <= Prod[(2**(pN+1) + 1):(2**pN + 1)];
    endcase
end

//  Register Partial products and shift rigth arithmetically.
//      Product register has guard bits on both ends.

always @(posedge Clk)
begin
    if(Rst)
        Prod <= #1 0;
    else if(Ld)
        Prod <= #1 {R, 1'b0};
    else if(|Cntr)
        Prod <= #1 {S[2**pN], S, Prod[2**pN:1]};    // Arithmetic Shift Right
end

//  Assign the product less the two guard bits to the output port

always @(posedge Clk)
begin
    if(Rst)
        P <= #1 0;
    else if(Cntr == 1)
        P <= #1 {S[2**pN], S, Prod[2**pN:2]};
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
