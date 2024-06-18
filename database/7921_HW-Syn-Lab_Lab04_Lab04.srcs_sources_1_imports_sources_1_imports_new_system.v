// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2020 11:50:42 PM
// Design Name: 
// Module Name: system
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


module system(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk,
    input [15:0]sw,
    input btnU,
    input btnC,
    input btnD
    );
    
wire [3:0] num0;
wire [3:0] num1;
wire [3:0] num2;
wire [3:0] num3;

wire targetClk;
wire an0, an1, an2, an3;

assign an = {an3, an2, an1, an0};

wire [18:0] tclk;

assign tclk[0] = clk;

genvar c;

generate for(c = 0; c < 18; c = c + 1)
    begin
        clockDiv fdiv(tclk[c+1], tclk[c]);
    end
endgenerate

clockDiv fdivTarget(targetClk, tclk[18]);

quadSevenSeg q7Seg(seg, dp, an0, an1, an2, an3, num0, num1, num2, num3, targetClk);


wire push, pop, reset;
singlePulser spu(push, btnU, targetClk);
singlePulser spc(pop, btnC, targetClk);
singlePulser spr(reset, btnD, targetClk);

ram stack(sw, {num1,num0}, pop, targetClk, push, reset, {num3,num2});


endmodule
