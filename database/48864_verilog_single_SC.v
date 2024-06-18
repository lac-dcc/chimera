// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module SC(rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump, RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, Branch, J, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype, ALUop); //signals create 
    input wire rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump;

    output reg  RegWrite, RegDst, ALUsrcB, ImmExt, MemWrite, Branch, J, MemtoReg, Memrhalf, Memrbyte, MemExt, Rtype;

    output reg [2:0] ALUop;

    always @(rtype, ori, addi, lw, sw, lh, lhu, sh, lb, lbu, sb, beq, jump)
    begin
        RegWrite = rtype||ori||addi||lw||lh||lhu||lb||lbu;
        RegDst = rtype;
        ALUsrcB = ori||addi||lw||sw||lh||lhu||sh||lb||lbu||sb;
        ImmExt = addi||lw||sw||lh||lhu||sh||lb||lbu||sb;
        MemWrite = sw||sh||sb;
        Branch = beq;
        J = jump;
        MemtoReg = lw||lh||lhu||lb||lbu;
        Memrhalf = lh||lhu||sh;
        Memrbyte = lb||lbu||sb;
        MemExt = lh||lb;
        Rtype = rtype;
        ALUop = {1'b0,ori,beq};
    end
endmodule

