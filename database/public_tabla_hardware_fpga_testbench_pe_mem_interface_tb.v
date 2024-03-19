module pe_mem_interface_tb(
);

	reg clk;
	reg reset;
	reg pe_namespace_inst_wrt;
	reg [instLen - 1 : 0] pe_namespace_inst;
	wire [instLen - 1 : 0] pe_namespace_inst_out;
	reg pe_core_inst_stall;
	
	reg pe_namespace_data_wrt;
	reg [dataAddrLen - 1 : 0] pe_namespace_data_wrt_addr;
	reg [dataAddrLen - 1 : 0] pe_core_data_rd_addr;
	wire [dataLen - 1 : 0] pe_namespace_data_out;
	
	reg [dataLen - 1 : 0] pe_namespace_data;
	
	wire mem_weight_wrt;
	wire [weightAddrLen - 1 : 0]  mem_weight_wrt_addr;
	
	wire pe_namespace_meta_wrt;
	wire [metaAddrLen - 1 : 0] pe_namespace_meta_wrt_addr;
	

	parameter memIndexLen = 6;
	parameter instAddrLen = 6;
	parameter dataAddrLen = 5;
	parameter weightAddrLen = 5;
	parameter metaAddrLen = 2;
	parameter dataLen = 32;
	parameter instLen = 32;
	parameter logMemNamespaces = 2; //instruction, data, weight, meta

	pe_namespaces#(
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
		
		.inst_wrt(pe_namespace_inst_wrt),
		.inst_in(pe_namespace_inst),
		.inst_fifo_full(pe_namespace_inst_fifo_full),
	
		.inst_stall(pe_core_inst_stall),
		.inst_eol(pe_core_inst_eol),
		
		.inst_out(pe_namespace_inst_out),
		.inst_valid(pe_namespace_inst_valid),

		.data_wrt(pe_namespace_data_wrt),
		.data_wrt_addr(pe_namespace_data_wrt_addr),
		.data_rd_addr(pe_core_data_rd_addr),
		.data_in(pe_namespace_data),
		.data_out(pe_namespace_data_out),
	
		.weight_wrt(pe_namespace_weight_wrt),
		.weight_wrt_addr(pe_namespace_weight_wrt_addr),
		.weight_rd_addr(pe_core_weight_rd_addr),
		.weight_in(pe_namespace_data),
		.weight_out(pe_namespace_weight_out),
		
		.gradient_wrt(pe_core_gradient_wrt),
		.gradient_wrt_addr(pe_core_gradient_wrt_addr),
		.gradient_rd_addr(pe_core_gradient_rd_addr),
		.gradient_in(pe_core_gradient_wrt_data),
		.gradient_out(pe_namespace_gradient_out),
	
		.meta_wrt(pe_namespace_meta_wrt),
		.meta_wrt_addr(pe_namespace_meta_wrt_addr),
		.meta_rd_addr(pe_core_meta_rd_addr),
		.meta_in(pe_namespace_data),
		.meta_out(pe_namespace_meta_out)
	);

	initial
	begin
		$dumpfile("./bin/pe_mem_interface.vcd");
		$dumpvars(0, pe_mem_interface_tb);
		$monitor("clk,pe_namespace_inst_out");
	end

	initial
	begin
		clk = 0;
		reset = 0;
		pe_core_inst_stall = 1;
		pe_namespace_inst_wrt = 0;
		pe_namespace_data_wrt = 0;
		pe_core_data_rd_addr = 1;
	#5
		reset = 1;
	#10
		reset = 0;
		pe_namespace_inst = 3;
		pe_namespace_inst_wrt = 1;
	#20
		pe_namespace_inst_wrt = 0;
		pe_core_inst_stall = 0;
	#20 
		pe_core_inst_stall = 1;
	#50
		pe_namespace_data_wrt_addr = 4;
		pe_namespace_data = 10;
		pe_namespace_data_wrt = 1;
	#20
		pe_namespace_data_wrt = 0;
	#10
		pe_core_data_rd_addr = 4;
		
		
	#100
		$finish;
	end

	always
	begin
		#5 clk = !clk;
	end
endmodule