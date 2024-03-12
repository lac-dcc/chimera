//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------
// Filename       : cabac_slice_init.v
// Author         : guo yong
// Created        : 2013-06
// Description    : H.264 cabac_slice_init, create context table 
//               
//-------------------------------------------------------------------
`include "enc_defines.v"

module cabac_slice_init(
				//input
				clk						,
				rst_n					,
				start_slice_init_i		,
				slice_type_i			,
				slice_qp_i				,
				
				//output
				table_build_end_o		,
				
				w_en_ctx_state_0_o		,
                w_addr_ctx_state_0_o	,
                w_data_ctx_state_0_o	,
                w_en_ctx_state_1_o		,
                w_addr_ctx_state_1_o	,
                w_data_ctx_state_1_o	,
                w_en_ctx_state_2_o		,
                w_addr_ctx_state_2_o	,
                w_data_ctx_state_2_o	,
                w_en_ctx_state_3_o		,
                w_addr_ctx_state_3_o	,
                w_data_ctx_state_3_o	,            
                w_en_ctx_state_4_o		,
                w_addr_ctx_state_4_o	,
                w_data_ctx_state_4_o	
     
);

//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------
//INPUT
input				clk						;	//clock
input				rst_n					;	//reset signal, low active
input				start_slice_init_i		;	//start slice init flag
input				slice_type_i			;	//slice type
input	[5:0]		slice_qp_i				;	//slice qp                                   	


//OUTPUT
output				table_build_end_o		;	//table build end flag
output				w_en_ctx_state_0_o		;	//write enable context state 0
output	[5:0]		w_addr_ctx_state_0_o	;	//write address context state 0
output	[6:0]		w_data_ctx_state_0_o	;	//write data context state 0

output				w_en_ctx_state_1_o		;	//wirte enable context state 1
output	[5:0]		w_addr_ctx_state_1_o	;	//write address context state 1
output	[6:0]		w_data_ctx_state_1_o	;	//wirte data context state 1

output				w_en_ctx_state_2_o		;	//write enable context state 2
output	[5:0]		w_addr_ctx_state_2_o	;	//write address context state 2
output	[6:0]		w_data_ctx_state_2_o	;	//write data context state 2

output				w_en_ctx_state_3_o		;	//write enable context state 3
output	[5:0]		w_addr_ctx_state_3_o	;	//write address context state 3
output	[6:0]		w_data_ctx_state_3_o	;	//write data context state 3

output				w_en_ctx_state_4_o		;	//write enable context state 4
output	[5:0]		w_addr_ctx_state_4_o	;	//write address context state 4
output	[6:0]		w_data_ctx_state_4_o	;	//write data context state 4


//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//    Reg / Wire DECLARATION               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------

reg					table_build_end_o		;	//table build end flag

reg	 signed	[6:0]	clip_qp					;	//clip qp


//0
reg					r_en_mn_0_r				;	//read  enable of mn 0 memory
reg			[5:0]	r_addr_mn_0_r			;	//read address of mn 0 memory
wire 		[15:0]	r_data_mn_0_w			;	//read    data of mn 0 memory
wire signed	[7:0]	r_data_m_0_w			;	//signed    m  sof 0
wire signed [7:0]	r_data_n_0_w			;	//signed    n  of 0	

reg					w_en_ctx_state_0_o		;	//write enable of mn 0 memory
reg			[5:0]	w_addr_ctx_state_0_r	;	//write address of mn 0 memory
reg			[6:0]	w_data_ctx_state_0_o	;	//wiret data of mn 0 memory
        	
//reg			[6:0]	ctx_state_data_0_a_r	;	//context state data 0 for a
//reg			[6:0]	ctx_state_data_0_b_r	;	//context state data 0 for b
reg	signed	[7:0]	ctx_state_data_0_r		;	//context state data 0 
reg	signed	[6:0]	clip_ctx_state_data_0_r	;	//clip context state data 0
reg					mps_state_0_r			;	//mps_state 0
reg			[7:0]	ctxmps_state_0_r		;	//(pstate<<1) + mps

//1
reg					r_en_mn_1_r				;	//read enable of mn 1 memory
reg			[5:0]	r_addr_mn_1_r			;	//read address of mn 1 memory
wire signed	[15:0]	r_data_mn_1_w			;	//read data of mn 1 memory
wire signed	[7:0]	r_data_m_1_w			;	//signed m of 1
wire signed [7:0]	r_data_n_1_w			;	//signed n of 1	

reg					w_en_ctx_state_1_o		;	//write enable of mn 1 memory
reg			[5:0]	w_addr_ctx_state_1_r	;	//write address of mn 1 memory
reg			[6:0]	w_data_ctx_state_1_o	;	//wiret data of mn 1 memory
 
//reg			[6:0]	ctx_state_data_1_a_r	;	//context state data 1 for a
//reg			[6:0]	ctx_state_data_1_b_r	;	//context state data 1 for b
reg	signed	[7:0]	ctx_state_data_1_r		;	//context state data 1 
reg	signed	[6:0]	clip_ctx_state_data_1_r	;	//clip context state data 1
reg					mps_state_1_r			;	//mps_state 1
reg			[7:0]	ctxmps_state_1_r		;	//(pstate<<1) + mps

//2
reg					r_en_mn_2_r				;	//read enable of mn 2 memory
reg			[5:0]	r_addr_mn_2_r			;	//read address of mn 2 memory
wire signed	[15:0]	r_data_mn_2_w			;	//read data of mn 2 memory
wire signed	[7:0]	r_data_m_2_w			;	//signed m of 2
wire signed [7:0]	r_data_n_2_w			;	//signed n of 2	

reg					w_en_ctx_state_2_o		;	//write enable of mn 2 memory
reg			[5:0]	w_addr_ctx_state_2_r	;	//write address of mn 2 memory
reg			[6:0]	w_data_ctx_state_2_o	;	//wiret data of mn 2 memory
 
//reg			[6:0]	ctx_state_data_2_a_r	;	//context state data 2 for a
//reg			[6:0]	ctx_state_data_2_b_r	;	//context state data 2 for b
reg	signed	[7:0]	ctx_state_data_2_r		;	//context state data 2 
reg	signed	[6:0]	clip_ctx_state_data_2_r	;	//clip context state data 2
reg					mps_state_2_r			;	//mps_state 2
reg			[7:0]	ctxmps_state_2_r		;	//(pstate<<1) + mps

//3
reg					r_en_mn_3_r				;	//read enable of mn 3 memory
reg			[5:0]	r_addr_mn_3_r			;	//read address of mn 3 memory
wire signed	[15:0]	r_data_mn_3_w			;	//read data of mn 3 memory
wire signed	[7:0]	r_data_m_3_w			;	//signed m of 3
wire signed [7:0]	r_data_n_3_w			;	//signed n of 3	


reg					w_en_ctx_state_3_o		;	//write enable of mn 3 memory
reg			[5:0]	w_addr_ctx_state_3_r	;	//write address of mn 3 memory
reg			[6:0]	w_data_ctx_state_3_o	;	//wiret data of mn 3 memory
 
//reg			[6:0]	ctx_state_data_3_a_r	;	//context state data 3 for a
//reg			[6:0]	ctx_state_data_3_b_r	;	//context state data 3 for b
reg	signed	[7:0]	ctx_state_data_3_r		;	//context state data 3 
reg	signed	[6:0]	clip_ctx_state_data_3_r	;	//clip context state data 3
reg					mps_state_3_r			;	//mps_state 3
reg			[7:0]	ctxmps_state_3_r		;	//(pstate<<1) + mps


//4
reg					r_en_mn_4_r				;	//read enable of mn 4 memory
reg			[5:0]	r_addr_mn_4_r			;	//read address of mn 4 memory
wire signed	[15:0]	r_data_mn_4_w			;	//read data of mn 4 memory
wire signed	[7:0]	r_data_m_4_w			;	//signed m of 4
wire signed [7:0]	r_data_n_4_w			;	//signed n of 4	


reg					w_en_ctx_state_4_o		;	//write enable of mn 4 memory
reg			[5:0]	w_addr_ctx_state_4_r	;	//write address of mn 4 memory
reg			[6:0]	w_data_ctx_state_4_o	;	//wiret data of mn 4 memory
 
//reg			[6:0]	ctx_state_data_4_a_r	;	//context state data 4 for a
//reg			[6:0]	ctx_state_data_4_b_r	;	//context state data 4 for b
reg	signed	[7:0]	ctx_state_data_4_r		;	//context state data 4 
reg	signed	[6:0]	clip_ctx_state_data_4_r	;	//clip context state data 4
reg					mps_state_4_r			;	//mps_state 4
reg			[7:0]	ctxmps_state_4_r		;	//(pstate<<1) + mps

wire		[6:0]	w_addr_base_w			;	//base address of write, I: 0, P: 64;

//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//    Combinational DECLARATION               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------
//table_build_end_o
always @* begin
	if(start_slice_init_i && w_addr_ctx_state_0_o==6'd31)
		table_build_end_o = 1;
	else 
		table_build_end_o = 0;
end

assign	w_addr_base_w = slice_type_i ? 7'd0 : 7'd32;

//clip qp
always @* begin
	if(slice_qp_i<0)
		clip_qp = 1;
	else if(slice_qp_i>51)
		clip_qp = 51;
	else
		clip_qp = slice_qp_i;// (`INIT_QP);// slice_qp_i;	
end

//get m & n
assign	r_data_m_0_w = r_data_mn_0_w[15:8];         //slope
assign	r_data_m_1_w = r_data_mn_1_w[15:8];
assign	r_data_m_2_w = r_data_mn_2_w[15:8];
assign	r_data_m_3_w = r_data_mn_3_w[15:8];
assign	r_data_m_4_w = r_data_mn_4_w[15:8];

assign	r_data_n_0_w = r_data_mn_0_w[7:0];          //offset
assign	r_data_n_1_w = r_data_mn_1_w[7:0];
assign	r_data_n_2_w = r_data_mn_2_w[7:0];
assign	r_data_n_3_w = r_data_mn_3_w[7:0];
assign	r_data_n_4_w = r_data_mn_4_w[7:0];

//-----------------------------------------------------------------------------------------------------------------------------
//0
//clip context state

wire signed [15:0] ctx_0_a_w	;
wire signed [15:0] ctx_0_b_w	;

assign	ctx_0_a_w = r_data_m_0_w * clip_qp;         //mm = slope * clip_qp
assign	ctx_0_b_w = ctx_0_a_w >> 4		  ;         //nn = mm>>4

//ctx_state_data_0_r
always @* begin								      
	ctx_state_data_0_r = ctx_0_b_w + r_data_n_0_w;  //nn + offset
end
always @* begin                                     //initState = clip3(1,126,nn+offset)
	if(ctx_state_data_0_r<0)
		clip_ctx_state_data_0_r = 1;
	else if(ctx_state_data_0_r>126)
		clip_ctx_state_data_0_r = 126;
	else
		clip_ctx_state_data_0_r = ctx_state_data_0_r;	
end

//state
always @* begin
	mps_state_0_r = (clip_ctx_state_data_0_r>=7'd64);
	ctxmps_state_0_r = ((mps_state_0_r ? (clip_ctx_state_data_0_r-7'd64) : (7'd63-clip_ctx_state_data_0_r)) << 1) + mps_state_0_r;
end


//read slope and offset from memory 

//read enable : r_en_mn_0_r
always @* begin
	if(start_slice_init_i && (r_addr_mn_0_r<=(6'd31+w_addr_base_w)))
		r_en_mn_0_r = 1;
	else if(r_addr_mn_0_r==(6'd31+w_addr_base_w))
		r_en_mn_0_r = 0;
	else
		r_en_mn_0_r = 0;
end

//read address  : r_addr_mn_0_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_addr_mn_0_r <= 6'b0;
	else if(r_addr_mn_0_r==(6'd31+w_addr_base_w))
		r_addr_mn_0_r <= w_addr_base_w;
	else if(start_slice_init_i)
		r_addr_mn_0_r <= r_addr_mn_0_r + 1;
	else
		r_addr_mn_0_r <= w_addr_base_w;
end

/*
//ctx_state_data_0_a_r & ctx_state_data_0_b_r
always @* begin
	if(start_slice_init_i) begin
		if(~(r_addr_mn_0_r & 16'h0001)) begin
			ctx_state_data_0_a_r = ctxmps_state_0_r;
			ctx_state_data_0_b_r = ctx_state_data_0_b_r;
		end
		else begin
			ctx_state_data_0_a_r = ctx_state_data_0_a_r;
			ctx_state_data_0_b_r = ctxmps_state_0_r;
		end
	end
	else begin
		ctx_state_data_0_a_r = 0;
		ctx_state_data_0_b_r = 0;
	end
end
*/
//write to memory after calculation the state 
//write enable : w_en_ctx_state_0_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_ctx_state_0_o <= 0;
	else if(start_slice_init_i && r_addr_mn_0_r>=w_addr_base_w && w_addr_ctx_state_0_r<=6'd30) 
		w_en_ctx_state_0_o <= 1;
	else
		w_en_ctx_state_0_o <= 0;	
end

//write address : w_addr_ctx_state_0_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_ctx_state_0_r <= 0;
	else if(w_addr_ctx_state_0_r==6'd31)
		w_addr_ctx_state_0_r <= 0;
	else if(start_slice_init_i && w_en_ctx_state_0_o)
		w_addr_ctx_state_0_r <= w_addr_ctx_state_0_r + 1;
	else
		w_addr_ctx_state_0_r <= w_addr_ctx_state_0_r;	
end

assign	w_addr_ctx_state_0_o = w_addr_ctx_state_0_r;

//write data : w_data_ctx_state_0_o
always @* begin
	w_data_ctx_state_0_o = ctxmps_state_0_r;
end


//-----------------------------------------------------------------------------------------------------------------------------
//1
//clip context state
always @* begin
	if(ctx_state_data_1_r<0)
		clip_ctx_state_data_1_r = 1  ;
	else if(ctx_state_data_1_r>126)
		clip_ctx_state_data_1_r = 126;
	else
		clip_ctx_state_data_1_r = ctx_state_data_1_r;	
end

always @* begin
	mps_state_1_r = (clip_ctx_state_data_1_r>=7'd64);
	ctxmps_state_1_r = ((mps_state_1_r ? (clip_ctx_state_data_1_r-7'd64) : (7'd63-clip_ctx_state_data_1_r)) << 1) + mps_state_1_r;
end

wire signed [15:0] ctx_1_a_w	;
wire signed [15:0] ctx_1_b_w	;

assign	ctx_1_a_w = r_data_m_1_w * clip_qp;
assign	ctx_1_b_w = ctx_1_a_w >>> 4;


//ctx_state_data_1_r
always @* begin
	ctx_state_data_1_r = ctx_1_b_w + r_data_n_1_w; 
end

//r_en_mn_1_r
always @* begin
	if(start_slice_init_i && (r_addr_mn_1_r<=(6'd31+w_addr_base_w)))
		r_en_mn_1_r = 1;
	else if(r_addr_mn_1_r==(6'd31+w_addr_base_w))
		r_en_mn_1_r = 0;
	else
		r_en_mn_1_r = 0;
end

//r_addr_mn_1_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_addr_mn_1_r <= 0 ;
	else if(r_addr_mn_0_r==(6'd31+w_addr_base_w))
		r_addr_mn_1_r <= w_addr_base_w;
	else if(start_slice_init_i)
		r_addr_mn_1_r <= r_addr_mn_1_r + 1;
	else
		r_addr_mn_1_r <= w_addr_base_w;
end
/*
//ctx_state_data_1_a_r & ctx_state_data_1_b_r
always @* begin
	if(start_slice_init_i) begin
		if(~(r_addr_mn_1_r & 16'h0001)) begin
			ctx_state_data_1_a_r = ctxmps_state_1_r;
			ctx_state_data_1_b_r = ctx_state_data_1_b_r;
		end
		else begin
			ctx_state_data_1_a_r = ctx_state_data_1_a_r;
			ctx_state_data_1_b_r = ctxmps_state_1_r;
		end
	end
	else begin
		ctx_state_data_1_a_r = 0;
		ctx_state_data_1_b_r = 0;
	end
end
*/
//w_en_ctx_state_1_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_ctx_state_1_o <= 0;
	else if(start_slice_init_i && r_addr_mn_1_r>=w_addr_base_w && w_addr_ctx_state_1_r<=6'd30) 
		w_en_ctx_state_1_o <= 1;
	else
		w_en_ctx_state_1_o <= 0;	
end

//w_addr_ctx_state_1_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_ctx_state_1_r <= 0;
	else if(w_addr_ctx_state_1_r==6'd31)
		w_addr_ctx_state_1_r <= 0;
	else if(start_slice_init_i && w_en_ctx_state_1_o)
		w_addr_ctx_state_1_r <= w_addr_ctx_state_1_r + 1;
	else
		w_addr_ctx_state_1_r <= w_addr_ctx_state_1_r;	
end

assign	w_addr_ctx_state_1_o = w_addr_ctx_state_1_r;

//w_data_ctx_state_1_o
always @* begin
	w_data_ctx_state_1_o = ctxmps_state_1_r;
end


//-----------------------------------------------------------------------------------------------------------------------------
//2
//clip context state
always @* begin
	if(ctx_state_data_2_r<0)
		clip_ctx_state_data_2_r = 1;
	else if(ctx_state_data_2_r>126)
		clip_ctx_state_data_2_r = 126;
	else
		clip_ctx_state_data_2_r = ctx_state_data_2_r;	
end

always @* begin
	mps_state_2_r = (clip_ctx_state_data_2_r>=7'd64);
	ctxmps_state_2_r = ((mps_state_2_r ? (clip_ctx_state_data_2_r-7'd64) : (7'd63-clip_ctx_state_data_2_r)) << 1) + mps_state_2_r;
end

wire signed [15:0] ctx_2_a_w	;
wire signed [15:0] ctx_2_b_w	;

assign	ctx_2_a_w = r_data_m_2_w * clip_qp;
assign	ctx_2_b_w = ctx_2_a_w >>> 4;


//ctx_state_data_2_r
always @* begin
	ctx_state_data_2_r = ctx_2_b_w + r_data_n_2_w; 
end

//r_en_mn_2_r
always @* begin
	if(start_slice_init_i && (r_addr_mn_2_r<=(6'd31+w_addr_base_w)))
		r_en_mn_2_r = 1'b1;
	else if(r_addr_mn_2_r==(6'd31+w_addr_base_w))
		r_en_mn_2_r = 1'b0;
	else
		r_en_mn_2_r = 1'b0;
end

//r_addr_mn_2_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_addr_mn_2_r <= 0 ;
	else if(r_addr_mn_2_r==(6'd31+w_addr_base_w))
		r_addr_mn_2_r <= w_addr_base_w;
	else if(start_slice_init_i)
		r_addr_mn_2_r <= r_addr_mn_2_r + 1;
	else
		r_addr_mn_2_r <= w_addr_base_w;
end
/*
//ctx_state_data_2_a_r & ctx_state_data_2_b_r
always @* begin
	if(start_slice_init_i) begin
		if(~(r_addr_mn_2_r & 16'h0001)) begin
			ctx_state_data_2_a_r = ctxmps_state_2_r;
			ctx_state_data_2_b_r = ctx_state_data_2_b_r;
		end
		else begin
			ctx_state_data_2_a_r = ctx_state_data_2_a_r;
			ctx_state_data_2_b_r = ctxmps_state_2_r;
		end
	end
	else begin
		ctx_state_data_2_a_r = 0;
		ctx_state_data_2_b_r = 0;
	end
end
*/
//w_en_ctx_state_2_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_ctx_state_2_o <= 0;
	else if(start_slice_init_i && r_addr_mn_2_r>=w_addr_base_w && w_addr_ctx_state_2_r<=6'd30) 
		w_en_ctx_state_2_o <= 1;
	else
		w_en_ctx_state_2_o <= 0;	
end

//w_addr_ctx_state_2_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_ctx_state_2_r <= 0;
	else if(w_addr_ctx_state_0_r==6'd31)
		w_addr_ctx_state_2_r <= 0;
	else if(start_slice_init_i && w_en_ctx_state_2_o)
		w_addr_ctx_state_2_r <= w_addr_ctx_state_2_r + 1;
	else
		w_addr_ctx_state_2_r <= w_addr_ctx_state_2_r;	
end

assign	w_addr_ctx_state_2_o = w_addr_ctx_state_2_r;

//w_data_ctx_state_2_o
always @* begin
	w_data_ctx_state_2_o = ctxmps_state_2_r;
end


//-----------------------------------------------------------------------------------------------------------------------------
//3
//clip context state
always @* begin
	if(ctx_state_data_3_r<0)
		clip_ctx_state_data_3_r = 1;
	else if(ctx_state_data_3_r>126)
		clip_ctx_state_data_3_r = 126;
	else
		clip_ctx_state_data_3_r = ctx_state_data_3_r;	
end

always @* begin
	mps_state_3_r = (clip_ctx_state_data_3_r>=7'd64);
	ctxmps_state_3_r = ((mps_state_3_r ? (clip_ctx_state_data_3_r-7'd64) : (7'd63-clip_ctx_state_data_3_r)) << 1) + mps_state_3_r;
end

wire signed [15:0] ctx_3_a_w	;
wire signed [15:0] ctx_3_b_w	;

assign	ctx_3_a_w = r_data_m_3_w * clip_qp;
assign	ctx_3_b_w = ctx_3_a_w >>> 4;


//ctx_state_data_3_r
always @* begin
	ctx_state_data_3_r = ctx_3_b_w + r_data_n_3_w; 
end

//r_en_mn_3_r
always @* begin
	if(start_slice_init_i && (r_addr_mn_3_r<=(6'd31+w_addr_base_w)))
		r_en_mn_3_r = 1;
	else if(r_addr_mn_3_r==(6'd31+w_addr_base_w))
		r_en_mn_3_r = 0;
	else
		r_en_mn_3_r = 0;
end

//r_addr_mn_3_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_addr_mn_3_r <= 0;
	else if(r_addr_mn_3_r==(6'd31+w_addr_base_w))
		r_addr_mn_3_r <= w_addr_base_w;
	else if(start_slice_init_i)
		r_addr_mn_3_r <= r_addr_mn_3_r + 1;
	else
		r_addr_mn_3_r <= w_addr_base_w;
end
/*
//ctx_state_data_3_a_r & ctx_state_data_3_b_r
always @* begin
	if(start_slice_init_i) begin
		if(~(r_addr_mn_3_r & 16'h0001)) begin
			ctx_state_data_3_a_r = ctxmps_state_3_r;
			ctx_state_data_3_b_r = ctx_state_data_3_b_r;
		end
		else begin
			ctx_state_data_3_a_r = ctx_state_data_3_a_r;
			ctx_state_data_3_b_r = ctxmps_state_3_r;
		end
	end
	else begin
		ctx_state_data_3_a_r = 0;
		ctx_state_data_3_b_r = 0;
	end
end
*/
//w_en_ctx_state_3_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_ctx_state_3_o <= 0;
	else if(start_slice_init_i && r_addr_mn_3_r>=w_addr_base_w && w_addr_ctx_state_3_r<=6'd30) 
		w_en_ctx_state_3_o <= 1;
	else
		w_en_ctx_state_3_o <= 0;	
end

//w_addr_ctx_state_3_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_ctx_state_3_r <= 0;
	else if(w_addr_ctx_state_0_r==6'd31)
		w_addr_ctx_state_3_r <= 0;
	else if(start_slice_init_i && w_en_ctx_state_3_o)
		w_addr_ctx_state_3_r <= w_addr_ctx_state_3_r + 1;
	else
		w_addr_ctx_state_3_r <= w_addr_ctx_state_3_r;	
end

assign	w_addr_ctx_state_3_o = w_addr_ctx_state_3_r;

//w_data_ctx_state_3_o
always @* begin
	w_data_ctx_state_3_o = ctxmps_state_3_r;
end



//4
//clip context state
always @* begin
	if(ctx_state_data_4_r<0)
		clip_ctx_state_data_4_r = 1;
	else if(ctx_state_data_4_r>126)
		clip_ctx_state_data_4_r = 126;
	else
		clip_ctx_state_data_4_r = ctx_state_data_4_r;	
end

always @* begin
	mps_state_4_r = (clip_ctx_state_data_4_r>=7'd64);
	ctxmps_state_4_r = ((mps_state_4_r ? (clip_ctx_state_data_4_r-7'd64) : (7'd63-clip_ctx_state_data_4_r)) << 1) + mps_state_4_r;
end

wire signed [15:0] ctx_4_a_w	;
wire signed [15:0] ctx_4_b_w	;

assign	ctx_4_a_w = r_data_m_4_w * clip_qp;
assign	ctx_4_b_w = ctx_4_a_w >>> 4;


//ctx_state_data_4_r
always @* begin
	ctx_state_data_4_r = ctx_4_b_w + r_data_n_4_w; 
end


//r_en_mn_4_r
always @* begin
	if(start_slice_init_i && (r_addr_mn_4_r<=(6'd31+w_addr_base_w)))
		r_en_mn_4_r = 1;
	else if(r_addr_mn_0_r==(6'd31+w_addr_base_w))
		r_en_mn_4_r = 0;
	else
		r_en_mn_4_r = 0;
end

//r_addr_mn_4_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_addr_mn_4_r <= 0 ;
	else if(r_addr_mn_4_r==(6'd31+w_addr_base_w))
		r_addr_mn_4_r <= w_addr_base_w;
	else if(start_slice_init_i)
		r_addr_mn_4_r <= r_addr_mn_4_r + 1;
	else
		r_addr_mn_4_r <= w_addr_base_w;
end
/*
//ctx_state_data_4_a_r & ctx_state_data_4_b_r
always @* begin
	if(start_slice_init_i) begin
		if(~(r_addr_mn_4_r & 16'h0001)) begin
			ctx_state_data_4_a_r = ctxmps_state_4_r;
			ctx_state_data_4_b_r = ctx_state_data_4_b_r;
		end
		else begin
			ctx_state_data_4_a_r = ctx_state_data_4_a_r;
			ctx_state_data_4_b_r = ctxmps_state_4_r;
		end
	end
	else begin
		ctx_state_data_4_a_r = 0;
		ctx_state_data_4_b_r = 0;
	end
end
*/
//w_en_ctx_state_4_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_ctx_state_4_o <= 0;
	else if(start_slice_init_i && r_addr_mn_4_r>=w_addr_base_w && w_addr_ctx_state_4_r<=6'd30) 
		w_en_ctx_state_4_o <= 1;
	else
		w_en_ctx_state_4_o <= 0;	
end

//w_addr_ctx_state_4_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_ctx_state_4_r <= 0;
	else if(w_addr_ctx_state_4_r==6'd31)
		w_addr_ctx_state_4_r <= 0;
	else if(start_slice_init_i && w_en_ctx_state_4_o)
		w_addr_ctx_state_4_r <= w_addr_ctx_state_4_r + 1;
	else
		w_addr_ctx_state_4_r <= w_addr_ctx_state_4_r;	
end

assign	w_addr_ctx_state_4_o = w_addr_ctx_state_4_r;

//w_data_ctx_state_4_o
always @* begin
	w_data_ctx_state_4_o = ctxmps_state_4_r;
end


cabac_mn_1p_16x64 #(
    .ROM_NUM     ( 'd0 )
  )cabac_mn_1p_16x64_u0(
	.clk		(clk					),
	.r_en		(r_en_mn_0_r			),
	.r_addr		(r_addr_mn_0_r			),
	.r_data		(r_data_mn_0_w			)
);

cabac_mn_1p_16x64 #(
    .ROM_NUM     ( 'd1 )
  )cabac_mn_1p_16x64_u1(
	.clk		(clk					),
	.r_en		(r_en_mn_1_r			),
	.r_addr		(r_addr_mn_1_r			),
	.r_data		(r_data_mn_1_w			)
);

cabac_mn_1p_16x64 #(
    .ROM_NUM     ( 'd2 )
  )cabac_mn_1p_16x64_u2(
	.clk		(clk					),
	.r_en		(r_en_mn_2_r			),
	.r_addr		(r_addr_mn_2_r			),
	.r_data		(r_data_mn_2_w			)
);

cabac_mn_1p_16x64 #(
    .ROM_NUM     ( 'd3 )
  )cabac_mn_1p_16x64_u3(
	.clk		(clk					),
	.r_en		(r_en_mn_3_r			),
	.r_addr		(r_addr_mn_3_r			),
	.r_data		(r_data_mn_3_w			)
);

cabac_mn_1p_16x64 #(
    .ROM_NUM     ( 'd4 )
  )cabac_mn_1p_16x64_u4(
	.clk		(clk					),
	.r_en		(r_en_mn_4_r			),
	.r_addr		(r_addr_mn_4_r			),
	.r_data		(r_data_mn_4_w			)
);

endmodule

