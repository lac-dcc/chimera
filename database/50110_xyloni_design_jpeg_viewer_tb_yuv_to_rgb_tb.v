// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ns

module yuv_to_rgb_tb();

localparam	Y_PRECISION	= 8;
localparam	U_PRECISION	= 8;
localparam	V_PRECISION	= 8;
localparam	R_PRECISION	= 8;
localparam	G_PRECISION	= 8;
localparam	B_PRECISION	= 8;

reg		r_arst;
reg		r_sysclk;

reg		[Y_PRECISION-1:0]r_Y;
reg		[U_PRECISION-1:0]r_U;
reg		[V_PRECISION-1:0]r_V;

wire	[R_PRECISION-1:0]w_R;
wire	[G_PRECISION-1:0]w_G;
wire	[B_PRECISION-1:0]w_B;

/*
Y		U		V		c		d		e		m00		m01		m02		m10		m11		m12		m20		m21		m22		R		G		B
0		0		0		-16		-128	-128	-4768	0		-52352	-4768	12800	26624	-4768	-66048	0		-56992	34784	-70688
																														-222.6	90.8	-276.1
255		255		255		239		127		127		71222	0		51943	71222	-12700	-26416	71222	65532	0		123293	32234	136882
																														481.6	125.9	534.6
*/

initial
begin
	r_arst	<= 1'b1;
	
	r_Y		<= 8'd0;
	r_U		<= 8'd0;
	r_V		<= 8'd0;
	// 0 135 0
	
	#10	r_arst	<= 1'b0;
	#10	r_Y		<= 8'd255;
		r_U		<= 8'd255;
		r_V		<= 8'd255;
		// 255 120 255
	#10	r_Y		<= 8'd76;
		r_U		<= 8'd84;
		r_V		<= 8'd255;
		// 255 0 0
	#10	r_Y		<= 8'd149;
		r_U		<= 8'd43;
		r_V		<= 8'd21;
		// 0 255 0
	#10	r_Y		<= 8'd29;
		r_U		<= 8'd255;
		r_V		<= 8'd107;
		// 0 0 255	
	#10	r_Y		<= 8'd178;
		r_U		<= 8'd171;
		r_V		<= 8'd0;
		// 0 255 255
	#10	r_Y		<= 8'd225;
		r_U		<= 8'd0;
		r_V		<= 8'd148;
		// 255 255 0
end

initial
begin
	r_sysclk	<= 1'b0;
	forever
		#5	r_sysclk	<= ~r_sysclk;
end

yuv_to_rgb
#(
	.Y_PRECISION(Y_PRECISION),
	.U_PRECISION(U_PRECISION),
	.V_PRECISION(V_PRECISION),
	.R_PRECISION(R_PRECISION),
	.G_PRECISION(G_PRECISION),
	.B_PRECISION(B_PRECISION)
)
inst_yuv_to_rgb
(
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_Y		(r_Y),
	.i_U		(r_U),
	.i_V		(r_V),
	.o_R		(w_R),
	.o_G		(w_G),
	.o_B		(w_B)
);

endmodule
