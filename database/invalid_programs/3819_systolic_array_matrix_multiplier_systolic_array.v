// This program was cloned from: https://github.com/debtanu09/systolic_array_matrix_multiplier
// License: MIT License

/*

MIT License

Copyright (c) 2020 Debtanu Mukherjee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

`include "block.v"
module systolic_array(inp_west0, inp_west4, inp_west8, inp_west12,
		      inp_north0, inp_north1, inp_north2, inp_north3,
		      clk, rst, done);
	
	input [31:0] inp_west0, inp_west4, inp_west8, inp_west12,
		      inp_north0, inp_north1, inp_north2, inp_north3;
	output reg done;
	input clk, rst;
	reg [3:0] count;
	
	
	
	wire [31:0] inp_north0, inp_north1, inp_north2, inp_north3;
	wire [31:0] inp_west0, inp_west4, inp_west8, inp_west12;
	wire [31:0] outp_south0, outp_south1, outp_south2, outp_south3, outp_south4, outp_south5, outp_south6, outp_south7, outp_south8, outp_south9, outp_south10, outp_south11, outp_south12, outp_south13, outp_south14, outp_south15;
	wire [31:0] outp_east0, outp_east1, outp_east2, outp_east3, outp_east4, outp_east5, outp_east6, outp_east7, outp_east8, outp_east9, outp_east10, outp_east11, outp_east12, outp_east13, outp_east14, outp_east15;
	wire [63:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15;
	
	
	
	//from north and west
	block P0 (inp_north0, inp_west0, clk, rst, outp_south0, outp_east0, result0);
	//from north
	block P1 (inp_north1, outp_east0, clk, rst, outp_south1, outp_east1, result1);
	block P2 (inp_north2, outp_east1, clk, rst, outp_south2, outp_east2, result2);
	block P3 (inp_north3, outp_east2, clk, rst, outp_south3, outp_east3, result3);
	
	//from west
	block P4 (outp_south0, inp_west4, clk, rst, outp_south4, outp_east4, result4);
	block P8 (outp_south4, inp_west8, clk, rst, outp_south8, outp_east8, result8);
	block P12 (outp_south8, inp_west12, clk, rst, outp_south12, outp_east12, result12);
	
	//no direct inputs
	//second row
	block P5 (outp_south1, outp_east4, clk, rst, outp_south5, outp_east5, result5);
	block P6 (outp_south2, outp_east5, clk, rst, outp_south6, outp_east6, result6);
	block P7 (outp_south3, outp_east6, clk, rst, outp_south7, outp_east7, result7);
	//third row
	block P9 (outp_south5, outp_east8, clk, rst, outp_south9, outp_east9, result9);
	block P10 (outp_south6, outp_east9, clk, rst, outp_south10, outp_east10, result10);
	block P11 (outp_south7, outp_east10, clk, rst, outp_south11, outp_east11, result11);
	//fourth row
	block P13 (outp_south9, outp_east12, clk, rst, outp_south13, outp_east13, result13);
	block P14 (outp_south10, outp_east13, clk, rst, outp_south14, outp_east14, result14);
	block P15 (outp_south11, outp_east14, clk, rst, outp_south15, outp_east15, result15);
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			done <= 0;
			count <= 0;
		end
		else begin
			if(count == 9) begin
				done <= 1;
				count <= 0;
			end
			else begin
				done <= 0;
				count <= count + 1;
			end
		end	
	end 
	
		      
endmodule
		      
