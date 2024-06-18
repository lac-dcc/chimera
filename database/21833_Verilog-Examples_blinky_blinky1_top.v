// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

//**************************************************************************
//
//    Copyright (C) 2020  John Winans
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


/**
* This will blink the four LEDs on the IceStick Evaluation board
* by dividing down the 12MHZ oscillator on the board.
**************************************************************************/
module top (
    input wire clk,             // 12MHZ clock
    output wire led1,
    output wire led2,
    output wire led3,
    output wire led4,
    output wire led5
    );

    reg [25:0] counter = 0;

    // Drive the LEDs from the MSBs of the counter

    assign led1 = counter[21];      // divide by 4MHZ
    assign led2 = counter[22];      // divide by 8MHZ
    assign led3 = counter[23];      // divide by 16MHZ
    assign led4 = counter[24];      // divide by 32MHZ
    assign led5 = counter[25];      // divide by 64MHZ

    // Add 1 to the counter on each rising edge of the clk input signal
    always @ (posedge clk) 
    begin
        counter <= counter + 1;
    end

endmodule
