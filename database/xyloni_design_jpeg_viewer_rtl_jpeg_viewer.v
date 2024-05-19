// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`define ADOBE_WEB_Q80
//`define MSPAINT
`include "jpeg_viewer_define.vh"

module jpeg_viewer
#(
	parameter	SPI_SCLK_FREQ		= 6'd1,
	parameter	SPI_FLASH_ADDR_WIDTH= 24,
//	parameter	NUM_OF_JPG			= 32,
	parameter	START_ADDR			= 24'h200000,
	parameter	NUM_OF_JPG			= 2,
	parameter	ADDR_OFFSET			= 24'h40000,
	
	parameter	SOS_CNT_W			= 4,
	
	parameter	AMPLITUDE_PRECISION	= 16,
	parameter	DHT_BST_MIF			= `DHT_BST_MIF,
	parameter	Y_DC_CW_MIF			= `Y_DC_CW_MIF,
	parameter	Y_AC_CW_MIF			= `Y_AC_CW_MIF,
	parameter	Y_S1_MIF			= `Y_S1_MIF,
	parameter	C_DC_CW_MIF			= `C_DC_CW_MIF,
	parameter	C_AC_CW_MIF			= `C_AC_CW_MIF,
	parameter	C_S1_MIF			= `C_S1_MIF,
	
	parameter	Y_XI_SUBSAMPLE		= `Y_XI_SUBSAMPLE,
	parameter	Y_YI_SUBSAMPLE		= `Y_YI_SUBSAMPLE,
	parameter	C_XI_SUBSAMPLE		= `C_XI_SUBSAMPLE,
	parameter	C_YI_SUBSAMPLE		= `C_YI_SUBSAMPLE,
	parameter	Y_XO_SUBSAMPLE		= `Y_XO_SUBSAMPLE,
	parameter	Y_YO_SUBSAMPLE		= `Y_YO_SUBSAMPLE,
	parameter	C_XO_SUBSAMPLE		= `C_XO_SUBSAMPLE,
	parameter	C_YO_SUBSAMPLE		= `C_YO_SUBSAMPLE,
	parameter	NUM_MATRIX_Y		= 4,
	parameter	NUM_MATRIX_U		= 4,
	parameter	NUM_MATRIX_V		= 4,
`ifdef RTL_SIM
	parameter	REF_MTX_Y			= "ref_mtx_Y.txt",
	parameter	REF_MTX_U			= "ref_mtx_U.txt",
	parameter	REF_MTX_V			= "ref_mtx_V.txt",
`endif
	parameter	NUM_ACCUMULATOR		= 3,
	parameter	NUM_CHANNEL			= 3,
	parameter	MCU_WIDTH			= 8,
	parameter	MCU_HEIGHT			= 8,
	parameter	COLOR_PRECISION		= 8,
	parameter	ZIGZAG_MULTIPLEX	= "SEQUENTIAL",
	
	parameter	DQT_PRECISION		= 8,
	parameter	DQT_BRAM_OUTPUT_REG	= "FALSE",
	parameter	DQT_MIF				= `DQT_MIF,
	parameter	DQT_MULT_LATENCY	= 0,
	
	parameter	DCT_PRECISION		= 9,
	parameter	DCT_MULT_LATENCY	= 0,
	
	parameter	ACCU_MULT_LATENCY	= 0,
	
	parameter	PX_OUT				= 1,
	parameter	PY_OUT				= 1,
	
	parameter	MAX_HRES			= `MAX_HRES,
	parameter	MAX_VRES			= `MAX_VRES,
	parameter	LINE				= `LINE,
	parameter	WR_ADDRESSING		= "BLOCK",
	parameter	RD_ADDRESSING		= "LINE",
	parameter	LB_BRAM_OUTPUT_REG	= "FALSE",
	
	parameter	TFT_DLYC_WIDTH		= 22,
	parameter	TFT_DLY_VAL			= 2**22-1,
	parameter	TFT_TCHW			= 2,
//	parameter	TFT_TWRL			= 1,
//	parameter	TFT_TWRH			= 1,
//	parameter	TFT_TRDL			= 4,
//	parameter	TFT_TRDH			= 4,
//	parameter	RGB_IN_L			= 3
	parameter	TFT_TWRL			= 2,
	parameter	TFT_TWRH			= 2,
	parameter	TFT_TRDL			= 4,
	parameter	TFT_TRDH			= 4,
	parameter	RGB_IN_L			= 1
)
(
	input	i_arstn,
	input	i_sysclk,
	input	i_pll_locked,
	output	o_pll_rstn,

	input	[1:0]i_miso,
	output	o_ss,
	output	o_sclk,
	output	o_mosi,
	output	o_mosi_oe,
	
/*	output	o_nt35510_ss,
	output	o_nt35510_sclk,
	output	o_nt35510_mosi,
	output	o_nt35510_mosi_oe,
	input	i_nt35510_miso,*/
	
`ifdef RTL_SIM
	input	w_next,
	input	w_back,
	input	w_interrupt,
	
	output	[15:0]o_width,
	output	[15:0]o_height,
	output	[15:0]o_sim_Y_wr_mcu,
	output	[15:0]o_sim_U_wr_mcu,
	output	[15:0]o_sim_V_wr_mcu,
	
	input	i_on,
	input	i_off,
	input	i_mode,
	input	i_en,
	input	i_we,
	input	i_re,
	input	[COLOR_PRECISION*3-1:0]i_rgb,
	input	[8:0]i_pix,
`else
	input	jtag_inst1_CAPTURE,
	input	jtag_inst1_DRCK,
	input	jtag_inst1_RESET,
	input	jtag_inst1_RUNTEST,
	input	jtag_inst1_SEL,
	input	jtag_inst1_SHIFT,
	input	jtag_inst1_TCK,
	input	jtag_inst1_TDI,
	input	jtag_inst1_TMS,
	input	jtag_inst1_UPDATE,
	output	jtag_inst1_TDO,
`endif
	output	o_srst,
	output	o_bl,
	output	o_lcd_init_done,
	output	o_csx,
	output	o_dcx,
	output	o_wrx,
	output	o_rdx,
	input	[COLOR_PRECISION*3-1:0]i_d,
	output	[COLOR_PRECISION*3-1:0]o_d,
	output	[COLOR_PRECISION*3-1:0]o_oe
);

`ifdef DBG_MODE
wire	[4:0]w_fsm_status;
wire	[2:0]w_spi_status;
wire	[1:0]w_sos_status;
wire	[2:0]w_scan_state;
`endif

function integer log2;
	input	integer	val;
	integer	i;
	begin
		log2 = 0;
		for (i=0; 2**i<val; i=i+1)
			log2 = i+1;
	end
endfunction

wire	[log2(MAX_HRES)-1:0]w_hres;
wire	[log2(MAX_VRES)-1:0]w_vres;
wire	[log2(MAX_HRES)-1:0]w_hpix;

wire	w_srst;
wire	[1:0]w_miso;
wire	w_ss;
wire	w_sclk;
wire	w_mosi;
wire	w_mosi_oe;

//wire	w_nt35510_miso;
//wire	w_nt35510_ss;
//wire	w_nt35510_sclk;
//wire	w_nt35510_mosi;
//wire	w_nt35510_mosi_oe;

wire	w_jpg_byte_en;
wire	[7:0]w_jpg_byte;
wire	w_ready;
`ifndef RTL_SIM
wire	w_next;
wire	w_back;
wire	w_interrupt;
`endif
wire	w_flush;

wire	[15:0]w_width;
wire	[15:0]w_height;

wire	w_Y_djpg_we;
wire	w_U_djpg_we;
wire	w_V_djpg_we;
wire	[COLOR_PRECISION-1:0]w_Y_djpg_q;
wire	[COLOR_PRECISION-1:0]w_U_djpg_q;
wire	[COLOR_PRECISION-1:0]w_V_djpg_q;

wire	w_lb_full;
wire	w_Y_lb_we;
wire	w_U_lb_we;
wire	w_V_lb_we;
wire	[COLOR_PRECISION-1:0]w_Y_lb_in;
wire	[COLOR_PRECISION-1:0]w_U_lb_in;
wire	[COLOR_PRECISION-1:0]w_V_lb_in;

wire	w_lb_nempty;
wire	[COLOR_PRECISION-1:0]w_Y_lb_out;
wire	[COLOR_PRECISION-1:0]w_U_lb_out;
wire	[COLOR_PRECISION-1:0]w_V_lb_out;

wire	w_de;
wire	[COLOR_PRECISION-1:0]w_R;
wire	[COLOR_PRECISION-1:0]w_G;
wire	[COLOR_PRECISION-1:0]w_B;
wire	w_re;

wire	w_vio_on;
wire	w_vio_off;
wire	w_vio_mode;
wire	w_vio_en;
wire	w_vio_we;
wire	w_vio_re;
wire	w_vio_trigger;
wire	[log2(MAX_HRES)-1:0]w_vio_pix;
wire	[COLOR_PRECISION*3-1:0]w_vio_rgb;
wire	[3:0]w_state;
wire	[log2(MAX_HRES)-1:0]w_x;
wire	[log2(MAX_VRES)-1:0]w_y;
wire	w_lcd_init_done;
wire	w_csx;
wire	w_dcx;
wire	w_wrx;
wire	w_rdx;
wire	[COLOR_PRECISION*3-1:0]w_d;
wire	[COLOR_PRECISION*3-1:0]w_oe;

reg		r_pwm_ld_1P;
reg		r_pwm_ld_2P;

reg		[log2(MAX_HRES)-1:0]r_hres;
reg		[log2(MAX_VRES)-1:0]r_vres;
reg		[log2(MAX_HRES)-1:0]r_hpix;
reg		r_trigger;
//reg		r_Y_lb_we;
//reg		r_U_lb_we;
//reg		r_V_lb_we;
//reg		[COLOR_PRECISION-1:0]r_Y_lb_in;
//reg		[COLOR_PRECISION-1:0]r_U_lb_in;
//reg		[COLOR_PRECISION-1:0]r_V_lb_in;
reg		r_de;
reg		[COLOR_PRECISION-1:0]r_R;
reg		[COLOR_PRECISION-1:0]r_G;
reg		[COLOR_PRECISION-1:0]r_B;

localparam	s_decode	= 1'b0;
localparam	s_display	= 1'b1;
reg		r_state_1P;
reg		[25:0]r_timer_1P;

assign	o_pll_rstn	= i_arstn;
assign	w_miso		= i_miso;
assign	o_ss		= w_ss;
assign	o_sclk		= w_sclk;
assign	o_mosi		= w_mosi;
assign	o_mosi_oe	= w_mosi_oe;

reset
#(
	.IN_RST_ACTIVE	("LOW"),
	.OUT_RST_ACTIVE	("HIGH"),
	.CYCLE			(1)
)
inst_reset
(
	.i_arst	(i_pll_locked),
	.i_clk	(i_sysclk),
	.o_srst	(w_srst)
);

always@(posedge w_srst or posedge i_sysclk)
begin
	if (w_srst)
	begin
		r_pwm_ld_1P	<= 1'b0;
		r_pwm_ld_2P	<= 1'b0;
	end
	else
	begin
		r_pwm_ld_1P	<= 1'b1;
		r_pwm_ld_2P	<= r_pwm_ld_1P;
	end

end

pwm
#(
	.CNT_W(10)
)
inst_pwm
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_pv		(r_pwm_ld_1P & ~r_pwm_ld_2P),
	.i_period	(10'd125),
//	.i_hpw		(10'd63),
	.i_hpw		(10'd125),
	
	.o_pa		(),
	.o_pwm		(o_bl)
);

spi_controller
#(
	.SCLK_FREQ	(SPI_SCLK_FREQ),
	.ADDR_WIDTH	(SPI_FLASH_ADDR_WIDTH),
	.NUM_OF_JPG	(NUM_OF_JPG),
	.START_ADDR	(START_ADDR),
	.ADDR_OFFSET(ADDR_OFFSET)
)
inst_spi_controller
(
	.i_arst				(w_srst),
	.i_sysclk			(i_sysclk),
	.i_next				(w_next | r_timer_1P[25]),
	.i_back				(w_back),
	.i_interrupt		(w_interrupt),
	.i_flush			(w_flush),

`ifdef DBG_MODE
	.o_cmd_en			(),
	.o_cmd				(),
	.o_spi_addr			(),
	.o_rd_valid			(),
	.o_rd_byte			(),
	.o_rd_fifo_empty	(),
	.o_busy				(),
	.o_fsm_status		(w_fsm_status),
	.o_spi_status		(w_spi_status),
	.o_next_pe			(),
	.o_next_ne			(),
	.o_back_pe			(),
	.o_back_ne			(),
	.o_interrupt_pe		(),
	.o_interrupt_ne		(),
	.o_cnt				(),
	.o_device_id		(),
`endif
	
	.i_miso				(w_miso[0]),
	.i_miso_1			(w_miso[1]),
	.o_nss				(w_ss),
	.o_sclk				(w_sclk),
	.o_mosi				(w_mosi),
	.o_mosi_oe			(w_mosi_oe),
	
	.i_ready			(w_ready),
	.o_byte_en			(w_jpg_byte_en),
	.o_byte				(w_jpg_byte)
);

`ifdef RTL_SIM
initial
begin
	$display("Hihi jpeg_streaer.v");
	$display("MAX_HRES = %d", MAX_HRES);
	$display("HRES = %d", w_hres);
	$display("VRES = %d", w_vres);
end

assign	o_width		= w_width;
assign	o_height	= w_height;
`endif

jpeg_decoder
#(
	.SOS_CNT_W				(SOS_CNT_W),
	
	.AMPLITUDE_PRECISION	(AMPLITUDE_PRECISION),
	.DHT_BST_MIF			(DHT_BST_MIF),
	.Y_DC_CW_MIF			(Y_DC_CW_MIF),
	.Y_AC_CW_MIF			(Y_AC_CW_MIF),
	.Y_S1_MIF				(Y_S1_MIF),
	.C_DC_CW_MIF			(C_DC_CW_MIF),
	.C_AC_CW_MIF			(C_AC_CW_MIF),
	.C_S1_MIF				(C_S1_MIF),
	
	.Y_X_SUBSAMPLE			(Y_XI_SUBSAMPLE),
	.Y_Y_SUBSAMPLE			(Y_YI_SUBSAMPLE),
	.C_X_SUBSAMPLE			(C_XI_SUBSAMPLE),
	.C_Y_SUBSAMPLE			(C_YI_SUBSAMPLE),
	.NUM_MATRIX_Y			(NUM_MATRIX_Y),
	.NUM_MATRIX_U			(NUM_MATRIX_U),
	.NUM_MATRIX_V			(NUM_MATRIX_V),
`ifdef RTL_SIM
	.REF_MTX_Y				(REF_MTX_Y),
	.REF_MTX_U				(REF_MTX_U),
	.REF_MTX_V				(REF_MTX_V),
`endif
	.NUM_ACCUMULATOR		(NUM_ACCUMULATOR),
	.NUM_CHANNEL			(NUM_CHANNEL),
	.MCU_WIDTH				(MCU_WIDTH),
	.MCU_HEIGHT				(MCU_HEIGHT),
	.COLOR_PRECISION		(COLOR_PRECISION),
	.ZIGZAG_MULTIPLEX		(ZIGZAG_MULTIPLEX),
	
	.DQT_PRECISION			(DQT_PRECISION),
	.DQT_BRAM_OUTPUT_REG	(DQT_BRAM_OUTPUT_REG),
	.DQT_MIF				(DQT_MIF),
	.DQT_MULT_LATENCY		(DQT_MULT_LATENCY),
	
	.DCT_PRECISION			(DCT_PRECISION),
	.DCT_MULT_LATENCY		(DCT_MULT_LATENCY),
	
	.ACCU_MULT_LATENCY		(ACCU_MULT_LATENCY),
	
	.PX_OUT					(PX_OUT),
	.PY_OUT					(PY_OUT)
)
inst_jpeg_decoder
(
	.i_arst			(w_srst),
	.i_sysclk		(i_sysclk),
`ifdef DBG_MODE
	.o_sos_status	(w_sos_status),
	.o_scan_state	(w_scan_state),
`endif
	.i_byte_en		(w_jpg_byte_en),
	.i_byte			(w_jpg_byte),
	.o_jfif_ready	(w_ready),
	.o_jfif_eoi		(w_flush),
	.o_width		(w_width),
	.o_height		(w_height),
`ifdef RTL_SIM
	.o_sim_Y_wr_mcu	(o_sim_Y_wr_mcu),
	.o_sim_U_wr_mcu	(o_sim_U_wr_mcu),
	.o_sim_V_wr_mcu	(o_sim_V_wr_mcu),
`endif
	
	.i_Y_lb_full	(w_lb_full),
	.i_U_lb_full	(w_lb_full),
	.i_V_lb_full	(w_lb_full),
	.o_Y_lb_we		(w_Y_djpg_we),
	.o_U_lb_we		(w_U_djpg_we),
	.o_V_lb_we		(w_V_djpg_we),
	.o_Y_lb			(w_Y_djpg_q),
	.o_U_lb			(w_U_djpg_q),
	.o_V_lb			(w_V_djpg_q)
);
always@(posedge w_srst or posedge i_sysclk)
begin
	if (w_srst)
	begin
		r_state_1P	<= s_decode;
		r_timer_1P	<= {26{1'b0}};
	end
	else
	begin
		case (r_state_1P)
			s_decode:
			begin
				if (w_flush)
					r_state_1P	<= s_display;
			end
			
			s_display:
			begin
`ifdef DBG_MODE
				if (w_vio_trigger)
`endif
					r_timer_1P	<= r_timer_1P+1'b1;
				if (r_timer_1P == {26{1'b1}})
					r_state_1P	<= s_decode;
			end
			
			default:
			begin
				r_state_1P	<= s_decode;
				r_timer_1P	<= {26{1'b0}};
			end
		endcase
	end
end

subsampling
#(
	.XI_SUBSAMPLE	(Y_XI_SUBSAMPLE),
	.YI_SUBSAMPLE	(Y_YI_SUBSAMPLE),
	.XO_SUBSAMPLE	(Y_XO_SUBSAMPLE),
	.YO_SUBSAMPLE	(Y_YO_SUBSAMPLE),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.COLOR_PRECISION(COLOR_PRECISION),
	.REGISTER		("YES")
)
inst_subsampling_Y
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_we		(w_Y_djpg_we),
	.i_color	(w_Y_djpg_q),
	.o_we		(w_Y_lb_we),
	.o_color	(w_Y_lb_in)
);

subsampling
#(
	.XI_SUBSAMPLE	(C_XI_SUBSAMPLE),
	.YI_SUBSAMPLE	(C_YI_SUBSAMPLE),
	.XO_SUBSAMPLE	(C_XO_SUBSAMPLE),
	.YO_SUBSAMPLE	(C_YO_SUBSAMPLE),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.COLOR_PRECISION(COLOR_PRECISION),
	.REGISTER		("YES")
)
inst_subsampling_U
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_we		(w_U_djpg_we),
	.i_color	(w_U_djpg_q),
	.o_we		(w_U_lb_we),
	.o_color	(w_U_lb_in)
);

subsampling
#(
	.XI_SUBSAMPLE	(C_XI_SUBSAMPLE),
	.YI_SUBSAMPLE	(C_YI_SUBSAMPLE),
	.XO_SUBSAMPLE	(C_XO_SUBSAMPLE),
	.YO_SUBSAMPLE	(C_YO_SUBSAMPLE),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.COLOR_PRECISION(COLOR_PRECISION),
	.REGISTER		("YES")
)
inst_subsampling_V
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_we		(w_V_djpg_we),
	.i_color	(w_V_djpg_q),
	.o_we		(w_V_lb_we),
	.o_color	(w_V_lb_in)
);
/*
always@(posedge w_srst or posedge i_sysclk)
begin
	if (w_srst)
	begin
		r_Y_lb_we	<= 1'b0;
		r_U_lb_we	<= 1'b0;
		r_V_lb_we	<= 1'b0;
		r_Y_lb_in	<= {COLOR_PRECISION{1'b0}};
		r_U_lb_in	<= {COLOR_PRECISION{1'b0}};
		r_V_lb_in	<= {COLOR_PRECISION{1'b0}};
	end
	else
	begin
		if (w_vio_en)
		begin
			r_hres		<= 9'd480-1'b1;
			r_vres		<= 10'd800-1'b1;
			r_hpix		<= w_vio_pix;
			r_Y_lb_we	<= w_vio_we;
			r_U_lb_we	<= w_vio_we;
			r_V_lb_we	<= w_vio_we;
			r_Y_lb_in	<= w_vio_rgb[(2+1)*COLOR_PRECISION-1:2*COLOR_PRECISION];
			r_U_lb_in	<= w_vio_rgb[(1+1)*COLOR_PRECISION-1:1*COLOR_PRECISION];
			r_V_lb_in	<= w_vio_rgb[(0+1)*COLOR_PRECISION-1:0*COLOR_PRECISION];
		end
		else
		begin
			r_hres		<= w_width[log2(MAX_HRES)-1:0]-1'b1;
			r_vres		<= w_height[log2(MAX_VRES)-1:0]-1'b1;
			r_hpix		<= w_width[log2(MAX_HRES)-1:0]-1'b1;
			r_Y_lb_we	<= w_Y_lb_we;
			r_U_lb_we	<= w_U_lb_we;
			r_V_lb_we	<= w_V_lb_we;
			r_Y_lb_in	<= w_Y_lb_in;
			r_U_lb_in	<= w_U_lb_in;
			r_V_lb_in	<= w_V_lb_in;
		end
	end
end

assign	w_hres	= r_hres;
assign	w_vres	= r_vres;
assign	w_hpix	= r_hpix;
*/
//assign	w_hres	= w_width[log2(MAX_HRES)-1:0]-1'b1;
//assign	w_vres	= w_height[log2(MAX_VRES)-1:0]-1'b1;
//assign	w_hpix	= w_width[log2(MAX_HRES)-1:0]-1'b1;
line_buffer
#(
	.COLOR_PRECISION(COLOR_PRECISION),
	.MAX_HRES		(MAX_HRES),
	.HRES_WIDTH		(log2(MAX_HRES)),
	.LINE			(LINE),
	.Y_XI_SUBSAMPLE	(Y_XI_SUBSAMPLE),
	.Y_YI_SUBSAMPLE	(Y_YI_SUBSAMPLE),
	.C_XI_SUBSAMPLE	(C_XI_SUBSAMPLE),
	.C_YI_SUBSAMPLE	(C_YI_SUBSAMPLE),
	.Y_XO_SUBSAMPLE	(Y_XO_SUBSAMPLE),
	.Y_YO_SUBSAMPLE	(Y_YO_SUBSAMPLE),
	.C_XO_SUBSAMPLE	(C_XO_SUBSAMPLE),
	.C_YO_SUBSAMPLE	(C_YO_SUBSAMPLE),
	.WR_ADDRESSING	(WR_ADDRESSING),
	.RD_ADDRESSING	(RD_ADDRESSING),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.BRAM_OUTPUT_REG(LB_BRAM_OUTPUT_REG)
)
inst_line_buffer
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_hres		(w_hres),
//	.i_Y_we		(r_Y_lb_we),
//	.i_U_we		(r_U_lb_we),
//	.i_V_we		(r_V_lb_we),
//	.i_Y_wd		(r_Y_lb_in),
//	.i_U_wd		(r_U_lb_in),
//	.i_V_wd		(r_V_lb_in),
	.i_Y_we		(w_Y_lb_we),
	.i_U_we		(w_U_lb_we),
	.i_V_we		(w_V_lb_we),
	.i_Y_wd		(w_Y_lb_in),
	.i_U_wd		(w_U_lb_in),
	.i_V_wd		(w_V_lb_in),
	.o_full		(w_lb_full),
	.i_re		(w_re),
	.o_Y_rd		(w_Y_lb_out),
	.o_U_rd		(w_U_lb_out),
	.o_V_rd		(w_V_lb_out),
	.o_nempty	(w_lb_nempty)
);

yuv_to_rgb
#(
	.Y_PRECISION	(COLOR_PRECISION),
	.U_PRECISION	(COLOR_PRECISION),
	.V_PRECISION	(COLOR_PRECISION),
	.R_PRECISION	(COLOR_PRECISION),
	.G_PRECISION	(COLOR_PRECISION),
	.B_PRECISION	(COLOR_PRECISION)
)
inst_yuv_to_rgb
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_Y		(w_Y_lb_out),
	.i_U		(w_U_lb_out),
	.i_V		(w_V_lb_out),
//`ifdef RTL_SIM
//	.o_R		(),
//	.o_G		(),
//	.o_B		()
//`else
	.o_R		(w_R),
	.o_G		(w_G),
	.o_B		(w_B)
//`endif
);
/*
shift_reg
#(
	.D_WIDTH(1),
	.TAPE(4)
)
inst_shift_reg
(
	.i_arst	(w_srst),
	.i_clk	(i_sysclk),
	.i_d	(w_lb_nempty),
	.o_q	(w_de)
);
*/
`ifdef RTL_SIM
//shift_reg
//#(
//	.D_WIDTH(3*COLOR_PRECISION),
//	.TAPE(6)
//)
//inst_shift_reg_RGB
//(
//	.i_arst	(w_srst),
//	.i_clk	(i_sysclk),
//	.i_d	({w_Y_lb_out, w_U_lb_out, w_V_lb_out}),
//	.o_q	({w_R, w_G, w_B})
//);

assign	w_vio_on	= i_on;
assign	w_vio_off	= i_off;
assign	w_vio_mode	= i_mode;
assign	w_vio_en	= i_en;
assign	w_vio_we	= i_we;
assign	w_vio_re	= i_re;
assign	w_vio_rgb	= i_rgb;
assign	w_vio_pix	= i_pix;
`else
	`ifdef DBG_MODE
		edb_top edb_top_inst (
		    .bscan_CAPTURE  ( jtag_inst1_CAPTURE ),
		    .bscan_DRCK     ( jtag_inst1_DRCK ),
		    .bscan_RESET    ( jtag_inst1_RESET ),
		    .bscan_RUNTEST  ( jtag_inst1_RUNTEST ),
		    .bscan_SEL      ( jtag_inst1_SEL ),
		    .bscan_SHIFT    ( jtag_inst1_SHIFT ),
		    .bscan_TCK      ( jtag_inst1_TCK ),
		    .bscan_TDI      ( jtag_inst1_TDI ),
		    .bscan_TMS      ( jtag_inst1_TMS ),
		    .bscan_UPDATE   ( jtag_inst1_UPDATE ),
		    .bscan_TDO      ( jtag_inst1_TDO ),
		    .vio0_clk       ( i_sysclk ),
		    .vio0_on        ( w_vio_on ),
		    .vio0_off       ( w_vio_off ),
			.vio0_trigger   ( w_vio_trigger ),
			.vio0_mode      ( w_vio_mode ),
		    .vio0_en        ( w_vio_en ),
		    .vio0_we        ( w_vio_we ),
			.vio0_re        ( w_vio_re ),
			.vio0_rgb       ( w_vio_rgb ),
			.vio0_pix       ( w_vio_pix ),
			.vio0_next      ( w_next ),
			.vio0_back      ( w_back ),
			.vio0_interrupt ( w_interrupt ),
			.vio0_state     ( w_state ),
			.la0_clk        ( i_sysclk ),
			.la0_csx        ( w_csx ),
			.la0_dcx        ( w_dcx ),
			.la0_wrx        ( w_wrx ),
			.la0_rdx        ( w_rdx ),
			.la0_o_d        ( w_d ),
			.la0_oe			( w_oe ),
			.la0_i_d        ( i_d ),
			.la0_state      ( w_state ),
			.la0_x          ( w_x ),
			.la0_y          ( w_y ),
			.la0_fsm_status ( w_fsm_status ),
			.la0_spi_status ( w_spi_status ),
			.la0_sos_status ( w_sos_status ),
			.la0_scan_state ( w_scan_state ),
			.la0_Y_lb_we    ( w_Y_lb_we ),
			.la0_U_lb_we    ( w_U_lb_we ),
			.la0_V_lb_we    ( w_V_lb_we ),
			.la0_lb_full    ( w_lb_full ),
			.la0_lb_nempty  ( w_lb_nempty ),
			.la0_trigger    ( w_vio_trigger )
		);
	`elsif
		assign	w_vio_on		= 1'b0;
		assign	w_vio_off		= 1'b0;
		assign	w_vio_trigger	= 1'b1;
		assign	w_vio_mode		= 1'b0;
		assign	w_vio_en		= 1'b0;
		assign	w_vio_we		= 1'b0;
		assign	w_vio_re		= 1'b0;
		assign	w_vio_rgb		= {8'h0, 8'h0, 8'h0};
		assign	w_vio_pix		= 9'd0;
		assign	w_next			= 1'b0;
		assign	w_back			= 1'b0;
		assign	w_interrupt		= 1'b0;
	`endif
`endif
/*
assign	o_nt35510_ss		= w_nt35510_ss;
assign	o_nt35510_sclk		= w_nt35510_sclk;
assign	o_nt35510_mosi		= w_nt35510_mosi;
assign	o_nt35510_mosi_oe	= w_nt35510_mosi_oe;
assign	w_nt35510_miso		= w_nt35510_miso;

nt35510_spi
#(
	.DIV_WIDTH	(6),
	.SCK_CYCL	(16),
	.SCK_CYCH	(16)
)
inst_nt35510_spi
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.o_ss		(w_nt35510_ss),
	.o_sclk		(w_nt35510_sclk),
	.o_mosi		(w_nt35510_mosi),
	.o_mosi_oe	(w_nt35510_mosi_oe),
	.i_miso		(w_nt35510_miso)
);
*/
always@(posedge w_srst or posedge i_sysclk)
begin
	if (w_srst)
	begin
		r_hres		<= {log2(MAX_HRES){1'b0}};
		r_vres		<= {log2(MAX_VRES){1'b0}};
		r_hpix		<= {log2(MAX_HRES){1'b0}};
		r_trigger	<= 1'b0;
		r_de		<= 1'b0;
		r_R			<= {COLOR_PRECISION{1'b0}};
		r_G			<= {COLOR_PRECISION{1'b0}};
		r_B			<= {COLOR_PRECISION{1'b0}};
	end
	else
	begin
		r_trigger	<= w_vio_trigger;
		
		if (w_vio_en)
		begin
			r_hres	<= 9'd480-1'b1;
			r_vres	<= 10'd800-1'b1;
			r_hpix	<= w_vio_pix;
			r_de	<= w_vio_we;
			r_R		<= w_vio_rgb[(2+1)*COLOR_PRECISION-1:2*COLOR_PRECISION];
			r_G		<= w_vio_rgb[(1+1)*COLOR_PRECISION-1:1*COLOR_PRECISION];
			r_B		<= w_vio_rgb[(0+1)*COLOR_PRECISION-1:0*COLOR_PRECISION];
		end
		else
		begin
			r_hres	<= w_width[log2(MAX_HRES)-1:0]-1'b1;
			r_vres	<= w_height[log2(MAX_VRES)-1:0]-1'b1;
			r_hpix	<= w_width[log2(MAX_HRES)-1:0]-1'b1;
			r_de	<= w_lb_nempty;
			r_R		<= w_R;
			r_G		<= w_G;
			r_B		<= w_B;
		end
	end
end

assign	w_hres	= r_hres;
assign	w_vres	= r_vres;
assign	w_hpix	= r_hpix;

mpu_interface
#(
	.HRES_WIDTH	(log2(MAX_HRES)),
	.VRES_WIDTH	(log2(MAX_VRES)),
	.DATA_WIDTH	(COLOR_PRECISION*3),
	.DLYC_WIDTH	(TFT_DLYC_WIDTH),
	.DLY_VAL	(TFT_DLY_VAL),
	.TCHW		(TFT_TCHW),
	.TWRL		(TFT_TWRL),
	.TWRH		(TFT_TWRH),
	.TRDL		(TFT_TRDL),
	.TRDH		(TFT_TRDH),
	.RGB_IN_L	(RGB_IN_L)
)
inst_mpu_interface
(
	.i_arst		(w_srst),
	.i_sysclk	(i_sysclk),
	.i_width	(w_hres),
	.i_height	(w_vres),
	.i_pixel	(w_hpix),
	.i_on		(w_vio_on),
	.i_off		(w_vio_off),
	.i_mode		(w_vio_mode),
//	.i_mode		(1'b1),
//	.i_trigger	(w_vio_trigger & ~r_trigger),
//	.i_trigger	(w_vio_trigger),
	.i_trigger	(1'b1),
	
//	.i_de		(w_lb_nempty),
//	.i_de		(w_de),
//	.i_rgb		({w_R, w_G, w_B}),
	.i_de		(r_de),
	.i_rgb		({r_R, r_G, r_B}),
//	.i_de		(w_vio_we),
//	.i_rgb		(w_vio_rgb),
	.o_ack		(w_re),
	.o_x		(w_x),
	.o_y		(w_y),
	
	.o_state	(w_state),
	.o_init_done(w_lcd_init_done),
	.o_csx		(w_csx),
	.o_dcx		(w_dcx),
	.o_wrx		(w_wrx),
	.o_rdx		(w_rdx),
	.o_d		(w_d),
	.o_oe		(w_oe)
);

assign	o_srst	= ~w_srst;
assign	o_lcd_init_done	= w_lcd_init_done;
assign	o_csx	= w_csx;
assign	o_dcx	= w_dcx;
assign	o_wrx	= w_wrx;
assign	o_rdx	= w_rdx;
assign	o_d		= w_d;
assign	o_oe	= w_oe;

endmodule
