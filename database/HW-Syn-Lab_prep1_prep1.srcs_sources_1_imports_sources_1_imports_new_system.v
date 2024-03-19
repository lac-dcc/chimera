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
    input btnD,
    input btnL
    );
    
//wire [3:0] num0;
//wire [3:0] num1;
//wire [3:0] num2;
//wire [3:0] num3;

reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;

wire targetClk;
wire an0, an1, an2, an3;

assign an = {an3, an2, an1, an0};

wire [25:0] tclk;

assign tclk[0] = clk;

genvar c;

generate for(c = 0; c < 25; c = c + 1)
    begin
        clockDiv fdiv(tclk[c+1], tclk[c]);
    end
endgenerate

clockDiv fdivTarget(targetClk, tclk[10]);

quadSevenSeg q7Seg(seg, dp, an0, an1, an2, an3, num0, num1, num2, num3, targetClk);


//singlePulser spu0(up0, sw[1], targetClk);
//singlePulser spu1(up1, sw[3], targetClk);
//singlePulser spu2(up2, sw[5], targetClk);
//singlePulser spu3(up3, sw[7], targetClk);
//singlePulser spd0(down0, sw[0], targetClk);
//singlePulser spd1(down1, sw[2], targetClk);
//singlePulser spd2(down2, sw[4], targetClk);
//singlePulser spd3(down3, sw[6], targetClk);

wire c0, c1, c2, c3;
wire b0, b1, b2, b3;


// *********** DECIMAL COUNTER **************
//bcd bcd0(num0, c0, b0, up0, down0, btnU|c3, btnC|b3, targetClk);
//bcd bcd1(num1, c1, b1, up1|c0, down1|b0, btnU|c3, btnC|b3, targetClk);
//bcd bcd2(num2, c2, b2, up2|c1, down2|b1, btnU|c3, btnC|b3, targetClk);
//bcd bcd3(num3, c3, b3, up3|c2, down3|b2, btnU|c3, btnC|b3, targetClk);


// *********** BINARY COUNTER ****************
//binaryCounter bc0(num0, c0, b0, up0, down0, btnU|c3, btnC|b3, targetClk);
//binaryCounter bc1(num1, c1, b1, up1|c0, down1|b0, btnU|c3, btnC|b3, targetClk);
//binaryCounter bc2(num2, c2, b2, up2|c1, down2|b1, btnU|c3, btnC|b3, targetClk);
//binaryCounter bc3(num3, c3, b3, up3|c2, down3|b2, btnU|c3, btnC|b3, targetClk);


// *********** UNARY COUNTER ****************
//unaryCounter uc0(num0, c0, b0, up0, down0, num1, btnU, btnC, targetClk);
//unaryCounter uc1(num1, c1, b1, c0, b0, num2, btnU, btnC, targetClk);
//unaryCounter uc2(num2, c2, b2, c1, b1, num3, btnU, btnC, targetClk);
//unaryCounter uc3(num3, c3, b3, c2, b2, 4'b0000, btnU, btnC, targetClk);


// *********** STATE MACHINE ****************
//singlePulser bU(uu, btnU, targetClk);
//singlePulser bC(cc, btnC, targetClk);
//singlePulser bD(dd, btnD, targetClk);
//singlePulser spu0(mode, sw[0], targetClk);

reg [2:0] state;
//reg mode;

always@(posedge tclk[24])
begin
    if (btnL) state = 7;
    else state = state + 1;
    
    if (state == 6) state = 0;
        
    case(state)
        3'b000: begin num3=0; num2=0; num1=0; num0=0; end
        3'b001: begin num3=1; num2=1; num1=1; num0=1; end
        3'b010: begin num3=2; num2=2; num1=2; num0=2; end
        3'b011: begin num3=3; num2=3; num1=3; num0=3; end
        3'b100: begin num3=4; num2=4; num1=4; num0=4; end
        3'b101: begin num3=5; num2=5; num1=5; num0=5; end
//        3'b110: begin num3=0; num2=12; num1=0; num0=0; end
        3'b111: begin num3=15; num2=15; num1=15; num0=15; end
    endcase
end

endmodule
