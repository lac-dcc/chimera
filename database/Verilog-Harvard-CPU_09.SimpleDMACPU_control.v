// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: CPU Control
// Project Name: Computer organization Project 7
//////////////////////////////////////////////////////////////////////////////////

`include "opcodes.v"

module Control(
    input [3:0] opcode,
    input [5:0] func,
    input BranchMisprediction, JumpMisprediction, DataHazard, InstCacheBusy, DataCacheBusy,
    output PCWrite, IFIDWrite, IFIDFlush, IDEXWrite, IDEXFlush, EXMEMWrite, MEMWBWrite,
    output reg IsBranch, IsJump, JumpType, DataMemRead, DataMemWrite, RegWrite, ALUSrcA, RegSrc, Halt, OpenPort,
    output reg [1:0] RegDst, ALUSrcB,
    output reg [3:0] ALUOp
    );
    /*
    [CPU control module]
    Functionality:
        By looking at the opcode and func field of an instruction, this module outputs appropriate control signals.
        Also, when notified of branch/jump misprediction or pipeline stall, this module outputs control signals that
            flush or stall part of the pipeline.
    
    Inputs:
        opcode and function code of the current instruction
        BranchMisprediction, JumpMisprediction, are asserted when its name is detected at the CPU module.
        Stall is asserted when the pipeline needs to stall due to data hazards.
    
    Outputs: only those that are different from the lecture slide are explained here.
        JumpType    : Which type of jump destination? JumpAddress(0) or Rs(1)
        RegSrc      : Data being written to the RF.   ALUResult(0) or MDR(1)
        RegDst[2]   : Adress of register to write to. Rt(00) or Rd(01) or 2(10)
        ALUSrcA     : First input to ALU.             RFRead1(0) or PC(1)
        ALUSrcB[2]  : Second input to ALU.            RFRead2(0) or sign-extended immediate(1) or 1(2)
        IFIDWrite   : Write enable bit for IF/ID pipeline register
        IFIDFlush   : Flush IFID pipeline register if enabled
        IDEXWrite   : Write enable bit for ID/EX pipeline register
    */
    
    // Determine PC and pipeline register transfer control signals
    assign PCWrite = ((!InstCacheBusy && !DataHazard) || (InstCacheBusy && (JumpMisprediction || BranchMisprediction))) && !DataCacheBusy;
    assign IFIDWrite = (!InstCacheBusy && !DataCacheBusy && !DataHazard && !BranchMisprediction && !JumpMisprediction);
    assign IFIDFlush = (!IFIDWrite && !DataHazard && !DataCacheBusy);
    assign IDEXWrite = (!BranchMisprediction && !DataHazard && !DataCacheBusy);
    assign IDEXFlush = (BranchMisprediction || DataHazard) && !DataCacheBusy;
    assign EXMEMWrite = (!DataCacheBusy);
    assign MEMWBWrite = (!DataCacheBusy);
    
    // Determine usual control signals
    always @(*) begin
        JumpType = (opcode==`OPCODE_R & (func==`FUNC_JPR | func==`FUNC_JRL));
        DataMemRead = !DataHazard & (opcode==`OPCODE_LWD);
        DataMemWrite = !DataHazard & (opcode==`OPCODE_SWD);
        RegWrite = !DataHazard & ((opcode==`OPCODE_R & (func==`FUNC_ADD | func==`FUNC_SUB | func==`FUNC_AND | func==`FUNC_ORR | func==`FUNC_NOT | func==`FUNC_TCP | func==`FUNC_SHL | func==`FUNC_SHR | func==`FUNC_JRL)) | opcode==`OPCODE_ADI | opcode==`OPCODE_ORI | opcode==`OPCODE_LHI | opcode==`OPCODE_LWD | opcode==`OPCODE_JAL);
        IsBranch = (opcode==`OPCODE_BEQ | opcode==`OPCODE_BNE | opcode==`OPCODE_BGZ | opcode==`OPCODE_BLZ);
        IsJump = (opcode==`OPCODE_JMP | opcode==`OPCODE_JAL | (opcode==`OPCODE_R & (func==`FUNC_JPR | func==`FUNC_JRL)));
        ALUSrcA = (opcode==`OPCODE_JAL | (opcode==`OPCODE_R & func==`FUNC_JRL));
        RegSrc = (opcode==`OPCODE_LWD);
        Halt = (opcode==`OPCODE_R & func==`FUNC_HLT);
        OpenPort = !BranchMisprediction & !JumpMisprediction & !DataHazard & (opcode==`OPCODE_R & func==`FUNC_WWD);
        
        if (opcode==`OPCODE_JAL | (opcode==`OPCODE_R & func==`FUNC_JRL)) ALUSrcB = 2;
        else if (opcode==`OPCODE_ADI | opcode==`OPCODE_ORI | opcode==`OPCODE_LHI | opcode==`OPCODE_LWD | opcode==`OPCODE_SWD) ALUSrcB = 1;
        else ALUSrcB = 0;
        
        if (opcode==`OPCODE_JAL | (opcode==`OPCODE_R & func==`FUNC_JRL)) RegDst = 2;
        else if (opcode==`OPCODE_R) RegDst = 1;
        else RegDst = 0;
    end
    
    // Determine usual ALU operation
    always @(*) begin
        if (opcode==`OPCODE_R & func<8) ALUOp = func[3:0];
        else if (opcode==`OPCODE_ADI | opcode==`OPCODE_LWD | opcode==`OPCODE_SWD | opcode==`OPCODE_JAL | (opcode==`OPCODE_R & func==`FUNC_JRL)) ALUOp = 0;
        else if (opcode==`OPCODE_ORI) ALUOp = 3;
        else if (opcode==`OPCODE_LHI) ALUOp = 8;
        else if (opcode==`OPCODE_BNE) ALUOp = 9;
        else if (opcode==`OPCODE_BEQ) ALUOp = 10;
        else if (opcode==`OPCODE_BGZ) ALUOp = 11;
        else if (opcode==`OPCODE_BLZ) ALUOp = 12;
        else ALUOp = 15;    // undefined operation
    end
    
endmodule
