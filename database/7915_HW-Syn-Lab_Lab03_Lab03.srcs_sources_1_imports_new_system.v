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
    input btnC
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

clockDiv fdivTarget(targetClk, tclk[10]);

quadSevenSeg q7Seg(seg, dp, an0, an1, an2, an3, num0, num1, num2, num3, targetClk);


singlePulser spu0(up0, sw[1], targetClk);
singlePulser spu1(up1, sw[3], targetClk);
singlePulser spu2(up2, sw[5], targetClk);
singlePulser spu3(up3, sw[7], targetClk);
singlePulser spd0(down0, sw[0], targetClk);
singlePulser spd1(down1, sw[2], targetClk);
singlePulser spd2(down2, sw[4], targetClk);
singlePulser spd3(down3, sw[6], targetClk);

wire c0, c1, c2, c3;
wire b0, b1, b2, b3;

bcd bcd0(num0, c0, b0, up0, down0, btnU|c3, btnC|b3, targetClk);
bcd bcd1(num1, c1, b1, up1|c0, down1|b0, btnU|c3, btnC|b3, targetClk);
bcd bcd2(num2, c2, b2, up2|c1, down2|b1, btnU|c3, btnC|b3, targetClk);
bcd bcd3(num3, c3, b3, up3|c2, down3|b2, btnU|c3, btnC|b3, targetClk);

endmodule
