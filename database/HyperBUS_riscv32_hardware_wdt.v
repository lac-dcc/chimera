// Copyright 2017 Gnarly Grey LLC

// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:

// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

// Simple Watch Dog Timer 


module wdt(
	input i_clk,
	input i_resetn,

	input i_en,
	input i_restart,
	output o_timeout
	);

	parameter TIMEOUT = 250000;

	reg timeout_stb;
	integer timer;

	always @(posedge i_clk or negedge i_resetn) begin
		if (!i_resetn) begin
			timeout_stb <= 1'b0;
			timer <= TIMEOUT;
		end
		else if (i_en) begin
			if(i_restart) begin
				timer <= TIMEOUT;
				timeout_stb <= 1'b0;
			end else begin
				if(timer) timer <= timer - 1;
				else timeout_stb <= 1'b1;
			end
		end else begin
			timer <= TIMEOUT;
			timeout_stb <= 1'b0;
		end
	end

	assign o_timeout = timeout_stb;
endmodule