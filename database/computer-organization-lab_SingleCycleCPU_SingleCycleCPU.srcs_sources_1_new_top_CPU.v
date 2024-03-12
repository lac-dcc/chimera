`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/14 21:32:32
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
    
    wire [5:0] opcode;
    wire [4:0] rd;
    wire [15:0] immediate;
    
    wire [31:0] bincode;
    wire [31:0] extended;
    wire PCWre, RegWre, RegDst, DBDataSrc, ALUSrcA, ALUSrcB, mRD, mWR, ExtSel;
    wire [1:0] PCSrc;
    wire [2:0] ALUOp;
    wire ALU_zero, ALU_sign;
    wire [5:0] WriteReg;
    wire [31:0] WriteData;
    wire [31:0] ALU_inA, ALU_inB;
    wire [31:0] DataOut;
    
    wire [31:0] next_in0, next_in1, next_in2;
    assign opcode = bincode[31:26];
    assign rs = bincode[25:21];
    assign rt = bincode[20:16];
    assign rd = bincode[15:11];
    assign immediate = bincode[15:0];
    
    assign next_in0 = currentIAddr + 4;
    assign next_in1 = next_in0 + (extended<<2);
    assign next_in2 = {currentIAddr[31:28], bincode[25:0], 2'b00};
    
    assign DataBus = WriteData;
    /* 控制单元 */
    ControlUnit ControlUnit(
        .opcode(opcode), .zero(ALU_zero), .sign(ALU_sign),
        .PCWre(PCWre), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), .DBDataSrc(DBDataSrc), .RegWre(RegWre), /*.InsMemRW(InsMemRW),*/ .mRD(mRD), .mWR(mWR), .RegDst(RegDst), .ExtSel(ExtSel),
        .PCSrc(PCSrc), .ALUOp(ALUOp)
    );
    
    /* 5个关键底层模块 */
    PC PC(
        .clk(clk), .Reset(Reset), .PCWre(PCWre), .nextIAddr(nextIAddr),
        .currentIAddr(currentIAddr)
    );
    InstructionMemory InstructionMemory(
        .IAddr(currentIAddr),
        .IDataOut(bincode)
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
    
    /* 立即数扩展 */
    ImmediateExtend ImmediateExtend(
        .original(immediate), .ExtSel(ExtSel),
        .extended(extended)
    );
    /* 数据选择器 */
    Mux4_32bits Mux_nextIAddr(
        .choice(PCSrc), .in0(next_in0), .in1(next_in1), .in2(next_in2), .in3(currentIAddr),
        .out(nextIAddr)
    );
    Mux2_5bits Mux_WriteReg(
        .choice(RegDst), .in0(rt), .in1(rd),
        .out(WriteReg)
    );
    Mux2_32bits Mux_WriteData(
        .choice(DBDataSrc), .in0(ALU_result), .in1(DataOut),
        .out(WriteData)
    );
    Mux2_32bits Mux_ALU_inA(
        .choice(ALUSrcA), .in0(ReadData1), .in1({27'd0, immediate[10:6]}),
        .out(ALU_inA)
    );
    Mux2_32bits Mux_ALU_inB(
        .choice(ALUSrcB), .in0(ReadData2), .in1(extended),
        .out(ALU_inB)
    );
endmodule
