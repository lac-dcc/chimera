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
	input 	wire [7:0]	cam_data,	//
	//vga
	output 	wire [7:0] 	vga_r,
	output 	wire [7:0] 	vga_g,
	output 	wire [7:0] 	vga_b,
	output 	wire 		vga_clk,
	output 	wire 		vga_hsync,
	output 	wire 		vga_vsync

 );
	 
wire 		clk_lcd;
wire 		clk_cam;
wire 		clk_sccb;

wire        camera_wrreq;
wire        camera_wclk;
wire [15:0] camera_wrdat;
wire [19:0] camera_addr;

reg 		init_state;
wire 		init_ready;
wire 		sda_oe;
wire 		sda;
wire 		sda_in;
wire 		scl;

//lcd display
wire [10:0] hsync_cnt;
wire [10:0] vsync_cnt;
wire 		vga_rden;
wire [15:0]	vga_rddat;	//lcd read
wire [15:0]	vga_rdaddr;

assign cam_soid = (sda_oe == 1'b1) ? sda : 1'bz;
assign sda_in 	= cam_soid;
assign cam_soic = scl;
assign cam_pwdn = 1'b0;
assign cam_rst 	= rst_n;

//vga rgb565 mode

assign vga_r[7:0] 	= vga_rden ? { vga_rddat[15:11] , vga_rddat[13:11] } : 8'h0;
assign vga_g[7:0] 	= vga_rden ? { vga_rddat[10:5] , vga_rddat[6:5] }  : 8'h0;
assign vga_b[7:0] 	= vga_rden ? { vga_rddat[4:0] , vga_rddat[2:0]}   : 8'h0;




wire vga_den;
wire vga_pwm;	//backlight,set to high
ip_pll u_pll(
	.refclk(clk_24m),		//24M
	.clk0_out(clk_lcd),		//25M,VGA clk
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
	
lcd_sync 
#(
	.IMG_W		(200		),
	.IMG_H		(164		),
	.IMG_X		(0			),
	.IMG_Y		(1			)
)
u_vga_sync
(
	.clk		(clk_lcd	),
	.rest_n		(rst_n		),
	.lcd_clk	(vga_clk	),
	.lcd_pwm	(vga_pwm	),
	.lcd_hsync	(vga_hsync	), 
	.lcd_vsync	(vga_vsync	), 
	.lcd_de		(vga_den	),
	.hsync_cnt	(hsync_cnt	),
	.vsync_cnt	(vsync_cnt	),
	.img_ack	(vga_rden	),
	.addr		(vga_rdaddr	)
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
	.addra		(camera_addr[15:0]	), 
	.cea		(camera_wrreq	), 
	.clka		(camera_wclk	), 
//	.rsta		(!rst_n			), 
	//read 22500*16
	.dob		(vga_rddat		), 
	.addrb		(vga_rdaddr		), 
	.ceb		(vga_rden		),
	.clkb		(clk_lcd		), 
	.rstb		(!rst_n			)
);
	
endmodule
