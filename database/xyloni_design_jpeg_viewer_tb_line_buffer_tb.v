`timescale 1ns/1ns

module line_buffer_tb();

localparam	COLOR_PRECISION	= 8;
localparam	MAX_HRES		= 480;
localparam	LINE			= 16;
localparam	Y_XI_SUBSAMPLE	= 1;
localparam	Y_YI_SUBSAMPLE	= 1;
localparam	C_XI_SUBSAMPLE	= 2;
localparam	C_YI_SUBSAMPLE	= 2;
localparam	Y_XO_SUBSAMPLE	= 1;
localparam	Y_YO_SUBSAMPLE	= 1;
localparam	C_XO_SUBSAMPLE	= 2;
localparam	C_YO_SUBSAMPLE	= 2;
localparam	WR_ADDRESSING	= "BLOCK";
localparam	RD_ADDRESSING	= "LINE";
localparam	MCU_WIDTH		= 8;
localparam	MCU_HEIGHT		= 8;
localparam	BRAM_OUTPUT_REG	= "FALSE";

localparam	s_idle	= 2'b00;
localparam	s_wr	= 2'b01;
localparam	s_rd	= 2'b10;
localparam	s_done	= 2'b11;

reg		r_arst;
reg		r_sysclk;
reg		[8:0]r_hres;

reg		[2:0]r_we;
wire	[COLOR_PRECISION-1:0]w_Y_wd[0:MCU_HEIGHT*MCU_WIDTH*4-1];
wire	[COLOR_PRECISION-1:0]i_Y_wd;
wire	[COLOR_PRECISION-1:0]i_U_wd;
wire	[COLOR_PRECISION-1:0]i_V_wd;
reg		[7:0]r_ptr;
reg		[15:0]r_cycle;
wire	w_full;

reg		r_re;
wire	[COLOR_PRECISION-1:0]w_Y_rd;
wire	[COLOR_PRECISION-1:0]w_U_rd;
wire	[COLOR_PRECISION-1:0]w_V_rd;
wire	w_nempty;

reg		[1:0]r_state_1P;

assign	w_Y_wd[8* 0+0]	= 8'h0_0;
assign	w_Y_wd[8* 0+1]	= 8'h0_1;
assign	w_Y_wd[8* 0+2]	= 8'h0_2;
assign	w_Y_wd[8* 0+3]	= 8'h0_3;
assign	w_Y_wd[8* 0+4]	= 8'h0_4;
assign	w_Y_wd[8* 0+5]	= 8'h0_5;
assign	w_Y_wd[8* 0+6]	= 8'h0_6;
assign	w_Y_wd[8* 0+7]	= 8'h0_7;

assign	w_Y_wd[8* 1+0]	= 8'h1_0;
assign	w_Y_wd[8* 1+1]	= 8'h1_1;
assign	w_Y_wd[8* 1+2]	= 8'h1_2;
assign	w_Y_wd[8* 1+3]	= 8'h1_3;
assign	w_Y_wd[8* 1+4]	= 8'h1_4;
assign	w_Y_wd[8* 1+5]	= 8'h1_5;
assign	w_Y_wd[8* 1+6]	= 8'h1_6;
assign	w_Y_wd[8* 1+7]	= 8'h1_7;

assign	w_Y_wd[8* 2+0]	= 8'h2_0;
assign	w_Y_wd[8* 2+1]	= 8'h2_1;
assign	w_Y_wd[8* 2+2]	= 8'h2_2;
assign	w_Y_wd[8* 2+3]	= 8'h2_3;
assign	w_Y_wd[8* 2+4]	= 8'h2_4;
assign	w_Y_wd[8* 2+5]	= 8'h2_5;
assign	w_Y_wd[8* 2+6]	= 8'h2_6;
assign	w_Y_wd[8* 2+7]	= 8'h2_7;

assign	w_Y_wd[8* 3+0]	= 8'h3_0;
assign	w_Y_wd[8* 3+1]	= 8'h3_1;
assign	w_Y_wd[8* 3+2]	= 8'h3_2;
assign	w_Y_wd[8* 3+3]	= 8'h3_3;
assign	w_Y_wd[8* 3+4]	= 8'h3_4;
assign	w_Y_wd[8* 3+5]	= 8'h3_5;
assign	w_Y_wd[8* 3+6]	= 8'h3_6;
assign	w_Y_wd[8* 3+7]	= 8'h3_7;

assign	w_Y_wd[8* 4+0]	= 8'h4_0;
assign	w_Y_wd[8* 4+1]	= 8'h4_1;
assign	w_Y_wd[8* 4+2]	= 8'h4_2;
assign	w_Y_wd[8* 4+3]	= 8'h4_3;
assign	w_Y_wd[8* 4+4]	= 8'h4_4;
assign	w_Y_wd[8* 4+5]	= 8'h4_5;
assign	w_Y_wd[8* 4+6]	= 8'h4_6;
assign	w_Y_wd[8* 4+7]	= 8'h4_7;

assign	w_Y_wd[8* 5+0]	= 8'h5_0;
assign	w_Y_wd[8* 5+1]	= 8'h5_1;
assign	w_Y_wd[8* 5+2]	= 8'h5_2;
assign	w_Y_wd[8* 5+3]	= 8'h5_3;
assign	w_Y_wd[8* 5+4]	= 8'h5_4;
assign	w_Y_wd[8* 5+5]	= 8'h5_5;
assign	w_Y_wd[8* 5+6]	= 8'h5_6;
assign	w_Y_wd[8* 5+7]	= 8'h5_7;

assign	w_Y_wd[8* 6+0]	= 8'h6_0;
assign	w_Y_wd[8* 6+1]	= 8'h6_1;
assign	w_Y_wd[8* 6+2]	= 8'h6_2;
assign	w_Y_wd[8* 6+3]	= 8'h6_3;
assign	w_Y_wd[8* 6+4]	= 8'h6_4;
assign	w_Y_wd[8* 6+5]	= 8'h6_5;
assign	w_Y_wd[8* 6+6]	= 8'h6_6;
assign	w_Y_wd[8* 6+7]	= 8'h6_7;

assign	w_Y_wd[8* 7+0]	= 8'h7_0;
assign	w_Y_wd[8* 7+1]	= 8'h7_1;
assign	w_Y_wd[8* 7+2]	= 8'h7_2;
assign	w_Y_wd[8* 7+3]	= 8'h7_3;
assign	w_Y_wd[8* 7+4]	= 8'h7_4;
assign	w_Y_wd[8* 7+5]	= 8'h7_5;
assign	w_Y_wd[8* 7+6]	= 8'h7_6;
assign	w_Y_wd[8* 7+7]	= 8'h7_7;

assign	w_Y_wd[8* 8+0]	= 8'h0_8;
assign	w_Y_wd[8* 8+1]	= 8'h0_9;
assign	w_Y_wd[8* 8+2]	= 8'h0_A;
assign	w_Y_wd[8* 8+3]	= 8'h0_B;
assign	w_Y_wd[8* 8+4]	= 8'h0_C;
assign	w_Y_wd[8* 8+5]	= 8'h0_D;
assign	w_Y_wd[8* 8+6]	= 8'h0_E;
assign	w_Y_wd[8* 8+7]	= 8'h0_F;

assign	w_Y_wd[8* 9+0]	= 8'h1_8;
assign	w_Y_wd[8* 9+1]	= 8'h1_9;
assign	w_Y_wd[8* 9+2]	= 8'h1_A;
assign	w_Y_wd[8* 9+3]	= 8'h1_B;
assign	w_Y_wd[8* 9+4]	= 8'h1_C;
assign	w_Y_wd[8* 9+5]	= 8'h1_D;
assign	w_Y_wd[8* 9+6]	= 8'h1_E;
assign	w_Y_wd[8* 9+7]	= 8'h1_F;

assign	w_Y_wd[8*10+0]	= 8'h2_8;
assign	w_Y_wd[8*10+1]	= 8'h2_9;
assign	w_Y_wd[8*10+2]	= 8'h2_A;
assign	w_Y_wd[8*10+3]	= 8'h2_B;
assign	w_Y_wd[8*10+4]	= 8'h2_C;
assign	w_Y_wd[8*10+5]	= 8'h2_D;
assign	w_Y_wd[8*10+6]	= 8'h2_E;
assign	w_Y_wd[8*10+7]	= 8'h2_F;

assign	w_Y_wd[8*11+0]	= 8'h3_8;
assign	w_Y_wd[8*11+1]	= 8'h3_9;
assign	w_Y_wd[8*11+2]	= 8'h3_A;
assign	w_Y_wd[8*11+3]	= 8'h3_B;
assign	w_Y_wd[8*11+4]	= 8'h3_C;
assign	w_Y_wd[8*11+5]	= 8'h3_D;
assign	w_Y_wd[8*11+6]	= 8'h3_E;
assign	w_Y_wd[8*11+7]	= 8'h3_F;

assign	w_Y_wd[8*12+0]	= 8'h4_8;
assign	w_Y_wd[8*12+1]	= 8'h4_9;
assign	w_Y_wd[8*12+2]	= 8'h4_A;
assign	w_Y_wd[8*12+3]	= 8'h4_B;
assign	w_Y_wd[8*12+4]	= 8'h4_C;
assign	w_Y_wd[8*12+5]	= 8'h4_D;
assign	w_Y_wd[8*12+6]	= 8'h4_E;
assign	w_Y_wd[8*12+7]	= 8'h4_F;

assign	w_Y_wd[8*13+0]	= 8'h5_8;
assign	w_Y_wd[8*13+1]	= 8'h5_9;
assign	w_Y_wd[8*13+2]	= 8'h5_A;
assign	w_Y_wd[8*13+3]	= 8'h5_B;
assign	w_Y_wd[8*13+4]	= 8'h5_C;
assign	w_Y_wd[8*13+5]	= 8'h5_D;
assign	w_Y_wd[8*13+6]	= 8'h5_E;
assign	w_Y_wd[8*13+7]	= 8'h5_F;

assign	w_Y_wd[8*14+0]	= 8'h6_8;
assign	w_Y_wd[8*14+1]	= 8'h6_9;
assign	w_Y_wd[8*14+2]	= 8'h6_A;
assign	w_Y_wd[8*14+3]	= 8'h6_B;
assign	w_Y_wd[8*14+4]	= 8'h6_C;
assign	w_Y_wd[8*14+5]	= 8'h6_D;
assign	w_Y_wd[8*14+6]	= 8'h6_E;
assign	w_Y_wd[8*14+7]	= 8'h6_F;

assign	w_Y_wd[8*15+0]	= 8'h7_8;
assign	w_Y_wd[8*15+1]	= 8'h7_9;
assign	w_Y_wd[8*15+2]	= 8'h7_A;
assign	w_Y_wd[8*15+3]	= 8'h7_B;
assign	w_Y_wd[8*15+4]	= 8'h7_C;
assign	w_Y_wd[8*15+5]	= 8'h7_D;
assign	w_Y_wd[8*15+6]	= 8'h7_E;
assign	w_Y_wd[8*15+7]	= 8'h7_F;

assign	w_Y_wd[8*16+0]	= 8'h8_0;
assign	w_Y_wd[8*16+1]	= 8'h8_1;
assign	w_Y_wd[8*16+2]	= 8'h8_2;
assign	w_Y_wd[8*16+3]	= 8'h8_3;
assign	w_Y_wd[8*16+4]	= 8'h8_4;
assign	w_Y_wd[8*16+5]	= 8'h8_5;
assign	w_Y_wd[8*16+6]	= 8'h8_6;
assign	w_Y_wd[8*16+7]	= 8'h8_7;

assign	w_Y_wd[8*17+0]	= 8'h9_0;
assign	w_Y_wd[8*17+1]	= 8'h9_1;
assign	w_Y_wd[8*17+2]	= 8'h9_2;
assign	w_Y_wd[8*17+3]	= 8'h9_3;
assign	w_Y_wd[8*17+4]	= 8'h9_4;
assign	w_Y_wd[8*17+5]	= 8'h9_5;
assign	w_Y_wd[8*17+6]	= 8'h9_6;
assign	w_Y_wd[8*17+7]	= 8'h9_7;

assign	w_Y_wd[8*18+0]	= 8'hA_0;
assign	w_Y_wd[8*18+1]	= 8'hA_1;
assign	w_Y_wd[8*18+2]	= 8'hA_2;
assign	w_Y_wd[8*18+3]	= 8'hA_3;
assign	w_Y_wd[8*18+4]	= 8'hA_4;
assign	w_Y_wd[8*18+5]	= 8'hA_5;
assign	w_Y_wd[8*18+6]	= 8'hA_6;
assign	w_Y_wd[8*18+7]	= 8'hA_7;

assign	w_Y_wd[8*19+0]	= 8'hB_0;
assign	w_Y_wd[8*19+1]	= 8'hB_1;
assign	w_Y_wd[8*19+2]	= 8'hB_2;
assign	w_Y_wd[8*19+3]	= 8'hB_3;
assign	w_Y_wd[8*19+4]	= 8'hB_4;
assign	w_Y_wd[8*19+5]	= 8'hB_5;
assign	w_Y_wd[8*19+6]	= 8'hB_6;
assign	w_Y_wd[8*19+7]	= 8'hB_7;

assign	w_Y_wd[8*20+0]	= 8'hC_0;
assign	w_Y_wd[8*20+1]	= 8'hC_1;
assign	w_Y_wd[8*20+2]	= 8'hC_2;
assign	w_Y_wd[8*20+3]	= 8'hC_3;
assign	w_Y_wd[8*20+4]	= 8'hC_4;
assign	w_Y_wd[8*20+5]	= 8'hC_5;
assign	w_Y_wd[8*20+6]	= 8'hC_6;
assign	w_Y_wd[8*20+7]	= 8'hC_7;

assign	w_Y_wd[8*21+0]	= 8'hD_0;
assign	w_Y_wd[8*21+1]	= 8'hD_1;
assign	w_Y_wd[8*21+2]	= 8'hD_2;
assign	w_Y_wd[8*21+3]	= 8'hD_3;
assign	w_Y_wd[8*21+4]	= 8'hD_4;
assign	w_Y_wd[8*21+5]	= 8'hD_5;
assign	w_Y_wd[8*21+6]	= 8'hD_6;
assign	w_Y_wd[8*21+7]	= 8'hD_7;

assign	w_Y_wd[8*22+0]	= 8'hE_0;
assign	w_Y_wd[8*22+1]	= 8'hE_1;
assign	w_Y_wd[8*22+2]	= 8'hE_2;
assign	w_Y_wd[8*22+3]	= 8'hE_3;
assign	w_Y_wd[8*22+4]	= 8'hE_4;
assign	w_Y_wd[8*22+5]	= 8'hE_5;
assign	w_Y_wd[8*22+6]	= 8'hE_6;
assign	w_Y_wd[8*22+7]	= 8'hE_7;

assign	w_Y_wd[8*23+0]	= 8'hF_0;
assign	w_Y_wd[8*23+1]	= 8'hF_1;
assign	w_Y_wd[8*23+2]	= 8'hF_2;
assign	w_Y_wd[8*23+3]	= 8'hF_3;
assign	w_Y_wd[8*23+4]	= 8'hF_4;
assign	w_Y_wd[8*23+5]	= 8'hF_5;
assign	w_Y_wd[8*23+6]	= 8'hF_6;
assign	w_Y_wd[8*23+7]	= 8'hF_7;

assign	w_Y_wd[8*24+0]	= 8'h8_8;
assign	w_Y_wd[8*24+1]	= 8'h8_9;
assign	w_Y_wd[8*24+2]	= 8'h8_A;
assign	w_Y_wd[8*24+3]	= 8'h8_B;
assign	w_Y_wd[8*24+4]	= 8'h8_C;
assign	w_Y_wd[8*24+5]	= 8'h8_D;
assign	w_Y_wd[8*24+6]	= 8'h8_E;
assign	w_Y_wd[8*24+7]	= 8'h8_F;

assign	w_Y_wd[8*25+0]	= 8'h9_8;
assign	w_Y_wd[8*25+1]	= 8'h9_9;
assign	w_Y_wd[8*25+2]	= 8'h9_A;
assign	w_Y_wd[8*25+3]	= 8'h9_B;
assign	w_Y_wd[8*25+4]	= 8'h9_C;
assign	w_Y_wd[8*25+5]	= 8'h9_D;
assign	w_Y_wd[8*25+6]	= 8'h9_E;
assign	w_Y_wd[8*25+7]	= 8'h9_F;

assign	w_Y_wd[8*26+0]	= 8'hA_8;
assign	w_Y_wd[8*26+1]	= 8'hA_9;
assign	w_Y_wd[8*26+2]	= 8'hA_A;
assign	w_Y_wd[8*26+3]	= 8'hA_B;
assign	w_Y_wd[8*26+4]	= 8'hA_C;
assign	w_Y_wd[8*26+5]	= 8'hA_D;
assign	w_Y_wd[8*26+6]	= 8'hA_E;
assign	w_Y_wd[8*26+7]	= 8'hA_F;

assign	w_Y_wd[8*27+0]	= 8'hB_8;
assign	w_Y_wd[8*27+1]	= 8'hB_9;
assign	w_Y_wd[8*27+2]	= 8'hB_A;
assign	w_Y_wd[8*27+3]	= 8'hB_B;
assign	w_Y_wd[8*27+4]	= 8'hB_C;
assign	w_Y_wd[8*27+5]	= 8'hB_D;
assign	w_Y_wd[8*27+6]	= 8'hB_E;
assign	w_Y_wd[8*27+7]	= 8'hB_F;

assign	w_Y_wd[8*28+0]	= 8'hC_8;
assign	w_Y_wd[8*28+1]	= 8'hC_9;
assign	w_Y_wd[8*28+2]	= 8'hC_A;
assign	w_Y_wd[8*28+3]	= 8'hC_B;
assign	w_Y_wd[8*28+4]	= 8'hC_C;
assign	w_Y_wd[8*28+5]	= 8'hC_D;
assign	w_Y_wd[8*28+6]	= 8'hC_E;
assign	w_Y_wd[8*28+7]	= 8'hC_F;

assign	w_Y_wd[8*29+0]	= 8'hD_8;
assign	w_Y_wd[8*29+1]	= 8'hD_9;
assign	w_Y_wd[8*29+2]	= 8'hD_A;
assign	w_Y_wd[8*29+3]	= 8'hD_B;
assign	w_Y_wd[8*29+4]	= 8'hD_C;
assign	w_Y_wd[8*29+5]	= 8'hD_D;
assign	w_Y_wd[8*29+6]	= 8'hD_E;
assign	w_Y_wd[8*29+7]	= 8'hD_F;

assign	w_Y_wd[8*30+0]	= 8'hE_8;
assign	w_Y_wd[8*30+1]	= 8'hE_9;
assign	w_Y_wd[8*30+2]	= 8'hE_A;
assign	w_Y_wd[8*30+3]	= 8'hE_B;
assign	w_Y_wd[8*30+4]	= 8'hE_C;
assign	w_Y_wd[8*30+5]	= 8'hE_D;
assign	w_Y_wd[8*30+6]	= 8'hE_E;
assign	w_Y_wd[8*30+7]	= 8'hE_F;

assign	w_Y_wd[8*31+0]	= 8'hF_8;
assign	w_Y_wd[8*31+1]	= 8'hF_9;
assign	w_Y_wd[8*31+2]	= 8'hF_A;
assign	w_Y_wd[8*31+3]	= 8'hF_B;
assign	w_Y_wd[8*31+4]	= 8'hF_C;
assign	w_Y_wd[8*31+5]	= 8'hF_D;
assign	w_Y_wd[8*31+6]	= 8'hF_E;
assign	w_Y_wd[8*31+7]	= 8'hF_F;

assign	i_Y_wd	= w_Y_wd[r_ptr];
assign	i_U_wd	= w_Y_wd[r_ptr];
assign	i_V_wd	= w_Y_wd[r_ptr];
line_buffer
#(
	.COLOR_PRECISION(COLOR_PRECISION),
	.MAX_HRES		(MAX_HRES),
	.LINE			(LINE),
	.WR_ADDRESSING	(WR_ADDRESSING),
	.RD_ADDRESSING	(RD_ADDRESSING),
	.MCU_WIDTH		(MCU_WIDTH),
	.MCU_HEIGHT		(MCU_HEIGHT),
	.BRAM_OUTPUT_REG(BRAM_OUTPUT_REG)
)
inst_line_buffer
(
	.i_arst		(r_arst),
	.i_sysclk	(r_sysclk),
	.i_hres		(r_hres),
	.i_Y_we		(r_we[0]),
	.i_U_we		(r_we[1]),
	.i_V_we		(r_we[2]),
	.i_Y_wd		(i_Y_wd),
	.i_U_wd		(i_U_wd),
	.i_V_wd		(i_V_wd),
	.o_full		(w_full),
	.i_re		(r_re),
	.o_Y_rd		(w_Y_rd),
	.o_U_rd		(w_U_rd),
	.o_V_rd		(w_V_rd),
	.o_nempty	(w_nempty)
);

initial
begin
	r_arst	<= 1'b1;
	#5	r_arst	<= 1'b0;
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
		r_state_1P	<= s_idle;
		r_hres		<= {9{1'b0}};
		r_we		<= {3{1'b0}};
		r_ptr		<= {8{1'b0}};
		r_cycle		<= {16{1'b0}};
		r_re		<= 1'b0;
	end
	else
	begin
		case (r_state_1P)
			s_idle:
			begin
				r_state_1P	<= s_wr;
				r_hres		<= 9'd480-1'b1;
				r_we		<= {3{1'b1}};
			end
			
			s_wr:
			begin
				r_ptr	<= r_ptr+1'b1;
				if (r_ptr == MCU_HEIGHT*MCU_WIDTH-1)
				begin
					r_we[2:1]	<= {2{1'b0}};
				end
				else if (r_ptr == MCU_HEIGHT*MCU_WIDTH*4-1)
				begin
					r_ptr		<= {8{1'b0}};
					r_cycle		<= r_cycle+1'b1;
					r_we		<= {3{1'b1}};
					r_re		<= 1'b0;
					if (r_cycle == 16'd29)
					begin
						r_state_1P	<= s_rd;
						r_cycle		<= {8{1'b0}};
						r_we		<= {3{1'b0}};
						r_re		<= 1'b1;
					end
				end
			end
			
			s_rd:
			begin
				r_cycle	<= r_cycle+1'b1;
				if (r_ptr == 16'd480*16'd16-1'b1)
				begin
					r_state_1P	<= s_done;
					r_we		<= {3{1'b0}};
					r_re		<= 1'b0;
				end
			end
			
			s_done:
			begin
			end
		endcase
	end
end

endmodule
