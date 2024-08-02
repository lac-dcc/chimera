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

`default_nettype none

/**
* This will calculate the sum of a and b.
*
* @warning Keep in mind that the buttons and LEDs on the 2057 (and 
* other boards) are low when pressed and high when released and the LEDs 
* are lit when the output signal from the FPGA low!
**************************************************************************/
module top (
    input wire      a,
    input wire      b,
    output wire     sum,
    output wire     cy 
    );

    assign sum = a ^ b;
    assign  cy = a & b;

endmodule
