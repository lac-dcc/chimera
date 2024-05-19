// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "config.vh"
`endif


module buffer #(
parameter addrLen = 6,
parameter dataLen = 32,
parameter memSize = 1 << addrLen,
parameter ram_type = "distributed"
)(
	input clk,
	input reset,
	
	input wrt,
	input [ addrLen - 1 : 0 ] wrt_addr,
	input rd_en,
	input [ addrLen - 1 : 0 ] rd_addr,
	input [ dataLen - 1 : 0 ] data_in,
	
	output reg [ dataLen - 1 : 0 ] data_out
);

	//--------------------------------------------------------------------------------------
	//(* ram_style = ram_type *)
	reg [ dataLen - 1 : 0 ] mem [ 0 : memSize - 1 ];
	//--------------------------------------------------------------------------------------
	
	always @(posedge clk) begin
    if(rd_en)
		data_out <= mem[rd_addr];
		
		if (wrt == 1) 
			mem[wrt_addr] <= data_in;
	end

endmodule

