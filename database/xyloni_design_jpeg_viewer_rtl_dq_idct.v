module dq_idct
#(
	parameter	NUM_ACCUMULATOR		= 3,
	parameter	NUM_CHANNEL			= 3,
	parameter	AMPLITUDE_PRECISION	= 16,
	parameter	COLOR_PRECISION		= 8,
	parameter	ZIGZAG_MULTIPLEX	= "SEQUENTIAL",	// TIME
	parameter	YUV_COMPRESSION		= 4,
	
	parameter	DQT_PRECISION		= 8,
	parameter	DQT_BRAM_OUTPUT_REG	= "TRUE",
	parameter	DQT_MIF				= "../mif/wiki_dqt.memh",
	parameter	DQT_MULT_LATENCY	= 0,
	
	parameter	DCT_PRECISION		= 9,
//	parameter	DCT_BRAM_OUTPUT_REG	= "FALSE",
//	parameter	DCT_MIF				= "",
	parameter	DCT_MULT_LATENCY	= 0,
	
	parameter	ACCU_MULT_LATENCY	= 0
)
(
	input	i_arst,
	input	i_sysclk,
	
	input	i_Y_de,
	input	i_U_de,
	input	i_V_de,
	input	[AMPLITUDE_PRECISION-1:0]i_Y_B,
	input	[AMPLITUDE_PRECISION-1:0]i_U_B,
	input	[AMPLITUDE_PRECISION-1:0]i_V_B,
	output	o_Y_re,
	output	o_U_re,
	output	o_V_re,
	
	input	i_Y_lb_full,
	input	i_U_lb_full,
	input	i_V_lb_full,
	output	o_Y_lb_we,
	output	o_U_lb_we,
	output	o_V_lb_we,
	output	[COLOR_PRECISION-1:0]o_Y_lb,
	output	[COLOR_PRECISION-1:0]o_U_lb,
	output	[COLOR_PRECISION-1:0]o_V_lb
);

localparam	c_Y	= 0;
localparam	c_U	= 1;
localparam	c_V = 2;

localparam	s_idle	= 2'b00;
localparam	s_dct	= 2'b01;
localparam	s_flush	= 2'b10;

wire	[1:0]w_YUV_compression;

reg		[1:0]r_DCT_state_1P;
reg		r_load_1P;
reg		r_done_1P;
reg		[NUM_CHANNEL-1:0]	r_re_1P;
reg		[2:0]				r_y_1P, r_x_1P;
reg		[2:0]				r_v_1P, r_u_1P;
reg		[1:0]				r_YUV_cyc_1P;

reg		[NUM_CHANNEL-1:0]r_de_4P;
reg		[COLOR_PRECISION-1:0]r_f_4P[0:NUM_CHANNEL-1];

wire	[NUM_CHANNEL-1:0]			w_de_0P;
wire	[AMPLITUDE_PRECISION-1:0]	w_B_0P[0:NUM_CHANNEL-1];
wire	[2:0]						w_lb_full_0P;

wire	[DCT_PRECISION-1:0]w_dct_u_1P;
wire	[DCT_PRECISION-1:0]w_dct_v_1P;

wire	[DCT_PRECISION*2-1:0]		w_dct_uv_2P;
wire	[DQT_PRECISION-1:0]			w_Q_Y_2P;
wire	[DQT_PRECISION-1:0]			w_Q_C_2P;
wire	[DCT_PRECISION*2+DQT_PRECISION-1:0]w_dq_dct_Y_2P;
wire	[DCT_PRECISION*2+DQT_PRECISION-1:0]w_dq_dct_C_2P;
wire	[DCT_PRECISION*2+DQT_PRECISION-8-1:0]w_dq_dct_Y_div_2P;
wire	[DCT_PRECISION*2+DQT_PRECISION-8-1:0]w_dq_dct_C_div_2P;
wire	[DCT_PRECISION*2+DQT_PRECISION-8-1:0]w_dq_dct_div_2P[0:2];

wire	[NUM_ACCUMULATOR-1:0]w_en_3P;
wire	[COLOR_PRECISION:0]w_f_3P[NUM_CHANNEL-1:0];
wire	[COLOR_PRECISION:0]w_f_sum_3P[NUM_CHANNEL-1:0];

assign	w_de_0P[c_Y]		= i_Y_de;
assign	w_de_0P[c_U]		= i_U_de;
assign	w_de_0P[c_V]		= i_V_de;
assign	w_B_0P[c_Y]			= i_Y_B;
assign	w_B_0P[c_U]			= i_U_B;
assign	w_B_0P[c_V]			= i_V_B;
assign	w_lb_full_0P[c_Y]	= i_Y_lb_full;
assign	w_lb_full_0P[c_U]	= i_U_lb_full;
assign	w_lb_full_0P[c_V]	= i_V_lb_full;
assign	o_Y_re				= r_re_1P[c_Y];
assign	o_U_re				= r_re_1P[c_U];
assign	o_V_re				= r_re_1P[c_V];

assign	o_Y_lb_we			= r_de_4P[c_Y];
assign	o_U_lb_we			= r_de_4P[c_U];
assign	o_V_lb_we			= r_de_4P[c_V];
assign	o_Y_lb				= r_f_4P[c_Y];
assign	o_U_lb				= r_f_4P[c_U];
assign	o_V_lb				= r_f_4P[c_V];

assign	w_YUV_compression	= YUV_COMPRESSION-1'b1;

`ifdef RTL_SIM
initial
begin
	$display("Hihi dq_idct.v");
	$display("YUV_COMPRESSION = %d", YUV_COMPRESSION);
end
`endif

true_dual_port_ram
#(
	.DATA_WIDTH		(DQT_PRECISION),
	.ADDR_WIDTH		(7),
	.WRITE_MODE_1	("READ_FIRST"),
	.WRITE_MODE_2	("READ_FIRST"),
	.OUTPUT_REG_1	(DQT_BRAM_OUTPUT_REG),
	.OUTPUT_REG_2	(DQT_BRAM_OUTPUT_REG),
	.RAM_INIT_FILE	(DQT_MIF),
	.RAM_INIT_RADIX	("HEX")
)
inst_DQT
(
	.we1	(1'b0),
	.we2	(1'b0),
	.clka	(i_sysclk),
	.clkb	(i_sysclk),
	.din1	({DQT_PRECISION{1'b0}}),
	.din2	({DQT_PRECISION{1'b0}}),
	.addr1	({1'b0, r_v_1P, r_u_1P}),
	.addr2	({1'b1, r_v_1P, r_u_1P}),
	.dout1	(w_Q_Y_2P),
	.dout2	(w_Q_C_2P)
);
/*
true_dual_port_ram
#(
	.DATA_WIDTH		(DCT_PRECISION),
	.ADDR_WIDTH		(6),
	.WRITE_MODE_1	("READ_FIRST"),
	.WRITE_MODE_2	("READ_FIRST"),
	.OUTPUT_REG_1	(DCT_BRAM_OUTPUT_REG),
	.OUTPUT_REG_2	(DCT_BRAM_OUTPUT_REG),
	.RAM_INIT_FILE	(DCT_MIF),
	.RAM_INIT_RADIX	("HEX")
)
inst_DCT
(
	.we1	(1'b0),
	.we2	(1'b0),
	.clka	(i_sysclk),
	.clkb	(i_sysclk),
	.din1	({8{1'b0}}),
	.din2	({8{1'b0}}),
	.addr1	({r_x_1P, r_u_1P}),
	.addr2	({r_y_1P, r_v_1P}}),
	.dout1	(w_dct_x_2P),
	.dout2	(w_dct_y_2P)
);

shift_reg
#(
	.D_WIDTH(4*3),
	.TAPE	(1)
)
inst_dct_pipe
(
	.i_arst	(i_arst),
	.i_clk	(i_sysclk),
	.i_d	({r_y_1P, r_x_1P, r_v_1P, r_u_1P}),
	.o_q	({w_y_P, w_x_P, w_v_P, w_u_P})
);
*/
dct
inst_dct_xu
(
	.i_Gxy(r_x_1P),
	.i_Buv(r_u_1P),
	.o_dct(w_dct_u_1P)
);

dct
inst_dct_yv
(
	.i_Gxy(r_y_1P),
	.i_Buv(r_v_1P),
	.o_dct(w_dct_v_1P)
);

mult_a_signed_b_signed
#(
	.A_WIDTH(DCT_PRECISION),
	.B_WIDTH(DCT_PRECISION),
	.LATENCY(1)
)
inst_mult_dct
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(w_dct_u_1P),
	.b		(w_dct_v_1P),
	.o		(w_dct_uv_2P)
);

mult_a_signed_b_signed
#(
	.A_WIDTH(DQT_PRECISION),
	.B_WIDTH(DCT_PRECISION*2),
	.LATENCY(0)
)
inst_mult_dq_dct_Y
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(w_Q_Y_2P),
	.b		(w_dct_uv_2P),
	.o		(w_dq_dct_Y_2P)
);

mult_a_signed_b_signed
#(
	.A_WIDTH(DQT_PRECISION),
	.B_WIDTH(DCT_PRECISION*2),
	.LATENCY(0)
)
inst_mult_dq_dct_C
(
	.arst	(i_arst),
	.clk	(i_sysclk),
	.a		(w_Q_C_2P),
	.b		(w_dct_uv_2P),
	.o		(w_dq_dct_C_2P)
);

assign	w_dq_dct_Y_div_2P	= w_dq_dct_Y_2P[DCT_PRECISION*2+DQT_PRECISION-1:8];
assign	w_dq_dct_C_div_2P	= w_dq_dct_C_2P[DCT_PRECISION*2+DQT_PRECISION-1:8];
assign	w_dq_dct_div_2P[c_Y]= w_dq_dct_Y_div_2P;
assign	w_dq_dct_div_2P[c_U]= w_dq_dct_C_div_2P;
assign	w_dq_dct_div_2P[c_V]= w_dq_dct_C_div_2P;
genvar i;
generate
	for (i=0; i<NUM_ACCUMULATOR; i=i+1)
	begin
		accumulator
		#(
			.A_IN_PRECISION	(AMPLITUDE_PRECISION),
			.B_IN_PRECISION	(DCT_PRECISION*2+DQT_PRECISION-8),
			.O_OUT_PRECISION(COLOR_PRECISION),
			.MULT_LATENCY	(ACCU_MULT_LATENCY)
		)
		inst_accumulator
		(
			.i_arst		(i_arst),
			.i_sysclk	(i_sysclk),
			.i_en		(r_re_1P[i]),
			.i_load		(r_load_1P),
			.i_a		(w_B_0P[i]),
			.i_b		(w_dq_dct_div_2P[i]),
			.o_en		(w_en_3P[i]),
			.o_O		(w_f_3P[i])
		);
		
		assign	w_f_sum_3P[i]	= w_f_3P[i]+8'd128;
		
		always@(posedge i_arst or posedge i_sysclk)
		begin
			if (i_arst)
			begin
				r_de_4P[i]	<= 1'b0;
				r_f_4P[i]	<= {COLOR_PRECISION{1'b0}};
			end
			else
			begin
				r_de_4P[i]	<= 1'b0;
				if (r_done_1P)
				begin
//					r_de_4P[i]	<= 1'b1;
					r_de_4P[i]	<= w_en_3P[i];
					if (w_f_sum_3P[i][COLOR_PRECISION])
					begin
						if (w_f_3P[i][COLOR_PRECISION])
							r_f_4P[i]	<= {COLOR_PRECISION{1'b0}};
						else
							r_f_4P[i]	<= {COLOR_PRECISION{1'b1}};
					end
					else
						r_f_4P[i]	<= w_f_sum_3P[i][COLOR_PRECISION-1:0];
				end
			end
		end
	end
endgenerate

always@(posedge i_arst or posedge i_sysclk)
begin
	if (i_arst)
	begin
		r_DCT_state_1P	<= s_idle;
		r_load_1P		<= 1'b0;
		r_done_1P		<= 1'b0;
		r_re_1P			<= {NUM_CHANNEL{1'b0}};
		r_x_1P			<= {3{1'b0}};
		r_y_1P			<= {3{1'b0}};
		r_u_1P			<= {3{1'b0}};
		r_v_1P			<= {3{1'b0}};
		r_YUV_cyc_1P	<= {2{1'b0}};
	end
	else
	begin
		r_load_1P	<= 1'b0;
		r_done_1P	<= 1'b0;
		
		case (r_DCT_state_1P)
			s_idle:
			begin
				if (w_de_0P == {NUM_CHANNEL{1'b1}} && w_lb_full_0P == {3{1'b0}})
				begin
					r_DCT_state_1P	<= s_dct;
					r_load_1P		<= 1'b1;
					r_re_1P			<= {NUM_CHANNEL{1'b1}};
					r_u_1P			<= r_u_1P+1'b1;
				end
			end
			
			s_dct:
			begin
				r_u_1P	<= r_u_1P+1'b1;
				
				if (r_v_1P == {3{1'b0}} && r_u_1P == {3{1'b0}})
				begin
					r_load_1P	<= 1'b1;
				end
				else if (r_u_1P == {3{1'b1}})
				begin
					r_v_1P	<= r_v_1P+1'b1;
					if (r_v_1P == {3{1'b1}})
					begin
						r_done_1P	<= 1'b1;
						r_x_1P		<= r_x_1P+1'b1;
						if (r_x_1P == {3{1'b1}})
						begin
							r_y_1P	<= r_y_1P+1'b1;
							if (r_y_1P == {3{1'b1}})
							begin
								r_DCT_state_1P	<= s_flush;
							end
						end
					end
				end
			end
			
			s_flush:
			begin
				r_YUV_cyc_1P	<= r_YUV_cyc_1P+1'b1;
				if (r_YUV_cyc_1P == w_YUV_compression)
				begin
					r_DCT_state_1P	<= s_idle;
					r_re_1P			<= {NUM_CHANNEL{1'b0}};
					r_YUV_cyc_1P	<= {2{1'b0}};
				end
				else
				begin
					r_DCT_state_1P		<= s_dct;
					r_load_1P			<= 1'b1;
					r_re_1P[c_V:c_U]	<= {NUM_CHANNEL-1{1'b0}};
					r_u_1P				<= r_u_1P+1'b1;
				end
			end
			
			default:
			begin
				r_DCT_state_1P	<= s_idle;
				r_load_1P		<= 1'b0;
				r_done_1P		<= 1'b0;
				r_re_1P			<= {NUM_CHANNEL{1'b0}};
				r_x_1P			<= {3{1'b0}};
				r_y_1P			<= {3{1'b0}};
				r_u_1P			<= {3{1'b0}};
				r_v_1P			<= {3{1'b0}};
			end
		endcase
	end
end

endmodule
