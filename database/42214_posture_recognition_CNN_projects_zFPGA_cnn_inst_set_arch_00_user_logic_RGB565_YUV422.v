// This program was cloned from: https://github.com/cxdzyq1110/posture_recognition_CNN
// License: GNU General Public License v3.0

// RGB565-to-YUV422
module RGB565_YUV422
(
	// system signal
	input	wire			sys_clk, sys_rst_n,
	input	wire	[7:2]	KEY_safe,
	// 7121
	input	wire			RGB565_PCLK,
	input	wire			RGB565_HSYNC,		// 换行		// 需要由MT9D111打上一拍
	input	wire			RGB565_VSYNC,		// 场同步	// 需要由MT9D111打上一拍
	input	wire	[15:0]	RGB565_D,
	input	wire			RGB565_DE,			// 数据有效
	output	wire			YUV422_PCLK,		// 数据时钟[YUV422]
	output	reg		[15:0]	YUV422_D,
	output	reg				YUV422_DE,
	output	reg				YUV422_HSYNC,
	output	reg				YUV422_VSYNC
);
	/*
	yuv<-->rgb
		Y'= 0.299*R' + 0.587*G' + 0.114*B'
		U'= -0.147*R' - 0.289*G' + 0.436*B' =0.492*(B'- Y')
		V'= 0.615*R' - 0.515*G' - 0.100*B' =0.877*(R'- Y')
		R' = Y' + 1.140*V'
		G' = Y' - 0.394*U' - 0.581*V'
		B' = Y' + 2.032*U'
	yCbCr<-->rgb
		Y’ = 0.257*R' + 0.504*G' + 0.098*B' + 16
		Cb' = -0.148*R' - 0.291*G' + 0.439*B' + 128
		Cr' = 0.439*R' - 0.368*G' - 0.071*B' + 128
		R' = 1.164*(Y’-16) + 1.596*(Cr'-128)
		G' = 1.164*(Y’-16) - 0.813*(Cr'-128) -0.392*(Cb'-128)
		B' = 1.164*(Y’-16) + 2.017*(Cb'-128)
	*/
	// 寄存器链
	reg		[15:0]	HSYNC;
	reg		[15:0]	VSYNC;
	reg		[15:0]	DE;
	always @(posedge RGB565_PCLK)
	begin
		HSYNC <= {HSYNC[14:0], RGB565_HSYNC};
		VSYNC <= {VSYNC[14:0], RGB565_VSYNC};
		DE <= {DE[14:0], RGB565_DE};
	end
	//
	assign			YUV422_PCLK = RGB565_PCLK;
	/////////////////////////
	// RGB to YUV, data/valid selected
	reg		[10:0]	pix_cnt;
	reg		[7:0]	RGB888_R;
	reg		[7:0]	RGB888_G;
	reg		[7:0]	RGB888_B;
	always @(posedge RGB565_PCLK)
	begin
		if(RGB565_DE)
		begin
			RGB888_R <= {RGB565_D[15:11], 3'B000};
			RGB888_G <= {RGB565_D[10:5], 2'B00};
			RGB888_B <= {RGB565_D[4:0], 3'B000};
		end
	end
	// RGB to YUV
	reg		[16:0]	YUV422_Y_reg;// = 66*RGB888_R + 129 * RGB888_G + 25*RGB888_B;
	reg		[16:0]	YUV422_Cb_reg;// = -38*RGB888_R - 74*RGB888_G + 112*RGB888_B;
	reg		[16:0]	YUV422_Cr_reg;// = 112*RGB888_R - 94*RGB888_G - 18*RGB888_B;
	// set_multicycle_path -- 理论上，两个时钟计算一次即可
	// 不过，在芯片 5CSEBA6U23I7 上面，似乎不必太在意，因为65MHz时钟比较慢(Fmax=81.63MHz)
	// 或者可以打一拍看看，将MAC运算拆分为 * / + 两步进行 ==> 171.79MHz
	reg		[16:0]	RGB888_R_66;
	reg		[16:0]	RGB888_R_38;
	reg		[16:0]	RGB888_R_112;
	reg		[16:0]	RGB888_G_129;
	reg		[16:0]	RGB888_G_74;
	reg		[16:0]	RGB888_G_94;
	reg		[16:0]	RGB888_B_25;
	reg		[16:0]	RGB888_B_112;
	reg		[16:0]	RGB888_B_18;
	always @(posedge YUV422_PCLK)
	begin
		RGB888_R_66 <= 9'D66*RGB888_R;
		RGB888_R_38 <= 9'D38*RGB888_R;
		RGB888_R_112 <= 9'D112*RGB888_R;
		RGB888_G_129 <= 9'D129*RGB888_G;
		RGB888_G_74 <= 9'D74*RGB888_G;
		RGB888_G_94 <= 9'D94*RGB888_G;
		RGB888_B_25 <= 9'D25*RGB888_B;
		RGB888_B_112 <= 9'D112*RGB888_B;
		RGB888_B_18 <= 9'D18*RGB888_B;
		
		YUV422_Y_reg <= RGB888_R_66 + RGB888_G_129 + RGB888_B_25;
		YUV422_Cb_reg <= - RGB888_R_38 - RGB888_G_74 + RGB888_B_112;
		YUV422_Cr_reg <= RGB888_R_112 - RGB888_G_94 - RGB888_B_18;
	end
	// 然后，Y方向上1:1采样，Cb/Cr方向上2:1采样
	reg		[8:0]	YUV422_Y;
	reg		[8:0]	YUV422_Cb;
	reg		[8:0]	YUV422_Cr;
	always @(posedge YUV422_PCLK)
		if(!HSYNC[3])
			pix_cnt <= 0;
		else if(DE[3])
		begin
			YUV422_Y <= (YUV422_Y_reg>>>8) + 16;	// 16~235
			if(!pix_cnt[0])
			begin
				YUV422_Cb <= (YUV422_Cb_reg>>>8) + 128;	// 16~240
				YUV422_Cr <= (YUV422_Cr_reg>>>8) + 128;	// 16~240
			end
			
			pix_cnt <= pix_cnt + 1;
		end
	
	wire	[7:0]	YUV422_Y_valid = (YUV422_Y<16)? 16 : (YUV422_Y>235)? 235 : YUV422_Y;
	wire	[7:0]	YUV422_Cb_valid = (YUV422_Cb<16)? 16 : (YUV422_Cb>240)? 240 : YUV422_Cb;
	wire	[7:0]	YUV422_Cr_valid = (YUV422_Cr<16)? 16 : (YUV422_Cr>240)? 240 : YUV422_Cr;
	
	always @(posedge YUV422_PCLK)
	begin
		if(pix_cnt[0])
			YUV422_D <= {YUV422_Cb_valid, YUV422_Y_valid};
		else
			YUV422_D <= {YUV422_Cr_valid, YUV422_Y_valid};
		//
		YUV422_DE <= DE[4];
		YUV422_HSYNC <= HSYNC[4];
		YUV422_VSYNC <= VSYNC[4];
	end	
	//
	
endmodule