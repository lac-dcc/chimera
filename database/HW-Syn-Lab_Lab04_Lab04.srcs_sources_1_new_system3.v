`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 09:33:34 AM
// Design Name: 
// Module Name: system2
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


module system3(
output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk,
    input [15:0]sw,
    input btnU, btnL, btnD, btnR
    );
    
reg [3:0] num0;
reg [3:0] num1;
reg [3:0] num2;
reg [3:0] num3;

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


reg [11:0] rom [2**10-1:0];
initial $readmemb("rom2.data", rom);
reg [1:0] mode;


always@(posedge targetClk && (btnU || btnL || btnD || btnR))
begin
    case({btnU, btnL, btnD, btnR})
        4'b1000: mode = 0;
        4'b0100: mode = 1;
        4'b0010: mode = 2;
        4'b0001: mode = 3;
    endcase
    {num2, num1, num0} = rom[{sw[7:0], mode}];
end
endmodule
