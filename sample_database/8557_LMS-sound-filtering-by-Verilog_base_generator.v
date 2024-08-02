// This program was cloned from: https://github.com/maxs-well/LMS-sound-filtering-by-Verilog
// License: GNU General Public License v3.0

/**
	*	@Function	: The basic arithmetic unit multiplication 
		and addition structure of LMS algorithm
	*	@Date		:	2019/07/11
	*	@Vision		:	v1.0
	*	@Note		:	
	*	@Author		:	WoodFan
	*	@param	clk		: fpga main clock
	*	@param	rst_n	: active low reset signal
	*	@param	en		: when en active high, a calculation is performed
	
	*	@param	xin		: input signal
	*	@param	err		: the delta of expect signal - yout
	*	@param	yout	: fir output
	*	@param	wout	: fir coefficient
	*	@param	update	: when update active high, calculation result has been updated
	*
	*	wout(k+1) = wout(k) + xin(k) * err(k)
	*	yout(k)	=	xin(k) * wout(k)
	*/
module base_generator
#(
parameter FPGA_FAMILY = "ALTERA"	,
parameter	X_W	=	16				,
parameter	E_W	=	16				,
parameter	W_W	=	16				
)
(
	input						clk			,
	input						rst_n		,
	input						en			,
	
	input	signed	[X_W-1:0]xin			,
	input	signed	[E_W-1:0]err			,
	output 	   signed  [X_W+W_W-1:0]yout	,
	output reg signed  [W_W-1:0]wout		,
	output	reg			update
);

wire signed [X_W+E_W-1:0]	coef_tmp		;	// xin * err
reg  signed [X_W+E_W:0]	coef_nxt		;	// wout(k+1)
reg  signed [X_W+E_W-1:0]	coef			;	// wout(k)
reg  signed [X_W-1:0]	x_r				;	// Save xin value for later calculation
reg  signed [E_W-1:0]	e_r				;	// Save err value for later calculation
reg	[2:0]			state			;

//因为调用了Altera的IP核，不使用Altera就用*代替
generate if (FPGA_FAMILY == "ALTERA")
begin
mult16 m1(
	.dataa	(x_r),
	.datab	(e_r),
	.result	(coef_tmp)
);

mult16 m2(
	.dataa	(x_r),
	.datab	(wout),
	.result	(yout)
);
end
else
begin
assign coef_tmp = x_r * e_r;
assign yout = x_r * wout;
end
endgenerate

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		state		<=	'd0;
		coef_nxt	<=	'd0;
		coef		<=	'd0;
		wout		<=	'd0;
		update		<=	'd0;
		x_r			<=	'd0;
		e_r			<=	'd0;
	end
	else 
	case (state)
	3'd0: 
	begin
		if (en)
		begin
			state	<=	3'd1;
			x_r	<=	xin	;
			e_r	<=	err	;
		end
		update	<=	1'b0;
	end
	3'd1:
	begin
		coef_nxt	<=	coef_tmp + coef;
		coef	<=	coef_nxt[X_W-1+E_W:0];
		wout	<=	coef_nxt[X_W-1+E_W-:W_W];
		state	<=	3'd0;
		update	<=	1'b1;
	end
	default: state	<=	3'd0;
	endcase
end

endmodule 