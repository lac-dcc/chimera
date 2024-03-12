/****************************************************************************
*	Name			:	SDv2 Card initial
*	Origin		:	171012
*	Important	:	初始化SDHC卡为SPI模式.
*	Interface	:	没有总线接口,也不建议添加接口.
*	Author		:	Helrori
*****************************************************************************/
module SD_initial(
						
	input 		rst_n,
	input 		SD_SCLK_REF,//100KHZ
	//SD Card Interface
	input  		SD_MISO,
	output reg 	SD_CS,
	output reg 	SD_MOSI,	
	output   	SD_SCLK,
	
	output reg  [39:0]DAT,
	output reg	INIT_DONE,
	output reg [7:0]STATE,
	output reg 	DAT_valid
);
reg [47:0]	CMD;
reg [31:0]	Time_Cnt;
reg [5:0]	Recv_Cnt;
reg [5:0]	Send_Cnt;
reg [5:0]	Recv_Dat_Len;
reg 			SD_SCLK_OUTPUT_EN;
reg 			DAT_VALID_EN;
assign	SD_SCLK = (SD_SCLK_OUTPUT_EN)?SD_SCLK_REF:1;
parameter CMD0 	= { 8'h40,	32'd0,	8'h95 						};
parameter CMD8 	= { 8'h48, 	16'd0, 	8'h01, 	8'haa, 	8'h87	};
parameter CMD55 	= { 8'h77,	32'd0,	8'hff 						};
parameter ACMD41 	= { 8'h69, 	8'h40, 	24'd0,	8'hff 			};
parameter CMD58 	= { 8'h7A, 	32'd0, 	8'h01 						};
parameter CMD17	= { 8'h51,	8'h00,	8'h00,	8'h00,	8'h00,	8'hff};//
/****************************************************************************
*	Generate DAT_valid signal
*
*	In SPI mode device always response with R1 or R7 and the MSB always zero.
*	This response always in 1(called R1) or 5(called R7) bytes.
*****************************************************************************/
always@(posedge SD_SCLK_REF or negedge rst_n)
begin
	if(!rst_n)begin
		DAT_VALID_EN <= 0;
		DAT_valid		<= 0;
		Recv_Cnt		<= 6'd0;
	end
	else if(SD_MISO == 0 && DAT_VALID_EN == 0)
	begin
		DAT_VALID_EN <= 1;
		DAT_valid		<= 0;
		Recv_Cnt		<= 6'd0;
	end
	else if(DAT_VALID_EN == 1)
		if(Recv_Cnt < Recv_Dat_Len-1-1)//////////////////Recv_Dat_Len bit后DAT_valid置1
		begin
			Recv_Cnt		<= Recv_Cnt+6'd1;
			DAT_valid		<= 0;			
		end
		else
		begin
			Recv_Cnt		<= 6'd0;
			DAT_VALID_EN <= 0;
			DAT_valid		<= 1;
		end
	else 
	begin
		DAT_valid		<= 0;
		Recv_Cnt		<= 6'd0;
		DAT_VALID_EN <= 0;
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
/****************************************************************************
*	Main STATE mechine
*		Send CDM0		return R1==8'h01 ?
*		Send CMD8 		return R7 CHECK R1==8'h01 ?
*		Send CMD55 		return R1==8'h01 ?
*		Send ACMD41		return R1==8'h00 ?
*		Send CMD58		return R3 == R1+OCR[31:0]
*****************************************************************************/
initial//初始化所有寄存器
begin
		SD_CS 	<= 1;
		SD_MOSI	<=	1;
		CMD 		<= CMD0;
		Time_Cnt <= 32'd0;
		SD_SCLK_OUTPUT_EN <= 0;
		Send_Cnt <= 6'd0;
		INIT_DONE <= 0;
		STATE		<= 8'd0;
end
always@(negedge SD_SCLK_REF or negedge rst_n)
begin
	if(!rst_n)
	begin
				SD_CS 	<= 1;
				SD_MOSI	<=	1;
				CMD 		<= CMD0;
				Time_Cnt <= 32'd0;
				SD_SCLK_OUTPUT_EN <= 0;
				Send_Cnt <= 6'd0;
				INIT_DONE <= 0;
				STATE		<= 8'd0;
	end
	else
	case(STATE)
		0://初始化所有寄存器
			begin
				SD_CS 	<= 1;
				SD_MOSI	<=	1;
				CMD 		<= CMD0;
				Time_Cnt <= 32'd0;
				SD_SCLK_OUTPUT_EN <= 0;
				Send_Cnt <= 6'd0;
				INIT_DONE <= 0;
				STATE		<= STATE + 8'd1;
			end
		1://delay 1ms without SD_SCLK
			begin
				if(Time_Cnt == 100-1)/////////////////
					begin
						Time_Cnt <= 32'd0;
						SD_SCLK_OUTPUT_EN <= 1;
						STATE		<= STATE + 8'd1;
					end
				else
					Time_Cnt <= Time_Cnt +32'd1;
			end
		2://send 100 SD_SCLK
			begin
				if(Time_Cnt == 100-1)
					begin
						Time_Cnt <= 32'd0;
						STATE		<= STATE + 8'd1;
					end
				else
					Time_Cnt <= Time_Cnt +32'd1;
			end
		3://选中SD卡准备好SD_MOSI数据，接收长度设置为8bit
			begin
				SD_CS <= 0;STATE	<= STATE + 8'd1;SD_MOSI <= CMD[47];CMD <= {CMD[46:0],1'd1};Send_Cnt <= 6'd0;Recv_Dat_Len <= 8;////////!!!!!!!!
			end
/*重复段*/
		4://Send CMD0{ 8'h40,32'd0,8'h95 } return R1==8'h01
			begin
				if(Send_Cnt >= 6'd48 - 1'd1)
				begin
					Send_Cnt <= 6'd0;
					SD_MOSI 	<=	1;
					STATE 	<= STATE + 8'd1;
				end
				else 
				begin
					Send_Cnt <= Send_Cnt + 6'd1;
					SD_MOSI 	<= CMD[47];
					CMD 		<= {CMD[46:0],1'd1};
					STATE 	<= STATE;
				end			
			end
//		255:
//		begin
//			if(Time_Cnt <= 7-1)
//				Time_Cnt <= Time_Cnt + 32'd1;
//			else
//			begin
//				Time_Cnt <= 32'd0;
//				STATE 	<= 8'd5;
//			end
//		end
		5://wait DAT_valid==1
			begin
				if(DAT_valid == 1&&DAT[7:0] == 8'h01)
				begin												//成功接收到0x01
					STATE 	<= STATE + 8'd1;
					SD_CS 	<= 1;
					Time_Cnt <=	32'd0;
				end
				else if(DAT_valid == 1&&DAT[7:0] != 8'h01)
				begin	
//					CMD		<= { 8'h40,32'd0,8'h95 };
					SD_CS 	<= 1;
					STATE 	<= 8'd0;							//从头开始
					Time_Cnt <=	32'd0;
				end
				else if(Time_Cnt <= 127)
				begin
					SD_CS 	<= 0;
					SD_MOSI 	<=	1;
					Time_Cnt <= Time_Cnt + 32'd1;
				end
				else
				begin
					Time_Cnt <= 32'd0;
					STATE 	<= 8'd2;//回应超时
					CMD 		<= CMD0;
					SD_CS    <= 1;
				end
			end
		6://SD_CS拉高后给256个时钟
			begin
				if(Time_Cnt == 256-1)
				begin
					Time_Cnt <= 32'd0;
					CMD 		<= CMD8;
					STATE 	<= STATE + 8'd1;
				end
				else
					Time_Cnt <= Time_Cnt + 32'd1;
			end
		  ////////Send CMD0 OVER!//////////
		7://选中SD卡准备好SD_MOSI数据，接收长度设置为40bit
			begin
				SD_CS <= 0;STATE	<= STATE + 8'd1;SD_MOSI <= CMD[47];CMD <= {CMD[46:0],1'd1};Send_Cnt <= 6'd0;Recv_Dat_Len <= 40;////////!!!!!!!!
			end
/*重复段*/	
		8:
/**********************************************************************************************************************************
  Send CMD8{ 8'h48, 16'd0, 8'h01, 8'haa, 8'h87 } return {8'h R1,32'h CMD8 Argument}==R7==DAT[39:0]
  
  The lower 12 bits in the return value 0x1AA means that the 
  card is SDC version 2 and it can work at voltage range of 2.7 to 3.6 volts. 
  If not the case, the card should be rejected.
***********************************************************************************************************************************/
			begin
				if(Send_Cnt >= 6'd48 - 1'd1)
				begin
					Send_Cnt <= 6'd0;
					SD_MOSI 	<=	1;
					STATE 	<= STATE + 8'd1;
				end
				else
				begin
					Send_Cnt <= Send_Cnt + 6'd1;
					SD_MOSI 	<= CMD[47];
					CMD 		<= {CMD[46:0],1'd1};
					STATE 	<= STATE;
				end			
				
			end
		9://wait DAT_valid==1;check if DAT[39:0]=={8'h01,16'h00,8'h01,8'haa}=={8'h R1,32'h CMD Argument}==R7
			begin
				if(DAT_valid == 1&&DAT[39:0]=={8'h01,16'h00,8'h01,8'haa})
				begin
					STATE 	<= STATE + 8'd1;
					SD_CS 	<= 0;
					Time_Cnt <=	32'd0;
				end
				else if(DAT_valid == 1&&DAT[39:0]!={8'h01,16'h00,8'h01,8'haa})
				begin											//fail	SDV1 CARD!!
//					CMD		<= { 8'h40,32'd0,8'h95 };
					SD_CS 	<= 1;
					STATE 	<= 8'd22;
					Time_Cnt <=	32'd0;					
				end
				else if(Time_Cnt <= 127)
				begin 
					SD_CS 	<= 0;
					SD_MOSI 	<=	1;
					Time_Cnt <=	Time_Cnt + 32'd1;
				end
				else
				begin
					Time_Cnt <=	32'd0;
					STATE 	<= 8'd2;//回应超时
					CMD 		<= CMD0;SD_CS    <= 1;
				end
			end
		10://给8个时钟
			begin
				if(Time_Cnt == 8-1)
				begin
					Time_Cnt <= 32'd0;
					CMD 		<= CMD55;
					STATE 	<= STATE + 8'd1;
				end
				else
					Time_Cnt <= Time_Cnt + 32'd1;
			end
			////////Send CMD8 OVER!////////
		11://选中SD卡准备好SD_MOSI数据，接收长度设置为8bit
			begin
				SD_CS <= 0;STATE	<= STATE + 8'd1;SD_MOSI <= CMD[47];CMD <= {CMD[46:0],1'd1};Send_Cnt <= 6'd0;Recv_Dat_Len <= 6'd8;////////!!!!!!!!				
			end
/*重复段*/
		12://Send  CMD55
			begin
				if(Send_Cnt >= 6'd48 - 1'd1)
				begin
					Send_Cnt <= 6'd0;
					SD_MOSI 	<=	1;
					STATE 	<= STATE + 8'd1;
				end
				else
				begin
					Send_Cnt <= Send_Cnt + 6'd1;
					SD_MOSI 	<= CMD[47];
					CMD 		<= {CMD[46:0],1'd1};
					STATE 	<= STATE;
				end			
				
			end
		13://CHECK CMD55
			begin
				
				if(DAT_valid == 1&&DAT[7:0]==8'h01)
				begin
					STATE 	<= STATE + 8'd1;
					SD_CS 	<= 0;
					CMD		<= ACMD41;
					
				end
				else if(DAT_valid == 1&&DAT[7:0]!=8'h01)
				begin//fail	
//					CMD		<= { 8'h40,32'd0,8'h95 };
					SD_CS 	<= 1;
					STATE 	<= 8'd0;//从头开始
				end
				else
				begin
					SD_CS 	<= 0;
					SD_MOSI 	<=	1;
				end				
				
			end
		14://Send ACMD41{ 8'h69, 8'h40, 24'd0,8'hff }
			begin
					SD_CS <= 0;STATE	<= STATE + 8'd1;SD_MOSI <= CMD[47];CMD <= {CMD[46:0],1'd1};Send_Cnt <= 6'd0;Recv_Dat_Len <= 40;////////!!!!!!!!
			end
		15://Send ACMD41{ 8'h69, 8'h40, 24'd0,8'hff }
			begin
				if(Send_Cnt >= 6'd48 - 1'd1)
				begin
					Send_Cnt <= 6'd0;
					SD_MOSI 	<=	1;
					STATE 	<=  8'd254;
				end
				else
				begin
					Send_Cnt <= Send_Cnt + 6'd1;
					SD_MOSI 	<= CMD[47];
					CMD 		<= {CMD[46:0],1'd1};
					STATE 	<= STATE;
				end			
					
			end
		254:
		begin
			if(Time_Cnt <= 6 -1)
				Time_Cnt <= Time_Cnt + 32'd1;
			else
			begin
				Time_Cnt <= 32'd0;
				STATE 	<= 8'd16;
			end
		end
		16://check ACMD41
			begin
				if(DAT_valid == 1&&DAT[39:32]==8'h00)
				begin//    初始化完成
					STATE 	<= STATE + 8'd1;
					SD_CS 	<= 1;
//					CMD		<= CMD58;
				end
				else if(DAT_valid == 1&&DAT[39:32]!=8'h00)
				begin//查询ACMD41 未完成初始化
//					CMD		<= { 8'h77,32'd0,8'hff };//准备好CMD55
					SD_CS 	<= 1;
					STATE 	<= 8'd6;//重新发送CMD8
				end
				else
				begin
					SD_CS 	<= 0;
					SD_MOSI 	<=	1;
				end				
				
			end
		17://16->18
		begin
			STATE 	<= STATE + 8'd1;
		end 
		18:
		begin	
				if(Time_Cnt == 280-1)
				begin
					Time_Cnt <= 32'd0;
					CMD 		<= CMD58;//准备好CMD58
					STATE 	<= STATE + 8'd1;
				end
				else
					Time_Cnt <= Time_Cnt + 32'd1;			
		end
		19:
			begin
				SD_CS <= 0;STATE	<= STATE + 8'd1;Send_Cnt <= 6'd0;SD_MOSI <= CMD[47];CMD <= {CMD[46:0],1'd1};Recv_Dat_Len <= 40;////////!!!!!!!!				
			end 	
		20:
			begin
				if(Send_Cnt >= 6'd48 - 1'd1)
				begin
					Send_Cnt <= 6'd0;
					SD_MOSI 	<=	1;
					STATE 	<=  STATE + 8'd1;
				end
				else
				begin
					Send_Cnt <= Send_Cnt + 6'd1;
					SD_MOSI 	<= CMD[47];
					CMD 		<= {CMD[46:0],1'd1};
					STATE 	<= STATE;
				end			
			
			end 	
		21:
			begin
				if(DAT_valid == 1&&DAT[39:24]==16'h00C0)//SDHC CARD
				begin//    
					STATE 	<= STATE + 8'd2;
					SD_CS 	<= 1;
//					CMD		<= { 8'h7A, 32'd0, 8'h01 };//准备好CMD58
				end
				else if(DAT_valid == 1&&DAT[39:24]!=16'h00C0)//NOT SDHC CARD
				begin//
//					CMD		<= { 8'h77,32'd0,8'hff };//准备好CMD55
					SD_CS 	<= 0;
					STATE 	<= STATE + 8'd1;//
				end
				else
				begin
					SD_CS 	<= 0;
					SD_MOSI 	<=	1;
				end				
				
			end
		22:
			begin
				//SDV1 CARD(INIT_DONE==0) OR NOT SDHC CARD   ,FAIL
			end
		23 :
			begin
				INIT_DONE <= 1;//SDHC CARD init done
			end
	endcase
end	
endmodule

//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Module Name:    SD_initial 
////////////////////////////////////////////////////////////////////////////////////
//module SD_initial(
//						
//						input rst_n,
//						input SD_SCLK_REF,
//						output reg SD_CS,
//						output reg SD_MOSI,
//						input  SD_MISO,
//						output reg  [47:0]DAT,
//						output INIT_DONE,
//						output reg [3:0] STATE,
//						output reg DAT_valid
//
//);
//assign INIT_DONE=init;
//
//reg [7:0] CMD;
//
//reg [47:0] CMD8;
//
//reg [47:0] CMD55={8'h77,8'h00,8'h00,8'h00,8'h00,8'hff};
//reg [47:0] ACMD41={8'h69,8'h40,8'h00,8'h00,8'h00,8'hff};
//
//
//reg init;
//
//reg [9:0] counter=10'd0;
//reg reset=1'b1;
//reg [5:0] i;
//
//
//parameter idle				=4'd0;
//parameter load_cmd40		=4'd1;
//parameter send_40			=4'd2;
//parameter send_00			=4'd3;
//parameter send_95			=4'd4;
//parameter wait_01			=4'd5;
//parameter send_cmd48		=4'd6;
//parameter send_00a		=4'd7;
//parameter waita			=4'd8;
//parameter init_done		=4'd9;
//parameter init_fail		=4'd10;
//
//parameter waitb			=4'd11;
//parameter send_cmd55		=4'd12;
//parameter send_ACMD41	=4'd13;
//reg [9:0] cnt;
//
//reg [5:0]aa;
////reg DAT_valid;
//reg en;
//
////接收SD卡的数据
//always @(posedge SD_SCLK_REF)
//begin
//	DAT[0]<=SD_MISO;
//	DAT[47:1]<=DAT[46:0];
//end
//
////产生DAT_valid信号
//always @(posedge SD_SCLK_REF)
//begin
//	if(!SD_MISO&&!en) begin //等待SD_MISO为低,SD_MISO为低,开始接收数据
//	  DAT_valid<=1'b0; 
//	  aa<=1;
//	  en<=1'b1;
//	end   
//   else if(en)	begin 
//		if(aa<47) begin
//			aa<=aa+1'b1;  
//			DAT_valid<=1'b0;
//		end
//		else	begin
//			aa<=0;
//			en<=1'b0;
//			DAT_valid<=1'b1;       //接收完第48bit后,DAT_valid信号开始有效
//		end
//	end
//	else begin 
//	   en<=1'b0;
//		aa<=0;
//		DAT_valid<=1'b0;
//	end
//end
//
////上电后延时计数，释放reset信号
//always @(negedge SD_SCLK_REF)
//begin
//	if(counter<10'd1023) begin 
//	   counter<=counter+1'b1;
//		reset<=1'b1;
//	end
//	else begin 	
//	   reset<=1'b0;
//	end
//end
//
////SD卡初始化程序
//always @(negedge SD_SCLK_REF)
//begin
//	if(reset | ~rst_n) begin
//	  if(counter<512)  begin
//		  SD_CS<=1'b0;         //片选CS低电平选中SD卡
//		  SD_MOSI<=1'b1;
//		  init<=1'b0;
//	  end
//	  else begin
//		  SD_CS<=1'b1;          //片选CS高电平释放SD卡
//		  SD_MOSI<=1'b1;
//		  init<=1'b0;
//	  end
//	end
//	else	begin
//			case(STATE)
//			   idle:	begin							//	0
//					init<=1'b0;
//					CMD<=8'h00;
//					SD_CS<=1'b1;
//					SD_MOSI<=1'b1;
//					STATE<=load_cmd40;
//				end
//				load_cmd40: begin               //发送CMD0，命令字为40			1
//					init<=1'b0;
//					CMD<=8'h40;
//					SD_CS<=1'b1;
//					SD_MOSI<=1'b1;
//					STATE<=send_40;
//				end
//				send_40:	begin							//				2
//					init<=1'b0;
//					if(CMD!=8'hff) begin          //如果CMD0还未发送完成
//						SD_CS<=1'b0;
//						SD_MOSI<=CMD[7];
//						CMD<={CMD[6:0],1'b1};
//					end
//				   else begin
//						SD_CS<=1'b0;
//						SD_MOSI<=1'b0;
//						CMD<=8'h00;
//						STATE<=send_00;
//						i<=1;
//					end
//				end
//				send_00: begin                     //发送CMD0的32位的argument, 全0				3
//					 init<=1'b0;
//					 if(i<31) begin
//						 i<=i+1'b1;
//						 SD_CS<=1'b0;
//						 SD_MOSI<=1'b0;
//						 CMD<=8'h00;
//						 STATE<=send_00;
//					  end
//					  else begin
//						 i<=0;
//						 SD_CS<=1'b0;
//						 SD_MOSI<=1'b0;
//						 CMD<=8'h95;
//						 STATE<=send_95;
//						end
//				end
//				send_95: begin                          //发送last byte:CRC 95				4
//					 init<=1'b0;
//					if(CMD!=8'h00)	begin
//						SD_CS<=1'b0;
//						SD_MOSI<=CMD[7];
//						CMD<={CMD[6:0],1'b0};
//					end
//					else begin
//						SD_CS<=1'b0;
//						SD_MOSI<=1'b1;
//						CMD<=8'h00;
//						STATE<=wait_01;
//					end
//				 end
//				 wait_01:begin                        //等待SD卡回应0x01						5
//					   init<=1'b0;
//						if(DAT_valid&&DAT[47:40]==8'h01) begin          
//							SD_CS<=1'b1;
//							SD_MOSI<=1'b1;
//							CMD<=8'h48;		
//							cnt<=0;
//							STATE<=waitb;
//						end
//						else if(DAT_valid&&DAT[47:40]!=8'h01)	begin
//							SD_CS<=1'b1;
//							SD_MOSI<=1'b1;
//							CMD<=8'h48;
//							cnt<=0;
//							STATE<=idle;
//						end
//						else begin
//							SD_CS<=1'b0;
//							SD_MOSI<=1'b1;
//							CMD<=8'h00;
//						end
//					end
//					waitb: begin                //等待一段时间			11	
//						if(cnt<10'd1023)	begin
//							SD_CS<=1'b1;
//							SD_MOSI<=1'b1;
//							CMD<=8'h48;
//							STATE<=waitb;
//							cnt<=cnt+1'b1;
//							CMD55<={8'h77,8'h00,8'h00,8'h00,8'h00,8'hff};
//							ACMD41<={8'h69,8'h40,8'h00,8'h00,8'h00,8'hff};
//						end
//						else begin
//							SD_CS<=1'b1;
//							SD_MOSI<=1'b1;
//							CMD<=8'h00;
//							CMD8<={8'h48,8'h00,8'h00,8'h01,8'haa,8'h87};           
//							cnt<=0;
//							STATE<=send_cmd48;
//						end
//					end
//					send_cmd48: begin                     //发送CMD8			6
//						if(CMD8!=48'd0) begin
//							SD_CS<=1'b0;
//							SD_MOSI<=CMD8[47];
//							CMD8<={CMD8[46:0],1'b0};
//							i<=0;
//						end
//						else begin
//							SD_CS<=1'b0;
//							SD_MOSI<=1'b1;
//							CMD8<={8'h48,8'h00,8'h00,8'h01,8'haa,8'h87};
//							STATE<=waita;
//							cnt<=0;
//							i<=1;
//						end
//					end
//					waita: begin                     //等待CMD8应答,							8??
//					   i<=0;
//						SD_CS<=1'b0;
//					   SD_MOSI<=1'b1;
//						if(DAT_valid&&DAT[19:16]==4'b0001) begin         //SD2.0卡，　support 2.7V-3.6V supply voltage											
//						   STATE<=send_cmd55;
//						   CMD55<={8'h77,8'h00,8'h00,8'h00,8'h00,8'hff};
//							ACMD41<={8'h69,8'h40,8'h00,8'h00,8'h00,8'hff};
//						end
//						else if(DAT_valid&&DAT[19:16]!=4'b0001)	begin
//							STATE<=init_fail;
//						end
// 				    end
//					 send_cmd55:begin             //发送CMD55 					12		??	
//						if(CMD55!=48'd0)begin
//						   SD_CS<=1'b0;
//							SD_MOSI<=CMD55[47];
//							CMD55<={CMD55[46:0],1'b0};
//							i<=0;
//						end
//						else begin
//						   SD_CS<=1'b0;
//							SD_MOSI<=1'b1;
//							CMD55<=48'd0;
//							cnt<=0;
//							i<=1;
//							if(DAT_valid&&DAT[47:40]==8'h01)     //等待应答信号01
//							   STATE<=send_ACMD41;
//							else begin
//								if(cnt<10'd127)
//								   cnt<=cnt+1'b1;
//								else begin 
//									cnt<=10'd0;
//									STATE<=init_fail;
//								end
//							end
//						 end
//					  end																		//12->13 xxx 
//					  send_ACMD41: begin          //发送ACMD41							13
//						  if(ACMD41!=48'd0) begin						
//								SD_CS<=1'b0;
//								SD_MOSI<=ACMD41[47];
//								ACMD41<={ACMD41[46:0],1'b0};
//								i<=0;
//							end
//							else begin
//								SD_CS<=1'b0;
//								SD_MOSI<=1'b1;
//								ACMD41<=48'd0;
//								cnt<=0;
//								i<=1;
//								if(DAT_valid&&DAT[47:40]==8'h00)
//								   STATE<=init_done;
//								else begin
//									if(cnt<10'd127)
//									   cnt<=cnt+1'b1;
//									else begin
//  									   cnt<=10'd0;
//										STATE<=init_fail;
//								   end
//							   end
//							end
//					end
//					init_done:begin init<=1'b1;SD_CS<=1'b1;SD_MOSI<=1'b1;cnt<=0;end     //初始化完成
//					init_fail:begin init<=1'b0;SD_CS<=1'b1;SD_MOSI<=1'b1;cnt<=0;STATE<=waitb;end       //初始化未成功,重新发送CMD8, CMD55 和CMD41
//					default: begin	STATE<=idle; SD_CS<=1'b1; SD_MOSI<=1'b1;CMD<=8'h00;init<=1'b0;end
//			endcase
//	 end
//end
//								
//endmodule
