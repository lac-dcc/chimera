// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                  Copyright (C) 2015-2018 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_img_mnist_unit();
	localparam RATE = 1000.0/300.0;
	
	initial begin
		$dumpfile("tb_img_mnist_unit.vcd");
		$dumpvars(2, tb_img_mnist_unit);
		
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
	
	
	wire	[USER_WIDTH-1:0]		out_user;
	wire	[1:0]					out_count;
	wire	[3:0]					out_number;
	wire							out_valid;
	
	img_mnist_unit
			#(
				.USER_WIDTH		(USER_WIDTH)
			)
		i_img_mnist_unit
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.in_user		(in_user),
				.in_data		(in_data),
				.in_valid		(in_valid),
				
				.out_user		(out_user),
				.out_count		(out_count),
				.out_number		(out_number),
				.out_valid		(out_valid)
			);
	
	
	wire match = (out_number == out_user) && (out_count > 0);
	
	
endmodule


`default_nettype wire


// end of file
