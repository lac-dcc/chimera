`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:14 12/13/2018 
// Design Name: 
// Module Name:    CP0 
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
module CP0(
	 input[4:0] A1,//读CP0寄存器编号 执行MFC0指令时产生
	 input[4:0] A2,//写CP0寄存器编号 执行MTC0指令时产生
	 input[31:0] DIn,//CP0寄存器的写入数据 执行MTC0指令时产生 数据来自GPR
	 input[31:0] PC_E,
	 input[31:0] PC,//中断/异常时的PC 
	 input[31:0] PC_W,
	 input[31:0] IR_M,//指令
	 input[31:0] IR_W,//指令
	 input Zero,
	 input more,
	 input less,
	 input if_bd,
	 input[6:2] ExcCode,//中断/异常的类型 
	 input[5:0] HWInt,//6个设备中断 
	 input We,//CP0写使能 执行MTC0指令时产生
	 input EXLSet,//用于置位SR的EXL(EXL为1) 流水线在M阶段产生
	 input EXLClr,//用于清除SR的EXL(EXL为0) 执行ERET指令时产生
    input clk,
    input reset,
	 output Interrupt,//中断和异常 是HWInt/IM/EXL/IE的函数
	 output[31:0] EPC,//EPC寄存器输出至NPC
	 output[31:0] DOut //CP0寄存器的输出数据 执行MFC0指令时产生，输出数据至GRF
    );
	 
	`define SR 12 
	`define CAUSE 13 
	`define EPC 14
	`define PRID 15
	
	`define R 6'b000000
	`define beq 6'b000100
	`define bne 6'b000101
	`define bgtz 6'b000111
	`define blez 6'b000110
	`define jal 6'b000011
	`define jr 6'b001000
	`define j 6'b000010
	`define jalr 6'b001001
	
	//SR  {16'b0, im, 8'b0, exl, ie}
	reg[15:10] im; //6位中断屏蔽位，分别对应6个外部中断 1-允许中断，0-禁止中断
	reg exl;//EXL：异常级 1-进入异常，不允许再中断；0-允许中断
	reg ie;//全局中断使能 1-允许中断；0-禁止中断
	//CAUSE {bd, 15'b0, hwint_pend[15:10], 3'b0, exccode[6:2], 2'b0}
	reg bd;//异常发生在延迟槽的指令的话 bd=1
	reg[6:2] exccode;
	reg[15:10] hwint_pend;//在clock上升沿不断的保存外部6个中断(HWInt[5:0])
	//EPC
	reg[31:0] epc;
	//PRID
	reg[31:0] prid = 32'h12345678;
	wire Exception;//异常
	wire IntReq;//中断
	
	initial 
	begin
		im<=6'b0;//SR
		exl<=1'b0;
		ie<=1'b0;
		hwint_pend<=6'b0;//CAUSE
		bd<=0;
		exccode<=0;
		epc<=0;//EPC
	end
	
	assign EPC = epc;
	//读  除了SR/Cause/EPC/PRId外，不用的寄存器一律输出0
	assign DOut = (A1==`SR) ? {16'b0, im, 8'b0, exl, ie} :
					  (A1==`CAUSE) ? {bd, 15'b0, hwint_pend[15:10], 3'b0, exccode[6:2], 2'b0} :
					  (A1==`EPC) ? epc :
				     (A1==`PRID) ? prid : 0;
	assign IntReq = (|(HWInt[5:0] & im[15:10])) & ie & !exl ;
	assign Exception = (ExcCode>0&&!exl) ? 1'b1 : 1'b0;
	assign Interrupt = IntReq||Exception;
		
	wire BD;
	//assign BD = ((IR_M[31:26]==`j)||(IR_M[31:26]==`jal)||(IR_M[31:26]==`beq)||(IR_M[31:26]==`bne)||(IR_M[31:26]==`blez)||(IR_M[31:26]==`bgtz)
	//				||(IR_M[31:26]==`R&&(IR_M[5:0]==`jr||IR_M[5:0]==`jalr))||(IR_M[31:26]==6'b000001&&IR_M[20:16]==5'b00000)||(IR_M[31:26]==6'b000001&&IR_M[20:16]==5'b00001));
	assign BD = ((IR_W[31:26]==`j)||(IR_W[31:26]==`jal)||(IR_W[31:26]==`beq)||(IR_W[31:26]==`bne)||(IR_W[31:26]==`blez)||(IR_W[31:26]==`bgtz)
					||(IR_W[31:26]==`R&&(IR_W[5:0]==`jr||IR_W[5:0]==`jalr))||(IR_W[31:26]==6'b000001&&IR_W[20:16]==5'b00000)||(IR_W[31:26]==6'b000001&&IR_W[20:16]==5'b00001));
	
	integer i;
	always@(posedge clk) begin
		if(reset) begin
			im<=6'b0;//SR
			exl<=1'b0;
			ie<=1'b0;
			hwint_pend<=6'b0;//CAUSE
			bd<=0;
			exccode<=0;
			epc<=0;//EPC
		end
		else begin
			hwint_pend <= HWInt;//在clock上升沿不断的保存外部6个中断(HWInt[5:0])
			if(We) begin //写入
				case(A2)
					`SR: begin
						{im, exl, ie} <= {DIn[15:10], DIn[1], DIn[0]};
					end
					`EPC: begin
						epc <= DIn;
					end
					default: begin
					end
				endcase
			end
			if(IntReq&&!Exception) begin
				if(BD) begin
					bd<=1'b1;
					epc<={PC_W[31:2],2'b00};//{PC[31:2], 2'b00} - 4;
				end
				else begin
					bd<=1'b0;
					epc<={PC[31:2],2'b00};//{PC[31:2], 2'b00};
				end
				exl<=1'b1;
				exccode<=5'b0;
			end
			if(Exception) begin
				if(BD) begin
					bd<=1'b1;
					epc<={PC_W[31:2],2'b00};//{PC[31:2], 2'b00} - 4;
				end
				else begin
					bd<=1'b0;
					epc<={PC[31:2], 2'b00};
				end
				if(IntReq) begin
					exccode<=5'b0;
				end
				else begin
					exccode<=ExcCode;
				end
				exl<=1'b1;
			end
			if(EXLClr) begin
				exl<=1'b0;
			end
		end
	end
endmodule
