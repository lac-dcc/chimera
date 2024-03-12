/**************************************************************************************************
*	Name 		:wav player
*	Origin	:171015
*				 171017
*				 171020
*	Important:通过SDHC CARD,WM8731播放WAV文件.Only 48k 16bit * 2 WAV file 
*				 给出FAT文件系统下wav文件扇区地址,硬件会不停的播放,不会停止.
*				 硬件使用SDHC 8G CARD ;AUDIO CODEC WM8731.				 
*	Author 	:Helrori2011@gmail.com
***************************************************************************************************/
module	WAV_PLAYER
(
	input				_clk_50m,
	input				_rst_n,	
	//WM8731 IIC port 
	output			IIC_SDA,
	output			IIC_SCL,
	//WM8731 IIS port (wm8731 is master)
	input				IIS_BCLK,
	input				IIS_DACLRC,
	input				IIS_ADCLRC,				//not use
	input				IIS_ADCDAT,				//not use
	output			IIS_DACDAT,
	//PDM_audio
	output			pdm_l,
	output			pdm_r,
	//SDCard SPI port 
	input  			SD_MISO,
	output 	 		SD_CS,
	output 	 		SD_MOSI,	
	output   		SD_SCLK	,
	
	output			reg Sample_clk,
	output			[31:0]WAV_FILE_LEN
);
wire rst_n,clk_50m,clk_10m;
reg [15:0]Cnt;
reg [15:0]Cnt2;
reg SD_SCLK_REF;//100k

wire SD_INIT_DONE;
reg  _SD_MISO,	__SD_MISO;
wire _SD_CS,	__SD_CS;
wire _SD_MOSI,	__SD_MOSI;
wire _SD_SCLK,	__SD_SCLK;

wire E;
wire [31:0]Data_In;
wire clk_pdm;
/************************************************************
*	System pll
*************************************************************/
pll pll_U1
(
	.areset(~_rst_n),
	.inclk0(_clk_50m),
	.c0(clk_50m),
	.c1(clk_10m),
	.c2(clk_pdm),
	.locked(rst_n)
);
/************************************************************
*	Init WM8731 as master and in dsp mode
*************************************************************/
SCCB_top SCCB_top_U1
(
	.init_ov(),					//上升沿或下降沿触发一次初始化
	.clk(clk_50m),				//50Mhz
	.rst_n(rst_n),				//触发一次初始化
	
	.SCL(IIC_SCL),
	.SDA(IIC_SDA),
	.OV2640_PWDN(),
	.OV2640_RST(),
	
	.init_ov_done()
);
/************************************************************
*	Init SDHC card as SPI mode and read SDHC
*	当初始化完成后SD_XXX 口全部由SD_read模块管理
*************************************************************/
always@(posedge clk_50m or negedge rst_n)
begin
	if(!rst_n)begin
		SD_SCLK_REF <= 1'd1;;
		Cnt <= 16'd0;
	end
	else if(Cnt >= 500/2-1)/////////////
	begin
		Cnt <= 16'd0;
		SD_SCLK_REF <= ~SD_SCLK_REF;
	end
	else
		Cnt <= Cnt + 16'd1;
end
always@(posedge clk_50m or negedge rst_n)
begin
	if(!rst_n)begin
		Sample_clk <= 1'd1;;
		Cnt2 <= 16'd0;
	end
	else if(Cnt2 >= 500/2-1)/////////////
	begin
		Cnt2 <= 16'd0;
		Sample_clk <= ~Sample_clk;
	end
	else
		Cnt2 <= Cnt2 + 16'd1;
end
SD_initial SD_initial_U1
(
	.rst_n(rst_n),					//触发一次初始化
	.SD_SCLK_REF(SD_SCLK_REF),	//100KHZ
	//SD Card Interface
	.SD_MISO	(_SD_MISO),
	.SD_CS	(_SD_CS	),
	.SD_MOSI	(_SD_MOSI),	
	.SD_SCLK	(_SD_SCLK),
	//调试接口
	.DAT(),
	.INIT_DONE(SD_INIT_DONE),
	.STATE(),
	.DAT_valid()
);
always@(*)
	if(SD_INIT_DONE)
		__SD_MISO = SD_MISO	;
	else
		_SD_MISO = SD_MISO	;
assign SD_CS 	= (SD_INIT_DONE==1)?__SD_CS	:_SD_CS		;
assign SD_MOSI = (SD_INIT_DONE==1)?__SD_MOSI	:_SD_MOSI	;
assign SD_SCLK = (SD_INIT_DONE==1)?__SD_SCLK	:_SD_SCLK	;
wire rdaccess;


localparam DIV = 256;
reg [$clog2(DIV)-1:0]cnt='b0;
always@(posedge clk_pdm)begin
	cnt <= cnt + 1'd1;
end
SD_read SD_read_U1
(
	.SD_SCLK_REF(clk_10m),		//读SD 时钟 10Mhz
	.rst_n(rst_n),
	//Ctrl port 
	.SD_Read_EN(SD_INIT_DONE),	//SD INIT_DONE==1 后在使能该模块;使能后如果fifo小于一半 则开始读SD卡到SD_fifo
	.Read_Sec_Addr(32'd107576),	//wav文件扇区地址
	.Read_Sec_Number(),			//扇区个数 not use
	//SD Card Interface
	.SD_MISO(__SD_MISO),
	.SD_CS(__SD_CS),
	.SD_MOSI(__SD_MOSI),	
	.SD_SCLK(__SD_SCLK),	
	//Read data port
	.FIFO_RD_CLK(cnt[$clog2(DIV)-1]),
	.FIFO_RD_EN(E),
	.q(Data_In),//{L:R}
	.FIFO_PREFETCHED(rdaccess),
	
	.error(),
	.WAV_FILE_LEN(WAV_FILE_LEN)
);
/************************************************************
*	
*************************************************************/

pdm_audio
(
    .clk     ( clk_pdm),//1536Khz
    .rst_n   ( rst_n   ),

    .rdaccess( rdaccess),
    .rdclk   ( cnt[$clog2(DIV)-1] ),//1536Khz/32=48Khz
    .rden    ( E       ),
    .rddat   ( Data_In ),

    .pdm_r   ( pdm_r ),    
    .pdm_l   ( pdm_l )   

);

endmodule
