// ---------------------------------------------------------------------------
//
//                                 Copyright (C) 2008-2010 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module tb_gpu_rasteriser();
	localparam	RATE = 1000.0/200.0;
	
	reg		clk = 1'b1;
	always #(RATE/2.0) clk = ~clk;
	
	reg		reset = 1'b1;
	initial #(RATE*100) reset = 1'b0;
	
	
	initial begin
		$dumpfile("tb_gpu_rasteriser.vcd");
		$dumpvars(0, tb_gpu_rasteriser);
	
//	#800000
//		$finish;
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
	
	
	wire	[31:0]		param_float0_init  = double_to_float($realtobits(10.0));
	wire	[31:0]		param_float0_xstep = double_to_float($realtobits(1.25)); 
	wire	[31:0]		param_float0_ystep = double_to_float($realtobits(1.25));

	wire	[31:0]		param_float1_init  = double_to_float($realtobits(10.0));
	wire	[31:0]		param_float1_xstep = double_to_float($realtobits(-1.25)); 
	wire	[31:0]		param_float1_ystep = double_to_float($realtobits(+3.33));

	wire	[31:0]		param_float2_init  = double_to_float($realtobits(-20.0));
	wire	[31:0]		param_float2_xstep = double_to_float($realtobits(-1.25)); 
	wire	[31:0]		param_float2_ystep = double_to_float($realtobits(-5.55));

	wire	[11:0]		m_x;
	wire	[11:0]		m_y;
	wire	[3*32-1:0]	m_fixed_data;
	wire	[3*32-1:0]	m_float_data;
	wire				m_valid;
	reg					m_ready;
	
	
	localparam	X_POS = 180;
	localparam	Y_POS = 98;
	localparam	X_NUM = 328;
	localparam	Y_NUM = 246;
	
	integer		x;
	integer		y;
	reg			valid;
	wire		ready;
	always @(posedge clk) begin
		if ( reset ) begin
			x     <= 0;
			y     <= 0;
			valid <= 0;
		end
		else if (!valid || ready ) begin
			valid <= {$random};
			if ( valid ) begin
				x <= x+1;
				if ( x == X_NUM-1 ) begin
					x <= 0;
					y <= y + 1;
					if ( y == Y_NUM-1 ) begin
						y <= 0;
					end
				end
			end
		end
		
		m_ready <= {$random};
	end
	
	
	jelly_gpu_rasteriser
			#(
				.X_WIDTH			(12),
				.Y_WIDTH			(12),
				
				.EVAL_NUM			(3),
				.EVAL_INT_WIDTH		(28),
				.EVAL_FRAC_WIDTH	(4),
				
				.FIXED_NUM			(3),
				.FIXED_INT_WIDTH	(28),
				.FIXED_FRAC_WIDTH	(4),
				
				.FLOAT_NUM			(3),
				.FLOAT_EXP_WIDTH	(8),
				.FLOAT_FRAC_WIDTH	(23)
			)
		i_gpu_rasteriser
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(1'b1),
				
				.s_param_x_init		(X_POS),
				.s_param_y_init		(Y_POS),
				
				.s_param_eval_init	({32'h010bf7fc, 32'h013a566d, 32'hfec5730a}),
				.s_param_eval_xstep	({ 32'h00000000,  32'hffff0a7f,  32'h0000f581}),
				.s_param_eval_ystep	({-32'h00011734, -32'h00003023, -32'hfffeb8a9}),
//				.s_param_eval_xstep	({32'h00011734, 32'h00003023, 32'hfffeb8a9}),
//				.s_param_eval_ystep	({32'h00000000, 32'hffff0a7f, 32'h0000f581}),
				
				.s_param_fixed_init	({32'h00012a8e, 32'hfffed528, 32'h0000fe57}),
				.s_param_fixed_xstep({32'hffffff17, 32'h000000e9, 32'h00000000}),
				.s_param_fixed_ystep({32'hffffffd3, 32'h00000137, 32'hfffffef7}),
				
				.s_param_float_init	({param_float2_init,  param_float1_init,  param_float0_init }),
				.s_param_float_xstep({param_float2_xstep, param_float1_xstep, param_float0_xstep}),
				.s_param_float_ystep({param_float2_ystep, param_float1_ystep, param_float0_ystep}),
				
				.s_initial			(x==0 && y==0),
				.s_newline			(x==0),
				.s_valid			(valid),
				.s_ready			(ready),
				
				.m_initial			(),
				.m_newline			(),
				.m_x				(m_x),
				.m_y				(m_y),
				.m_fixed_data		(m_fixed_data),
				.m_float_data		(m_float_data),
				.m_valid			(m_valid),
				.m_ready			(m_ready)
			);
	
	wire	signed	[31:0]	m_fixed_r = m_fixed_data[0*32 +: 32];
	wire	signed	[31:0]	m_fixed_g = m_fixed_data[1*32 +: 32];
	wire	signed	[31:0]	m_fixed_b = m_fixed_data[2*32 +: 32];
	
	integer			i;
	integer			fp_img;
	reg		[7:0]	mem_r	[0:640*480-1];
	reg		[7:0]	mem_g	[0:640*480-1];
	reg		[7:0]	mem_b	[0:640*480-1];
	initial begin
		for ( i = 0; i < 640*480; i = i+1 ) begin
			mem_r[i] = 0;
			mem_g[i] = 0;
			mem_b[i] = 0;
		end

	#800000
		fp_img = $fopen("out.ppm", "w");
		$fdisplay(fp_img, "P3");
		$fdisplay(fp_img, "640 480");
		$fdisplay(fp_img, "255");
		for ( i = 0; i < 640*480; i = i+1 ) begin
			$fdisplay(fp_img, "%d %d %d", mem_r[i], mem_g[i], mem_b[i]);
		end
		$fclose(fp_img);
		
		$finish;

	end

	always @(posedge clk) begin
		if ( reset ) begin
		end
		else begin
			if ( m_valid && m_ready ) begin
				mem_r[m_y*640 + m_x] <= m_fixed_r < 0 ? 0 : m_fixed_r > 65535 ? 255 : m_fixed_r[8 +: 8];
				mem_g[m_y*640 + m_x] <= m_fixed_g < 0 ? 0 : m_fixed_g > 65535 ? 255 : m_fixed_g[8 +: 8];
				mem_b[m_y*640 + m_x] <= m_fixed_b < 0 ? 0 : m_fixed_b > 65535 ? 255 : m_fixed_b[8 +: 8];
			end
		end
	end
	
	
	/*
	integer	fp;
	initial begin
		fp = $fopen("output_log.txt", "w");
	end
	
	real	float_data0;
	real	float_data1;
	real	float_data2;
	
	always @(posedge clk) begin
		if ( reset ) begin
		end
		else begin
			if ( m_valid && m_ready ) begin
				float_data0 = $bitstoreal(float_to_double(m_float_data[0*32 +: 32]));
				float_data1 = $bitstoreal(float_to_double(m_float_data[1*32 +: 32]));
				float_data2 = $bitstoreal(float_to_double(m_float_data[2*32 +: 32]));
				
				$fdisplay(fp, "%f %f %f : %d  %d  %d",
								float_data0, float_data1, float_data2,
								m_fixed_data[0*32 +: 32], m_fixed_data[1*32 +: 32], m_fixed_data[2*32 +: 32]);
			end
		end
	end
	*/
	
	/*
	
	always @(posedge clk) begin
		if ( out_valid ) begin
			$display("%f", $bitstoreal(float_to_double(out_data)));
		end
	end
	*/
	
endmodule


`default_nettype wire


// end of file
