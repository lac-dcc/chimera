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


module hbc_wrapper
	(
		input 			i_clk,
		input 			i_rstn,
		
		input 		  	i_cfg_access,
		input         	i_mem_valid,
		output        	o_mem_ready,
		input  [3:0]  	i_mem_wstrb,
		input  [31:0] 	i_mem_addr,
		input  [31:0] 	i_mem_wdata,
		output [31:0] 	o_mem_rdata,
		
		output       	o_csn0,
		output		 	o_csn1,
		output       	o_clk,
		output       	o_clkn,
		inout  [7:0] 	io_dq,
		inout       	io_rwds,
		output       	o_resetn
	);


wire 	[7:0] 	dq_i;
wire 	[7:0] 	dq_o;
wire 			dq_de;
wire 			rwds_i;
wire 			rwds_de;
wire 			rwds_o;

hbc u_hbc
	(
		.i_clk(i_clk),
		.i_rstn(i_rstn),
		
		.i_cfg_access(i_cfg_access),
		.i_mem_valid(i_mem_valid),
		.o_mem_ready(o_mem_ready),
		.i_mem_wstrb(i_mem_wstrb),
		.i_mem_addr(i_mem_addr),
		.i_mem_wdata(i_mem_wdata),
		.o_mem_rdata(o_mem_rdata),
		
		.o_csn0(o_csn0),
		.o_csn1(o_csn1),
		.o_clk(o_clk),
		.o_clkn(o_clkn),
		.o_dq(dq_o),
		.i_dq(dq_i),
		.o_dq_de(dq_de),
		.o_rwds(rwds_o),
		.i_rwds(rwds_i),
		.o_rwds_de(rwds_de),
		.o_resetn(o_resetn)
	);

hbc_io u_hbc_io
	(
		.RWDS_i(rwds_i),
        .RWDS_de(rwds_de),
        .RWDS_o(rwds_o),
        .DQ_de(dq_de),
        .DQ_i(dq_i),
			.DQ_o(dq_o),
			.RWDS(io_rwds),
        .DQ(io_dq)
	);

endmodule