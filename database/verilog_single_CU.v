// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module CU(op, RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, Branch, J, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype, ALUop);
    input wire [5:0] op;
    output wire RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, Branch, J, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype;
    output wire [2:0] ALUop;

    //module IC(op, rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump); //instruction classify
    wire rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump;
    IC ic(.op(op), .rtype(rtype), .ori(ori), .addi(addi), .lw(lw), .sw(sw), .lh(lh), .lhu(lhu), .sh(sh), .lb(lb), .lbu(lbu), .sb(sb), .beq(beq), .jump(jump));
    //module SC(rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump, RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, Branch, J, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype, ALUop); //signals create 
    SC sc(.rtype(rtype), .ori(ori), .addi(addi), .lw(lw), .sw(sw), .lh(lh), .lhu(lhu), .sh(sh), .lb(lb), .lbu(lbu), .sb(sb), .beq(beq), .jump(jump), .RegWrite(RegWrite), .RegDst(RegDst), .ALUsrcB(ALUsrcB), .ImmExt(ImmExt), .MemWrite(MemWrite), .Branch(Branch), .J(J), .MemtoReg(MemtoReg), .Memrhalf(Memrhalf), .Memrbyte(Memrbyte), .MemExt(MemExt), .Rtype(Rtype), .ALUop(ALUop));

endmodule
