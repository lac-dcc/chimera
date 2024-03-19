module jpeg_decoder
#(
	parameter	SOS_CNT_W				= 4,
	
	parameter	AMPLITUDE_PRECISION		= 16,
	parameter	DHT_BST_MIF				= "../mif/adobe_web/adobe_web_dht_bst.memh",
	parameter	Y_DC_CW_MIF				= "../mif/t8/adobe_web_y_dc_codeword.memb",
	parameter	Y_AC_CW_MIF				= "../mif/adobe_web/adobe_web_y_ac_codeword.memb",
	parameter	Y_S1_MIF				= "../mif/adobe_web/adobe_web_y_symbol1.memh",
	parameter	C_DC_CW_MIF				= "../mif/t8/adobe_web_y_dc_codeword.memb",
	parameter	C_AC_CW_MIF				= "../mif/adobe_web/adobe_web_c_ac_codeword.memb",
	parameter	C_S1_MIF				= "../mif/adobe_web/adobe_web_c_symbol1.memh",
	
	parameter	Y_X_SUBSAMPLE			= 1,
	parameter	Y_Y_SUBSAMPLE			= 1,
	parameter	C_X_SUBSAMPLE			= 2,
	parameter	C_Y_SUBSAMPLE			= 2,
	parameter	NUM_MATRIX_Y			= 4,
	parameter	NUM_MATRIX_U			= 4,
	parameter	NUM_MATRIX_V			= 4,
`ifdef RTL_SIM
	parameter	REF_MTX_Y				= "ref_mtx_Y.txt",
	parameter	REF_MTX_U				= "ref_mtx_U.txt",
	parameter	REF_MTX_V				= "ref_mtx_V.txt",
`endif
	parameter	NUM_ACCUMULATOR			= 3,
	parameter	NUM_CHANNEL				= 3,
	parameter	MCU_WIDTH				= 8,
	parameter	MCU_HEIGHT				= 8,
	parameter	COLOR_PRECISION			= 8,
	parameter	ZIGZAG_MULTIPLEX		= "SEQUENTIAL",
	
	parameter	DQT_PRECISION			= 8,
	parameter	DQT_BRAM_OUTPUT_REG		= "FALSE",
	parameter	DQT_MIF					= "../mif/wiki_dqt.memh",
	parameter	DQT_MULT_LATENCY		= 0,
	
	parameter	DCT_PRECISION			= 9,
//	parameter	DCT_BRAM_OUTPUT_REG		= "FALSE",
//	parameter	DCT_MIF					= "",
	parameter	DCT_MULT_LATENCY		= 0,
	
	parameter	ACCU_MULT_LATENCY		= 0,
	
	parameter	PX_OUT	= 1,
	parameter	PY_OUT	= 1
)
(
	input	i_arst,
	input	i_sysclk,
`ifdef DBG_MODE
	output	[1:0]o_sos_status,
	output	[2:0]o_scan_state,
`endif
	input	i_byte_en,
	input	[7:0]i_byte,
	output	o_jfif_ready,
	output	o_jfif_eoi,
	output	[15:0]o_width,
	output	[15:0]o_height,
`ifdef RTL_SIM
	output	[15:0]o_sim_Y_wr_mcu,
	output	[15:0]o_sim_U_wr_mcu,
	output	[15:0]o_sim_V_wr_mcu,
`endif
	
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
localparam	c_V	= 2;

wire	w_start;
wire	w_scan_en;
wire	w_ecs_bit;

wire	w_Y_dq_ready;
wire	w_U_dq_ready;
wire	w_V_dq_ready;
wire	w_ed_ready;
wire	w_Y_de;
wire	w_U_de;
wire	w_V_de;
wire	[AMPLITUDE_PRECISION-1:0]w_Y_B;
wire	[AMPLITUDE_PRECISION-1:0]w_U_B;
wire	[AMPLITUDE_PRECISION-1:0]w_V_B;

wire	w_Y_mx_full;
wire	w_Y_mx_re;
wire	[PY_OUT*PX_OUT*AMPLITUDE_PRECISION-1:0]w_Y_mx_md;
wire	w_Y_mx_nempty;

wire	w_U_mx_full;
wire	w_U_mx_re;
wire	[PY_OUT*PX_OUT*AMPLITUDE_PRECISION-1:0]w_U_mx_md;
wire	w_U_mx_nempty;

wire	w_V_mx_full;
wire	w_V_mx_re;
wire	[PY_OUT*PX_OUT*AMPLITUDE_PRECISION-1:0]w_V_mx_md;
wire	w_V_mx_nempty;

wire	w_Y_lb_full;
wire	w_U_lb_full;
wire	w_V_lb_full;
wire	w_Y_lb_we;
wire	w_U_lb_we;
wire	w_V_lb_we;
wire	[COLOR_PRECISION-1:0]w_Y_lb;
wire	[COLOR_PRECISION-1:0]w_U_lb;
wire	[COLOR_PRECISION-1:0]w_V_lb;

`ifdef RTL_SIM
initial
begin
	$display("Hihi jpeg_decoder.v");
	$display("Y_X_SUBSAMPLE = %d", Y_X_SUBSAMPLE);
	$display("Y_Y_SUBSAMPLE = %d", Y_Y_SUBSAMPLE);
	$display("C_X_SUBSAMPLE = %d", C_X_SUBSAMPLE);
	$display("C_Y_SUBSAMPLE = %d", C_Y_SUBSAMPLE);
end
`endif

jfif_parser
#(
	.SOS_CNT_W(SOS_CNT_W)
)
inst_jfif_parser
(
	.i_arst			(i_arst),
	.i_sysclk		(i_sysclk),
`ifdef DBG_MODE
	.o_sos_status	(o_sos_status),
`endif
	.i_byte_en		(i_byte_en),
	.i_byte			(i_byte),
	.o_jfif_ready	(o_jfif_ready),
	.o_jfif_eoi		(o_jfif_eoi),
	.i_sos_re		(w_ed_ready),
	.o_sos_start	(w_start),
	.o_sos_width	(o_width),
	.o_sos_height	(o_height),
	.o_sos_scan_en	(w_scan_en),
	.o_sos_ecs_bit	(w_ecs_bit)
);

entropy_decoder
#(
	.AMPLITUDE_PRECISION	(AMPLITUDE_PRECISION),
	.MCU_SIZE				(MCU_HEIGHT*MCU_WIDTH),
	.YUV_COMPRESSION		(C_Y_SUBSAMPLE*C_X_SUBSAMPLE),
	.DHT_BST_MIF			(DHT_BST_MIF),
	.Y_DC_CW_MIF			(Y_DC_CW_MIF),
	.Y_AC_CW_MIF			(Y_AC_CW_MIF),
	.Y_S1_MIF				(Y_S1_MIF),
	.C_DC_CW_MIF			(C_DC_CW_MIF),
	.C_AC_CW_MIF			(C_AC_CW_MIF),
	.C_S1_MIF				(C_S1_MIF)
)
inst_entropy_decoder
(
	.i_arst			(i_arst),
	.i_srst			(w_start),
	.i_sysclk		(i_sysclk),
`ifdef DBG_MODE
	.o_scan_state	(o_scan_state),
`endif
	.i_scan_en		(w_scan_en),
	.i_ecs_bit		(w_ecs_bit),
	.i_Y_dq_ready	(w_Y_dq_ready),
	.i_U_dq_ready	(w_U_dq_ready),
	.i_V_dq_ready	(w_V_dq_ready),
	.o_ed_ready		(w_ed_ready),
	.o_Y_de			(w_Y_de),
	.o_U_de			(w_U_de),
	.o_V_de			(w_V_de),
	.o_Y_B			(w_Y_B),
	.o_U_B			(w_U_B),
	.o_V_B			(w_V_B)
);

assign	w_Y_dq_ready	= ~w_Y_mx_full;
assign	w_U_dq_ready	= ~w_U_mx_full;
assign	w_V_dq_ready	= ~w_V_mx_full;

zigzag_to_matrix
#(
`ifdef RTL_SIM
	.REF_MTX_FILE	(REF_MTX_Y),
`endif
	.DATA_W			(AMPLITUDE_PRECISION),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.NUM_MATRIX		(NUM_MATRIX_Y),
	.PX_OUT			(PX_OUT),
	.PY_OUT			(PY_OUT),
	.MATRIX_TYPE	("RAM")
)
inst_zigzag_to_matrix_Y
(
	.i_arst			(i_arst),
	.i_srst			(i_arst),
	.i_sysclk		(i_sysclk),
	.i_we			(w_Y_de),
	.i_data			(w_Y_B),
	.o_full			(w_Y_mx_full),
`ifdef RTL_SIM
	.o_sim_wr_mcu	(o_sim_Y_wr_mcu),
`endif
	
	.i_re			(w_Y_mx_re),
	.o_nempty		(w_Y_mx_nempty),
	.o_md			(w_Y_mx_md)
);

zigzag_to_matrix
#(
`ifdef RTL_SIM
	.REF_MTX_FILE	(REF_MTX_U),
`endif
	.DATA_W			(AMPLITUDE_PRECISION),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.NUM_MATRIX		(NUM_MATRIX_U),
	.PX_OUT			(PX_OUT),
	.PY_OUT			(PY_OUT),
	.MATRIX_TYPE	("RAM")
)
inst_zigzag_to_matrix_U
(
	.i_arst			(i_arst),
	.i_srst			(i_arst),
	.i_sysclk		(i_sysclk),
	.i_we			(w_U_de),
	.i_data			(w_U_B),
	.o_full			(w_U_mx_full),
`ifdef RTL_SIM
	.o_sim_wr_mcu	(o_sim_U_wr_mcu),
`endif
	
	.i_re			(w_U_mx_re),
	.o_nempty		(w_U_mx_nempty),
	.o_md			(w_U_mx_md)
);

zigzag_to_matrix
#(
`ifdef RTL_SIM
	.REF_MTX_FILE	(REF_MTX_V),
`endif
	.DATA_W			(AMPLITUDE_PRECISION),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.NUM_MATRIX		(NUM_MATRIX_V),
	.PX_OUT			(PX_OUT),
	.PY_OUT			(PY_OUT),
	.MATRIX_TYPE	("RAM")
)
inst_zigzag_to_matrix_V
(
	.i_arst			(i_arst),
	.i_srst			(i_arst),
	.i_sysclk		(i_sysclk),
	.i_we			(w_V_de),
	.i_data			(w_V_B),
	.o_full			(w_V_mx_full),
`ifdef RTL_SIM
	.o_sim_wr_mcu	(o_sim_V_wr_mcu),
`endif
	
	.i_re			(w_V_mx_re),
	.o_nempty		(w_V_mx_nempty),
	.o_md			(w_V_mx_md)
);

dq_idct
#(
	.NUM_ACCUMULATOR		(NUM_ACCUMULATOR),
	.NUM_CHANNEL			(NUM_CHANNEL),
	.AMPLITUDE_PRECISION	(AMPLITUDE_PRECISION),
	.COLOR_PRECISION		(COLOR_PRECISION),
	.ZIGZAG_MULTIPLEX		(ZIGZAG_MULTIPLEX),
	.YUV_COMPRESSION		(C_Y_SUBSAMPLE*C_X_SUBSAMPLE),
	
	.DQT_PRECISION			(DQT_PRECISION),
	.DQT_BRAM_OUTPUT_REG	(DQT_BRAM_OUTPUT_REG),
	.DQT_MIF				(DQT_MIF),
	.DQT_MULT_LATENCY		(DQT_MULT_LATENCY),
	
	.DCT_PRECISION			(DCT_PRECISION),
	.DCT_MULT_LATENCY		(DCT_MULT_LATENCY),
	
	.ACCU_MULT_LATENCY		(ACCU_MULT_LATENCY)
)
inst_dq_idct
(
	.i_arst		(i_arst),
	.i_sysclk	(i_sysclk),
	
	.i_Y_de		(w_Y_mx_nempty),
//	.i_Y_de		(w_Y_mx_full),
	.i_U_de		(w_U_mx_nempty),
	.i_V_de		(w_V_mx_nempty),
	.i_Y_B		(w_Y_mx_md),
	.i_U_B		(w_U_mx_md),
	.i_V_B		(w_V_mx_md),
	.o_Y_re		(w_Y_mx_re),
	.o_U_re		(w_U_mx_re),
	.o_V_re		(w_V_mx_re),
	
	.i_Y_lb_full	(w_Y_lb_full),
	.i_U_lb_full	(w_U_lb_full),
	.i_V_lb_full	(w_V_lb_full),
	.o_Y_lb_we		(w_Y_lb_we),
	.o_U_lb_we		(w_U_lb_we),
	.o_V_lb_we		(w_V_lb_we),
	.o_Y_lb			(w_Y_lb),
	.o_U_lb			(w_U_lb),
	.o_V_lb			(w_V_lb)
);

assign	w_Y_lb_full	= i_Y_lb_full;
assign	w_U_lb_full	= i_U_lb_full;
assign	w_V_lb_full	= i_V_lb_full;
assign	o_Y_lb_we	= w_Y_lb_we;
assign	o_U_lb_we	= w_U_lb_we;
assign	o_V_lb_we	= w_V_lb_we;
assign	o_Y_lb		= w_Y_lb;
assign	o_U_lb		= w_U_lb;
assign	o_V_lb		= w_V_lb;

endmodule
