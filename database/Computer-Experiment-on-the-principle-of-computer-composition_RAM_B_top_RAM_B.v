`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:31 05/04/2018 
// Design Name: 
// Module Name:    top_RAM_B 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_RAM_B(Mem_Addr,C,Mem_Write,Clk,LED);
input [7:2]Mem_Addr;//开关的3、4、5、6、7、8位
input Mem_Write,Clk;//clk为按键C9，读写使能信号为按键C4，0为读，1为写
input [1:0]C;//选择写入数据+读操作时选择显示字节,为开关1、2位
output reg [7:0]LED;
wire [31:0]M_R_Data;//存在存储器里的32位读出数据
reg [31:0]M_W_Data;//寄存在暂存器的32位写入数据
RAM_B test_ram (
  .clka(Clk), //输入时钟信号
  .wea(Mem_Write), //输入读写信号
  .addra(Mem_Addr[7:2]), //输入5位地址信号
  .dina(M_W_Data), //写入32位数据
  .douta(M_R_Data) //读出32位数据
);
always@(*)
begin
  LED=0;//初始化
  M_W_Data=0;//初始化
  if(!Mem_Write)//读操作
  begin
   case(C)
	 2'b00:LED=M_R_Data[7:0];//读出数据的0-7位
	 2'b01:LED=M_R_Data[15:8];//读出数据的8-15位
	 2'b10:LED=M_R_Data[23:16];//读出数据的16-23位
	 2'b11:LED=M_R_Data[31:24];//读出数据的24-31位
	 endcase
	 end
	 else
	 begin
	  case(C)
	   2'b00:M_W_Data=32'h0055_7523;//写入第一个数据
		2'b01:M_W_Data=32'h1234_5678;//写入第二个数据
		2'b10:M_W_Data=32'h8765_4321;//写入第三个数据
		2'b11:M_W_Data=32'hffff_ffff;//写入第四个数据
		endcase
     end
	end
endmodule
