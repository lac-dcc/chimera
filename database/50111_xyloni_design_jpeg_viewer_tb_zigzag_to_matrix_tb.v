// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

`timescale 1ns/1ns

module zigzag_to_matrix_tb();

localparam	DATA_W		= 8;
localparam	MCU_WIDTH	= 8;
localparam	MCU_HEIGHT	= 8;
localparam	NUM_MATRIX	= 4;
localparam	PX_OUT		= 1;
localparam	PY_OUT		= 1;

localparam	s_idle	= 1'b0;
localparam	s_done	= 1'b1;

reg		r_srst;
reg		r_sysclk;

reg		r_state_1P;
reg		r_we;
reg		[255:0]r_ptr;
wire	[DATA_W-1:0]w_data[0:MCU_HEIGHT*MCU_WIDTH-1];
wire	w_full;

reg		r_re;
wire	[PY_OUT*PX_OUT*DATA_W-1:0]w_md;
wire	w_nempty;

/*
0   0_0
1   0_1  1_0
3   2_0  1_1  0_2
6   0_3  1_2  2_1  3_0
10  4_0  3_1  2_2  1_3  0_4
15  0_5  1_4  2_3  3_2  4_1  5_0
21  6_0  5_1  4_2  3_3  2_4  1_5  0_6
28  0_7  1_6  2_5  3_4  4_3  5_2  6_1  7_0
36  7_1  6_2  5_3  4_4  3_5  2_6  1_7
43  2_7  3_6  4_5  5_4  6_3  7_2
49  
*/

assign	w_data[0]	= 8'h0_0;

assign	w_data[1]	= 8'h0_1;
assign	w_data[2]	= 8'h1_0;

assign	w_data[3]	= 8'h2_0;
assign	w_data[4]	= 8'h1_1;
assign	w_data[5]	= 8'h0_2;

assign	w_data[6]	= 8'h0_3;
assign	w_data[7]	= 8'h1_2;
assign	w_data[8]	= 8'h2_1;
assign	w_data[9]	= 8'h3_0;

assign	w_data[10]	= 8'h4_0;
assign	w_data[11]	= 8'h3_1;
assign	w_data[12]	= 8'h2_2;
assign	w_data[13]	= 8'h1_3;
assign	w_data[14]	= 8'h0_4;

assign	w_data[15]	= 8'h0_5;
assign	w_data[16]	= 8'h1_4;
assign	w_data[17]	= 8'h2_3;
assign	w_data[18]	= 8'h3_2;
assign	w_data[19]	= 8'h4_1;
assign	w_data[20]	= 8'h5_0;

assign	w_data[21]	= 8'h6_0;
assign	w_data[22]	= 8'h5_1;
assign	w_data[23]	= 8'h4_2;
assign	w_data[24]	= 8'h3_3;
assign	w_data[25]	= 8'h2_4;
assign	w_data[26]	= 8'h1_5;
assign	w_data[27]	= 8'h0_6;

assign	w_data[28]	= 8'h0_7;
assign	w_data[29]	= 8'h1_6;
assign	w_data[30]	= 8'h2_5;
assign	w_data[31]	= 8'h3_4;
assign	w_data[32]	= 8'h4_3;
assign	w_data[33]	= 8'h5_2;
assign	w_data[34]	= 8'h6_1;
assign	w_data[35]	= 8'h7_0;

assign	w_data[36]	= 8'h7_1;
assign	w_data[37]	= 8'h6_2;
assign	w_data[38]	= 8'h5_3;
assign	w_data[39]	= 8'h4_4;
assign	w_data[40]	= 8'h3_5;
assign	w_data[41]	= 8'h2_6;
assign	w_data[42]	= 8'h1_7;

assign	w_data[43]	= 8'h2_7;
assign	w_data[44]	= 8'h3_6;
assign	w_data[45]	= 8'h4_5;
assign	w_data[46]	= 8'h5_4;
assign	w_data[47]	= 8'h6_3;
assign	w_data[48]	= 8'h7_2;

assign	w_data[49]	= 8'h7_3;
assign	w_data[50]	= 8'h6_4;
assign	w_data[51]	= 8'h5_5;
assign	w_data[52]	= 8'h4_6;
assign	w_data[53]	= 8'h3_7;

assign	w_data[54]	= 8'h4_7;
assign	w_data[55]	= 8'h5_6;
assign	w_data[56]	= 8'h6_5;
assign	w_data[57]	= 8'h7_4;

assign	w_data[58]	= 8'h7_5;
assign	w_data[59]	= 8'h6_6;
assign	w_data[60]	= 8'h5_7;

assign	w_data[61]	= 8'h6_7;
assign	w_data[62]	= 8'h7_6;

assign	w_data[63]	= 8'h7_7;

zigzag_to_matrix
#(
	.DATA_W		(DATA_W),
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
	
	.i_re		(r_re),
	.o_nempty	(w_nempty),
	.o_md		(w_md)
);

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
		r_re		<= 1'b0;
		r_ptr		<= {8{1'b0}};
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
				r_re	<= 1'b1;
			end
		endcase
	end
end

endmodule
