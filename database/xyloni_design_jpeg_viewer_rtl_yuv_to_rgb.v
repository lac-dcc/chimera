// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module yuv_to_rgb
#(
	parameter	Y_PRECISION	= 8,
	parameter	U_PRECISION	= 8,
	parameter	V_PRECISION	= 8,
	parameter	R_PRECISION	= 8,
	parameter	G_PRECISION	= 8,
	parameter	B_PRECISION	= 8
)
(
	input	i_arst,
	input	i_sysclk,
	
	input	[Y_PRECISION-1:0]i_Y,
	input	[U_PRECISION-1:0]i_U,
	input	[V_PRECISION-1:0]i_V,
	
	output	[R_PRECISION-1:0]o_R,
	output	[G_PRECISION-1:0]o_G,
	output	[B_PRECISION-1:0]o_B
);

/*
Module                                  FFs        ADDs        LUTs      RAMs     MULTs
-------------------------------         ---        ----        ----      ----     -----
yuv_to_rgb:yuv_to_rgb               144(27)     368(83)       48(0)      0(0)      0(0)
+inst_m00:mult(AW=9,BW=11,L=2)       28(28)      49(49)        2(2)      0(0)      0(0)
+inst_m02:mult(AW=9,BW=11,L=2)       19(19)      46(46)        3(3)      0(0)      0(0)
+inst_m11:mult(AW=9,BW=11,L=2)       18(18)      85(85)        7(7)      0(0)      0(0)
+inst_m12:mult(AW=9,BW=11,L=2)       25(25)      75(75)        9(9)      0(0)      0(0)
+inst_m21:mult(AW=9,BW=11,L=2)       27(27)      30(30)      27(27)      0(0)      0(0)

Module                                  FFs        ADDs        LUTs      RAMs     MULTs
-------------------------------         ---        ----        ----      ----     -----
yuv_to_rgb:yuv_to_rgb               144(27)     368(83)       48(0)      0(0)      0(0)
+inst_m11:mult(AW=9,BW=11,L=2)       18(18)      85(85)        7(7)      0(0)      0(0)
+inst_m12:mult(AW=9,BW=11,L=2)       16(16)      58(58)        0(0)      0(0)      0(0)
+inst_m21:mult(AW=9,BW=11,L=2)       26(26)      30(30)        9(9)      0(0)      0(0)
+inst_m00:mult(AW=9,BW=11,L=2)       28(28)      49(49)        2(2)      0(0)      0(0)
+inst_m02:mult(AW=9,BW=11,L=2)       29(29)      63(63)      30(30)      0(0)      0(0)

*/

localparam	c_Y	= 0;
localparam	c_U	= 1;
localparam	c_V	= 2;
localparam	c_R	= 0;
localparam	c_G	= 1;
localparam	c_B	= 2;

localparam	c_Ym_msb	= Y_PRECISION+11;
localparam	c_Um_msb	= U_PRECISION+11;
localparam	c_Vm_msb	= V_PRECISION+11;

wire	[10:0]w_matrix_0P[0:8];
assign	w_matrix_0P[0]=11'd298;assign w_matrix_0P[1]=  11'd000;      assign w_matrix_0P[2]=  11'd409;
assign	w_matrix_0P[3]=11'd298;assign w_matrix_0P[4]=~(11'd100)+1'b1;assign w_matrix_0P[5]=~(11'd208)+1'b1;
assign	w_matrix_0P[6]=11'd298;assign w_matrix_0P[7]=  11'd516;      assign w_matrix_0P[8]=  11'd000;

wire	[Y_PRECISION+11:0]w_m00, w_m10, w_m20;
wire	[U_PRECISION+11:0]w_m01, w_m11, w_m21;
wire	[V_PRECISION+11:0]w_m02, w_m12, w_m22;

wire	[Y_PRECISION+11+1:0]w_R;
wire	[U_PRECISION+11+1:0]w_G;
wire	[V_PRECISION+11+1:0]w_B;

reg		[Y_PRECISION:0]r_c_1P;
reg		[U_PRECISION:0]r_d_1P;
reg		[V_PRECISION:0]r_e_1P;

reg		[Y_PRECISION+11+1-8:0]r_R_4P;
reg		[U_PRECISION+11+1-8:0]r_G_4P;
reg		[V_PRECISION+11+1-8:0]r_B_4P;

reg		[R_PRECISION-1:0]r_R_5P;
reg		[G_PRECISION-1:0]r_G_5P;
reg		[B_PRECISION-1:0]r_B_5P;

reg		[R_PRECISION-1:0]r_R_6P;
reg		[G_PRECISION-1:0]r_G_6P;
reg		[B_PRECISION-1:0]r_B_6P;

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_c_1P	<= {Y_PRECISION+1{1'b0}};
		r_d_1P	<= {U_PRECISION+1{1'b0}};
		r_e_1P	<= {V_PRECISION+1{1'b0}};
	end
	else
	begin
		r_c_1P	<= {1'b0, i_Y}-8'd16;
		r_d_1P	<= {1'b0, i_U}-8'd128;
		r_e_1P	<= {1'b0, i_V}-8'd128;
	end
end

////////////////////////////////////////////////////////////////
//// Synthesis gets Magic
////////////////////////////////////////////////////////////////
assign	w_m10	= w_m00;

mult_a_signed_b_signed
#(
	.A_WIDTH(U_PRECISION+1),
	.B_WIDTH(11),
	.LATENCY(2)
)
inst_m11
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(r_d_1P),
	.b		(w_matrix_0P[4]),
	.o		(w_m11)
);

mult_a_signed_b_signed
#(
	.A_WIDTH(V_PRECISION+1),
	.B_WIDTH(11),
	.LATENCY(2)
)
inst_m12
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(r_e_1P),
	.b		(w_matrix_0P[5]),
	.o		(w_m12)
);
////////////////////////////////////////////////////////////////
assign	w_m20	= w_m00;

mult_a_signed_b_signed
#(
	.A_WIDTH(U_PRECISION+1),
	.B_WIDTH(11),
	.LATENCY(2)
)
inst_m21
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(r_d_1P),
	.b		(w_matrix_0P[7]),
	.o		(w_m21)
);

assign	w_m22	= {V_PRECISION+12{1'b0}};
////////////////////////////////////////////////////////////////
mult_a_signed_b_signed
#(
	.A_WIDTH(Y_PRECISION+1),
	.B_WIDTH(11),
	.LATENCY(2)
)
inst_m00
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(r_c_1P),
	.b		(w_matrix_0P[0]),
	.o		(w_m00)
);

assign	w_m01	= {U_PRECISION+12{1'b0}};

mult_a_signed_b_signed
#(
	.A_WIDTH(V_PRECISION+1),
	.B_WIDTH(11),
	.LATENCY(2)
)
inst_m02
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(r_e_1P),
	.b		(w_matrix_0P[2]),
	.o		(w_m02)
);
////////////////////////////////////////////////////////////////
always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_R_4P	<= {Y_PRECISION+11+1-8{1'b0}};
		r_G_4P	<= {U_PRECISION+11+1-8{1'b0}};
		r_B_4P	<= {V_PRECISION+11+1-8{1'b0}};
		
		r_R_5P	<= {R_PRECISION-1{1'b0}};
		r_G_5P	<= {G_PRECISION-1{1'b0}};
		r_B_5P	<= {B_PRECISION-1{1'b0}};
		
		r_R_6P	<= {R_PRECISION-1{1'b0}};
		r_G_6P	<= {G_PRECISION-1{1'b0}};
		r_B_6P	<= {B_PRECISION-1{1'b0}};
	end
	else
	begin
		r_R_4P	<= w_R[Y_PRECISION+11+1:8];
		r_G_4P	<= w_G[U_PRECISION+11+1:8];
		r_B_4P	<= w_B[V_PRECISION+11+1:8];
		
		if (r_R_4P[c_Ym_msb+1-8])
			r_R_5P	<= {R_PRECISION{1'b0}};
		else if (r_R_4P[c_Ym_msb-8:R_PRECISION] != {(c_Ym_msb+1-8-R_PRECISION){1'b0}})
			r_R_5P	<= {R_PRECISION{1'b1}};
		else
			r_R_5P	<= r_R_4P[R_PRECISION-1:0];
		
		if (r_G_4P[c_Um_msb+1-8])
			r_G_5P	<= {G_PRECISION{1'b0}};
		else if (r_G_4P[c_Um_msb-8:G_PRECISION] != {(c_Um_msb+1-8-G_PRECISION){1'b0}})
			r_G_5P	<= {G_PRECISION{1'b1}};
		else
			r_G_5P	<= r_G_4P[G_PRECISION-1:0];
		
		if (r_B_4P[c_Vm_msb+1-8])
			r_B_5P	<= {B_PRECISION{1'b0}};
		else if (r_B_4P[c_Vm_msb-8:B_PRECISION] != {(c_Vm_msb+1-8-B_PRECISION){1'b0}})
			r_B_5P	<= {B_PRECISION{1'b1}};
		else
			r_B_5P	<= r_B_4P[B_PRECISION-1:0];
		
		r_R_6P	<= r_R_5P;
		r_G_6P	<= r_G_5P;
		r_B_6P	<= r_B_5P;
	end
end

assign	w_R	= {w_m00[c_Ym_msb], w_m00} + {w_m01[c_Um_msb], w_m01} + {w_m02[c_Vm_msb], w_m02} + 8'd128;
assign	w_G	= {w_m10[c_Ym_msb], w_m10} + {w_m11[c_Um_msb], w_m11} + {w_m12[c_Vm_msb], w_m12} + 8'd128;
assign	w_B	= {w_m20[c_Ym_msb], w_m20} + {w_m21[c_Um_msb], w_m21} + {w_m22[c_Vm_msb], w_m22} + 8'd128;

assign	o_R	= r_R_5P;
assign	o_G	= r_G_5P;
assign	o_B	= r_B_5P;

endmodule
