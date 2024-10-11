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
// https://faculty.cs.niu.edu/~winans/CS463/notes/fsm.pdf

// This FSM is a 2-bit synchronous counter with enable input.
// Note: This implementation adds a synchronized reset input.

module fsm (
    input wire              clk,    // the system clock
    input wire              reset,  // synchronous reset to reset the FSM
    input wire              E,      // The enable input
    output wire [1:0]       S       // the current state
    );

    // The current state of this FSM 
    reg [1:0]  S_reg, S_next;

    // advance the FSM state on the rising edge of clk
    // Note: The reset logic is implemented here to ensure synthesys 
    // recognizes the always block as a FF with synch reset.

    always @(posedge clk) begin
        if (reset)
            S_reg <= 2'b0;      // reset the FSM
        else
            S_reg <= S_next;
    end

    // Using the current state and any inputs, determine the next state.
    // I express in discrete binary since FSMs are often that way when
    // they are not just a counter.
 
    always @(*) begin
        S_next = 2'bxx;         // This helps debugging

        case( S_reg )
        2'b00:
            if ( E )    S_next = 2'b01;     // advance to the next state
            else        S_next = 2'b00;     // state stays the same
        2'b01:
            if ( E )    S_next = 2'b10;     // S_next = S_reg + 1;
            else        S_next = 2'b01;
        2'b10:
            if ( E )    S_next = 2'b11;
            else        S_next = 2'b10;
        2'b11:
            if ( E )    S_next = 2'b00;
            else        S_next = 2'b11;

        // no default????  --> will leave S_next set to 2'bxx
        endcase
    end

    // A moore FSM's output is based on the state only
    // It could have combo logic involved.
    // In this simple example, the state itself is the output.
    assign S = S_reg;           // connect the state to the module's output

endmodule
