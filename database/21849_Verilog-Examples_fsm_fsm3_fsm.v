// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

//**************************************************************************
//
//    Copyright (C) 2024  John Winans
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public
//    License as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//    Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public
//    License along with this library; if not, write to the Free Software
//    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
//    USA
//
//**************************************************************************

// See the following for details on the FSM in this design:
// https://faculty.cs.niu.edu/~winans/CS463/2022-fa/#fsm

// This FSM is a recognizer with synchronous reset.

module fsm(
    input wire              clk,    // the system clock
    input wire              reset,  // synchronous reset to reset the FSM
    input wire              D,      // The synchronous serial data input
    output wire             Q       // The output (high when in state 2'b11)
    );

    // The current state of this FSM is a 2-bit number
    reg [1:0]  S_reg, S_next;

    // the course handout uses a falling edge clock
    always @(negedge clk)
        if (reset)  S_reg <= 2'b0;
        else        S_reg <= S_next;

    always @(*) begin
        S_next = 2'bxx;

        case( S_reg )
        2'b00:
            if ( D )    S_next = 2'b00;
            else        S_next = 2'b01;
        2'b01:
            if ( D )    S_next = 2'b10;
            else        S_next = 2'b01;
        2'b10:
            if ( D )    S_next = 2'b11;
            else        S_next = 2'b01;
        2'b11:
            if ( D )    S_next = 2'b00;
            else        S_next = 2'b01;

        endcase
    end

    // the output is true when we are in state 2'b11
    assign Q = S_reg == 2'b11 ? 1 : 0;

endmodule
