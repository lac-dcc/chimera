// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License



`timescale 1ns / 1ps
`default_nettype none



module projective_transformation
		#(
			parameter	EXP_WIDTH   = 8,
			parameter	FRAC_WIDTH  = 23,
			parameter	FLOAT_WIDTH = 1 + EXP_WIDTH + FRAC_WIDTH,	// sign + exp + frac
			
			parameter	X_WIDTH     = 12,
			parameter	Y_WIDTH     = 12,
			parameter	S_X_WIDTH   = 10,
			parameter	S_Y_WIDTH   = 10,
			parameter	M_X_WIDTH   = 10,
			parameter	M_Y_WIDTH   = 10,
			parameter	M_X_NUM     = 640,
			parameter	M_Y_NUM     = 480,
			
			parameter	USER_WIDTH  = 0,
			parameter	USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
		)
		(
			input	wire						reset,
			input	wire						clk,
			input	wire						cke,
			
			input	wire	[FLOAT_WIDTH-1:0]	matrix00,
			input	wire	[FLOAT_WIDTH-1:0]	matrix01,
			input	wire	[FLOAT_WIDTH-1:0]	matrix02,
			input	wire	[FLOAT_WIDTH-1:0]	matrix10,
			input	wire	[FLOAT_WIDTH-1:0]	matrix11,
			input	wire	[FLOAT_WIDTH-1:0]	matrix12,
			input	wire	[FLOAT_WIDTH-1:0]	matrix20,
			input	wire	[FLOAT_WIDTH-1:0]	matrix21,
			input	wire	[FLOAT_WIDTH-1:0]	matrix22,
			
			input	wire	[USER_BITS-1:0]		s_user,
			input	wire	[S_X_WIDTH-1:0]		s_x,
			input	wire	[S_Y_WIDTH-1:0]		s_y,
			input	wire						s_valid,
			output	wire						s_ready,
			
			output	wire	[USER_BITS-1:0]		m_user,
			output	wire						m_range_out,
			output	wire	[M_X_WIDTH-1:0]		m_x,
			output	wire	[M_Y_WIDTH-1:0]		m_y,
			output	wire						m_valid,
			input	wire						m_ready
		);
	
	
	// -----------------------------------------
	//  fixed_to_float
	// -----------------------------------------
	
	wire	[USER_BITS-1:0]		in_user;
	wire	[FLOAT_WIDTH-1:0]	in_float_x;
	wire	[FLOAT_WIDTH-1:0]	in_float_y;
	wire						in_valid;
	wire						in_ready;
	
	jelly_fixed_to_float
			#(
				.FIXED_SIGNED		(0),
				.FIXED_INT_WIDTH	(S_X_WIDTH),
				.FIXED_FRAC_WIDTH	(0),
				.FLOAT_EXP_WIDTH	(EXP_WIDTH),
				.FLOAT_FRAC_WIDTH	(FRAC_WIDTH),
				.USER_WIDTH			(USER_BITS)
			)
		i_fixed_to_float_x
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.s_user				(s_user),
				.s_fixed			(s_x),
				.s_valid			(s_valid),
				.s_ready			(s_ready),
				
				.m_user				(in_user),
				.m_float			(in_float_x),
				.m_valid			(in_valid),
				.m_ready			(in_ready)
			);
	
	jelly_fixed_to_float
			#(
				.FIXED_SIGNED		(0),
				.FIXED_INT_WIDTH	(S_Y_WIDTH),
				.FIXED_FRAC_WIDTH	(0),
				.FLOAT_EXP_WIDTH	(EXP_WIDTH),
				.FLOAT_FRAC_WIDTH	(FRAC_WIDTH),
				.USER_WIDTH			(0)
			)
		i_fixed_to_float_y
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.s_user				(s_user),
				.s_fixed			(s_y),
				.s_valid			(s_valid),
				.s_ready			(),
				
				.m_user				(),
				.m_float			(in_float_y),
				.m_valid			(),
				.m_ready			(in_ready)
			);
	
	
	
	// -----------------------------------------
	//  projective_transformation
	// -----------------------------------------
	
	wire	[USER_BITS-1:0]		out_user;
	wire	[FLOAT_WIDTH-1:0]	out_float_x;
	wire	[FLOAT_WIDTH-1:0]	out_float_y;
	wire						out_valid;
	wire						out_ready;
	
	jelly_float_projective_transformation_2d
			#(
				.EXP_WIDTH			(EXP_WIDTH),
				.FRAC_WIDTH			(FRAC_WIDTH),
				.USER_WIDTH			(USER_WIDTH)
			)
		i_float_projective_transformation_2d
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.matrix00			(matrix00),
				.matrix01			(matrix01),
				.matrix02			(matrix02),
				.matrix10			(matrix10),
				.matrix11			(matrix11),
				.matrix12			(matrix12),
				.matrix20			(matrix20),
				.matrix21			(matrix21),
				.matrix22			(matrix22),
				
				.s_user				(in_user),
				.s_x				(in_float_x),
				.s_y				(in_float_y),
				.s_valid			(in_valid),
				.s_ready			(in_ready),
				
				.m_user				(out_user),
				.m_x				(out_float_x),
				.m_y				(out_float_y),
				.m_valid			(out_valid),
				.m_ready			(out_ready)
			);
	
	
	// -----------------------------------------
	//  float_to_fixed
	// -----------------------------------------
	
	wire			[USER_BITS-1:0]		int_user;
	wire	signed	[X_WIDTH-1:0]		int_x;
	wire	signed	[Y_WIDTH-1:0]		int_y;
	wire								int_valid;
	wire								int_ready;
	
	jelly_float_to_fixed
			#(
				.FLOAT_EXP_WIDTH	(EXP_WIDTH),
				.FLOAT_FRAC_WIDTH	(FRAC_WIDTH),
				.FIXED_INT_WIDTH	(X_WIDTH),
				.FIXED_FRAC_WIDTH	(0),
				.USER_WIDTH			(USER_BITS)
			)
		i_float_to_fixed_x
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.s_user				(out_user),
				.s_float			(out_float_x),
				.s_valid			(out_valid),
				.s_ready			(out_ready),
				
				.m_user				(int_user),
				.m_fixed			(int_x),
				.m_valid			(int_valid),
				.m_ready			(int_ready)
			);
	
	jelly_float_to_fixed
			#(
				.FLOAT_EXP_WIDTH	(EXP_WIDTH),
				.FLOAT_FRAC_WIDTH	(FRAC_WIDTH),
				.FIXED_INT_WIDTH	(Y_WIDTH),
				.FIXED_FRAC_WIDTH	(0),
				.USER_WIDTH			(USER_BITS)
			)
		i_float_to_fixed_y
			(
				.reset				(reset),
				.clk				(clk),
				.cke				(cke),
				
				.s_user				(),
				.s_float			(out_float_y),
				.s_valid			(out_valid),
				.s_ready			(),
				
				.m_user				(),
				.m_fixed			(int_y),
				.m_valid			(),
				.m_ready			(int_ready)
			);
	
	// -----------------------------------------
	//  range
	// -----------------------------------------
	
	reg		[USER_BITS-1:0]		reg_user;
	reg							reg_range_out;
	reg		[M_X_WIDTH-1:0]		reg_x;
	reg		[M_Y_WIDTH-1:0]		reg_y;
	reg							reg_valid;
	
	always @(posedge clk) begin
		if ( reset ) begin
			reg_valid <= 1'b0;
		end
		else if ( cke && m_ready ) begin
			reg_valid <= int_valid;
		end
		
		if ( cke && m_ready ) begin
			reg_user      <= int_user;
			reg_range_out <= (int_x < 0 || int_x >= M_X_NUM || int_y < 0 || int_y >= M_Y_NUM);
			reg_x         <= int_x;
			reg_y         <= int_y;
		end
	end
	
	assign int_ready   = m_ready;
	
	assign m_user      = reg_user;
	assign m_range_out = reg_range_out;
	assign m_x         = reg_x;
	assign m_y         = reg_y;
	assign m_valid     = reg_valid;
	
endmodule


`default_nettype wire


// end of file
