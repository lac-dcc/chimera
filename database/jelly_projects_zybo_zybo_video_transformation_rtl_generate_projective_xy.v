

`timescale 1ns / 1ps
`default_nettype none



module generate_projective_xy
		#(
			parameter	EXP_WIDTH   = 8,
			parameter	FRAC_WIDTH  = 23,
			parameter	FLOAT_WIDTH = 1 + EXP_WIDTH + FRAC_WIDTH,	// sign + exp + frac
			
			parameter	DST_X_WIDTH = 10,
			parameter	DST_Y_WIDTH = 10,
			parameter	DST_X_NUM   = 640,
			parameter	DST_Y_NUM   = 480,
			parameter	SRC_X_WIDTH = 10,
			parameter	SRC_Y_WIDTH = 10,
			parameter	SRC_X_NUM   = 640,
			parameter	SRC_Y_NUM   = 480
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
			
			output	wire						m_frame_start,
			output	wire						m_line_end,
			output	wire						m_range_out,
			output	wire	[SRC_X_WIDTH-1:0]	m_x,
			output	wire	[SRC_Y_WIDTH-1:0]	m_y,
			output	wire						m_valid,
			input	wire						m_ready
		);
	
	reg		[DST_X_WIDTH-1:0]		reg_x;
	reg		[DST_Y_WIDTH-1:0]		reg_y;
	reg								reg_frame_start;
	reg								reg_line_end;
	reg		[DST_X_WIDTH-1:0]		reg_valid;
	wire							in_ready;
	
	always @(posedge clk) begin
		if ( reset ) begin
			reg_x            <= {DST_X_WIDTH{1'b0}};
			reg_y            <= {DST_Y_WIDTH{1'b0}};
			reg_frame_start  <= 1'b1;
			reg_line_end     <= 1'b0;
			reg_valid        <= 1'b0;
		end
		else if ( cke ) begin
			if ( reg_valid && in_ready ) begin
				reg_frame_start <= 1'b0;
				reg_x           <= reg_x + 1'b1;
				reg_line_end    <= ((reg_x + 1'b1) == (SRC_X_NUM-1));
				if ( reg_line_end ) begin
					reg_x        <= {DST_X_NUM{1'b0}};
					reg_line_end <= 1'b0;
					
					reg_y        <= reg_y + 1'b1;
					if ( reg_y == (SRC_Y_NUM-1) ) begin
						reg_y            <= {DST_Y_NUM{1'b0}};
						reg_frame_start  <= 1'b1;
					end
				end
			end
			reg_valid        <= 1'b1;
		end
	end
	
	
	projective_transformation
			#(
				.EXP_WIDTH		(EXP_WIDTH),
				.FRAC_WIDTH		(FRAC_WIDTH),
				
				.X_WIDTH		(SRC_X_WIDTH+3),
				.Y_WIDTH		(SRC_Y_WIDTH+3),
				.S_X_WIDTH		(DST_X_WIDTH),
				.S_Y_WIDTH		(DST_Y_WIDTH),
				.M_X_WIDTH		(SRC_X_WIDTH),
				.M_Y_WIDTH		(SRC_Y_WIDTH),
				.M_X_NUM		(SRC_X_NUM),
				.M_Y_NUM		(SRC_Y_NUM),
				
				.USER_WIDTH		(2)
			)
		i_projective_transformation
			(
				.reset			(reset),
				.clk			(clk),
				.cke			(cke),
				
				.matrix00		(matrix00),
				.matrix01		(matrix01),
				.matrix02		(matrix02),
				.matrix10		(matrix10),
				.matrix11		(matrix11),
				.matrix12		(matrix12),
				.matrix20		(matrix20),
				.matrix21		(matrix21),
				.matrix22		(matrix22),
				
				.s_user			({reg_frame_start, reg_line_end}),
				.s_x			(reg_x),
				.s_y			(reg_y),
				.s_valid		(reg_valid),
				.s_ready		(in_ready),
				
				.m_user			({m_frame_start, m_line_end}),
				.m_range_out	(m_range_out),
				.m_x			(m_x),
				.m_y			(m_y),
				.m_valid		(m_valid),
				.m_ready		(m_ready)
			);
		
	
endmodule


`default_nettype wire


// end of file
