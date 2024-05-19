// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

`include "vga_config.inc"
module mt9d111_sim
(
	input	wire		CLOCK65, RESETN,
	
	output	wire		MT9D111_PCLK,
	output	reg			MT9D111_VSYNC,
	output	reg			MT9D111_HREF,
	output	reg	[7:0]	MT9D111_D
);
	// 这里存储的是视频数据
	reg		[15:0]		pixel_rgb565	[0:268435456*4-1];
	// 65MHz --> 160x128 / 30 fps
	// 使用状态机
	reg		[3:0]		cstate;
	reg		[5:0]		FrameCnt;
	reg		[10:0]		MT9D111_HCnt;
	reg		[10:0]		MT9D111_VCnt;
	reg					MT9D111_HLSel;
	wire	[15:0]		MT9D111_RGB565 = pixel_rgb565[(({32'D0, ({32'D0, MT9D111_VCnt})*((`CAM_H_WIDTH))+(({32'D0, MT9D111_HCnt}-0))})&32'H1F_FFFF) | {5'D0, FrameCnt&6'H3F, 21'H00_0000}];
	reg		[21:0]		delay;
	always @(posedge CLOCK65)
		if(!RESETN)
		begin
			cstate <= 0;
			MT9D111_VSYNC <= 0;
			MT9D111_HREF <= 0;
			MT9D111_D <= 0;
			MT9D111_HLSel <= 0;
			MT9D111_VCnt <= 0;
			MT9D111_HCnt <= 0;
			delay <= 0;
			FrameCnt <= 0;
		end
		else
		begin
			case(cstate)
				0: begin
					cstate <= 1;
					delay <= 0;
					MT9D111_VSYNC <= 0;
					MT9D111_HREF <= 0;
				end
				
				1: begin
					if(delay>=2000)
					begin
						cstate <= 2;
						delay <= 0;
						MT9D111_VSYNC <= 1;
						MT9D111_HREF <= 0;
						MT9D111_VCnt <= 0;
						MT9D111_HCnt <= 0;
					end
					else
						delay <= delay + 1;
				end
				
				2: begin
					if(delay>=10)
					begin	
						if(MT9D111_VCnt<`CAM_V_WIDTH)
						begin
							MT9D111_HREF <= 1;
							MT9D111_HCnt <= 0;
							MT9D111_HLSel <= 0;
							MT9D111_D <= MT9D111_RGB565[15:8];
							cstate <= 3;
						end
						else
						begin
							MT9D111_VSYNC <= 0;
							MT9D111_HREF <= 0;
							cstate <= 0;
							FrameCnt <= FrameCnt + 1;
						end
					end
					else
						delay <= delay  +1;
				end
				
				3: begin
					MT9D111_HLSel <= ~MT9D111_HLSel;
					if(MT9D111_HLSel)
					begin
						if(MT9D111_HCnt<(`CAM_H_WIDTH))
						begin
							MT9D111_D <= MT9D111_RGB565[15:8];
							MT9D111_HCnt <= MT9D111_HCnt + 1;
							if(MT9D111_HCnt>=(`CAM_H_WIDTH-1))
							begin
								MT9D111_HREF <= 0;
								MT9D111_VCnt <= MT9D111_VCnt + 1;
								cstate <= 2;
								delay <= 0;
							end
						end
					end
					else	
						MT9D111_D <= MT9D111_RGB565[7:0];
				end
				
				default: begin
					cstate <= 0;
					MT9D111_VSYNC <= 0;
					MT9D111_HREF <= 0;
					MT9D111_D <= 0;
					MT9D111_HLSel <= 0;
					MT9D111_VCnt <= 0;
					MT9D111_HCnt <= 0;
					delay <= 0;
				end
			endcase
		end
	// 输出信号
	assign				MT9D111_PCLK = CLOCK65;
	
endmodule