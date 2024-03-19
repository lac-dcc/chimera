module aluCU( oper, aluOp, funcfield );
    
    input [1:0] aluOp;
    input [3:0] funcfield;
    output [2:0] oper;

    assign oper[0] = (funcfield[0] | funcfield[3]) & aluOp[1];
    assign oper[1] = ((~aluOp[1]) | (~funcfield[2]));
    assign oper[2] = (aluOp[0] | ( aluOp[1] & funcfield[1] ));

endmodule