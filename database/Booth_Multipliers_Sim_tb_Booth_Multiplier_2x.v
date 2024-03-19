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
// Create Date:     21:48:39 07/10/2010
// Design Name:     Fast 2-bits per cycle Booth Multiplier
// Module Name:     tb_Booth_Multiplier_2x.v
// Project Name:    Booth_Multiplier
// Target Devices:  Spartan-3AN
// Tool versions:   Xilinx ISE 10.1 SP3
//
// Description:
//
// Verilog Test Fixture created by ISE for module: Booth_Multiplier_2x
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

module tb_Booth_Multiplier_2x;

parameter N = 8;

//  UUT Signals

reg     Rst;
reg     Clk;

reg     Ld;
reg     [(N - 1):0] M;
reg     [(N - 1):0] R;

wire    Valid;
wire    [((2*N) - 1):0] P;

//  Simulation Variables

reg     [(2*N):0] i;

// Instantiate the Unit Under Test (UUT)

Booth_Multiplier_2x #(
                        .N(N)
                    ) uut (
                        .Rst(Rst), 
                        .Clk(Clk), 
                        .Ld(Ld), 
                        .M(M), 
                        .R(R), 
                        .Valid(Valid), 
                        .P(P)
                    );

initial begin
    // Initialize Inputs
    Rst = 1;
    Clk = 1;
    Ld  = 0;
    M   = 0;
    R   = 0;
    
    i   = 0;

    // Wait 100 ns for global reset to finish
    #101 Rst = 0;
    
    // Add stimulus here
    
    @(posedge Clk) #1;
    
    for(i = (2**N); i < (2**(2*N)) + 1; i = i + 1) begin
        Ld = 1; M = i[((2*N) - 1):N]; R = i[(N - 1):0];
        @(posedge Clk) #1 Ld = 0;
        @(posedge Valid);
    end

//    @(posedge Clk) #1 M = 4'h8; R = 4'h2; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    
//    @(posedge Valid); M = 4'h2; R = 4'h8; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    
//    @(posedge Valid); M = 4'h8; R = 4'h6; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    
//    @(posedge Valid); M = 4'h6; R = 4'h8; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    
//    @(posedge Valid); M = 4'h0; R = 4'h0; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;

end

///////////////////////////////////////////////////////////////////////////////

always #5 Clk = ~Clk;
      
///////////////////////////////////////////////////////////////////////////////

endmodule

