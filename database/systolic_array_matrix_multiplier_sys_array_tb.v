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

`include "systolic_array.v"
module sys_array_tb;

reg rst, clk;

reg [31:0] inp_west0, inp_west1, inp_west2, inp_west3, inp_north0, inp_north1, inp_north2, inp_north3;
wire done;

systolic_array uut(inp_west0, inp_west1, inp_west2, inp_west3,
		      inp_north0, inp_north1, inp_north2, inp_north3,
		      clk, rst, done);


initial begin
	#3  inp_west0 <= 32'd3;
	    inp_north0 <= 32'd12;
	#10 inp_west0 <= 32'd2;
	    inp_north0 <= 32'd8;
	#10 inp_west0 <= 32'd1;
	    inp_north0 <= 32'd4;
	#10 inp_west0 <= 32'd0;
	    inp_north0 <= 32'd0;
	#10 inp_west0 <= 32'd0;
	    inp_north0 <= 32'd0;
	#10 inp_west0 <= 32'd0;
	    inp_north0 <= 32'd0;
	#10 inp_west0 <= 32'd0;	
	    inp_north0 <= 32'd0;
end

initial begin
	#3  inp_west1 <= 32'd0;
	    inp_north1 <= 32'd0;
	#10 inp_west1 <= 32'd7;
	    inp_north1 <= 32'd13;
	#10 inp_west1 <= 32'd6;
	    inp_north1 <= 32'd9;
	#10 inp_west1 <= 32'd5;
	    inp_north1 <= 32'd5;
	#10 inp_west1 <= 32'd4;
	    inp_north1 <= 32'd1;
	#10 inp_west1 <= 32'd0;
	    inp_north1 <= 32'd0;
	#10 inp_west1 <= 32'd0;	
	    inp_north1 <= 32'd0;
end

initial begin
	#3  inp_west2 <= 32'd0;
	    inp_north2 <= 32'd0;
	#10 inp_west2 <= 32'd0;
	    inp_north2 <= 32'd0;
	#10 inp_west2 <= 32'd11;
	    inp_north2 <= 32'd14;
	#10 inp_west2 <= 32'd10;
	    inp_north2 <= 32'd10;
	#10 inp_west2 <= 32'd9;
	    inp_north2 <= 32'd6;
	#10 inp_west2 <= 32'd8;
	    inp_north2 <= 32'd2;
	#10 inp_west2 <= 32'd0;	
	    inp_north2 <= 32'd0;
end

initial begin
	#3  inp_west3 <= 32'd0;
	    inp_north3 <= 32'd0;
	#10 inp_west3 <= 32'd0;
	    inp_north3 <= 32'd0;
	#10 inp_west3 <= 32'd0;
	    inp_north3 <= 32'd0;
	#10 inp_west3 <= 32'd15;
	    inp_north3 <= 32'd15;
	#10 inp_west3 <= 32'd14;
	    inp_north3 <= 32'd11;
	#10 inp_west3 <= 32'd13;
	    inp_north3 <= 32'd7;
	#10 inp_west3 <= 32'd12;	
	    inp_north3 <= 32'd3;
end

initial begin
rst <= 1;
clk <= 0;
#3
rst <= 0;
end

initial begin
	repeat(21)
		#5 clk <= ~clk;
end




initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0, sys_array_tb);
end



endmodule
