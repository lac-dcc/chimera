`timescale 1ns/1ps

module pe_namespace_tb;

	parameter memIndexLen = 6;
	parameter instAddrLen = 6;
	parameter dataAddrLen = 6;
	parameter weightAddrLen = 6;
	parameter metaAddrLen = 2;
	parameter dataLen = 32;
	parameter instLen = 32;
	parameter logMemNamespaces = 2; //instruction, data, weight, meta


	reg clk;
	reg reset;
	
	reg inst_wrt;
	reg [instLen - 1: 0] 		inst;
	reg inst_stall;
	
	wire [instLen - 1: 0] 		inst_out;
	wire inst_fifo_full;
	wire inst_valid;
	
	reg data_wrt;
	reg [dataAddrLen - 1 : 0] 	data_wrt_addr;
	reg [dataAddrLen - 1 : 0] 	data_rd_addr;
	reg [dataLen - 1 : 0 ] 		data_in;
	wire [dataLen - 1 : 0 ] 		data_out;
	
	reg weight_wrt;
	reg [weightAddrLen - 1 : 0 ] 	weight_wrt_addr;
	reg [weightAddrLen - 1 : 0 ]	weight_rd_addr;
	reg [dataLen - 1 : 0 ]		weight_in;
	wire [dataLen - 1 : 0 ]		weight_out;
	
	reg gradient_wrt;
	reg [weightAddrLen - 1 : 0 ] 	gradient_wrt_addr;
	reg [weightAddrLen - 1 : 0 ] 	gradient_rd_addr;
	reg [dataLen - 1 : 0 ]		gradient_in;
	wire [dataLen - 1 : 0 ]		gradient_out;
	
	reg meta_wrt;
	reg [metaAddrLen - 1 : 0 ]	meta_wrt_addr;
	reg [metaAddrLen - 1 : 0 ]	meta_rd_addr;
	reg [dataLen - 1 : 0 ]		meta_in;
	wire [dataLen - 1 : 0 ]		meta_out;

	
	pe_namespace
	#(
		.instAddrLen(instAddrLen),
		.dataLen(dataLen),
		.instLen(instLen),	
		.dataAddrLen(dataAddrLen),
		.weightAddrLen(weightAddrLen),
		.metaAddrLen(metaAddrLen)
	)
	pe_namespace_unit(
		.clk(clk),
		.reset(reset),	
		
		.inst_wrt(inst_wrt),
		.inst_in(inst),
		.inst_fifo_full(inst_fifo_full),
	
		.inst_stall(inst_stall),
		
		.inst_out(inst_out),
		.inst_valid(inst_valid),

		.data_wrt(data_wrt),
		.data_wrt_addr(data_wrt_addr),
		.data_rd_addr(data_rd_addr),
		.data_in(data_in),
		.data_out(data_out),
	
		.weight_wrt(weight_wrt),
		.weight_wrt_addr(weight_wrt_addr),
		.weight_rd_addr(weight_rd_addr),
		.weight_in(weight_in),
		.weight_out(weight_out),
		
		.gradient_wrt(gradient_wrt),
		.gradient_wrt_addr(gradient_wrt_addr),
		.gradient_rd_addr(gradient_rd_addr),
		.gradient_in(gradient_in),
		.gradient_out(gradient_out),
	
		.meta_wrt(meta_wrt),
		.meta_wrt_addr(meta_wrt_addr),
		.meta_rd_addr(meta_rd_addr),
		.meta_in(meta_in),
		.meta_out(meta_out)
	);

	initial
	begin
		$dumpfile("hw-imp/bin/waveform/pe_namespace_tb.vcd");
		$dumpvars(0, pe_namespace_tb);
		$monitor(clk, inst_out);
	end

	initial
	begin
		clk = 1;
		reset = 0;
		inst_stall = 0;
		inst_wrt = 0;
		data_wrt = 0;
	#5
		reset = 1;
	#10
		reset = 0;
		inst = 3;
		inst_wrt = 1;
	#10
		reset = 0;
		inst = 321;
		inst_wrt = 1;
		inst_stall = 0;
	#10 
		reset = 0;
		inst = 723;
		inst_wrt = 1;
		inst_stall = 1;
		
	#10
		inst_stall = 0;
		inst_wrt = 0;
		
	#10
		reset = 1;
	
	#10
		reset = 0;
		data_wrt_addr = 6;
		data_in = 10;
		data_wrt = 1;
	#10
		data_wrt = 0;
		data_rd_addr = 6;
		
	#10	
		weight_wrt_addr = 21;
		weight_in = 212;
		weight_wrt = 1;
		
	#10	
		weight_rd_addr = 21;
		weight_wrt = 0;
		
	#10	
		gradient_wrt_addr = 30;
		gradient_in = 3222;
		gradient_wrt = 1;
		
	#10	
		gradient_rd_addr = 30;
		gradient_wrt = 0;
		
	#10	
		meta_wrt_addr = 1;
		meta_in = 13;
		meta_wrt = 1;
		
	#10	
		meta_rd_addr = 1;
		meta_wrt = 0;
		
	#100
		$finish;
	end

	always #1 clk = !clk;
	
endmodule
