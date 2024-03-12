//-------------------------------------------------------------------
//
//  Filename      : mode_write.v
//  Created On    : 2015-01-05
//  Author        : Yanheng Lu
//  Description   : mode write back to mode ram
//
//-------------------------------------------------------------------
module mode_write(
	clk			,
	rstn		,
	cnt		    ,
	blockcnt	,
	bestmode	,
	bestmode16	,
	bestmode32	,
	finish		,
	md_we		,
	md_waddr	,
	md_wdata	
);

	input								rstn;
	input								clk;
	input				[5:0]			cnt;
	input				[6:0]			blockcnt;
	input				[5:0]			bestmode;
	input				[5:0]			bestmode16;
	input				[5:0]			bestmode32;	
	input								finish;
	
	output								md_we;
	output				[5:0]			md_wdata;
	output				[6:0]			md_waddr;
	
	reg									md_we;
	reg					[5:0]			md_wdata;
	reg					[6:0]			md_waddr;
	
always@(posedge clk or negedge rstn)
	if(!rstn)
		md_waddr	<=	7'd0;
	else if(md_we)
		md_waddr	<=	md_waddr	+	1'b1;
	else if(finish)
		md_waddr	<=	7'd0;
		
always@(posedge clk or negedge rstn)
	if(!rstn)
		md_we		<=	1'b0;
	else if(((blockcnt>7'd1)&&(cnt==6'd11))
				||((blockcnt[1:0]==2'b01)&&(cnt==6'd12)&&(blockcnt!=7'd1))
					||((blockcnt[3:0]==4'b0001)&&(cnt==6'd13)&&(blockcnt!=7'd1)))// 8x8 & 16x16 & 32x32
		md_we		<=	1'b1;
	else
		md_we		<=	1'b0;
		
always@(posedge clk or negedge rstn)
	if(!rstn)
		md_wdata	<=	'd0;
	else if(cnt=='d11)
		md_wdata	<=	bestmode;
	else if(cnt=='d12)
		md_wdata	<=	bestmode16;
	else if(cnt=='d13)
		md_wdata	<=	bestmode32;
			
endmodule
	