// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ns

module dq_idct_tb();

localparam	NUM_ACCUMULATOR		= 3;
localparam	NUM_MATRIX			= 4;
localparam	NUM_CHANNEL			= 3;
localparam	AMPLITUDE_PRECISION	= 16;
localparam	COLOR_PRECISION		= 8;

localparam	DQT_PRECISION		= 8;
localparam	DQT_BRAM_OUTPUT_REG	= "FALSE";
localparam	DQT_MIF				= "../mif/wiki_dqt.memh";
localparam	DQT_MULT_LATENCY	= 0;

localparam	DCT_PRECISION		= 9;
//localparam	DCT_BRAM_OUTPUT_REG	= "FALSE";
//localparam	DCT_MIF				= "";
localparam	DCT_MULT_LATENCY	= 0;
	
localparam	ACCU_MULT_LATENCY	= 0;

localparam	PX_OUT	= 1;
localparam	PY_OUT	= 1;

localparam	s_idle	= 1'b0;
localparam	s_done	= 1'b1;

reg		r_srst;
reg		r_sysclk;

reg		r_state_1P;
reg		r_we;
reg		[7:0]r_ptr;
wire	[AMPLITUDE_PRECISION-1:0]w_data[0:MCU_HEIGHT*MCU_WIDTH-1];
wire	w_full;

wire	w_re;
wire	[PY_OUT*PX_OUT*AMPLITUDE_PRECISION-1:0]w_md;
wire	w_nempty;

wire	w_lb_full;
wire	w_Y_lb_we;
wire	w_U_lb_we;
wire	w_V_lb_we;
wire	[COLOR_PRECISION-1:0]w_Y_lb;
wire	[COLOR_PRECISION-1:0]w_U_lb;
wire	[COLOR_PRECISION-1:0]w_V_lb;

wire	[AMPLITUDE_PRECISION-1:0]B0[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B1[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B2[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B3[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B4[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B5[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B6[0:MCU_WIDTH-1];
wire	[AMPLITUDE_PRECISION-1:0]B7[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU0[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU1[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU2[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU3[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU4[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU5[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU6[0:MCU_WIDTH-1];
reg		[COLOR_PRECISION-1:0]MCU7[0:MCU_WIDTH-1];
reg		[2:0]r_y, r_x;

assign	w_data[0]	= ~('d26)+1'b1;

assign	w_data[1]	= ~('d3)+1'b1;
assign	w_data[2]	= 'd0;

assign	w_data[3]	= ~('d3)+1'b1;
assign	w_data[4]	= ~('d2)+1'b1;
assign	w_data[5]	= ~('d6)+1'b1;

assign	w_data[6]	= 'd2;
assign	w_data[7]	= ~('d4)+1'b1;
assign	w_data[8]	= 'd1;
assign	w_data[9]	= ~('d3)+1'b1;

assign	w_data[10]	= 'd1;
assign	w_data[11]	= 'd1;
assign	w_data[12]	= 'd5;
assign	w_data[13]	= 'd1;
assign	w_data[14]	= 'd2;

assign	w_data[15]	= ~('d1)+1'b1;
assign	w_data[16]	= 'd1;
assign	w_data[17]	= ~('d1)+1'b1;
assign	w_data[18]	= 'd2;
assign	w_data[19]	= 'd0;
assign	w_data[20]	= 'd0;

assign	w_data[21]	= 'd0;
assign	w_data[22]	= 'd0;
assign	w_data[23]	= 'd0;
assign	w_data[24]	= ~('d1)+1'b1;
assign	w_data[25]	= ~('d1)+1'b1;
assign	w_data[26]	= 'd0;
assign	w_data[27]	= 'd0;

assign	w_data[28]	= 'd0;
assign	w_data[29]	= 'd0;
assign	w_data[30]	= 'd0;
assign	w_data[31]	= 'd0;
assign	w_data[32]	= 'd0;
assign	w_data[33]	= 'd0;
assign	w_data[34]	= 'd0;
assign	w_data[35]	= 'd0;

assign	w_data[36]	= 'd0;
assign	w_data[37]	= 'd0;
assign	w_data[38]	= 'd0;
assign	w_data[39]	= 'd0;
assign	w_data[40]	= 'd0;
assign	w_data[41]	= 'd0;
assign	w_data[42]	= 'd0;

assign	w_data[43]	= 'd0;
assign	w_data[44]	= 'd0;
assign	w_data[45]	= 'd0;
assign	w_data[46]	= 'd0;
assign	w_data[47]	= 'd0;
assign	w_data[48]	= 'd0;

assign	w_data[49]	= 'd0;
assign	w_data[50]	= 'd0;
assign	w_data[51]	= 'd0;
assign	w_data[52]	= 'd0;
assign	w_data[53]	= 'd0;

assign	w_data[54]	= 'd0;
assign	w_data[55]	= 'd0;
assign	w_data[56]	= 'd0;
assign	w_data[57]	= 'd0;

assign	w_data[58]	= 'd0;
assign	w_data[59]	= 'd0;
assign	w_data[60]	= 'd0;

assign	w_data[61]	= 'd0;
assign	w_data[62]	= 'd0;

assign	w_data[63]	= 'd0;

assign	B0[0]=w_data[ 0];assign B0[1]=w_data[ 1];assign B0[2]=w_data[ 5];assign B0[3]=w_data[ 6];assign B0[4]=w_data[14];assign B0[5]=w_data[15];assign B0[6]=w_data[27];assign B0[7]=w_data[28];
assign	B1[0]=w_data[ 2];assign B1[1]=w_data[ 4];assign B1[2]=w_data[ 7];assign B1[3]=w_data[13];assign B1[4]=w_data[16];assign B1[5]=w_data[26];assign B1[6]=w_data[29];assign B1[7]=w_data[42];
assign	B2[0]=w_data[ 3];assign B2[1]=w_data[ 8];assign B2[2]=w_data[12];assign B2[3]=w_data[17];assign B2[4]=w_data[25];assign B2[5]=w_data[30];assign B2[6]=w_data[41];assign B2[7]=w_data[43];
assign	B3[0]=w_data[ 9];assign B3[1]=w_data[11];assign B3[2]=w_data[18];assign B3[3]=w_data[24];assign B3[4]=w_data[31];assign B3[5]=w_data[40];assign B3[6]=w_data[44];assign B3[7]=w_data[53];
assign	B4[0]=w_data[10];assign B4[1]=w_data[19];assign B4[2]=w_data[23];assign B4[3]=w_data[32];assign B4[4]=w_data[39];assign B4[5]=w_data[45];assign B4[6]=w_data[52];assign B4[7]=w_data[54];
assign	B5[0]=w_data[20];assign B5[1]=w_data[22];assign B5[2]=w_data[33];assign B5[3]=w_data[38];assign B5[4]=w_data[46];assign B5[5]=w_data[51];assign B5[6]=w_data[55];assign B5[7]=w_data[60];
assign	B6[0]=w_data[21];assign B6[1]=w_data[34];assign B6[2]=w_data[37];assign B6[3]=w_data[47];assign B6[4]=w_data[50];assign B6[5]=w_data[56];assign B6[6]=w_data[59];assign B6[7]=w_data[61];
assign	B7[0]=w_data[35];assign B7[1]=w_data[36];assign B7[2]=w_data[48];assign B7[3]=w_data[49];assign B7[4]=w_data[57];assign B7[5]=w_data[58];assign B7[6]=w_data[62];assign B7[7]=w_data[63];

zigzag_to_matrix
#(
	.DATA_W		(AMPLITUDE_PRECISION),
	.MCU_WIDTH	(MCU_WIDTH),
	.MCU_HEIGHT	(MCU_HEIGHT),
	.NUM_MATRIX	(NUM_MATRIX),
	.PX_OUT		(PX_OUT),
	.PY_OUT		(PY_OUT),
	.MATRIX_TYPE("RAM")
)
inst_zigzag_to_matrix
(
	.i_arst		(r_srst),
	.i_srst		(r_srst),
	.i_sysclk	(r_sysclk),
	.i_we		(r_we),
	.i_data		(w_data[r_ptr[5:0]]),
	.o_full		(w_full),
	
	.i_re		(w_re),
	.o_nempty	(w_nempty),
	.o_md		(w_md)
);

dq_idct
#(
	.NUM_ACCUMULATOR		(NUM_ACCUMULATOR),
	.NUM_CHANNEL			(NUM_CHANNEL),
	.AMPLITUDE_PRECISION	(AMPLITUDE_PRECISION),
	.COLOR_PRECISION		(COLOR_PRECISION),
	
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
	.i_arst		(r_srst),
	.i_sysclk	(r_sysclk),
	
	.i_Y_de		(w_nempty),
	.i_U_de		(w_nempty),
	.i_V_de		(w_nempty),
	.i_Y_B		(w_md),
	.i_U_B		(w_md),
	.i_V_B		(w_md),
	.o_Y_re		(w_re),
	.o_U_re		(),
	.o_V_re		(),
	
	.i_Y_lb_full	(w_lb_full),
	.i_U_lb_full	(w_lb_full),
	.i_V_lb_full	(w_lb_full),
	.o_Y_lb_we		(w_Y_lb_we),
	.o_U_lb_we		(w_U_lb_we),
	.o_V_lb_we		(w_V_lb_we),
	.o_Y_lb			(w_Y_lb),
	.o_U_lb			(w_U_lb),
	.o_V_lb			(w_V_lb)
);

assign	w_lb_full	= 1'b0;

initial
begin
	r_srst	<= 1'b1;
	#10	r_srst	<= 1'b0;
end

initial
begin
	r_sysclk	<= 1'b1;
	forever
		#2.5	r_sysclk	<= ~r_sysclk;
end

always@(posedge r_srst or posedge r_sysclk)
begin
	if (r_srst)
	begin
		r_state_1P	<= s_idle;
		r_we		<= 1'b0;
		r_ptr		<= {8{1'b0}};
		r_x			<= {3{1'b0}};
		r_y			<= {3{1'b0}};
	end
	else
	begin
		case (r_state_1P)
			s_idle:
			begin
				r_we	<= 1'b1;
				if (r_we)
				begin
					r_ptr	<= r_ptr+1'b1;
					if (r_ptr == {8{1'b1}}-1'b1)
						r_state_1P	<= s_done;
				end
			end
			
			s_done:
			begin
				r_we	<= 1'b0;
			end
		endcase
		
		if (w_Y_lb_we)
		begin
			r_x	<= r_x+1'b1;
			if (r_x == {3{1'b1}})
			begin
				r_y	<= r_y+1'b1;
			end
			
			if (r_y == 3'd1)
				MCU1[r_x]	<= w_Y_lb;
			else if (r_y == 3'd2)
				MCU2[r_x]	<= w_Y_lb;
			else if (r_y == 3'd3)
				MCU3[r_x]	<= w_Y_lb;
			else if (r_y == 3'd4)
				MCU4[r_x]	<= w_Y_lb;
			else if (r_y == 3'd5)
				MCU5[r_x]	<= w_Y_lb;
			else if (r_y == 3'd6)
				MCU6[r_x]	<= w_Y_lb;
			else if (r_y == 3'd7)
				MCU7[r_x]	<= w_Y_lb;
			else
				MCU0[r_x]	<= w_Y_lb;
		end
	end
end

endmodule
