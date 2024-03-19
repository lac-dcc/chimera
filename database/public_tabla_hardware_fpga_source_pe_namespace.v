`timescale 1ns/1ps
module pe_namespace #(
    parameter instAddrLen = 6,
	parameter dataLen = 32,
	parameter instLen = 32,
	parameter dataAddrLen = 5,
	parameter weightAddrLen = 5,
	parameter metaAddrLen = 2,
	parameter peId = 0
	)(
	clk,
	reset,	
	start,

	data_wrt,
	data_wrt_addr,
	data_rd_addr,
	data_in,
	data_out,
	
	weight_wrt,
	weight_wrt_addr,
	weight_rd_addr,
	weight_in,
	weight_out,
	
	
	meta_wrt,
	meta_wrt_addr,
	meta_rd_addr,
	meta_in,
	meta_out
);

	//this memory space comprises of the different sematically defined buffers: instruction, data, weights, gradient and meta
	
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	input clk;
	input reset;
	input start;

	
	input data_wrt;
	input [dataAddrLen - 1 : 0] 	data_wrt_addr;
	input [dataAddrLen - 1 : 0] 	data_rd_addr;
	input [dataLen - 1 : 0 ] 		data_in;
	output [dataLen - 1 : 0 ] 		data_out;
	
	input weight_wrt;
	input [weightAddrLen - 1 : 0 ] 	weight_wrt_addr;
	input [weightAddrLen - 1 : 0 ]	weight_rd_addr;
	input [dataLen - 1 : 0 ]		weight_in;
	output [dataLen - 1 : 0 ]		weight_out;
	
	
	input meta_wrt;
	input [metaAddrLen - 1 : 0 ]	meta_wrt_addr;
	input [metaAddrLen - 1 : 0 ]	meta_rd_addr;
	input [dataLen - 1 : 0 ]		meta_in;
	output [dataLen - 1 : 0 ]		meta_out;
	//--------------------------------------------------------------------------------------

	//Instruction Buffer
	//--------------------------------------------------------------------------------------
	//wire inst_fifo_empty;
	
  wire rd_en;
  assign rd_en = 1'b1;

	//--------------------------------------------------------------------------------------
	
	//--------------------------------------------------------------------------------------
	//Data Buffer
	buffer #( .addrLen(dataAddrLen), .dataLen(dataLen), .ram_type ("block")  )
	dataBuffer( 
		.clk      (clk),
		.reset    (reset),
		.wrt      (data_wrt),
		.wrt_addr (data_wrt_addr),
        .rd_en    (rd_en),
		.rd_addr  (data_rd_addr),
		.data_in  (data_in),
		.data_out (data_out)
	);
	
	//--------------------------------------------------------------------------------------
	//weight Buffer
	buffer #( .addrLen(weightAddrLen), .dataLen(dataLen), .ram_type ("block")  )
	weightBuffer( 
		.clk      (clk),
		.reset    (reset),
		.wrt      (weight_wrt),
		.wrt_addr (weight_wrt_addr),
        .rd_en    (rd_en),
		.rd_addr  (weight_rd_addr),
		.data_in  (weight_in),
		.data_out (weight_out)
	);
	
	
	//--------------------------------------------------------------------------------------
	//meta Buffer
	bufferM #( .addrLen(metaAddrLen), .dataLen(dataLen),.peId(peId) )
	metaBuffer( 
		clk,
		reset,

		meta_rd_addr,
		meta_out
	);	
	//--------------------------------------------------------------------------------------

//  `ifdef SIMULATION  
//	always @(posedge clk)
//	begin
//		if(weight_wrt == 1) $display("peId %d -- , weight_data %d \n", peId, $signed(weight_in));
//		if(data_wrt == 1) $display("peId %d --, data_data %d \n", peId, data_in);
//	end
//`endif

endmodule
