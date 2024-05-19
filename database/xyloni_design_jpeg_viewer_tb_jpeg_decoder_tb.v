// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ns
`include "../rtl/jpeg_viewer_define.vh"
`include "tb_define.vh"

module jpeg_decoder_tb();

function integer log2;
	input	integer	val;
	integer	i;
	begin
		log2 = 0;
		for (i=0; 2**i<val; i=i+1)
			log2 = i+1;
	end
endfunction

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

integer	jpg_file;
integer	jpg_temp;

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
reg		r_jpg_state;
reg		r_jpg_byte_en;
reg		[7:0]r_jpg_byte[0:jpg_as-1];
reg		[31:0]r_jpg_ptr;
wire	[7:0]w_jpg_byte;
wire	w_ready;

reg		[1:0]r_bmp_state;
reg		[7:0]r_bmp_byte[0:bmp_as-1];
reg		[31:0]r_bmp_ptr;
reg		[31:0]r_bmp_x;
reg		[31:0]r_bmp_y;
reg		[6:0]r_bmp_we;
reg		r_bmp_done;

`ifdef RTL_SIM
wire	[15:0]w_sim_Y_wr_mcu;
wire	[15:0]w_sim_U_wr_mcu;
wire	[15:0]w_sim_V_wr_mcu;
`endif

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

wire	[COLOR_PRECISION-1:0]w_R;
wire	[COLOR_PRECISION-1:0]w_G;
wire	[COLOR_PRECISION-1:0]w_B;

wire	[31:0]w_bmp_width;
wire	[31:0]w_bmp_height;

assign	w_jpg_byte	= r_jpg_byte[r_jpg_ptr];

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
//	.DCT_BRAM_OUTPUT_REG	(DCT_BRAM_OUTPUT_REG),
//	.DCT_MIF				(DCT_MIF),
	.DCT_MULT_LATENCY		(DCT_MULT_LATENCY),
	
	.ACCU_MULT_LATENCY		(ACCU_MULT_LATENCY),
	
	.PX_OUT					(PX_OUT),
	.PY_OUT					(PY_OUT)
)
inst_jpeg_decoder
(
	.i_arst			(r_arst),
	.i_sysclk		(r_sysclk),
	.i_byte_en		(r_jpg_byte_en),
	.i_byte			(w_jpg_byte),
	.o_jfif_ready	(w_ready),
`ifdef RTL_SIM
	.o_sim_Y_wr_mcu	(w_sim_Y_wr_mcu),
	.o_sim_U_wr_mcu	(w_sim_U_wr_mcu),
	.o_sim_V_wr_mcu	(w_sim_V_wr_mcu),
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
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
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
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
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
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_we		(w_V_djpg_we),
	.i_color	(w_V_djpg_q),
	.o_we		(w_V_lb_we),
	.o_color	(w_V_lb_in)
);

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
	.i_arst(r_arst),
	.i_sysclk(r_sysclk),
	.i_hres(w_bmp_width[log2(MAX_HRES)-1:0]),
	.i_Y_we(w_Y_lb_we),
	.i_U_we(w_U_lb_we),
	.i_V_we(w_V_lb_we),
	.i_Y_wd(w_Y_lb_in),
	.i_U_wd(w_U_lb_in),
	.i_V_wd(w_V_lb_in),
	.o_full(w_lb_full),
	.i_re(w_lb_nempty),
	.o_Y_rd(w_Y_lb_out),
	.o_U_rd(w_U_lb_out),
	.o_V_rd(w_V_lb_out),
	.o_nempty(w_lb_nempty)
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
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_de		(w_lb_nempty),
	.i_Y		(w_Y_lb_out),
	.i_U		(w_U_lb_out),
	.i_V		(w_V_lb_out),
	.o_de		(),
	.o_R		(w_R),
	.o_G		(w_G),
	.o_B		(w_B)
);

initial
begin
	jpg_file	= $fopen(`JPG_FILE, "rb");
	jpg_temp	= $fread(r_jpg_byte, jpg_file, 0, `JPG_AS-1);
	$fclose(jpg_file);
end

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
		r_jpg_state		<= s_jpg_scan;
		r_jpg_byte_en	<= 1'b0;
		r_jpg_ptr		<= 'h0;
		
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
		r_bmp_we	<= {7{1'b0}};
		r_bmp_done	<= 1'b0;
	end
	else
	begin
//		r_bmp_we[0]	<= w_Y_lb_we;
		r_bmp_we[0]	<= w_lb_nempty;
		for (k=0; k<6; k=k+1)
		begin
			r_bmp_we[k+1]	<= r_bmp_we[k];
		end
		
		case (r_jpg_state)
			s_jpg_scan:
			begin
				r_jpg_byte_en	<= 1'b1;
				if (w_ready)
				begin
					r_jpg_ptr	<= r_jpg_ptr+1'b1;
					
					if ({r_jpg_byte[r_jpg_ptr], r_jpg_byte[r_jpg_ptr+1]} == 'hFFC0)
					begin
						r_bmp_byte[xw+0]	= r_jpg_byte[r_jpg_ptr+8];
						r_bmp_byte[xw+1]	= r_jpg_byte[r_jpg_ptr+7];
						r_bmp_byte[yh+0]	= r_jpg_byte[r_jpg_ptr+6];
						r_bmp_byte[yh+1]	= r_jpg_byte[r_jpg_ptr+5];
					end
					
//					if (r_jpg_ptr == 16'd652)
					if ({r_jpg_byte[r_jpg_ptr], r_jpg_byte[r_jpg_ptr+1]} == 'hFFD9)
					begin
						r_jpg_state		<= s_jpg_done;
					end
				end
			end
			
			s_jpg_done:
			begin
				r_jpg_byte_en	<= 1'b0;
			end
		endcase
		
`ifdef RTL_SIM
		if (r_bmp_we[5] & ~r_bmp_we[6])
			$display("MCU Y/U/V = %d / %d / %d, Y/X = %d / %d", w_sim_Y_wr_mcu, w_sim_U_wr_mcu, w_sim_V_wr_mcu, r_bmp_y, r_bmp_x);
`endif
		
		case (r_bmp_state)
			s_bmp_write:
			begin
				if (r_bmp_we[5])
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
