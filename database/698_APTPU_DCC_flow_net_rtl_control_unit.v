// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 06/15/2023 06:01:04 AM
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module control_unit #(parameter LOG2_WIDTH = 3, 
                      parameter WIDTH = 2**LOG2_WIDTH, 
					  parameter LOG2_NIBBLE_WIDTH = 2, 
					  parameter NIBBLE_WIDTH = 2**LOG2_NIBBLE_WIDTH
					  )
(
input	wire	[NIBBLE_WIDTH-1:0]			operand, // Nibble (4 bits)
output	wire	[LOG2_NIBBLE_WIDTH-1:0]		SEL, // Alphapet selection,
output	wire	[LOG2_NIBBLE_WIDTH-1:0]		SL	// Shift left value
);

assign	SEL[LOG2_NIBBLE_WIDTH-1] = (operand[3] & operand[1])                 | (~operand[3] & operand[2] & operand[0]) ;
assign	SEL[LOG2_NIBBLE_WIDTH-2] = (operand[2] & (operand[3] | operand[1] )) | (~operand[3] & operand[1] & operand[0]) ;

assign	SL[LOG2_NIBBLE_WIDTH-1] = ~operand[1] & (operand[3]  | (operand[2] & ~operand[0])) ; 
assign	SL[LOG2_NIBBLE_WIDTH-2] = (operand[1] & ~operand[0]) | (operand[3] & (operand[1] | ~operand[2])) ;
endmodule
