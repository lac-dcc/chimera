`define VESA_1280X720_60FPS
`include "vesa_parameter.vh"

module line_buffer
#(
	parameter	VESA_STD		= "VESA_1280X720_60FPS",
	parameter	Y_DEPTH			= 8,
	parameter	U_DEPTH			= 8,
	parameter	V_DEPTH			= 8,
	
	parameter	X_LSB_CNT_WIDTH	= 5,
	parameter	X_MSB_CNT_WIDTH	= 6
)
(
	input	i_arst,
	input	i_pclk,
	
	input	i_vsync,
	input	i_hsync,
	input	i_de,
	input	[Y_DEPTH-1:0]i_y,
	input	[U_DEPTH-1:0]i_u,
	input	[V_DEPTH-1:0]i_v,
	
	output	o_vsync,
	output	o_hsync,
	output	o_de,
	output	[Y_DEPTH-1:0]o_y_11,
	output	[U_DEPTH-1:0]o_u_11,
	output	[V_DEPTH-1:0]o_v_11,

	output	[Y_DEPTH-1:0]o_y_00,
	output	[U_DEPTH-1:0]o_u_00,
	output	[V_DEPTH-1:0]o_v_00,
	
	output	[Y_DEPTH-1:0]o_y_01,
	output	[U_DEPTH-1:0]o_u_01,
	output	[V_DEPTH-1:0]o_v_01,
	
	output	[X_MSB_CNT_WIDTH+X_LSB_CNT_WIDTH-1:0]o_x
);

localparam	HOR_SYNC_POLARITY	= `HOR_SYNC_POLARITY;
localparam	VER_SYNC_POLARITY	= `VER_SYNC_POLARITY;
wire	c_act_vs_por;
wire	c_ina_vs_por;
wire	c_act_hs_por;
wire	c_ina_hs_por;
wire	c_act_de_por;
wire	c_ina_de_por;

reg		r_vsync_1P;
reg		r_hsync1_1P;
reg		r_hsync2_1P;
reg		r_de_1P;
reg		[Y_DEPTH-1:0]r_y_1P;
reg		[Y_DEPTH-1:0]r_u_1P;
reg		[Y_DEPTH-1:0]r_v_1P;
reg		[X_LSB_CNT_WIDTH-1:0]r_addr1_lsb_1P;
reg		[X_MSB_CNT_WIDTH-1:0]r_addr1_msb_1P;
reg		r_addr1_sel_1P;
reg		[X_LSB_CNT_WIDTH-1:0]r_addr2_lsb_1P;
reg		[X_MSB_CNT_WIDTH-1:0]r_addr2_msb_1P;
reg		r_addr2_sel_1P;

reg		r_vsync_2P;
reg		r_hsync1_2P;
reg		r_hsync2_2P;
reg		r_de_2P;
reg		[Y_DEPTH-1:0]r_y_01_2P;
reg		[U_DEPTH-1:0]r_u_01_2P;
reg		[V_DEPTH-1:0]r_v_01_2P;
reg		[X_LSB_CNT_WIDTH-1:0]r_addr2_lsb_2P;
reg		[X_MSB_CNT_WIDTH-1:0]r_addr2_msb_2P;

wire	[Y_DEPTH-1:0]w_y_11_2P;
wire	[U_DEPTH-1:0]w_u_11_2P;
wire	[V_DEPTH-1:0]w_v_11_2P;

wire	[Y_DEPTH-1:0]w_y_00_2P;
wire	[U_DEPTH-1:0]w_u_00_2P;
wire	[V_DEPTH-1:0]w_v_00_2P;

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

true_dual_port_ram
#(
	.DATA_WIDTH(Y_DEPTH),
	.ADDR_WIDTH(12),
	.WRITE_MODE_1("READ_FIRST"),
	.WRITE_MODE_2("READ_FIRST"),
	.OUTPUT_REG_1("FALSE"),
	.OUTPUT_REG_2("FALSE"),
	.RAM_INIT_FILE(""),
	.RAM_INIT_RADIX("HEX")
)
inst_y_buffer
(
	.we1(1'b1),
	.clka(i_pclk),
	.din1(r_y_1P),
	.addr1({r_addr1_sel_1P, r_addr1_msb_1P, r_addr1_lsb_1P}),
	.dout1(w_y_11_2P),
	
	.we2(1'b0),
	.clkb(i_pclk),
	.din2(r_y_1P),
	.addr2({r_addr2_sel_1P, r_addr2_msb_1P, r_addr2_lsb_1P}),
	.dout2(w_y_00_2P)
);
/*
true_dual_port_ram
#(
	.DATA_WIDTH(U_DEPTH),
	.ADDR_WIDTH(11),
	.WRITE_MODE_1("READ_FIRST"),
	.WRITE_MODE_2("READ_FIRST"),
	.OUTPUT_REG_1("FALSE"),
	.OUTPUT_REG_2("FALSE"),
	.RAM_INIT_FILE("")
)
inst_u_buffer
(
	.we1(1'b1),
	.clka(i_pclk),
	.din1(r_u_1P),
	.addr1({r_addr1_sel_1P, r_addr1_msb_1P, r_addr1_lsb_1P}),
	.dout1(w_u_11_2P),
	
	.we2(1'b0),
	.clkb(i_pclk),
	.din2(r_u_1P),
	.addr2({r_addr2_sel_1P, r_addr2_msb_1P, r_addr2_lsb_1P}),
	.dout2(w_u_00_2P)
);

true_dual_port_ram
#(
	.DATA_WIDTH(V_DEPTH),
	.ADDR_WIDTH(11),
	.WRITE_MODE_1("READ_FIRST"),
	.WRITE_MODE_2("READ_FIRST"),
	.OUTPUT_REG_1("FALSE"),
	.OUTPUT_REG_2("FALSE"),
	.RAM_INIT_FILE("")
)
inst_v_buffer
(
	.we1(1'b1),
	.clka(i_pclk),
	.din1(r_v_1P),
	.addr1({r_addr1_sel_1P, r_addr1_msb_1P, r_addr1_lsb_1P}),
	.dout1(w_u_11_2P),
	
	.we2(1'b0),
	.clkb(i_pclk),
	.din2(r_u_1P),
	.addr2({r_addr2_sel_1P, r_addr2_msb_1P, r_addr2_lsb_1P}),
	.dout2(w_u_00_2P)
);
*/
assign	w_u_11_2P[U_DEPTH-1]	= 1'b1;
assign	w_u_11_2P[U_DEPTH-2:0]	= {U_DEPTH-1{1'b0}};
assign	w_v_11_2P[V_DEPTH-1]	= 1'b1;
assign	w_v_11_2P[V_DEPTH-2:0]	= {U_DEPTH-1{1'b0}};
assign	w_u_00_2P[U_DEPTH-1]	= 1'b1;
assign	w_u_00_2P[U_DEPTH-2:0]	= {U_DEPTH-1{1'b0}};
assign	w_v_00_2P[V_DEPTH-1]	= 1'b1;
assign	w_v_00_2P[V_DEPTH-2:0]	= {U_DEPTH-1{1'b0}};

always@(posedge i_arst or posedge i_pclk)
begin
	if (i_arst)
	begin
		r_vsync_1P		<= c_ina_vs_por;
		r_hsync1_1P		<= c_ina_hs_por;
		r_hsync2_1P		<= c_ina_hs_por;
		r_de_1P			<= c_ina_de_por;
		r_y_1P			<= {Y_DEPTH{1'b0}};
		r_u_1P			<= {U_DEPTH{1'b0}};
		r_v_1P			<= {V_DEPTH{1'b0}};
		r_addr1_lsb_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
		r_addr1_msb_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
		r_addr1_sel_1P	<= 1'b0;
		r_addr2_lsb_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
		r_addr2_msb_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
		r_addr2_sel_1P	<= 1'b1;
		
		r_vsync_2P		<= c_ina_vs_por;
		r_hsync1_2P		<= c_ina_hs_por;
		r_hsync2_2P		<= c_ina_hs_por;
		r_de_2P			<= c_ina_de_por;
		r_y_01_2P		<= {Y_DEPTH{1'b0}};
		r_u_01_2P		<= {U_DEPTH{1'b0}};
		r_v_01_2P		<= {V_DEPTH{1'b0}};
	end
	else
	begin
		r_vsync_1P		<= i_vsync;
		r_hsync1_1P		<= i_hsync;
		r_hsync2_1P		<= i_hsync;
		r_de_1P			<= i_de;
		r_y_1P			<= i_y;
		r_u_1P			<= i_u;
		r_v_1P			<= i_v;
		
		r_addr1_lsb_1P	<= r_addr1_lsb_1P+1'b1;
		r_addr2_lsb_1P	<= r_addr2_lsb_1P+1'b1;

		if (r_addr1_lsb_1P == {X_LSB_CNT_WIDTH{1'b1}})
			r_addr1_msb_1P	<= r_addr1_msb_1P+1'b1;
		
		if (r_addr2_lsb_1P == {X_LSB_CNT_WIDTH{1'b1}})
			r_addr2_msb_1P	<= r_addr2_msb_1P+1'b1;
		
		if (r_hsync1_1P && ~r_hsync1_2P)
		begin
			r_addr1_lsb_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
			r_addr1_msb_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
			r_addr1_sel_1P	<= ~r_addr1_sel_1P;
		end
		
		if (r_hsync2_1P && ~r_hsync2_2P)
		begin
			r_addr2_lsb_1P	<= {X_LSB_CNT_WIDTH{1'b0}};
			r_addr2_msb_1P	<= {X_MSB_CNT_WIDTH{1'b0}};
			r_addr2_sel_1P	<= ~r_addr2_sel_1P;
		end
		
		r_vsync_2P		<= r_vsync_1P;
		r_hsync1_2P		<= r_hsync1_1P;
		r_hsync2_2P		<= r_hsync2_1P;
		r_de_2P			<= r_de_1P;
		r_y_01_2P		<= r_y_1P;
		r_u_01_2P		<= r_u_1P;
		r_v_01_2P		<= r_v_1P;
		
		r_addr2_lsb_2P	<= r_addr2_lsb_1P;
		r_addr2_msb_2P	<= r_addr2_msb_1P;
	end
end

assign	o_vsync	= r_vsync_2P;
assign	o_hsync	= r_hsync2_2P;
assign	o_de	= r_de_2P;
assign	o_y_11	= w_y_11_2P;
assign	o_u_11	= w_u_11_2P;
assign	o_v_11	= w_v_11_2P;
assign	o_y_00	= w_y_00_2P;
assign	o_u_00	= w_u_00_2P;
assign	o_v_00	= w_v_00_2P;
assign	o_y_01	= r_y_01_2P;
assign	o_u_01	= r_u_01_2P;
assign	o_v_01	= r_v_01_2P;
assign	o_x		= {r_addr2_msb_2P, r_addr2_lsb_2P};

endmodule
