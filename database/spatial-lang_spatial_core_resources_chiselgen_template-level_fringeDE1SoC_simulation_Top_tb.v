module Top_tb;
	reg clk, reset_n;
	reg [15:0] addr;
	wire [31:0] readdata;
	reg [31:0] writedata;
	reg        write_n;
	reg        chipselect;
	// for streaming
	reg [23:0] 	in_data;
	reg 		in_startofpacket;
	reg 		in_endofpacket;
	reg [1:0] 	in_empty;
	reg 		in_valid;
	reg 		out_ready;
	wire 		in_ready;
	wire [15:0]	out_data;
	wire		out_startofpacket;
	wire		out_endofpacket;	
	wire		out_empty;
	wire		out_valid;

	Top top0 (
		.clock                  		(clk),                    	//   clock_sink.clk
		.reset                  		(reset_n),			//   reset_sink.reset
		.io_S_AVALON_address    		(addr),       			//   avalon_slave.address
		.io_S_AVALON_readdata   		(readdata),      		//  .readdata
		.io_S_AVALON_writedata  		(writedata),     		//  .writedata
		.io_S_AVALON_write_n    		(write_n),       		//  .write_n
		.io_S_AVALON_chipselect 		(chipselect),     		//  .chipselect
		.io_S_STREAM_stream_in_data		(in_data),		  	// input	
		.io_S_STREAM_stream_in_startofpacket   	(in_startofpacket), 		// input	
		.io_S_STREAM_stream_in_endofpacket	(in_endofpacket),		// input
		.io_S_STREAM_stream_in_empty		(in_empty),			// input
		.io_S_STREAM_stream_in_valid		(in_valid),			// input
		.io_S_STREAM_stream_out_ready		(out_ready),			// input
		.io_S_STREAM_stream_in_ready		(in_ready),			// output
		.io_S_STREAM_stream_out_data		(out_data),			// output
		.io_S_STREAM_stream_out_startofpacket	(out_startofpacket),		// output
		.io_S_STREAM_stream_out_endofpacket	(out_endofpacket),		// output
		.io_S_STREAM_stream_out_empty		(out_empty),			// output
		.io_S_STREAM_stream_out_valid		(out_valid)			// output
	);

	initial
	begin
		$dumpfile("test.vcd");
		$dumpvars(0, top0);
		clk = 0;
		// reset. write is flipped... 
		chipselect = 1;
		reset_n = 0;
		write_n = 1;
		#10
		reset_n = 1;
		#10
		reset_n = 0;
		addr = 16'h0;
		#30
		addr = 16'h1;
		#30
		addr = 16'h2;
		#30
		addr = 16'h3;
		#30

		// start a write to the command register
		// prepare data for streaming
		addr = 16'h0;
		in_data = 24'b011001100110011001100110;
		in_startofpacket = 1'b1;
		in_endofpacket = 1'b1;
		in_empty  = 2'b1;
		in_valid = 1'b1;
		out_ready = 1'b1;
	
		// should have: 
		writedata = 32'h1;
		write_n = 1;
		#10
		write_n = 0;
		#10
		write_n = 1;
		#100
//		writedata = 32'hf;
//		addr = 
		$finish;
	end
	always
		#5 clk = !clk;

endmodule
