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
// Create Date: 06/28/2023 12:47:35 AM
// Design Name: 
// Module Name: shifter
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

module shifter #(parameter WIDTH = 16, ROUN_WIDTH = 0, LOG2_WIDTH = 4) //WIDTH --> input data width
(
input	wire	[WIDTH-1:0]					X,
input	wire	[WIDTH-1+ROUN_WIDTH:0]		Y,
input	wire	[LOG2_WIDTH-1:0]			K, 		// K of X
output	wire	[2*WIDTH+ROUN_WIDTH-1:0]	Xr_Y	//Xr*Y
);



	// power_k_mux wires //
wire	[2*WIDTH-1:0]		OUT_2K_wire ;

	// shift_left_mux //
wire	[WIDTH-1:0]		Operand_SL_wire ;


power_k_mux #(.ROUN_WIDTH(ROUN_WIDTH),.WIDTH(WIDTH), .LOG2_WIDTH(LOG2_WIDTH))power_k_mux(.IN(Y),.K(K),.OUT_2K(OUT_2K_wire));

shift_left_mux #(.WIDTH(WIDTH), .LOG2_WIDTH(LOG2_WIDTH))shift_left_mux(.Operand(X),.K(K),.Operand_SL(Operand_SL_wire));


decision_mux #(.ROUN_WIDTH(ROUN_WIDTH),.WIDTH(WIDTH), .LOG2_WIDTH(LOG2_WIDTH)) decision_mux(.IN(OUT_2K_wire),.decision_bit(Operand_SL_wire[WIDTH-1]),.IN_r(Xr_Y));

endmodule
