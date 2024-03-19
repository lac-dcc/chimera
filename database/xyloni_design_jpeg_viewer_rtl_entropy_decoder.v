module entropy_decoder
#(
	parameter	AMPLITUDE_PRECISION	= 16,
	parameter	MCU_SIZE			= 64,
	parameter	YUV_COMPRESSION		= 4,
	parameter	DHT_BST_MIF			= "../mif/mspaint/mspaint_dht_bst.memh",
	parameter	Y_DC_CW_MIF			= "../mif/t8/mspaint_y_dc_codeword.memb",
	parameter	Y_AC_CW_MIF			= "../mif/mspaint/mspaint_y_ac_codeword.memb",
	parameter	Y_S1_MIF			= "../mif/mspaint/mspaint_y_symobl1.memh",
	parameter	C_DC_CW_MIF			= "../mif/t8/mspaint_y_dc_codeword.memb",
	parameter	C_AC_CW_MIF			= "../mif/mspaint/mspaint_c_ac_codeword.memb",
	parameter	C_S1_MIF			= "../mif/mspaint/mspaint_c_symbol1.memh"
)
(
	input	i_arst,
	input	i_srst,
	input	i_sysclk,
`ifdef DBG_MODE
	output	[2:0]o_scan_state,
`endif
	input	i_scan_en,
	input	i_ecs_bit,
	input	i_Y_dq_ready,
	input	i_U_dq_ready,
	input	i_V_dq_ready,
	output	o_ed_ready,
	output	o_Y_de,
	output	o_U_de,
	output	o_V_de,
	output	[AMPLITUDE_PRECISION-1:0]o_Y_B,
	output	[AMPLITUDE_PRECISION-1:0]o_U_B,
	output	[AMPLITUDE_PRECISION-1:0]o_V_B
);

localparam	scan_Cb			= 1'b0;
localparam	scan_Cr			= 1'b1;

localparam	Li_id_bit		= 5;
localparam	Li_Y			= 1'b0;
localparam	Li_C			= 1'b1;
localparam	Li_class_bit	= 4;
localparam	Li_DC			= 1'b0;
localparam	Li_AC			= 1'b1;

localparam	c_Y				= 0;
localparam	c_U				= 1;
localparam	c_V				= 2;

localparam	CW_EOB			= 8'h00;
localparam	CW_ZRL			= 8'hF0;

localparam	s_shift_codeword	= 3'b000;
localparam	s_search_codeword	= 3'b001;
localparam	s_ram_flush			= 3'b010;
localparam	s_shift_amplitude	= 3'b011;
localparam	s_wait_eob			= 3'b100;
localparam	s_wait_amp			= 3'b101;

reg		[2:0]r_scan_state_1P;
reg		r_ed_ready_1P;
reg		[15:0]r_ecs_1P;
reg		[5:0]r_DHT_BST_lu_1P;
reg		[3:0]r_code_len_cnt_1P;
reg		[7:0]r_code_len_total_cnt_1P;
reg		[7:0]r_codeword_lu_1P;
reg		[2:0]r_Y_sub_sample_1P;
reg		[6:0]r_run_cnt_1P;
reg		r_CbCr_1P;
reg		r_neg_1P;

reg		r_Y_dq_ready_1P;
reg		r_Y_de_1P;
reg		r_Y_eob_1P;
reg		[3:0]r_Y_runlength_1P;
reg		[15:0]r_Y_B_1P;
reg		[15:0]r_Y_DC_1P;
reg		r_U_dq_ready_1P;
reg		r_U_de_1P;
reg		r_U_eob_1P;
reg		[3:0]r_U_runlength_1P;
reg		[15:0]r_U_B_1P;
reg		[15:0]r_U_DC_1P;
reg		r_V_dq_ready_1P;
reg		r_V_de_1P;
reg		r_V_eob_1P;
reg		[3:0]r_V_runlength_1P;
reg		[15:0]r_V_B_1P;
reg		[15:0]r_V_DC_1P;

reg		[3:0]r_runlength_3P;
reg		[3:0]r_size_3P;

wire	[3:0]w_code_len_2P;
wire	[7:0]w_code_len_total_2P;
wire	[15:0]w_Y_DC_codeword_2P;
wire	[15:0]w_Y_AC_codeword_2P;
wire	[15:0]w_C_DC_codeword_2P;
wire	[15:0]w_C_AC_codeword_2P;
wire	[15:0]w_codeword_2P;

wire	[7:0]w_Y_DC_symbol1_2P;
wire	[7:0]w_Y_AC_symbol1_2P;
wire	[7:0]w_C_DC_symbol1_2P;
wire	[7:0]w_C_AC_symbol1_2P;
wire	[3:0]w_Y_DC_runlength_2P;
wire	[3:0]w_Y_AC_runlength_2P;
wire	[3:0]w_C_DC_runlength_2P;
wire	[3:0]w_C_AC_runlength_2P;
wire	[3:0]w_runlength_2P;
wire	[3:0]w_Y_DC_size_2P;
wire	[3:0]w_Y_AC_size_2P;
wire	[3:0]w_C_DC_size_2P;
wire	[3:0]w_C_AC_size_2P;
wire	[3:0]w_size_2P;

wire	[7:0]w_Y_DC_symbol1_3P;
wire	[7:0]w_Y_AC_symbol1_3P;
wire	[7:0]w_C_DC_symbol1_3P;
wire	[7:0]w_C_AC_symbol1_3P;

wire	w_code_match_1P;

wire	[2:0]w_dq_ready_0P;
wire	[2:0]w_sr_ready_1P;
wire	[2:0]w_sr_de_1P;
wire	[2:0]w_sr_eob_1P;
wire	[3:0]w_sr_runlength_1P[2:0];
wire	[AMPLITUDE_PRECISION-1:0]w_sr_B_1P[2:0];
wire	[5:0]w_Y_run_cnt_2P;
wire	[5:0]w_U_run_cnt_2P;
wire	[5:0]w_V_run_cnt_2P;

wire	[2:0]w_sr_de_2P;
wire	[5:0]w_sr_run_cnt_2P[2:0];
wire	[AMPLITUDE_PRECISION-1:0]w_sr_B_2P[2:0];

wire	[2:0]w_YUV_compression;
wire	[6:0]w_mcu_size;
assign	w_YUV_compression	= YUV_COMPRESSION-1'b1;
assign	w_mcu_size			= MCU_SIZE;

`ifdef RTL_SIM
reg		r_dbg_Y_eob;
reg		r_dbg_U_eob;
reg		r_dbg_V_eob;

wire	[15:0]w_sim_ecs_1P;
wire	[15:0]w_sim_codeword_2P;
`endif

simple_dual_port_ram
#(
	.DATA_WIDTH		(12),
	.ADDR_WIDTH		(6),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(DHT_BST_MIF),
	.RAM_INIT_RADIX	("HEX")
)
inst_DHT_BST
(
	.wdata	({12{1'b0}}),
	.waddr	({6{1'b0}}),
	.raddr	(r_DHT_BST_lu_1P),
	.we		(1'b0),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	({w_code_len_2P, w_code_len_total_2P})
);

simple_dual_port_ram
#(
	.DATA_WIDTH		(16),
	.ADDR_WIDTH		(8),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(Y_DC_CW_MIF),
	.RAM_INIT_RADIX	("BIN")
)
inst_DC_codeword
(
	.wdata	({16{1'b0}}),
	.waddr	({8{1'b0}}),
	.raddr	({r_DHT_BST_lu_1P[Li_id_bit], r_codeword_lu_1P[6:0]}),
	.we		(1'b0),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(w_Y_DC_codeword_2P)
);
assign	w_C_DC_codeword_2P	= w_Y_DC_codeword_2P;
/*
simple_dual_port_ram
#(
	.DATA_WIDTH		(16),
	.ADDR_WIDTH		(8),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(Y_DC_CW_MIF),
	.RAM_INIT_RADIX	("BIN")
)
inst_Y_DC_codeword
(
	.wdata	({16{1'b0}}),
	.waddr	({8{1'b0}}),
	.raddr	(r_codeword_lu_1P),
	.we		(1'b0),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(w_Y_DC_codeword_2P)
);
*/
simple_dual_port_ram
#(
	.DATA_WIDTH		(16),
	.ADDR_WIDTH		(8),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(Y_AC_CW_MIF),
	.RAM_INIT_RADIX	("BIN")
)
inst_Y_AC_codeword
(
	.wdata	({16{1'b0}}),
	.waddr	({8{1'b0}}),
	.raddr	(r_codeword_lu_1P),
	.we		(1'b0),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(w_Y_AC_codeword_2P)
);
/*
simple_dual_port_ram
#(
	.DATA_WIDTH		(16),
	.ADDR_WIDTH		(8),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(C_DC_CW_MIF),
	.RAM_INIT_RADIX	("BIN")
)
inst_C_DC_codeword
(
	.wdata	({16{1'b0}}),
	.waddr	({8{1'b0}}),
	.raddr	(r_codeword_lu_1P),
	.we		(1'b0),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(w_C_DC_codeword_2P)
);
*/
simple_dual_port_ram
#(
	.DATA_WIDTH		(16),
	.ADDR_WIDTH		(8),
	.OUTPUT_REG		("FALSE"),
	.RAM_INIT_FILE	(C_AC_CW_MIF),
	.RAM_INIT_RADIX	("BIN")
)
inst_C_AC_codeword
(
	.wdata	({16{1'b0}}),
	.waddr	({8{1'b0}}),
	.raddr	(r_codeword_lu_1P),
	.we		(1'b0),
	.wclk	(i_sysclk),
	.re		(1'b1),
	.rclk	(i_sysclk),
	.rdata	(w_C_AC_codeword_2P)
);

true_dual_port_ram
#(
	.DATA_WIDTH		(8),
	.ADDR_WIDTH		(9),
	.WRITE_MODE_1	("READ_FIRST"),
	.WRITE_MODE_2	("READ_FIRST"),
	.OUTPUT_REG_1	("FALSE"),
	.OUTPUT_REG_2	("FALSE"),
	.RAM_INIT_FILE	(Y_S1_MIF),
	.RAM_INIT_RADIX	("HEX")
)
inst_Y_symbol1
(
	.we1	(1'b0),
	.we2	(1'b0),
	.clka	(i_sysclk),
	.clkb	(i_sysclk),
	.din1	({8{1'b0}}),
	.din2	({8{1'b0}}),
	.addr1	({1'b0, r_codeword_lu_1P}),
	.addr2	({1'b1, r_codeword_lu_1P}),
	.dout1	(w_Y_DC_symbol1_2P),
	.dout2	(w_Y_AC_symbol1_2P)
);
assign	w_Y_DC_runlength_2P	= w_Y_DC_symbol1_2P[7:4];
assign	w_Y_DC_size_2P		= w_Y_DC_symbol1_2P[3:0];
assign	w_Y_AC_runlength_2P	= w_Y_AC_symbol1_2P[7:4];
assign	w_Y_AC_size_2P		= w_Y_AC_symbol1_2P[3:0];
assign	w_Y_DC_symbol1_3P	= {r_runlength_3P, r_size_3P};
assign	w_Y_AC_symbol1_3P	= {r_runlength_3P, r_size_3P};
assign	w_C_DC_symbol1_3P	= {r_runlength_3P, r_size_3P};
assign	w_C_AC_symbol1_3P	= {r_runlength_3P, r_size_3P};

true_dual_port_ram
#(
	.DATA_WIDTH		(8),
	.ADDR_WIDTH		(9),
	.WRITE_MODE_1	("READ_FIRST"),
	.WRITE_MODE_2	("READ_FIRST"),
	.OUTPUT_REG_1	("FALSE"),
	.OUTPUT_REG_2	("FALSE"),
	.RAM_INIT_FILE	(C_S1_MIF),
	.RAM_INIT_RADIX	("HEX")
)
inst_C_symbol1
(
	.we1	(1'b0),
	.we2	(1'b0),
	.clka	(i_sysclk),
	.clkb	(i_sysclk),
	.din1	({8{1'b0}}),
	.din2	({8{1'b0}}),
	.addr1	({1'b0, r_codeword_lu_1P}),
	.addr2	({1'b1, r_codeword_lu_1P}),
	.dout1	(w_C_DC_symbol1_2P),
	.dout2	(w_C_AC_symbol1_2P)
);
assign	w_C_DC_runlength_2P	= w_C_DC_symbol1_2P[7:4];
assign	w_C_DC_size_2P		= w_C_DC_symbol1_2P[3:0];
assign	w_C_AC_runlength_2P	= w_C_AC_symbol1_2P[7:4];
assign	w_C_AC_size_2P		= w_C_AC_symbol1_2P[3:0];

always@(posedge i_sysclk)
begin
	if (i_srst)
	begin
		r_scan_state_1P			<= s_shift_codeword;
		r_ed_ready_1P			<= 1'b1;
		r_ecs_1P				<= {16{1'b0}};
		r_DHT_BST_lu_1P			<= {6{1'b0}};
		r_code_len_cnt_1P		<= {4{1'b0}};
		r_code_len_total_cnt_1P	<= {8{1'b0}};
		r_codeword_lu_1P		<= {8{1'b0}};
		r_Y_sub_sample_1P		<= {3{1'b0}};
		r_CbCr_1P				<= scan_Cb;
		r_neg_1P				<= 1'b0;
		r_run_cnt_1P			<= {7{1'b0}};
		
		r_Y_dq_ready_1P			<= 1'b1;
		r_Y_de_1P				<= 1'b0;
		r_Y_eob_1P				<= 1'b0;
		r_Y_runlength_1P		<= {4{1'b0}};
		r_Y_B_1P				<= {16{1'b0}};
		r_Y_DC_1P				<= {16{1'b0}};
		r_U_dq_ready_1P			<= 1'b1;
		r_U_de_1P				<= 1'b0;
		r_U_eob_1P				<= 1'b0;
		r_U_runlength_1P		<= {4{1'b0}};
		r_U_B_1P				<= {16{1'b0}};
		r_U_DC_1P				<= {16{1'b0}};
		r_V_dq_ready_1P			<= 1'b1;
		r_V_de_1P				<= 1'b0;
		r_V_eob_1P				<= 1'b0;
		r_V_runlength_1P		<= {4{1'b0}};
		r_V_B_1P				<= {16{1'b0}};
		r_V_DC_1P				<= {16{1'b0}};
		
		r_runlength_3P			<= {4{1'b0}};
		r_size_3P				<= {4{1'b0}};
		
`ifdef RTL_SIM
		r_dbg_Y_eob				<= 1'b0;
		r_dbg_U_eob				<= 1'b0;
		r_dbg_V_eob				<= 1'b0;
`endif
	end
	else
	begin
		if (w_sr_ready_1P[c_Y])
		begin
			r_Y_de_1P		<= 1'b0;
			r_Y_eob_1P		<= 1'b0;
			r_Y_dq_ready_1P	<= 1'b1;
			`ifdef RTL_SIM
				r_dbg_Y_eob	<= 1'b0;
			`endif
		end
		if (w_sr_ready_1P[c_U])
		begin
			r_U_de_1P		<= 1'b0;
			r_U_eob_1P		<= 1'b0;
			r_U_dq_ready_1P	<= 1'b1;
			`ifdef RTL_SIM
				r_dbg_U_eob	<= 1'b0;
			`endif
		end
		if (w_sr_ready_1P[c_V])
		begin
			r_V_de_1P		<= 1'b0;
			r_V_eob_1P		<= 1'b0;
			r_V_dq_ready_1P	<= 1'b1;
			`ifdef RTL_SIM
				r_dbg_V_eob	<= 1'b0;
			`endif
		end
		
		case (r_scan_state_1P)
			s_shift_codeword:
			begin
				r_ed_ready_1P	<= 1'b1;
				if (i_scan_en)
				begin
					r_ecs_1P		<= {r_ecs_1P[14:0], i_ecs_bit};
					
					r_code_len_cnt_1P	<= r_code_len_cnt_1P+1'b1;
					if (r_code_len_cnt_1P == w_code_len_2P)
					begin
						r_scan_state_1P			<= s_search_codeword;
						r_ed_ready_1P			<= 1'b0;
						r_code_len_total_cnt_1P	<= r_code_len_total_cnt_1P+1'b1;
						r_codeword_lu_1P		<= r_codeword_lu_1P+1'b1;
					end
				end
			end
			
			s_search_codeword:
			begin
				r_code_len_total_cnt_1P	<= r_code_len_total_cnt_1P+1'b1;
				r_codeword_lu_1P		<= r_codeword_lu_1P+1'b1;
				
				r_runlength_3P			<= w_runlength_2P;
				r_size_3P				<= w_size_2P;
				if (w_code_match_1P)
				begin
					r_scan_state_1P			<= s_shift_amplitude;
					r_ed_ready_1P			<= 1'b1;
					r_ecs_1P				<= {16{1'b0}};
					r_DHT_BST_lu_1P[3:0]	<= {4{1'b0}};
					r_code_len_cnt_1P		<= 4'd1;
					r_code_len_total_cnt_1P	<= {8{1'b0}};
					r_run_cnt_1P			<= r_run_cnt_1P+w_runlength_2P+1'b1;
					
					if ({r_DHT_BST_lu_1P[5], r_CbCr_1P} == {Li_C, scan_Cr})
					begin
						if ((r_DHT_BST_lu_1P[4] == Li_AC) &&
							((w_C_AC_symbol1_2P == CW_EOB) || (w_C_AC_symbol1_2P == CW_ZRL)))
						begin
							r_ed_ready_1P	<= 1'b0;
							if (r_V_dq_ready_1P)
							begin
//								$timeformat(-9, 0, " ns", 8);
//								$display("%t debug_0: r_DHT_BST_lu_1P[5:4]=%b%b w_C_AC_symbol1_2P=%h r_CbCr_1P=%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4], w_C_AC_symbol1_2P, r_CbCr_1P);
								r_scan_state_1P		<= s_ram_flush;
								r_code_len_cnt_1P	<= {4{1'b0}};
								r_codeword_lu_1P	<= {4{1'b0}};
								r_V_dq_ready_1P		<= 1'b0;
								if (w_C_AC_symbol1_2P == CW_ZRL)
								begin
									r_V_de_1P			<= 1'b1;
									r_V_B_1P			<= {16{1'b0}};
									r_V_runlength_1P	<= 4'd15;
								end
								else
								begin
									r_DHT_BST_lu_1P[5:4]<= {Li_Y, Li_DC};
									r_run_cnt_1P		<= {7{1'b0}};
									r_CbCr_1P			<= scan_Cb;
									r_V_eob_1P			<= 1'b1;
									`ifdef RTL_SIM
										r_dbg_V_eob		<= 1'b1;
									`endif
								end
							end
							else
							begin
								r_scan_state_1P		<= s_wait_eob;
							end
						end
						else if ((r_DHT_BST_lu_1P[4] == Li_DC) && (w_C_DC_symbol1_2P == CW_EOB))
						begin
							r_ed_ready_1P	<= 1'b0;
							if (r_V_dq_ready_1P)
							begin
//								$timeformat(-9, 0, " ns", 8);
//								$display("%t debug_2: r_DHT_BST_lu_1P[5:4]=%b%b w_C_DC_symbol1_2P=%h r_CbCr_1P=%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4], w_C_DC_symbol1_2P, r_CbCr_1P);
								r_scan_state_1P		<= s_ram_flush;
								r_DHT_BST_lu_1P[4]	<= Li_AC;
								r_code_len_cnt_1P	<= {4{1'b0}};
								r_codeword_lu_1P	<= {4{1'b0}};
								r_V_dq_ready_1P		<= 1'b0;
								r_V_de_1P			<= 1'b1;
								r_V_runlength_1P	<= {4{1'b0}};
								r_V_B_1P			<= r_V_DC_1P;
								`ifdef RTL_SIM
									r_dbg_V_eob		<= 1'b1;
								`endif
							end
							else
							begin
								r_scan_state_1P		<= s_wait_eob;
							end
						end
					end
					else if ({r_DHT_BST_lu_1P[5], r_CbCr_1P} == {Li_C, scan_Cb})
					begin
						if ((r_DHT_BST_lu_1P[4] == Li_AC) &&
							((w_C_AC_symbol1_2P == CW_EOB) || (w_C_AC_symbol1_2P == CW_ZRL)))
						begin
							r_ed_ready_1P	<= 1'b0;
							if (r_U_dq_ready_1P)
							begin
//								$timeformat(-9, 0, " ns", 8);
//								$display("%t debug_1: r_DHT_BST_lu_1P[5:4]=%b%b w_C_AC_symbol1_2P=%h r_CbCr_1P=%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4], w_C_AC_symbol1_2P, r_CbCr_1P);
								r_scan_state_1P		<= s_ram_flush;
								r_code_len_cnt_1P	<= {4{1'b0}};
								r_codeword_lu_1P	<= {4{1'b0}};
								r_U_dq_ready_1P		<= 1'b0;
								if (w_C_AC_symbol1_2P == CW_ZRL)
								begin
									r_U_de_1P			<= 1'b1;
									r_U_B_1P			<= {16{1'b0}};
									r_U_runlength_1P	<= 4'd15;
								end
								else
								begin
									r_DHT_BST_lu_1P[4]	<= Li_DC;
									r_run_cnt_1P		<= {7{1'b0}};
									r_CbCr_1P			<= scan_Cr;
									r_U_eob_1P			<= 1'b1;
									`ifdef RTL_SIM
										r_dbg_U_eob		<= 1'b1;
									`endif
								end
							end
							else
							begin
								r_scan_state_1P	<= s_wait_eob;
							end
						end
						else if ((r_DHT_BST_lu_1P[4] == Li_DC) && (w_C_DC_symbol1_2P == CW_EOB))
						begin
							r_ed_ready_1P	<= 1'b0;
							if (r_U_dq_ready_1P)
							begin
//								$timeformat(-9, 0, " ns", 8);
//								$display("%t debug_3: r_DHT_BST_lu_1P[5:4]=%b%b w_C_DC_symbol1_2P=%h r_CbCr_1P=%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4], w_C_DC_symbol1_2P, r_CbCr_1P);
								r_scan_state_1P		<= s_ram_flush;
								r_DHT_BST_lu_1P[4]	<= Li_AC;
								r_code_len_cnt_1P	<= {4{1'b0}};
								r_codeword_lu_1P	<= {4{1'b0}};
								r_U_dq_ready_1P		<= 1'b0;
								r_U_de_1P			<= 1'b1;
								r_U_runlength_1P	<= {4{1'b0}};
								r_U_B_1P			<= r_U_DC_1P;
								`ifdef RTL_SIM
									r_dbg_U_eob		<= 1'b1;
								`endif
							end
							else
							begin
								r_scan_state_1P		<= s_wait_eob;
							end
						end
					end
					else
					begin
						if (r_DHT_BST_lu_1P[4])
						begin
							if ((w_Y_AC_symbol1_2P == CW_EOB) || w_Y_AC_symbol1_2P == CW_ZRL)
							begin
								r_ed_ready_1P	<= 1'b0;
								if (r_Y_dq_ready_1P)
								begin
//									$timeformat(-9, 0, " ns", 8);
//									$display("%t debug_4: r_DHT_BST_lu_1P[5:4]=%b%b w_Y_AC_symbol1_2P=%h r_CbCr_1P=%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4], w_Y_AC_symbol1_2P, r_CbCr_1P);
									r_scan_state_1P		<= s_ram_flush;
									r_code_len_cnt_1P	<= {4{1'b0}};
									r_codeword_lu_1P	<= {4{1'b0}};
									r_Y_dq_ready_1P		<= 1'b0;
									if (w_Y_AC_symbol1_2P == CW_ZRL)
									begin
										r_Y_de_1P			<= 1'b1;
										r_Y_B_1P			<= {16{1'b0}};
										r_Y_runlength_1P	<= 4'd15;
									end
									else
									begin
										r_Y_sub_sample_1P	<= r_Y_sub_sample_1P+1'b1;
										r_DHT_BST_lu_1P[4]	<= Li_DC;
										r_run_cnt_1P		<= {7{1'b0}};
										if (r_Y_sub_sample_1P == w_YUV_compression)
										begin
											r_DHT_BST_lu_1P[5]	<= Li_C;
											r_Y_sub_sample_1P	<= {3{1'b0}};
										end
										r_Y_eob_1P			<= 1'b1;
										`ifdef RTL_SIM
											r_dbg_Y_eob		<= 1'b1;
										`endif
									end
								end
								else
								begin
									r_scan_state_1P		<= s_wait_eob;
								end
							end
						end
						else if ((r_DHT_BST_lu_1P[4] == Li_DC) && (w_Y_DC_symbol1_2P == CW_EOB))
						begin
							r_ed_ready_1P			<= 1'b0;
							if (r_Y_dq_ready_1P)
							begin
//								$timeformat(-9, 0, " ns", 8);
//								$display("%t debug_5: r_DHT_BST_lu_1P[5:4]=%b%b w_Y_DC_symbol1_2P=%h r_CbCr_1P=%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4], w_Y_DC_symbol1_2P, r_CbCr_1P);
								r_scan_state_1P		<= s_ram_flush;
								r_DHT_BST_lu_1P[4]	<= Li_AC;
								r_code_len_cnt_1P	<= {4{1'b0}};
								r_codeword_lu_1P	<= {4{1'b0}};
								r_Y_dq_ready_1P		<= 1'b0;
								r_Y_de_1P			<= 1'b1;
								r_Y_runlength_1P	<= {4{1'b0}};
								r_Y_B_1P			<= r_Y_DC_1P;
								`ifdef RTL_SIM
									r_dbg_Y_eob		<= 1'b1;
								`endif
							end
							else
							begin
								r_scan_state_1P		<= s_wait_eob;
							end
						end
					end
				end
				else if (r_code_len_total_cnt_1P == w_code_len_total_2P)
				begin
//					$timeformat(-9, 0, " ns", 8);
//					$display("%t debug_6: r_DHT_BST_lu_1P[5:4]=%b%b", $time, r_DHT_BST_lu_1P[5], r_DHT_BST_lu_1P[4]);
					r_scan_state_1P			<= s_ram_flush;
					r_DHT_BST_lu_1P[3:0]	<= r_DHT_BST_lu_1P[3:0]+1'b1;
					r_code_len_total_cnt_1P	<= {8{1'b0}};
					r_codeword_lu_1P		<= r_codeword_lu_1P;	
				end
			end
			
			s_ram_flush:
			begin
				r_scan_state_1P	<= s_shift_codeword;
				r_ed_ready_1P	<= 1'b1;
			end
			
			s_shift_amplitude:
			begin
				if (i_scan_en)
				begin
					if (r_ed_ready_1P)
					begin
						r_ecs_1P	<= {r_ecs_1P[14:0], i_ecs_bit};
						
						if (r_code_len_cnt_1P == 4'd1)
						begin
							r_neg_1P	<= ~i_ecs_bit;
//							r_ecs_1P	<= {{15{1'b1}}, i_ecs_bit};
							r_ecs_1P	<= {{15{~i_ecs_bit}}, i_ecs_bit};
						end
					end
					
					if (r_code_len_cnt_1P != r_size_3P)
					begin
						r_code_len_cnt_1P	<= r_code_len_cnt_1P+1'b1;
//						r_ecs_1P			<= {r_ecs_1P[14:0], i_ecs_bit};
					end
					else
						r_ed_ready_1P	<= 1'b0;
				end
					
				if (~r_ed_ready_1P)
				begin
					if (r_DHT_BST_lu_1P[Li_id_bit])
					begin
						if (r_CbCr_1P == scan_Cr)
						begin
							if (r_V_dq_ready_1P)
							begin
								r_scan_state_1P		<= s_ram_flush;
								r_ecs_1P			<= {16{1'b0}};
								if (r_run_cnt_1P == w_mcu_size)
								begin
									r_DHT_BST_lu_1P[5:4]	<= {Li_Y, Li_DC};
									r_run_cnt_1P			<= {7{1'b0}};
									r_CbCr_1P				<= scan_Cb;
								end
								else if (r_DHT_BST_lu_1P[4] == Li_DC)
									r_DHT_BST_lu_1P[4]	<= Li_AC;
								
								r_code_len_cnt_1P	<= {4{1'b0}};
								r_codeword_lu_1P	<= {4{1'b0}};
								
								r_V_dq_ready_1P		<= 1'b0;
								r_V_de_1P			<= 1'b1;
								r_V_runlength_1P	<= r_runlength_3P;
								
								if (r_neg_1P)
								begin
									if (r_DHT_BST_lu_1P[4] == Li_DC)
									begin
										r_V_B_1P	<= r_ecs_1P+1'b1+r_V_DC_1P;
										r_V_DC_1P	<= r_ecs_1P+1'b1+r_V_DC_1P;
									end
									else
										r_V_B_1P	<= r_ecs_1P+1'b1;
								end
								else if (r_DHT_BST_lu_1P[4] == Li_DC)
								begin
									r_V_B_1P	<= r_ecs_1P+r_V_DC_1P;
									r_V_DC_1P	<= r_ecs_1P+r_V_DC_1P;
								end
								else
									r_V_B_1P	<= r_ecs_1P;
								r_neg_1P	<= 1'b0;
							end
							else
							begin
								r_scan_state_1P		<= s_wait_amp;
							end
						end
						else if (r_U_dq_ready_1P)
						begin
							r_scan_state_1P		<= s_ram_flush;
							r_ecs_1P			<= {16{1'b0}};
							if (r_run_cnt_1P == w_mcu_size)
							begin
								r_DHT_BST_lu_1P[4]	<= Li_DC;
								r_run_cnt_1P		<= {7{1'b0}};
								r_CbCr_1P			<= scan_Cr;
							end
							else if (r_DHT_BST_lu_1P[4] == Li_DC)
								r_DHT_BST_lu_1P[4]	<= Li_AC;
							
							r_code_len_cnt_1P	<= {4{1'b0}};
							r_codeword_lu_1P	<= {4{1'b0}};
							
							r_U_dq_ready_1P		<= 1'b0;
							r_U_de_1P			<= 1'b1;
							r_U_runlength_1P	<= r_runlength_3P;
							
							if (r_neg_1P)
							begin
								if (r_DHT_BST_lu_1P[4] == Li_DC)
								begin
									r_U_B_1P	<= r_ecs_1P+1'b1+r_U_DC_1P;
									r_U_DC_1P	<= r_ecs_1P+1'b1+r_U_DC_1P;
								end
								else
									r_U_B_1P	<= r_ecs_1P+1'b1;
							end
							else if (r_DHT_BST_lu_1P[4] == Li_DC)
							begin
								r_U_B_1P	<= r_ecs_1P+r_U_DC_1P;
								r_U_DC_1P	<= r_ecs_1P+r_U_DC_1P;
							end
							else
								r_U_B_1P	<= r_ecs_1P;
							r_neg_1P	<= 1'b0;
						end
						else
						begin
							r_scan_state_1P		<= s_wait_amp;
						end
					end
					else if (r_Y_dq_ready_1P)
					begin
						r_scan_state_1P		<= s_ram_flush;
						r_ecs_1P			<= {16{1'b0}};
						if (r_run_cnt_1P == w_mcu_size)
						begin
							r_Y_sub_sample_1P	<= r_Y_sub_sample_1P+1'b1;
							r_DHT_BST_lu_1P[4]	<= Li_DC;
							r_run_cnt_1P		<= {7{1'b0}};
							if (r_Y_sub_sample_1P == w_YUV_compression)
							begin
								r_DHT_BST_lu_1P[5]		<= Li_C;
								r_Y_sub_sample_1P		<= {3{1'b0}};
							end
						end
						else if (r_DHT_BST_lu_1P[4] == Li_DC)
							r_DHT_BST_lu_1P[4]	<= Li_AC;
						
						r_code_len_cnt_1P	<= {4{1'b0}};
						r_codeword_lu_1P	<= {4{1'b0}};
						
						r_Y_dq_ready_1P		<= 1'b0;
						r_Y_de_1P			<= 1'b1;
							r_Y_runlength_1P	<= r_runlength_3P;
						
						if (r_neg_1P)
						begin
							if (r_DHT_BST_lu_1P[4] == Li_DC)
							begin
								r_Y_B_1P	<= r_ecs_1P+1'b1+r_Y_DC_1P;
								r_Y_DC_1P	<= r_ecs_1P+1'b1+r_Y_DC_1P;
							end
							else
								r_Y_B_1P	<= r_ecs_1P+1'b1;
						end
						else if (r_DHT_BST_lu_1P[4] == Li_DC)
						begin
							r_Y_B_1P	<= r_ecs_1P+r_Y_DC_1P;
							r_Y_DC_1P	<= r_ecs_1P+r_Y_DC_1P;
						end
						else
							r_Y_B_1P	<= r_ecs_1P;
						r_neg_1P	<= 1'b0;
					end
					else
					begin
						r_scan_state_1P		<= s_wait_amp;
					end
				end
			end
			
			s_wait_eob:
			begin
				if ({r_DHT_BST_lu_1P[5], r_CbCr_1P} == {Li_C, scan_Cr})
				begin
					if (r_V_dq_ready_1P)
					begin
						if ((r_DHT_BST_lu_1P[4] == Li_AC) &&
							((w_C_AC_symbol1_3P == CW_EOB) || (w_C_AC_symbol1_3P == CW_ZRL)))
						begin
							r_scan_state_1P		<= s_ram_flush;
							r_code_len_cnt_1P	<= {4{1'b0}};
							r_codeword_lu_1P	<= {4{1'b0}};
							r_V_dq_ready_1P		<= 1'b0;
							if (w_C_AC_symbol1_3P == CW_ZRL)
							begin
								r_V_de_1P			<= 1'b1;
								r_V_B_1P			<= {16{1'b0}};
								r_V_runlength_1P	<= 4'd15;
							end
							else
							begin
								r_DHT_BST_lu_1P[5:4]<= {Li_Y, Li_DC};
								r_run_cnt_1P		<= {7{1'b0}};
								r_CbCr_1P			<= scan_Cb;
								r_V_eob_1P			<= 1'b1;
								`ifdef RTL_SIM
									r_dbg_V_eob		<= 1'b1;
								`endif
							end
						end
						else if ((r_DHT_BST_lu_1P[4] == Li_DC) && (w_C_DC_symbol1_3P == CW_EOB))
						begin
							r_scan_state_1P		<= s_ram_flush;
							r_DHT_BST_lu_1P[4]	<= Li_AC;
							r_code_len_cnt_1P	<= {4{1'b0}};
							r_codeword_lu_1P	<= {4{1'b0}};
							r_V_dq_ready_1P		<= 1'b0;
							r_V_de_1P			<= 1'b1;
							r_V_runlength_1P	<= {4{1'b0}};
							r_V_B_1P			<= r_V_DC_1P;
							`ifdef RTL_SIM
								r_dbg_V_eob		<= 1'b1;
							`endif
						end
					end
				end
				else if ({r_DHT_BST_lu_1P[5], r_CbCr_1P} == {Li_C, scan_Cb})
				begin
					if (r_U_dq_ready_1P)
					begin
						if ((r_DHT_BST_lu_1P[4] == Li_AC) &&
							((w_C_AC_symbol1_3P == CW_EOB) || (w_C_AC_symbol1_3P == CW_ZRL)))
						begin
							r_scan_state_1P		<= s_ram_flush;
							r_code_len_cnt_1P	<= {4{1'b0}};
							r_codeword_lu_1P	<= {4{1'b0}};
							r_U_dq_ready_1P		<= 1'b0;
							if (w_C_AC_symbol1_3P == CW_ZRL)
							begin
								r_U_de_1P			<= 1'b1;
								r_U_B_1P			<= {16{1'b0}};
								r_U_runlength_1P	<= 4'd15;
							end
							else
							begin
								r_DHT_BST_lu_1P[4]	<= Li_DC;
								r_run_cnt_1P		<= {7{1'b0}};
								r_CbCr_1P			<= scan_Cr;
								r_U_eob_1P			<= 1'b1;
								`ifdef RTL_SIM
									r_dbg_U_eob		<= 1'b1;
								`endif
							end
						end
						else if ((r_DHT_BST_lu_1P[4] == Li_DC) && (w_C_DC_symbol1_3P == CW_EOB))
						begin
							r_scan_state_1P		<= s_ram_flush;
							r_DHT_BST_lu_1P[4]	<= Li_AC;
							r_code_len_cnt_1P	<= {4{1'b0}};
							r_codeword_lu_1P	<= {4{1'b0}};
							r_U_dq_ready_1P		<= 1'b0;
							r_U_de_1P			<= 1'b1;
							r_U_runlength_1P	<= {4{1'b0}};
							r_U_B_1P			<= r_U_DC_1P;
							`ifdef RTL_SIM
								r_dbg_U_eob		<= 1'b1;
							`endif
						end
					end
				end
				else if (r_Y_dq_ready_1P)
				begin
					if ((r_DHT_BST_lu_1P[4] == Li_AC) &&
						((w_Y_AC_symbol1_3P == CW_EOB) || (w_Y_AC_symbol1_3P == CW_ZRL)))
					begin
						r_scan_state_1P		<= s_ram_flush;
						r_code_len_cnt_1P	<= {4{1'b0}};
						r_codeword_lu_1P	<= {4{1'b0}};
						r_Y_dq_ready_1P		<= 1'b0;
						if (w_Y_AC_symbol1_3P == CW_ZRL)
						begin
							r_Y_de_1P			<= 1'b1;
							r_Y_B_1P			<= {16{1'b0}};
							r_Y_runlength_1P	<= 4'd15;
						end
						else
						begin
							r_Y_sub_sample_1P	<= r_Y_sub_sample_1P+1'b1;
							r_DHT_BST_lu_1P[4]	<= Li_DC;
							r_run_cnt_1P		<= {7{1'b0}};
							if (r_Y_sub_sample_1P == w_YUV_compression)
							begin
								r_DHT_BST_lu_1P[5]	<= Li_C;
								r_Y_sub_sample_1P	<= {3{1'b0}};
							end
							r_Y_eob_1P			<= 1'b1;
							`ifdef RTL_SIM
								r_dbg_Y_eob		<= 1'b1;
							`endif
						end
					end
					else if ((r_DHT_BST_lu_1P[4] == Li_DC) && (w_Y_DC_symbol1_3P == CW_EOB))
					begin
						r_scan_state_1P		<= s_ram_flush;
						r_DHT_BST_lu_1P[4]	<= Li_AC;
						r_code_len_cnt_1P	<= {4{1'b0}};
						r_codeword_lu_1P	<= {4{1'b0}};
						r_Y_dq_ready_1P		<= 1'b0;
						r_Y_de_1P			<= 1'b1;
						r_Y_runlength_1P	<= {4{1'b0}};
						r_Y_B_1P			<= r_Y_DC_1P;
						`ifdef RTL_SIM
							r_dbg_Y_eob		<= 1'b1;
						`endif
					end
				end
			end
			
			s_wait_amp:
			begin
				if (r_DHT_BST_lu_1P[Li_id_bit])
				begin
					if (r_CbCr_1P == scan_Cr)
					begin
						if (r_V_dq_ready_1P)
						begin
							r_scan_state_1P		<= s_ram_flush;
							r_ecs_1P			<= {16{1'b0}};
							if (r_run_cnt_1P == w_mcu_size)
							begin
								r_DHT_BST_lu_1P[5:4]	<= {Li_Y, Li_DC};
								r_run_cnt_1P			<= {7{1'b0}};
								r_CbCr_1P				<= scan_Cb;
							end
							else if (r_DHT_BST_lu_1P[4] == Li_DC)
								r_DHT_BST_lu_1P[4]	<= Li_AC;
							
							r_code_len_cnt_1P	<= {4{1'b0}};
							r_codeword_lu_1P	<= {4{1'b0}};
							
							r_V_dq_ready_1P		<= 1'b0;
							r_V_de_1P			<= 1'b1;
							r_V_runlength_1P	<= r_runlength_3P;
							
							if (r_neg_1P)
							begin
								if (r_DHT_BST_lu_1P[4] == Li_DC)
								begin
									r_V_B_1P	<= r_ecs_1P+1'b1+r_V_DC_1P;
									r_V_DC_1P	<= r_ecs_1P+1'b1+r_V_DC_1P;
								end
								else
									r_V_B_1P	<= r_ecs_1P+1'b1;
							end
							else if (r_DHT_BST_lu_1P[4] == Li_DC)
							begin
								r_V_B_1P	<= r_ecs_1P+r_V_DC_1P;
								r_V_DC_1P	<= r_ecs_1P+r_V_DC_1P;
							end
							else
								r_V_B_1P	<= r_ecs_1P;
							r_neg_1P	<= 1'b0;
						end
					end
					else if (r_U_dq_ready_1P)
					begin
						r_scan_state_1P		<= s_ram_flush;
						r_ecs_1P			<= {16{1'b0}};
						if (r_run_cnt_1P == w_mcu_size)
						begin
							r_DHT_BST_lu_1P[4]	<= Li_DC;
							r_run_cnt_1P		<= {7{1'b0}};
							r_CbCr_1P			<= scan_Cr;
						end
						else if (r_DHT_BST_lu_1P[4] == Li_DC)
							r_DHT_BST_lu_1P[4]	<= Li_AC;
						
						r_code_len_cnt_1P	<= {4{1'b0}};
						r_codeword_lu_1P	<= {4{1'b0}};
						
						r_U_dq_ready_1P		<= 1'b0;
						r_U_de_1P			<= 1'b1;
						r_U_runlength_1P	<= r_runlength_3P;
						
						if (r_neg_1P)
						begin
							if (r_DHT_BST_lu_1P[4] == Li_DC)
							begin
								r_U_B_1P	<= r_ecs_1P+1'b1+r_U_DC_1P;
								r_U_DC_1P	<= r_ecs_1P+1'b1+r_U_DC_1P;
							end
							else
								r_U_B_1P	<= r_ecs_1P+1'b1;
						end
						else if (r_DHT_BST_lu_1P[4] == Li_DC)
						begin
							r_U_B_1P	<= r_ecs_1P+r_U_DC_1P;
							r_U_DC_1P	<= r_ecs_1P+r_U_DC_1P;
						end
						else
							r_U_B_1P	<= r_ecs_1P;
						r_neg_1P	<= 1'b0;
					end
				end
				else if (r_Y_dq_ready_1P)
				begin
					r_scan_state_1P		<= s_ram_flush;
					r_ecs_1P			<= {16{1'b0}};
					if (r_run_cnt_1P == w_mcu_size)
					begin
						r_Y_sub_sample_1P	<= r_Y_sub_sample_1P+1'b1;
						r_DHT_BST_lu_1P[4]	<= Li_DC;
						r_run_cnt_1P		<= {7{1'b0}};
						if (r_Y_sub_sample_1P == w_YUV_compression)
						begin
							r_DHT_BST_lu_1P[5]		<= Li_C;
							r_Y_sub_sample_1P		<= {3{1'b0}};
						end
					end
					else if (r_DHT_BST_lu_1P[4] == Li_DC)
						r_DHT_BST_lu_1P[4]	<= Li_AC;
					
					r_code_len_cnt_1P	<= {4{1'b0}};
					r_codeword_lu_1P	<= {4{1'b0}};
					
					r_Y_dq_ready_1P		<= 1'b0;
					r_Y_de_1P			<= 1'b1;
					r_Y_runlength_1P	<= r_runlength_3P;
					
					if (r_neg_1P)
					begin
						if (r_DHT_BST_lu_1P[4] == Li_DC)
						begin
							r_Y_B_1P	<= r_ecs_1P+1'b1+r_Y_DC_1P;
							r_Y_DC_1P	<= r_ecs_1P+1'b1+r_Y_DC_1P;
						end
						else
							r_Y_B_1P	<= r_ecs_1P+1'b1;
					end
					else if (r_DHT_BST_lu_1P[4] == Li_DC)
					begin
						r_Y_B_1P	<= r_ecs_1P+r_Y_DC_1P;
						r_Y_DC_1P	<= r_ecs_1P+r_Y_DC_1P;
					end
					else
						r_Y_B_1P	<= r_ecs_1P;
					r_neg_1P	<= 1'b0;
				end
			end
			
			default:
			begin
				r_scan_state_1P			<= s_shift_codeword;
				r_ed_ready_1P			<= 1'b1;
				r_ecs_1P				<= {16{1'b0}};
				r_DHT_BST_lu_1P			<= {6{1'b0}};
				r_code_len_cnt_1P		<= {4{1'b0}};
				r_code_len_total_cnt_1P	<= {8{1'b0}};
				r_codeword_lu_1P		<= {8{1'b0}};
				r_Y_sub_sample_1P		<= {3{1'b0}};
				r_run_cnt_1P			<= {7{1'b0}};
				r_CbCr_1P				<= scan_Cb;
				r_neg_1P				<= 1'b0;
				
				r_Y_dq_ready_1P			<= 1'b1;
				r_Y_de_1P				<= 1'b0;
				r_Y_eob_1P				<= 1'b0;
				r_Y_runlength_1P		<= {4{1'b0}};
				r_Y_B_1P				<= {16{1'b0}};
				r_Y_DC_1P				<= {16{1'b0}};
				r_U_dq_ready_1P			<= 1'b1;
				r_U_de_1P				<= 1'b0;
				r_U_eob_1P				<= 1'b0;
				r_U_runlength_1P		<= {4{1'b0}};
				r_U_B_1P				<= {16{1'b0}};
				r_U_DC_1P				<= {16{1'b0}};
				r_V_dq_ready_1P			<= 1'b1;
				r_V_de_1P				<= 1'b0;
				r_V_eob_1P				<= 1'b0;
				r_V_runlength_1P		<= {4{1'b0}};
				r_V_B_1P				<= {16{1'b0}};
				r_V_DC_1P				<= {16{1'b0}};
			end
		endcase
	end
end

assign	w_codeword_2P	=	(r_DHT_BST_lu_1P[5:4] == 2'b01)?
								w_Y_AC_codeword_2P:
							(r_DHT_BST_lu_1P[5:4] == 2'b10)?
								w_C_DC_codeword_2P:
							(r_DHT_BST_lu_1P[5:4] == 2'b11)?
								w_C_AC_codeword_2P:
								w_Y_DC_codeword_2P;
								
assign	w_code_match_1P	=	(w_code_len_2P == 4'd1)?
								r_ecs_1P[1:0] == w_codeword_2P[1:0]:
							(w_code_len_2P == 4'd2)?
								r_ecs_1P[2:0] == w_codeword_2P[2:0]:
							(w_code_len_2P == 4'd3)?
								r_ecs_1P[3:0] == w_codeword_2P[3:0]:
							(w_code_len_2P == 4'd4)?
								r_ecs_1P[4:0] == w_codeword_2P[4:0]:
							(w_code_len_2P == 4'd5)?
								r_ecs_1P[5:0] == w_codeword_2P[5:0]:
							(w_code_len_2P == 4'd6)?
								r_ecs_1P[6:0] == w_codeword_2P[6:0]:
							(w_code_len_2P == 4'd7)?
								r_ecs_1P[7:0] == w_codeword_2P[7:0]:
							(w_code_len_2P == 4'd8)?
								r_ecs_1P[8:0] == w_codeword_2P[8:0]:
							(w_code_len_2P == 4'd9)?
								r_ecs_1P[9:0] == w_codeword_2P[9:0]:
							(w_code_len_2P == 4'd10)?
								r_ecs_1P[10:0] == w_codeword_2P[10:0]:
							(w_code_len_2P == 4'd11)?
								r_ecs_1P[11:0] == w_codeword_2P[11:0]:
							(w_code_len_2P == 4'd12)?
								r_ecs_1P[12:0] == w_codeword_2P[12:0]:
							(w_code_len_2P == 4'd13)?
								r_ecs_1P[13:0] == w_codeword_2P[13:0]:
							(w_code_len_2P == 4'd14)?
								r_ecs_1P[14:0] == w_codeword_2P[14:0]:
							(w_code_len_2P == 4'd15)?
								r_ecs_1P[15:0] == w_codeword_2P[15:0]:
								r_ecs_1P[0:0] == w_codeword_2P[0:0];
							
`ifdef RTL_SIM
assign	w_sim_ecs_1P	=	(w_code_len_2P == 4'd1)?
								{{14{1'b0}}, r_ecs_1P[1:0]}:
							(w_code_len_2P == 4'd2)?
								{{13{1'b0}}, r_ecs_1P[2:0]}:
							(w_code_len_2P == 4'd3)?
								{{12{1'b0}}, r_ecs_1P[3:0]}:
							(w_code_len_2P == 4'd4)?
								{{11{1'b0}}, r_ecs_1P[4:0]}:
							(w_code_len_2P == 4'd5)?
								{{10{1'b0}}, r_ecs_1P[5:0]}:
							(w_code_len_2P == 4'd6)?
								{{9{1'b0}}, r_ecs_1P[6:0]}:
							(w_code_len_2P == 4'd7)?
								{{8{1'b0}}, r_ecs_1P[7:0]}:
							(w_code_len_2P == 4'd8)?
								{{7{1'b0}}, r_ecs_1P[8:0]}:
							(w_code_len_2P == 4'd9)?
								{{6{1'b0}}, r_ecs_1P[9:0]}:
							(w_code_len_2P == 4'd10)?
								{{5{1'b0}}, r_ecs_1P[10:0]}:
							(w_code_len_2P == 4'd11)?
								{{4{1'b0}}, r_ecs_1P[11:0]}:
							(w_code_len_2P == 4'd12)?
								{{3{1'b0}}, r_ecs_1P[12:0]}:
							(w_code_len_2P == 4'd13)?
								{{2{1'b0}}, r_ecs_1P[13:0]}:
							(w_code_len_2P == 4'd14)?
								{{1{1'b0}}, r_ecs_1P[14:0]}:
							(w_code_len_2P == 4'd15)?
								r_ecs_1P[15:0]:
								{{14{1'b0}}, r_ecs_1P[0:0]};
							
assign	w_sim_codeword_2P	=	(w_code_len_2P == 4'd1)?
									{{14{1'b0}}, w_codeword_2P[1:0]}:
								(w_code_len_2P == 4'd2)?
									{{13{1'b0}}, w_codeword_2P[2:0]}:
								(w_code_len_2P == 4'd3)?
									{{12{1'b0}}, w_codeword_2P[3:0]}:
								(w_code_len_2P == 4'd4)?
									{{11{1'b0}}, w_codeword_2P[4:0]}:
								(w_code_len_2P == 4'd5)?
									{{10{1'b0}}, w_codeword_2P[5:0]}:
								(w_code_len_2P == 4'd6)?
									{{9{1'b0}}, w_codeword_2P[6:0]}:
								(w_code_len_2P == 4'd7)?
									{{8{1'b0}}, w_codeword_2P[7:0]}:
								(w_code_len_2P == 4'd8)?
									{{7{1'b0}}, w_codeword_2P[8:0]}:
								(w_code_len_2P == 4'd9)?
									{{6{1'b0}}, w_codeword_2P[9:0]}:
								(w_code_len_2P == 4'd10)?
									{{5{1'b0}}, w_codeword_2P[10:0]}:
								(w_code_len_2P == 4'd11)?
									{{4{1'b0}}, w_codeword_2P[11:0]}:
								(w_code_len_2P == 4'd12)?
									{{3{1'b0}}, w_codeword_2P[12:0]}:
								(w_code_len_2P == 4'd13)?
									{{2{1'b0}}, w_codeword_2P[13:0]}:
								(w_code_len_2P == 4'd14)?
									{{1{1'b0}}, w_codeword_2P[14:0]}:
								(w_code_len_2P == 4'd15)?
									w_codeword_2P[15:0]:
									{{15{1'b0}}, w_codeword_2P[0:0]};
`endif

assign	w_runlength_2P	= 	(r_DHT_BST_lu_1P[5:4] == 2'b01)?
								w_Y_AC_runlength_2P:
							(r_DHT_BST_lu_1P[5:4] == 2'b10)?
								w_C_DC_runlength_2P:
							(r_DHT_BST_lu_1P[5:4] == 2'b11)?
								w_C_AC_runlength_2P:
								w_Y_DC_runlength_2P;
							
assign	w_size_2P		= 	(r_DHT_BST_lu_1P[5:4] == 2'b01)?
								w_Y_AC_size_2P:
							(r_DHT_BST_lu_1P[5:4] == 2'b10)?
								w_C_DC_size_2P:
							(r_DHT_BST_lu_1P[5:4] == 2'b11)?
								w_C_AC_size_2P:
								w_Y_DC_size_2P;

genvar i;
generate
	for (i=0; i<3; i=i+1)
	begin: runlength_decode
		runlength_shifter
		#(
			.AMPLITUDE_PRECISION(16),
			.MCU_SIZE			(MCU_SIZE)
		)
		inst_runlength_shifter
		(
			.i_arst		(i_arst),
			.i_sysclk	(i_sysclk),
			.i_we		(w_sr_de_1P[i]),
			.i_eob		(w_sr_eob_1P[i]),
			.i_runlength(w_sr_runlength_1P[i]),
			.i_B		(w_sr_B_1P[i]),
			.o_ready	(w_sr_ready_1P[i]),
			.o_run_cnt	(w_sr_run_cnt_2P[i]),
			.i_ready	(w_dq_ready_0P[i]),
			.o_de		(w_sr_de_2P[i]),
			.o_B		(w_sr_B_2P[i])
		);
	end
endgenerate

assign	w_sr_de_1P[c_Y]			= r_Y_de_1P;
assign	w_sr_de_1P[c_U]			= r_U_de_1P;
assign	w_sr_de_1P[c_V]			= r_V_de_1P;
assign	w_sr_eob_1P[c_Y]		= r_Y_eob_1P;
assign	w_sr_eob_1P[c_U]		= r_U_eob_1P;
assign	w_sr_eob_1P[c_V]		= r_V_eob_1P;
assign	w_sr_runlength_1P[c_Y]	= r_Y_runlength_1P;
assign	w_sr_runlength_1P[c_U]	= r_U_runlength_1P;
assign	w_sr_runlength_1P[c_V]	= r_V_runlength_1P;
assign	w_sr_B_1P[c_Y]			= r_Y_B_1P[AMPLITUDE_PRECISION-1:0];
assign	w_sr_B_1P[c_U]			= r_U_B_1P[AMPLITUDE_PRECISION-1:0];
assign	w_sr_B_1P[c_V]			= r_V_B_1P[AMPLITUDE_PRECISION-1:0];
assign	w_dq_ready_0P[c_Y]		= i_Y_dq_ready;
assign	w_dq_ready_0P[c_U]		= i_U_dq_ready;
assign	w_dq_ready_0P[c_V]		= i_V_dq_ready;
assign	w_Y_run_cnt_2P			= w_sr_run_cnt_2P[c_Y];
assign	w_U_run_cnt_2P			= w_sr_run_cnt_2P[c_U];
assign	w_V_run_cnt_2P			= w_sr_run_cnt_2P[c_V];

assign	o_ed_ready		= r_ed_ready_1P;
assign	o_Y_de			= w_sr_de_2P[c_Y];
assign	o_U_de			= w_sr_de_2P[c_U];
assign	o_V_de			= w_sr_de_2P[c_V];
assign	o_Y_B			= w_sr_B_2P[c_Y];
assign	o_U_B			= w_sr_B_2P[c_U];
assign	o_V_B			= w_sr_B_2P[c_V];
`ifdef DBG_MODE
assign	o_scan_state	= r_scan_state_1P;
`endif

`ifdef RTL_SIM
initial
begin
	$display("Hihi entropy_deocder.v");
	$display("%s", DHT_BST_MIF);
	$display("%s", Y_DC_CW_MIF);
	$display("%s", Y_AC_CW_MIF);
	$display("%s", Y_S1_MIF);
	$display("%s", C_DC_CW_MIF);
	$display("%s", C_AC_CW_MIF);
	$display("%s", C_S1_MIF);
end
`endif
/*
`ifdef RTL_SIM
reg		[AMPLITUDE_PRECISION-1:0]r_Y_dbg_mtx[0:8*8-1];
reg		[AMPLITUDE_PRECISION-1:0]r_U_dbg_mtx[0:8*8-1];
reg		[AMPLITUDE_PRECISION-1:0]r_V_dbg_mtx[0:8*8-1];

wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r0[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r1[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r2[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r3[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r4[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r5[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r6[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_Y_dbg_mtx_r7[0:8-1];

wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r0[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r1[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r2[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r3[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r4[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r5[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r6[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_U_dbg_mtx_r7[0:8-1];

wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r0[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r1[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r2[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r3[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r4[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r5[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r6[0:8-1];
wire	[AMPLITUDE_PRECISION-1:0]w_V_dbg_mtx_r7[0:8-1];

integer h, j, k, l;

initial
begin
	for (h=0; h<8*8; h=h+1)
	begin
		r_Y_dbg_mtx[h]	<= {AMPLITUDE_PRECISION{1'b0}};
		r_U_dbg_mtx[h]	<= {AMPLITUDE_PRECISION{1'b0}};
		r_V_dbg_mtx[h]	<= {AMPLITUDE_PRECISION{1'b0}};
	end
end

always@(posedge i_sysclk)
begin
	if (w_sr_de_2P[c_Y] & w_dq_ready_0P[c_Y])
	begin
		r_Y_dbg_mtx[8*8-1]	<= w_sr_B_2P[c_Y];
		for (j=0; j<8*8-1; j=j+1)
		begin: Y_mtx
			r_Y_dbg_mtx[j]	<= r_Y_dbg_mtx[j+1];
		end
	end
	
	if (w_sr_de_2P[c_U] & w_dq_ready_0P[c_U])
	begin: U_mtx
		r_U_dbg_mtx[8*8-1]	<= w_sr_B_2P[c_U];
		for (k=0; k<8*8-1; k=k+1)
		begin
			r_U_dbg_mtx[k]	<= r_U_dbg_mtx[k+1];
		end
	end
	
	if (w_sr_de_2P[c_V] & w_dq_ready_0P[c_V])
	begin: V_mtx
		r_V_dbg_mtx[8*8-1]	<= w_sr_B_2P[c_V];
		for (l=0; l<8*8-1; l=l+1)
		begin
			r_V_dbg_mtx[l]	<= r_V_dbg_mtx[l+1];
		end
	end
end

assign	w_Y_dbg_mtx_r0[0] = r_Y_dbg_mtx[8*0+0];
assign	w_Y_dbg_mtx_r1[0] = r_Y_dbg_mtx[8*1+0];
assign	w_Y_dbg_mtx_r2[0] = r_Y_dbg_mtx[8*2+0];
assign	w_Y_dbg_mtx_r3[0] = r_Y_dbg_mtx[8*3+0];
assign	w_Y_dbg_mtx_r4[0] = r_Y_dbg_mtx[8*4+0];
assign	w_Y_dbg_mtx_r5[0] = r_Y_dbg_mtx[8*5+0];
assign	w_Y_dbg_mtx_r6[0] = r_Y_dbg_mtx[8*6+0];
assign	w_Y_dbg_mtx_r7[0] = r_Y_dbg_mtx[8*7+0];

assign	w_Y_dbg_mtx_r0[1] = r_Y_dbg_mtx[8*0+1];
assign	w_Y_dbg_mtx_r1[1] = r_Y_dbg_mtx[8*1+1];
assign	w_Y_dbg_mtx_r2[1] = r_Y_dbg_mtx[8*2+1];
assign	w_Y_dbg_mtx_r3[1] = r_Y_dbg_mtx[8*3+1];
assign	w_Y_dbg_mtx_r4[1] = r_Y_dbg_mtx[8*4+1];
assign	w_Y_dbg_mtx_r5[1] = r_Y_dbg_mtx[8*5+1];
assign	w_Y_dbg_mtx_r6[1] = r_Y_dbg_mtx[8*6+1];
assign	w_Y_dbg_mtx_r7[1] = r_Y_dbg_mtx[8*7+1];

assign	w_Y_dbg_mtx_r0[2] = r_Y_dbg_mtx[8*0+2];
assign	w_Y_dbg_mtx_r1[2] = r_Y_dbg_mtx[8*1+2];
assign	w_Y_dbg_mtx_r2[2] = r_Y_dbg_mtx[8*2+2];
assign	w_Y_dbg_mtx_r3[2] = r_Y_dbg_mtx[8*3+2];
assign	w_Y_dbg_mtx_r4[2] = r_Y_dbg_mtx[8*4+2];
assign	w_Y_dbg_mtx_r5[2] = r_Y_dbg_mtx[8*5+2];
assign	w_Y_dbg_mtx_r6[2] = r_Y_dbg_mtx[8*6+2];
assign	w_Y_dbg_mtx_r7[2] = r_Y_dbg_mtx[8*7+2];

assign	w_Y_dbg_mtx_r0[3] = r_Y_dbg_mtx[8*0+3];
assign	w_Y_dbg_mtx_r1[3] = r_Y_dbg_mtx[8*1+3];
assign	w_Y_dbg_mtx_r2[3] = r_Y_dbg_mtx[8*2+3];
assign	w_Y_dbg_mtx_r3[3] = r_Y_dbg_mtx[8*3+3];
assign	w_Y_dbg_mtx_r4[3] = r_Y_dbg_mtx[8*4+3];
assign	w_Y_dbg_mtx_r5[3] = r_Y_dbg_mtx[8*5+3];
assign	w_Y_dbg_mtx_r6[3] = r_Y_dbg_mtx[8*6+3];
assign	w_Y_dbg_mtx_r7[3] = r_Y_dbg_mtx[8*7+3];

assign	w_Y_dbg_mtx_r0[4] = r_Y_dbg_mtx[8*0+4];
assign	w_Y_dbg_mtx_r1[4] = r_Y_dbg_mtx[8*1+4];
assign	w_Y_dbg_mtx_r2[4] = r_Y_dbg_mtx[8*2+4];
assign	w_Y_dbg_mtx_r3[4] = r_Y_dbg_mtx[8*3+4];
assign	w_Y_dbg_mtx_r4[4] = r_Y_dbg_mtx[8*4+4];
assign	w_Y_dbg_mtx_r5[4] = r_Y_dbg_mtx[8*5+4];
assign	w_Y_dbg_mtx_r6[4] = r_Y_dbg_mtx[8*6+4];
assign	w_Y_dbg_mtx_r7[4] = r_Y_dbg_mtx[8*7+4];

assign	w_Y_dbg_mtx_r0[5] = r_Y_dbg_mtx[8*0+5];
assign	w_Y_dbg_mtx_r1[5] = r_Y_dbg_mtx[8*1+5];
assign	w_Y_dbg_mtx_r2[5] = r_Y_dbg_mtx[8*2+5];
assign	w_Y_dbg_mtx_r3[5] = r_Y_dbg_mtx[8*3+5];
assign	w_Y_dbg_mtx_r4[5] = r_Y_dbg_mtx[8*4+5];
assign	w_Y_dbg_mtx_r5[5] = r_Y_dbg_mtx[8*5+5];
assign	w_Y_dbg_mtx_r6[5] = r_Y_dbg_mtx[8*6+5];
assign	w_Y_dbg_mtx_r7[5] = r_Y_dbg_mtx[8*7+5];

assign	w_Y_dbg_mtx_r0[6] = r_Y_dbg_mtx[8*0+6];
assign	w_Y_dbg_mtx_r1[6] = r_Y_dbg_mtx[8*1+6];
assign	w_Y_dbg_mtx_r2[6] = r_Y_dbg_mtx[8*2+6];
assign	w_Y_dbg_mtx_r3[6] = r_Y_dbg_mtx[8*3+6];
assign	w_Y_dbg_mtx_r4[6] = r_Y_dbg_mtx[8*4+6];
assign	w_Y_dbg_mtx_r5[6] = r_Y_dbg_mtx[8*5+6];
assign	w_Y_dbg_mtx_r6[6] = r_Y_dbg_mtx[8*6+6];
assign	w_Y_dbg_mtx_r7[6] = r_Y_dbg_mtx[8*7+6];

assign	w_Y_dbg_mtx_r0[7] = r_Y_dbg_mtx[8*0+7];
assign	w_Y_dbg_mtx_r1[7] = r_Y_dbg_mtx[8*1+7];
assign	w_Y_dbg_mtx_r2[7] = r_Y_dbg_mtx[8*2+7];
assign	w_Y_dbg_mtx_r3[7] = r_Y_dbg_mtx[8*3+7];
assign	w_Y_dbg_mtx_r4[7] = r_Y_dbg_mtx[8*4+7];
assign	w_Y_dbg_mtx_r5[7] = r_Y_dbg_mtx[8*5+7];
assign	w_Y_dbg_mtx_r6[7] = r_Y_dbg_mtx[8*6+7];
assign	w_Y_dbg_mtx_r7[7] = r_Y_dbg_mtx[8*7+7];

assign	w_U_dbg_mtx_r0[0] = r_U_dbg_mtx[8*0+0];
assign	w_U_dbg_mtx_r1[0] = r_U_dbg_mtx[8*1+0];
assign	w_U_dbg_mtx_r2[0] = r_U_dbg_mtx[8*2+0];
assign	w_U_dbg_mtx_r3[0] = r_U_dbg_mtx[8*3+0];
assign	w_U_dbg_mtx_r4[0] = r_U_dbg_mtx[8*4+0];
assign	w_U_dbg_mtx_r5[0] = r_U_dbg_mtx[8*5+0];
assign	w_U_dbg_mtx_r6[0] = r_U_dbg_mtx[8*6+0];
assign	w_U_dbg_mtx_r7[0] = r_U_dbg_mtx[8*7+0];

assign	w_U_dbg_mtx_r0[1] = r_U_dbg_mtx[8*0+1];
assign	w_U_dbg_mtx_r1[1] = r_U_dbg_mtx[8*1+1];
assign	w_U_dbg_mtx_r2[1] = r_U_dbg_mtx[8*2+1];
assign	w_U_dbg_mtx_r3[1] = r_U_dbg_mtx[8*3+1];
assign	w_U_dbg_mtx_r4[1] = r_U_dbg_mtx[8*4+1];
assign	w_U_dbg_mtx_r5[1] = r_U_dbg_mtx[8*5+1];
assign	w_U_dbg_mtx_r6[1] = r_U_dbg_mtx[8*6+1];
assign	w_U_dbg_mtx_r7[1] = r_U_dbg_mtx[8*7+1];

assign	w_U_dbg_mtx_r0[2] = r_U_dbg_mtx[8*0+2];
assign	w_U_dbg_mtx_r1[2] = r_U_dbg_mtx[8*1+2];
assign	w_U_dbg_mtx_r2[2] = r_U_dbg_mtx[8*2+2];
assign	w_U_dbg_mtx_r3[2] = r_U_dbg_mtx[8*3+2];
assign	w_U_dbg_mtx_r4[2] = r_U_dbg_mtx[8*4+2];
assign	w_U_dbg_mtx_r5[2] = r_U_dbg_mtx[8*5+2];
assign	w_U_dbg_mtx_r6[2] = r_U_dbg_mtx[8*6+2];
assign	w_U_dbg_mtx_r7[2] = r_U_dbg_mtx[8*7+2];
 
assign	w_U_dbg_mtx_r0[3] = r_U_dbg_mtx[8*0+3];
assign	w_U_dbg_mtx_r1[3] = r_U_dbg_mtx[8*1+3];
assign	w_U_dbg_mtx_r2[3] = r_U_dbg_mtx[8*2+3];
assign	w_U_dbg_mtx_r3[3] = r_U_dbg_mtx[8*3+3];
assign	w_U_dbg_mtx_r4[3] = r_U_dbg_mtx[8*4+3];
assign	w_U_dbg_mtx_r5[3] = r_U_dbg_mtx[8*5+3];
assign	w_U_dbg_mtx_r6[3] = r_U_dbg_mtx[8*6+3];
assign	w_U_dbg_mtx_r7[3] = r_U_dbg_mtx[8*7+3];

assign	w_U_dbg_mtx_r0[4] = r_U_dbg_mtx[8*0+4];
assign	w_U_dbg_mtx_r1[4] = r_U_dbg_mtx[8*1+4];
assign	w_U_dbg_mtx_r2[4] = r_U_dbg_mtx[8*2+4];
assign	w_U_dbg_mtx_r3[4] = r_U_dbg_mtx[8*3+4];
assign	w_U_dbg_mtx_r4[4] = r_U_dbg_mtx[8*4+4];
assign	w_U_dbg_mtx_r5[4] = r_U_dbg_mtx[8*5+4];
assign	w_U_dbg_mtx_r6[4] = r_U_dbg_mtx[8*6+4];
assign	w_U_dbg_mtx_r7[4] = r_U_dbg_mtx[8*7+4];

assign	w_U_dbg_mtx_r0[5] = r_U_dbg_mtx[8*0+5];
assign	w_U_dbg_mtx_r1[5] = r_U_dbg_mtx[8*1+5];
assign	w_U_dbg_mtx_r2[5] = r_U_dbg_mtx[8*2+5];
assign	w_U_dbg_mtx_r3[5] = r_U_dbg_mtx[8*3+5];
assign	w_U_dbg_mtx_r4[5] = r_U_dbg_mtx[8*4+5];
assign	w_U_dbg_mtx_r5[5] = r_U_dbg_mtx[8*5+5];
assign	w_U_dbg_mtx_r6[5] = r_U_dbg_mtx[8*6+5];
assign	w_U_dbg_mtx_r7[5] = r_U_dbg_mtx[8*7+5];

assign	w_U_dbg_mtx_r0[6] = r_U_dbg_mtx[8*0+6];
assign	w_U_dbg_mtx_r1[6] = r_U_dbg_mtx[8*1+6];
assign	w_U_dbg_mtx_r2[6] = r_U_dbg_mtx[8*2+6];
assign	w_U_dbg_mtx_r3[6] = r_U_dbg_mtx[8*3+6];
assign	w_U_dbg_mtx_r4[6] = r_U_dbg_mtx[8*4+6];
assign	w_U_dbg_mtx_r5[6] = r_U_dbg_mtx[8*5+6];
assign	w_U_dbg_mtx_r6[6] = r_U_dbg_mtx[8*6+6];
assign	w_U_dbg_mtx_r7[6] = r_U_dbg_mtx[8*7+6];

assign	w_U_dbg_mtx_r0[7] = r_U_dbg_mtx[8*0+7];
assign	w_U_dbg_mtx_r1[7] = r_U_dbg_mtx[8*1+7];
assign	w_U_dbg_mtx_r2[7] = r_U_dbg_mtx[8*2+7];
assign	w_U_dbg_mtx_r3[7] = r_U_dbg_mtx[8*3+7];
assign	w_U_dbg_mtx_r4[7] = r_U_dbg_mtx[8*4+7];
assign	w_U_dbg_mtx_r5[7] = r_U_dbg_mtx[8*5+7];
assign	w_U_dbg_mtx_r6[7] = r_U_dbg_mtx[8*6+7];
assign	w_U_dbg_mtx_r7[7] = r_U_dbg_mtx[8*7+7];

assign	w_V_dbg_mtx_r0[0] = r_V_dbg_mtx[8*0+0];
assign	w_V_dbg_mtx_r1[0] = r_V_dbg_mtx[8*1+0];
assign	w_V_dbg_mtx_r2[0] = r_V_dbg_mtx[8*2+0];
assign	w_V_dbg_mtx_r3[0] = r_V_dbg_mtx[8*3+0];
assign	w_V_dbg_mtx_r4[0] = r_V_dbg_mtx[8*4+0];
assign	w_V_dbg_mtx_r5[0] = r_V_dbg_mtx[8*5+0];
assign	w_V_dbg_mtx_r6[0] = r_V_dbg_mtx[8*6+0];
assign	w_V_dbg_mtx_r7[0] = r_V_dbg_mtx[8*7+0];

assign	w_V_dbg_mtx_r0[1] = r_V_dbg_mtx[8*0+1];
assign	w_V_dbg_mtx_r1[1] = r_V_dbg_mtx[8*1+1];
assign	w_V_dbg_mtx_r2[1] = r_V_dbg_mtx[8*2+1];
assign	w_V_dbg_mtx_r3[1] = r_V_dbg_mtx[8*3+1];
assign	w_V_dbg_mtx_r4[1] = r_V_dbg_mtx[8*4+1];
assign	w_V_dbg_mtx_r5[1] = r_V_dbg_mtx[8*5+1];
assign	w_V_dbg_mtx_r6[1] = r_V_dbg_mtx[8*6+1];
assign	w_V_dbg_mtx_r7[1] = r_V_dbg_mtx[8*7+1];

assign	w_V_dbg_mtx_r0[2] = r_V_dbg_mtx[8*0+2];
assign	w_V_dbg_mtx_r1[2] = r_V_dbg_mtx[8*1+2];
assign	w_V_dbg_mtx_r2[2] = r_V_dbg_mtx[8*2+2];
assign	w_V_dbg_mtx_r3[2] = r_V_dbg_mtx[8*3+2];
assign	w_V_dbg_mtx_r4[2] = r_V_dbg_mtx[8*4+2];
assign	w_V_dbg_mtx_r5[2] = r_V_dbg_mtx[8*5+2];
assign	w_V_dbg_mtx_r6[2] = r_V_dbg_mtx[8*6+2];
assign	w_V_dbg_mtx_r7[2] = r_V_dbg_mtx[8*7+2];

assign	w_V_dbg_mtx_r0[3] = r_V_dbg_mtx[8*0+3];
assign	w_V_dbg_mtx_r1[3] = r_V_dbg_mtx[8*1+3];
assign	w_V_dbg_mtx_r2[3] = r_V_dbg_mtx[8*2+3];
assign	w_V_dbg_mtx_r3[3] = r_V_dbg_mtx[8*3+3];
assign	w_V_dbg_mtx_r4[3] = r_V_dbg_mtx[8*4+3];
assign	w_V_dbg_mtx_r5[3] = r_V_dbg_mtx[8*5+3];
assign	w_V_dbg_mtx_r6[3] = r_V_dbg_mtx[8*6+3];
assign	w_V_dbg_mtx_r7[3] = r_V_dbg_mtx[8*7+3];

assign	w_V_dbg_mtx_r0[4] = r_V_dbg_mtx[8*0+4];
assign	w_V_dbg_mtx_r1[4] = r_V_dbg_mtx[8*1+4];
assign	w_V_dbg_mtx_r2[4] = r_V_dbg_mtx[8*2+4];
assign	w_V_dbg_mtx_r3[4] = r_V_dbg_mtx[8*3+4];
assign	w_V_dbg_mtx_r4[4] = r_V_dbg_mtx[8*4+4];
assign	w_V_dbg_mtx_r5[4] = r_V_dbg_mtx[8*5+4];
assign	w_V_dbg_mtx_r6[4] = r_V_dbg_mtx[8*6+4];
assign	w_V_dbg_mtx_r7[4] = r_V_dbg_mtx[8*7+4];

assign	w_V_dbg_mtx_r0[5] = r_V_dbg_mtx[8*0+5];
assign	w_V_dbg_mtx_r1[5] = r_V_dbg_mtx[8*1+5];
assign	w_V_dbg_mtx_r2[5] = r_V_dbg_mtx[8*2+5];
assign	w_V_dbg_mtx_r3[5] = r_V_dbg_mtx[8*3+5];
assign	w_V_dbg_mtx_r4[5] = r_V_dbg_mtx[8*4+5];
assign	w_V_dbg_mtx_r5[5] = r_V_dbg_mtx[8*5+5];
assign	w_V_dbg_mtx_r6[5] = r_V_dbg_mtx[8*6+5];
assign	w_V_dbg_mtx_r7[5] = r_V_dbg_mtx[8*7+5];

assign	w_V_dbg_mtx_r0[6] = r_V_dbg_mtx[8*0+6];
assign	w_V_dbg_mtx_r1[6] = r_V_dbg_mtx[8*1+6];
assign	w_V_dbg_mtx_r2[6] = r_V_dbg_mtx[8*2+6];
assign	w_V_dbg_mtx_r3[6] = r_V_dbg_mtx[8*3+6];
assign	w_V_dbg_mtx_r4[6] = r_V_dbg_mtx[8*4+6];
assign	w_V_dbg_mtx_r5[6] = r_V_dbg_mtx[8*5+6];
assign	w_V_dbg_mtx_r6[6] = r_V_dbg_mtx[8*6+6];
assign	w_V_dbg_mtx_r7[6] = r_V_dbg_mtx[8*7+6];

assign	w_V_dbg_mtx_r0[7] = r_V_dbg_mtx[8*0+7];
assign	w_V_dbg_mtx_r1[7] = r_V_dbg_mtx[8*1+7];
assign	w_V_dbg_mtx_r2[7] = r_V_dbg_mtx[8*2+7];
assign	w_V_dbg_mtx_r3[7] = r_V_dbg_mtx[8*3+7];
assign	w_V_dbg_mtx_r4[7] = r_V_dbg_mtx[8*4+7];
assign	w_V_dbg_mtx_r5[7] = r_V_dbg_mtx[8*5+7];
assign	w_V_dbg_mtx_r6[7] = r_V_dbg_mtx[8*6+7];
assign	w_V_dbg_mtx_r7[7] = r_V_dbg_mtx[8*7+7];
`endif
*/
endmodule

/*
-318	48	-26	-2	-4	-10	4	2
-2		2	0	0	2	-2	1	0
0		-1	0	0	-1	0	0	-1
0		0	0	-1	1	0	0	0
0		0	0	0	0	0	0	0
0		0	0	0	0	0	0	0
0		0	0	0	0	0	0	0
0		0	0	0	0	0	0	0
*/
