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
 

 localparam IMG_W = 800;  //图片行像素点个数
 localparam IMG_H = 600;  //图片场像素点个数
 localparam IMG_X = 0;  //图像显示的开始位置
 localparam IMG_Y = 0;
 
//时钟	 
wire 		clk_lcd;   
wire 		clk_cam;
wire 		clk_sccb;
wire 		clk_sdr_ctrl;
wire 		clk_sdram;
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
wire vga_data_req;


assign cam_soid = (sda_oe == 1'b1) ? sda : 1'bz;
assign sda_in 	= cam_soid;
assign cam_soic = scl;
assign cam_pwdn = 1'b0;
assign cam_rst 	= rst_n;

//vga rgb565 模式转换 rgb888 
assign 	vga_data [23:0] = vga_rden ? {vga_rddat[15:11],3'h0,vga_rddat[10:5],2'h0,vga_rddat[4:0],3'h0} : 24'h0;

wire 	vga_den;
//assign 	vga_data [23:0] = vga_den ? {vga_rddat[15:11],3'h0,vga_rddat[10:5],2'h0,vga_rddat[4:0],3'h0} : 24'h0;


wire	[11:0]	lcd_xpos;
wire 	[11:0]	lcd_ypos;


ip_pll u_pll(
	.refclk(clk_24m),		//24M
	.reset(!rst_n),
	.clk0_out(clk_sdr_ctrl),
	.clk1_out(clk_sdram),
	.clk2_out(clk_lcd),		//lcd clk
	.clk3_out(clk_cam),		//12m,for cam xclk
	.clk4_out(clk_sccb)		//4m,for sccb init
	
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


//VGA_CTRL vga_out(
//		.Clk40M(clk_lcd),					//系统输入时钟40MHZ
//		.Rst_n(rst_n),		//复位输入，低电平复位
//		.data_in(vga_data),				//待显示数据
//		.hcount(),							//TFT行扫描计数器
//		.vcount(),							//TFT场扫描计数器
//		.VGA_RGB({vga_r,vga_g,vga_b}),				//TFT数据输出
//		.VGA_HS(vga_hsync),					//TFT行同步信号
//		.VGA_VS(vga_vsync),					//TFT场同步信号
//		.VGA_BLANK(VGA_BL),
//		.VGA_VCLK(vga_clk),
//		.VGA_DE(vga_den)
//	);

camera_reader u_camera_reader
(
	.clk		(clk_cam		),
	.reset_n	(rst_n			),
	.csi_xclk	(cam_xclk		),
	.csi_pclk	(cam_pclk		),
	.csi_data	(cam_data		),
	.csi_vsync	(cam_vsync		),
	.csi_hsync	(cam_href		),
	.data_out	(camera_wrdat	),
	.wrreq		(camera_wrreq	),
	.wrclk		(camera_wclk	),
	.wraddr		(camera_addr	)
);


Sdram_Control_4Port Sdram_Control_4Port(
		//	HOST Side
		.CTRL_CLK(clk_sdr_ctrl),	//输入参考时钟，默认100M，如果为其他频率，请修改pll设置
		.SDRAM_CLK(clk_sdram),		//SDRAM时钟，默认100M(90°)，如果为其他频率，请修改pll设置
		.RESET_N(rst_n),			//复位输入，低电平复位

		//	FIFO Write Side 1
		.WR1_DATA(camera_wrdat),	//写入端口1的数据输入端16bit
		.WR1(camera_wrreq),		//写入端口1的写使能端，高电平写入
		.WR1_ADDR(21'b0),				//写入端口1的写起始地址
		.WR1_MAX_ADDR(800*600),		//写入端口1的写入最大地址
		.WR1_LENGTH(10'd256),			//一次性写入数据长度
		.WR1_LOAD((~rst_n) &(init_ready) ),
									//写入端口1清零请求，高电平清零写入地址和fifo
		.WR1_CLK(camera_wclk),		//写入端口1 fifo写入时钟
		.WR1_FULL(),				//写入端口1 fifo写满信号
		.WR1_USE(),					//写入端口1 fifo已经写入的数据长度
		//	FIFO Write Side 2
		.WR2_DATA(16'b0),			//写入端口2的数据输入端16bit
		.WR2(1'b0),					//写入端口2的写使能端，高电平写入
		.WR2_ADDR(21'b0),				//写入端口2的写起始地址
		.WR2_MAX_ADDR(200*200),		//写入端口2的写入最大地址
		.WR2_LENGTH(9'd0),				//一次性写入数据长度	
		.WR2_LOAD(1'b0),			//写入端口2清零请求，高电平清零写入地址和fifo
		.WR2_CLK(1'b0),				//写入端口2 fifo写入时钟
		.WR2_FULL(),				//写入端口2 fifo写满信号
		.WR2_USE(),					//写入端口2 fifo已经写入的数据长度
		//	FIFO Read Side 1
		.RD1_DATA(vga_rddat),		//读出端口1的数据输出端16bit
		.RD1(vga_den),			//读出端口1的读使能端，高电平读出
		.RD1_ADDR(21'b0),				//读出端口1的读起始地址
		.RD1_MAX_ADDR(800*600),		//读出端口1的读出最大地址
		.RD1_LENGTH(10'd256),			//一次性读出数据长度
		.RD1_LOAD((~rst_n) & (init_ready)),
									//读出端口1 清零请求，高电平清零读出地址和fifo
		.RD1_CLK(clk_lcd),			//读出端口1 fifo读取时钟
		.RD1_EMPTY(),				//读出端口1 fifo读空信号
		.RD1_USE(),					//读出端口1 fifo已经还可以读取的数据长度

		//	FIFO Read Side 2
		.RD2_DATA(),				//读出端口2的数据输出端16bit
		.RD2(1'b0),					//读出端口2的读使能端，高电平读出
		.RD2_ADDR(21'b0),				//读出端口2的读起始地址
		.RD2_MAX_ADDR(0),			//读出端口2的读出最大地址
		.RD2_LENGTH(9'd0),				//一次性读出数据长度	
		.RD2_LOAD(1'b0),			//读出端口2清零请求，高电平清零读出地址和fifo
		.RD2_CLK(1'b0),				//读出端口2 fifo读取时钟
		.RD2_EMPTY(),				//读出端口2 fifo读空信号
		.RD2_USE()					//读出端口2 fifo已经还可以读取的数据长度
	);	





//img_cache u_img 
//( 
//	//write 45000*8
//	.dia		(camera_wrdat	), 
//	.addra		(camera_addr	), 
//	.cea		(camera_wrreq	), 
//	.clka		(camera_wclk	), 
	
//	//read 22500*16
//	.dob		(vga_rddat		), 
//	.addrb		(vga_rdaddr		), 
//	.ceb		(vga_rden		),
//	.clkb		(clk_lcd		) 
	
//);

always @(negedge clk_lcd)
begin
	if(!rst_n)
	begin
		vga_rden <= 1'b0;
		//vga_rdaddr <= 16'd0; 
	end
	else 
	begin
	if (vga_den) 
			begin
			if(lcd_xpos >= IMG_X && lcd_xpos < (IMG_X + IMG_W) && lcd_ypos >= IMG_Y && lcd_ypos < (IMG_Y + IMG_H))
				begin
				vga_rden <= 1'b1;
				//vga_rdaddr <= (lcd_xpos-IMG_X)+(lcd_ypos-IMG_Y)*IMG_W;
				end
			else
				begin
					vga_rden <= 1'b0;
					//vga_rdaddr <= 16'd0; 
				end
			end
		else 
			begin
				vga_rden <= 1'b0;
				//vga_rdaddr <= 16'd0;  
			end	
	end 
end



	
endmodule
