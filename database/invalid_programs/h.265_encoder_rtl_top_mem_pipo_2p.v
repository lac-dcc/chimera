//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
// Filename       : mem_pipo_2p.v
// Author         : Yibo FAN
// Created        : 2014-03-26
// Description    : Memory Buf Parallel line Input, Parallel line Output, TWO Ports
//                  Support:     PORT A            PORT B
//                            32x1 line IN      32x1 line OUT
//                            16x2 line IN      16x2 line OUT
//                            8x4  line IN      8x4  line OUT
//                            4x4  line IN      4x4  line OUT
//
//------------------------------------------------------------------
//
//  Modified      : 2014-09-23 by HLL
//  Description   : bank write and bank read supported
//
//  $Id$
//
//-------------------------------------------------------------------
`include "enc_defines.v"

module mem_pipo_2p   (
				clk      		,
				rst_n        	,

				a_wen_i			,
				a_bank_0_i	    ,
				a_bank_1_i	    ,
				a_bank_2_i	    ,
				a_bank_3_i	    ,
				a_cbank_i	    ,
				a_size_i  	    ,
				a_sel_i        ,
				a_4x4_x_i 	    ,
				a_4x4_y_i 	    ,
				a_idx_i	        ,
				a_wdata_i       ,

				b_ren_i 		,
				b_bank_i	    ,
				b_cbank_i	    ,
				b_size_i 	    ,
				b_sel_i       ,
				b_4x4_x_i	    ,
				b_4x4_y_i	    ,
				b_idx_i  	    ,
				b_rdata_o
);

// ********************************************
//
//    Parameter DECLARATION
//
// ********************************************
localparam 						I_4x4	= 2'b00,
           						I_8x8	= 2'b01,
           						I_16x16	= 2'b10,
           						I_32x32	= 2'b11;

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************
input							clk			; //clock
input							rst_n		; //reset signal

input							a_wen_i		; //A port# write enable
input  [1:0]					a_bank_0_i	; //A port# bank sel: 00, 01, 02 for luma pre, min, ec; 03 for chroma
input  [1:0]          a_bank_1_i ;
input  [1:0]          a_bank_2_i ;
input  [1:0]          a_bank_3_i ;
input  							a_cbank_i	; //A port# one bank for tq, one bank for ec
input  [1:0]					a_size_i  	; //A port# block size, 00:4x4, 01: 8x8, 10: 16x16, 11:32x32
input  [1:0]          a_sel_i     ;
input  [3:0]					a_4x4_x_i 	; //A port# top_left 4x4 block x coodinate
input  [3:0]					a_4x4_y_i 	; //A port# top_left 4x4 block y coodinate
input  [4:0]					a_idx_i	    ; //A port# row index in block
input  [`PIXEL_WIDTH*32-1:0]	a_wdata_i   ; //A port# write data

input  							b_ren_i 	; //B port# read enable
input  [1:0]					b_bank_i	; //B port# bank sel: 00, 01, 02 for luma pre, min, ec; 03 for chroma
input  							b_cbank_i	; //B port# one bank for tq, one bank for ec
input  [1:0]					b_size_i 	; //B port# block size, 00:4x4, 01: 8x8, 10: 16x16, 11:32x32
input  [1:0]          b_sel_i     ;
input  [3:0]					b_4x4_x_i	; //B port# top_left 4x4 block x coodinate
input  [3:0]					b_4x4_y_i	; //B port# top_left 4x4 block y coodinate
input  [4:0]					b_idx_i  	; //B port# row index in block
output [`PIXEL_WIDTH*32-1:0]	b_rdata_o 	; //B port# read data

// ********************************************
//
//    Signals DECLARATION
//
// ********************************************
// R/W Data & Address
wire [1:0]						b0_a_we,
								b1_a_we,
								b2_a_we,
								b3_a_we;

wire							b0_b_re,
								b1_b_re,
								b2_b_re,
								b3_b_re;

wire [3:0]						b0_a_addr_h, b0_b_addr_h,
								b1_a_addr_h, b1_b_addr_h,
								b2_a_addr_h, b2_b_addr_h,
								b3_a_addr_h, b3_b_addr_h;

reg [4:0]						b0_a_addr_l, b0_b_addr_l,
								b1_a_addr_l, b1_b_addr_l,
								b2_a_addr_l, b2_b_addr_l,
								b3_a_addr_l, b3_b_addr_l;

wire [8:0] 						b0_a_addr, b0_b_addr,
                                b1_a_addr, b1_b_addr,
                                b2_a_addr, b2_b_addr,
                                b3_a_addr, b3_b_addr;

reg  [`PIXEL_WIDTH*8-1:0] 		b0_a_datai,
                                b1_a_datai,
                                b2_a_datai,
                                b3_a_datai;

wire [`PIXEL_WIDTH*8-1:0] 		b0_b_datao,
                                b1_b_datao,
                                b2_b_datao,
                                b3_b_datao;

reg  [`PIXEL_WIDTH*32-1:0] 		b_rdata_o;

reg  [1:0]						b_size_r ;
reg  [3:0]						b_4x4_x_r;
reg  [4:0]						b_idx_r  ;

// ********************************************
//
//    Logic DECLARATION
//
// ********************************************
// --------------------------------------------
//		Memory Banks
//---------------------------------------------
// PORT A Channel
assign b0_a_we = a_wen_i ? ((a_size_i==I_4x4)? {~a_4x4_x_i[0], a_4x4_x_i[0]} : 2'b11):2'b00;
assign b1_a_we = a_wen_i ? ((a_size_i==I_4x4)? {~a_4x4_x_i[0], a_4x4_x_i[0]} : 2'b11):2'b00;
assign b2_a_we = a_wen_i ? ((a_size_i==I_4x4)? {~a_4x4_x_i[0], a_4x4_x_i[0]} : 2'b11):2'b00;
assign b3_a_we = a_wen_i ? ((a_size_i==I_4x4)? {~a_4x4_x_i[0], a_4x4_x_i[0]} : 2'b11):2'b00;

// Port A : Address generator
always @(*) begin
	case (a_size_i)
		I_4x4	,
		I_8x8	: begin
					case (a_4x4_x_i[2:1])
		          		2'd0: begin b0_a_addr_l[1:0]=2'd0; b1_a_addr_l[1:0]=2'd1; b2_a_addr_l[1:0]=2'd2; b3_a_addr_l[1:0]=2'd3; end
		          		2'd1: begin b0_a_addr_l[1:0]=2'd2; b1_a_addr_l[1:0]=2'd3; b2_a_addr_l[1:0]=2'd0; b3_a_addr_l[1:0]=2'd1; end
		          		2'd2: begin b0_a_addr_l[1:0]=2'd3; b1_a_addr_l[1:0]=2'd0; b2_a_addr_l[1:0]=2'd1; b3_a_addr_l[1:0]=2'd2; end
		          		2'd3: begin b0_a_addr_l[1:0]=2'd1; b1_a_addr_l[1:0]=2'd2; b2_a_addr_l[1:0]=2'd3; b3_a_addr_l[1:0]=2'd0; end
		          	endcase
				  end
		I_16x16	: begin b0_a_addr_l[1:0] = {a_idx_i[1], a_4x4_x_i[2]};
				  		b1_a_addr_l[1:0] = {a_idx_i[1], ~a_4x4_x_i[2]};
				  		b2_a_addr_l[1:0] = {a_idx_i[1], a_4x4_x_i[2]};
				  		b3_a_addr_l[1:0] = {a_idx_i[1], ~a_4x4_x_i[2]};
				  end
		I_32x32	: begin b0_a_addr_l[1:0] = a_idx_i[1:0];
						b1_a_addr_l[1:0] = a_idx_i[1:0];
						b2_a_addr_l[1:0] = a_idx_i[1:0];
						b3_a_addr_l[1:0] = a_idx_i[1:0];
				  end
	endcase
end

always @(*) begin
	case (a_size_i)
		I_4x4	: begin b0_a_addr_l[4:2] = a_4x4_y_i[2:0];
						b1_a_addr_l[4:2] = a_4x4_y_i[2:0];
						b2_a_addr_l[4:2] = a_4x4_y_i[2:0];
						b3_a_addr_l[4:2] = a_4x4_y_i[2:0];
					end
		I_8x8   : begin b0_a_addr_l[4:2] = {a_4x4_y_i[2:1], a_idx_i[2]};
						b1_a_addr_l[4:2] = {a_4x4_y_i[2:1], a_idx_i[2]};
						b2_a_addr_l[4:2] = {a_4x4_y_i[2:1], a_idx_i[2]};
						b3_a_addr_l[4:2] = {a_4x4_y_i[2:1], a_idx_i[2]};
					end
		I_16x16 : begin b0_a_addr_l[4:2] = {a_4x4_y_i[2], a_idx_i[3:2]};
						b1_a_addr_l[4:2] = {a_4x4_y_i[2], a_idx_i[3:2]};
						b2_a_addr_l[4:2] = {a_4x4_y_i[2], a_idx_i[3:2]};
						b3_a_addr_l[4:2] = {a_4x4_y_i[2], a_idx_i[3:2]};
					end
		I_32x32 : begin b0_a_addr_l[4:2] = a_idx_i[4:2];
						b1_a_addr_l[4:2] = a_idx_i[4:2];
						b2_a_addr_l[4:2] = a_idx_i[4:2];
						b3_a_addr_l[4:2] = a_idx_i[4:2];
					end
	endcase
end

//assign b0_a_addr_h = {a_bank_0_i, a_4x4_y_i[3], a_4x4_x_i[3]};
//assign b1_a_addr_h = {a_bank_1_i, a_4x4_y_i[3], a_4x4_x_i[3]};
//assign b2_a_addr_h = {a_bank_2_i, a_4x4_y_i[3], a_4x4_x_i[3]};
//assign b3_a_addr_h = {a_bank_3_i, a_4x4_y_i[3], a_4x4_x_i[3]};
//
//assign b0_a_addr = {b0_a_addr_h, (a_bank_i==2'b11)?{a_cbank_i,b0_a_addr_l[3:0]}:b0_a_addr_l};
//assign b1_a_addr = {b1_a_addr_h, (a_bank_i==2'b11)?{a_cbank_i,b1_a_addr_l[3:0]}:b1_a_addr_l};
//assign b2_a_addr = {b2_a_addr_h, (a_bank_i==2'b11)?{a_cbank_i,b2_a_addr_l[3:0]}:b2_a_addr_l};
//assign b3_a_addr = {b3_a_addr_h, (a_bank_i==2'b11)?{a_cbank_i,b3_a_addr_l[3:0]}:b3_a_addr_l};

assign b0_a_addr = {a_bank_0_i ,( (a_bank_0_i==2'b11) ? {a_cbank_i,a_sel_i[0]} : {a_4x4_y_i[3],a_4x4_x_i[3]} ) ,b0_a_addr_l };
assign b1_a_addr = {a_bank_1_i ,( (a_bank_1_i==2'b11) ? {a_cbank_i,a_sel_i[0]} : {a_4x4_y_i[3],a_4x4_x_i[3]} ) ,b1_a_addr_l };
assign b2_a_addr = {a_bank_2_i ,( (a_bank_2_i==2'b11) ? {a_cbank_i,a_sel_i[0]} : {a_4x4_y_i[3],a_4x4_x_i[3]} ) ,b2_a_addr_l };
assign b3_a_addr = {a_bank_3_i ,( (a_bank_3_i==2'b11) ? {a_cbank_i,a_sel_i[0]} : {a_4x4_y_i[3],a_4x4_x_i[3]} ) ,b3_a_addr_l };

// Port A: Data alignment
always @(*) begin
	case (a_size_i)
		I_4x4	: case (a_4x4_x_i[2:1])
					2'd0: {b0_a_datai, b1_a_datai, b2_a_datai, b3_a_datai} = { a_wdata_i[255:224] ,32'b0 , a_wdata_i[223:192] ,32'b0 , a_wdata_i[191:160] ,32'b0 , a_wdata_i[159:128] ,32'b0 };
					2'd1: {b2_a_datai, b3_a_datai, b0_a_datai, b1_a_datai} = { a_wdata_i[255:224] ,32'b0 , a_wdata_i[223:192] ,32'b0 , a_wdata_i[191:160] ,32'b0 , a_wdata_i[159:128] ,32'b0 };
					2'd2: {b1_a_datai, b2_a_datai, b3_a_datai, b0_a_datai} = { a_wdata_i[255:224] ,32'b0 , a_wdata_i[223:192] ,32'b0 , a_wdata_i[191:160] ,32'b0 , a_wdata_i[159:128] ,32'b0 };
					2'd3: {b3_a_datai, b0_a_datai, b1_a_datai, b2_a_datai} = { a_wdata_i[255:224] ,32'b0 , a_wdata_i[223:192] ,32'b0 , a_wdata_i[191:160] ,32'b0 , a_wdata_i[159:128] ,32'b0 };
				endcase
		I_8x8  	: case (a_4x4_x_i[2:1])
					2'd0: {b0_a_datai, b1_a_datai, b2_a_datai, b3_a_datai} = a_wdata_i;
					2'd1: {b2_a_datai, b3_a_datai, b0_a_datai, b1_a_datai} = a_wdata_i;
					2'd2: {b1_a_datai, b2_a_datai, b3_a_datai, b0_a_datai} = a_wdata_i;
					2'd3: {b3_a_datai, b0_a_datai, b1_a_datai, b2_a_datai} = a_wdata_i;
				endcase
		I_16x16	: case ({a_4x4_x_i[2], a_idx_i[1]})
					2'd0: {b0_a_datai, b2_a_datai, b1_a_datai, b3_a_datai} = a_wdata_i;
					2'd1: {b2_a_datai, b0_a_datai, b3_a_datai, b1_a_datai} = a_wdata_i;
					2'd2: {b1_a_datai, b3_a_datai, b2_a_datai, b0_a_datai} = a_wdata_i;
					2'd3: {b3_a_datai, b1_a_datai, b0_a_datai, b2_a_datai} = a_wdata_i;
				endcase
		I_32x32	: case (a_idx_i[1:0])
					2'd0: {b0_a_datai, b2_a_datai, b1_a_datai, b3_a_datai} = a_wdata_i;
					2'd1: {b1_a_datai, b3_a_datai, b2_a_datai, b0_a_datai} = a_wdata_i;
					2'd2: {b2_a_datai, b0_a_datai, b3_a_datai, b1_a_datai} = a_wdata_i;
					2'd3: {b3_a_datai, b1_a_datai, b0_a_datai, b2_a_datai} = a_wdata_i;
				endcase
	endcase
end

// PORT B Channel
assign b0_b_re = b_ren_i;
assign b1_b_re = b_ren_i;
assign b2_b_re = b_ren_i;
assign b3_b_re = b_ren_i;

// Port B : Address generator
always @(*) begin
	case (b_size_i)
		I_4x4	,
		I_8x8	: begin
					case (b_4x4_x_i[2:1])
		          		2'd0: begin b0_b_addr_l[1:0]=2'd0; b1_b_addr_l[1:0]=2'd1; b2_b_addr_l[1:0]=2'd2; b3_b_addr_l[1:0]=2'd3; end
		          		2'd1: begin b0_b_addr_l[1:0]=2'd2; b1_b_addr_l[1:0]=2'd3; b2_b_addr_l[1:0]=2'd0; b3_b_addr_l[1:0]=2'd1; end
		          		2'd2: begin b0_b_addr_l[1:0]=2'd3; b1_b_addr_l[1:0]=2'd0; b2_b_addr_l[1:0]=2'd1; b3_b_addr_l[1:0]=2'd2; end
		          		2'd3: begin b0_b_addr_l[1:0]=2'd1; b1_b_addr_l[1:0]=2'd2; b2_b_addr_l[1:0]=2'd3; b3_b_addr_l[1:0]=2'd0; end
		          	endcase
				  end
		I_16x16	: begin b0_b_addr_l[1:0] = {b_idx_i[1], b_4x4_x_i[2]};
				  		b1_b_addr_l[1:0] = {b_idx_i[1], ~b_4x4_x_i[2]};
				  		b2_b_addr_l[1:0] = {b_idx_i[1], b_4x4_x_i[2]};
				  		b3_b_addr_l[1:0] = {b_idx_i[1], ~b_4x4_x_i[2]};
				  end
		I_32x32	: begin b0_b_addr_l[1:0] = b_idx_i[1:0];
						b1_b_addr_l[1:0] = b_idx_i[1:0];
						b2_b_addr_l[1:0] = b_idx_i[1:0];
						b3_b_addr_l[1:0] = b_idx_i[1:0];
				  end
	endcase
end

always @(*) begin
	case (b_size_i)
		I_4x4	: begin b0_b_addr_l[4:2] = b_4x4_y_i[2:0];
						b1_b_addr_l[4:2] = b_4x4_y_i[2:0];
						b2_b_addr_l[4:2] = b_4x4_y_i[2:0];
						b3_b_addr_l[4:2] = b_4x4_y_i[2:0];
					end
		I_8x8   : begin b0_b_addr_l[4:2] = {b_4x4_y_i[2:1], b_idx_i[2]};
						b1_b_addr_l[4:2] = {b_4x4_y_i[2:1], b_idx_i[2]};
						b2_b_addr_l[4:2] = {b_4x4_y_i[2:1], b_idx_i[2]};
						b3_b_addr_l[4:2] = {b_4x4_y_i[2:1], b_idx_i[2]};
					end
		I_16x16 : begin b0_b_addr_l[4:2] = {b_4x4_y_i[2], b_idx_i[3:2]};
						b1_b_addr_l[4:2] = {b_4x4_y_i[2], b_idx_i[3:2]};
						b2_b_addr_l[4:2] = {b_4x4_y_i[2], b_idx_i[3:2]};
						b3_b_addr_l[4:2] = {b_4x4_y_i[2], b_idx_i[3:2]};
					end
		I_32x32 : begin b0_b_addr_l[4:2] = b_idx_i[4:2];
						b1_b_addr_l[4:2] = b_idx_i[4:2];
						b2_b_addr_l[4:2] = b_idx_i[4:2];
						b3_b_addr_l[4:2] = b_idx_i[4:2];
					end
	endcase
end

//assign b0_b_addr_h = {b_bank_i, b_4x4_y_i[3], b_4x4_x_i[3]};
//assign b1_b_addr_h = {b_bank_i, b_4x4_y_i[3], b_4x4_x_i[3]};
//assign b2_b_addr_h = {b_bank_i, b_4x4_y_i[3], b_4x4_x_i[3]};
//assign b3_b_addr_h = {b_bank_i, b_4x4_y_i[3], b_4x4_x_i[3]};
//
//assign b0_b_addr = {b0_b_addr_h, (b_bank_i==2'b11)?{b_cbank_i,b0_b_addr_l[3:0]}:b0_b_addr_l};
//assign b1_b_addr = {b1_b_addr_h, (b_bank_i==2'b11)?{b_cbank_i,b1_b_addr_l[3:0]}:b1_b_addr_l};
//assign b2_b_addr = {b2_b_addr_h, (b_bank_i==2'b11)?{b_cbank_i,b2_b_addr_l[3:0]}:b2_b_addr_l};
//assign b3_b_addr = {b3_b_addr_h, (b_bank_i==2'b11)?{b_cbank_i,b3_b_addr_l[3:0]}:b3_b_addr_l};

assign b0_b_addr = {b_bank_i ,( (b_bank_i==2'b11) ? {b_cbank_i,b_sel_i[0]} : {b_4x4_y_i[3],b_4x4_x_i[3]} ) ,b0_b_addr_l };
assign b1_b_addr = {b_bank_i ,( (b_bank_i==2'b11) ? {b_cbank_i,b_sel_i[0]} : {b_4x4_y_i[3],b_4x4_x_i[3]} ) ,b1_b_addr_l };
assign b2_b_addr = {b_bank_i ,( (b_bank_i==2'b11) ? {b_cbank_i,b_sel_i[0]} : {b_4x4_y_i[3],b_4x4_x_i[3]} ) ,b2_b_addr_l };
assign b3_b_addr = {b_bank_i ,( (b_bank_i==2'b11) ? {b_cbank_i,b_sel_i[0]} : {b_4x4_y_i[3],b_4x4_x_i[3]} ) ,b3_b_addr_l };

// Port B: Data alignment
always@(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		b_size_r  <= 'b0;
		b_4x4_x_r <= 'b0;
		b_idx_r   <= 'b0;
	end
	else begin
		b_size_r  <= b_size_i;
		b_4x4_x_r <= b_4x4_x_i;
		b_idx_r   <= b_idx_i;
	end
end

always @(*) begin
	case (b_size_r)
		I_4x4	: case (b_4x4_x_r[2:1])
					2'd0: b_rdata_o = {b0_b_datao, b1_b_datao, b2_b_datao, b3_b_datao};
					2'd1: b_rdata_o = {b2_b_datao, b3_b_datao, b0_b_datao, b1_b_datao};
					2'd2: b_rdata_o = {b1_b_datao, b2_b_datao, b3_b_datao, b0_b_datao};
					2'd3: b_rdata_o = {b3_b_datao, b0_b_datao, b1_b_datao, b2_b_datao};
				endcase
		I_8x8  	: case (b_4x4_x_r[2:1])
					2'd0: b_rdata_o = {b0_b_datao, b1_b_datao, b2_b_datao, b3_b_datao};
					2'd1: b_rdata_o = {b2_b_datao, b3_b_datao, b0_b_datao, b1_b_datao};
					2'd2: b_rdata_o = {b1_b_datao, b2_b_datao, b3_b_datao, b0_b_datao};
					2'd3: b_rdata_o = {b3_b_datao, b0_b_datao, b1_b_datao, b2_b_datao};
				endcase
		I_16x16	: case ({b_4x4_x_r[2], b_idx_r[1]})
					2'd0: b_rdata_o = {b0_b_datao, b2_b_datao, b1_b_datao, b3_b_datao};
					2'd1: b_rdata_o = {b2_b_datao, b0_b_datao, b3_b_datao, b1_b_datao};
					2'd2: b_rdata_o = {b1_b_datao, b3_b_datao, b2_b_datao, b0_b_datao};
					2'd3: b_rdata_o = {b3_b_datao, b1_b_datao, b0_b_datao, b2_b_datao};
				endcase
		I_32x32	: case (b_idx_r[1:0])
					2'd0: b_rdata_o = {b0_b_datao, b2_b_datao, b1_b_datao, b3_b_datao};
					2'd1: b_rdata_o = {b1_b_datao, b3_b_datao, b2_b_datao, b0_b_datao};
					2'd2: b_rdata_o = {b2_b_datao, b0_b_datao, b3_b_datao, b1_b_datao};
					2'd3: b_rdata_o = {b3_b_datao, b1_b_datao, b0_b_datao, b2_b_datao};
				endcase
	endcase
end

// MEM Modules
buf_ram_2p_64x512	buf_rec_0(
		.clk  		( clk			),
		.a_we       ( b0_a_we		),
		.a_addr		( b0_a_addr		),
		.a_data_i	( b0_a_datai	),
		.b_re 		( b0_b_re    	),
		.b_addr		( b0_b_addr		),
		.b_data_o	( b0_b_datao	)
);

buf_ram_2p_64x512	buf_rec_1(
		.clk  		( clk			),
		.a_we       ( b1_a_we		),
		.a_addr		( b1_a_addr		),
		.a_data_i	( b1_a_datai	),
		.b_re		( b1_b_re    	),
		.b_addr		( b1_b_addr		),
		.b_data_o	( b1_b_datao	)
);

buf_ram_2p_64x512	buf_rec_2(
		.clk  		( clk			),
		.a_we       ( b2_a_we		),
		.a_addr		( b2_a_addr		),
		.a_data_i	( b2_a_datai	),
		.b_re		( b2_b_re    	),
		.b_addr		( b2_b_addr		),
		.b_data_o	( b2_b_datao	)
);

buf_ram_2p_64x512	buf_rec_3(
		.clk  		( clk			),
		.a_we       ( b3_a_we		),
		.a_addr		( b3_a_addr		),
		.a_data_i	( b3_a_datai	),
		.b_re		( b3_b_re    	),
		.b_addr		( b3_b_addr		),
		.b_data_o	( b3_b_datao	)
);

endmodule