// 
// Author: Kartik Hegde (kartikhegde.net)
//
// Copyright (c) 2019 Authors of "Buffets: An Efficient and Composable Storage Idiom for Explicit Decoupled Data
// Orchestration".
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



// TODO: Make these parametrizable
module priorityEncoder
			(
			in,
			out
			);

parameter 	WIDTH = 8;
localparam  OWIDTH = $clog2(WIDTH);

input 	[WIDTH-1:0]		in;
output 	[OWIDTH-1:0]	out;

wire    [OWIDTH-1:0]    temp [WIDTH:0];

// We assume this is the index
assign temp[0] = 0;

genvar i;
generate
    //Go through every bit
    for(i=0; i<WIDTH; i=i+1) begin : PRIENC
        // If we find a 0 (empty slot), then store i, else propogate
        assign temp[i+1] = (in[i]==1'b0) ? i : temp[i]; 
    end
endgenerate

assign out = temp[WIDTH];

endmodule
