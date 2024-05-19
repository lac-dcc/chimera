// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                 Copyright (C) 2008-2010 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module tb_float_step();
	localparam	RATE = 1000.0/200.0;
	
	reg		clk = 1'b1;
	always #(RATE/2.0) clk = ~clk;
	
	reg		reset = 1'b1;
	initial #(RATE*100) reset = 1'b0;
	
	
	initial begin
		$dumpfile("tb_top.vcd");
		$dumpvars(0, tb_float_step);
	
	#10000
		$finish;
	end
	
	function [31:0] double_to_float(input [63:0] in_double);
	begin
		double_to_float[31]    = in_double[63];
		double_to_float[30:23] = in_double[63:52] - 1023 + 127;
		double_to_float[22:0]  = in_double[51:29];
	end
	endfunction
	
	function [63:0] float_to_double(input [31:0] in_float);
	begin
		float_to_double        = 0;
		float_to_double[63]    = in_float[31];
		float_to_double[62:52] = in_float[30:23] - 127 + 1023;
		float_to_double[51:29] = in_float[22:0];
	end
	endfunction
	
	
	reg		[31:0]		param_init;
	reg		[31:0]		param_step;
	reg					set_param = 1'b0;
	reg					increment = 1'b0;
	reg					valid     = 1'b0;
	
	wire	[31:0]		out_data;
	wire				out_valid;
	
	jelly_float_step
		i_float_step
			(
				.clk			(clk),
				.stage_cke		({6{1'b1}}),
				
				.param_init		(param_init),
				.param_step		(param_step),
				
				.set_param		(valid & set_param),
				.increment		(valid & increment),
				
				.out_data		(out_data)
			);
	
	
	initial begin
//		$display("%f %f", 1.0, $bitstoreal(float_to_double(double_to_float($realtobits(1.0)))) );
//		$display("%f %f", 1.2, $bitstoreal(float_to_double(double_to_float($realtobits(1.2)))) );
//		$display("%f %f", 1.3, $bitstoreal(float_to_double(double_to_float($realtobits(1.3)))) );
//		$display("%f %f", -1.4, $bitstoreal(float_to_double(double_to_float($realtobits(-1.4)))) );
		
		#200
		
		@(negedge clk)
			param_init = double_to_float($realtobits(1.25));
			param_step = double_to_float($realtobits(-0.25));
			set_param  = 1'b1;
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			param_init = 32'hxxxx_xxxx;
			param_step = 32'hxxxx_xxxx;
			set_param  = 1'b0;
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			increment  = 1'b1;
			valid      = 1'b1;
			
		@(negedge clk)
			increment  = 1'b1;
			valid      = 1'b1;
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)
		@(negedge clk)

		@(negedge clk)
			increment  = 1'b0;
			valid      = 1'b0;
		
		@(negedge clk)
		@(negedge clk)
		#1000

		$finish;
	end
	
	
	
	always @(posedge clk) begin
		if ( out_valid ) begin
			$display("%f", $bitstoreal(float_to_double(out_data)));
		end
	end
	
	
endmodule


`default_nettype wire


// end of file
