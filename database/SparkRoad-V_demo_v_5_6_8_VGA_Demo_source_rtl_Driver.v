`timescale 1ns/1ns
/* VGA参数配置表
************	clk		 	H_SYNC 		H_BACK 		H_DISP 		H_FRONT 	H_TOTAL 		V_SYNC 		V_BACK 		V_DISP 		V_FRONT 	V_TOTAL		*
640x480@60Hz	25.2MHz		96			48 			640 		16 			800 			2			33			480 		10			525		*
800x600@60Hz	40MHz		128			88 			800 		40 			1056			4			23			600 		1			628		*
1024x768@60Hz	65MHz		136			160 		1024 		24 			1344			6			29			768 		3			806		*
1280x720@60Hz	74.25MHz	40			220 		1280 		110			1650			5			20			720 		5			750		*
1280x1024@60Hz	108MHz		112			248 		1280 		48 			1688			3			38			1024		1			1066	*
1920x1080@60Hz	148.5MHz	44			148 		1920 		88 			2200			5			36			1080		4			1125	*
*/	
module Driver
#(
	parameter H_SYNC = 112	, 		// 行同步信号时间
	parameter H_BACK = 248	, 		// 行消隐后肩时间
	parameter H_DISP = 1280	, 		// 行数据有效时间
	parameter H_FRONT = 48	, 		// 行消隐前肩时间
	parameter H_TOTAL = 1688, 		// 行扫描总时间
			
	parameter V_SYNC = 3	, 		// 列同步信号时间
	parameter V_BACK = 38	, 		// 列消隐后肩时间
	parameter V_DISP = 1024	, 		// 列数据有效时间
	parameter V_FRONT = 1	, 		// 列消隐前肩时间
	parameter V_TOTAL = 1066  		// 列扫描总时间
)
(
	input  wire			clk,			//VGA clock
	input  wire			rst_n,     		//sync reset
	input  wire	[23:0]	lcd_data,		//lcd data
	
	//lcd interface
	output wire			lcd_dclk,   	//lcd pixel clock
	output wire			lcd_hs,	    	//lcd horizontal sync
	output wire			lcd_vs,	    	//lcd vertical sync
	output wire			lcd_en,			//lcd display enable
	output wire	[23:0]	lcd_rgb,		//lcd display data

	//user interface
	output wire	[11:0]	lcd_xpos,		//lcd horizontal coordinate
	output wire	[11:0]	lcd_ypos		//lcd vertical coordinate
);	
 
localparam	H_AHEAD = 	12'd1;

reg [11:0] hcnt; 
reg [11:0] vcnt;
wire lcd_request;

/*******************************************
		SYNC--BACK--DISP--FRONT
*******************************************/ 
//h_sync counter & generator
always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		hcnt <= 12'd0;
	else
	begin
        if(hcnt < H_TOTAL - 1'b1)		//line over			
            hcnt <= hcnt + 1'b1;
        else
            hcnt <= 12'd0;
	end
end 

assign	lcd_hs = (hcnt <= H_SYNC - 1'b1) ? 1'b0 : 1'b1; // line over flag

//v_sync counter & generator
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		vcnt <= 12'b0;
	else if(hcnt == H_TOTAL - 1'b1)	//line over
		begin
		if(vcnt == V_TOTAL - 1'b1)		//frame over
			vcnt <= 12'd0;
		else
			vcnt <= vcnt + 1'b1;
		end
end

assign	lcd_vs = (vcnt <= V_SYNC - 1'b1) ? 1'b0 : 1'b1; // frame over flag

// LED clock
assign	lcd_dclk = ~clk;

// Control Display
assign	lcd_en		=	(hcnt >= H_SYNC + H_BACK  && hcnt < H_SYNC + H_BACK + H_DISP) &&
						(vcnt >= V_SYNC + V_BACK  && vcnt < V_SYNC + V_BACK + V_DISP) 
						? 1'b1 : 1'b0;                   // Display Enable Signal
						
assign	lcd_rgb 	= 	lcd_en ? lcd_data : 24'h000000;	

//ahead x clock
assign	lcd_request	=	(hcnt >= H_SYNC + H_BACK - H_AHEAD && hcnt < H_SYNC + H_BACK + H_DISP - H_AHEAD) &&
						(vcnt >= V_SYNC + V_BACK && vcnt < V_SYNC + V_BACK + V_DISP) 
						? 1'b1 : 1'b0;
//lcd xpos & ypos
assign	lcd_xpos	= 	lcd_request ? (hcnt - (H_SYNC + H_BACK - H_AHEAD)) : 12'd0;
assign	lcd_ypos	= 	lcd_request ? (vcnt - (V_SYNC + V_BACK)) : 12'd0;

endmodule