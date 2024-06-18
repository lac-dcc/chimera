// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module SC(rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr, 
    RegWrite,MemWrite,BEQ,BGTZ,BGEZ,BNE,BLEZ,J,Jal,Jr,Memrhalf,Memrbyte,MemExt,Rtype,RegDst_2b,ALUsrcB_2b, ImmExt_2b, RegWriteDataMUX_2b,ALUop_4b); //signals create 
    input wire rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr;

    output reg  RegWrite, MemWrite, BEQ, BGTZ, BGEZ, BNE, BLEZ,J,Jal,Jr,Memrhalf,Memrbyte,MemExt,Rtype;

    output reg [1:0] RegDst_2b,ALUsrcB_2b, ImmExt_2b, RegWriteDataMUX_2b;
    output reg [3:0] ALUop_4b;

    always @(rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr)
    begin
        RegWrite = rtype||lui||slti||ori||xori||addi||addiu||lw||lh||lhu||lb||lbu||jal;
        RegDst_2b[1] = jal;
        RegDst_2b[0] = rtype;

        ALUsrcB_2b[1] = bgez;
        ALUsrcB_2b[0] = lui||slti||ori||xori||addi||addiu||lw||sw||lh||lhu||sh||lb||lbu||sb;


        ImmExt_2b[1] = lui;
        ImmExt_2b[0] = slti||addi||addiu||lw||sw||lh||lhu||sh||lb||lbu||sb;


        MemWrite = sw||sh||sb;
        BEQ = beq;
        BGTZ = bgtz;
        BGEZ = bgez;
        BNE = bne;
        BLEZ = blez;
        J = j;
        Jal =  jal;
        Jr = jr;

        RegWriteDataMUX_2b[1] = slti||jal;
        RegWriteDataMUX_2b[0] = lw||lh||lhu||lb||lbu||jal;
        
        Memrhalf = lh||lhu||sh;
        Memrbyte = lb||lbu||sb;
        MemExt = lh||lb;
        Rtype = rtype;

        ALUop_4b[3] = 1'b0;
        ALUop_4b[2] = xori;
        ALUop_4b[1] = ori||xori;
        ALUop_4b[0] = slti||xori||beq||bne;
    end
endmodule


