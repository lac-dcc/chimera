//-------------------------------------------------------------------
//
//  Filename      : hevc_md_top.v
//  Created On    : 2014-04-23
//  Version1.0    : 2014-05-04
//  Version2.0    : 2015-03-09
//  Author        : Yanheng Lu
//  Description   : pre_intra(pre mode desision) top module
//                  V1.0 basic
//                  V2.0 for encoder
//
//-------------------------------------------------------------------
module hevc_md_top(

	clk,
	rstn,
	
	md_ren_o,
	md_sel_o,
	md_size_o,
	md_4x4_x_o,
	md_4x4_y_o,
	md_idx_o,
	md_data_i,

	md_we,
	md_waddr,
	md_wdata,
	
	enable,
	finish
	
);
	//global
	input							clk			;
	input							rstn		;
	// original pixels data read
	output							md_ren_o	;
	output							md_sel_o	;
	output		[1:0]				md_size_o	;
	output		[3:0]				md_4x4_x_o	;
	output		[3:0]				md_4x4_y_o	;
	output		[4:0]				md_idx_o	;
	input		[255:0]				md_data_i	;
	// mode ram
	output							md_we;
	output		[5:0]				md_wdata;
	output		[6:0]				md_waddr;
	// state
	output							finish;
	input							enable;

//===============wire declaration====================================================
	
	wire							finish;
	reg								enable_reg;
	reg								enable_r;
	
	wire		[3:0]				sram_raddr;
	wire							sram_read;
	wire		[31:0]				sram_rdata;
	wire		[3:0]				sram_waddr;
	wire							sram_write;
	wire		[31:0]				sram_wdata;
	
	wire		[5:0]				cnt;//cycle count
	wire		[6:0]				blockcnt;//8x8 block count
			
	wire		[5:0]				bestmode; //best mode for 8x8
	wire		[5:0]				bestmode16;//best mode for 16x16
	wire		[5:0]				bestmode32;//best mode for 32x32
	
//===========================================================================================
	
	always@(posedge clk or negedge rstn)
		if(!rstn)
			enable_reg	<=	1'b0;
		else if(finish)
			enable_reg	<=	1'b0;
		else if(enable_r && cnt[3])
			enable_reg	<=	1'b1;
			
	always@(posedge clk or negedge rstn)
		if(!rstn)
			enable_r		<=	1'b0;
		else if(finish)
			enable_r		<=	1'b0;
		else if(enable)
			enable_r		<=	1'b1;
	
md_top md_top1(
	.clk				(clk),
	.rstn				(rstn),
	.enable				(enable_reg),
	.sram_rdata			(sram_rdata),
	.sram_read			(sram_read),
	.sram_raddr			(sram_raddr),
	.bestmode_o			(bestmode),
	.bestmode16_o		(bestmode16),
	.bestmode32_o		(bestmode32),
	.finish				(finish)
);// mode decision module

md_ram md_ram1(
	.clk(clk),
	.wdata(sram_wdata),
    .waddr(sram_waddr),
    .we(sram_write),
    .rd(sram_read),
    .raddr(sram_raddr[3:0]),
    .rdata(sram_rdata)
);// original pixels data ram

fetch8x8 u_fetch8x8(
	.clk		(clk),
	.rstn		(rstn),
	.cnt		(cnt),
	.blockcnt	(blockcnt),
	.finish		(finish),
	.enable		(enable_r||enable),
	.data		(sram_wdata),
	.addr		(sram_waddr),
	.md_ren_o	(md_ren_o	),
	.md_sel_o	(md_sel_o	),
	.md_size_o	(md_size_o	),
	.md_4x4_x_o	(md_4x4_x_o	),
	.md_4x4_y_o	(md_4x4_y_o	),
	.md_idx_o	(md_idx_o	),
	.md_data_i	(md_data_i	),
	.control	(sram_write)
);//fetch 8x8 original pixels

mode_write u_mode_write(
	.clk		(clk),
	.rstn		(rstn),
	.cnt		(cnt),
	.blockcnt	(blockcnt),
	.bestmode	(bestmode),
	.bestmode16	(bestmode16),
	.bestmode32	(bestmode32),
	.finish		(finish),
	.md_we		(md_we),
	.md_waddr	(md_waddr),
	.md_wdata	(md_wdata)
);// mode write back to mode ram

//*************************************
//
//   luyanheng
//
//   mode dump
//
//*************************************
/*
integer f_mode;

initial begin
	f_mode = $fopen("./mode.dat","w");
end

always @(posedge clk) begin
	if(md_we)	begin
		$fwrite(f_mode, "%0h", md_wdata);
		$fwrite(f_mode, "\n"); 
	end
end
*/			
endmodule
