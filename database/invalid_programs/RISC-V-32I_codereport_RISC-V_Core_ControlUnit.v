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
`define OP_JAL    7'b1101111 //JAL的操作码
`define OP_JALR   7'b1100111 //JALR的操作码
`define OP_Load   7'b0000011 //Load类指令的操作码
`define OP_Store  7'b0100011 //Store类指令的操作码
`define OP_Branch 7'b1100011 //Branch类指令的操作码
`define OP_LUI    7'b0110111 //LUI的操作码
`define OP_AUIPC  7'b0010111 //AUIPC的操作码
`define OP_RegReg 7'b0110011 //寄存器-寄存器算术指令的操作码
`define OP_RegImm 7'b0010011 //寄存器-立即数算术指令的操作码
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
	always@(*) begin
		JalD         =  Op == `OP_JAL; //JAL指令才为1
		JalrD        =  Op == `OP_JALR; //JALR指令才为1
		MemToRegD    =  Op == `OP_Load; //Load类指令才为1
		RegWriteD    =  Op == `OP_Load ? Fn3 + 3'b001 : (Op == `OP_Store || Op == `OP_Branch ? `NOREGWRITE : `LW); //Load类指令按Fn3选择（Parameters中直接按Fn3编码定义，设置偏移量为1 是为了将3'b000保留给NOREGWRITE）, Store和Branch类指令为NOREGWRITE，其余为LW
		MemWriteD    =  Op == `OP_Store ? 4'b1111 >> (3'b100 - (3'b001 << Fn3)) : 4'b0000; //3种Store指令分别对4'b1111右移 4 - pow(2, Fn3) 位
		LoadNpcD     =  Op == `OP_JAL || Op == `OP_JALR; //JAL/JALR指令才为1
		RegReadD[1]  =  Op != `OP_LUI && Op != `OP_AUIPC && Op != `OP_JAL; //除了LUI/AUIPC/JAL这3条指令，其他都用到了寄存器A1端口
		RegReadD[0]  =  Op == `OP_Store || Op == `OP_RegReg || Op == `OP_Branch; //Store类/RegReg类/Branch类指令用到了寄存器A2端口
		BranchTypeD  =  Op == `OP_Branch ? Fn3 - 3'b010 : `NOBRANCH; //Branch类指令按Fn3选择（Parameters中直接按Fn3编码定义，偏移3'b010，为了将000留给NOBRANCH），其余都是NOBRANCH
		AluSrc1D     =  Op == `OP_AUIPC; //AUIPC指令的src1才为1
		AluSrc2D[1]  =  Op != `OP_RegReg && Op != `OP_Branch && ~(Op == `OP_RegImm && (Fn3 == 3'b001 || Fn3 == 3'b101)); //RegReg类/Branch类/SLLI/SRLI/SRAI的src2高位为0
		AluSrc2D[0]  =  Op == `OP_RegImm && (Fn3 == 3'b001 || Fn3 == 3'b101); //SLLI/SRLI/SRAI三条指令src2为2’b01，低位为1
		case(Op)
			`OP_Load:   ImmType = `ITYPE;
			`OP_Store:  ImmType = `STYPE;
			`OP_RegReg: ImmType = `RTYPE;
			`OP_RegImm: ImmType = `ITYPE;
			`OP_LUI:    ImmType = `UTYPE;
			`OP_AUIPC:  ImmType = `UTYPE;
			`OP_Branch: ImmType = `BTYPE;
			`OP_JAL:    ImmType = `JTYPE;
			`OP_JALR:   ImmType = `ITYPE;
			default:    ImmType = `RTYPE;
		endcase
		case(Op) //AluContrlD信号生成，Parameters中直接按指令Fn3对应的编码进行定义
			`OP_RegReg: AluContrlD = {1'b0 ,Fn3} + (Fn7 == 7'b0100000 ? 4'b1000 : 4'b0000);//后面附加一项4'b1000偏移针对SUB和SRA指令
			`OP_RegImm: AluContrlD = {1'b0 ,Fn3} + (Fn7 == 7'b0100000 && Fn3 == 3'b101 ? 4'b1000 : 4'b0000);//后面附加一项4'b1000偏移针对SRAI指令
			`OP_LUI:    AluContrlD = `LUI;
			default:    AluContrlD = `ADD;
		endcase
	end
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