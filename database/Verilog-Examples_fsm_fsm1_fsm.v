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

module fsm #(
    parameter WIDTH = 16            // how many bits in the counter regsister
    ) 
    (
    input wire              clk,    // the system clock
    input wire              reset,  // synchronous reset to zero the counter
    output reg [WIDTH-1:0]  D       // the current value of the counter
    );

    // The current state of this FSM is the value of the counter
    reg [WIDTH-1:0]  D_next;

    always @(posedge clk) begin
        if (reset)
            D <= 0;             // reset the FSM
        else
            D <= D_next;
    end

    // A pure combo always block used to calculate the next 
    // state from the current state.
    always @(*) begin
        D_next = D + 1;
    end


endmodule
