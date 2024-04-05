`timescale 1ns/1ns
`include "../rtl/jpeg_viewer_define.vh"
`include "tb_define.vh"

module jpeg_vievwer_tb();

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
//localparam	LINE				= 8;
localparam	LINE				= `LINE;
localparam	WR_ADDRESSING		= "BLOCK";
localparam	RD_ADDRESSING		= "LINE";
localparam	LB_BRAM_OUTPUT_REG	= "FALSE";

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

localparam	s_jpg_scan		= 1'b0;
localparam	s_jpg_done		= 1'b1;
localparam	s_bmp_write		= 2'b00;
localparam	s_bmp_size		= 2'b01;
localparam	s_bmp_header	= 2'b10;
localparam	s_bmp_done		= 2'b11;

reg		r_arst;
reg		r_sysclk;
reg		[15:0]r_jpg_byte;
reg		r_sos;
reg		[3:0]r_cnt;
reg		r_de;

reg		[1:0]r_bmp_state;
reg		[7:0]r_bmp_byte[0:bmp_as-1];
reg		[31:0]r_bmp_ptr;
reg		[31:0]r_bmp_x;
reg		[31:0]r_bmp_y;
reg		r_bmp_done;

wire	w_jpg_byte_en;
wire	[7:0]w_jpg_byte;
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

wire	w_de;
wire	[COLOR_PRECISION-1:0]w_R;
wire	[COLOR_PRECISION-1:0]w_G;
wire	[COLOR_PRECISION-1:0]w_B;

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

jpeg_vievwer
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
	.LINE					(LINE),
	.WR_ADDRESSING			(WR_ADDRESSING),
	.RD_ADDRESSING			(RD_ADDRESSING),
	.LB_BRAM_OUTPUT_REG		(LB_BRAM_OUTPUT_REG)
)
inst_jpeg_vievwer
(
	.i_arstn		(~r_arst),
	.i_sysclk		(r_sysclk),
	.i_pll_locked	(~r_arst),
	.o_pll_rstn		(),
	
	.w_next			(1'b0),
	.w_back			(1'b0),
	.w_interrupt	(1'b0),
	
	.i_miso			({w_DIO, w_miso}),
	.o_ss			(w_nss),
	.o_sclk			(w_sclk),
	.o_mosi			(w_mosi),
	.o_mosi_oe		(w_mosi_oe),
	
	.o_jpg_byte_en	(w_jpg_byte_en),
	.o_jpg_byte		(w_jpg_byte),
	.o_sim_Y_wr_mcu	(w_sim_Y_wr_mcu),
	.o_sim_U_wr_mcu	(w_sim_U_wr_mcu),
	.o_sim_V_wr_mcu	(w_sim_V_wr_mcu),
	
	.w_de			(w_de),
	.w_R			(w_R),
	.w_G			(w_G),
	.w_B			(w_B)
);

initial
begin
	r_arst	<= 1'b1;
	#10	r_arst	<= 1'b0;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#5	r_sysclk	<= ~r_sysclk;
end

always@(posedge r_arst or posedge r_sysclk)
begin
	if (r_arst)
	begin
		r_jpg_byte	<= {16{1'b0}};
		r_sos		<= 1'b0;
		r_cnt		<= {4{1'b0}};
		
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
		
		r_de		<= 1'b0;
	end
	else
	begin
		r_de		<= w_de;
		
		if (w_jpg_byte_en)
		begin
			r_jpg_byte	<= {r_jpg_byte[7:0], w_jpg_byte};
			
			if (r_jpg_byte == 16'hFFC0)
			begin
				r_jpg_byte	<= r_jpg_byte;
				r_sos		<= 1'b1;
				r_cnt		<= r_cnt+1'b1;
				if (r_cnt == 4'd5-4'd2)
					r_bmp_byte[yh+1]	<= w_jpg_byte;
				else if (r_cnt == 4'd6-4'd2)
					r_bmp_byte[yh+0]	<= w_jpg_byte;
				else if (r_cnt == 4'd7-4'd2)
					r_bmp_byte[xw+1]	<= w_jpg_byte;
				else if (r_cnt == 4'd8-4'd2)
				begin
					r_bmp_byte[xw+0]	<= w_jpg_byte;
					
					r_jpg_byte	<= {r_jpg_byte[7:0], w_jpg_byte};
					r_sos		<= 1'b0;
					r_cnt		<= {4{1'b0}};
				end
			end
		end
		
`ifdef RTL_SIM
		if (w_de & ~r_de)
			$display("MCU Y/U/V = %d / %d / %d, Y/X = %d / %d", w_sim_Y_wr_mcu, w_sim_U_wr_mcu, w_sim_V_wr_mcu, r_bmp_y, r_bmp_x);
`endif
		
		case (r_bmp_state)
			s_bmp_write:
			begin
				if (w_de)
				begin
					r_bmp_ptr				<= r_bmp_ptr+2'd3;
					r_bmp_byte[r_bmp_ptr+2]	<= w_R;
					r_bmp_byte[r_bmp_ptr+1]	<= w_G;
					r_bmp_byte[r_bmp_ptr+0]	<= w_B;
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
