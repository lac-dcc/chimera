`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2018 19:30:21
// Design Name: 
// Module Name: TB_AdderTree
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_AdderTree;
    reg signed [7:0] w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
    reg clk;
    reg start;
    reg reset;
    wire count_done;
    wire signed [19:0] result;
    
    AdderTree_R uut( .clk(clk), .count_done(count_done), .result(result), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5),
    .w6(w6), .w7(w7), .w8(w8), .w9(w9), .w10(w10), .w11(w11), .w12(w12), .w13(w13), .w14(w14), .w15(w15), .w16(w16));
    
    Counter counter( .clk(clk), .start(start), .reset(reset), /*.count1(count1), .count2(count2),*/ .done(count_done));
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        #12;
        start = 1;
        reset = 0;
        w1 = 1;
        w2 = 1;
        w3 = 1;
        w4 = 1;
        w5 = 1;
        w6 = 1;
        w7 = 1;
        w8 = 1;
        w9 = 1;
        w10 = 1;
        w11 = 1;
        w12 = 1;
        w13 = 1;
        w14 = 1;
        w15 = 1;
        w16 = 1;
    end

endmodule
