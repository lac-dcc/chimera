`timescale 1ns / 1ps



module TB_Counter;
    reg clk;
    reg reset;
    reg start;
    
    wire [6:0] count1,count2;
    
    Counter uut( .clk(clk), .start(start), .reset(reset), .count1(count1), .count2(count2));
    
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 0;
        start = 0;
        #22;
        start = 1;
    end
endmodule
