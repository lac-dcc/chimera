// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ns

`ifdef huff_simple0
	`define	ADOBE_WEB	ADOBE_WEB
	`define	JPG_FILE	"huff_simple0.jpg"
	`define	BMP_FILE	"nuff_simple0_fpga.bmp"
`endif

`ifdef test_pattern_01
	`define	MSPAINT		MSPAINT
	`define	JPG_FILE	"test_pattern_01.jpg"
	`define	BMP_FILE	"test_pattern_01_fpga.bmp"
`endif

`ifdef ADOBE_WEB
	`define	DHT_BST_MIF	"../mif/adobe_web/adobe_web_dht_bst.memh"
	`define	Y_DC_CW_MIF	"../mif/t8/adobe_web_y_dc_codeword.memb"
	`define	Y_AC_CW_MIF	"../mif/adobe_web/adobe_web_y_ac_codeword.memb"
	`define	Y_S1_MIF	"../mif/adobe_web/adobe_web_y_symbol1.memh"
	`define	C_DC_CW_MIF	"../mif/t8/adobe_web_y_dc_codeword.memb"
	`define	C_AC_CW_MIF	"../mif/adobe_web/adobe_web_c_ac_codeword.memb"
	`define	C_S1_MIF	"../mif/adobe_web/adobe_web_c_symbol1.memh"
	`define	DQT_MIF		"../mif/adobe_web/adobe_web_dqt.memh"
`endif

`ifdef MSPAINT
	`define	DHT_BST_MIF	"../mif/mspaint/mspaint_dht_bst.memh"
	`define	Y_DC_CW_MIF	"../mif/t8/mspaint_y_dc_codeword.memb"
	`define	Y_AC_CW_MIF	"../mif/mspaint/mspaint_y_ac_codeword.memb"
	`define	Y_S1_MIF	"../mif/mspaint/mspaint_y_symbol1.memh"
	`define	C_DC_CW_MIF	"../mif/t8/mspaint_y_dc_codeword.memb"
	`define	C_AC_CW_MIF	"../mif/mspaint/mspaint_c_ac_codeword.memb"
	`define	C_S1_MIF	"../mif/mspaint/mspaint_c_symbol1.memh"
	`define	DQT_MIF		"../mif/mspaint/mspaint_dqt.memh"
`endif

module entropy_decoder_tb();

localparam	SOS_CNT_W			= 4;

localparam	AMPLITUDE_PRECISION	= 16;
localparam	YUV_COMPRESSION		= 4;
localparam	DHT_BST_MIF			= `DHT_BST_MIF;
localparam	Y_DC_CW_MIF			= `Y_DC_CW_MIF;
localparam	Y_AC_CW_MIF			= `Y_AC_CW_MIF;
localparam	Y_S1_MIF			= `Y_S1_MIF;
localparam	C_DC_CW_MIF			= `C_DC_CW_MIF;
localparam	C_AC_CW_MIF			= `C_AC_CW_MIF;
localparam	C_S1_MIF			= `C_S1_MIF;

parameter	MCU_WIDTH			= 8;
parameter	MCU_HEIGHT			= 8;
parameter	NUM_MATRIX			= 4;
parameter	PX_OUT	= 1;
parameter	PY_OUT	= 1;


integer	jpeg_file;
integer	temp;

reg		r_arst;
reg		r_sysclk;
reg		r_byte_en;
reg		[7:0]r_byte[0:1023];
reg		[15:0]r_ptr;
wire	[7:0]w_byte;
wire	w_ready;
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

assign	w_byte			= r_byte[r_ptr];
assign	w_Y_dq_ready	= 1'b1;
assign	w_U_dq_ready	= 1'b1;
assign	w_V_dq_ready	= 1'b1;

jfif_parser
#(
	.SOS_CNT_W(SOS_CNT_W)
)
inst_jfif_parser
(
	.i_arst			(r_arst),
	.i_sysclk		(r_sysclk),
	.i_byte_en		(r_byte_en),
	.i_byte			(w_byte),
	.o_jfif_ready	(w_ready),
	.i_sos_re		(w_ed_ready),
	.o_sos_start	(w_start),
	.o_sos_scan_en	(w_scan_en),
	.o_sos_ecs_bit	(w_ecs_bit)
);

entropy_decoder
#(
	.AMPLITUDE_PRECISION	(AMPLITUDE_PRECISION),
	.MCU_SIZE				(MCU_HEIGHT*MCU_WIDTH),
	.YUV_COMPRESSION		(YUV_COMPRESSION),
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
	.i_arst			(r_arst),
	.i_srst			(w_start),
	.i_sysclk		(r_sysclk),
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

zigzag_to_matrix
#(
	.DQT_00(2),
	.DQT_01(1),
	.DQT_02(1),
	.DQT_03(2),
	.DQT_04(3),
	.DQT_05(5),
	.DQT_06(6),
	.DQT_07(7),
	
	.DQT_10(1),
	.DQT_11(1),
	.DQT_12(2),
	.DQT_13(2),
	.DQT_14(3),
	.DQT_15(7),
	.DQT_16(7),
	.DQT_17(7),
	
	.DQT_20(2),
	.DQT_21(2),
	.DQT_22(2),
	.DQT_23(3),
	.DQT_24(5),
	.DQT_25(7),
	.DQT_26(8),
	.DQT_27(7),
	
	.DQT_30(2),
	.DQT_31(2),
	.DQT_32(3),
	.DQT_33(3),
	.DQT_34(6),
	.DQT_35(10),
	.DQT_36(10),
	.DQT_37(7),
	
	.DQT_40(2),
	.DQT_41(3),
	.DQT_42(4),
	.DQT_43(7),
	.DQT_44(8),
	.DQT_45(13),
	.DQT_46(12),
	.DQT_47(9),
	
	.DQT_50(3),
	.DQT_51(4),
	.DQT_52(7),
	.DQT_53(8),
	.DQT_54(10),
	.DQT_55(12),
	.DQT_56(14),
	.DQT_57(11),
	
	.DQT_60(6),
	.DQT_61(8),
	.DQT_62(9),
	.DQT_63(10),
	.DQT_64(12),
	.DQT_65(15),
	.DQT_66(14),
	.DQT_67(12),
	
	.DQT_70(9),
	.DQT_71(11),
	.DQT_72(11),
	.DQT_73(12),
	.DQT_74(13),
	.DQT_75(12),
	.DQT_76(12),
	.DQT_77(12),
	
	.DATA_W		(AMPLITUDE_PRECISION),
	.MCU_WIDTH	(MCU_WIDTH),
	.MCU_HEIGHT	(MCU_HEIGHT),
	.NUM_MATRIX	(NUM_MATRIX),
	.PX_OUT		(PX_OUT),
	.PY_OUT		(PY_OUT),
	.MATRIX_TYPE("REG")
)
inst_zigzag_to_matrix_Y
(
	.i_arst		(r_arst),
	.i_srst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_we		(w_Y_de),
	.i_data		(w_Y_B),
	.o_full		(),
	
	.i_re		(1'b0),
	.o_nempty	(),
	.o_md		()
);

zigzag_to_matrix
#(
	.DQT_00(2),
	.DQT_01(2),
	.DQT_02(3),
	.DQT_03(6),
	.DQT_04(12),
	.DQT_05(12),
	.DQT_06(12),
	.DQT_07(12),
	
	.DQT_10(2),
	.DQT_11(3),
	.DQT_12(3),
	.DQT_13(8),
	.DQT_14(12),
	.DQT_15(12),
	.DQT_16(12),
	.DQT_17(12),
	
	.DQT_20(3),
	.DQT_21(3),
	.DQT_22(7),
	.DQT_23(12),
	.DQT_24(12),
	.DQT_25(12),
	.DQT_26(12),
	.DQT_27(12),
	
	.DQT_30(6),
	.DQT_31(8),
	.DQT_32(12),
	.DQT_33(12),
	.DQT_34(12),
	.DQT_35(12),
	.DQT_36(12),
	.DQT_37(12),
	
	.DQT_40(12),
	.DQT_41(12),
	.DQT_42(12),
	.DQT_43(12),
	.DQT_44(12),
	.DQT_45(12),
	.DQT_46(12),
	.DQT_47(12),
	
	.DQT_50(12),
	.DQT_51(12),
	.DQT_52(12),
	.DQT_53(12),
	.DQT_54(12),
	.DQT_55(12),
	.DQT_56(12),
	.DQT_57(12),
	
	.DQT_60(12),
	.DQT_61(12),
	.DQT_62(12),
	.DQT_63(12),
	.DQT_64(12),
	.DQT_65(12),
	.DQT_66(12),
	.DQT_67(12),
	
	.DQT_70(12),
	.DQT_71(12),
	.DQT_72(12),
	.DQT_73(12),
	.DQT_74(12),
	.DQT_75(12),
	.DQT_76(12),
	.DQT_77(12),
	
	.DATA_W		(AMPLITUDE_PRECISION),
	.MCU_WIDTH	(MCU_WIDTH),
	.MCU_HEIGHT	(MCU_HEIGHT),
	.NUM_MATRIX	(NUM_MATRIX),
	.PX_OUT		(PX_OUT),
	.PY_OUT		(PY_OUT),
	.MATRIX_TYPE("REG")
)
inst_zigzag_to_matrix_U
(
	.i_arst		(r_arst),
	.i_srst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_we		(w_U_de),
	.i_data		(w_U_B),
	.o_full		(),
	
	.i_re		(1'b0),
	.o_nempty	(),
	.o_md		()
);

zigzag_to_matrix
#(
	.DQT_00(2),
	.DQT_01(2),
	.DQT_02(3),
	.DQT_03(6),
	.DQT_04(12),
	.DQT_05(12),
	.DQT_06(12),
	.DQT_07(12),
	
	.DQT_10(2),
	.DQT_11(3),
	.DQT_12(3),
	.DQT_13(8),
	.DQT_14(12),
	.DQT_15(12),
	.DQT_16(12),
	.DQT_17(12),
	
	.DQT_20(3),
	.DQT_21(3),
	.DQT_22(7),
	.DQT_23(12),
	.DQT_24(12),
	.DQT_25(12),
	.DQT_26(12),
	.DQT_27(12),
	
	.DQT_30(6),
	.DQT_31(8),
	.DQT_32(12),
	.DQT_33(12),
	.DQT_34(12),
	.DQT_35(12),
	.DQT_36(12),
	.DQT_37(12),
	
	.DQT_40(12),
	.DQT_41(12),
	.DQT_42(12),
	.DQT_43(12),
	.DQT_44(12),
	.DQT_45(12),
	.DQT_46(12),
	.DQT_47(12),
	
	.DQT_50(12),
	.DQT_51(12),
	.DQT_52(12),
	.DQT_53(12),
	.DQT_54(12),
	.DQT_55(12),
	.DQT_56(12),
	.DQT_57(12),
	
	.DQT_60(12),
	.DQT_61(12),
	.DQT_62(12),
	.DQT_63(12),
	.DQT_64(12),
	.DQT_65(12),
	.DQT_66(12),
	.DQT_67(12),
	
	.DQT_70(12),
	.DQT_71(12),
	.DQT_72(12),
	.DQT_73(12),
	.DQT_74(12),
	.DQT_75(12),
	.DQT_76(12),
	.DQT_77(12),
	
	.DATA_W		(AMPLITUDE_PRECISION),
	.MCU_WIDTH	(MCU_WIDTH),
	.MCU_HEIGHT	(MCU_HEIGHT),
	.NUM_MATRIX	(NUM_MATRIX),
	.PX_OUT		(PX_OUT),
	.PY_OUT		(PY_OUT),
	.MATRIX_TYPE("REG")
)
inst_zigzag_to_matrix_V
(
	.i_arst		(r_arst),
	.i_srst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_we		(w_V_de),
	.i_data		(w_V_B),
	.o_full		(),
	
	.i_re		(1'b0),
	.o_nempty	(),
	.o_md		()
);

initial
begin
	jpeg_file	= $fopen(`JPG_FILE, "rb");
	temp		= $fread(r_byte, jpeg_file, 0, 1023);
	$fclose(jpeg_file);
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
		#2.5	r_sysclk	<= ~r_sysclk;
end

always@(posedge r_arst or posedge r_sysclk)
begin
	if (r_arst)
	begin
		r_byte_en	<= 1'b0;
		r_ptr		<= 'h0;
	end
	else
	begin
		r_byte_en	<= 1'b1;
		if (w_ready)
		begin
			r_ptr		<= r_ptr+1'b1;
//			if (r_ptr == 16'd652)
			if ({r_byte[r_ptr], r_byte[r_ptr]} == 'hFFD9)
			begin
				r_byte_en	<= 1'b0;
				r_ptr		<= r_ptr;
			end
		end
	end
end

endmodule
