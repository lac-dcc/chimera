// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module StageId(
    input clk, rst,
    // From RegsIfId
    input [31:0] pcIn, inst,
    // From EX
    input [3:0] status,
    // From WB
    input wbWbEn,
    input [31:0] wbValue,
    input [3:0] wbDest,
    // From Hazard
    input hazard,
    // To RegsIdEx
    output [31:0] pcOut,
    output [3:0] aluCmd,
    output memRead, memWrite, wbEn, branch, s,
    output [31:0] val_Rn, val_Rm,
    output imm,
    output [11:0] shiftOperand,
    output signed [23:0] imm24,
    output [3:0] dest,
    output [3:0] src1, src2,
    // To Hazard
    output hazardTwoSrc
);
    assign pcOut = pcIn;
    assign imm = inst[25];
    assign shiftOperand = inst[11:0];
    assign imm24 = inst[23:0];
    assign dest = inst[15:12];
    assign src1 = inst[19:16];

    wire [3:0] aluCmdCU;
    wire memReadCU, memWriteCU, wbEnCU, branchCU, sCU;
    wire [3:0] regfile2Inp;
    wire cond, condFinal;
    wire [31:0] regRn, regRm;
    assign hazardTwoSrc = ~imm | memWriteCU;
    assign condFinal = ~cond | hazard;
    assign src2 = regfile2Inp;

    ConditionCheck cc(
        .cond(inst[31:28]),
        .status(status),
        .result(cond)
    );

    ControlUnit cu(
        .mode(inst[27:26]),
        .opcode(inst[24:21]),
        .sIn(inst[20]),
        .aluCmd(aluCmdCU),
        .memRead(memReadCU),
        .memWrite(memWriteCU),
        .wbEn(wbEnCU),
        .branch(branchCU),
        .sOut(sCU)
    );

    RegisterFile rf(
        .clk(clk),
        .rst(rst),
        .readRegister1(inst[19:16]),
        .readRegister2(regfile2Inp),
        .writeRegister(wbDest),
        .writeData(wbValue),
        .regWrite(wbWbEn),
        .sclr(1'b0),
        .readData1(regRn),
        .readData2(regRm)
    );

    Mux2To1 #(9) muxCtrlUnit(
        .a0({aluCmdCU, memReadCU, memWriteCU, wbEnCU, branchCU, sCU}),
        .a1(9'd0),
        .sel(condFinal),
        .out({aluCmd, memRead, memWrite, wbEn, branch, s})
    );

    Mux2To1 #(4) muxRegfile(
        .a0(inst[3:0]),
        .a1(inst[15:12]),
        .sel(memWriteCU),
        .out(regfile2Inp)
    );

    // Handle X output for register file input = 4'd15
    Mux2To1 #(32) muxRn15(
        .a0(regRn),
        .a1(pcIn),
        .sel(&inst[19:16]),
        .out(val_Rn)
    );

    Mux2To1 #(32) muxRm15(
        .a0(regRm),
        .a1(pcIn),
        .sel(&regfile2Inp),
        .out(val_Rm)
    );
endmodule
