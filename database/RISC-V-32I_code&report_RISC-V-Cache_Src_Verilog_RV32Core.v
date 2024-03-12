`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: USTC 嵌入式系统实验室 ESLAB
// Engineer: Haojun Xia(xhjustc@mail.ustc.edu.cn)
// 
// Create Date: 2019/02/08 16:29:41
// Design Name: RISCV-Pipline CPU
// Module Name: RV32Core
// Target Devices: Nexys4
// Tool Versions: Vivado 2017.4.1
// Description: 
// 
// 
//////////////////////////////////////////////////////////////////////////////////


module RV32Core(
    input wire CPU_CLK,
    input wire CPU_RST
    );
    //变量声明
    wire StallF;
    wire [31:0] PC_In;
    wire [31:0] PCF;
    wire FlushD;
    wire StallD;
    wire [31:0] Instr;
    wire [31:0] NPCF;
    wire [31:0] PCD;
    wire JalD;
    wire JalrD;
    wire [2:0] RegWriteD;
    wire MemToRegD;
    wire [3:0] MemWriteD;
    wire LoadNpcD;
    wire BranchD;
    wire [4:0] AluContrlD;
    wire AluSrc1D;
    wire [1:0] AluSrc2D;
    wire [2:0] RegWriteW;
    wire [4:0] RdW;
    wire [31:0] RegWriteData;
    wire [31:0] RegWriteDataExt;
    wire [31:0] RF_RD1;
    wire [31:0] RF_RD2;
    wire [2:0] ImmType;
    wire [31:0] ImmD;
    wire FlushE;
    wire [31:0] BrPCD;
    wire [31:0] BrPCE;
    wire [31:0] ImmE;
    wire [4:0] RdD;
    wire [4:0] RdE;
    wire [4:0] Rs1D;
    wire [4:0] Rs1E;
    wire [4:0] Rs2D;
    wire [4:0] Rs2E;
    wire [31:0] RegOut1D;
    wire [31:0] RegOut1E;
    wire [31:0] RegOut2D;
    wire [31:0] RegOut2E;
    wire JalrE;
    wire [2:0] RegWriteE;
    wire MemToRegE;
    wire [3:0] MemWriteE;
    wire LoadNpcE;
    wire [4:0] AluContrlE;
    wire AluSrc1E;
    wire [1:0] AluSrc2E;
    wire [31:0] Operand1;
    wire [31:0] Operand2;
    wire BranchE;
    wire [31:0] AluOutE;
    wire [31:0] AluOutM; 
    wire [31:0] ForwardData1;
    wire [31:0] ForwardData2;
    wire [31:0] PCE;
    wire [31:0] StoreDataM; 
    wire [4:0] RdM;
    wire [31:0] PCM;
    wire [31:0] NPCM;
    wire [2:0] RegWriteM;
    wire MemToRegM;
    wire [3:0] MemWriteM;
    wire LoadNpcM;
    wire [31:0] DM_RD;
    wire [31:0] ResultM;
    wire [31:0] ResultW;
    wire MemToRegW;
    wire Forward1D;
    wire Forward2D;
    wire [1:0] Forward1E;
    wire [1:0] Forward2E;
    wire [1:0] LoadedBytesSelect;
    wire DCacheMiss, StallE, StallM, StallW;
    //中间变量声明和赋�?
    assign Rs1D = Instr[19:15];
    assign Rs2D = Instr[24:20];
    assign RdD = Instr[11:7];
    assign PC_In=JalrE?(AluOutE):( BranchE?(BrPCE):( JalD?(BrPCD):(NPCF) ) );
    assign NPCF=PCF+4;
    assign RegOut1D=Forward1D?AluOutM:RF_RD1;
    assign RegOut2D=Forward2D?AluOutM:RF_RD2;
    assign BrPCD=ImmD+PCD;
    assign NPCM = PCM+4;
    assign ForwardData1 = Forward1E[1]?(AluOutM):( Forward1E[0]?RegWriteDataExt:RegOut1E );
    assign Operand1 = AluSrc1E?PCE:ForwardData1;
    assign ForwardData2 = Forward2E[1]?(AluOutM):( Forward2E[0]?RegWriteDataExt:RegOut2E );
    assign Operand2 = AluSrc2E[1]?(ImmE):( AluSrc2E[0]?Rs2E:ForwardData2 );
    assign ResultM = LoadNpcM?NPCM:AluOutM;
    assign RegWriteData = ~MemToRegW?ResultW:DM_RD;
    //模块调用
    IFSegReg IFSegReg1(
        .clk(CPU_CLK),
        .rst(CPU_RST),
        .en(~StallF),
        .PC_In(PC_In),
        .PC(PCF)
        );
    IDSegReg IDSegReg1(
        .clk(CPU_CLK),
        .rst(CPU_RST),
        .clear(FlushD),
        .en(~StallD),
        .A(PCF),
        .RD(Instr),
        .PCF(PCF),
        .PCD(PCD) 
        );
    ControlUnit ControlUnit1(
        .Op(Instr[6:0]),
        .Fn3(Instr[14:12]),
        .Fn7(Instr[31:25]),
        .JalD(JalD),
        .JalrD(JalrD),
        .RegWriteD(RegWriteD),
        .MemToRegD(MemToRegD),
        .MemWriteD(MemWriteD),
        .LoadNpcD(LoadNpcD),
        .BranchD(BranchD),
        .AluContrlD(AluContrlD),
        .AluSrc1D(AluSrc1D),
        .AluSrc2D(AluSrc2D),
        .ImmType(ImmType)
        );
    DataExt DataExt1(
        .IN(RegWriteData),
        .ADDR(LoadedBytesSelect),
        .WE3(RegWriteW),
        .OUT(RegWriteDataExt)
        );
    RegisterFile RegisterFile1(
        .clk(CPU_CLK),
        .rst(CPU_RST),
        .WE3(RegWriteW),
        .A1(Instr[19:15]),
        .A2(Instr[24:20]),
        .A3(RdW),
        .WD3(RegWriteDataExt),
        .RD1(RF_RD1),
        .RD2(RF_RD2)
        );
    ImmOperandUnit ImmOperandUnit1(
        .In(Instr[31:7]),
        .Type(ImmType),
        .Out(ImmD)
        );
    EXSegReg EXSegReg1(
        .clk(CPU_CLK),
        .rst(CPU_RST),
        .en(~StallE),
        .clear(FlushE),
        .PCD(PCD),
        .PCE(PCE), 
        .BrPCD(BrPCD),
        .BrPCE(BrPCE), 
        .ImmD(ImmD),
        .ImmE(ImmE),
        .RdD(RdD),
        .RdE(RdE),
        .Rs1D(Rs1D),
        .Rs1E(Rs1E),
        .Rs2D(Rs2D),
        .Rs2E(Rs2E),
        .RegOut1D(RegOut1D),
        .RegOut1E(RegOut1E),
        .RegOut2D(RegOut2D),
        .RegOut2E(RegOut2E),
        .JalrD(JalrD),
        .JalrE(JalrE),
        .RegWriteD(RegWriteD),
        .RegWriteE(RegWriteE),
        .MemToRegD(MemToRegD),
        .MemToRegE(MemToRegE),
        .MemWriteD(MemWriteD),
        .MemWriteE(MemWriteE),
        .LoadNpcD(LoadNpcD),
        .LoadNpcE(LoadNpcE),
        .AluContrlD(AluContrlD),
        .AluContrlE(AluContrlE),
        .AluSrc1D(AluSrc1D),
        .AluSrc1E(AluSrc1E),
        .AluSrc2D(AluSrc2D),
        .AluSrc2E(AluSrc2E)
        );
    ALU ALU1(
        .Operand1(Operand1),
        .Operand2(Operand2),
        .AluContrl(AluContrlE),
        .Branch(BranchE),
        .AluOut(AluOutE)
        );
    MEMSegReg MEMSegReg1(
        .clk(CPU_CLK),
        .rst(CPU_RST),
        .en(~StallM),
        .AluOutE(AluOutE),
        .AluOutM(AluOutM), 
        .ForwardData2(ForwardData2),
        .StoreDataM(StoreDataM), 
        .RdE(RdE),
        .RdM(RdM),
        .PCE(PCE),
        .PCM(PCM),
        .RegWriteE(RegWriteE),
        .RegWriteM(RegWriteM),
        .MemToRegE(MemToRegE),
        .MemToRegM(MemToRegM),
        .MemWriteE(MemWriteE),
        .MemWriteM(MemWriteM),
        .LoadNpcE(LoadNpcE),
        .LoadNpcM(LoadNpcM)
        );
    WBSegReg WBSegReg1(
        .clk(CPU_CLK),
        .rst(CPU_RST),
        .en(~StallW),
        .CacheMiss(DCacheMiss),
        .A(AluOutM),
        .WD(StoreDataM),
        .WE(MemWriteM),
        .RD(DM_RD),
        .LoadedBytesSelect(LoadedBytesSelect),
        .ResultM(ResultM),
        .ResultW(ResultW), 
        .RdM(RdM),
        .RdW(RdW),
        .RegWriteM(RegWriteM),
        .RegWriteW(RegWriteW),
        .MemToRegM(MemToRegM),
        .MemToRegW(MemToRegW)
        );
    HarzardUnit HarzardUnit1(
        .BranchD(BranchD),
        .BranchE(BranchE),
        .JalrD(JalrD),
        .JalrE(JalrE),
        .JalD(JalD),
        .Rs1D(Rs1D),
        .Rs2D(Rs2D),
        .Rs1E(Rs1E),
        .Rs2E(Rs2E),
        .MemToRegE(MemToRegE),
        .RegWriteE(RegWriteE),
        .RdE(RdE),
        .RdM(RdM),
        .RegWriteM(RegWriteM),
        .RdW(RdW),
        .RegWriteW(RegWriteW),
        .DCacheMiss(DCacheMiss),
        .StallF(StallF),
        .FlushD(FlushD),
        .StallD(StallD),
        .FlushE(FlushE),
        .StallE(StallE),
        .StallM(StallM),
        .StallW(StallW),
        .Forward1D(Forward1D),
        .Forward2D(Forward2D),
        .Forward1E(Forward1E),
        .Forward2E(Forward2E)
        );             
endmodule
