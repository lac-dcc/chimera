`include "mainCU.v"
module test_mainCU();
    
    reg [5:0] opcode;
    wire RegDest, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1;
    mainCU mcu(RegDest, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp0, ALUOp1, opcode);

    initial
    $monitor("Opcode: %b ",opcode," RegDest = %b ",RegDest," ALUSrc = %b ",ALUSrc," MemToReg = %b ",MemToReg, " RegWrite = %b ",RegWrite," MemRead = %b ",MemRead," MemWrite = %b ",MemWrite," Branch = %b ",Branch," ALUOp0 = %b ",ALUOp0," ALUOp1 = %b",  ALUOp1);

    always @(opcode) begin
        $display("Active Signals : ");
        if(RegDest)
            $display("RegDest");
        if(ALUSrc)
            $display("ALUSrc");
        if(MemToReg)
            $display("MemToReg");
        if(RegWrite)
            $display("RegWrite");
        if(MemRead)
            $display("MemRead");
        if(MemWrite)
            $display("MemWrite");
        if(Branch)
            $display("Branch");
        if(ALUOp0)
            $display("ALUOp0");
        if(ALUOp1)
            $display("ALUOp1");
    end


    initial begin
             opcode = 6'b000000;
        #500 opcode = 6'b100011;
        #1000 opcode = 6'b101011;
        #1500 opcode = 6'b000100;
        #2000 $finish;
    end


endmodule