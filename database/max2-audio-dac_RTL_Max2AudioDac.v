// This program was cloned from: https://github.com/dilshan/max2-audio-dac
// License: MIT License

//********************************************************************************
// Copyright 2020 Dilshan R Jayakody [jayakody2000lk@gmail.com]
// 
// Permission is hereby granted, free of charge, to any person obtaining a 
// copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included 
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.
//********************************************************************************

module Max2AudioDac(clk, mute, din, bclk, wclk, lout, rout);

	output [23:0] lout;
	output [23:0] rout;
	
	input clk;
	input din;
	input bclk;
	input wclk;
	input mute;
	
	reg [23:0] leftReg;
	reg [23:0] rightReg;
	reg [0:23] shift;
	reg [1:0]  bclkState;
	reg [4:0]  counter;
	reg wsd = 0;
	reg wsdEdge = 0;
	
	wire bclkRise = (bclkState == 2'b01);
	wire bclkFall = (bclkState == 2'b10);
	wire wsp = wsd ^ wsdEdge;
	
	assign lout = leftReg;
	assign rout = rightReg;
	
	initial leftReg = 0;
	initial rightReg = 0;
	
	always @(posedge clk)
	begin
		bclkState <= {bclkState, bclk};
	end
	 
	always @(posedge clk)
	begin
		if (bclkRise)
		begin
			wsd <= wclk;
		end
	end

	always @(posedge clk)
	begin
		if (bclkRise)
		begin
			wsdEdge <= wsd;
		end
	end
  
	always @(posedge clk)
	begin
		if (bclkFall)
		begin
			if (wsp)
			begin
				counter <= 0;
			end
			else if (counter < 24)
			begin
				counter <= counter + 1;
			end
		end
	end
  
	always @(posedge clk)
	begin
		if (bclkRise)
		begin
			if (wsp)
			begin
				shift <= 0;
			end
			
			if (counter < 24)
			begin
				shift[counter] <= din;
			end
		end
	end

	always @(posedge clk)
	begin
		if (mute)
		begin
			leftReg <= 0;
		end
		else
		begin
			if (bclkRise)
			begin
				if (wsd && wsp)
				begin
					leftReg <= {~shift[0], shift[1:23]};
				end
			end
		end
	end

	always @(posedge clk)
	begin
		if (mute)
		begin
			rightReg <= 0;
		end
		else
		begin
			if (bclkRise)
			begin
				if (!wsd && wsp)
				begin
					rightReg <= {~shift[0], shift[1:23]};
				end
			end
		end
	end
			
endmodule
