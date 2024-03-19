`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2020 11:57:40 PM
// Design Name: 
// Module Name: testShift
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


module testShift();
    reg clock, d;
    wire [1:0] qa;
    wire [1:0] qb;
    shiftA A(qa, clock, d);
    shiftB B(qb, clock, d);
    always
        #10 clock = ~clock;
    always
        #20 d = ~d;
    initial
    begin
        #0; d=0; clock=0;
        #200 $finish;
    end

endmodule
