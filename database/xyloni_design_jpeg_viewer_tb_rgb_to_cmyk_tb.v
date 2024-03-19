`timescale 1ns/1ns

module yuv_to_rgb_tb();

localparam	COLOR_PRECISION	= 8;

reg		r_arst;
reg		r_sysclk;

reg		[COLOR_PRECISION-1:0]r_R;
reg		[COLOR_PRECISION-1:0]r_G;
reg		[COLOR_PRECISION-1:0]r_B;

wire	[COLOR_PRECISION-1:0]w_C;
wire	[COLOR_PRECISION-1:0]w_M;
wire	[COLOR_PRECISION-1:0]w_Y;
wire	[COLOR_PRECISION-1:0]w_K;

initial
begin
	r_arst	<= 1'b1;
	
	r_R		<= 8'd0;
	r_G		<= 8'd0;
	r_B		<= 8'd0;
	
	#10	r_arst	<= 1'b0;
	#5	r_R		<= 8'd255;
		r_G		<= 8'd255;
		r_B		<= 8'd255;
		//
	#5	r_R		<= 8'd255;
		r_G		<= 8'd0;
		r_B		<= 8'd0;
		//
	#5	r_R		<= 8'd0;
		r_G		<= 8'd255;
		r_B		<= 8'd0;
		//
	#5	r_R		<= 8'd0;
		r_G		<= 8'd0;
		r_B		<= 8'd255;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#2.5	r_sysclk	<= ~r_sysclk;
end

rgb_to_cmyk
#(
	.COLOR_PRECISION(COLOR_PRECISION)
)
inst_rgb_to_cmyk
(
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_R		(r_R),
	.i_G		(r_G),
	.i_B		(r_B),
	.o_C		(w_C),
	.o_M		(w_M),
	.o_Y		(w_Y),
	.o_K		(w_K)
);

endmodule
