`define VESA_1280X720_60FPS
`include "vesa_parameter.vh"

module vga_controller
#(
	parameter	VESA_STD	= "VESA_1280X720_60FPS",
	parameter	R_DEPTH		= 6,
	parameter	G_DEPTH		= 6,
	parameter	B_DEPTH		= 6
)
(
	input	i_arst,
	input	i_pclk,
	
	input	i_vs,
	input	i_hs,
	input	i_de,
	input	[R_DEPTH-1:0]i_r,
	input	[G_DEPTH-1:0]i_g,
	input	[B_DEPTH-1:0]i_b,
	
	output	o_vga_vs,
	output	o_vga_hs,
	output	o_vga_de,
	output	[R_DEPTH-1:0]o_vga_r,
	output	[G_DEPTH-1:0]o_vga_g,
	output	[B_DEPTH-1:0]o_vga_b
);

localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;
wire	c_act_de_por;
wire	c_ina_de_por;

reg		r_vs_1P;
reg		r_hs_1P;
reg		r_de_r_1P;
reg		r_de_g_1P;
reg		r_de_b_1P;
reg		[R_DEPTH-1:0]r_r_1P;
reg		[G_DEPTH-1:0]r_g_1P;
reg		[B_DEPTH-1:0]r_b_1P;

reg		r_vs_2P;
reg		r_hs_2P;
reg		r_de_2P;
reg		[R_DEPTH-1:0]r_r_2P;
reg		[G_DEPTH-1:0]r_g_2P;
reg		[B_DEPTH-1:0]r_b_2P;

generate
	if (HOR_SYNC_POLARITY == "NEGATIVE")
	begin
		assign	c_act_hs_por	= 1'b0;
		assign	c_ina_hs_por	= 1'b1;
	end
	else
	begin
		assign	c_act_hs_por	= 1'b1;
		assign	c_ina_hs_por	= 1'b0;
	end
	
	if (VER_SYNC_POLARITY == "NEGATIVE")
	begin
		assign	c_act_vs_por	= 1'b0;
		assign	c_ina_vs_por	= 1'b1;
	end
	else
	begin
		assign	c_act_vs_por	= 1'b1;
		assign	c_ina_vs_por	= 1'b0;
	end
endgenerate

assign	c_act_de_por	= 1'b1;
assign	c_ina_de_por	= 1'b0;

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_vs_1P		<= c_ina_vs_por;
		r_hs_1P		<= c_ina_hs_por;
		r_de_r_1P	<= c_ina_de_por;
		r_de_g_1P	<= c_ina_de_por;
		r_de_b_1P	<= c_ina_de_por;
		r_r_1P		<= {R_DEPTH{1'b0}};
		r_g_1P		<= {G_DEPTH{1'b0}};
		r_b_1P		<= {B_DEPTH{1'b0}};
		
		r_vs_2P		<= c_ina_vs_por;
		r_hs_2P		<= c_ina_hs_por;
		r_de_2P		<= c_ina_de_por;
		r_r_2P		<= {R_DEPTH{1'b0}};
		r_g_2P		<= {G_DEPTH{1'b0}};
		r_b_2P		<= {B_DEPTH{1'b0}};
	end
	else
	begin
		r_vs_1P		<= i_vs;
		r_hs_1P		<= i_hs;
		r_de_r_1P	<= i_de;
		r_de_g_1P	<= i_de;
		r_de_b_1P	<= i_de;
		r_r_1P		<= i_r;
		r_g_1P		<= i_g;
		r_b_1P		<= i_b;
		
		r_vs_2P		<= r_vs_1P;
		r_hs_2P		<= r_hs_1P;
		r_de_2P		<= r_de_r_1P;
		if (r_de_r_1P)
			r_r_2P		<= r_r_1P;
		else
			r_r_2P		<= {R_DEPTH{1'b0}};
		if (r_de_g_1P)
			r_g_2P		<= r_g_1P;
		else
			r_g_2P		<= {G_DEPTH{1'b0}};
		if (r_de_b_1P)
			r_b_2P		<= r_b_1P;
		else
			r_b_2P		<= {B_DEPTH{1'b0}};
	end
end

assign	o_vga_vs	= r_vs_2P;
assign	o_vga_hs	= r_hs_2P;
assign	o_vga_de	= r_de_2P;
assign	o_vga_r		= r_r_2P;
assign	o_vga_g		= r_g_2P;
assign	o_vga_b		= r_b_2P;

endmodule
