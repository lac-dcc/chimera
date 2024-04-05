`include "aluCU.v"          //( oper, aluOp, funcfield );
module tb_aluCU();

    reg [1:0] aluOp;
    reg [3:0] funcField;
    wire [2:0] oper;

    initial 
        $monitor("oper = %b ", oper, "aluOp = %b ",aluOp, "funcField = %b ", funcField);

    aluCU acu(oper, aluOp, funcField);

    initial begin
             aluOp = 2'b00;
             funcField = 4'b0000;
        #100 aluOp = 2'b01;
        #200 aluOp = 2'b10;
        #300 funcField = 4'b0000;
        #400 funcField = 4'b0010;
        #500 funcField = 4'b0100;
        #600 funcField = 4'b0101;
        #700 funcField = 4'b1010;
    end

endmodule