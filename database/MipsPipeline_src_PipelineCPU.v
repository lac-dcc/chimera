// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps
module PipelineCPU(
    input wire sysclk,
    input wire reset,
    output wire [7:0] leds,
    output wire [7:0] bcd7,
    output wire [3:0] an
);
    
    wire clk;
    //CLK CLKController(sysclk, reset, clk);
    assign clk = sysclk;
    wire [31:0] Instruction;
    wire [31:0] PC_now;   // PC_IF
    wire [31:0] PC_new;

    // IF
    InstructionMemory InstMemory(PC_now, Instruction);

    // ID
    wire [5:0] OpCode_ID;
    wire [4:0] rs_ID;
    wire [4:0] rt_ID;
    wire [4:0] rd_ID;
    wire [4:0] Shamt_ID;
    wire [5:0] Funct_ID;
    wire [31:0] PC_ID;
    wire flush_IFID;
    wire hold_IFID;

    wire Load_EX;
    IF_ID IFIDReg(clk, reset, flush_IFID, hold_IFID, Load_EX, Instruction, PC_now, OpCode_ID, rs_ID, rt_ID, rd_ID, Shamt_ID, Funct_ID, PC_ID);

    wire [1:0] PCSrc_ID;
	wire Branch_ID;
	wire RegWrite_ID;
	wire [1:0] RegDst_ID;
	wire MemRead_ID;
	wire MemWrite_ID;
	wire [1:0] MemtoReg_ID;
	wire ALUSrcA_ID;
	wire ALUSrcB_ID;
	wire ExtOp_ID;
	wire LuOp_ID;
	wire JOp_ID;
	wire LoadByte_ID;
    Control ControlDecoder(OpCode_ID, Funct_ID, PCSrc_ID, Branch_ID, RegWrite_ID, RegDst_ID, MemRead_ID, MemWrite_ID, MemtoReg_ID, ALUSrcA_ID, ALUSrcB_ID, ExtOp_ID, LuOp_ID, JOp_ID, LoadByte_ID);
    
    wire [4:0] ALUCtrl_ID;
    wire Sign_ID;
    ALUControl ALUController(OpCode_ID, Funct_ID, ALUCtrl_ID, Sign_ID);

    assign flush_IFID = Branch_ID || JOp_ID;

    wire [31:0] WriteData_WB;
    wire [4:0] Rw_WB;
    wire RegWrite_WB;
    wire [31:0] dataA_ID;
    wire [31:0] dataB_ID;
    RegisterFile RF(clk, reset, RegWrite_WB, rs_ID, rt_ID, Rw_WB, WriteData_WB, dataA_ID, dataB_ID);

    wire [31:0] ImmExtOut_ID;
    wire [31:0] ImmExtShift_ID;
    ImmProcess Imm1(ExtOp_ID, LuOp_ID, {rd_ID, Shamt_ID, Funct_ID}, ImmExtOut_ID, ImmExtShift_ID);

    wire Zero;
    wire [1:0] BrForwardingA;
    wire [1:0] BrForwardingB;
    wire [31:0] BrJuderA;
    wire [31:0] BrJuderB; 
    
    wire [4:0] Rw_MEM;
    wire RegWrite_MEM;
    wire [31:0] ALUOut_MEM;
    wire Load_ID;
    wire Load_WB;
    assign Load_ID = OpCode_ID == 6'h23 || OpCode_ID == 6'h20;

    BranchForwarding BrForwarding(rs_ID, rt_ID, Rw_MEM, RegWrite_MEM, Load_WB, Rw_WB, BrForwardingA, BrForwardingB);
    assign BrJuderA = BrForwardingA == 1 ? ALUOut_MEM : 
                      BrForwardingA == 2 ? WriteData_WB : dataA_ID;
    assign BrJuderB = BrForwardingB == 1 ? ALUOut_MEM : 
                      BrForwardingB == 2 ? WriteData_WB : dataB_ID;
    BranchJudge BranchJudger(OpCode_ID, BrJuderA, BrJuderB, Branch_ID, Zero);
    
    wire [31:0] PC_Branch;
    assign PC_Branch = Branch_ID && Zero ? PC_ID + 4 + ImmExtShift_ID : PC_ID + 4; 

    // EX
    wire flush_IDEX;
    wire [4:0] Rw_EX;
    //wire hold_IDEX;

    wire RegWrite_EX;
    wire Branch_EX;
    wire MemRead_EX;
    wire MemWrite_EX;
    wire [1:0] MemtoReg_EX;
    wire ALUSrcA_EX;
    wire ALUSrcB_EX;
    wire [4:0] ALUCtrl_EX;
    wire [1:0] RegDst_EX;
    wire [31:0] dataA_EX;
    wire [31:0] dataB_EX;
    wire [31:0] ImmExtOut_EX;
    wire [4:0] Shamt_EX;
    wire [4:0] rs_EX;
    wire [4:0] rt_EX;
    wire [4:0] rd_EX;
    wire Sign_EX;
    wire LoadByte_EX;
    wire [31:0] PC_EX;
    //wire Load_EX;
    ID_EX IDEXReg(
        clk, reset, flush_IDEX, RegWrite_ID, Branch_ID, MemRead_ID, MemWrite_ID, 
        MemtoReg_ID, ALUSrcA_ID, ALUSrcB_ID, ALUCtrl_ID, RegDst_ID, dataA_ID, dataB_ID, 
        ImmExtOut_ID, Shamt_ID, rs_ID, rt_ID, rd_ID, Sign_ID, LoadByte_ID, PC_ID, Load_ID,
        RegWrite_EX, Branch_EX, MemRead_EX, MemWrite_EX,
        MemtoReg_EX, ALUSrcA_EX, ALUSrcB_EX, ALUCtrl_EX, RegDst_EX, dataA_EX, dataB_EX, 
        ImmExtOut_EX, Shamt_EX, rs_EX, rt_EX, rd_EX, Sign_EX, LoadByte_EX, PC_EX, Load_EX
    );

    assign Rw_EX = RegDst_EX == 2'b00 ? rt_EX : RegDst_EX == 2'b01 ? rd_EX : 31; // 0: rt; 1: rd; 2: ra
   
    assign hold_IFID = ((RegWrite_EX && Branch_ID && (Rw_EX == rs_ID || Rw_EX == rt_ID)) && Load_EX == 0) ||
                       (MemRead_EX && (rt_EX == rs_ID || rt_EX == rt_ID) && Load_EX);  // next inst is branch && !Load, stall || load use hazard
    assign flush_IDEX = (RegWrite_EX && Branch_ID && (Rw_EX == rs_ID || Rw_EX == rt_ID)) ||
                        (MemRead_EX && (rt_EX == rs_ID || rt_EX == rt_ID) && Load_EX);

    wire [1:0] ALUChooseA;
    wire [1:0] ALUChooseB;
    ALUForwarding ALUForward(rs_EX, rt_EX, Rw_MEM, Rw_WB, RegWrite_MEM, RegWrite_WB, ALUSrcA_EX, ALUSrcB_EX, ALUChooseA, ALUChooseB);

    wire [31:0] ALUinA;
    wire [31:0] ALUinB;
    assign ALUinA = ALUChooseA == 1 ? {27'h0000000, Shamt_EX} :
                    ALUChooseA == 2 ? ALUOut_MEM :
                    ALUChooseA == 3 ? WriteData_WB: dataA_EX;
    assign ALUinB = ALUChooseB == 1 ? ImmExtOut_EX :
                    ALUChooseB == 2 ? ALUOut_MEM :
                    ALUChooseB == 3 ? WriteData_WB: dataB_EX;

    wire [31:0] ALUOut_EX;
    ALU ALUCalculate(ALUCtrl_EX, Sign_EX, ALUinA, ALUinB, ALUOut_EX);

    // MEM
    wire MemRead_MEM;
    wire MemWrite_MEM;
    //wire [31:0] ALUOut_MEM;
    //wire [4:0] Rw_MEM;
    wire [1:0] MemtoReg_MEM;
    //wire RegWrite_MEM;
    wire [31:0] dataB_MEM;
    wire LoadByte_MEM;
    wire [31:0] PC_MEM;
    wire Load_MEM;
    EX_MEM EXMEMReg(
        clk, reset, MemRead_EX, MemWrite_EX, ALUOut_EX, Rw_EX, MemtoReg_EX, RegWrite_EX, dataB_EX, LoadByte_EX, PC_EX, Load_EX,
        MemRead_MEM, MemWrite_MEM, ALUOut_MEM, Rw_MEM, MemtoReg_MEM, RegWrite_MEM, dataB_MEM, LoadByte_MEM, PC_MEM, Load_MEM  
    );

    wire [31:0] ReadData_Temp;

    DataMemory DataMem(clk, reset, ALUOut_MEM, dataB_MEM, ReadData_Temp, MemRead_MEM, MemWrite_MEM, leds, bcd7, an);

    wire [31:0] ReadData_MEM;
    assign ReadData_MEM = LoadByte_MEM == 0 ? ReadData_Temp :   
                          ALUOut_MEM[1:0] == 2'b00 ? {{24{ReadData_Temp[7]}}, ReadData_Temp[7:0]} :
                          ALUOut_MEM[1:0] == 2'b01 ? {{24{ReadData_Temp[15]}}, ReadData_Temp[15:8]} :
                          ALUOut_MEM[1:0] == 2'b10 ? {{24{ReadData_Temp[23]}}, ReadData_Temp[23:16]} :
                          {{24{ReadData_Temp[31]}}, ReadData_Temp[31:24]};

    // WB
    //wire RegWrite_WB;
    wire [1:0] MemtoReg_WB;
    //wire [4:0] Rw_WB;
    wire [31:0] ReadData_WB;
    wire [31:0] ALUOut_WB;
    wire [31:0] PC_WB;
    //wire Load_WB;
    MEM_WB MEMWBReg(
        clk, reset, RegWrite_MEM, MemtoReg_MEM, Rw_MEM, ReadData_MEM, ALUOut_MEM, PC_MEM, Load_MEM,
        RegWrite_WB, MemtoReg_WB, Rw_WB, ReadData_WB, ALUOut_WB, PC_WB, Load_WB
    );

    //wire [31:0] WriteData_WB;
    assign WriteData_WB = MemtoReg_WB == 1 ? ReadData_WB :
                          MemtoReg_WB == 2 ? PC_WB : ALUOut_WB;

    // PC
    assign PC_new = (RegWrite_EX && Branch_ID && (Rw_EX == rs_ID || Rw_EX == rt_ID) && Load_EX) ? PC_now - 4 :
                    hold_IFID ? PC_now :
                    PCSrc_ID == 1 ? {PC_ID[31:28], rs_ID, rt_ID, rd_ID, Shamt_ID, Funct_ID, 2'b00} :
                    PCSrc_ID == 2 ? dataA_ID + 4:
                    // (Branch_ID && Zero) ? PC_now + ImmExtShift_ID : // ID stage Judge: PC_now has plused 4
                    // Branch_ID ? PC_now :
                    Branch_ID ? PC_Branch :
                    PC_now + 4;         
    PC PCConctroller(clk, reset, PC_new, PC_now);
    
endmodule