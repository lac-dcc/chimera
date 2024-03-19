`timescale 1ns/1ps
`ifdef FPGA
	`include "config.vh"
`endif

(* rom_extract = "yes" *)
module iBuffer #(
    parameter integer addrLen = 5,
	parameter integer dataLen = 32,
	parameter integer peId	= 1
	//parameter type	= "block"
)(
	clk,
	rdAddr,
	noStall,
	dataOut
);
	//--------------------------------------------------------------------------------------
	
	
	localparam integer unit = peId%10 + 'h30;
	localparam integer tens = peId/10%10 + 'h30;
  `ifdef FPGA
	  localparam init = {`COMPUTE_INST_INIT, "pe", tens, unit, ".txt"};
  `endif
  
  `ifdef SIMULATION
	  initial begin
		  $display ("%s", init);
	  end
  `endif

	//--------------------------------------------------------------------------------------
	input clk;
	input noStall;
	input[addrLen - 1: 0] rdAddr;
	output reg[dataLen - 1: 0] dataOut;

	//--------------------------------------------------------------------------------------
	reg[dataLen - 1: 0] mem	[0: (1 << addrLen) - 1];
	
	// ******************************************************************
	// Initialization
	// ******************************************************************
	`ifdef FPGA
    initial $readmemb (init, mem);
    wire     [dataLen-1:0]	rdata;
  
    assign rdata = mem[rdAddr];
  `else
    localparam DATA_WIDTH = dataLen;
    localparam DEPTH = (1<<addrLen);
    wire     [addrLen-1:0]        address;
    reg     [DATA_WIDTH-1:0]        rdata;

    assign address = rdAddr;

    // `include "instructions.v" // TODO
  `endif

	//-------------------------------------------------------------------------------------
 	always @(posedge clk) begin
 		if(noStall) dataOut <= rdata;
	end
	
endmodule
