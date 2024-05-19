// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

`include "vga_config.inc"
module adv7513_controller(
	ADV7513_PCLK, RESETN,
	ADV7513_R, ADV7513_G, ADV7513_B, 
	ADV7513_HSYNC,
	ADV7513_VSYNC,
	ADV7513_BLANK_N,
	ADV7513_VCnt,
	ADV7513_HCnt,
	ADV7513_DATA,
	ADV7513_DATA_REQ,
	ADV7513_FRAME_NEW_EN,
	ADV7513_DE,
	ACTION_WORD,
	ACTION_TITLE,
	SW
	);
	
	input	ADV7513_PCLK,RESETN;
	output	reg	[4:0]	ADV7513_R;
	output	reg	[5:0]	ADV7513_G;
	output	reg	[4:0]	ADV7513_B;
	output	ADV7513_HSYNC,ADV7513_VSYNC;
	output	ADV7513_BLANK_N;
	input	[3:0]		SW;	// 拨码开关
	//
	output	reg				ADV7513_DATA_REQ, ADV7513_DE;
	output	reg				ADV7513_FRAME_NEW_EN;
	
	output	reg		[10:0]	ADV7513_HCnt;
	output	reg		[10:0]	ADV7513_VCnt;
	input			[15:0]	ADV7513_DATA;
	input			[15:0]	ACTION_WORD;
	input			[15:0]	ACTION_TITLE;
	//
	/*				HA		HF 		HS  	HB 		VA 		VF  	VS  	VB		PCLK
	640x480@60Hz	640 	16		96		48		480		1		3		16 		25MHz
	800x600@75Hz	800		16		80		160		600		1		3		21		50MHz	// VGA
	800x600@75Hz	800		56		120		64		600		37		6		23		50MHz	// HDMI
	1024x768@60Hz	1024	24		136		160		768		3		6		29		65MHz
	1024x768@24Hz	1024	24		136		160		768		3		6		29		25MHz
	1280x960		1280	96		112		312		960		1		3		36		108MHz
	1280x1024		1280	48		112		248		1024	1		3		38		108MHz
	1920x1080		1920	28		12		40		1080	3		4		18		130MHz
	*/
	parameter 	HA = 11'D640;		// 行显示，有效
	parameter 	HF = 11'D16;		// 行消隐，前肩
	parameter	HS = 11'D96;		// 行同步
	parameter	HB = 11'D48;		// 行消隐，后尖
	parameter 	HT = (HA+HF+HS+HB);
	parameter 	VA = 11'D480;		// 场显示，有效
	parameter 	VF = 11'D1;			// 场消隐，前肩，
	parameter	VS = 11'D3;			// 场同步
	parameter	VB = 11'D16;		// 场消隐，后尖
	parameter	VT = (VA+VF+VS+VB);

	always @(posedge ADV7513_PCLK)	
		if(!RESETN)
		begin
			ADV7513_HCnt <= 0;
			ADV7513_VCnt <= 0;
		end
		else if(ADV7513_HCnt>=(HT-1))
		begin
			ADV7513_HCnt <= 0;
			if(ADV7513_VCnt>=(VT-1))
			begin
				ADV7513_VCnt <= 0;
			end
			else
				ADV7513_VCnt <= ADV7513_VCnt + 1;
		end
		else
			ADV7513_HCnt <= ADV7513_HCnt + 1;

	assign	ADV7513_HSYNC = (ADV7513_HCnt>=(HA+HF) && (ADV7513_HCnt<(HA+HF+HS)));
	assign	ADV7513_VSYNC = (ADV7513_VCnt>=(VA+VF) && (ADV7513_VCnt<(VA+VF+VS)));
	assign	ADV7513_BLANK_N = ~(((ADV7513_HCnt>=HA)&&(ADV7513_HCnt<HT))||(ADV7513_VCnt>=VA)&&(ADV7513_VCnt<VT));

	// 生成新的一帧的信号，以及数据请求信号
	always @(posedge ADV7513_PCLK)
	begin
		ADV7513_FRAME_NEW_EN <= (ADV7513_VCnt>=(VA+1)) && (ADV7513_HCnt==(HA+1));
		ADV7513_DATA_REQ <= (ADV7513_VCnt>=(`VGA_V_BIAS) && ADV7513_VCnt<(`VGA_V_BIAS + `VGA_V_WIDTH) && ADV7513_HCnt>=(`VGA_H_BIAS) && ADV7513_HCnt<(`VGA_H_BIAS + `VGA_H_WIDTH ));
		//ADV7513_DE <= (ADV7513_VCnt>=(`VGA_V_BIAS) && ADV7513_VCnt<(`VGA_V_BIAS + `VGA_V_WIDTH) && ADV7513_HCnt>=(`VGA_H_BIAS) && ADV7513_HCnt<(`VGA_H_BIAS + `VGA_H_WIDTH ));
		ADV7513_DE <= (ADV7513_VCnt<VA && ADV7513_HCnt<HA);
	end
	
	// 再显示区域，需要把边框置为白色
	wire 	IN_ZONE_0 = ((ADV7513_VCnt>(`VGA_V_BIAS+`VGA_V_BORD) && ADV7513_VCnt<(`VGA_V_BIAS+`VGA_V_BORD+`VGA_V_LENG)) && 
							(ADV7513_HCnt>(`VGA_H_BIAS+`VGA_H_BORD) && ADV7513_HCnt<(`VGA_H_BIAS+`VGA_H_BORD+`VGA_H_LENG))
						);	// 左上角
	wire 	IN_ZONE_1 = ((ADV7513_VCnt>(`VGA_V_BIAS+`VGA_V_BORD) && ADV7513_VCnt<(`VGA_V_BIAS+`VGA_V_BORD+`VGA_V_LENG)) && 
							(ADV7513_HCnt>(`VGA_H_BIAS+(`VGA_H_WIDTH>>1)+`VGA_H_BORD) && ADV7513_HCnt<(`VGA_H_BIAS+(`VGA_H_WIDTH>>1)+`VGA_H_BORD+`VGA_H_LENG))
						);	// 右上角
	wire 	IN_ZONE_2 = ((ADV7513_VCnt>(`VGA_V_BIAS+(`VGA_V_WIDTH>>1)+`VGA_V_BORD) && ADV7513_VCnt<(`VGA_V_BIAS+(`VGA_V_WIDTH>>1)+`VGA_V_BORD+`VGA_V_LENG)) && 
							(ADV7513_HCnt>(`VGA_H_BIAS+`VGA_H_BORD) && ADV7513_HCnt<(`VGA_H_BIAS+`VGA_H_BORD+`VGA_H_LENG))
						);	// 左下角
	wire 	IN_ZONE_3 = ((ADV7513_VCnt>(`VGA_V_BIAS+(`VGA_V_WIDTH>>1)+`VGA_V_BORD) && ADV7513_VCnt<(`VGA_V_BIAS+(`VGA_V_WIDTH>>1)+`VGA_V_BORD+`VGA_V_LENG)) && 
							(ADV7513_HCnt>(`VGA_H_BIAS+(`VGA_H_WIDTH>>1)+`VGA_H_BORD) && ADV7513_HCnt<(`VGA_H_BIAS+(`VGA_H_WIDTH>>1)+`VGA_H_BORD+`VGA_H_LENG))
						);	// 右下角
	wire	IN_BORDER_ZONE = (!IN_ZONE_0 && !IN_ZONE_1 && !IN_ZONE_2 && !IN_ZONE_3);
	//assign	{ADV7513_R,ADV7513_G,ADV7513_B}=(ADV7513_HCnt<200 && ADV7513_VCnt<200)? 3'B100 : (ADV7513_HCnt<400 && ADV7513_VCnt<(VA-1))? 3'B010: 3'B000;
	/*******/
	always @(posedge ADV7513_PCLK)
		// 彩条
		if(SW[1])	
		begin
			if((ADV7513_VCnt<VA && ADV7513_HCnt<HA))
			begin
				// red
				if(ADV7513_HCnt<(HA >> 2))
					{ADV7513_R, ADV7513_G, ADV7513_B} <= {5'H1F, 6'H00, 5'H00};
				// green
				else if(ADV7513_HCnt>=(HA >> 2) && ADV7513_HCnt<(HA >> 1))
					{ADV7513_R, ADV7513_G, ADV7513_B} <= {5'H00, 6'H3F, 5'H00};
				// blue
				else if(ADV7513_HCnt>=(HA >> 1) && ADV7513_HCnt<(HA >> 2)*3)
					{ADV7513_R, ADV7513_G, ADV7513_B} <= {5'H00, 6'H00, 5'H1F};
				// white
				else
					{ADV7513_R, ADV7513_G, ADV7513_B} <= 16'HFFFF;
			end
			else
				{ADV7513_R, ADV7513_G, ADV7513_B} <= 16'H0000;
		end		
		else
		begin
			{ADV7513_R, ADV7513_G, ADV7513_B} <= 	(ADV7513_VCnt>=`TITLE_V_BIAS && ADV7513_VCnt<(`TITLE_V_BIAS+`TITLE_V_WIDTH) && ADV7513_HCnt>=(`TITLE_H_BIAS) && ADV7513_HCnt<(`TITLE_H_BIAS + `TITLE_H_WIDTH ))? 
														ACTION_TITLE : 
													(ADV7513_VCnt>=`WORD_V_BIAS && ADV7513_VCnt<(`WORD_V_BIAS+`WORD_V_WIDTH) && ADV7513_HCnt>=(`WORD_H_BIAS) && ADV7513_HCnt<(`WORD_H_BIAS + `WORD_H_WIDTH ))? 
														ACTION_WORD : 
													(ADV7513_VCnt>=(`VGA_V_BIAS) && ADV7513_VCnt<(`VGA_V_BIAS + `VGA_V_WIDTH) && ADV7513_HCnt>=(`VGA_H_BIAS) && ADV7513_HCnt<(`VGA_H_BIAS + `VGA_H_WIDTH ))? 
														(IN_BORDER_ZONE? 16'HFFFF : ADV7513_DATA): 
													(ADV7513_VCnt<VA && ADV7513_HCnt<HA)? 16'HFFFF : 16'H0000;
		end
endmodule

