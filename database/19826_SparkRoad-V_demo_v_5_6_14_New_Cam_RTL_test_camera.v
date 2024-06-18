// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns/ 1ps
// --------------------------------------------------------------------
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// --------------------------------------------------------------------
// 
// Author: Anlogic
// 
// Description:
//
//		dvp_ov2640,摄像头VGA显示
// 
// Web: www.anlogic.com
// --------------------------------------------------------------------
module test_camera

(
	input 	wire 		clk_24m,	//系统时钟
	input 	wire 		rst_n,		//复位
	//camera	
	input 	wire 		cam_pclk,	//像素时钟
	output 	wire 		cam_xclk,	//系统时钟
	input 	wire 		cam_href,	//行同
	input 	wire 		cam_vsync,	//帧同
	output 	wire 		cam_pwdn,	//模式
	output 	wire 		cam_rst,	//复位
	output 	wire 		cam_soic,	//SCCB
	inout 	wire 		cam_soid,	//SCCB
	input 	wire [7:0]	cam_data,	//摄像头数据
	//vga
	output 	wire [7:0] 	vga_r,      //VGA_R数据
	output 	wire [7:0] 	vga_g,		//VGA_G数据
	output 	wire [7:0] 	vga_b,		//VGA_B数据
	output 	wire 		vga_clk,	//VGA时钟
	output 	wire 		vga_hsync,	//VGA行同
	output 	wire 		vga_vsync	//VGA帧同

 );
 

 localparam IMG_W = 200;  //图片行像素点个数
 localparam IMG_H = 164;  //图片场像素点个数
 localparam IMG_X = 200;  //图像显示的开始位置
 localparam IMG_Y = 200;
 
//时钟	 
wire 		clk_lcd;   
wire 		clk_cam;
wire 		clk_sccb;
//摄像头连线
wire        camera_wrreq;
wire        camera_wclk;
wire [15:0] camera_wrdat;
wire [15:0] camera_addr;

reg 		init_state;
wire 		init_ready;
wire 		sda_oe;
wire 		sda;
wire 		sda_in;
wire 		scl;

//VGA 显示连线
wire 	[23:0] 	vga_data;
reg				vga_rden;
wire 	[15:0]	vga_rddat;	
reg  	[15:0]	vga_rdaddr;

assign cam_soid = (sda_oe == 1'b1) ? sda : 1'bz;
assign sda_in 	= cam_soid;
assign cam_soic = scl;
assign cam_pwdn = 1'b0;
assign cam_rst 	= rst_n;

//vga rgb565 模式转换 rgb888 
assign 	vga_data [23:0] = vga_rden ? {vga_rddat[15:11],3'h0,vga_rddat[10:5],2'h0,vga_rddat[4:0],3'h0} : 24'h0;
wire 	vga_den;

wire	[11:0]	lcd_xpos;
wire 	[11:0]	lcd_ypos;


ip_pll u_pll(
	.refclk(clk_24m),		//24M
	.reset(!rst_n),
	.clk0_out(clk_lcd),		//lcd clk
	.clk1_out(clk_cam),		//12m,for cam xclk
	.clk2_out(clk_sccb)		//4m,for sccb init
);

camera_init u_camera_init
(
	.clk(clk_sccb),
	.reset_n(rst_n),
	.ready(init_ready),
	.sda_oe(sda_oe),
	.sda(sda),
	.sda_in(sda_in),
	.scl(scl)
);
	

Driver u_cam_vga_out
(
	.clk(clk_lcd),			
	.rst_n(rst_n),     		//sync reset
	.lcd_data(vga_data),		//lcd data
	
	//lcd interface
	.lcd_dclk(vga_clk),   	//lcd pixel clock
	.lcd_hs(vga_hsync),	    	//lcd horizontal sync
	.lcd_vs(vga_vsync),	    	//lcd vertical sync
	.lcd_en(vga_den),			//lcd display enable
	.lcd_rgb({vga_r,vga_g,vga_b}),		//lcd display data

	//user interface
	.lcd_xpos(lcd_xpos),		//lcd horizontal coordinate
	.lcd_ypos(lcd_ypos)
);

camera_reader u_camera_reader
(
	.clk		(clk_cam		),
	.reset_n	(rst_n			),
	.csi_xclk	(cam_xclk		),
	.csi_pclk	(cam_pclk		),
	.csi_data	(cam_data		),
	.csi_vsync	(!cam_vsync		),
	.csi_hsync	(cam_href		),
	.data_out	(camera_wrdat	),
	.wrreq		(camera_wrreq	),
	.wrclk		(camera_wclk	),
	.wraddr		(camera_addr	)
);

img_cache u_img 
( 
	//write 45000*8
	.dia		(camera_wrdat	), 
	.addra		(camera_addr	), 
	.cea		(camera_wrreq	), 
	.clka		(camera_wclk	), 
	
	//read 22500*16
	.dob		(vga_rddat		), 
	.addrb		(vga_rdaddr		), 
	.ceb		(vga_rden		),
	.clkb		(clk_lcd		) 
	
);

always @(negedge clk_lcd)
begin
	if(!rst_n)
	begin
		vga_rden <= 1'b0;
		vga_rdaddr <= 16'd0; 
	end
	else 
	begin
	if (vga_den) 
			begin
			if(lcd_xpos >= IMG_X && lcd_xpos < (IMG_X + IMG_W) && lcd_ypos >= IMG_Y && lcd_ypos < (IMG_Y + IMG_H))
				begin
				vga_rden <= 1'b1;
				vga_rdaddr <= (lcd_xpos-IMG_X)+(lcd_ypos-IMG_Y)*IMG_W;
				end
			else
				begin
					vga_rden <= 1'b0;
					vga_rdaddr <= 16'd0; 
				end
			end
		else 
			begin
				vga_rden <= 1'b0;
				vga_rdaddr <= 16'd0;  
			end	
	end 
end



	
endmodule
