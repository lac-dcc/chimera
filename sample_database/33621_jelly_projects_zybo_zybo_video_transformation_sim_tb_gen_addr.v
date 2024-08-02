// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//
//                                      Copyright (C) 2015 by Ryuz
//                                      https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module tb_gen_addr();
	
	initial begin
		$dumpfile("tb_gen_addr.vcd");
		$dumpvars(0, tb_gen_addr);
	
	#1000000
		$finish;
	end
	
	
	reg		clk = 1'b1;
	always #2.5 clk = ~clk;
	
	reg		reset = 1'b1;
	initial #100 reset = 1'b0;
	
	
	wire				out_frame_start;
	wire				out_line_end;
	wire				out_range_out;
	wire	[9:0]		out_x;
	wire	[9:0]		out_y;
	wire				out_valid;
	
	gen_addr
		i_gen_addr
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(1'b1),
				
				.matrix00		(32'h40000000),
				.matrix01		(32'h00000000),
				.matrix02		(32'hc3a41d8c),
				.matrix10		(32'h3eaaaaa9),
				.matrix11		(32'h3fa646e2),
				.matrix12		(32'hc35296f8),
				.matrix20		(32'h3ab60b5f),
				.matrix21		(32'h80000000),
				.matrix22		(32'h3ed7d979),
				
				.m_frame_start	(out_frame_start),
				.m_line_end		(out_line_end),
				.m_range_out	(out_range_out),
				.m_x			(out_x),
				.m_y			(out_y),
				.m_valid		(out_valid),
				.m_ready		(1'b1)
			);
	
	integer	fp;
	initial fp = $fopen("out.txt", "w");
	always @(posedge clk) begin
		if ( out_valid ) begin
			$fdisplay(fp, "%b %d %d %b %b", out_range_out, out_x, out_y, out_frame_start, out_line_end);
		end
	end
	
	
	
	parameter	EXP_WIDTH   = 8;
	parameter	EXP_OFFSET  = (1 << (EXP_WIDTH-1)) - 1;
	parameter	FRAC_WIDTH  = 23;
	parameter	FLOAT_WIDTH       = 1 + EXP_WIDTH + FRAC_WIDTH;
	
	
	function [FLOAT_WIDTH-1:0] real2float(input real r);
	reg		[63:0]	b;
	begin
		b                                    = $realtobits(r);
		real2float[FLOAT_WIDTH-1]            = b[63];
		real2float[FRAC_WIDTH +: EXP_WIDTH]  = (b[62:52] - 1023) + EXP_OFFSET;
		real2float[0          +: FRAC_WIDTH] = b[51 -: FRAC_WIDTH];
	end
	endfunction
	
	
	function real float2real(input [FLOAT_WIDTH-1:0] f);
	reg		[63:0]	b;
	begin
		b                   = 64'd0;
		b[63]               = f[FLOAT_WIDTH-1];
		b[62:52]            = (f[FRAC_WIDTH +: EXP_WIDTH] - EXP_OFFSET) + 1023;
		if ( f[FRAC_WIDTH +: EXP_WIDTH] == 0 ) b[62:52] = 0;
		b[51 -: FRAC_WIDTH] = f[0 +: FRAC_WIDTH];
		float2real          = $bitstoreal(b);
	end
	endfunction
	
	function real isnan_float(input [FLOAT_WIDTH-1:0] f);
	begin
		isnan_float = ((f[FRAC_WIDTH +: EXP_WIDTH] == {EXP_WIDTH{1'b0}}) || (f[FRAC_WIDTH +: EXP_WIDTH] == {EXP_WIDTH{1'b1}}));
	end
	endfunction
	
	
	real	mul_float00;
	real	mul_float01;
	real	mul_float10;
	real	mul_float11;
	real	mul_float20;
	real	mul_float21;
	real	add0_float0;
	real	add0_float1;
	real	add0_float2;
	real	add1_float0;
	real	add1_float1;
	real	add1_float2;
	real	recip_float0;
	real	recip_float1;
	real	recip_float2;
	real	div_float_x;
	real	div_float_y;
	
//	always @(posedge clk) begin
	always @* begin
		mul_float00 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.mul_float00);
		mul_float01 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.mul_float01);
		mul_float10 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.mul_float10);
		mul_float11 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.mul_float11);
		mul_float20 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.mul_float20);
		mul_float21 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.mul_float21);
		
		add0_float0 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.add0_float0);
		add0_float1 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.add0_float1);
		add0_float2 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.add0_float2);
		add1_float0 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.add1_float0);
		add1_float1 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.add1_float1);
		add1_float2 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.add1_float2);
		
		recip_float0 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.recip_float0);
		recip_float1 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.recip_float1);
		recip_float2 = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.recip_float2);
		
		div_float_x  = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.m_x);
		div_float_y  = float2real(i_gen_addr.i_projective_transformation.i_projective_transformation_float.m_y);
	end
	
	
endmodule


`default_nettype wire


// end of file
