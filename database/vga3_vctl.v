// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// Video Controller - read address generator

module vctl #(
    parameter XWIDTH = 10,
    parameter YWIDTH = 10,
    parameter AWIDTH = 16,
    parameter XMAX = 799,
    parameter YMAX = 524,
    parameter HDMIN = 3,
    parameter HDMAX = 643,
    parameter VDMIN = 524,
    parameter VDMAX = 479
) (
    input wire PixelClk,
    output reg[XWIDTH-1:0] PixelCnt,
    output reg[YWIDTH-1:0] LineCnt,
    output reg[AWIDTH-1:0] AddrOut,
    output reg AddrClkOut,
    output reg IsActHorz,
    output reg IsActVert
);

initial PixelCnt <= 1'b0;
initial LineCnt <= 1'b0;
initial AddrOut <= 1'b0;
initial IsActHorz <= 1'b0;
initial IsActVert <= 1'b0;

always @(posedge PixelClk) begin
    if (PixelCnt == XMAX) begin
        PixelCnt <= 1'b0; 
        if (LineCnt == YMAX) LineCnt <= 1'b0;
        else LineCnt <= LineCnt + 1'b1;
    end else PixelCnt <= PixelCnt + 1'b1;
     
    if (PixelCnt == HDMAX) IsActHorz <= 1'b0;
    if (PixelCnt == HDMIN) IsActHorz <= 1'b1;
     
    if (LineCnt == VDMAX) IsActVert <= 1'b0;
    if (LineCnt == VDMIN) IsActVert <= 1'b1;

    if (PixelCnt[1] && !PixelCnt[0]) begin
        AddrClkOut <= 1'b1;
        if (PixelCnt == XMAX && LineCnt == YMAX) AddrOut <= 1'b0;
        else AddrOut <= AddrOut + 2'b11;
    end else AddrClkOut <= 1'b0;
end

endmodule
