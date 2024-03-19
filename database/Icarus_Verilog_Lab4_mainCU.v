`ifndef MAIN_CU
`define MAIN_CU
    module mainCU ( RegDest, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1, op );

        input [5:0] op;
        output RegDest, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1;

        wire rformat, lw, sw, beq;

        assign rformat = ~(op[0] | op[1] | op[2] | op[3] | op[4] | op[5]);
        assign lw = (op[0] & op[1] & (~op[2]) & (~op[3]) & (~op[4]) & op[5]);
        assign sw = (op[0] & op[1] & (~op[2]) & op[3] & (~op[4]) & op[5]);
        assign beq = ((~op[0]) & (~op[1]) & op[2] & (~op[3]) & (~op[4]) & (~op[5]));

        assign RegDest = rformat;
        assign ALUSrc = lw | sw;
        assign MemToReg = lw;
        assign RegWrite = rformat | lw;
        assign MemRead = lw;
        assign MemWrite = sw;
        assign Branch = beq;
        assign ALUOp0 = rformat;
        assign ALUOp1 = beq;

    endmodule
`endif