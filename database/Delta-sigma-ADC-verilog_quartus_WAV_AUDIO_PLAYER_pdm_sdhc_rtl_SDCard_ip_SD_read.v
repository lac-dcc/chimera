/******************************************************************************
*	Name 		: 	Stream SD read 
*	Origin	:	171015
*					171017
*	Important:	SD_fifo 小于一半(<256)时,读SD CARD 512 Bytes（128字）到SD_fifo.
*					另一边，控制器根据IIS_fifo 写允许，将数据从SD_fifo搬到IIS_fifo
*	Interface:	N/A(SD_fifo)没有总线接口,也不建议添加接口.
*					如有必要添加总线接口,请增加初始化时序发生器,不建议使用SD_initial.v.
*	Author	:	Helrori2011@gmail.com
******************************************************************************/
module SD_read//
(
	input	SD_SCLK_REF,			//读SD 时钟 10Mhz
	input	rst_n,
	//Ctrl port 
	input			SD_Read_EN,//SD INIT_DONE==1 后在使能该模块;使能后如果fifo小于一半 则开始读SD卡到SD_fifo
	input			[31:0]Read_Sec_Addr,		//扇区地址 not use now
	input			[23:0]Read_Sec_Number,	//扇区个数 not use now
	//SD Card Interface
	input  		SD_MISO,
	output reg 	SD_CS		,
	output reg 	SD_MOSI	,	
	output   	SD_SCLK,	
	//Read data port
	input			FIFO_RD_CLK,
	input			FIFO_RD_EN,
	output   	[31:0]q,						//{L:R}
	output reg  FIFO_PREFETCHED,
	output reg	error,
	output reg [31:0]	WAV_FILE_LEN
);
assign	SD_SCLK=SD_SCLK_REF	;
reg [31:0]	_Read_Sec_Addr		;
//reg [1:0]	CTRL_STATE			;
reg [3:0]	MAIN_STATE			;
reg [47:0]	CMD					;
wire[47:0]	CMD17	= { 8'h51,	_Read_Sec_Addr,	8'hff};//读取单个数据块(SDHC 512bytes)
wire[47:0]	CMD18	= { 8'h52,	_Read_Sec_Addr,	8'hff};
wire[47:0]	CMD12	= { 8'h4c,	32'd0,	8'hff};
reg [15:0]	Time_Cnt				;
reg [5:0]	Send_Cnt				;
reg [5:0]	Recv_Cnt				;
reg [5:0]	Recv_Cnt_II			;//bit counter
reg [7:0]	Recv_Cnt_III		;//words counter
reg 			DAT_VALID_EN		;
reg 			DAT_valid			;
reg [39:0]	DAT					;//移位寄存器
reg [31:0]	DAT_32B				;//暂存32bit数据然后写入SD_fifo
wire[9:0]	wrusedw				;
reg [31:0]	data					;
//reg [31:0]	WAV_FILE_LEN		;//文件大小字节
reg 			wrreq					;
reg 			First_Frame			;
SD_fifo SD_fifo_U1(
	.data(data),
	.rdclk(FIFO_RD_CLK),
	.rdreq(FIFO_RD_EN),
	.wrclk(SD_SCLK_REF),
	.wrreq(wrreq),
	.q(q),
	.rdempty(),
	.wrusedw(wrusedw),
	.aclr(~rst_n)
);
/****************************************************************************
*	Generate DAT_valid signal
*
*	In SPI mode device always response with R1 or R7 and the MSB always zero.
*	This response always in 1(called R1) or 5(called R7) bytes.
*****************************************************************************/
always@(posedge SD_SCLK_REF or negedge rst_n)
begin
	if(!rst_n)begin
		DAT_VALID_EN	 	<= 0;
		DAT_valid			<= 0;
		Recv_Cnt				<= 6'd0;
	end
	else if(SD_MISO == 0 && DAT_VALID_EN == 0)
	begin
		DAT_VALID_EN 	<= 1;
		DAT_valid		<= 0;
		Recv_Cnt			<= 6'd0;
	end
	else if(DAT_VALID_EN == 1)
		if(Recv_Cnt < 8-1-1)
		begin
			Recv_Cnt			<= Recv_Cnt+6'd1;
			DAT_valid		<= 0;			
		end
		else
		begin
			Recv_Cnt			<= 6'd0;
			DAT_VALID_EN 	<= 0;
			DAT_valid		<= 1;
		end
	else 
	begin
		DAT_valid		<= 0;
		Recv_Cnt			<= 6'd0;
		DAT_VALID_EN 	<= 0;
	end
end
/****************************************************************************
*	接收前40个数据bit,返回R1(8bit)时取DAT[7:0],返回R7(8bit + 32bit)时取DAT[39:0]
*****************************************************************************/
always@(posedge SD_SCLK_REF)
begin
	DAT[0]		<=	SD_MISO;
	DAT[39:1]	<=	DAT[38:0];	
end
/********************************************************************
*	main state mechine
*	send CMD18 recv -> 0 
*********************************************************************/
always@(negedge SD_SCLK_REF or negedge rst_n)
begin
	if(!rst_n)
	begin
		MAIN_STATE 	<= 4'd0;
		Time_Cnt		<= 16'd0;
		Send_Cnt		<= 6'd0;
		error			<= 1'd0;
		Recv_Cnt_II <= 6'd0;
		Recv_Cnt_III<= 8'd0;
		wrreq			<= 1'd0;
		SD_MOSI		<= 1'd1;
		SD_CS			<= 1'd1;
		_Read_Sec_Addr <= Read_Sec_Addr;
		First_Frame <= 1'd0;
		FIFO_PREFETCHED<=1'd0;
	end
	else
	begin
		case(MAIN_STATE)
		4'd0://等待SD卡初始化完成 且 SD_fifo小于一半
			begin
				if(SD_Read_EN==1 && wrusedw < 1024-128-10)begin
					MAIN_STATE 	<= MAIN_STATE + 4'd1;
					CMD 			<= CMD17;//发送CMD需要3个状态,此处为第一个状态
				end
				else
					MAIN_STATE <= MAIN_STATE;	
				wrreq				<= 1'd0;//清零
			end
			4'd1://延时一段时间并初始化寄存器
			begin
				if(Time_Cnt >= 15)
				begin
					SD_CS 		<= 0;
					SD_MOSI 		<= CMD[47];
					CMD 			<= {CMD[46:0],1'd1};
					Time_Cnt		<= 16'd0;
					Send_Cnt		<= 6'd0;
					MAIN_STATE 	<= MAIN_STATE + 4'd1;
				end
				else
				begin
					Time_Cnt		<= Time_Cnt	+ 16'd1;
					SD_MOSI		<= 1'd1;
					SD_CS			<= 1'd1;
					MAIN_STATE 	<= MAIN_STATE;
				end			
			end
			4'd2://Send CMD17			
			begin
				if(Send_Cnt >= 6'd48 - 1'd1)
				begin
					Send_Cnt 	<= 6'd0;
					SD_MOSI 		<=	1;
					MAIN_STATE 	<= MAIN_STATE + 4'd1;
				end
				else 
				begin
					Send_Cnt 	<= Send_Cnt + 6'd1;
					SD_MOSI 		<= CMD[47];
					CMD 			<= {CMD[46:0],1'd1};
					MAIN_STATE 	<= MAIN_STATE;
				end							
			end
			4'd3://wait DAT_valid == 1;
			begin
				if(DAT_valid == 1&&DAT[7:0] == 8'h00)
				begin												//成功接收到0x00
					MAIN_STATE 	<= MAIN_STATE + 4'd1;
					SD_CS 		<= 0;
					Time_Cnt 	<=	16'd0;
				end
				else if(DAT_valid == 1&&DAT[7:0] != 8'h00)
				begin	
					SD_CS 		<= 1;
					MAIN_STATE 	<= 4'd15;							//未收到0x00回应  失败
					Time_Cnt 	<=	16'd0;
				end
				else if(Time_Cnt <= 127)
				begin
					SD_CS 	<= 0;
					SD_MOSI 	<=	1;
					Time_Cnt <= Time_Cnt + 16'd1;
				end
				else
				begin
					Time_Cnt 	<= 16'd0;
					MAIN_STATE 	<= 4'd15;							//回应超时		失败
					SD_CS    	<= 1;
				end
				
			end			
			4'd4://wait 0xfe
			begin
				if(DAT_VALID_EN==1)
					MAIN_STATE 	<= MAIN_STATE + 4'd1;
				else
					MAIN_STATE 	<= MAIN_STATE;
			end			
			4'd5://receive 32*128 bit and write to fifo 
			begin
				if(Recv_Cnt_II >= 32-1 )
				begin
					if(Recv_Cnt_III >= 128-1)
					begin
//						if(_Read_Sec_Addr < (WAV_FILE_LEN>>9)-1)begin
//							MAIN_STATE 		<=  MAIN_STATE + 4'd1;////
//							_Read_Sec_Addr <= _Read_Sec_Addr + 32'd1;end
//						else begin
//							MAIN_STATE 		<=  4'd0;////
//							_Read_Sec_Addr <=  Read_Sec_Addr;
//						end 
						_Read_Sec_Addr <= _Read_Sec_Addr + 32'd1;	
						MAIN_STATE 		<=  MAIN_STATE + 4'd1;////
						Recv_Cnt_III	<= 8'd0;										
						First_Frame		<= 1;
					end
					else 
					begin
						Recv_Cnt_III	<= Recv_Cnt_III + 8'd1;				
						MAIN_STATE 		<= MAIN_STATE ;
					end

					
					if(First_Frame==1||Recv_Cnt_III >=11)begin//避开WAV第一帧44字节描述符
					data				<= {DAT_32B[22:15],DAT_32B[30:23],DAT_32B[6:0],DAT[0],DAT_32B[14:7]};	//FAT32小端模式;16bit内部两个字节之间交换					
					wrreq				<= 1'd1;//必须在下一状态清零
					end
					else if(First_Frame==0&&Recv_Cnt_III==10)//如果是第一帧第11个字
					begin
						WAV_FILE_LEN 	<= {DAT_32B[6:0],DAT[0],DAT_32B[14:7],DAT_32B[22:15],DAT_32B[30:23]};//FAT32小端模式		
					end
					Recv_Cnt_II		<= 6'd0;
				end
				else 
				begin
					Recv_Cnt_II		<= Recv_Cnt_II + 6'd1;
					DAT_32B[0]		<=	DAT[0];
					DAT_32B[31:1]	<= DAT_32B[30:0];
					wrreq				<= 1'd0;//清零
					MAIN_STATE 		<= MAIN_STATE;	
				end
			end
			4'd6://wait 16bit CRC 
			begin
				wrreq					<= 1'd0;//清零
				FIFO_PREFETCHED   <= 1'd1;
				if(Recv_Cnt_III >= 16-1)
				begin
					Recv_Cnt_III 	<= 8'd0;
					MAIN_STATE 		<= 4'd0;
				end
				else
					Recv_Cnt_III	<= Recv_Cnt_III + 8'd1;
			end
			4'd15:
			begin
				error <= 1'd1;
			end			
		endcase
	end
end
endmodule
