`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC ESLAB (Embeded System Lab)
// Engineer: Haojun Xia
// Create Date: 2019/02/08
// Design Name: RISCV-Pipline CPU
// Module Name: ControlUnit
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: RISC-V Instruction Decoder
//////////////////////////////////////////////////////////////////////////////////
`include "Parameters.v"   
`define ControlOut {{JalD,JalrD},{MemToRegD},{RegWriteD},{MemWriteD},{LoadNpcD},{RegReadD},{BranchTypeD},{AluContrlD},{AluSrc1D,AluSrc2D},{ImmType}}
module ControlUnit(
    input wire [6:0] Op,
    input wire [2:0] Fn3,
    input wire [6:0] Fn7,
    output reg JalD,
    output reg JalrD,
    output reg [2:0] RegWriteD,
    output reg MemToRegD,
    output reg [3:0] MemWriteD,
    output reg LoadNpcD,
    output reg [1:0] RegReadD,
    output reg [2:0] BranchTypeD,
    output reg [3:0] AluContrlD,
    output reg [1:0] AluSrc2D,
    output reg AluSrc1D,
    output reg [2:0] ImmType
    );
	always@(*) 
		case(Op)
			7'b0000011: //Load
				case(Fn3)
					3'b000: /* LB */ `ControlOut = {{2'b0_0},{1'b1,`LB},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
					3'b001: /* LH */ `ControlOut = {{2'b0_0},{1'b1,`LH},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
					3'b010: /* LW */ `ControlOut = {{2'b0_0},{1'b1,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
					3'b100: /* LBU */ `ControlOut = {{2'b0_0},{1'b1,`LBU},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
					3'b101: /* LHU */ `ControlOut = {{2'b0_0},{1'b1,`LHU},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
				endcase
			7'b0100011: //Store
				case(Fn3)
					3'b000: /* SB */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0001},{1'b0},{2'b11},{`NOBRANCH},{`ADD},{3'b0_10},{`STYPE}};
					3'b001: /* SH */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0011},{1'b0},{2'b11},{`NOBRANCH},{`ADD},{3'b0_10},{`STYPE}};
					3'b010: /* SW */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b1111},{1'b0},{2'b11},{`NOBRANCH},{`ADD},{3'b0_10},{`STYPE}};
				endcase
			7'b0110011: //REG-REG
				case(Fn3)
					3'b000: /*  */
						case(Fn7)
							7'b0000000: /* ADD */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`ADD},{3'b0_00},{`RTYPE}};
							7'b0100000: /* SUB */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`SUB},{3'b0_00},{`RTYPE}};
						endcase
					3'b001: /* SLL */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`SLL},{3'b0_00},{`RTYPE}};
					3'b010: /* SLT */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`SLT},{3'b0_00},{`RTYPE}};
					3'b011: /* SLTU */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`SLTU},{3'b0_00},{`RTYPE}};
					3'b100: /* XOR */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`XOR},{3'b0_00},{`RTYPE}};
					3'b101:
						case(Fn7)
							7'b0000000: /* SRL */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`SRL},{3'b0_00},{`RTYPE}};
							7'b0100000: /* SRA */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`SRA},{3'b0_00},{`RTYPE}};
						endcase
					3'b110: /* OR */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`OR},{3'b0_00},{`RTYPE}};
					3'b111: /* AND */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b11},{`NOBRANCH},{`AND},{3'b0_00},{`RTYPE}};
				endcase
			7'b0010011: //REG-IMM
				case(Fn3)
					3'b000: /* ADDI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
					3'b001: /* SLLI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`SLL},{3'b0_01},{`ITYPE}};
					3'b010: /* SLTI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`SLT},{3'b0_10},{`ITYPE}};
					3'b011: /* SLTIU */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`SLTU},{3'b0_10},{`ITYPE}};
					3'b100: /* XORI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`XOR},{3'b0_10},{`ITYPE}};
					3'b101:
						case(Fn7)
							7'b0000000: /* SRLI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`SRL},{3'b0_01},{`ITYPE}};
							7'b0100000: /* SRAI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`SRA},{3'b0_01},{`ITYPE}};
						endcase
					3'b110: /* ORI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`OR},{3'b0_10},{`ITYPE}};
					3'b111: /* ANDI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b10},{`NOBRANCH},{`AND},{3'b0_10},{`ITYPE}};
				endcase
			7'b0110111: /* LUI */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b00},{`NOBRANCH},{`LUI},{3'b0_10},{`UTYPE}};
			7'b0010111: /* AUIPC */ `ControlOut = {{2'b0_0},{1'b0,`LW},{4'b0000},{1'b0},{2'b00},{`NOBRANCH},{`ADD},{3'b1_10},{`UTYPE}};
			7'b1100011: //Branch
				case(Fn3)
					3'b000: /* BEQ */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0000},{1'b0},{2'b11},{`BEQ},{4'bxxxx},{3'b0_00},{`BTYPE}};
					3'b001: /* BNE */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0000},{1'b0},{2'b11},{`BNE},{4'bxxxx},{3'b0_00},{`BTYPE}};
					3'b100: /* BLT */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0000},{1'b0},{2'b11},{`BLT},{4'bxxxx},{3'b0_00},{`BTYPE}};
					3'b101: /* BGE */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0000},{1'b0},{2'b11},{`BGE},{4'bxxxx},{3'b0_00},{`BTYPE}};
					3'b110: /* BLTU */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0000},{1'b0},{2'b11},{`BLTU},{4'bxxxx},{3'b0_00},{`BTYPE}};
					3'b111: /* BGEU */ `ControlOut = {{2'b0_0},{1'b0,`NOREGWRITE},{4'b0000},{1'b0},{2'b11},{`BGEU},{4'bxxxx},{3'b0_00},{`BTYPE}};
				endcase
			7'b1101111: /* JAL */ `ControlOut = {{2'b1_0},{1'b0,`LW},{4'b0000},{1'b1},{2'b00},{`NOBRANCH},{4'bxxxx},{3'bx_xx},{`JTYPE}};
			7'b1100111: /* JALR */ `ControlOut = {{2'b0_1},{1'b0,`LW},{4'b0000},{1'b1},{2'b10},{`NOBRANCH},{`ADD},{3'b0_10},{`ITYPE}};
			default: `ControlOut = 26'b0;
		endcase
			
endmodule

//功能说明
    //ControlUnit       是本CPU的指令译码器，组合逻辑电路
//输入
    // Op               是指令的操作码部分
    // Fn3              是指令的func3部分
    // Fn7              是指令的func7部分
//输出
    // JalD==1          表示Jal指令到达ID译码阶段
    // JalrD==1         表示Jalr指令到达ID译码阶段
    // RegWriteD        表示ID阶段的指令对应的 寄存器写入模式 ，所有模式定义在Parameters.v中
    // MemToRegD==1     表示ID阶段的指令需要将data memory读取的值写入寄存器,
    // MemWriteD        共4bit，采用独热码格式，对于data memory的32bit字按byte进行写入,MemWriteD=0001表示只写入最低1个byte，和xilinx bram的接口类似
    // LoadNpcD==1      表示将NextPC输出到ResultM
    // RegReadD[1]==1   表示A1对应的寄存器值被使用到了，RegReadD[0]==1表示A2对应的寄存器值被使用到了，用于forward的处理
    // BranchTypeD      表示不同的分支类型，所有类型定义在Parameters.v中
    // AluContrlD       表示不同的ALU计算功能，所有类型定义在Parameters.v中
    // AluSrc2D         表示Alu输入源2的选择
    // AluSrc1D         表示Alu输入源1的选择
    // ImmType          表示指令的立即数格式，所有类型定义在Parameters.v中   
//实验要求  
    //实现ControlUnit模块   