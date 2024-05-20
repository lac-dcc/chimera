// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module IF(J, Jal, Jr,  BEQ, BGTZ, BGEZ, BNE, BLEZ, ZF, SF, clk, init,enable,imm, target_J, target_Jal, REG_ADDRESS, AddressBusA);
    input J, Jal, Jr,  BEQ, BGTZ, BGEZ, BNE, BLEZ, ZF, SF, clk, init,enable;
    input [15:0] imm;
    input [25:0] target_J,target_Jal;
    input [31:0] REG_ADDRESS;

    output [31:0] AddressBusA;
    //module NPC(J, Jal, Jr,  BEQ, BGTZ, BGEZ, BNE, BLEZ, target, ADDRESS, ZF, SF, imm, pc, clk, init, stop);
    NPC npc(.J(J), .Jal(Jal), .Jr(Jr),  .BEQ(BEQ), .BGTZ(BGTZ), .BGEZ(BGEZ), .BNE(BNE), .BLEZ(BLEZ), .target_J(target_J), .target_Jal(target_Jal), .REG_ADDRESS(REG_ADDRESS), .ZF(ZF), .SF(SF), .imm(imm), .pc(AddressBusA), .clk(clk), .init(init), .enable(enable));
endmodule


