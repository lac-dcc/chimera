// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ns
`include "tb_define.vh"

module lcd_test_tb();

function integer log2;
	input	integer	val;
	integer	i;
	begin
		log2 = 0;
		for (i=0; 2**i<val; i=i+1)
			log2 = i+1;
	end
endfunction

localparam	SPI_SCLK_FREQ		= 6'd1;
localparam	SPI_FLASH_ADDR_WIDTH= 24;
localparam	NUM_OF_JPG			= 32;
localparam	START_ADDR			= `START_ADDR;
localparam	ADDR_OFFSET			= `ADDR_OFFSET;

localparam	SOS_CNT_W			= 4;

localparam	AMPLITUDE_PRECISION	= 16;
localparam	DHT_BST_MIF			= `DHT_BST_MIF;
localparam	Y_DC_CW_MIF			= `Y_DC_CW_MIF;
localparam	Y_AC_CW_MIF			= `Y_AC_CW_MIF;
localparam	Y_S1_MIF			= `Y_S1_MIF;
localparam	C_DC_CW_MIF			= `C_DC_CW_MIF;
localparam	C_AC_CW_MIF			= `C_AC_CW_MIF;
localparam	C_S1_MIF			= `C_S1_MIF;

localparam	Y_XI_SUBSAMPLE		= `Y_XI_SUBSAMPLE;
localparam	Y_YI_SUBSAMPLE		= `Y_YI_SUBSAMPLE;
localparam	C_XI_SUBSAMPLE		= `C_XI_SUBSAMPLE;
localparam	C_YI_SUBSAMPLE		= `C_YI_SUBSAMPLE;
localparam	Y_XO_SUBSAMPLE		= `Y_XO_SUBSAMPLE;
localparam	Y_YO_SUBSAMPLE		= `Y_YO_SUBSAMPLE;
localparam	C_XO_SUBSAMPLE		= `C_XO_SUBSAMPLE;
localparam	C_YO_SUBSAMPLE		= `C_YO_SUBSAMPLE;
localparam	NUM_MATRIX_Y		= 4;
localparam	NUM_MATRIX_U		= 4;
localparam	NUM_MATRIX_V		= 4;
localparam	REF_MTX_Y			= `REF_MTX_Y;
localparam	REF_MTX_U			= `REF_MTX_U;
localparam	REF_MTX_V			= `REF_MTX_V;
localparam	NUM_ACCUMULATOR		= 3;
localparam	NUM_CHANNEL			= 3;
localparam	MCU_WIDTH			= 8;
localparam	MCU_HEIGHT			= 8;
localparam	COLOR_PRECISION		= 8;
localparam	ZIGZAG_MULTIPLEX	= "SEQUENTIAL";

localparam	DQT_PRECISION		= 8;
localparam	DQT_BRAM_OUTPUT_REG	= "FALSE";
localparam	DQT_MIF				= `DQT_MIF;
localparam	DQT_MULT_LATENCY	= 0;

localparam	DCT_PRECISION		= 9;
//localparameter	DCT_BRAM_OUTPUT_REG	= "FALSE";
//localparameter	DCT_MIF				= "";
localparam	DCT_MULT_LATENCY	= 0;

localparam	ACCU_MULT_LATENCY	= 0;

localparam	PX_OUT	= 1;
localparam	PY_OUT	= 1;

localparam	MAX_HRES			= `MAX_HRES;
localparam	MAX_VRES			= `MAX_VRES;
localparam	LINE				= `LINE;
localparam	WR_ADDRESSING		= "BLOCK";
localparam	RD_ADDRESSING		= "LINE";
localparam	LB_BRAM_OUTPUT_REG	= "FALSE";

localparam	TFT_DLYC_WIDTH		= 22;
localparam	TFT_DLY_VAL			= 1;
localparam	TFT_TCHW			= 2;
localparam	TFT_TWRL			= 2;
localparam	TFT_TWRH			= 2;
localparam	TFT_TRDL			= 4;
localparam	TFT_TRDH			= 4;
localparam	RGB_IN_L			= 1;

integer	bmp_file;
integer	bmp_temp;

integer i, j, k;

localparam	bs		= 2;
localparam	xw		= 18;
localparam	yh		= 22;
localparam	jpg_as	= `JPG_AS;
localparam	bmp_as	= `BMP_AS;

localparam	c_Y	= 0;
localparam	c_U	= 1;
localparam	c_V	= 2;

localparam	s_bmp_write		= 2'b00;
localparam	s_bmp_size		= 2'b01;
localparam	s_bmp_header	= 2'b10;
localparam	s_bmp_done		= 2'b11;


reg		r_arstn;
reg		r_sysclk;
reg		r_csx;
reg		r_wrx;

reg		r_on;
reg		r_off;
reg		r_mode;
reg		r_en;
reg		r_we;
reg		r_re;
reg		[COLOR_PRECISION*3-1:0]r_rgb;
reg		[log2(MAX_HRES)-1:0]r_pix;

reg		[1:0]r_bmp_state;
reg		[7:0]r_bmp_byte[0:bmp_as-1];
reg		[31:0]r_bmp_ptr;
reg		[31:0]r_bmp_x;
reg		[31:0]r_bmp_y;
reg		r_bmp_done;

wire	[15:0]w_width;
wire	[15:0]w_height;
wire	[15:0]w_sim_Y_wr_mcu;
wire	[15:0]w_sim_U_wr_mcu;
wire	[15:0]w_sim_V_wr_mcu;

wire	w_WPn;
wire	w_HOLDn;
wire	w_miso;
wire	w_DIO;
wire	w_nss;
wire	w_sclk;
wire	w_mosi;
wire	w_mosi_oe;

//wire	w_nt35510_miso;
//wire	w_nt35510_ss;
//wire	w_nt35510_sclk;
//wire	w_nt35510_mosi;
//wire	w_nt35510_mosi_oe;

wire	w_lcd_init_done;
wire	w_csx;
wire	w_dcx;
wire	w_wrx;
wire	w_rdx;
wire	[COLOR_PRECISION*3-1:0]w_d;
wire	[COLOR_PRECISION*3-1:0]w_oe;

wire	[31:0]w_bmp_width;
wire	[31:0]w_bmp_height;

assign	w_WPn	= 1'b1;
assign	w_HOLDn	= 1'b1;

W25Q32JV
inst_w25q32jv
(
	.DIO	(w_DIO),
	.WPn	(w_WPn),
	.HOLDn	(w_HOLDn),
	.DO		(w_miso),
	.CSn	(w_nss),
	.CLK	(w_sclk)
);

pullup(w_DIO);
pullup(w_miso);
assign	w_DIO	= (w_mosi_oe)?
					w_mosi:1'bz;

//assign	w_nt35510_miso	= 1'b1;
jpeg_streamer
#(
	.SPI_SCLK_FREQ			(SPI_SCLK_FREQ),
	.SPI_FLASH_ADDR_WIDTH	(SPI_FLASH_ADDR_WIDTH),
	.NUM_OF_JPG				(NUM_OF_JPG),
	.START_ADDR				(START_ADDR),
	.ADDR_OFFSET			(ADDR_OFFSET),
	
	.SOS_CNT_W				(SOS_CNT_W),
	
	.AMPLITUDE_PRECISION	(AMPLITUDE_PRECISION),
	.DHT_BST_MIF			(DHT_BST_MIF),
	.Y_DC_CW_MIF			(Y_DC_CW_MIF),
	.Y_AC_CW_MIF			(Y_AC_CW_MIF),
	.Y_S1_MIF				(Y_S1_MIF),
	.C_DC_CW_MIF			(C_DC_CW_MIF),
	.C_AC_CW_MIF			(C_AC_CW_MIF),
	.C_S1_MIF				(C_S1_MIF),
	
	.Y_XI_SUBSAMPLE			(Y_XI_SUBSAMPLE),
	.Y_YI_SUBSAMPLE			(Y_YI_SUBSAMPLE),
	.C_XI_SUBSAMPLE			(C_XI_SUBSAMPLE),
	.C_YI_SUBSAMPLE			(C_YI_SUBSAMPLE),
	.Y_XO_SUBSAMPLE			(Y_XO_SUBSAMPLE),
	.Y_YO_SUBSAMPLE			(Y_YO_SUBSAMPLE),
	.C_XO_SUBSAMPLE			(C_XO_SUBSAMPLE),
	.C_YO_SUBSAMPLE			(C_YO_SUBSAMPLE),
	.NUM_MATRIX_Y			(NUM_MATRIX_Y),
	.NUM_MATRIX_U			(NUM_MATRIX_U),
	.NUM_MATRIX_V			(NUM_MATRIX_V),
	.REF_MTX_Y				(REF_MTX_Y),
	.REF_MTX_U				(REF_MTX_U),
	.REF_MTX_V				(REF_MTX_V),
	
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
//	.DCT_BRAM_OUTPUT_REG	(DCT_BRAM_OUTPUT_REG),
//	.DCT_MIF				(DCT_MIF),
	.DCT_MULT_LATENCY		(DCT_MULT_LATENCY),
	
	.ACCU_MULT_LATENCY		(ACCU_MULT_LATENCY),
	
	.PX_OUT					(PX_OUT),
	.PY_OUT					(PY_OUT),
	
	.MAX_HRES				(MAX_HRES),
	.MAX_VRES				(MAX_VRES),
	.LINE					(LINE),
	.WR_ADDRESSING			(WR_ADDRESSING),
	.RD_ADDRESSING			(RD_ADDRESSING),
	.LB_BRAM_OUTPUT_REG		(LB_BRAM_OUTPUT_REG),
	
	.TFT_DLYC_WIDTH			(TFT_DLYC_WIDTH),
	.TFT_DLY_VAL			(TFT_DLY_VAL),
	.TFT_TCHW				(TFT_TCHW),
	.TFT_TWRL				(TFT_TWRL),
	.TFT_TWRH				(TFT_TWRH),
	.TFT_TRDL				(TFT_TRDL),
	.TFT_TRDH				(TFT_TRDH),
	.RGB_IN_L				(RGB_IN_L)
)
inst_jpeg_streamer
(
	.i_arstn			(r_arstn),
	.i_sysclk			(r_sysclk),
	.i_pll_locked		(r_arstn),
	.o_pll_rstn			(),
	
	.w_next				(1'b0),
	.w_back				(1'b0),
	.w_interrupt		(1'b0),
	
	.i_miso				({w_DIO, w_miso}),
	.o_ss				(w_nss),
	.o_sclk				(w_sclk),
	.o_mosi				(w_mosi),
	.o_mosi_oe			(w_mosi_oe),
	
//	.o_nt35510_ss		(w_nt35510_ss),
//	.o_nt35510_sclk		(w_nt35510_sclk),
//	.o_nt35510_mosi		(w_nt35510_mosi),
//	.o_nt35510_mosi_oe	(w_nt35510_mosi_oe),
//	.i_nt35510_miso		(w_nt35510_miso),
	
	.o_width			(w_width),
	.o_height			(w_height),
	.o_sim_Y_wr_mcu		(w_sim_Y_wr_mcu),
	.o_sim_U_wr_mcu		(w_sim_U_wr_mcu),
	.o_sim_V_wr_mcu		(w_sim_V_wr_mcu),
	
	.i_on				(r_on),
	.i_off				(r_off),
	.i_mode				(r_mode),
	.i_en				(r_en),
	.i_we				(r_we),
	.i_re				(r_re),
	.i_rgb				(r_rgb),
	.i_pix				(r_pix),
	
	.o_srst				(),
	.o_lcd_init_done	(w_lcd_init_done),
	.o_csx				(w_csx),
	.o_dcx				(w_dcx),
	.o_wrx				(w_wrx),
	.o_rdx				(w_rdx),
	.i_d				({COLOR_PRECISION*3{1'b0}}),
	.o_d				(w_d),
	.o_oe				(w_oe)
);

initial
begin
	r_arstn	<= 1'b0;
	#10	r_arstn	<= 1'b1;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#5	r_sysclk	<= ~r_sysclk;
end

always@(negedge r_arstn or posedge r_sysclk)
begin
	if (~r_arstn)
	begin
		r_on	<= 1'b0;
		r_off	<= 1'b0;
		r_mode	<= 1'b0;
		r_en	<= 1'b0;
		r_we	<= 1'b0;
		r_re	<= 1'b0;
		r_rgb	<= {COLOR_PRECISION{1'b0}};
		r_pix	<= {log2(MAX_HRES){1'b0}};
		
		r_bmp_byte[   0] <= 'h42; r_bmp_byte[   1] <= 'h4D;
		r_bmp_byte[bs+0] <= 'h00; r_bmp_byte[bs+1] <= 'h00; r_bmp_byte[bs+2] <= 'h00; r_bmp_byte[bs+3] <= 'h00;
		r_bmp_byte[   6] <= 'h00; r_bmp_byte[   7] <= 'h00; r_bmp_byte[   8] <= 'h00; r_bmp_byte[   9] <= 'h00;
		r_bmp_byte[  10] <= 'h36; r_bmp_byte[  11] <= 'h00; r_bmp_byte[  12] <= 'h00; r_bmp_byte[  13] <= 'h00;
		r_bmp_byte[  14] <= 'h28; r_bmp_byte[  15] <= 'h00; r_bmp_byte[  16] <= 'h00; r_bmp_byte[  17] <= 'h00;
		r_bmp_byte[xw+0] <= 'h00; r_bmp_byte[xw+1] <= 'h00; r_bmp_byte[xw+2] <= 'h00; r_bmp_byte[xw+3] <= 'h00;
		r_bmp_byte[yh+0] <= 'h00; r_bmp_byte[yh+1] <= 'h00; r_bmp_byte[yh+2] <= 'h00; r_bmp_byte[yh+3] <= 'h00;
		r_bmp_byte[  26] <= 'h01; r_bmp_byte[  27] <= 'h00;
		r_bmp_byte[  28] <= 'h18; r_bmp_byte[  29] <= 'h00;
		r_bmp_byte[  30] <= 'h00; r_bmp_byte[  31] <= 'h00; r_bmp_byte[  32] <= 'h00; r_bmp_byte[  33] <= 'h00;
		r_bmp_byte[  34] <= 'h10; r_bmp_byte[  35] <= 'h00; r_bmp_byte[  36] <= 'h00; r_bmp_byte[  37] <= 'h00;
		r_bmp_byte[  38] <= 'h13; r_bmp_byte[  39] <= 'h0B; r_bmp_byte[  40] <= 'h00; r_bmp_byte[  41] <= 'h00;
		r_bmp_byte[  42] <= 'h13; r_bmp_byte[  43] <= 'h0B; r_bmp_byte[  44] <= 'h00; r_bmp_byte[  45] <= 'h00;
		r_bmp_byte[  46] <= 'h00; r_bmp_byte[  47] <= 'h00; r_bmp_byte[  48] <= 'h00; r_bmp_byte[  49] <= 'h00;
		r_bmp_byte[  50] <= 'h00; r_bmp_byte[  51] <= 'h00; r_bmp_byte[  52] <= 'h00; r_bmp_byte[  53] <= 'h00;
		for (i=54; i<bmp_as; i=i+1)
		begin
			r_bmp_byte[i]	<= 'hff;
		end
		
		r_bmp_state	<= s_bmp_write;
		r_bmp_ptr	<= 32'd54;
		r_bmp_x		<= 32'd0;
		r_bmp_y		<= 32'd0;
		r_bmp_done	<= 1'b0;
		
		r_csx		<= 1'b1;
		r_wrx		<= 1'b1;
	end
	else
	begin
		r_csx		<= w_csx;
		r_wrx		<= w_wrx;
		
		r_bmp_byte[yh+1]	<= w_height[15:8];
		r_bmp_byte[yh+0]	<= w_height[7:0];
		r_bmp_byte[xw+1]	<= w_width[15:8];
		r_bmp_byte[xw+0]	<= w_width[7:0];
		
`ifdef RTL_SIM
		if (w_csx & ~r_csx)
			$display("MCU Y/U/V = %d / %d / %d, Y/X = %d / %d", w_sim_Y_wr_mcu, w_sim_U_wr_mcu, w_sim_V_wr_mcu, r_bmp_y, r_bmp_x);
`endif
		
		case (r_bmp_state)
			s_bmp_write:
			begin
				if (w_wrx & ~r_wrx & w_dcx & w_lcd_init_done)
				begin
					r_bmp_ptr				<= r_bmp_ptr+2'd3;
					r_bmp_byte[r_bmp_ptr+2]	<= w_d[(2+1)*COLOR_PRECISION-1:2*COLOR_PRECISION];
					r_bmp_byte[r_bmp_ptr+1]	<= w_d[(1+1)*COLOR_PRECISION-1:1*COLOR_PRECISION];
					r_bmp_byte[r_bmp_ptr+0]	<= w_d[(0+1)*COLOR_PRECISION-1:0*COLOR_PRECISION];
					r_bmp_x					<= r_bmp_x+1'b1;
					if (r_bmp_x == w_bmp_width-1'b1)
					begin
						r_bmp_x	<= 32'd0;
						r_bmp_y	<= r_bmp_y+1'b1;
						r_bmp_ptr	<= r_bmp_ptr+3+(r_bmp_ptr+3-16'd54)%3'd4;
						if (r_bmp_y == w_bmp_height-1'b1)
						begin
							r_bmp_state	<= s_bmp_size;
							r_bmp_x		<= r_bmp_x;
							r_bmp_y		<= r_bmp_y;
						end
					end
				end
			end
			
			s_bmp_size:
			begin
				r_bmp_state	<= s_bmp_header;
				r_bmp_ptr	<= r_bmp_ptr+(r_bmp_ptr-16'd54)%3'd4;
			end
			
			s_bmp_header:
			begin
				r_bmp_state			<= s_bmp_done;
				r_bmp_byte[bs+0]	<= r_bmp_ptr[7:0];
				r_bmp_byte[bs+1]	<= r_bmp_ptr[15:8];
				r_bmp_done			<= 1'b1;
			end
			
			s_bmp_done:
			begin
			end
		endcase
	end
end

initial
begin
	$display("Hihi jpeg_decoder_tb.v");
	$display(`JPG_FILE);
	$display(`DHT_BST_MIF);
	$display(`Y_DC_CW_MIF);
	$display(`Y_AC_CW_MIF);
	$display(`Y_S1_MIF);
	$display(`C_DC_CW_MIF);
	$display(`C_AC_CW_MIF);
	$display(`C_S1_MIF);
	$display(`DQT_MIF);
	@(posedge r_bmp_done);
	$display("hihi");
	bmp_file	= $fopen(`BMP_FILE, "w");
	for (j=0; j<r_bmp_ptr ; j=j+1)
	begin
		$display("debug_on%d", j);
		$fwrite(bmp_file, "%c", r_bmp_byte[j]);
	end
	$fclose(bmp_file);
end

assign	w_bmp_width		= {r_bmp_byte[xw+3], r_bmp_byte[xw+2], r_bmp_byte[xw+1], r_bmp_byte[xw+0]};
assign	w_bmp_height	= {r_bmp_byte[yh+3], r_bmp_byte[yh+2], r_bmp_byte[yh+1], r_bmp_byte[yh+0]};

endmodule
