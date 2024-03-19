// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2018 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_mnist_lut_net();
	localparam RATE = 1000.0/300.0;
	
	initial begin
		$dumpfile("tb_mnist_lut_net.vcd");
		$dumpvars(2, tb_mnist_lut_net);
		
	#20000000
		$finish;
	end
	
	reg		reset = 1'b1;
	initial	#(RATE*100)	reset = 1'b0;
	
	reg		clk = 1'b1;
	always #(RATE/2.0)	clk = ~clk;
	
	wire	cke = 1'b1;
	
	
	
	localparam	FILE_NAME    = "mnist_test.txt";
	localparam	DATA_SIZE    = 10000;
	localparam	USER_WIDTH   = 8;
	localparam	INPUT_WIDTH  = 28*28;
	localparam	OUTPUT_WIDTH = 30;
	
	reg		[USER_WIDTH+INPUT_WIDTH-1:0]	mem		[0:DATA_SIZE-1];
	initial begin
		$readmemb(FILE_NAME, mem);
	end
	
	reg		[28*28-1:0]	input_mem	[0:255];
	reg		[1080-1:0]	lut0_mem	[0:255];
	reg		[180-1:0]	lut1_mem	[0:255];
	reg		[30-1:0]	lut2_mem	[0:255];
	initial begin
		$readmemb("mnist_mpl_mini_input.txt", input_mem);
		$readmemb("mnist_mpl_mini_lut0.txt", lut0_mem);
		$readmemb("mnist_mpl_mini_lut1.txt", lut1_mem);
		$readmemb("mnist_mpl_mini_lut2.txt", lut2_mem);
	end
	
	reg		[180-1:0]	lut1_in_mem	[0:255];
	reg		[180-1:0]	lut1_out_mem	[0:255];
	initial begin
		$readmemb("mnist_mpl_mini_lut1_in.txt", lut1_in_mem);
		$readmemb("mnist_mpl_mini_lut1_out.txt", lut1_out_mem);
	end
	
	wire		[28*28-1:0]	input_sig0 = input_mem[0];
	wire		[1080-1:0]	lut0_sig0  = lut0_mem[0];
	wire		[180-1:0]	lut1_sig0  = lut1_mem[0];
	wire		[30-1:0]	lut2_sig0  = lut2_mem[0];
	
	wire		[180-1:0]	lut1_in_sig0  = lut1_in_mem[0];
	wire		[180-1:0]	lut1_out_sig0  = lut1_out_mem[0];
	
	integer									index = 0;
	wire		[USER_WIDTH-1:0]			in_user;
	wire		[INPUT_WIDTH-1:0]			in_data;
	reg										in_valid = 0;
	
	assign {in_user, in_data} = in_valid ? mem[index] : {(USER_WIDTH+INPUT_WIDTH){1'bx}};
	
	always @(posedge clk) begin
		if ( reset ) begin
			index    <= 0;
			in_valid <= 1'b0;
		end
		else begin
			index    <= index + in_valid;
			in_valid <= 1'b1;
			
			if ( index == DATA_SIZE-1 ) begin
				index <= 0;
			end
		end
	end
	
	
	wire		[USER_WIDTH-1:0]		out_user;
	wire		[OUTPUT_WIDTH-1:0]		out_data;
	wire								out_valid;
	
	mnist_lut_net
			#(
				.USER_WIDTH		(USER_WIDTH)
			)
		i_mnist_lut_net
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_user		(in_user),
				.in_data		(in_data),
				.in_valid		(in_valid),
				
				.out_user		(out_user),
				.out_data		(out_data),
				.out_valid		(out_valid)
			);
	
	
	// sum
	reg		[2*10-1:0]			sum_data;
	reg		[USER_WIDTH-1:0]	sum_user;
	reg							sum_valid;
	always @(posedge clk) begin
		if ( reset ) begin
			sum_user  <= 0;
			sum_valid <= 1'b0;
		end
		else if  ( cke ) begin
			sum_data[0*2 +: 2] <= out_data[20] + out_data[10] + out_data[0];
			sum_data[1*2 +: 2] <= out_data[21] + out_data[11] + out_data[1];
			sum_data[2*2 +: 2] <= out_data[22] + out_data[12] + out_data[2];
			sum_data[3*2 +: 2] <= out_data[23] + out_data[13] + out_data[3];
			sum_data[4*2 +: 2] <= out_data[24] + out_data[14] + out_data[4];
			sum_data[5*2 +: 2] <= out_data[25] + out_data[15] + out_data[5];
			sum_data[6*2 +: 2] <= out_data[26] + out_data[16] + out_data[6];
			sum_data[7*2 +: 2] <= out_data[27] + out_data[17] + out_data[7];
			sum_data[8*2 +: 2] <= out_data[28] + out_data[18] + out_data[8];
			sum_data[9*2 +: 2] <= out_data[29] + out_data[19] + out_data[9];
			
			sum_user    <= out_user;
			sum_valid   <= out_valid;
		end
	end
	
	integer		i;
	integer		max_index;
	integer		max_value;
	always @* begin
		max_index = -1;
		max_value = 0;
		for ( i = 0; i < 10; i = i+1 ) begin
			if ( sum_data[i*2 +: 2] > max_value ) begin
				max_index = i;
				max_value = sum_data[i*2 +: 2];
			end
		end
	end
	
	wire match = (max_index == sum_user);
	
	
endmodule


`default_nettype wire


// end of file
