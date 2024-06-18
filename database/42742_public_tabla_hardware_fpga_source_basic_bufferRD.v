// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "config.vh"
`endif


module bufferRD #(
    parameter addrLen = 6,
	parameter dataLen = 32,
	parameter memSize = 1 << addrLen
	)(
	clk,
	reset,
	wrt,
	wrt_addr,
  rd_en,
	rd_addr0,
	rd_addr1,
	data_in,
	data_out0,
	data_out1
);

	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------------
	input clk;
	input reset;
	
	input wrt;
  input rd_en;
	
	input [ addrLen - 1 : 0 ] wrt_addr;
	input [ addrLen - 1 : 0 ] rd_addr0;
	input [ addrLen - 1 : 0 ] rd_addr1;
	input [ dataLen - 1 : 0 ] data_in;
	
	output reg [ dataLen - 1 : 0 ] data_out0;
	output reg [ dataLen - 1 : 0 ] data_out1;
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	reg [ dataLen - 1 : 0 ] mem [ 0 : memSize - 1 ];
	//--------------------------------------------------------------------------------------
	integer i;
	always @(posedge clk) begin
		if(reset) begin
			for(i = 0; i < 1 << addrLen; i = i + 1) mem[i] <= 0;
		end
		if (wrt) mem[wrt_addr] <= data_in;
	end

	always @(posedge clk) begin
    if(reset) begin
      data_out0 <= {dataLen{1'b0}};
      data_out1 <= {dataLen{1'b0}};
    end else if(rd_en) begin
	    data_out0 <= mem[rd_addr0];
	    data_out1 <= mem[rd_addr1];
    end
  end

endmodule

