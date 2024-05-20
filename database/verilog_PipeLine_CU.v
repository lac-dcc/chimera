// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module CU(op, func, RegWrite,MemWrite,BEQ,BGTZ,BGEZ,BNE,BLEZ,J,Jal,Jr,Memrhalf,Memrbyte,MemExt,Rtype,RegDst_2b,ALUsrcB_2b, ImmExt_2b, RegWriteDataMUX_2b,ALUop_4b);
    input wire [5:0] op, func;
    output wire RegWrite,MemWrite,BEQ,BGTZ,BGEZ,BNE,BLEZ,J,Jal,Jr,Memrhalf,Memrbyte,MemExt,Rtype;
    output wire [3:0] ALUop_4b;
    output wire [1:0] RegDst_2b,ALUsrcB_2b, ImmExt_2b, RegWriteDataMUX_2b;

    //module IC(op, func,rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr);
    wire rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr;
    IC ic(.op(op),.func(func), .rtype(rtype), .lui(lui), .slti(slti), .ori(ori), .xori(xori), .addi(addi), .addiu(addiu), .lw(lw), .sw(sw), .lh(lh), .lhu(lhu), .sh(sh), .lb(lb), .lbu(lbu), .sb(sb), .beq(beq), .bgtz(bgtz), .bgez(bgez), .bne(bne), .blez(blez), .j(j), .jal(jal), .jr(jr));


    //SC(rtype, lui, slti, ori, xori, addi, addiu, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, bgtz, bgez, bne, blez, j, jal, jr, 
    //RegWrite,MemWrite,BQE,BGTZ,BGEZ,BNE,BLEZ,J,Jal,Jr,,Memrhalf,Memrbyte,MemExt,Rtype,RegDst_2b,ALUsrcB_2b, ImmExt_2b, RegWriteDataMUX_2b,ALUop_4b); //signals create 
    SC sc(.rtype(rtype), .lui(lui), .slti(slti), .ori(ori), .xori(xori), .addi(addi), .addiu(addiu), .lw(lw), .sw(sw), .lh(lh), .lhu(lhu), .sh(sh), .lb(lb), .lbu(lbu), .sb(sb), .beq(beq), .bgtz(bgtz), .bgez(bgez), .bne(bne), .blez(blez), .j(j), .jal(jal), .jr(jr),.RegWrite(RegWrite),.MemWrite(MemWrite),.BEQ(BEQ),.BGTZ(BGTZ),.BGEZ(BGEZ),.BNE(BNE),.BLEZ(BLEZ),.J(J),.Jal(Jal),.Jr(Jr),.Memrhalf(Memrhalf),.Memrbyte(Memrbyte),.MemExt(MemExt),.Rtype(Rtype),.RegDst_2b(RegDst_2b),.ALUsrcB_2b(ALUsrcB_2b), .ImmExt_2b(ImmExt_2b), .RegWriteDataMUX_2b(RegWriteDataMUX_2b),.ALUop_4b(ALUop_4b));

endmodule

