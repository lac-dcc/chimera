// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

module tft_tester
#(
	parameter	MAX_HRES			= 512,
	parameter	MAX_VRES			= 1024,
	parameter	COLOR_PRECISION		= 8,
	
	parameter	TFT_DLYC_WIDTH		= 22,
	parameter	TFT_DLY_VAL			= 2**22-1,
	parameter	TFT_TCHW			= 2,
	parameter	TFT_TWRL			= 2,
	parameter	TFT_TWRH			= 2,
	parameter	TFT_TRDL			= 4,
	parameter	TFT_TRDH			= 4,
	parameter	RGB_IN_L			= 2
)
(
	input	i_arstn,
	input	i_sysclk,
	input	i_pll_locked,
	output	o_pll_rstn,
	
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
	
	output	o_srst,
	output	o_lcd_init_done,
	output	o_csx,
	output	o_dcx,
	output	o_wrx,
	output	o_rdx,
	input	[COLOR_PRECISION*3-1:0]i_d,
	output	[COLOR_PRECISION*3-1:0]o_d,
	output	[COLOR_PRECISION*3-1:0]o_oe
);

function integer log2;
	input	integer	val;
	integer	i;
	begin
		log2 = 0;
		for (i=0; 2**i<val; i=i+1)
			log2 = i+1;
	end
endfunction


wire	w_srst;

wire	w_vio_on;
wire	w_vio_off;
wire	[log2(MAX_HRES)-1:0]w_vio_hres;
wire	[log2(MAX_VRES)-1:0]w_vio_vres;
wire	[log2(MAX_HRES)-1:0]w_vio_hpix;
wire	w_vio_en;
wire	w_vio_mode;
wire	w_vio_we;
wire	w_vio_re;
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

reg		r_vio_we;

assign	o_pll_rstn	= i_arstn;

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
	.vio0_hres      ( w_vio_hres ),
	.vio0_vres      ( w_vio_vres ),
	.vio0_hpix      ( w_vio_hpix ),
    .vio0_en        ( w_vio_en ),
    .vio0_mode      ( w_vio_mode ),
    .vio0_we        ( w_vio_we ),
	.vio0_re        ( w_vio_re ),
	.vio0_rgb       ( w_vio_rgb ),
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
	.la0_y          ( w_y )
);

always@(posedge w_srst or posedge i_sysclk)
begin
	if (w_srst)
		r_vio_we	<= 1'b0;
	else
		r_vio_we	<= w_vio_we;

end
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
	.i_width	(w_vio_hres),
	.i_height	(w_vio_vres),
	.i_pixel	(w_vio_hpix),
	.i_on		(w_vio_on),
	.i_off		(w_vio_off),
	.i_mode		(w_vio_mode),
	
	.i_de		(w_vio_we & ~r_vio_we),
	.i_rgb		(w_vio_rgb),
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
