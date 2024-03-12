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

module hbc_io
    (
        output          RWDS_i,
        input           RWDS_de,
        input           RWDS_o,
        input           DQ_de,
        output  [7:0]   DQ_i,
        input   [7:0]   DQ_o,
    	inout           RWDS,
        inout   [7:0]   DQ
	);


	SB_IO #(
	    .PIN_TYPE(6'b 1010_01),
	    .PULLUP(1'b 0)
	) u_rwds (
	    .PACKAGE_PIN(RWDS),
	    .OUTPUT_ENABLE(RWDS_de),
	    .D_OUT_0(RWDS_o),
	    .D_IN_0(RWDS_i)
	);  

    SB_IO #(
        .PIN_TYPE(6'b 1010_01),
        .PULLUP(1'b 0)
    ) u_DQ[7:0] (
        .PACKAGE_PIN(DQ),
        .OUTPUT_ENABLE(DQ_de),
        .D_OUT_0(DQ_o),
        .D_IN_0(DQ_i)
    );

endmodule