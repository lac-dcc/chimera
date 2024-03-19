`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2020 06:57:46 PM
// Design Name: 
// Module Name: teater
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


module teater();
    
    reg clock, nreset, d;
    
    DFlipFlop D1(q,clock,nreset,d);
    
    always
    #10 clock=~clock;
    initial
    begin
    //$dumpfile("testDFlipFlop.dump");
    //$dumpvars(1,D1);
    #0 d=0;
    clock=0;
    nreset=0;
    #50 nreset=1;
    #1000 $finish;
    end
    always
    #8 d=~d;
endmodule
