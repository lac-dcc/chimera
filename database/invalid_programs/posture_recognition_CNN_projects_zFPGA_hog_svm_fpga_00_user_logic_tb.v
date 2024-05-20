// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

`timescale 1 ps / 1 ps
`include "vga_config.inc"
module tb;
	
	reg			CLOCK100, CLOCK150, CLOCK65, RESETN;
	
	always #1	CLOCK100 <= ~CLOCK100;
	always #1	CLOCK150 <= ~CLOCK150;
	always #1	CLOCK65 <= ~CLOCK65;
	//////////////////////////////////////////////////////////////////////
	////////////////////////////
	wire				MT9D111_PCLK;
	wire				MT9D111_VSYNC;
	wire				MT9D111_HREF;
	wire	[7:0]		MT9D111_D;
	// mt9d111 simulator
	mt9d111_sim			mt9d111_sim_inst(
							.CLOCK65(CLOCK65),
							.RESETN(RESETN),
							.MT9D111_PCLK(MT9D111_PCLK),
							.MT9D111_VSYNC(MT9D111_VSYNC),
							.MT9D111_HREF(MT9D111_HREF),
							.MT9D111_D(MT9D111_D)
						);
	// top module
	top					top_inst(
							.CLOCK100(CLOCK100),
							.CLOCK150(CLOCK150),
							.CLOCK65(CLOCK65),
							.RESETN(RESETN),
							// mt9d111
							.MT9D111_PCLK(MT9D111_PCLK),
							.MT9D111_VSYNC(MT9D111_VSYNC),
							.MT9D111_HREF(MT9D111_HREF),
							.MT9D111_D(MT9D111_D)
						);
	///////////////////////////////////////////////////////////////////////
	integer		fp;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell_En)
			$fwrite(fp, "%d,%d,%d,%d,%d,%d,%d,%d,%d\n", top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[8],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[7],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[6],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[5],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[4],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[3],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[2],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[1],
														top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Cell[0]
														);
		else if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm_En)
			$fwrite(fp, "%%[%d] ==> %d,%d,%d,%d,%d,%d,%d,%d,%d\n", 	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Mean,
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[8],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[7],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[6],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[5],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[4],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[3],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[2],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[1],
																	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.Mxy_Stat_Norm[0]
																	);
	
	/*
	// 记录HSG特征
	integer  g;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.HSG_Feature_In_Window_En)
			$fwrite(fp3, "%H\n", top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.HSG_Feature_In_Window);
	*/
	// 将PD行人检测的结果输出到文本文件中，方便观察记录
	// 记录行人检测结果
	integer		fp4;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.svm_judge_res)
		begin
			$fwrite(fp4, "scale: 1/%d ==> [%d, %d] ==> %d\n", 	top_inst.hog_svm_pd_rtl_inst.svm_judge_res_scale,
																top_inst.hog_svm_pd_rtl_inst.svm_judge_HCnt,
																top_inst.hog_svm_pd_rtl_inst.svm_judge_VCnt,
																top_inst.hog_svm_pd_rtl_inst.svm_judge_res_grade
					);
		end
	// 记录灰度图像
	integer		fp2;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.YUV422_DE)
			$fwrite(fp2, "%d\n", top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.YUV422_D_curr[7:0]);
	// 记录HSG特征
	integer		fp3;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.cstate==3)
			$fwrite(fp3, "%H, %d\n", 	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.svm_vut_scfifo_q[3275:0], 
										top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_800x600_inst.svm_judge_sum
			);
	integer		fp5;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_200x150_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_200x150_inst.cstate==3)
			$fwrite(fp5, "%H, %d\n", 	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_200x150_inst.svm_vut_scfifo_q[3275:0], 
										top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_200x150_inst.svm_judge_sum
			);
	integer		fp6;
	always @(posedge top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_400x300_inst.RGB565_PCLK)
		if(top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_400x300_inst.cstate==3)
			$fwrite(fp6, "%H, %d\n", 	top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_400x300_inst.svm_vut_scfifo_q[3275:0], 
										top_inst.hog_svm_pd_rtl_inst.hog_svm_pd_400x300_inst.svm_judge_sum
			);
	///////////////////////////////////////////////////////////////////////
	
	initial
	begin
	
		#0		CLOCK100 = 0; CLOCK150 = 0; CLOCK65 = 0; RESETN = 0; 
				$readmemh("../../matlab/picture/source_rgb565.list", mt9d111_sim_inst.pixel_rgb565);
				fp = $fopen("hog_svm_result.txt", "w");
				fp2 = $fopen("yuv_result.txt", "w");
				fp3 = $fopen("my_hsg_feature-800x600.txt", "w");
				fp5 = $fopen("my_hsg_feature-200x150.txt", "w");
				fp6 = $fopen("my_hsg_feature-400x300.txt", "w");
				fp4 = $fopen("my_pd_result.txt", "w");
		#1000	RESETN = 1;
	end
	///////////////////////////////////////////////////////////////////////
							
endmodule