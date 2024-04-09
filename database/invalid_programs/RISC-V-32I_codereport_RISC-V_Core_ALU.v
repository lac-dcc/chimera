`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB (Embeded System Lab)
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: ALU
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: ALU unit of RISCV CPU
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
module ALU(
    input wire [31:0] Operand1,
    input wire [31:0] Operand2,
    input wire [3:0] AluContrl,
    output reg [31:0] AluOut
    );
	always@(*)
		case (AluContrl)
			`ADD: AluOut = Operand1 + Operand2;
			`SUB: AluOut = Operand1 - Operand2;
			`AND: AluOut = Operand1 & Operand2;
			`OR : AluOut = Operand1 | Operand2;
			`XOR: AluOut = Operand1 ^ Operand2;
			/*`SLT: //a<b(signed) return 1 else return 0;
				begin
					if(Operand1[31] == Operand2[31]) AluOut = (Operand1 < Operand2) ? 32'b1 : 32'b0;
					//对于不加signed的变量类型，运算和比较视为无符号，但依然可以存储有符号数，这里相当于自行根据首位判断
					//首位相等，即同号情况，直接比较，如果同正，后面31位大的，原数就大，如果同负，后面31位（补码）大的，依然是原数大
					else AluOut = (Operand1[31] < Operand2[31]) ? 32'b0 : 32'b1;//异号情况，直接比较符号
				end*/
			`SLT: AluOut = ($signed(Operand1) < $signed(Operand2)) ? 32'b1 : 32'b0;//法2：使用$signed()
			`SLTU: AluOut = (Operand1 < Operand2) ? 32'b1 : 32'b0;
			`SLL: AluOut = Operand1 << Operand2[4:0];
			`SRL: AluOut = Operand1 >> Operand2[4:0];
			`SRA: AluOut = $signed(Operand1) >>> Operand2[4:0];
			//使用>>>为算术右移，高位补符号，应该注意，如果是无符号数，>>>仍是逻辑右移，故应该加$signed
			`LUI: AluOut = Operand2;
			default: AluOut = 32'hxxxxxxxx;
		endcase
endmodule

//功能和接口说明
	//ALU接受两个操作数，根据AluContrl的不同，进行不同的计算操作，将计算结果输出到AluOut
	//AluContrl的类型定义在Parameters.v中
//推荐格式：
    //case()
    //    `ADD:        AluOut<=Operand1 + Operand2; 
    //   	.......
    //    default:    AluOut <= 32'hxxxxxxxx;                          
    //endcase
//实验要求  
    //实现ALU模块