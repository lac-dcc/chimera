//======================================
//
//  Filename      : fetch8x8.v
//  Created On    : 2015-01-03
//  Author        : Yanheng Lu
//  Description   : original 8x8 block pixels fetch
//
//======================================
module fetch8x8(
	clk,
	rstn,
	
	enable,
	addr,
	data,
	cnt,
	blockcnt,
	finish,
	control,
	
	md_ren_o,	
	md_sel_o,	
	md_size_o,	
	md_4x4_x_o,	
	md_4x4_y_o,
	md_idx_o,	
	md_data_i	
);

	input						clk;
	input						rstn;
	input						enable;
	
	output		[31:0]			data;
	output						control;
	output		[3:0]			addr;
	output		[5:0]			cnt;
	output		[6:0]			blockcnt;
	input						finish;
	output						md_ren_o	;
	output						md_sel_o	;
	output		[1:0]			md_size_o	;
	output		[3:0]			md_4x4_x_o	;
	output		[3:0]			md_4x4_y_o	;
	output		[4:0]			md_idx_o	;
	input		[255:0]			md_data_i	;
	
	reg							md_ren_o	;
	wire						md_sel_o	;
	wire		[1:0]			md_size_o	;
	wire		[3:0]			md_4x4_x_o	;
	wire		[3:0]			md_4x4_y_o	;
	wire		[4:0]			md_idx_o	;
			
	reg			[31:0]			data;
	reg							control;
	reg			[3:0]			addr;
			
	reg			[5:0]			cnt;
	reg			[6:0]			blockcnt;
	wire		[255:0]			rdata;
	reg							flag;
	
//=====================================================================================
	
	assign		md_sel_o	=	1'b0;
	assign		md_size_o	=	2'b01;
	assign		md_idx_o	=	{2'b00,flag,2'b00};
	assign		md_4x4_x_o	=	{blockcnt[4],blockcnt[2],blockcnt[0],1'b0};
	assign		md_4x4_y_o	=	{blockcnt[5],blockcnt[3],blockcnt[1],1'b0};
	
	assign		rdata		=	md_data_i;
	
	always@(posedge clk or negedge rstn)
		if(!rstn)
			flag	<=	1'b0;
		else
			flag	<=	cnt[3];
	
	always@(posedge clk or negedge rstn)
		if(!rstn)
			cnt <= 'd0;
		else if((cnt == 'd40)||finish)
			cnt <= 'd0;
		else if(enable)
			cnt <= cnt + 1'b1;
			
	always@(posedge clk or negedge rstn)
		if(!rstn)
			blockcnt <= 'd0;
		else if(enable && (cnt == 'd32))
			blockcnt <= blockcnt + 1'b1;
		else if(finish)
			blockcnt <=	'd0;
	
	always@(posedge clk or negedge rstn)
		if(!rstn)
			md_ren_o	<=	1'b0;
		else if((cnt == 'd0)&&enable)
			md_ren_o	<=	1'b1;
		else if(cnt == 'd17)
			md_ren_o	<=	1'b0;
			
	always@(posedge clk or negedge rstn)
		if(!rstn)
			control	<=	1'b0;
		else if(cnt == 'd1)
			control	<=	1'b1;
		else if(cnt == 'd17)
			control	<=	1'b0;
			
	always@(posedge clk or negedge rstn)
		if(!rstn)
			addr	<=	'd0;
		else if(control)
			addr	<=	addr	+	1'b1;
		else if(cnt	==	'd17)
			addr	<=	'd0;
			
	always@(*) begin	
		if(md_ren_o)
			case(cnt[2:0])
				3'd2:	data	=	rdata[255:224];
				3'd3:	data	=	rdata[223:192];
				3'd4:	data	=	rdata[191:160];
				3'd5:	data	=	rdata[159:128];
				3'd6:	data	=	rdata[127:96];
				3'd7:	data	=	rdata[95:64];
				3'd0:	data	=	rdata[63:32];
				3'd1:	data	=	rdata[31:0];
			endcase
		else
			data		=	'd0;
	end
			
endmodule
