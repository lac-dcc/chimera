module OV5640_SDRAM(
	clk_in,
	reset_n,
	
	//uart port
	tx,
	rx,
	
	//camera port
	cmos_sclk,
	cmos_sdat,
	cmos_vsync,
	cmos_href,
	cmos_pclk,
	cmos_xclk,
	cmos_data,
	cmos_rst_n,
	cmos_pwdn,	
	
	cmos_afv,
	cmos_afd,	
	
	//VGA port
	VGA_VCLK,			
	VGA_HS,
	VGA_VS,		
	VGA_R,
	VGA_G,
	VGA_B,
	VGA_DE,
	VGA_BL
);

	input		clk_in;
	input		reset_n;
	
	//uart interface
	output		tx;
	inout		rx;

	//cmos interface
	output			cmos_sclk;
	inout			cmos_sdat;
	input			cmos_vsync;
	input			cmos_href;
	input			cmos_pclk;
	output			cmos_xclk;
	input	[9:0]	cmos_data;
	output			cmos_rst_n;	
	output			cmos_pwdn;
	
	output 			cmos_afv;
	output			cmos_afd;			
	
	//vga port
	output			VGA_VCLK;		
	output			VGA_HS;		 
	output			VGA_VS;	
	output			VGA_DE;
	output	[7:0]	VGA_R;
	output	[7:0]	VGA_G;
	output	[7:0]	VGA_B;	
	output 			VGA_BL;
	//assign TFT_BL = 1;
	
	
	assign cmos_pwdn = 1'b0;
	assign cmos_rst_n = 1'b1;
//	assign cmos_afv = cmos_afv_r;
//	assign cmos_afd = cmos_afd_r;
	assign cmos_afv = 1'dz;
	assign cmos_afd = 1'dz;
	
	//clocks
	wire clk_sdr_ctrl;
	wire clk_sdram;
	wire clk_cmos;
	wire clk_i2c;
	
	wire clk_vga;
	wire vga_data_req;
	wire [15:0]vga_data_in;
	wire [15:0]vga_data_out;
	
	//uart drive lines
	wire [7:0]tx_data;
	reg tx_trigger;
	wire tx_ready;
	wire [7:0]rx_data;
	reg rx_trigger;
	wire rx_ready;
	reg [15:0]color_command;
	reg [15:0]color_display;

	//cmos video image capture
	wire			cmos_frame_vsync;	//cmos frame data vsync valid signal
	wire			cmos_frame_href;	//cmos frame data href vaild  signal
	wire	[15:0]	cmos_frame_data;	//cmos frame data output: {cmos_data[7:0]<<8, cmos_data[7:0]}	
	wire			cmos_frame_clken;	//cmos frame data output/capture enable clock
	wire	[7:0]	cmos_fps_rate;		//cmos image output rate
	
	wire  [15:0]Data_Integration_data;
	
	wire cmos_init_flag;
	
	wire VGA_Error;
	
	
	
	//pll
	sys_pll pll(
		.reset(~reset_n),
		.refclk(clk_in),
		.clk0_out(clk_sdr_ctrl),
		.clk1_out(clk_sdram),
		.clk2_out(clk_vga),
		.clk3_out(clk_cmos),
		.clk4_out(clk_i2c)
	);
	
	//uart module
	uart_driver uart_master (
		.clk_in(clk_in),
		.rst_n(reset_n),
		.tx_trigger(tx_trigger),
		.tx_ready(tx_ready),
		.tx_data(tx_data),
		.rx_trigger(rx_trigger),
		.rx_ready(rx_ready),
		.rx_data(rx_data),
		.tx(tx),
		.rx(rx)
	);
	
	//camera initialize
	wire	i2c_config_done;
	I2C_OV5640_Init_RGB565	u_I2C_OV5640_Init_RGB565
	(
		.clk			(clk_i2c),		//50MHz
		.rst_n			(reset_n),		//Global Reset
		.i2c_sclk		(cmos_sclk),	//I2C CLOCK
		.i2c_sdat		(cmos_sdat),	//I2C DATA
			
		.config_done	(cmos_init_flag)	//Config Done
	);
	
	//camera capture
	CMOS_Capture_RGB565	
	#(
		.CMOS_FRAME_WAITCNT		(4'd10)				//Wait n fps for steady(OmniVision need 10 Frame)
	)
	u_CMOS_Capture_RGB565
	(
		//global clock
		.clk_cmos				(clk_cmos),			//24MHz CMOS Driver clock input
		.rst_n					(reset_n & cmos_init_flag),	//global reset

		//CMOS Sensor Interface
		.cmos_pclk				(cmos_pclk),  		//24MHz CMOS Pixel clock input
		.cmos_xclk				(cmos_xclk),		//24MHz drive clock
		.cmos_din				(cmos_data[7:0]),	//8 bits cmos data input
		.cmos_vsync				(cmos_vsync),		//L: vaild, H: invalid
		.cmos_href				(cmos_href),		//H: vaild, L: invalid
		
		//CMOS SYNC Data output
		.cmos_frame_vsync		(cmos_frame_vsync),	//cmos frame data vsync valid signal
		.cmos_frame_href		(cmos_frame_href),	//cmos frame data href vaild  signal
		.cmos_frame_data		(cmos_frame_data),	//cmos frame RGB output: {{R[4:0],G[5:3]}, {G2:0}, B[4:0]}	
		.cmos_frame_clken		(cmos_frame_clken),	//cmos frame data output/capture enable clock
		
		//user interface
		.cmos_fps_rate			(cmos_fps_rate)		//cmos image output rate
	);
	
/*	
	Data_Integration Data_Integration(
		.clk(cmos_pclk),
		.rst_n(reset_n & cmos_init_flag),
		
		.data_in(cmos_frame_data),
		.data_out(Data_Integration_data)
	);
*/

	Sdram_Control_4Port Sdram_Control_4Port(
		//	HOST Side
		.CTRL_CLK(clk_sdr_ctrl),	//输入参考时钟，默认100M，如果为其他频率，请修改pll设置
		.SDRAM_CLK(clk_sdram),		//SDRAM时钟，默认100M(90°)，如果为其他频率，请修改pll设置
		.RESET_N(reset_n),			//复位输入，低电平复位

		//	FIFO Write Side 1
		.WR1_DATA(cmos_frame_data),	//写入端口1的数据输入端16bit
		.WR1(cmos_frame_clken),		//写入端口1的写使能端，高电平写入
		.WR1_ADDR(0),				//写入端口1的写起始地址
		.WR1_MAX_ADDR(800*600),		//写入端口1的写入最大地址
		.WR1_LENGTH(256),			//一次性写入数据长度
		.WR1_LOAD((~reset_n) &(~cmos_init_flag) ),
									//写入端口1清零请求，高电平清零写入地址和fifo
		.WR1_CLK(cmos_pclk),		//写入端口1 fifo写入时钟
		.WR1_FULL(),				//写入端口1 fifo写满信号
		.WR1_USE(),					//写入端口1 fifo已经写入的数据长度
		//	FIFO Write Side 2
		.WR2_DATA(15'b0),			//写入端口2的数据输入端16bit
		.WR2(1'b0),					//写入端口2的写使能端，高电平写入
		.WR2_ADDR(0),				//写入端口2的写起始地址
		.WR2_MAX_ADDR(800*600),		//写入端口2的写入最大地址
		.WR2_LENGTH(0),				//一次性写入数据长度	
		.WR2_LOAD(1'b0),			//写入端口2清零请求，高电平清零写入地址和fifo
		.WR2_CLK(1'b0),				//写入端口2 fifo写入时钟
		.WR2_FULL(),				//写入端口2 fifo写满信号
		.WR2_USE(),					//写入端口2 fifo已经写入的数据长度
		//	FIFO Read Side 1
		.RD1_DATA(vga_data_in),		//读出端口1的数据输出端16bit
		.RD1(vga_data_req),			//读出端口1的读使能端，高电平读出
		.RD1_ADDR(0),				//读出端口1的读起始地址
		.RD1_MAX_ADDR(800*600),		//读出端口1的读出最大地址
		.RD1_LENGTH(256),			//一次性读出数据长度
		.RD1_LOAD((~reset_n) & (~cmos_init_flag)),
									//读出端口1 清零请求，高电平清零读出地址和fifo
		.RD1_CLK(clk_vga),			//读出端口1 fifo读取时钟
		.RD1_EMPTY(),				//读出端口1 fifo读空信号
		.RD1_USE(),					//读出端口1 fifo已经还可以读取的数据长度

		//	FIFO Read Side 2
		.RD2_DATA(),				//读出端口2的数据输出端16bit
		.RD2(1'b0),					//读出端口2的读使能端，高电平读出
		.RD2_ADDR(0),				//读出端口2的读起始地址
		.RD2_MAX_ADDR(0),			//读出端口2的读出最大地址
		.RD2_LENGTH(0),				//一次性读出数据长度	
		.RD2_LOAD(1'b0),			//读出端口2清零请求，高电平清零读出地址和fifo
		.RD2_CLK(1'b0),				//读出端口2 fifo读取时钟
		.RD2_EMPTY(),				//读出端口2 fifo读空信号
		.RD2_USE()					//读出端口2 fifo已经还可以读取的数据长度
	);	
	
	Driver vga_out(
		.clk(clk_vga),					//系统输入时钟
		.rst_n(reset_n),		//复位输入，低电平复位
		.lcd_data(vga_data_in),				//待显示数据
		.lcd_xpos(),							//TFT行扫描计数器
		.lcd_ypos(),							//TFT场扫描计数器
		.lcd_rgb(vga_data_out),				//TFT数据输出
		.lcd_hs(VGA_HS),					//TFT行同步信号
		.lcd_vs(VGA_VS),					//TFT场同步信号
		.lcd_en(VGA_DE),
		.lcd_dclk(VGA_VCLK)
		
	);
	assign vga_data_req = VGA_DE;
	
	assign VGA_R = {vga_data_out[15:11],3'b0};
	assign VGA_G = {vga_data_out[10: 5],2'b0};
	assign VGA_B = {vga_data_out[ 4: 0],3'b0};
	/*
	assign VGA_R = {vga_data_out[7:3],3'b0};
	assign VGA_G = {vga_data_out[7:3],3'b0};
	assign VGA_B = {vga_data_out[7:3],3'b0};
	*/
	
	/*
	//test logic
	always @(posedge clk_in) begin
		
		if ( rx_ready ) begin
			rx_trigger <= 1'b1;
			color_command <= {rx_data[7:5],2'b0,rx_data[4:2],3'b0,rx_data[1:0],3'b0};
		end else begin
			rx_trigger <= 1'b0;
		end
		
		if ( color_display == 16'b1111100000000000 )		//R->G
			color_display <= 16'b0000011111100000;
		else if ( color_display == 16'b0000011111100000 )	//G->B
			color_display <= 16'b0000000000011111;
		else if ( color_display == 16'b0000000000011111 )	//B->W
			color_display <= color_command;
		else												//W->R
			color_display <= 16'b1111100000000000;
		
	end
	*/
	
endmodule
