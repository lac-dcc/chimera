module mt9d111_controller(
	input	wire			MT9D111_PCLK,
	input	wire			MT9D111_VSYNC,
	input	wire			MT9D111_HREF,
	input	wire	[7:0]	MT9D111_D,	
	output	reg		[10:0]	FRAME_Hcnt,
	output	reg		[10:0]	FRAME_Vcnt,
	output	reg		[15:0]	FRAME_DATA,
	output	reg				FRAME_DATA_EN,
	output	reg				FRAME_NEW_EN,
	output	reg				FRAME_HSYNC,
	output	reg				FRAME_VSYNC
	);
//////////////////////////////////////
	reg		MT9D111_HREF_j, MT9D111_VSYNC_j;
	always @(posedge MT9D111_PCLK)
	begin
		MT9D111_HREF_j <= MT9D111_HREF;
		MT9D111_VSYNC_j <= MT9D111_VSYNC;
	end
	wire	MT9D111_HREF_down = (MT9D111_HREF_j && !MT9D111_HREF);
	wire	MT9D111_VSYNC_down = (MT9D111_VSYNC_j && !MT9D111_VSYNC);
	// 行列计数
	// qVGA(240x320)
	// rgb565
	reg		HLsel;
	always @(posedge MT9D111_PCLK)
		if(!MT9D111_VSYNC)
		begin
			FRAME_Vcnt <= 0;
			FRAME_Hcnt <= 0;
			HLsel <= 0;
			FRAME_DATA_EN <= 0;
		end
		else if(MT9D111_HREF_down)
		begin
			FRAME_Vcnt <= FRAME_Vcnt + 1;
			FRAME_DATA_EN <= 0;
			FRAME_Hcnt <= 0;
			HLsel <= 0;
		end
		else if(MT9D111_HREF)
		begin
			HLsel <= ~HLsel;
			if(HLsel)
			begin
				FRAME_Hcnt <= FRAME_Hcnt + 1;
				FRAME_DATA[7:0] <= MT9D111_D;
				FRAME_DATA_EN <= 1;
			end
			else
			begin
				FRAME_DATA[15:8] <= MT9D111_D;
				FRAME_DATA_EN <= 0;
			end
		end
		else
			FRAME_DATA_EN <= 0;
			
	//
	always @(posedge MT9D111_PCLK)
		FRAME_NEW_EN <= MT9D111_VSYNC_down;
	
	//	打上一拍
	always @(posedge MT9D111_PCLK)
	begin
		FRAME_HSYNC <= MT9D111_HREF;
		FRAME_VSYNC <= MT9D111_VSYNC;
	end
///////////////////////////////////
endmodule
