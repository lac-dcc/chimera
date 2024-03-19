module zigzag_to_matrix
#(
`ifdef RTL_SIM
	parameter	DQT_00		= 1,
	parameter	DQT_01		= 1,
	parameter	DQT_02		= 1,
	parameter	DQT_03		= 1,
	parameter	DQT_04		= 1,
	parameter	DQT_05		= 1,
	parameter	DQT_06		= 1,
	parameter	DQT_07		= 1,
	
	parameter	DQT_10		= 1,
	parameter	DQT_11		= 1,
	parameter	DQT_12		= 1,
	parameter	DQT_13		= 1,
	parameter	DQT_14		= 1,
	parameter	DQT_15		= 1,
	parameter	DQT_16		= 1,
	parameter	DQT_17		= 1,
	
	parameter	DQT_20		= 1,
	parameter	DQT_21		= 1,
	parameter	DQT_22		= 1,
	parameter	DQT_23		= 1,
	parameter	DQT_24		= 1,
	parameter	DQT_25		= 1,
	parameter	DQT_26		= 1,
	parameter	DQT_27		= 1,
	
	parameter	DQT_30		= 1,
	parameter	DQT_31		= 1,
	parameter	DQT_32		= 1,
	parameter	DQT_33		= 1,
	parameter	DQT_34		= 1,
	parameter	DQT_35		= 1,
	parameter	DQT_36		= 1,
	parameter	DQT_37		= 1,
	
	parameter	DQT_40		= 1,
	parameter	DQT_41		= 1,
	parameter	DQT_42		= 1,
	parameter	DQT_43		= 1,
	parameter	DQT_44		= 1,
	parameter	DQT_45		= 1,
	parameter	DQT_46		= 1,
	parameter	DQT_47		= 1,
	
	parameter	DQT_50		= 1,
	parameter	DQT_51		= 1,
	parameter	DQT_52		= 1,
	parameter	DQT_53		= 1,
	parameter	DQT_54		= 1,
	parameter	DQT_55		= 1,
	parameter	DQT_56		= 1,
	parameter	DQT_57		= 1,
	
	parameter	DQT_60		= 1,
	parameter	DQT_61		= 1,
	parameter	DQT_62		= 1,
	parameter	DQT_63		= 1,
	parameter	DQT_64		= 1,
	parameter	DQT_65		= 1,
	parameter	DQT_66		= 1,
	parameter	DQT_67		= 1,
	
	parameter	DQT_70		= 1,
	parameter	DQT_71		= 1,
	parameter	DQT_72		= 1,
	parameter	DQT_73		= 1,
	parameter	DQT_74		= 1,
	parameter	DQT_75		= 1,
	parameter	DQT_76		= 1,
	parameter	DQT_77		= 1,
	
	parameter	REF_MTX_FILE= "ref_mtx_file.txt",
`endif
	parameter	DATA_W		= 16,
	parameter	MCU_WIDTH	= 8,
	parameter	MCU_HEIGHT	= 8,
	parameter	NUM_MATRIX	= 4,
	parameter	PX_OUT		= 1,
	parameter	PY_OUT		= 1,
//	parameter	MATRIX_TYPE	= "REG"	// REG/RAM
	parameter	MATRIX_TYPE	= "RAM"	// REG/RAM
)
(
	input	i_arst,
	input	i_srst,
	input	i_sysclk,
	input	i_we,
	input	[DATA_W-1:0]i_data,
	output	o_full,
`ifdef RTL_SIM
	output	[15:0]o_sim_wr_mcu,
`endif
	
	input	i_re,
	output	o_nempty,
	output	[PY_OUT*PX_OUT*DATA_W-1:0]o_md
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

`ifdef RTL_SIM
genvar k;
`endif
generate
	if (MATRIX_TYPE == "REG")
	begin
		integer	a, b, c, d, e, f, g, h, i, j, k, l, m, n, z;
		
		reg		[MCU_WIDTH*DATA_W-1:0]r_matrix_1P[0:MCU_HEIGHT-1];
		
		/*
		0,0 <= 0,1                                    | 0,2 <= 0,3                      | 0,4 <= 0,5                                    | 0,6 <= 0,7
		7,0 <= 7,1                                    | 7,2 <= 7,3                      | 7,4 <= 7,5                                    | 7,6 <= 7,7
		----------------------------------------------+---------------------------------+-----------------------------------------------+------------------------------------------------------
		0,1 <= 1,0                                    | 0,3 <= 1,2 <= 2,1 <= 3,0        | 0,5 <= 1,4 <= 2,3 <= 3,2 <= 4,1 <= 5,0        | 0,7 <= 1,6 <= 2,5 <= 3,4 <= 4,3 <= 5,2 <= 6,1 <= 7,0
		2,7 <= 3,6 <= 4,5 <= 5,4 <= 6,3 <= 7,2        | 4,7 <= 5,6 <= 6,5 <= 7,4        | 6,7 <= 7,6                                    |
		----------------------------------------------+---------------------------------+-----------------------------------------------+------------------------------------------------------
		1,0 <= 2,0                                    | 3,0 <= 4,0                      | 5,0 <= 6,0                                    |
		1,7 <= 2,7                                    | 3,7 <= 4,7                      | 5,7 <= 6,7                                    |
		----------------------------------------------+---------------------------------+-----------------------------------------------+
		2,0 <= 1,1 <= 0,2                             | 4,0 <= 3,1 <= 2,2 <= 1,3 <= 4,0 | 6,0 <= 5,1 <= 4,2 <= 3,3 <= 2,4 <= 1,5 <= 0,6 |
		7,1 <= 6,2 <= 5,3 <= 4,4 <= 3,5 <= 2,6 <= 1,7 | 7,3 <= 6,4 <= 5,5 <= 4,6 <= 3,7 | 7,5 <= 6,6 <= 5,7                             |
		*/
		
		always@(posedge i_sysclk)
		begin
			if (i_srst)
			begin
				for (z=0; z<MCU_HEIGHT; z=z+1)
				begin
					r_matrix_1P[z]	<= {MCU_WIDTH*DATA_W{1'b0}};
				end
			end
			else
			begin
				if (i_we)
				begin
					r_matrix_1P[MCU_HEIGHT-1][(MCU_WIDTH-1)*DATA_W+:DATA_W]	<= i_data;
					
					for (b=0; b<MCU_HEIGHT; b=b+MCU_HEIGHT-1)
					begin
						for (a=0; a<MCU_WIDTH; a=a+2)
						begin
							r_matrix_1P[b][a*DATA_W+:DATA_W]	<= r_matrix_1P[b][(a+1)*DATA_W+:DATA_W];
						end
					end
					for (c=1; c<MCU_WIDTH; c=c+2)
					begin
						for (d=c; d>0; d=d-1)
						begin
							r_matrix_1P[c-d][d*DATA_W+:DATA_W]	<= r_matrix_1P[c-d+1][(d-1)*DATA_W+:DATA_W];
						end
					end
					for (e=2; e<MCU_HEIGHT; e=e+2)
					begin
						for (f=0; f<MCU_WIDTH-e-1; f=f+1)
						begin
							r_matrix_1P[e+f][(MCU_WIDTH-1-f)*DATA_W+:DATA_W]	<= r_matrix_1P[e+f+1][(MCU_WIDTH-1-f-1)*DATA_W+:DATA_W];
						end
					end
					for (h=1; h<MCU_HEIGHT-2; h=h+2)
					begin
						for (g=0; g<MCU_WIDTH; g=g+MCU_WIDTH-1)
						begin
							r_matrix_1P[h][g*DATA_W+:DATA_W]	<= r_matrix_1P[h+1][g*DATA_W+:DATA_W];
						end
					end
					for (i=2; i<MCU_HEIGHT; i=i+2)
					begin
						for (j=i; j>0; j=j-1)
						begin
							r_matrix_1P[i-j+1][(j-1)*DATA_W+:DATA_W]	<= r_matrix_1P[i-j][j*DATA_W+:DATA_W];
						end
					end
					for (k=1; k<MCU_WIDTH-1; k=k+2)
					begin
						for (l=0; l<MCU_HEIGHT-k-1; l=l+1)
						begin
							r_matrix_1P[MCU_HEIGHT-1-l][(k+l)*DATA_W+:DATA_W]	<= r_matrix_1P[MCU_HEIGHT-1-l-1][(k+l+1)*DATA_W+:DATA_W];
						end
					end
				end
				else if (i_re)
				begin
					for (n=0; n<MCU_HEIGHT; n=n+1)
					begin
						r_matrix_1P[n][(MCU_WIDTH-1)*DATA_W+:DATA_W]	<= r_matrix_1P[(n+1)%MCU_HEIGHT][0*DATA_W+:DATA_W];
						for (m=0; m<MCU_WIDTH-1; m=m+1)
						begin
							r_matrix_1P[n][m*DATA_W+:DATA_W]	<= r_matrix_1P[n][(m+1)*DATA_W+:DATA_W];
						end
					end
				end
			end
		end
		
		genvar x, y;
		for (y=0; y<PY_OUT; y=y+1)
		begin
			for (x=0; x<PX_OUT; x=y+1)
			begin
				assign	o_md[(y*MCU_WIDTH*DATA_W)+x*DATA_W+:DATA_W]	= r_matrix_1P[y][x*DATA_W+:DATA_W];
			end
		end
		
		`ifdef RTL_SIM
		wire	[DATA_W-1:0]w_row_0[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_1[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_2[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_3[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_4[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_5[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_6[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_row_7[0:MCU_WIDTH-1];
		
		assign	w_row_0[0]	= r_matrix_1P[0][0*DATA_W+:DATA_W] * DQT_00;
		assign	w_row_0[1]	= r_matrix_1P[0][1*DATA_W+:DATA_W] * DQT_01;
		assign	w_row_0[2]	= r_matrix_1P[0][2*DATA_W+:DATA_W] * DQT_02;
		assign	w_row_0[3]	= r_matrix_1P[0][3*DATA_W+:DATA_W] * DQT_03;
		assign	w_row_0[4]	= r_matrix_1P[0][4*DATA_W+:DATA_W] * DQT_04;
		assign	w_row_0[5]	= r_matrix_1P[0][5*DATA_W+:DATA_W] * DQT_05;
		assign	w_row_0[6]	= r_matrix_1P[0][6*DATA_W+:DATA_W] * DQT_06;
		assign	w_row_0[7]	= r_matrix_1P[0][7*DATA_W+:DATA_W] * DQT_07;
		
		assign	w_row_1[0]	= r_matrix_1P[1][0*DATA_W+:DATA_W] * DQT_10;
		assign	w_row_1[1]	= r_matrix_1P[1][1*DATA_W+:DATA_W] * DQT_11;
		assign	w_row_1[2]	= r_matrix_1P[1][2*DATA_W+:DATA_W] * DQT_12;
		assign	w_row_1[3]	= r_matrix_1P[1][3*DATA_W+:DATA_W] * DQT_13;
		assign	w_row_1[4]	= r_matrix_1P[1][4*DATA_W+:DATA_W] * DQT_14;
		assign	w_row_1[5]	= r_matrix_1P[1][5*DATA_W+:DATA_W] * DQT_15;
		assign	w_row_1[6]	= r_matrix_1P[1][6*DATA_W+:DATA_W] * DQT_16;
		assign	w_row_1[7]	= r_matrix_1P[1][7*DATA_W+:DATA_W] * DQT_17;
		
		assign	w_row_2[0]	= r_matrix_1P[2][0*DATA_W+:DATA_W] * DQT_20;
		assign	w_row_2[1]	= r_matrix_1P[2][1*DATA_W+:DATA_W] * DQT_21;
		assign	w_row_2[2]	= r_matrix_1P[2][2*DATA_W+:DATA_W] * DQT_22;
		assign	w_row_2[3]	= r_matrix_1P[2][3*DATA_W+:DATA_W] * DQT_23;
		assign	w_row_2[4]	= r_matrix_1P[2][4*DATA_W+:DATA_W] * DQT_24;
		assign	w_row_2[5]	= r_matrix_1P[2][5*DATA_W+:DATA_W] * DQT_25;
		assign	w_row_2[6]	= r_matrix_1P[2][6*DATA_W+:DATA_W] * DQT_26;
		assign	w_row_2[7]	= r_matrix_1P[2][7*DATA_W+:DATA_W] * DQT_27;
		
		assign	w_row_3[0]	= r_matrix_1P[3][0*DATA_W+:DATA_W] * DQT_30;
		assign	w_row_3[1]	= r_matrix_1P[3][1*DATA_W+:DATA_W] * DQT_31;
		assign	w_row_3[2]	= r_matrix_1P[3][2*DATA_W+:DATA_W] * DQT_32;
		assign	w_row_3[3]	= r_matrix_1P[3][3*DATA_W+:DATA_W] * DQT_33;
		assign	w_row_3[4]	= r_matrix_1P[3][4*DATA_W+:DATA_W] * DQT_34;
		assign	w_row_3[5]	= r_matrix_1P[3][5*DATA_W+:DATA_W] * DQT_35;
		assign	w_row_3[6]	= r_matrix_1P[3][6*DATA_W+:DATA_W] * DQT_36;
		assign	w_row_3[7]	= r_matrix_1P[3][7*DATA_W+:DATA_W] * DQT_37;
		
		assign	w_row_4[0]	= r_matrix_1P[4][0*DATA_W+:DATA_W] * DQT_40;
		assign	w_row_4[1]	= r_matrix_1P[4][1*DATA_W+:DATA_W] * DQT_41;
		assign	w_row_4[2]	= r_matrix_1P[4][2*DATA_W+:DATA_W] * DQT_42;
		assign	w_row_4[3]	= r_matrix_1P[4][3*DATA_W+:DATA_W] * DQT_43;
		assign	w_row_4[4]	= r_matrix_1P[4][4*DATA_W+:DATA_W] * DQT_44;
		assign	w_row_4[5]	= r_matrix_1P[4][5*DATA_W+:DATA_W] * DQT_45;
		assign	w_row_4[6]	= r_matrix_1P[4][6*DATA_W+:DATA_W] * DQT_46;
		assign	w_row_4[7]	= r_matrix_1P[4][7*DATA_W+:DATA_W] * DQT_47;
		
		assign	w_row_5[0]	= r_matrix_1P[5][0*DATA_W+:DATA_W] * DQT_50;
		assign	w_row_5[1]	= r_matrix_1P[5][1*DATA_W+:DATA_W] * DQT_51;
		assign	w_row_5[2]	= r_matrix_1P[5][2*DATA_W+:DATA_W] * DQT_52;
		assign	w_row_5[3]	= r_matrix_1P[5][3*DATA_W+:DATA_W] * DQT_53;
		assign	w_row_5[4]	= r_matrix_1P[5][4*DATA_W+:DATA_W] * DQT_54;
		assign	w_row_5[5]	= r_matrix_1P[5][5*DATA_W+:DATA_W] * DQT_55;
		assign	w_row_5[6]	= r_matrix_1P[5][6*DATA_W+:DATA_W] * DQT_56;
		assign	w_row_5[7]	= r_matrix_1P[5][7*DATA_W+:DATA_W] * DQT_57;
		
		assign	w_row_6[0]	= r_matrix_1P[6][0*DATA_W+:DATA_W] * DQT_60;
		assign	w_row_6[1]	= r_matrix_1P[6][1*DATA_W+:DATA_W] * DQT_61;
		assign	w_row_6[2]	= r_matrix_1P[6][2*DATA_W+:DATA_W] * DQT_62;
		assign	w_row_6[3]	= r_matrix_1P[6][3*DATA_W+:DATA_W] * DQT_63;
		assign	w_row_6[4]	= r_matrix_1P[6][4*DATA_W+:DATA_W] * DQT_64;
		assign	w_row_6[5]	= r_matrix_1P[6][5*DATA_W+:DATA_W] * DQT_65;
		assign	w_row_6[6]	= r_matrix_1P[6][6*DATA_W+:DATA_W] * DQT_66;
		assign	w_row_6[7]	= r_matrix_1P[6][7*DATA_W+:DATA_W] * DQT_67;
		
		assign	w_row_7[0]	= r_matrix_1P[7][0*DATA_W+:DATA_W] * DQT_70;
		assign	w_row_7[1]	= r_matrix_1P[7][1*DATA_W+:DATA_W] * DQT_71;
		assign	w_row_7[2]	= r_matrix_1P[7][2*DATA_W+:DATA_W] * DQT_72;
		assign	w_row_7[3]	= r_matrix_1P[7][3*DATA_W+:DATA_W] * DQT_73;
		assign	w_row_7[4]	= r_matrix_1P[7][4*DATA_W+:DATA_W] * DQT_74;
		assign	w_row_7[5]	= r_matrix_1P[7][5*DATA_W+:DATA_W] * DQT_75;
		assign	w_row_7[6]	= r_matrix_1P[7][6*DATA_W+:DATA_W] * DQT_76;
		assign	w_row_7[7]	= r_matrix_1P[7][7*DATA_W+:DATA_W] * DQT_77;
		`endif
	end
	else
	begin
		localparam	s_east		= 2'b00;
		localparam	s_south		= 2'b01;
		localparam	s_southwest	= 2'b10;
		localparam	s_northeast	= 2'b11;
		localparam	top			= 0;
		localparam	bottom		= MCU_HEIGHT-1;
		localparam	left		= 0;
		localparam	right		= MCU_WIDTH-1;
		localparam	ADDR_WIDTH	= log2(NUM_MATRIX*MCU_HEIGHT*MCU_WIDTH);
		
		wire	[2:0]c_top;
		wire	[2:0]c_bottom;
		wire	[2:0]c_left;
		wire	[2:0]c_right;
		assign	c_top	= top;
		assign	c_bottom= bottom;
		assign	c_left	= left;
		assign	c_right	= right;
		
		reg		[1:0]r_zigzag_state_1P;
		reg		[log2(MCU_WIDTH)-1:0]r_wr_x_1P;
		reg		[log2(MCU_HEIGHT)-1:0]r_wr_y_1P;
		reg		[log2(NUM_MATRIX)-1:0]r_wr_ptr_1P;
		reg		r_full_1P;
		reg		[log2(MCU_HEIGHT*MCU_WIDTH)-1:0]r_rd_addr_1P;
		reg		[log2(MCU_HEIGHT*MCU_WIDTH)-1:0]r_rd_iteration_1P;
		reg		[log2(NUM_MATRIX)-1:0]r_rd_ptr_1P;
		reg		r_nempty_1P;
		`ifdef RTL_SIM
		reg		[log2(MCU_HEIGHT*MCU_WIDTH)-1:0]r_wr_cnt_1P;
		reg		[15:0]r_wr_mcu_1P;
		`endif
		
		wire	[log2(MCU_HEIGHT*MCU_WIDTH)-1:0]w_rd_addr_1P;
		wire	[log2(NUM_MATRIX)-1:0]w_rd_ptr_1P;
		
		simple_dual_port_ram
		#(
			.DATA_WIDTH		(DATA_W),
			.ADDR_WIDTH		(ADDR_WIDTH),
			.OUTPUT_REG		("FALSE"),
			.RAM_INIT_FILE	(""),
			.RAM_INIT_RADIX	("HEX")
		)
		inst_simple_dual_port_ram
		(
			.wdata	(i_data),
			.waddr	({r_wr_ptr_1P, r_wr_y_1P, r_wr_x_1P}),
			.raddr	({w_rd_ptr_1P, w_rd_addr_1P}),
			.we		(i_we),
			.wclk	(i_sysclk),
			.re		(1'b1),
			.rclk	(i_sysclk),
			.rdata	(o_md)
		);
		assign	o_full		= r_full_1P;
		assign	o_nempty	= r_nempty_1P;
		
		assign	w_rd_ptr_1P		= (i_re && r_rd_addr_1P == {6{1'b1}} && r_rd_iteration_1P == {6{1'b1}})?
									r_rd_ptr_1P+1'b1:
									r_rd_ptr_1P;
		assign	w_rd_addr_1P	= (i_re)?
									r_rd_addr_1P+1'b1:
									r_rd_addr_1P;
		
		always@(posedge i_arst or posedge i_sysclk)
		begin
			if (i_arst)
			begin
				r_zigzag_state_1P	<= s_east;
				r_wr_x_1P			<= {log2(MCU_WIDTH){1'b0}};
				r_wr_y_1P			<= {log2(MCU_HEIGHT){1'b0}};
				r_wr_ptr_1P			<= {log2(NUM_MATRIX){1'b0}};
				r_full_1P			<= 1'b0;
				r_rd_addr_1P		<= {log2(MCU_HEIGHT*MCU_WIDTH){1'b0}};
				r_rd_iteration_1P	<= {log2(MCU_HEIGHT*MCU_WIDTH){1'b0}};
				r_rd_ptr_1P			<= {log2(NUM_MATRIX){1'b0}};
				r_nempty_1P			<= 1'b0;
				`ifdef RTL_SIM
				r_wr_cnt_1P			<= {log2(MCU_HEIGHT*MCU_WIDTH){1'b0}};
				r_wr_mcu_1P			<= {16{1'b0}};
				`endif
			end
			else
			begin
				if (i_we & ~r_full_1P)
				begin
					`ifdef RTL_SIM
					r_wr_cnt_1P	<= r_wr_cnt_1P+1'b1;
					`endif
					case (r_zigzag_state_1P)
						s_east:
						begin
							r_wr_x_1P	<= r_wr_x_1P+1'b1;
							if (r_wr_y_1P == bottom)
								r_zigzag_state_1P	<= s_northeast;
							else
								r_zigzag_state_1P	<= s_southwest;
						end
						
						s_south:
						begin
							r_wr_y_1P	<= r_wr_y_1P+1'b1;
							if (r_wr_x_1P == right)
								r_zigzag_state_1P	<= s_southwest;
							else
								r_zigzag_state_1P	<= s_northeast;
						end
						
						s_southwest:
						begin
							r_wr_x_1P	<= r_wr_x_1P-1'b1;
							r_wr_y_1P	<= r_wr_y_1P+1'b1;
							if (r_wr_y_1P == bottom-1'b1)
								r_zigzag_state_1P	<= s_east;
							else if (r_wr_x_1P == left+1'b1)
								r_zigzag_state_1P	<= s_south;
						end
						
						s_northeast:
						begin
							r_wr_x_1P	<= r_wr_x_1P+1'b1;
							r_wr_y_1P	<= r_wr_y_1P-1'b1;
							if (r_wr_y_1P == bottom && r_wr_x_1P == right)
							begin
								r_zigzag_state_1P	<= s_east;
								r_wr_x_1P			<= {log2(MCU_WIDTH){1'b0}};
								r_wr_y_1P			<= {log2(MCU_HEIGHT){1'b0}};
								r_wr_ptr_1P			<= r_wr_ptr_1P+1'b1;
								if (r_wr_ptr_1P+1'b1 == r_rd_ptr_1P)
									r_full_1P		<= 1'b1;
								r_nempty_1P			<= 1'b1;
								`ifdef RTL_SIM
								r_wr_cnt_1P		<= {log2(MCU_HEIGHT*MCU_WIDTH){1'b0}};
								r_wr_mcu_1P		<= r_wr_mcu_1P+1'b1;
								`endif
							end
							else if (r_wr_x_1P == right-1'b1)
								r_zigzag_state_1P	<= s_south;
							else if (r_wr_y_1P == top+1'b1)
								r_zigzag_state_1P	<= s_east;
						end
						
						default:
						begin
						end
					endcase
				end
				
				if (i_re & r_nempty_1P)
				begin
					r_rd_addr_1P	<= w_rd_addr_1P;
					if (r_rd_addr_1P == {log2(MCU_HEIGHT*MCU_WIDTH){1'b1}})
					begin
						r_rd_iteration_1P	<= r_rd_iteration_1P+1'b1;
						if (r_rd_iteration_1P == {log2(MCU_HEIGHT*MCU_WIDTH){1'b1}})
						begin
							r_rd_ptr_1P	<= w_rd_ptr_1P;
//							r_full_1P	<= 1'b0;
							if (r_wr_ptr_1P == w_rd_ptr_1P)
							begin
								r_full_1P	<= 1'b0;
								r_nempty_1P	<= 1'b0;
							end
						end
					end
				end
			end
		end

`ifdef RTL_SIM
		integer	ref_mtx_file, status;
		integer	m, h, j, l;
		reg		[DATA_W-1:0]r_ref_mtx[0:MCU_HEIGHT*MCU_WIDTH-1];
		reg		[DATA_W-1:0]r_dbg_mtx[0:MCU_HEIGHT*MCU_WIDTH-1];
		reg		[MCU_HEIGHT*MCU_WIDTH-1:0]r_err;
		
		wire	[DATA_W-1:0]w_ref_row_0[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_1[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_2[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_3[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_4[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_5[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_6[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_ref_row_7[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_0[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_1[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_2[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_3[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_4[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_5[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_6[0:MCU_WIDTH-1];
		wire	[DATA_W-1:0]w_dbg_row_7[0:MCU_WIDTH-1];
		
		wire	w_err;
		
		initial
		begin
			for (h=0; h<MCU_HEIGHT*MCU_WIDTH; h=h+1)
			begin
				r_dbg_mtx[h]	<= {DATA_W{1'b0}};
				r_err[h]		<= 1'b0;
			end
			m = 0;
			$display("%s", REF_MTX_FILE);
			ref_mtx_file = $fopen(REF_MTX_FILE, "r");
			if (ref_mtx_file != 0)
			begin
				while (!$feof(ref_mtx_file))
				begin
					@(posedge i_sysclk)
					begin
						if (i_we & ~r_full_1P)
						begin
							status = $fscanf(ref_mtx_file, "%d", r_ref_mtx[m%(MCU_HEIGHT*MCU_WIDTH)]);
							m = m+1;
						end
					end
				end
			end
		end
		
		always@(posedge i_sysclk)
		begin
			if (i_we & ~r_full_1P)
			begin
				r_dbg_mtx[MCU_HEIGHT*MCU_WIDTH-1]	<= i_data;
				for (j=0; j<MCU_HEIGHT*MCU_WIDTH-1; j=j+1)
				begin
					r_dbg_mtx[j]	<= r_dbg_mtx[j+1];
				end
			end
			
			if ({r_wr_y_1P, r_wr_x_1P} == {(log2(MCU_HEIGHT)+log2(MCU_WIDTH)){1'b0}})
			begin
				for (l=0; l<MCU_HEIGHT*MCU_WIDTH; l=l+1)
				begin
					r_err[l]	<= r_dbg_mtx[l] != r_ref_mtx[l];
				end
			end
		end
		
		for (k=0; k<MCU_WIDTH; k=k+1)
		begin
			assign	w_ref_row_0[k] = r_ref_mtx[MCU_HEIGHT*0+k];
			assign	w_ref_row_1[k] = r_ref_mtx[MCU_HEIGHT*1+k];
			assign	w_ref_row_2[k] = r_ref_mtx[MCU_HEIGHT*2+k];
			assign	w_ref_row_3[k] = r_ref_mtx[MCU_HEIGHT*3+k];
			assign	w_ref_row_4[k] = r_ref_mtx[MCU_HEIGHT*4+k];
			assign	w_ref_row_5[k] = r_ref_mtx[MCU_HEIGHT*5+k];
			assign	w_ref_row_6[k] = r_ref_mtx[MCU_HEIGHT*6+k];
			assign	w_ref_row_7[k] = r_ref_mtx[MCU_HEIGHT*7+k];
			assign	w_dbg_row_0[k] = r_dbg_mtx[MCU_HEIGHT*0+k];
			assign	w_dbg_row_1[k] = r_dbg_mtx[MCU_HEIGHT*1+k];
			assign	w_dbg_row_2[k] = r_dbg_mtx[MCU_HEIGHT*2+k];
			assign	w_dbg_row_3[k] = r_dbg_mtx[MCU_HEIGHT*3+k];
			assign	w_dbg_row_4[k] = r_dbg_mtx[MCU_HEIGHT*4+k];
			assign	w_dbg_row_5[k] = r_dbg_mtx[MCU_HEIGHT*5+k];
			assign	w_dbg_row_6[k] = r_dbg_mtx[MCU_HEIGHT*6+k];
			assign	w_dbg_row_7[k] = r_dbg_mtx[MCU_HEIGHT*7+k];
		end
		
		assign	w_err	= (r_err != {(MCU_HEIGHT*MCU_WIDTH){1'b0}});
		
		assign	o_sim_wr_mcu	= r_wr_mcu_1P;
`endif
	end
endgenerate

endmodule
