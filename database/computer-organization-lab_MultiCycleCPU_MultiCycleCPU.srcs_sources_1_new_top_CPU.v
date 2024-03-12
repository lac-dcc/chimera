`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/13 16:57:32
// Design Name: 
// Module Name: top_CPU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_CPU(
    input clk,
    input Reset,
    output [31:0] currentIAddr, nextIAddr,
    output [4:0] rs, rt,
    output [31:0] ReadData1, ReadData2,
    output [31:0] ALU_result, DataBus
    );
    /* 部分数据通路 */
    wire [31:0] bincode, IDataOut;
    wire [31:0] ALU_inA, ALU_inB;
    wire [31:0] DataOut;
    wire [5:0] opcode;
    wire ALU_zero, ALU_sign;
    wire [15:0] immediate;
    wire [31:0] extended;
    wire [31:0] ADR_out, BDR_out, ALUoutDR_out, DataBus_before;
    wire [4:0] rd;
    
    assign opcode = bincode[31:26];
    assign rs = bincode[25:21];
    assign rt = bincode[20:16];
    assign rd = bincode[15:11];
    assign immediate = bincode[15:0];
    
    /* 控制信号 */
    wire PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, InsMemRW, mRD, mWR, IRWre, ExtSel;
    wire [1:0] PCSrc;
    wire [1:0] RegDst;
    wire [2:0] ALUOp;
    wire [5:0] WriteReg;
    wire [31:0] WriteData;
    
    /* CPU的关键部件 */
    ControlUnit ControlUnit(
        .clk(clk), .rst(Reset),
        .zero(ALU_zero), .sign(ALU_sign),
        .opcode(opcode),
        .PCWre(PCWre), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .DBDataSrc(DBDataSrc), .RegWre(RegWre), .WrRegDSrc(WrRegDSrc), .InsMemRW(InsMemRW), .mRD(mRD), .mWR(mWR), .IRWre(IRWre), .ExtSel(ExtSel),
        .PCSrc(PCSrc),
        .RegDst(RegDst),
        .ALUOp(ALUOp)
    );
    PC PC(
        .clk(clk), .Reset(Reset), .PCWre(PCWre), .nextIAddr(nextIAddr),
        .currentIAddr(currentIAddr)
    );
    InstructionMemory InstructionMemory(
        .IAddr(currentIAddr),
        .IDataOut(IDataOut)
    );
    RegisterFile RegisterFile(
        .clk(clk), .Reset(Reset), .WE(RegWre),
        .ReadReg1(rs), .ReadReg2(rt), .WriteReg(WriteReg), .WriteData(WriteData),
        .ReadData1(ReadData1), .ReadData2(ReadData2)
    );
    ALU ALU(
        .ALUOp(ALUOp), .A(ALU_inA), .B(ALU_inB),
        .result(ALU_result), .zero(ALU_zero), .sign(ALU_sign)
    );
    DataMemory DataMemory(
        .clk(clk), .DAddr(ALU_result), .DataIn(ReadData2), .RD(mRD), .WR(mWR),
        .DataOut(DataOut)
    );
    ImmediateExtend ImmediateExtend(
        .original(immediate), .ExtSel(ExtSel),
        .extended(extended)
    );
    
    /* 多周期CPU特有的寄存器 */
    IR IR(
        .clk(clk), .IRWre(IRWre), .insIn(IDataOut),
        .insOut(bincode)
    );
    DFF_32bits ADR(
        .clk(clk), .Reset(Reset), .in(ReadData1),
        .out(ADR_out)
    );
    DFF_32bits BDR(
        .clk(clk), .Reset(Reset), .in(ReadData2),
        .out(BDR_out)
    );
    DFF_32bits ALUoutDR(
        .clk(clk), .Reset(Reset), .in(ALU_result),
        .out(ALUoutDR_out)
    );
    DFF_32bits DBDR(
        .clk(clk), .Reset(Reset), .in(DataBus_before),
        .out(DataBus)
    );
    /* 数据选择器 */
    Mux4_32bits Mux_nextIAddr(
        .choice(PCSrc), .in0(currentIAddr+4), .in1(currentIAddr+4+(extended<<2)), .in2(ReadData1), .in3({currentIAddr[31:28], bincode[25:0], 2'b00}),
        .out(nextIAddr)
    );
    Mux4_5bits Mux_WriteReg(
        .choice(RegDst), .in0(5'd31), .in1(rt), .in2(rd), .in3(5'bzzzzz),
        .out(WriteReg)
    );
    Mux2_32bits Mux_WriteData(
        .choice(WrRegDSrc), .in0(currentIAddr+4), .in1(DataBus),
        .out(WriteData)
    );
    Mux2_32bits Mux_ALU_inA(
        .choice(ALUSrcA), .in0(ADR_out), .in1({27'd0, immediate[10:6]}),
        .out(ALU_inA)
    );
    Mux2_32bits Mux_ALU_inB(
        .choice(ALUSrcB), .in0(BDR_out), .in1(extended),
        .out(ALU_inB)
    );
    Mux2_32bits Mux_DBDR(
        .choice(DBDataSrc), .in0(ALU_result), .in1(DataOut),
        .out(DataBus_before)
    );
endmodule
