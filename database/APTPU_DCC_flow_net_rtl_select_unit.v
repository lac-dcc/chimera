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
// Module Name: select_unit
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

module select_unit #(parameter LOG2_WIDTH = 4, WIDTH = 2**LOG2_WIDTH, 
								 LOG2_NIBBLE_WIDTH = 2, NIBBLE_WIDTH = 2**LOG2_NIBBLE_WIDTH)
(
input	wire	[WIDTH+2:0]					I1,I3,I5,I7, // pre_comp_bank_output
input	wire	[LOG2_NIBBLE_WIDTH-1:0]		SEL, // Alphabet selection,
output	reg		[WIDTH+2:0]					IX	// Selected alphabet
);


always@(*)
begin
IX = 'd0 ;
case(SEL)
	2'b00:	IX = I1 ;
	2'b01:	IX = I3 ;
	2'b10:	IX = I5 ;
	2'b11:	IX = I7 ;
endcase

end

endmodule
