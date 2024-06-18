// This program was cloned from: https://github.com/maxs-well/LMS-sound-filtering-by-Verilog
// License: GNU General Public License v3.0

/**
	*	@Function	: 16 order LMS filter
	*	@Date		:	2019/07/11
	*	@Vision		:	v1.0
	*	@Note		:	
	*	@Author		:	WoodFan
	*	@param	clk		: fpga main clock
	*	@param	rst_n	: active low reset signal
	*	@param	en_i	: when en active high, a calculation is performed
	
	*	@param	xin		: input signal
	*	@param	err		: the delta of expect signal - yout
	*	@param	yout	: fir output
	*	@param	xnxt	: Convenient cascade to form a 32 - order filter or more order filter
	*	@param  wout	: FIR coefficient
	*	@param	update	: when update active high, calculation result has been updated
	*
	*	wout(k+1) = wout(k) + xin(k) * err(k)
	*	yout(k)	=	xin(k) * wout(k)
	*/
module lms16_order
#(
parameter FPGA_FAMILY = "ALTERA"		,
parameter	X_W	=	16					,
parameter	E_W	=	16					,
parameter	W_W	=	16					,
parameter	Y_W	=	16		
)
(
	input						clk			,
	input						rst_n		,
	input						en_i		,
	
	input	signed	[X_W-1:0]xin			,
	input	signed	[E_W-1:0]err			,
	output	reg				update			,
	output	signed	[X_W-1:0]xnxt			,		
	output	signed	[W_W*16-1:0]wout		,
	output	signed	[Y_W-1:0]yout		
);
//yout S2R12Q18
reg	signed	[X_W-1:0]		xin_arr		[15:0]	; // delay 16 period
wire signed	[X_W+W_W-1:0]	yout_arr	[15:0]	; // saving the result of base_generator
wire signed	[X_W+W_W+3:0]	yout_exp	[15:0]	; // expand yout_exp
reg							en					; // enable
reg			[ 2:0]			state				; 
reg	signed	[X_W+W_W+3:0]	yout_ori			; // the result of sum
wire		[15:0]			b_update			; // 16 module 's update

assign	yout	=	yout_ori[X_W+W_W-1-:Y_W]	;	//保留初始的符号位
assign	xnxt = xin_arr[15]						;	//为级联

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		xin_arr[0]	<=	'd0;
		xin_arr[1]	<=	'd0;
		xin_arr[2]	<=	'd0;
		xin_arr[3]	<=	'd0;
		xin_arr[4]	<=	'd0;
		xin_arr[5]	<=	'd0;
		xin_arr[6]	<=	'd0;
		xin_arr[7]	<=	'd0;
		xin_arr[8]	<=	'd0;
		xin_arr[9]	<=	'd0;
		xin_arr[10]	<=	'd0;
		xin_arr[11]	<=	'd0;
		xin_arr[12]	<=	'd0;
		xin_arr[13]	<=	'd0;
		xin_arr[14]	<=	'd0;
		xin_arr[15]	<=	'd0;
	end
	else
	begin
		xin_arr[0]	<=	xin;
		xin_arr[1]	<=	xin[0];
		xin_arr[2]	<=	xin[1];
		xin_arr[3]	<=	xin[2];
		xin_arr[4]	<=	xin[3];
		xin_arr[5]	<=	xin[4];
		xin_arr[6]	<=	xin[5];
		xin_arr[7]	<=	xin[6];
		xin_arr[8]	<=	xin[7];
		xin_arr[9]	<=	xin[8];
		xin_arr[10]	<=	xin[9];
		xin_arr[11]	<=	xin[10];
		xin_arr[12]	<=	xin[11];
		xin_arr[13]	<=	xin[12];
		xin_arr[14]	<=	xin[13];
		xin_arr[15]	<=	xin[14];
	end
end

base_generator
#(
.FPGA_FAMILY(FPGA_FAMILY),
.X_W(X_W	)			,
.E_W(E_W	)			,
.W_W(W_W	)			
)
bg_inst
(
	.clk			(clk),
	.rst_n			(rst_n),
	.en				(en),
	
	.xin			(xin),
	.err			(err),
	.yout			(yout_arr[0]),
	.wout			(wout[W_W-1:0]),
	.update			(b_update[0])
);

assign yout_exp[0] = {{4{yout_arr[0][X_W+W_W-1]}}, yout_arr[0]};

genvar i;
generate for (i = 1; i < 16; i = i + 1) begin:order
base_generator 
#(
.FPGA_FAMILY(FPGA_FAMILY),
.X_W(X_W	)			,
.E_W(E_W	)			,
.W_W(W_W	)			
)
bg_inst
(
	.clk			(clk),
	.rst_n			(rst_n),
	.en				(en),
	
	.xin			(xin_arr[i-1]),
	.err			(err),
	.yout			(yout_arr[i]),
	.wout			(wout[(((i+1)*W_W)-1)-:W_W]),
	.update			(b_update[i])
);

assign yout_exp[i] = {{4{yout_arr[i][X_W+W_W-1]}}, yout_arr[i]};

end
endgenerate

always @ (posedge clk or negedge rst_n) 
begin
	if (!rst_n)
	begin
		en		<=	1'b0;
		state	<=	3'd0;
		yout_ori<=	'd0;
		update	<=	1'b0;
	end
	else
	case (state)
	3'd0:
	begin
		if (en_i)
		begin
			en		<=	1'b1;
			state	<=	3'd1;
		end
		update<=	1'b0;	
	end
	3'd1:
	begin
		en	<=	1'b0;
		if (b_update == 16'hffff)
		begin
			yout_ori <=  yout_exp[0] + yout_exp[1] + yout_exp[2] + yout_exp[3] + yout_exp[4] + yout_exp[5] + yout_exp[6] + yout_exp[7] + 
				yout_exp[8] + yout_exp[9] + yout_exp[10] + yout_exp[11] + yout_exp[12] + yout_exp[13] + yout_exp[14] + yout_exp[15];
			state	<=	3'd0;
			update<=	1'b1;
		end
	end
	default: state <= 3'd0;
	endcase
end

endmodule